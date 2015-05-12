#
#       From kaggle 
#
#
rf <- foreach(ntree="rep(250," 4),="" .combine="combine," .packages='randomForest' )="">
        randomForest(x, y, ntree=ntree ,
                     
                     
#
#       From vigenette 
#       How to parallellize with foreach and random forest
#
library(foreach)
foreach(i=1:3) %do% sqrt(i)   

rf <- foreach(ntree=rep(250, 4), .combine=combine, .packages='randomForest') %dopar%
        + randomForest(x, y, ntree=ntree)
rf


## When function: kind of like if statement
x <- foreach(a=irnorm(1, count=10), .combine='c') %:% when(a >= 0) %do% sqrt(a)

##
## Install som user's package called parallelRandomForest
##
library(devtools)
install_bitbucket("mkuhn/parallelRandomForest", ref="parallelRandomForest")
library(parallelRandomForest)
?randomForest

mod_prf <- randomForest(outcome~., data=train, importance=TRUE )
save(mod_prf, file = "mod_prf_001.RData")



## From stack exchange

rf <- foreach(ntree=rep(25000, 6), .combine=combine, .packages='randomForest') %dopar%
        randomForest(x, y, ntree=ntree)


rf <- foreach(ntree=rep(25000, 6), .combine=combine, .multicombine=TRUE,
              .packages='randomForest') %dopar% {
                      randomForest(x, y, ntree=ntree)
              }
