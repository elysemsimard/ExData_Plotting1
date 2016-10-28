data <- read.table("household_power_consumption.txt",na.strings = "?", header=TRUE, sep = ";")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

data$DateTime <-  paste(data$Date, data$Time, sep=":") 
data$DateTime <- strptime(data$DateTime, "%Y-%m-%d:%H:%M:%S")

data.set <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")
data.set$DateTime <- as.POSIXct(data.set$DateTime)

png(filename = "plot3.png",
    width = 480, height = 480, units = "px")

plot(data.set$Sub_metering_1 ~data.set$DateTime, breaks=1, type="l", ylab = "Energy sub metering", xlab="", col="black")
lines(data.set$Sub_metering_2 ~data.set$DateTime, col= "red")
lines(data.set$Sub_metering_3 ~data.set$DateTime, col="blue")
legend("topright",col = c("black", "red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1)

dev.off()
