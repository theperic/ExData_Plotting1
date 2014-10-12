## Draws the plot

plot3<- function(){
  ##Reads in the full file
  data<-read.table("household_power_consumption.txt", sep =";", header = TRUE, nrows=70000, stringsAsFactors=FALSE)
  
  ##subsets the data for the dates we care about
  
  datasub<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
  print(dim(datasub))
  ##png(file="plot3.png", height=480, width = 480)
  
  x<-strptime(paste(as.Date(datasub$Date,format="%d/%m/%Y"),datasub$Time), "%Y-%m-%d %H:%M:%S")
  
  ##Draws the plot as requested
 
  plot(strptime(paste(as.Date(datasub$Date,format="%m/%d/%Y"),datasub$Time), "%Y-%m-%d %H:%M:%S"),
       as(datasub$Sub_metering_3,"numeric"), type="n",xlab="Energy Sub Power (kilowats)",ylab="")
       
  ##lines(strptime(paste(as.Date(datasub$Date,format="%m/%d/%Y"),datasub$Time), "%Y-%m-%d %H:%M:%S"),as(datasub$Sub_metering_1,"numeric"))
  
  lines(strptime(paste(as.Date(datasub$Date,format="%m/%d/%Y"),datasub$Time), "%Y-%m-%d %H:%M:%S"),
       as(datasub$Sub_metering_2,"numeric"),col="red")
  
  lines(strptime(paste(as.Date(datasub$Date,format="%m/%d/%Y"),datasub$Time), "%Y-%m-%d %H:%M:%S"),
       as(datasub$Sub_metering_3,"numeric"),col="blue")
  
  
  
  ##dev.off()
  
}
