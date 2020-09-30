data_main <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data_filtered <- data_main[data_main$Date %in% c("1/2/2007","2/2/2007") ,]

#variables
Sub_metering_1 <- as.numeric(subSetData$Sub_metering_1)
Sub_metering_2 <- as.numeric(subSetData$Sub_metering_2)
Sub_metering_3 <- as.numeric(subSetData$Sub_metering_3)
time <- strptime(paste(data_filtered$Date, data_filtered$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Global_active_power <- as.numeric(subSetData$Global_active_power)
Global_reactive_power <- as.numeric(subSetData$Global_reactive_power)
Voltage <- as.numeric(subSetData$Voltage)


#plot
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(time, Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(time, Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(time, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(time, Sub_metering_2, type="l", col="red")
lines(time, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="n")
plot(time, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
