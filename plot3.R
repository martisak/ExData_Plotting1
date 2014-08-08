## Check if the data is available
# if it's not, the download and preprocess.
if (!exists("dataset") ) {
	source('download_and_preprocess.R')
}


## Plot 3

# Create 480x480 png
png("plot3.png", 
	width=480, 
	height=480, 
	units="px")

plot(dataset$date, as.numeric(dataset$Sub_metering_1), 
	type="n", 
	xlab="", 
	ylab="Energy sub metering")

lines(dataset$date, as.numeric(dataset$Sub_metering_1))
lines(dataset$date, as.numeric(dataset$Sub_metering_2), col="red")
lines(dataset$date, as.numeric(dataset$Sub_metering_3), col="blue")

# Add a legend
legend("topright", 
	legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
	col = c("black","red","blue"),
	lty=1)

# Close the png
dev.off()
