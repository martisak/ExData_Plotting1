## Check if the data is available
# if it's not, the download and preprocess.
if (!exists("dataset") ) {
	source('download_and_preprocess.R')
}

## Plot1

# Create 480x480 png
png("plot1.png", 
	width=480, 
	height=480, 
	units="px")

hist(as.numeric(dataset$Global_active_power),
	ylab="Frequency", 
	xlab="Global Active Power (kilowatts)", 
	breaks=12, 
	col="red", 
	main="Global Active Power")

# Close the png
dev.off()
