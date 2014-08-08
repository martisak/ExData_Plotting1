## Check if the data is available
# if it's not, the download and preprocess.
if (!exists("dataset") ) {
	source('download_and_preprocess.R')
}

## Plot 2

# Create 480x480 png
png("plot2.png", 
	width=480, 
	height=480, 
	units="px")

plot(dataset$date, as.numeric(dataset$Global_active_power), 
	type="n", 
	xlab="", 
	ylab="Global Active Power (kilowatts)"
)

lines(dataset$date, as.numeric(dataset$Global_active_power))

# Close the png
dev.off()
