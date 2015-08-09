##plot 2

## Getting full dataset
data_full <- read.csv("../Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## Subset the data
data <- data_full[data_full$Date %in% c("1/2/2007","2/2/2007") ,]


## Convert date and time
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
