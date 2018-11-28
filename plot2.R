library(data.table)
library(tidyverse)
library(lubridate)
source("download.R")

data <- read_delim("household_power_consumption.txt", delim = ";")
data$Date = dmy(data$Date)
data <- filter(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))


png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "transparent")


with(data, 
   plot(
     x = ymd_hms(paste(Date, Time, sep= ' ')),
     y = Global_active_power,
     type = "l",
     ylab = "Global Active Power (Kilowatts)",
     xlab = ""
   )
)

dev.off()

