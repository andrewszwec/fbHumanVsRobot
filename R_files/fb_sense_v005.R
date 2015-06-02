##
##      Loaded into sense.io
##      Last updated: 2015-05-26
##

library("sense")

# Uncomment for Sense.io
# load("~/upload_to_sense/submission.Rdata")

# Uncomment for laptop
load("C:/Users/aszwec/Documents/kaggle/fbHumanVsRobot/Rdata/submission.Rdata")

# training <- read.csv("DRV_BAR_TRAIN_20150505.csv", header=TRUE)

# Uncomment for sense.io
# training <- read.csv("~/upload_to_sense/DRV_BAR_TRAIN_20150505_Top_1000.csv", header=TRUE)

# Uncomment for laptop
training <- read.csv("C:/Users/aszwec/Documents/kaggle/fbHumanVsRobot/data_csv/DRV_BAR_TRAIN_20150505_Top_1000.csv", header=TRUE)


# test <- read.csv("~/upload_to_sense/DRV_BAR_TEST_20150505_Top_1000.csv", header=TRUE)

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
#df_nzv <- nearZeroVar(training, saveMetrics=TRUE)

## Remove Near Zero Values
training <- subset(training, select=c(-num_distinct_merch_types
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


### PREPARE THE DATA

#summary(training)
# yy <- subset(training, select=outcome)
# xx <- subset(training, select=-outcome)

### Remove NAs
training <- na.omit( training )



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



cores <- 4 # 16 
cl <- makeCluster(cores, type = "SOCK")
registerDoSNOW(cl)


total.tree <- 2000
num.chunk <- cores
avg.tree <- ceiling(total.tree/num.chunk)


rf_fit <- foreach(ntree = rep(avg.tree, num.chunk), .combine = combine, 
                  .packages = c("randomForest")) %dopar% {
                          randomForest(training[1:13], training$outcome, ntree = ntree)
                  }
stopCluster(cl)

save(rf_fit, file = "~/upload_to_sense/mod_rf_fit_002.RData")

print(rf_fit)


## Book keeping

# Score validation set
#pred_sub <- predict(rf_fit, newdata=test)

# Make submission data frame
#submit_file <- data.frame(test$bidder_id,pred_sub )

# save submission Rdata dile
#save(submit_file, file="~/upload_to_sense/submit_file.Rdata")

# write subimssion out as csv
#write.csv(submit_file, file="~/upload_to_sense/submit_file.csv", col.names=TRUE, row.names = FALSE)



