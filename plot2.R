## Draws the plot

plot2<- function(){
  ##Reads in the full file
  data<-read.table("household_power_consumption.txt", sep =";", header = TRUE, nrows=70000, stringsAsFactors=FALSE)
  
  ##subsets the data for the dates we care about
  
  datasub<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
  print(dim(datasub))
  png(file="plot2.png", height=480, width = 480)

  ##Draws the plot as requested
  plot(strptime(paste(as.Date(datasub$Date,format="%d/%m/%Y"),datasub$Time), "%Y-%m-%d %H:%M:%S"),
       as(datasub$Global_active_power,"numeric"),
       ylab="Global Active Power (kilowatts)", xlab="",type="l", main="")
  

  dev.off()
  
}
