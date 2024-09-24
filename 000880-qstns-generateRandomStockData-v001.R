

setwd("c:/users/home/dropbox/website/yu/ids2030-busAnalyticsAndProgramming/61fall17-ids2030-busAnalyticsAndProgramming/assignments")
stocks <- read.csv("00300-qstns-R-Assignment-logicalOperatorsAndDataframes-stocks-data-v001.csv")
stocks

generateRandomStockData <- function (numberOfStocks=2000, seed = 1) {
  set.seed(seed)  # this will "prime" the random number generator
  
  # Generate the tickers
  getTicker <- function(...) {
    # Generate tickers
    numberOfLetters <- sample(2:4, size=1, prob=c(.15, .2, .65) )
    tickerLetters <- sample(letters, size=numberOfLetters, replace=TRUE)
    paste0(tickerLetters, collapse="")
  }
  uniqueTickers <- vector()
  while (length(uniqueTickers) < numberOfStocks){
    #cat("length=",length(uniqueTickers))
    tickers <- c(uniqueTickers, sapply(1:numberOfStocks, getTicker))
    uniqueTickers <- unique(tickers)
    uniqueTickers <-  uniqueTickers[1:min(length(uniqueTickers),numberOfStocks)]
  }
  
  # Generate the exchange
  exchanges <- sample(c("nasdaq","nyse"), size=numberOfStocks, replace=TRUE, prob=c(.6, .4) )

  # Generate the sector
  sectors <- sample(c("tech","energy","pharm","consumer"), size=numberOfStocks, replace=TRUE, prob=c(.3, .3, .2, .2) )
  
  # Generate the open prices
  numberOfCheapStocks <- floor(.15 * numberOfStocks)
  numberOf100Stocks <- floor(.40 * numberOfStocks)
  numberOf1000Stocks <- floor(.18 * numberOfStocks)
  numberOfRemainingStocks <- numberOfStocks - numberOfCheapStocks - 
                  numberOf100Stocks - numberOf1000Stocks
  
  openPrices <- sample(095:105, numberOfCheapStocks, replace=TRUE) / 100
  openPrices <- c(openPrices, sample(9800:10200, numberOf100Stocks, replace=TRUE) / 100)
  openPrices <- c(openPrices, sample(99000:101000, numberOf1000Stocks, replace=TRUE) / 100)
  openPrices <- c(openPrices, sample(1:200000, numberOfRemainingStocks, replace=TRUE) / 100)

  news <- sample(c(TRUE, FALSE), numberOfStocks, replace=TRUE)
  
  closePrices <- openPrices * (1 + rnorm(length(openPrices), mean=0, sd=.10))
  closePrices <- round(closePrices, 2)
  
  df <- data.frame( ticker=uniqueTickers, exchange=exchanges, sector=sectors, open=openPrices, close=closePrices, news=news)

  df[order(df$ticker),]
}
generateRandomStockData(20)
#stocks

#install.packages("stats")

#install.packages("fitdistrplus")
#library(fitdistrplus)
#
#dgumbel <- function(x, a, b) 1/b*exp((a-x)/b)*exp(-exp((a-x)/b))
#pgumbel <- function(q, a, b) exp(-exp((a-q)/b))
#qgumbel <- function(p, a, b) a-b*log(-log(p))
#data(groundbeef)
#fitgumbel <- fitdist(groundbeef$serving, "gumbel", start=list(a=10, b=10))