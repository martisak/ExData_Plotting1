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

png("plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))
plot(power$date, as.numeric(power$Global_active_power), type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(power$date, as.numeric(power$Global_active_power))

plot(power$date, as.numeric(power$Voltage), type="n", xlab="datetime", ylab="Voltage")
lines(power$date, as.numeric(power$Voltage))

plot(power$date, as.numeric(power$Sub_metering_1), type="n", xlab="", ylab="Energy sub metering")
lines(power$date, as.numeric(power$Sub_metering_1))
lines(power$date, as.numeric(power$Sub_metering_2),col="red")
lines(power$date, as.numeric(power$Sub_metering_3),col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"),lty=1)

plot(power$date, as.numeric(power$Global_reactive_power), type="n", xlab="datetime", ylab="Global_reactive_power")
lines(power$date, as.numeric(power$Global_reactive_power))

dev.off()
