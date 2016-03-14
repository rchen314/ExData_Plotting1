# Read data
setwd("C:/Users/rchen/Documents/Coursera/ExData_Plotting1")
power <- read.delim("household_power_consumption.txt", sep=";")

# Focus on 2007-02-01 and 2007-02-02
p <- subset(power, (Date == '1/2/2007') | (Date == '2/2/2007'))

# Make histogram
hist((as.numeric(p$Global_active_power))/1000, col = "red", breaks = 13, main = "Global Active power",
     xlab = "Global Active Power (kilowatts)", xlim = c(0, 6), ylim = c(0, 1200))

# Generate png
dev.copy(png, file = "plot1.png")
dev.off()





