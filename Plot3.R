## R scripts for EDA assignment 1 - plot 3

## first get the household data into the working directory

##read in household power data

housepower <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors = FALSE, dec=".")


#subset to the appropriate dates (tried a different method this time)
housepower_sub <- housepower[housepower$Date %in% c("1/2/2007","2/2/2007") ,]

activePower <- as.numeric(housepower_sub$Global_active_power)

## convert date and time to coherent POSIX format
chrono <- strptime(paste(housepower_sub$Date, housepower_sub$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

##Subset submetering data
sub1 <- as.numeric(housepower_sub$Sub_metering_1)
sub2 <- as.numeric(housepower_sub$Sub_metering_2)
sub3 <- as.numeric(housepower_sub$Sub_metering_3)



png("plot3.png", width=480, height=480)

plot(chrono, sub1, type="l", ylab="Energy sub metering", xlab="")
lines(chrono, sub2, type="l", col="red")
lines(chrono, sub3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"))
dev.off()

