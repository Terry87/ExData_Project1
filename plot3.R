## This script produces the third plot required for Project 1 for the Coursera subject
## Exploratory Data Analysis.
## The data for the project is household power consumption data, which comes from the
## UC Irvine Machine Learning Repository. The data for this plot is three sub metering
## variables versus time over the two-day period 2007-02-01 to 2007-02-02, plotted as
## line graphs. 
##
## Author: Terry87
## Date:   10/07/2014

## Read data from disk file into a data frame 
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", as.is=TRUE, na.strings="?")

## Extract the data for the required two dates
df1 <- subset(df, Date=="1/2/2007" | Date=="2/2/2007")
times <- strptime(paste(df1$Date, df1$Time), format="%d/%m/%Y %H:%M:%S")

## Specify the name of the PNG file for the plot and the plot size
png(filename="plot3.png", width=480, height=480)

## Use the 'plot' and 'lines' functions to plot three line graphs
plot(times, df1$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(times, df1$Sub_metering_2, col="red")
lines(times, df1$Sub_metering_3, col="blue")

## Create a legend in the top right corner of the plot
legend("topright", lty=1, col=c("black", "red", "blue"), legend=names(df1)[7:9])

## Close the PNG file device
dev.off()

