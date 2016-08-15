# download and unzip data
setwd("/Users/Sam")
if(!file.exists("data")) dir.create("data")
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./data/household_power_consumption.zip")
unzip("./data/household_power_consumption.zip", exdir = "./data")

# read data into R
filename <- "./data/household_power_consumption.txt"
data <- read.table(filename, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Plot 4
convert_date_and_time <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalactivepower <- as.numeric(subsetdata$Global_active_power)
globalreactivepower <- as.numeric(subsetdata$Global_reactive_power)
voltage <- as.numeric(subsetdata$Voltage)
submetering1 <- as.numeric(subsetdata$Sub_metering_1)
submetering2 <- as.numeric(subsetdata$Sub_metering_2)
submetering3 <- as.numeric(subsetdata$Sub_metering_3)
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
plot(convert_date_and_time, globalactivepower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(convert_date_and_time, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(convert_date_and_time, submetering1, type="l", ylab="Energy sub metering", xlab="")
lines(convert_date_and_time, submetering2, type="l", col="red")
lines(convert_date_and_time, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=1, col=c("black", "red", "blue"), bty="o")
plot(convert_date_and_time, globalreactivepower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
