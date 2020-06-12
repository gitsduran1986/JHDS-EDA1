library(datasets)

data <- read.table("household_power_consumption.txt",sep=";",header = TRUE)

data$fulldate <- paste(as.character(data$Date),as.character(data$Time),sep=" ")

data$fulldate <- as.POSIXlt(as.character(data$fulldate),format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(as.character(data$Date),format = "%d/%m/%Y")

DATE1 <- as.Date("2007-02-01")
DATE2 <- as.Date("2007-02-02")

data.timerange <- data[data$Date == DATE1 | data$Date == DATE2,]

data.timerange$Global_active_power <- as.numeric(as.character(data.timerange$Global_active_power))

par(mfrow=c(1,1))
hist(x=data.timerange$Global_active_power, 
     xlab="Global Active Power (kilowatts)",
     col="red",
     main="Global Active Power",
     xlim = c(0,6.5))

dev.print(png,file="plot1.png",width=480, height=480)
dev.off()