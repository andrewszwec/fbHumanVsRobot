## Load Data
setwd("~/kaggle/fbHumanVsRobot")

## Partition Data
library(caret)
set.seed(55886)

# Get data from SQL
library(RODBC)
server.name <- "AUSYD5348"
database.name <- "DT_LUXOTTICA_INSIGHTS_2014"
myconn <- odbcDriverConnect(paste("DRIVER=SQL Server; Trusted_Connection=Yes; DATABASE=", database.name, "; SERVER=", server.name, sep=""))

training <- sqlQuery(myconn, "select * from dbo.WRK_BAR_TRAIN_20150503_Train_60pc")
validation <- sqlQuery(myconn, "select * from dbo.WRK_BAR_TRAIN_20150503_Validation_20pc")
testing <- sqlQuery(myconn, "select * from dbo.WRK_BAR_TRAIN_20150503_Test_20pc")

close(myconn)

# Data is loaded correctly, CHECK!



### START ANALYSIS ON TRAINING SET

# What variables are useful
df_nzv <- nearZeroVar(training, saveMetrics=TRUE)

# get useful columns
# remove NAs
train <- na.omit( training[ c("outcome"
                ,"num_distinct_auctions"           
                ,"normalised_num_distinct_auctions" 
                ,"num_distinct_auctions_less_avg"   
                ,"num_distinct_auctions_sqd"        
                ,"num_distinct_auctions_gt_avg"     
                ,"num_distinct_referrer_url_max"    
                ,"num_distinct_referrer_url_avg"    
                ,"num_distinct_bids_per_auction_max"
                ,"num_distinct_bids_per_auction_avg"
                ,"num_distinct_countries"           
                ,"num_distinct_ip"                  
                ,"multiple_bids_at_same_moment")  ] )


val <- na.omit( validation[ c("outcome"
                     ,"num_distinct_auctions"           
                     ,"normalised_num_distinct_auctions" 
                     ,"num_distinct_auctions_less_avg"   
                     ,"num_distinct_auctions_sqd"        
                     ,"num_distinct_auctions_gt_avg"     
                     ,"num_distinct_referrer_url_max"    
                     ,"num_distinct_referrer_url_avg"    
                     ,"num_distinct_bids_per_auction_max"
                     ,"num_distinct_bids_per_auction_avg"
                     ,"num_distinct_countries"           
                     ,"num_distinct_ip"                  
                     ,"multiple_bids_at_same_moment")  ] )


test <- na.omit( testing[ c("outcome"
                     ,"num_distinct_auctions"           
                     ,"normalised_num_distinct_auctions" 
                     ,"num_distinct_auctions_less_avg"   
                     ,"num_distinct_auctions_sqd"        
                     ,"num_distinct_auctions_gt_avg"     
                     ,"num_distinct_referrer_url_max"    
                     ,"num_distinct_referrer_url_avg"    
                     ,"num_distinct_bids_per_auction_max"
                     ,"num_distinct_bids_per_auction_avg"
                     ,"num_distinct_countries"           
                     ,"num_distinct_ip"                  
                     ,"multiple_bids_at_same_moment")  ] )


################################################################
# Build Regression Models
################################################################


#
#       RANDOM FOREST
#
mod_rf <- train(outcome~ . 
                ,method='rf'
                ,data = train
)
save(mod_rf, file = "mod_rf_001.RData")

# Score validation set
pred_rf <- predict(mod_rf, newdata=val)


#
#       GRADIENT BOOSTING MACHINE
#
mod_gbm <- train(outcome~ . 
                 ,method='gbm'
                 ,data = train
)
save(mod_gbm, file = "mod_gbm_001.RData")

# score validation set
pred_gbm <- predict(mod_gbm, newdata=val)

#
#       RECURSIVE PARTITIONING AND REGRESSION TREES 
#
mod_rpart <- train(outcome~ . 
                 ,method='rpart'
                 ,data = train
)
save(mod_rpart, file = "mod_rpart_001.RData")

