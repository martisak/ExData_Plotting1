Sys.setlocale("LC_ALL", 'en_US.UTF-8')
library(sqldf)

data_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
filename <- "exdata_data_household_power_consumption.zip"

if (!file.exists(filename)){
  download.file(data_url, filename, method="curl")
  unzip(filename)
}

power <- read.csv.sql("household_power_consumption.txt", sep=";", stringsAsFactors=F,
 sql='select * from file where Date="1/2/2007" OR Date="2/2/2007"')

power$date <- as.POSIXct(paste(power$Date, power$Time), format="%d/%m/%Y %H:%M:%S")

# Plot 3
png("plot3.png", width=480, height=480, units="px")
plot(power$date, as.numeric(power$Sub_metering_1), type="n", xlab="", ylab="Energy sub metering")
lines(power$date, as.numeric(power$Sub_metering_1))
lines(power$date, as.numeric(power$Sub_metering_2),col="red")
lines(power$date, as.numeric(power$Sub_metering_3),col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"),lty=1)
dev.off()
