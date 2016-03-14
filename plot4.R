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

# Convert to Killowatts

# Convert to #s

# Specify png
png(file = "plot4.png", width = 480, height = 480)

# Specify 2x2 plot
par(mfrow = c(2,2))

# Make plot 1
p$Gap_kwh <- as.numeric(p$Global_active_power) / 1000
plot(p$Ctime2, p$Gap_kwh, type = "l", 
     ylab = "Global Active Power (Kilowatts)",
     xlab = "")

# Make plot 2 
p$V <- as.numeric(as.character(p$Voltage))
plot(p$Ctime2, p$V, type = "l", 
     ylab = "Voltage",
     xlab = "datetime")

# Make plot 3
p$sm1 <- as.numeric(as.character(p$Sub_metering_1))
p$sm2 <- as.numeric(as.character(p$Sub_metering_2))
p$sm3 <- as.numeric(as.character(p$Sub_metering_3))
plot(p$Ctime2, p$sm1, type = "l", ylab = "Energy sub metering", xlab = "") 
points(p$Ctime2, p$sm2, type = "l", col = "red")
points(p$Ctime2, p$sm3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = c(1, 1, 1),
      legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Make plot 4
p$grp <- as.numeric(as.character(p$Global_reactive_power))
plot(p$Ctime2, p$grp, type = "l",
     ylab = "Global_reactive_power",
     xlab = "datetime")

# Close file
dev.off()





