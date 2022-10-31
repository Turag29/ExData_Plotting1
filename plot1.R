## Read data
power <- read.csv("./household_power_consumption.txt", sep=";", dec=".", stringsAsFactors = FALSE)
## Subset data
data<-subset(power,power$Date=="1/2/2007"|power$Date=="2/2/2007")
## Convert dates and data
data$DateTime<-strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
data$Global_active_power<-as.numeric(data$Global_active_power)

## Draw histogram and write to file
png(filename="plot1.png",width=480,height=480)
hist(data$Global_active_power,breaks=16, col="red",main="Global Active Power", xlab="Global Active Power(kilowatts)")
dev.off()