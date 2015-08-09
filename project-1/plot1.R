## plot 1

data_full <- read.csv("../Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## Subsetting the data
data <- data_full[data_full$Date %in% c("1/2/2007","2/2/2007") ,]
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Converting dates
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 1
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
