## Load Data
setwd("~/Documents/kaggle/fbHumanVsRobot")

# train_full <- read.csv("train.csv", header=TRUE)
# test <- read.csv("test.csv", header=TRUE)
# bids <- read.csv("bids.csv", header=TRUE)

# data prep done in sql server
# this included joining bids and bidder data 
train_full <- read.csv("training_input_to_R.csv", header=TRUE)

## Partition Data
library(caret)
set.seed(55886)

# Create a building data set and validation set
inBuild <- createDataPartition(train_full$outcome, p=0.7, list=FALSE)
validation <- train_full[-inBuild,]; 
buildData <- train_full[inBuild,]

inTrain <- createDataPartition(buildData$outcome, p=0.7, list=FALSE)
training <- buildData[inTrain,]; 
testing <- buildData[-inTrain,]

# Check all rows are accounted for
nrow(validation) + nrow(training) + nrow(testing)
nrow(train_full)
# YES!

save(validation, file="validation.Rdata")
save(testing, file="testing.Rdata")
save(training, file="training.Rdata")

## Inspect data
require(plyr)
count(training, vars="outcome")

names(training)
head(training)

rand_train_sample <- training[sample(1:nrow(training), 100000, replace=FALSE),] 

## Create derived attributes




# What variables are useful
df_nzv <- nearZeroVar(rand_train_sample, saveMetrics=TRUE)


mod_rf <- train(outcome~ . 
                     ,method='rf'
                     ,allowParallel=TRUE
                     ,preProcess=c("pca")
                     ,data = rand_train_sample
)
save(mod_rf, file = "mod_rf_001.RData")



















