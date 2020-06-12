library(datasets)

data <- read.table("household_power_consumption.txt",sep=";",header = TRUE)

data$fulldate <- paste(as.character(data$Date),as.character(data$Time),sep=" ")

data$fulldate <- as.POSIXlt(as.character(data$fulldate),format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(as.character(data$Date),format = "%d/%m/%Y")

DATE1 <- as.Date("2007-02-01")
DATE2 <- as.Date("2007-02-02")

data.timerange <- data[data$Date == DATE1 | data$Date == DATE2,]

data.timerange <- data.timerange[order(data.timerange$fulldate),]

data.timerange$Sub_metering_1 <- as.numeric(as.character(data.timerange$Sub_metering_1))
data.timerange$Sub_metering_2 <- as.numeric(as.character(data.timerange$Sub_metering_2))
data.timerange$Sub_metering_3 <- as.numeric(as.character(data.timerange$Sub_metering_3))


plot(x=data.timerange$fulldate,
     y=data.timerange$Sub_metering_1,
     type="S",
     xlab = "",
     ylab="Energy to Metering")
lines(data.timerange$fulldate, data.timerange$Sub_metering_2, col="red")
lines(data.timerange$fulldate, data.timerange$Sub_metering_3, col="blue")
legend("topright",legend=c("Submetering_1","Submetering_2","Submetering_3"), col=c("blue","red","black"),ncol=1,lty=c(1,1,1))

dev.print(png,file="plot3.png",width=480, height=480)
dev.off()