##
##      For sense.io
##
##


load("submission.Rdata")
unzip("DRV_BAR_TRAIN_20150505.zip")
training <- read.csv("DRV_BAR_TRAIN_20150505.csv", header=TRUE)

# Make outcome a factor
training$outcome <- as.factor(training$outcome) 

install.packages("caret")
require(caret)

#
#       RANDOM FOREST CLASSIFICATION
#
mod_rf_box <- train(outcome~ . 
                    ,method='rf'
                    ,preProcess=c("BoxCox", "bagImpute") 
                    ,data = training
)
save(mod_rf_box, file = "mod_rf_box_001.RData")

# Score validation set
pred_sub <- predict(mod_rf_box, newdata=submission)

submit_file <- data.frame(submission$bidder_id,pred_sub )

save(submit_file, file="submit_file.Rdata")

write.csv(submit_file, file="submit_file.csv", col.names=TRUE)