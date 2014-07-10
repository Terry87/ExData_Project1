## This script produces the first plot required for Project 1 for the Coursera subject
## Exploratory Data Analysis.
## The data for the project is household power consumption data, which comes from the
## UC Irvine Machine Learning Repository. The data for this plot is household global
## minute-averaged active power over the two-day period 2007-02-01 to 2007-02-02,  
## displayed as a histogram. 
##
## Author: Terry87
## Date:   10/07/2014

## Read data from disk file into a data frame 
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", as.is=TRUE, na.strings="?")

## Extract the data for the required two dates
df1 <- subset(df, Date=="1/2/2007" | Date=="2/2/2007")

## Specify the name of the PNG file for the plot and the plot size
png(filename="plot1.png", width=480, height=480)

## Use the 'hist' function to plot a frequency distribution for the Global Active Power variable
hist(df1$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

## Close the PNG file device
dev.off()

