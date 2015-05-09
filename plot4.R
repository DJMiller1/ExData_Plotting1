##PLOT 4
##reading the data
  setwd("~/R/Exploratory Data Analysis")
  data<- read.table("exdata-data-household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
  SubData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
##getting variables ready for use
  GAP<- as.numeric(SubData$Global_active_power)
  DateTime <- strptime(paste(SubData$Date, SubData$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
  SubMet1<- as.numeric(SubData$Sub_metering_1)
  SubMet2<- as.numeric(SubData$Sub_metering_2)
  SubMet3<- as.numeric(SubData$Sub_metering_3)
  Voltage<- as.numeric(SubData$Voltage)
  GRP<- as.numeric(SubData$Global_reactive_power)
##constructing graph
  png("plot4.png", width=480, height=480)
  par(mfrow = c(2, 2))
  ##1st plot
    plot(DateTime, GAP, type = "l", ylab = "Global Active Power", xlab = " ")
  ##2nd plot
    plot(DateTime, Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
  ##3rd plot
    plot(DateTime, SubMet1, type = "l", ylab = "Energy sub metering", xlab = " ")
    lines(DateTime, SubMet2, type = "l", col = "red")
    lines(DateTime, SubMet3, type = "l", col = "blue")
    legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  ##4th plot
    plot(DateTime, GRP, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
  ##end 
    dev.off()