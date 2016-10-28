
data <- read.table("household_power_consumption.txt",na.strings = "?", header=TRUE, sep = ";")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data.set <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")

png(filename = "plot1.png",
    width = 480, height = 480, units = "px")

hist(data.set$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")

dev.off()