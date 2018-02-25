## Load the source
source <- read.table("household_power_consumption.txt", header = T, 
                   sep = ";", na.strings = "?")
# convert the date variable to Date class
source$Date <- as.Date(source$Date, format = "%d/%m/%Y")

# Subset the source
source <- subset(source, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert dates and times
source$datetime <- strptime(paste(source$Date, source$Time), "%Y-%m-%d %H:%M:%S")

# Plot 2
source$datetime <- as.POSIXct(source$datetime)
attach(source)
plot(Global_active_power ~ datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()