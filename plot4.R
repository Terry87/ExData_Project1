## This script produces the fourth plot required for Project 1 for the Coursera subject
## Exploratory Data Analysis.
## The data for the project is household power consumption data, which comes from the
## UC Irvine Machine Learning Repository. The plot consists of the separate graphs for
## each of the following variables over the two-day period 2007-02-01 to 2007-02-02:
##   1. Global active power
##   2. Energy sub metering (3 variables)
##   3. Voltage
##   4. Global reactive power
##
## Author: Terry87
## Date:   12/07/2014

## Read data from disk file into a data frame 
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", as.is=TRUE, na.strings="?")

## Extract the data for the required two dates
df1 <- subset(df, Date=="1/2/2007" | Date=="2/2/2007")
times <- strptime(paste(df1$Date, df1$Time), format="%d/%m/%Y %H:%M:%S")

## Specify the name of the PNG file for the plot and the plot size
png(filename="plot4.png", width=480, height=480)

## Produce the four graphs in a 2x2 grid
par(mfcol=c(2,2))
with(df1, {
    plot(times, Global_active_power, type="l", xlab="", ylab="Global Active Power")
    plot(times, df1$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
    lines(times, df1$Sub_metering_2, col="red")
    lines(times, df1$Sub_metering_3, col="blue")
    legend("topright", lty=1, bty="n", cex=0.9, col=c("black", "red", "blue"), legend=names(df1)[7:9])
    plot(times, Voltage, type="l", xlab="datetime", ylab=names(df1)[5])
    plot(times, Global_reactive_power, type="l", xlab="datetime", ylab=names(df1)[4])
})

## Close the PNG file device
dev.off()