# score validation set
pred_rpart <- predict(mod_rpart, newdata=val)



#
#       MODEL AVERAGED NEURAL NETWORK
#
mod_avNNet <- train(outcome~ . 
                   ,method='avNNet'
                   ,data = train
)
save(mod_avNNet, file = "mod_avNNet_001.RData")

# score validation set
pred_avNNet <- predict(mod_avNNet, newdata=val)



#
#       Bayesian Regularized Neural Networks
#
mod_brnn <- train(outcome~ . 
                    ,method='brnn'
                    ,data = train
)
save(mod_brnn, file = "mod_brnn_001.RData")

# score validation set
pred_brnn <- predict(mod_brnn, newdata=val)







################################################################
# Build Classification Models
################################################################

# Make outcome a factor
train$outcome <- as.factor(train$outcome) 
val$outcome <-  as.factor(val$outcome) 
test$outcome <-  as.factor(test$outcome) 


#
#       RANDOM FOREST CLASSIFICATION
#
mod_rf_cl <- train(outcome~ . 
                ,method='rf'
                ,data = train
)
save(mod_rf_cl, file = "mod_rf_cl_001.RData")

# Score validation set
pred_rf_cl <- predict(mod_rf_cl, newdata=val)

confusionMatrix(pred_rf_cl, val$outcome )


#
#       LINEAR DISCRIMINANT ANALYSIS
#
# Linear Discriminant Analysis (fast speed)
mod_lda <- train(outcome~ . 
                 ,method='lda'
                 ,allowParallel=TRUE
                 ,preProcess=c("pca")
                 ,data = train
)
save(mod_lda, file = "mod_lda_001.RData")

# Score validation set
pred_lda <- predict(mod_lda, newdata=val)

# check model performance
confusionMatrix(pred_lda, val$outcome) # lda got no positives correct


#
#       BOOSTED CLASSIFICATION TREES
#
mod_ada <- train(outcome~ . 
                 ,method='ada'
                 ,data = train
)
save(mod_ada, file = "mod_ada_001.RData")

# score validation set
pred_ada <- predict(mod_ada, newdata=val)
confusionMatrix(pred_ada, val$outcome) # lda got no positives correct



#
#       BAGGED ADABOOST
#

mod_ada <- train(outcome~ . 
                 ,method='AdaBag'
                 ,data = train
)
save(mod_adabag, file = "mod_adabag_001.RData")

# score validation set
pred_adabag <- predict(mod_adabag, newdata=val)
confusionMatrix(pred_adabag, val$outcome) # lda got no positives correct


#
#       NAIVE BAYES
#
mod_nb <- train(outcome~ . 
                ,method='nb'
                ,data = train
)
save(mod_nb, file = "mod_nb_001.RData")

# score validation set
pred_nb <- predict(mod_nb, newdata=val)
confusionMatrix(pred_nb, val$outcome) # lda got no positives correct




#
#       ENSEMBLE - using classification  models
#
### !!! NOT SO GOOD !!!
## Build Ensemble
ensemble <- data.frame(pred_rf, pred_gbm, pred_rpart , pred_avNNet , pred_brnn, outcome=val$outcome)
# gam built a poor predictor. Trying rf
mod_gam <- train(outcome~ . 
                 ,method='rf'
                 ,data = ensemble
)
save(mod_gam, file = "mod_gam_001.RData")
pred_gam <- predict(mod_gam, newdata=test)
confusionMatrix(pred_gam, test$outcome)

#
#       ENSEMBLE - using classification  models 002
#

## Build Ensemble
ensemble <- data.frame(pred_rf_cl, pred_lda, pred_ada, pred_adabag, pred_nb, outcome=val$outcome)

# logisitc regression 
mod_lr <- train(outcome~ . 
                 ,method='LogitBoost'
                 ,data = ensemble
)
save(mod_lr, file = "mod_lr_001.RData")

pred_lr <- predict(mod_lr, newdata=test)

confusionMatrix(pred_lr, test$outcome)

