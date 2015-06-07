


## Import data from AWS S3
library("devtools")
install_github("armstrtw/AWS.tools")

Sys.setenv("AWS_ACCESS_KEY_ID"="AKIAIBV6FWT32RXGLZ3A")
Sys.setenv("AWS_SECRET_ACCESS_KEY"="H8nhNsvuAlw5UkZ4YYcDReoGsTJh1HXvqIqdRGV")


Sys.setenv("AWSACCESSKEY"=Sys.getenv("AWS_ACCESS_KEY_ID"))
Sys.setenv("AWSSECRETKEY"=Sys.getenv("AWS_SECRET_ACCESS_KEY"))


library("AWS.tools")
?s3.get
s3.get("s3://kagglefbfiles/test.txt", bucket.location="US", verbose=TRUE,
       access.key=Sys.getenv("AWSACCESSKEY"), secret.key=Sys.getenv("AWSSECRETKEY"))

