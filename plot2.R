data <- read.csv("household_power_consumption.txt", sep=";")
data$Date<-as.Date(data$Date,format="%d/%m/%Y")

data$Global_active_power<-as.numeric(data$Global_active_power)

subat <- data[data$Date %in% as.Date(c("2007-02-01","2007-02-02")),]
subat$DateTime <- strptime(paste(subat$Date,subat$Time),"%Y-%m-%d %H:%M:%S")
subat$Global_active_power <- as.numeric(paste(subat$Global_active_power,""))

png(file = "plot2.png", bg = "transparent",width=480,height=480)


plot(subat$DateTime,subat$Global_active_power/1000*2,type="o",pch=NA,xlab="",ylab="Global Active Power (kilowatts)" )

dev.off()