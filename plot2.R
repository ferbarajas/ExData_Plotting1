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

###############
### PLOT #2 ###
###############

# Extract the time and the date:
dates<-datos$Date
times <- datos$Time
# Store them in a single variable.
date_time<-as.POSIXct(paste(dates, times))

# Use the combined "date_time" set to plot as the time axis, so that the result is a plot for every minute.
# Set plot type to "l", for a line.
# Label y with the corrresponding title, and set x labeling to nothing to remove the variable name.
png(file = "plot2.png", width = 480, height = 480)
plot(date_time, datos$Global_active_power, type ="l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
