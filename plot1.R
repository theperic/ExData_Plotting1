## Draws the plot

plot1<- function(){
  ##Reads in the full file
  data<-read.table("household_power_consumption.txt", sep =";", header = TRUE, nrows=70000, stringsAsFactors=FALSE)

  ##subsets the data for the dates we care about

  datasub<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
  
  png(file="plot1.png", height=480, width = 480)
  
  ##Draws the plot as requested
  hist(as(datasub$Global_active_power,"numeric"), axes=FALSE, col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power")
  
  ##add axis at matching intervals to the smaple
  axis(1, at=c(0,2, 4, 6))
  axis(2, at=c(0,200, 400, 600, 800,1000,1200))
  
  dev.off()

}