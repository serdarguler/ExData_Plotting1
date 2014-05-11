data <- read.csv("household_power_consumption.txt", sep=";")
data$Date<-as.Date(data$Date,format="%d/%m/%Y")

subat <- data[data$Date %in% as.Date(c("2007-02-01","2007-02-02")),]

subat$DateTime <- strptime(paste(subat$Date,subat$Time),"%Y-%m-%d %H:%M:%S")
subat$Sub_metering_1 <- as.numeric(paste(subat$Sub_metering_1,""))
subat$Sub_metering_2 <- as.numeric(paste(subat$Sub_metering_2,""))
subat$Sub_metering_3 <- as.numeric(paste(subat$Sub_metering_3,""))

png(file = "plot3.png", bg = "transparent",width=480,height=480)


plot(subat$DateTime,subat$Sub_metering_1,type="o",pch=NA,xlab="",ylab="Energy Sub Metering")
points(subat$DateTime,subat$Sub_metering_2,type="o",pch=NA,col="red")
points(subat$DateTime,subat$Sub_metering_3,type="o",pch=NA,col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), pch = NA ,col=c("black","red","blue"),lty=1)
dev.off()