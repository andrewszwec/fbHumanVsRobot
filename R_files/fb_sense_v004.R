##
##      Loaded into sense.io
##
##

# uncomment for sense
library("sense")
load("~/upload_to_sense/submission.Rdata")

#training <- read.csv("DRV_BAR_TRAIN_20150505.csv", header=TRUE)
training <- read.csv("~/upload_to_sense/DRV_BAR_TRAIN_20150505_Top_1000.csv", header=TRUE)

#install.packages("randomForest")
require(randomForest)

#install.packages("caret")
require(caret)

# Make outcome a factor for rf
training$outcome <- as.factor(training$outcome) 


### START ANALYSIS ON TRAINING SET

## Remove non predicitve variables
training <- subset(training, select=c(-bidder_id, -payment_account,-Random_Num, -bid_id  ))

# What variables are useful
df_nzv <- nearZeroVar(training, saveMetrics=TRUE)

## Remove Near Zero Values
training <- subset(training, select=c(-num_distinct_merch_types
                                      ,-num_distinct_bids_per_auction_min 
                                      ,-num_distinct_auctions_gt_avg
                                      # added after error "Can not handle categorical predictors with more than 53 categories."
                                      ,-url
                                      ,-ip
                                      ,-country)
)


### PREPARE THE DATA

#summary(training)
# yy <- subset(training, select=outcome)
# xx <- subset(training, select=-outcome)

## < 53 groups for rf 
device
merchandise
auction
address


#
#       RANDOM FOREST CLASSIFICATION
#


# install.packages('foreach'); install.packages('doSNOW')
library(foreach)
library(doSNOW)
library(caret)

cl <- makeCluster(2, type = "SOCK")
registerDoSNOW(cl)

getDoParName()

getDoParVersion()

getDoParWorkers()

stopCluster(cl)



cores <- 4
cl <- makeCluster(cores, type = "SOCK")
registerDoSNOW(cl)


total.tree <- 2000
num.chunk <- 4
avg.tree <- ceiling(total.tree/num.chunk)


rf_fit <- foreach(ntree = rep(avg.tree, num.chunk), .combine = combine, 
                  .packages = c("randomForest")) %dopar% {
                          randomForest(training[1:20], training$outcome, ntree = ntree)
                  }



stopCluster(cl)

save(rf_fit, file = "~/upload_to_sense/mod_rf_fit_001.RData")







## Book keeping

# Score validation set
pred_sub <- predict(rf_fit, newdata=submission)

submit_file <- data.frame(submission$bidder_id,pred_sub )

save(submit_file, file="~/upload_to_sense/submit_file.Rdata")

write.csv(submit_file, file="~/upload_to_sense/submit_file.csv", col.names=TRUE)



