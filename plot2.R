# Exploratory Data Analysis Course project 1

# R code will gernerate three PNG files. plot1.png plot2.png plot3.png
#read csv file
data <- read.csv("./household_power_consumption.txt", sep=";", stringsAsFactors=TRUE)

# get three dates' data for analysis
subData <- data[data$Date %in% c("16/12/2006","17/12/2006", "18/12/2006") ,]


# this expression sets up a plot with 1 row 3 columns, sets the margin and outer margins
# PLOT2: three graph in one file
png("plot2.png", width=1200, height=500)
par(mfrow = c(1, 3), mar = c(4, 4, 2, 2), oma = c(0, 0, 0, 0))
datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subData$Global_active_power)
voltage <- as.numeric(subData$Voltage)
globalReactivePower <- as.numeric(subData$Global_reactive_power)

#  draw the plot of global Active power ~ date 
plot(datetime, globalActivePower, type="l", xlab="datetime", ylab="Global Active Power(kilowatt)", col="cyan3")

#draw the plot of global reactive power ~ date 
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power", col="blue")

#draw the plot of votage ~ date 
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage", col="red")

mtext("Plot of globalActivePower/globalReactivePower/voltage ~ Datetime", outer = TRUE)
dev.off()

