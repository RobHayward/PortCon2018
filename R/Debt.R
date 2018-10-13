# External debt
#install.packages('tidyr', 'plm')
library(tidyr)
library(dplyr)
da <- read.csv('./Data/ForeignCurrencyDebt.csv', stringsAsFactors = FALSE)
head(da)
da[, 3] <- gsub("+ACI-", "", da[,3], fixed = TRUE) 
da[, 5] <- gsub("+AC0-", "", da[,5], fixed = TRUE) 
da[, 8] <- gsub("+ACI-", "", da[,8], fixed = TRUE) 
da[2,5]
names(da)
#da$Series <- paste( da[, 3], da[,4], da[,5], da[, 6], da[,7], da[,8])
da$Series <- paste(da[,5], da[,7])
da$Series <- gsub("  ", " ", da$Series)
head(da)
# Now just sort the data and create new names. 
da <- da[, c(1, 2, 9, 17, 11, 12, 13, 14, 15)]
names(da) <- c('Country', 'C-Code', 'D-Code', 'Data', '2017Q1', '2017Q2', '2017Q3', '2017Q4', '2018Q1')
head(da, n = 8)
# Now i need to calculate the debt proportion. 
# This is a row but the data is panel,.
# Need to switch from wide to long
#prtactice data
da1 <- da[,c(1, 4, 5:9)]
head(da1)
dat <- spread(da1, key = 'Data', value = c('2017Q1', '2017Q2', '2017Q3', '2017Q4', '2018Q1'))
dat <- gather(da1, key = 'Year', value = 'Debt', c('2017Q1', '2017Q2', '2017Q3', '2017Q4', '2018Q1'))
head(dat, n = 15)
# Does not work.  I have data in rows.  I need to separate but cannot do that. 
dat2 <- spread(dat, 'Data')
head(dat2)

