data <- read.csv("household_power_consumption.txt", sep=";")
data$Date<-as.Date(data$Date,format="%d/%m/%Y")


subat <- data[data$Date %in% as.Date(c("2007-02-01","2007-02-02")),]
subat$Global_active_power <- as.numeric(paste(subat$Global_active_power,""))

png(file = "plot1.png", bg = "transparent",width=480,height=480)

hist(subat$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()