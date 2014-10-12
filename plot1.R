## Draws the plot

plot1<- function(){
  ##Reads in the full file
  data<-read.table("household_power_consumption.txt", sep =";", header = TRUE, nrows=70000, stringsAsFactors=FALSE)

  ##subsets the data for the dates we care about

  datasub<-data[data$Date %in% c("2/1/2007","2/2/2007"),]
  print(datasub[1:10,])

  ##Draws the plot as requested
  hist(as(datasub$Global_active_power,"numeric"), col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power")
  
  ##Copy plot fomr screen device to a file
  
  dev.copy(png, file="plot1.png")
  dev.off()

}