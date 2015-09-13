epc = read.table("household_power_consumption.txt", header = TRUE, sep = ";")
epc2 = with(epc,subset(epc,Date == "1/2/2007" | Date == "2/2/2007"))
datetime <- paste(epc2$Date, epc2$Time)
datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
epc2$DateTime <- datetime
epc2 <- epc2[,c(1,2,10,3:9)]
cols <- 4:9
epc2[cols] <- lapply(epc2[cols], as.numeric)
with(epc2, plot(DateTime,Global_active_power,ylab = "Global Active Power (kilowatts)", type = "n"))
with(epc2,lines(DateTime,Global_active_power))
dev.copy(png, file = "plot2.png")
dev.off()

