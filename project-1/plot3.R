## plot 3

## Getting full dataset
data_full <- read.csv("../Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## Subsetting the data
data <- data_full[data_full$Date %in% c("1/2/2007","2/2/2007") ,]


## Convert date and time
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Datetime <- as.POSIXct(datetime)

## Plot 3
with(data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Save to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
