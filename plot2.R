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

# Plot 2
convert_date_and_time <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalactivepower <- as.numeric(subsetdata$Global_active_power)
png("plot2.png", width=480, height=480)
plot(convert_date_and_time, globalactivepower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
