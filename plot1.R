library(data.table)
data<-fread("household_power_consumption.txt")
data$Date <-as.Date(data$Date,format= "%d/%m/%Y")
days<-subset(data,Date>="2007-02-01"& Date<="2007-02-02")

days$Global_active_power <-as.numeric(days$Global_active_power)
hist(days$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",
     main="Global Active Power")

dev.copy(png,file="plot1.png")
dev.off()