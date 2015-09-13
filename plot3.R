epc = read.table("household_power_consumption.txt", header = TRUE, sep = ";")
epc2 = with(epc,subset(epc,Date == "1/2/2007" | Date == "2/2/2007"))
datetime <- paste(epc2$Date, epc2$Time)
datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
epc2$DateTime <- datetime
epc2 <- epc2[,c(1,2,10,3:9)]
cols <- 4:9
epc2[cols] <- lapply(epc2[cols], as.numeric)
with(epc2, plot(DateTime,Sub_metering_1,ylab = "Energy sub metering", type = "n", xlab = ""))
with(epc2,lines(DateTime,Sub_metering_1, col = "black"))
with(epc2,lines(DateTime,Sub_metering_2, col = "red"))
with(epc2,lines(DateTime,Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), pch = "-")
dev.copy(png, file = "plot3.png")
dev.off()

