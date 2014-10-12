

plot4<- function(){
  ##Reads in the full file
  data<-read.table("household_power_consumption.txt", sep =";", header = TRUE, nrows=70000, stringsAsFactors=FALSE)
  
  ##subsets the data for the dates we care about
  
  datasub<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
  
  
  
  png(file="plot4.png", height=480, width = 480)
  
  par(mfrow=c(2,2))
  
  
  ##Draws the plot as requested
  plot(strptime(paste(as.Date(datasub$Date,format="%d/%m/%Y"),datasub$Time), "%Y-%m-%d %H:%M:%S"),
       as(datasub$Global_active_power,"numeric"),
       ylab="Global Active Power (kilowatts)", xlab="",type="l", main="")
  
  plot(strptime(paste(as.Date(datasub$Date,format="%d/%m/%Y"),datasub$Time), "%Y-%m-%d %H:%M:%S"),
       as(datasub$Voltage,"numeric"),
       ylab="Voltage", xlab="datetime",type="l", main="")
  
  
  plot(strptime(paste(as.Date(datasub$Date,format="%d/%m/%Y"),datasub$Time), "%Y-%m-%d %H:%M:%S"),
       as(datasub$Sub_metering_1,"numeric"), type="n",xlab="Energy Sub Power (kilowats)",ylab="")
  
  lines(strptime(paste(as.Date(datasub$Date,format="%d/%m/%Y"),datasub$Time), "%Y-%m-%d %H:%M:%S"),as(datasub$Sub_metering_1,"numeric"))
  
  lines(strptime(paste(as.Date(datasub$Date,format="%d/%m/%Y"),datasub$Time), "%Y-%m-%d %H:%M:%S"),
        as(datasub$Sub_metering_2,"numeric"),col="red")
  
  lines(strptime(paste(as.Date(datasub$Date,format="%d/%m/%Y"),datasub$Time), "%Y-%m-%d %H:%M:%S"),
        as(datasub$Sub_metering_3,"numeric"),col="blue")
  
  legend("topright", lwd=1, col=c("black", "red","blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(strptime(paste(as.Date(datasub$Date,format="%d/%m/%Y"),datasub$Time), "%Y-%m-%d %H:%M:%S"),
       as(datasub$Global_reactive_power,"numeric"),
       ylab="Global_reactive_power", xlab="datetime",type="l", main="")
  
  
  dev.off()
  
}
