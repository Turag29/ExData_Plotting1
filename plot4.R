## Read data
power <- read.csv("./household_power_consumption.txt", sep=";", dec=".", stringsAsFactors = FALSE)
## Subset data
data<-subset(power,power$Date=="1/2/2007"|power$Date=="2/2/2007")
## Convert dates and data
data$DateTime<-strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
data$Global_active_power<-as.numeric(data$Global_active_power)


## Draw plot and write to file
png(filename="plot4.png",width=480,height=480)
## Define layout of 2 by 2
par(mfrow=c(2,2))

plot(data$DateTime,data$Global_active_power,type="n",xlab="",ylab="Global Active Power")
lines(data$DateTime,data$Global_active_power)

with(data, plot(DateTime,Voltage,type="n"))
with(data,lines(DateTime,Voltage))

plot(data$DateTime,data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(data$DateTime,data$Sub_metering_1)
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")
legend("topright",bty="n", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(data, plot(DateTime,Global_reactive_power,type="l"))

dev.off()