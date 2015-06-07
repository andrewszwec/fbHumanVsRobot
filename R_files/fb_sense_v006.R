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
##      Next steps are to remove time from the training set and retrain
##
##
##


library("sense")
load("~/upload_to_sense/submission.Rdata")
training <- read.csv("DRV_BAR_TRAIN_20150505.csv", header=TRUE)
# training <- read.csv("~/upload_to_sense/DRV_BAR_TRAIN_20150505_Top_1000.csv", header=TRUE)
test <- read.csv("~/upload_to_sense/DRV_BAR_TEST_20150505_Top_1000.csv", header=TRUE)

#install.packages("randomForest")
require(randomForest)

#install.packages("caret")
require(caret)

# Take a subset of training
num_samples = 200000  # Training has 3,071,253 rows
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
                                              ,-auction)
)

### Remove NAs
training.tmp <- na.omit( training.tmp )



#
#       RANDOM FOREST CLASSIFICATION
#


# install.packages('foreach'); install.packages('doSNOW')
library(foreach)
library(doSNOW)
library(caret)

cores <- 16
cl <- makeCluster(cores, type = "SOCK",outfile="")
registerDoSNOW(cl)


total.tree <- 2000
num.chunk <- cores
avg.tree <- ceiling(total.tree/num.chunk)

system.time({
        rf_fit <- foreach(ntree = rep(avg.tree, num.chunk), .combine = combine, 
                          .packages = c("randomForest")) %dopar% {
                                  randomForest(training.tmp[1:13], training.tmp$outcome, ntree = ntree)
                          }
})

stopCluster(cl)

save(rf_fit, file = "~/upload_to_sense/mod_rf_fit_005.RData")




## Book keeping

# Score validation set
pred_sub <- predict(rf_fit, newdata=test)

# Make submission data frame
submit_file <- data.frame(test$bidder_id,pred_sub )

# save submission Rdata dile
#save(submit_file, file="~/upload_to_sense/submit_file.Rdata")

# write subimssion out as csv
write.csv(submit_file, file="~/upload_to_sense/submit_file_003.csv", col.names=TRUE, row.names = FALSE)



