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

# Plot1
png("plot1.png", width=480, height=480, units="px")
hist(as.numeric(power$Global_active_power), ylab="Frequency", xlab="Global Active Power (kilowatts)", breaks=12, col="red", main="Global Active Power")
dev.off()