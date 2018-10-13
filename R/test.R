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
