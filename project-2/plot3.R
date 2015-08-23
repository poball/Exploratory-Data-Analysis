# Exploratory Data Analysis
# project-2
# Q3

#setup directory and loading data 
setwd("./coursera/Exploratory-Data-Analysis/project-2")
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset data to Baltimore City
bal <- subset(NEI, fips=='24510')

#load library
library(ggplot2)

#data for plot
pd <- aggregate(bal[c("Emissions")], list(type = bal$type, year = bal$year), sum)

#plot and save to same directory
png('./plot3.png', width=480, height=480)
plot <- ggplot(pd, aes(x=year, y=Emissions, colour=type)) +
  geom_point(alpha=.3) +
  geom_smooth(alpha=.2, size=1, method="loess") +
  ggtitle("Total Emissions by Type in Baltimore City")
print(plot)

dev.off()
