data <- read.csv("household_power_consumption.txt", sep=";")
data$Date<-as.Date(data$Date,format="%d/%m/%Y")

data$Global_active_power<-as.numeric(data$Global_active_power)

subat <- data[data$Date %in% as.Date(c("2007-02-01","2007-02-02")),]
subat$DateTime <- strptime(paste(subat$Date,subat$Time),"%Y-%m-%d %H:%M:%S")
subat$Global_active_power <- as.numeric(paste(subat$Global_active_power,""))
subat$Voltage <- as.numeric(paste(subat$Voltage,""))
subat$Sub_metering_1 <- as.numeric(paste(subat$Sub_metering_1,""))
subat$Sub_metering_2 <- as.numeric(paste(subat$Sub_metering_2,""))
subat$Sub_metering_3 <- as.numeric(paste(subat$Sub_metering_3,""))
subat$Global_reactive_power <- as.numeric(paste(subat$Global_reactive_power,""))

png(file = "plot4.png", bg = "transparent",width=480,height=480)


par(mfrow=c(2,2))

plot(subat$DateTime,subat$Global_active_power/1000*2,type="o",pch=NA,xlab="",ylab="Global Active Power")
plot(subat$DateTime,subat$Voltage ,type="o",pch=NA,xlab="datetime",ylab="Voltage")

plot(subat$DateTime,subat$Sub_metering_1,type="o",pch=NA,xlab="",ylab="Energy Sub Metering")
points(subat$DateTime,subat$Sub_metering_2,type="o",pch=NA,col="red")
points(subat$DateTime,subat$Sub_metering_3,type="o",pch=NA,col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), pch = NA ,col=c("black","red","blue"),lty=1,bty="n")


plot(subat$DateTime,subat$Global_reactive_power ,type="o",pch=NA,xlab="datetime",ylab="Global_reactive_power")

dev.off()