# Exploratory Data Analysis Course project 1

# R code will gernerate three PNG files. plot1.png plot2.png plot3.png
#read csv file
data <- read.csv("./household_power_consumption.txt", sep=";", stringsAsFactors=TRUE)

# extract two days data
subData <- data[data$Date %in% c("1/7/2007","2/7/2007") ,]

#Plot1:  draw histgram for GlobalActivePower 
subData$globalActivePower <- as.numeric(subData$Global_active_power)
hist(subData$globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power(kilowatt)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()

