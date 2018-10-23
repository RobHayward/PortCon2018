stocks <- data.frame(
time = as.Date('2009-01-01') + 0:9, 
X = rnorm(10, 0, 1), 
Y = rnorm(10, 0, 2), 
Z = rnorm(10, 0, 4)
)
head(stocks)
stocksm <- stocks %>% gather(stock, price, -time)
stocksm %>% spread(stock, price)
stocksm %>% spread(time, price)
stocksm
df <- data.frame(x = c("a", "b"), y = c(3, 4), z = c(5, 6))
df %>% spread(x, y) %>% gather(x, y, a:b, na.rm = TRUE)
#####################
library('dsr')
data()
table1
table1$cases
spread(table2, key, value)
#============
Country <- c("Argentina", "Argentina","UK", "UK")
#Date <- c(2000, 2000, 2001, 2001, 2000, 2000, 2001, 2001)
Series <- c("Domestic Debt", "Foreign Debt", "Domestic Debt", "Foreign Debt")
Y2000 <- c(1, 2, 3, 4)
Y2001 <- c(5, 6, 7, 8)
#Debt <- c(1, 2, 3, 4, 5, 6, 7, 8)
df <- data.frame("Country" = Country, "Series" = Series, "Y2000" = Y2000, "Y2001" = Y2001)
df
df1 <- gather(df, "Year", "Debt", Y2000, Y2001)
spread(df1, Series, Debt)
