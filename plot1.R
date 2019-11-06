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
### PLOT #1 ###
###############

# Set filename and size for the .png image
png(file = "plot1.png", width = 480, height = 480)
# Plot histogram using the "Global_active_power" data.
# Label the x and y axis and the title.
hist(datos$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
# Close the graphic device
dev.off()
