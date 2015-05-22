##
##      Loaded into sense.io
##
##

library("sense")
load("~/upload_to_sense/submission.Rdata")
training <- read.csv("DRV_BAR_TRAIN_20150505.csv", header=TRUE)

# Make outcome a factor
training$outcome <- as.factor(training$outcome) 

# Split data into x and y
yy <- subset(training, select = outcome)
xx <- subset(training, select = -outcome)

sub_yy <- subset(submission, select = outcome)
sub_xx <- subset(submission, select = -outcome)

#install.packages("caret")
require(caret)

#install.packages("doMC")
#library(doMC)
#registerDoMC(cores = 8) 

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

system.time({
        rf_fit <- foreach(ntree = rep(avg.tree, num.chunk), .combine = combine, 
                          .packages = c("randomForest")) %dopar% {
                                  randomForest(x = xx, y = yy, ntree = ntree)
                          }
})


stopCluster(cl)



save(rf_fit, file = "~/upload_to_sense/mod_rf_fit_001.RData")

# Score validation set
pred_sub <- predict(rf_fit, x=sub_xx, y=sub_yy)

submit_file <- data.frame(submission$bidder_id,pred_sub )

save(submit_file, file="~/upload_to_sense/submit_file.Rdata")

write.csv(submit_file, file="~/upload_to_sense/submit_file.csv", col.names=TRUE)




