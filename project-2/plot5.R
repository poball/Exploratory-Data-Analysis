# Exploratory Data Analysis
# project-2
# Q5

#setup directory and loading data 
setwd("./coursera/Exploratory-Data-Analysis/project-2")
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#load library
library(ggplot2)

# Subset data to Baltimore City
BC <- subset(NEI, fips=='24510')

# get motor vehicle SCC
vehicleSource <- SCC[grepl("Vehicle", SCC$EI.Sector),]
# select baltimore data based on vehicle sources
vehicleBaltimore <- subset(BC, BC$SCC %in% vehicleSource$SCC)

# data for plot
plotdata <- aggregate(vehicleBaltimore[c("Emissions")], list(type=vehicleBaltimore$type, year = vehicleBaltimore$year), sum)

# plot and save data in same directory
png('./plot5.png')
plot <- qplot(year,Emissions,data=plotdata, geom="line")+
  ggtitle(expression("Baltimore City" ~ PM[2.5] ~ "Motor Vehicle Emissions by Year"))+
  xlab("Year") +
  ylab(expression("Total" ~ PM[2.5] ~ "Emissions (tons)"))
print(plot)

dev.off()
