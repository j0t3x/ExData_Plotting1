library(data.table)
library(tidyverse)
library(lubridate)
source("download.R")

data <- read_delim("household_power_consumption.txt", delim = ";")
data$Date = dmy(data$Date)
data <- filter(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))


png(filename = "plot4.png", width = 480, height = 480, units = "px", bg = "transparent")

par(mfrow = c(2,2))

#pot 1
with(data, 
   plot(
     x = ymd_hms(paste(Date, Time, sep= ' ')),
     y = Global_active_power,
     type = "l",
     ylab = "Global Active Power",
     xlab = ""
   )
)

#plot2
with(data, 
   plot(
     x = ymd_hms(paste(Date, Time, sep= ' ')),
     y = Voltage,
     type = "l",
     ylab = "Voltage",
     xlab = "datetime"
   )
)

#plot3
with(data, 
   plot(
     x = ymd_hms(paste(Date, Time, sep= ' ')),
     y = Sub_metering_1,
     type = "l",
     ylab = "Energy Sub Metering",
     xlab = ""
   )
)

with(data, 
   lines(
     x = ymd_hms(paste(Date, Time, sep= ' ')),
     y = Sub_metering_2,
     col = "red"
   )
)

with(data, 
   lines(
     x = ymd_hms(paste(Date, Time, sep= ' ')),
     y = Sub_metering_3,
     col = "blue"
   )
)


legend(
  "topright", 
  col=c("black", "red", "blue"), 
  legend = c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"),
  lwd = 1
)

#plot4
with(data, 
   plot(
     x = ymd_hms(paste(Date, Time, sep= ' ')),
     y = Global_reactive_power,
     type = "l",
     xlab = "datetime"
   )
)

dev.off()
