da <- read.csv('./Data/MSCI.csv', stringsAsFactors = FALSE)
head(da)
#da$Date <- gsub('.[0-9][0-9][0-9][0-9]', "", da$x)
head(da)
plot(da$x, da$MSCI.ESG, type = 'l', main = "MSCI Emerging market Funds", xlab = "Year", ylab = "Price")
lines(da$x, da$MSCI, col = 'red')
legend('topleft', inset = 0.02, legend = c("MSCI EM", "MSCI EM ESG"), 
       col = c('black', 'brown'), lty = 1)
       