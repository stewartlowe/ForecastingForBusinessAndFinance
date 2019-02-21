library(rlist)

#Import sales data from csv file
AnnualSalesData <- read.table("Annual-Sales_1970-2016.csv")

#Add columns representing years and t, then order for clarity
AnnualSalesData$year <- seq(1970,2016)
AnnualSalesData$t <- seq(1,47)
colnames(AnnualSalesData)[colnames(AnnualSalesData)=="V1"] <- "y"
AnnualSalesData <- AnnualSalesData[c("year","t","y")]

#Create log(y) variable
AnnualSalesData$ly <- log(AnnualSalesData$y)

#Find the differences between y_1 and y_-1, and ly_1 and ly_-1
AnnualSalesData$d1_y <- list.prepend(diff(AnnualSalesData$y),0)
AnnualSalesData$d1_ly <- list.prepend(diff(AnnualSalesData$ly),0)

#Generate plots
dev.new()
par(mfrow=c(2,2))
plot(AnnualSalesData$t,AnnualSalesData$y,type="l",xlab="t",ylab="y")
plot(AnnualSalesData$t,AnnualSalesData$ly,type="l",xlab="t",ylab="log(y)")
plot(AnnualSalesData$t,AnnualSalesData$d1_y,type="l",xlab="t",ylab="diff(y)")
plot(AnnualSalesData$t,AnnualSalesData$d1_ly,type="l",xlab="t",ylab="diff(log(y))")
dev.new()
plot(AnnualSalesData$t,AnnualSalesData$y,type="l")
lines(AnnualSalesData$t,AnnualSalesData$ly)

