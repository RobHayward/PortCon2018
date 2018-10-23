# BoA charts
da <- read.csv('./Data/bac.csv')
da$Date <- as.Date(da$Date, format = "%d/%m/%Y")
da$BACl <- c(da$BAC[2:length(da$BAC)], rep(NA, 1))
da$BACR <- da$BAC/da$BACl -1
head(da)
par(mfrow = c(2, 1))
plot(da$Date, da$BAC, type = 'l', main = "Bank of American Share Price", 
     xlab = "Year", ylab = "Price")
plot(da$Date, da$BACR, type = 'l', main = "Bank of American Return", 
     xlab = "Year", ylab = "Return") 


    
