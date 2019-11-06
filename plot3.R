rm(list=ls())
setwd("D:/Libraries/Documents/GitHub/Coursera/4 Exploratory Data Analysis")

library(data.table)
# Download the file, unzip it an read it into memory
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url = url, destfile = "./data.zip", method = "curl")
unzip(zipfile = "./data.zip")

datos <- fread(input = "./household_power_consumption.txt", na.strings = "?", sep = ";", header = T)

# Change the date column to date type variables.
datos$Date<-as.Date(datos$Date, format = "%d/%m/%Y")

# Subset for the dates specified in the problem.
datos<-subset(datos, Date >= "2007-02-01" & Date <= "2007-02-02")

# Extract the time and the date:
dates<-datos$Date
times <- datos$Time
# Store them in a single variable.
date_time<-as.POSIXct(paste(dates, times))


###############
### PLOT #3 ###
###############

png(file = "plot3.png", width = 480, height = 480)
# Plot the date/time agains each sub_metering, one on top of the other using points after the initial plot.
plot(date_time, datos$Sub_metering_1, type = "l", col ="black", xlab = "", ylab = "Energy sub metering")
points(date_time, datos$Sub_metering_2, type = "l", col = "red")
points(date_time, datos$Sub_metering_3, type = "l", col = "blue")

# Add a legend at the top right, specifing "1" for horizontal lines, the colors, the legend text, the type of line, the width and the size of the legend box with "cex".
legend("topright", 1, col=c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, lwd= 2, cex=0.9)
dev.off()