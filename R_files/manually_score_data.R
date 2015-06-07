require(caret)
require(randomForest)


load("C:/Users/aszwec/Documents/kaggle/fbHumanVsRobot/Rdata/working_models/mod_rf_fit_004.RData")

test <- read.csv("C:/Users/aszwec/Documents/kaggle/fbHumanVsRobot/data_csv/WRK_BAR_TEST_20150503.csv")

test.tmp <- na.omit( test )


varImp(rf_fit)
Overall
num_distinct_auctions             2381.40185
normalised_num_distinct_auctions  2276.41931
num_distinct_auctions_less_avg    2486.15151
num_distinct_auctions_sqd         2485.09825
num_distinct_referrer_url_max     4968.69684
num_distinct_referrer_url_min       25.78358
num_distinct_referrer_url_avg     2918.42198
num_distinct_bids_per_auction_max 5919.42944
num_distinct_bids_per_auction_avg 2382.81268
num_distinct_countries            5214.63692
num_distinct_ip                   5984.23876
multiple_bids_at_same_moment      3575.67224
time                               868.95077

## Book keeping

# Score validation set
pred_sub <- predict(rf_fit, newdata=test.tmp)

# Make submission data frame
submit_file <- data.frame(test$bidder_id,pred_sub )

# save submission Rdata dile
#save(submit_file, file="~/upload_to_sense/submit_file.Rdata")

# write subimssion out as csv
write.csv(submit_file, file="~/upload_to_sense/submit_file_003.csv", col.names=TRUE, row.names = FALSE)
