##
##      Loaded into sense.io
##
##      2015-06-03
##      Note: This is working R code on Sense and has been used to create the model files 
##      1. mod_rf_fit_002.RData
##      2. mod_rf_fit_004.RData
##      
##      These models are working models that take a random sample of 150K and 180K respectively, 
##      then use the data to train a random forest.
##
##      The next step is to use this code to become one of a number of worker nodes each running 
##      on a subset of the data.
##
##      This code is setup to run on a 32 core machine. To alter this set the 'core' variable to 16 etc...

library("sense")
load("~/upload_to_sense/submission.Rdata")
training <- read.csv("DRV_BAR_TRAIN_20150505.csv", header=TRUE)
# training <- read.csv("~/upload_to_sense/DRV_BAR_TRAIN_20150505_Top_1000.csv", header=TRUE)
# test <- read.csv("~/upload_to_sense/DRV_BAR_TEST_20150505_Top_1000.csv", header=TRUE)
test <- read.csv("~/upload_to_sense/WRK_BAR_TEST_20150503.csv", header=TRUE)


## Import data from AWS S3
#library("devtools")
#install_github("armstrtw/AWS.tools")


Sys.setenv("AWSACCESSKEY"=Sys.getenv("AWS_ACCESS_KEY_ID"))
Sys.setenv("AWSSECRETKEY"=Sys.getenv("AWS_SECRET_ACCESS_KEY"))

library("AWS.tools")

s3.get("https://s3-ap-southeast-2.amazonaws.com/kagglefbfiles/DRV_BAR_TEST_20150505_subset_cols_2.zip")


#install.packages("randomForest")
require(randomForest)

#install.packages("caret")
require(caret)

# Take a subset of training
num_samples = 360000 #180000  # Training has 3,071,253 rows
training.tmp <- training[sample(1:nrow(training), num_samples, replace=FALSE),]


# Make outcome a factor for rf
training.tmp$outcome <- as.factor(training.tmp$outcome) 


### START ANALYSIS ON TRAINING SET

## Remove non predicitve variables
training.tmp <- subset(training.tmp, select=c(-bidder_id, -payment_account,-Random_Num, -bid_id  ))

# What variables are useful
#df_nzv <- nearZeroVar(training.tmp, saveMetrics=TRUE)

## Remove Near Zero Values
training.tmp <- subset(training.tmp, select=c(-num_distinct_merch_types
                                              ,-num_distinct_bids_per_auction_min 
                                              ,-num_distinct_auctions_gt_avg
                                              # added after error "Can not handle categorical predictors with more than 53 categories."
                                              ,-url
                                              ,-ip
                                              ,-country
                                              ,-address
                                              ,-device
                                              ,-merchandise
                                              ,-auction
                                              ,-time)
)

### Remove NAs
training.tmp <- na.omit( training.tmp )

#rm(training)

#
#       RANDOM FOREST CLASSIFICATION
#


# install.packages('foreach'); install.packages('doSNOW')
library(foreach)
library(doSNOW)
library(caret)

cores <- 32
cl <- makeCluster(cores, type = "SOCK",outfile="")
registerDoSNOW(cl)


total.tree <- 2000
num.chunk <- cores
avg.tree <- ceiling(total.tree/num.chunk)

# If possible it would be best to do bagging or boosting to the data before 
# sending it to the random forest code.
# Bagging is bootstrape aggregating which takes the data and splits it
# So you can train many weak classifiers and then take their average.

system.time({
        rf_fit <- foreach(ntree = rep(avg.tree, num.chunk), .combine = combine, 
                          .packages = c("randomForest")) %dopar% {
                                  randomForest(training.tmp[1:length(training.tmp)-1], training.tmp$outcome, ntree = ntree)
                          }
})

stopCluster(cl)

save(rf_fit, file = "~/upload_to_sense/mod_rf_360k_006.RData")




## Book keeping

# Score validation set
pred_sub <- predict(rf_fit, newdata=test)

# Make submission data frame
submit_file <- data.frame(test$bidder_id,pred_sub )

# save submission Rdata dile
#save(submit_file, file="~/upload_to_sense/submit_file.Rdata")

# write subimssion out as csv
write.csv(submit_file, file="~/upload_to_sense/submit_file_006.csv", col.names=TRUE, row.names = FALSE)



# Graveyard
# fine names in training but not in test
# n1<-names(training.tmp)
# n2=names(test)
# n1[!(n1 %in% n2)]