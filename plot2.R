# Exploratory Data Analysis Course project 1

# R code will gernerate three PNG files. plot1.png plot2.png plot3.png
#read csv file
data <- read.csv("./household_power_consumption.txt", sep=";", stringsAsFactors=TRUE)

# get two dates' data for analysis
#data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# extract two days data
subData <- data[data$Date %in% c("1/7/2007","2/7/2007") ,]


# this expression sets up a plot with 1 row 3 columns, sets the margin and outer margins
# PLOT2: three graph in one file

subData$timestamp <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
subData$globalActivePower <- as.numeric(subData$Global_active_power)

#  draw the plot of global Active power ~ date 
plot(subData$timestamp, subData$globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
