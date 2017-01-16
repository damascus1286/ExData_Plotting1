## R scripts for EDA assignment 1

## first get the household data into the working directory

##read in household power data

housepower <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors = FALSE, dec=".")

#PLOT 1

#Make a copy of housepower
housepower_rev <- housepower

housepower_rev$Date <- as.Date(housepower$Date, format = ("%d/%m/%Y"))

##subset to the appropriate dates

housepower_sub = housepower_rev[ which(housepower_rev$Date== "2007-02-01" | housepower_rev$Date =="2007-02-02"), ]

activePower <- as.numeric(housepower_sub$Global_active_power)

##Make the histogram for plot 1
png("plot1.png", width=480, height = 480)
hist(x = activePower, col = "red", ylab = "Frequency", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()