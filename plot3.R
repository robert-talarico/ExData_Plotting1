library(data.table)
data<-fread("household_power_consumption.txt")
data$Date <-as.Date(data$Date,format= "%d/%m/%Y")
days<-subset(data,Date>="2007-02-01"& Date<="2007-02-02")
days$dateTime <- paste(days$Date, days$Time)
days$dateTime <- as.POSIXct(days$dateTime, format="%Y-%m-%d %H:%M:%S")

days$Sub_metering_1<-as.numeric(days$Sub_metering_1)
days$Sub_metering_2<-as.numeric(days$Sub_metering_2)
days$Sub_metering_3<-as.numeric(days$Sub_metering_3)

with(days,plot(dateTime,Sub_metering_1, type="l",xlab=""
               ,ylab="Energy Sub Metering"))
with(days,lines(dateTime,Sub_metering_2,col="red",type="l"))
with(days,lines(dateTime,Sub_metering_3,col="blue",type="l"))
legend("topright", col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1, lwd=1.5)

dev.copy(png,file="plot3.png")
dev.off()