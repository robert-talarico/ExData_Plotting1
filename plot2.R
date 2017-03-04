library(data.table)
data<-fread("household_power_consumption.txt")
data$Date <-as.Date(data$Date,format= "%d/%m/%Y")
days<-subset(data,Date>="2007-02-01"& Date<="2007-02-02")
days$dateTime <- paste(days$Date, days$Time)
days$dateTime <- as.POSIXct(days$dateTime, format="%Y-%m-%d %H:%M:%S")

with(days,plot(dateTime,Global_active_power,type="l",
               ylab="Global Active Power (kilowatts)",xlab=""))

dev.copy(png,file="plot2.png")
dev.off()