data_main <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data_main$Date <- as.Date(data_main$Date)
data_filtered <- data_main[data_main$Date %in% c(as.Date("1/2/2007"),as.Date("2/2/2007")) ,]
#variables
Global_active_power <- as.numeric(data_filtered$Global_active_power)
#plot
png("plot1.png", width=480, height=480)
hist(Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()
