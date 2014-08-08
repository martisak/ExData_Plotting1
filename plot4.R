## Check if the data is available
# if it's not, the download and preprocess.
if (!exists("dataset") ) {
	source('download_and_preprocess.R')
}

## Plot 4

# Create 480x480 png
png("plot4.png", 
	width=480, 
	height=480, 
	units="px")

# Two rows, two columns
par(mfrow=c(2,2))

# Top left
plot(dataset$date, as.numeric(dataset$Global_active_power), 
	type="n", 
	xlab="", 
	ylab="Global Active Power")

# Add lines
lines(dataset$date, as.numeric(dataset$Global_active_power))

# Top right
plot(dataset$date, as.numeric(dataset$Voltage), 
	type="n", 
	xlab="datetime", 
	ylab="Voltage")

lines(dataset$date, as.numeric(dataset$Voltage))

# Bottom left
plot(dataset$date, as.numeric(dataset$Sub_metering_1), 
	type="n", 
	xlab="", 
	ylab="Energy sub metering")
lines(dataset$date, as.numeric(dataset$Sub_metering_1))
lines(dataset$date, as.numeric(dataset$Sub_metering_2),col="red")
lines(dataset$date, as.numeric(dataset$Sub_metering_3),col="blue")
legend("topright", 
	legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
	col = c("black","red","blue"),
	lty=1, 
	bty="n")

# Bottom right
plot(dataset$date, as.numeric(dataset$Global_reactive_power), 
	type="n", 
	xlab="datetime", 
	ylab="Global_reactive_power")
lines(dataset$date, as.numeric(dataset$Global_reactive_power))

# Close the png
dev.off()
