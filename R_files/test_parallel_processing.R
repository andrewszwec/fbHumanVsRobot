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

library(randomForest)
data(iris)

cores <- 4
cl <- makeCluster(cores, type = "SOCK")
registerDoSNOW(cl)

## main code, portable
total.tree <- 2000  # B
num.chunk <- 2
avg.tree <- ceiling(total.tree/num.chunk)

## foreach statement ntree: iterator .combine: speicify the way to collect
## results .packages: load the packages for workers

rf_fit <- foreach(ntree = rep(avg.tree, num.chunk), .combine = combine, 
                  .packages = c("randomForest")) %dopar% {
                          randomForest(x = iris[, -5], y = iris[, 5], ntree = ntree, importance=TRUE)
                  }
varImp(rf_fit)




cores <- 4
cl <- makeCluster(cores, type = "SOCK")
registerDoSNOW(cl)


total.tree <- 2000
num.chunk <- 4
avg.tree <- ceiling(total.tree/num.chunk)

system.time({
        rf_fit <- foreach(ntree = rep(avg.tree, num.chunk), .combine = combine, 
                          .packages = c("randomForest")) %dopar% {
                                  randomForest(x = iris[, -5], y = iris[, 5], ntree = ntree)
                          }
})


stopCluster(cl)






