##
##      Loaded into sense.io
##
##

library("sense")
load("~/upload_to_sense/submission.Rdata")
#unzip("~/upload_to_sense/DRV_BAR_TRAIN_20150505.zip")
training <- read.csv("DRV_BAR_TRAIN_20150505.csv", header=TRUE)

# Make outcome a factor
training$outcome <- as.factor(training$outcome) 

#install.packages("caret")
require(caret)

#install.packages("doMC")
library(doMC)
registerDoMC(cores = 8) 

library("sense")
launch.workers(2, size=3, code="print('Hello from worker!')")



# define training control (k-folds cross-validation)
train_control <- trainControl(method="oob", number=10)

#
#       RANDOM FOREST CLASSIFICATION
#
mod_rf_box <- train(outcome~ . 
                    ,method='rf'
                    ,data = training
                    ,trControl=train_control
                    ,allowParallel=TRUE
)
save(mod_rf_box, file = "~/upload_to_sense/mod_rf_box_001.RData")

# Score validation set
pred_sub <- predict(mod_rf_box, newdata=submission)

submit_file <- data.frame(submission$bidder_id,pred_sub )

save(submit_file, file="~/upload_to_sense/submit_file.Rdata")

write.csv(submit_file, file="~/upload_to_sense/submit_file.csv", col.names=TRUE)



## Graveyard
#mod_rf_box <- train(outcome~ . 
#                    ,method='rf'
#                    #,preProcess=c("BoxCox", "bagImpute") 
#                    ,data = training
#)
