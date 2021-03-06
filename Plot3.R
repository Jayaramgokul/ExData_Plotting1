hpc = read.table("household_power_consumption 2.txt",sep = ";", header = T)
hpc_true=subset(hpc, Date %in% c("1/2/2007","2/2/2007"))
DT <- strptime(paste(hpc_true$Date, hpc_true$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
NumGAP= as.numeric(levels(hpc_true$Global_active_power))[hpc_true$Global_active_power]
SM1 <- as.numeric(levels(hpc_true$Sub_metering_1))[hpc_true$Sub_metering_1]
SM2 <- as.numeric(levels(hpc_true$Sub_metering_2))[hpc_true$Sub_metering_2]
png("plot3.png", width=480, height=480)
plot(DT, SM1, type="l", ylab="Energy Sub metering", xlab="")
lines(DT, SM2, type="l", col="red")
lines(DT, hpc_true$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1.5, col=c("black", "red", "blue"))
dev.off()


