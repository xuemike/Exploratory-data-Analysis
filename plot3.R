# Exploratory Data Analysis Course project 1

# R code will gernerate three PNG files. plot1.png plot2.png plot3.png
#read csv file
data <- read.csv("./household_power_consumption.txt", sep=";", stringsAsFactors=TRUE)

# get three dates' data for analysis
subData <- data[data$Date %in% c("1/7/2007","2/7/2007") ,]


# plot3:  draw plot of datetime ~ submeter 
subData$datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subData$subMetering1 <- as.numeric(subData$Sub_metering_1)
subData$subMetering2 <- as.numeric(subData$Sub_metering_2)
subData$subMetering3 <- as.numeric(subData$Sub_metering_3)

#draw plot submeter ~ datetime
plot(subData$datetime, subData$subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(subData$datetime, subData$subMetering2, type="l", col="red")
lines(subData$datetime, subData$subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=3, col=c("blue", "black", "red"),  cex=0.5)
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()


