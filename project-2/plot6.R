# Exploratory Data Analysis
# project-2
# Q5

#setup directory and loading data 
setwd("./coursera/Exploratory-Data-Analysis/project-2")
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#load library
library(ggplot2)

# subset data to Baltimore city, Los Angeles County
# Assume "Motor Vehicles" only means on road
MV <- subset(NEI, (fips == "24510" | fips == "06037"))

# motor vehicle SCC
vehicleSource <- SCC[grepl("Vehicle", SCC$EI.Sector),]

# select baltimore data based on vehicle sources
vehicleBaLa <- subset(MV, MV$SCC %in% vehicleSource$SCC)

# assign the city name, based on fips code
vehicleBaLa$city <- rep(NA, nrow(vehicleBaLa))
vehicleBaLa[vehicleBaLa$fips == "06037", ][, "city"] <- "Los Angeles County"
vehicleBaLa[vehicleBaLa$fips == "24510", ][, "city"] <- "Baltimore City"


# create plotdata
plotdata <- aggregate(vehicleBaLa[c("Emissions")], list(city = vehicleBaLa$city, year = vehicleBaLa$year), sum)

# plot and save plot in same directory
png('./plot6.png', width=680, height=480)

plot <- ggplot(plotdata, aes(x=year, y=Emissions, colour=city)) +
  geom_point(alpha=0.1) +
  geom_smooth(method="loess") +
  ggtitle(expression(PM[2.5]~"Baltimore and Los Angeles for Motor Vehicles"))
print(plot)

dev.off()
