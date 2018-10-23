# External debt
# install.packages('tidyr', 'plm')
library(tidyr)
library(dplyr)
da <- read.csv('./Data/ForeignCurrencyDebt.csv', stringsAsFactors = FALSE)
head(da)
tail(da)
# get rid of spares rows at the end 
da <- da[1:296, ]
# Get rid of the strand signs in the data
da[, 1] <- gsub("+ACI-", "", da[,1], fixed = TRUE)
da[, 3] <- gsub("+ACI-", "", da[,3], fixed = TRUE) 
da[, 5] <- gsub("+AC0-", "", da[,5], fixed = TRUE) 
da[, 8] <- gsub("+ACI-", "", da[,8], fixed = TRUE) 
da[da[, 1] == "Korea",]

names(da)
# Past the series names into one column
#da$Series <- paste( da[, 3], da[,4], da[,5], da[, 6], da[,7], da[,8])
da$Series <- paste(da[,5], da[,7])
da$Series <- gsub("  ", " ", da$Series)
head(da)
da[250,]
# Now just sort the data and create new names. 
da <- da[, c(1, 2, 9, 17, 11, 12, 13, 14, 15)]
names(da) <- c('Country', 'C-Code', 'D-Code', 'Data', '2017Q1', '2017Q2', '2017Q3', '2017Q4', '2018Q1')
# One saeries (Q117) is a string rather than a numeric 
da[, "2017Q1"] <- as.integer(da[, "2017Q1"])
# remove Korea and Macedonia
da <- da[da[, 1] != "Korea", ]
da <- da[da[, 1] != "Macedonia", ]
head(da, n = 8)
tail(da)
str(da)
# reduce the size of the dataframe 
da1 <- da[1:288, c(1, 4, 5:9)]
tail(da1, 10)

##############This is to sort the data out:  gather and spread
dat <- gather(da1, key = 'Year', value = 'Debt', '2017Q1', '2017Q2', '2017Q3', '2017Q4', '2018Q1')
tail(dat, n = 15)
str(dat)
dat <- dat[, c(1, 3, 2, 4)]
dat1 <- spread(dat, 'Data', "Debt")
# Does not work.  It seems right but the numbers are not all there 
head(dat1)
tail(dat1)
head(dat)
dat1 <- spread(dat, "Data", "Debt", fill = NA)
dat[c(421, 422), ]
dat[da1[, 1] == "Korea", ]
dat[289:290, ]
