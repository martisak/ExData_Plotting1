# This was needed since I had Swedish set.
# Sys.setlocale("LC_ALL", 'en_US.UTF-8')

library(sqldf)

data_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
filename <- "exdata_data_household_power_consumption.zip"

if (!file.exists(filename)){
  cat("File did not exist, downloading...\n")
  download.file(data_url, filename, method="curl")
  unzip(filename)
}

cat("Reading data...\n")
# Only read dates 2007-02-01 and 2007-02-02. Date format is d/m/Y.
dataset <- read.csv.sql("household_power_consumption.txt",
	sep=";", 
	stringsAsFactors=F,
 	sql='select * from file where Date="1/2/2007" OR Date="2/2/2007"')

# Merge together date and time to creata POSIXct vector. Keep Date and Time separate 
# so that it's easier to find bugs later.
dataset$date <- as.POSIXct(paste(dataset$Date, dataset$Time), format="%d/%m/%Y %H:%M:%S")

# Convert character to numeric.
dataset$Global_active_power <- as.numeric(dataset$Global_active_power)
dataset$Sub_metering_1 <- as.numeric(dataset$Sub_metering_1)
dataset$Sub_metering_2 <- as.numeric(dataset$Sub_metering_2)
dataset$Sub_metering_3 <- as.numeric(dataset$Sub_metering_3)
dataset$Voltage <- as.numeric(dataset$Voltage)
dataset$Global_reactive_power <- as.numeric(dataset$Global_reactive_power)

