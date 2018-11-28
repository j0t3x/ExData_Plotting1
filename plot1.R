library(data.table)
library(tidyverse)
library(lubridate)
source("download.R")

data <- read_delim("household_power_consumption.txt", delim = ";")
data$Date = dmy(data$Date)
data <- filter(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))


png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "transparent")


with(data, 
  hist(
    Global_active_power, 
    col = "red",
    xlab="Global active Power",
    main = "Global Active Power"
    )
)

dev.off()