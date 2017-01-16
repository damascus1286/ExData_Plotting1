## R scripts for EDA assignment 1, Plot 4

## first get the household data into the working directory

##read in household power data

housepower <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors = FALSE, dec=".")

## convert household power data to date format. 

#subset to the appropriate dates (tried a different method this time)
housepower_sub <- housepower[housepower$Date %in% c("1/2/2007","2/2/2007") ,]


##make numeric active power variable

activePower <- as.numeric(housepower_sub$Global_active_power)

##make numeric reactive power variable

reactivePower <- as.numeric(housepower_sub$Global_reactive_power)

## make voltage reactive power variable
voltage <- as.numeric(housepower_sub$Voltage)

## convert date and time to coherent POSIX format
chrono <- strptime(paste(housepower_sub$Date, housepower_sub$Time, sep = " "), "%d/%m/%Y %H:%M:%S")


# open a PNG display device

png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2)) 

plot(chrono, activePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(chrono, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(chrono, su1, type="l", ylab="Energy sub metering", xlab="")
lines(chrono, sub2, type="l", col="red")
lines(chrono, sub3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=1, col=c("black", "red", "blue"), bty="o")

plot(chrono, reactivePower, type="l", xlab="chrono", ylab="Global_reactive_power")

dev.off()