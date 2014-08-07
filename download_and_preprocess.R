data_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
filename <- "exdata_data_household_power_consumption.zip"

if (!file.exists(filename)){
  download.file(data_url, filename, method="curl")
  unzip(filename)
}

power <- read.csv2("household_power_consumption.txt", stringsAsFactors=F,na.strings="?")
power$date <- as.POSIXct(paste(power$Date, power$Time), format="%d/%m/%Y %H:%M:%S")
power$Global_active_power <- as.numeric(power$Global_active_power)
power <- power[as.Date(power$date) == as.Date("2007-02-01") | as.Date(power$date) == as.Date("2007-02-02"),]

# Plot1
hist(as.numeric(power$Global_active_power), ylab="Frequency", xlab="Global Active Power (kilowatts)", breaks=12, col="red", main="Global Active Power")

#Plot 2
png("plot1.png", width=480, height=480, units="px")
plot(power$date, as.numeric(power$Global_active_power), type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(power$date, as.numeric(power$Global_active_power))
dev.off()