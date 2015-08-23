# Exploratory Data Analysis
# project-2
# Q2

#setup directory and loading data 
setwd("./coursera/Exploratory-Data-Analysis/project-2")
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset data to Baltimore City
bal <- subset(NEI, fips=='24510')

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
# from 1999 to 2008? Use the base plotting system to make a plot answering this question.

# plot and save in same directory
png(filename='./plot2.png')

barplot(tapply(X=bal$Emissions, INDEX=bal$year, FUN=sum), 
        main='Total Emission in Baltimore City, MD', 
        xlab='Year', ylab=expression('PM'[2.5]))

dev.off()