# get submission set
server.name <- "AUSYD5348"
database.name <- "DT_LUXOTTICA_INSIGHTS_2014"
myconn <- odbcDriverConnect(paste("DRIVER=SQL Server; Trusted_Connection=Yes; DATABASE=", database.name, "; SERVER=", server.name, sep=""))
submission <- sqlQuery(myconn, "select * from dbo.WRK_BAR_TEST_20150503")
close(myconn)

save(submission, file="submission.Rdata")

submit <-  submission[ c("num_distinct_auctions"           
                                 ,"normalised_num_distinct_auctions" 
                                 ,"num_distinct_auctions_less_avg"   
                                 ,"num_distinct_auctions_sqd"        
                                 ,"num_distinct_auctions_gt_avg"     
                                 ,"num_distinct_referrer_url_max"    
                                 ,"num_distinct_referrer_url_avg"    
                                 ,"num_distinct_bids_per_auction_max"
                                 ,"num_distinct_bids_per_auction_avg"
                                 ,"num_distinct_countries"           
                                 ,"num_distinct_ip"                  
                                 ,"multiple_bids_at_same_moment")  ]



# make prediction on submission set
pred_sub<- predict(mod_lr, newdata=submission)
?predict

data.frame(submission$bidder_id,pred_sub )





# get submission set
server.name <- "AUSYD5348"
database.name <- "DT_LUXOTTICA_INSIGHTS_2014"
myconn <- odbcDriverConnect(paste("DRIVER=SQL Server; Trusted_Connection=Yes; DATABASE=", database.name, "; SERVER=", server.name, sep=""))
big_training <- sqlQuery(myconn, "select * from dbo.WRK_BAR_TRAIN_20150503")
close(myconn)





















#
#       ENSEMBLE - using regression models
#

# Make outcome a factor
val$outcome <-  as.factor(val$outcome) 
test$outcome <-  as.factor(test$outcome) 

## Build Ensemble
ensemble <- data.frame(pred_rf, pred_gbm, pred_rpart , pred_avNNet , pred_brnn, outcome=val$outcome)

# gam built a poor predictor. Trying rf
mod_gam <- train(outcome~ . 
                ,method='rf'
                ,data = ensemble
)
save(mod_gam, file = "mod_gam_001.RData")

pred_gam <- predict(mod_gam, newdata=test)

confusionMatrix(pred_gam, test$outcome)

data.frame(pred_gam, outcome=test$outcome)

### Confusion matrix for ensemble
# Confusion Matrix and Statistics
# 
#            Reference
# Prediction   0   1
#          0   6   1
#          1 372  18
# 
# Accuracy : 0.0605          
# 95% CI : (0.0391, 0.0886)
# No Information Rate : 0.9521          
# P-Value [Acc > NIR] : 1               
# 
# Kappa : -0.0036         
# Mcnemar's Test P-Value : <2e-16          
#                                           
#             Sensitivity : 0.01587         
#             Specificity : 0.94737         
#          Pos Pred Value : 0.85714         
#          Neg Pred Value : 0.04615         
#              Prevalence : 0.95214         
#          Detection Rate : 0.01511         
#    Detection Prevalence : 0.01763         
#       Balanced Accuracy : 0.48162         
#                                           
#        'Positive' Class : 0  

## No ensemble - Classification Random forest
# Confusion Matrix and Statistics
# 
#            Reference
# Prediction   0   1
#           0 370  19
#           1   3   5
# 
# Accuracy : 0.9446          
# 95% CI : (0.9173, 0.9649)
# No Information Rate : 0.9395          
# P-Value [Acc > NIR] : 0.386810        
# 
# Kappa : 0.2911          
# Mcnemar's Test P-Value : 0.001384        
# 
# Sensitivity : 0.9920          
# Specificity : 0.2083          
# Pos Pred Value : 0.9512          
# Neg Pred Value : 0.6250          
# Prevalence : 0.9395          
# Detection Rate : 0.9320          
# Detection Prevalence : 0.9798          
# Balanced Accuracy : 0.6001          
# 
# 'Positive' Class : 0   

