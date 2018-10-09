# External debt
da <- read.csv('./Data/ForeignCurrencyDebt.csv', stringsAsFactors = FALSE)
head(da)
da[, 3] <- gsub("+ACI-", "", da[,3], fixed = TRUE) 
da[, 8] <- gsub("+ACI-", "", da[,8], fixed = TRUE) 
names(da)
da$Series <- paste( da[, 3], da[,4], da[,5], da[, 6], da[,7], da[,8])
head(da)
# Now just sort the data and create new names. 
da <- da[, c(1, 2, 3, 9, 17, 12, 13, 14, 15, 16)]
names(da) <- c('Country', 'C-Code', 'Data', '2017Q1', '2017Q2', '2017Q3', '2017Q4', 
'2018Q1')
head(da)
# Not quite,  Needs to be fixed, 