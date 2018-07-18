library(lubridate)
powerdata <- read.csv2("household_power_consumption.txt")
DateTime <- paste(powerdata$Date, powerdata$Time)
DT <- dmy_hms(DateTime)
data <- apply(powerdata, 2, as.numeric)
PD <- data.frame(DT, data[ , 3:9])
feb <- PD[PD$DT >= "2007-02-01" & PD$DT <= "2007-02-03", ]
png("plot2.png", width=480, height=480)
plot(feb$DT, feb$Global_active_power, pch = ".", xlab= "", ylab = "Global Active Power (kilowatts)")
lines(feb$DT, feb$Global_active_power)
dev.off()

