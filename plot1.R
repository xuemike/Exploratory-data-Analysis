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

