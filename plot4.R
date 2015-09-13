epc = read.table("household_power_consumption.txt", header = TRUE, sep = ";")
epc2 = with(epc,subset(epc,Date == "1/2/2007" | Date == "2/2/2007"))
datetime <- paste(epc2$Date, epc2$Time)
datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
epc2$DateTime <- datetime
epc2 <- epc2[,c(1,2,10,3:9)]
cols <- 4:9
epc2[cols] <- lapply(epc2[cols], as.numeric)
par(mfrow = c(2,2), mar = c(4,4,1,1))
with(epc2, {
    plot(DateTime,Global_active_power,ylab = "Global Active Power", type = "l", xlab = "")
    plot(DateTime,Voltage,ylab = "Voltage", type = "l", xlab = "datetime")
    {
    plot(DateTime,Sub_metering_1,ylab = "Energy sub metering", type = "n", xlab = "")
    lines(DateTime,Sub_metering_1, col = "black")
    lines(DateTime,Sub_metering_2, col = "red")
    lines(DateTime,Sub_metering_3, col = "blue")
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), pch = "-")
    }
    plot(DateTime,Global_reactive_power,ylab = "Global_reactive_power", type = "l", xlab = "datetime")
    
})

dev.copy(png, file = "plot4.png")
dev.off()

