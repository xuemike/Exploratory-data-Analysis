# Exploratory Data Analysis Course project 1

# R code will gernerate three PNG files. plot1.png plot2.png plot3.png
#read csv file
data <- read.csv("./household_power_consumption.txt", sep=";", stringsAsFactors=TRUE)

# get three dates' data for analysis
subData <- data[data$Date %in% c("16/12/2006","17/12/2006", "18/12/2006") ,]

#Plot1:  draw histgram for GlobalActivePower 
globalActivePower <- as.numeric(subData$Global_active_power)
png("plot1.png", width=600, height=800)
hist(globalActivePower, col="cyan3", main="Global Active Power", xlab="Global Active Power(kilowatt)")
dev.off()


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

dev.off()

# plot3:  draw plot of datetime ~ submeter 
datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subMetering1 <- as.numeric(subData$Sub_metering_1)
subMetering2 <- as.numeric(subData$Sub_metering_2)
subMetering3 <- as.numeric(subData$Sub_metering_3)
png("plot3.png", width=500, height=500)
#draw plot submeter ~ datetime
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=3, col=c("blue", "black", "red"),  cex=0.5)
dev.off()

