
data <- read.table("household_power_consumption.txt",na.strings = "?", header=TRUE, sep = ";")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

data$DateTime <-  paste(data$Date, data$Time, sep=":") 
data$DateTime <- strptime(data$DateTime, "%Y-%m-%d:%H:%M:%S")

data.set <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")
data.set$DateTime <- as.POSIXct(data.set$DateTime)

png(filename = "plot2.png",
    width = 480, height = 480, units = "px")

plot(data.set$Global_active_power ~data.set$DateTime, breaks=1, type="l", ylab = "Global Active Power (kilowatts)", xlab="")

dev.off()
