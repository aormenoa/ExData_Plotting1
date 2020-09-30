data_main <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data_filtered <- data_main[data_main$Date %in% c("1/2/2007","2/2/2007") ,]

#variables
Global_active_power <- as.numeric(data_filtered$Global_active_power)
time <- strptime(paste(data_filtered$Date, data_filtered$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#plot
png("plot2.png", width=480, height=480)
plot(time, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
