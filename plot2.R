##PLOT 2
##reading data
  setwd("~/R/Exploratory Data Analysis")
  data<- read.table("exdata-data-household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
  SubData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
##getting variables ready for use
  GAP<- as.numeric(SubData$Global_active_power)
  DateTime <- strptime(paste(SubData$Date, SubData$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
##constructing graph
  png(filename = "plot2.png", width = 480, height = 480)
  plot(DateTime, GAP, type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)")
  dev.off()