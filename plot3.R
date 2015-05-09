##PLOT 3
##reading data
  setwd("~/R/Exploratory Data Analysis")
  data<- read.table("exdata-data-household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
  SubData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
##getting variables ready for use
  DateTime <- strptime(paste(SubData$Date, SubData$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
  SubMet1<- as.numeric(SubData$Sub_metering_1)
  SubMet2<- as.numeric(SubData$Sub_metering_2)
  SubMet3<- as.numeric(SubData$Sub_metering_3)
##constructing graph
  png(filename = "plot3.png", width = 480, height = 480)
  plot(DateTime, SubMet1, type = "l", ylab = "Energy sub metering", xlab = " ")
  lines(DateTime, SubMet2, type = "l", col = "red")
  lines(DateTime, SubMet3, type = "l", col = "blue")
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  dev.off()