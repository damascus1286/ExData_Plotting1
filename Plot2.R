## R scripts for EDA assignment 1, Plot 2

## first get the household data into the working directory

##read in household power data

housepower <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors = FALSE, dec=".")

## convert household power data to date format. 

#subset to the appropriate dates (tried a different method this time)
housepower_sub <- housepower[housepower$Date %in% c("1/2/2007","2/2/2007") ,]


##make numeric active power variable

activePower <- as.numeric(housepower_sub$Global_active_power)

## convert date and time to coherent POSIX format
chrono <- strptime(paste(housepower_sub$Date, housepower_sub$Time, sep = " "), "%d/%m/%Y %H:%M:%S")


## plot the global active power over time and store it in a 480 x 480 PNG file

png("plot2.png", width=480, height=480)                          
plot(chrono, activePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()




