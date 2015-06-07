##
##      This is code to manually score the data at a bid id level (lowest level)
##      At this point a model of 360K records randomly sampled has been created.
##
##
##
##
##
##
##



save(rf_fit, file = "~/upload_to_sense/mod_rf_360k_006.RData")




## Book keeping

# Score validation set
pred_sub <- predict(rf_fit, newdata=test)

# Make submission data frame
submit_file <- data.frame(test$bidder_id,pred_sub )

# save submission Rdata dile
#save(submit_file, file="~/upload_to_sense/submit_file.Rdata")

# write subimssion out as csv
write.csv(submit_file, file="~/upload_to_sense/submit_file_006.csv", col.names=TRUE, row.names = FALSE)
