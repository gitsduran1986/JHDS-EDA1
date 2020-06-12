library(datasets)

data <- read.table("household_power_consumption.txt",sep=";",header = TRUE)

data$fulldate <- paste(as.character(data$Date),as.character(data$Time),sep=" ")

data$fulldate <- as.POSIXlt(as.character(data$fulldate),format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(as.character(data$Date),format = "%d/%m/%Y")

DATE1 <- as.Date("2007-02-01")
DATE2 <- as.Date("2007-02-02")

data.timerange <- data[data$Date == DATE1 | data$Date == DATE2,]

data.timerange$Global_active_power <- as.numeric(as.character(data.timerange$Global_active_power))

data.timerange <- data.timerange[order(data.timerange$fulldate),]

plot(x=data.timerange$fulldate,
     y=data.timerange$Global_active_power,
     type="S",
     xlab = "",
     ylab="Global Active Power (kilowatts)")

dev.print(png,file="plot2.png",width=480, height=480)
dev.off()