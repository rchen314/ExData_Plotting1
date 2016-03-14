# Read in libs
library(lubridate)

# Read data
setwd("C:/Users/rchen/Documents/Coursera/ExData_Plotting1")
power <- read.delim("household_power_consumption.txt", sep=";")

# Focus on 2007-02-01 and 2007-02-02
p <- subset(power, (Date == '1/2/2007') | (Date == '2/2/2007'))

# Combine date and time into one field
p$Ctime <- paste(p$Date, p$Time)

# Convert to an R date/time type using strtime
p$Ctime2 <- strptime(p$Ctime, "%d/%m/%Y %H:%M:%S")
p$Day <- weekdays(as.Date(p$Date, "%d/%m/%Y"))

# Convert to Killowatts
p$Gap_kwh <- as.numeric(p$Global_active_power) / 1000

# Make plot
plot(p$Ctime2, p$Gap_kwh, type = "l", 
     ylab = "Global Active Power (Kilowatts)",
     xlab = "")

# Generate png
dev.copy(png, file = "plot2.png")
dev.off()





