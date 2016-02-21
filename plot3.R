# Exploratory Data Analysis Course project 1

# R code will gernerate three PNG files. plot1.png plot2.png plot3.png
#read csv file
data <- read.csv("./household_power_consumption.txt", sep=";", stringsAsFactors=TRUE)

# get three dates' data for analysis
subData <- data[data$Date %in% c("16/12/2006","17/12/2006", "18/12/2006") ,]


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


