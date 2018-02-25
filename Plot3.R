source <- read.table("household_power_consumption.txt", header = T, 
                   sep = ";", na.strings = "?")
# convert the date variable to Date class
source$Date <- as.Date(source$Date, format = "%d/%m/%Y")

# Subset the source
source <- subset(source, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert dates and times
source$datetime <- strptime(paste(source$Date, source$Time), "%Y-%m-%d %H:%M:%S")

# Plot 3
source$datetime <- as.POSIXct(source$datetime)

attach(source)
plot(Sub_metering_1 ~ datetime, type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(Sub_metering_2 ~ datetime, col = "Red")
lines(Sub_metering_3 ~ datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()