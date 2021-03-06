##read the "household_power_consumption.txt" in working directory 
x<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
##change the Date class
x$Date<-as.Date(as.character(x$Date),format="%d/%m/%Y")
##subset the data.frame to data from the dates 2007-02-01 and 2007-02-02
y<-subset(x,x$Date=="2007-02-01")
z<-subset(x,x$Date=="2007-02-02")
m<-rbind(y,z)
##put Date and Time together
m$date_time<-as.POSIXct(paste(m$Date,as.character(m$Time)))
##change the vectors' classes to numeric
m$Global_active_power<-as.numeric(levels(m$Global_active_power))[m$Global_active_power]
m$Global_reactive_power<-as.numeric(levels(m$Global_reactive_power))[m$Global_reactive_power]
m$Voltage<-as.numeric(levels(m$Voltage))[m$Voltage]
m$Sub_metering_1<-as.numeric(levels(m$Sub_metering_1))[m$Sub_metering_1]
m$Sub_metering_2<-as.numeric(levels(m$Sub_metering_2))[m$Sub_metering_2]
##draw the plot1.png
png(filename="plot1.png",width=480,height=480,units="px")
hist(m$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.off()
