#setwd('./Documents/Learning/Coursera_DataScience/Course4/Assigment/ExData_Plotting1/')
library(lubridate)
library(dplyr)

# Reading raw data
ds <- read.table(file='../household_power_consumption.txt', 
                 header=T, sep=';', na.strings="?", 
                 stringsAsFactors = F)

tidy <- ds %>%
            mutate(Date = dmy(Date)) %>%
            mutate(Time = hms(Time)) %>%
            filter(Date == "2007-02-01" | Date == "2007-02-02")


png(filename='./plot2.png', width=480, height=480, unit="px")

plot(tidy$Global_active_power, type="l",
     ylab='Global Active Power (kilowatts)',
     xlab='', xaxt="n")

axis(side=1, at=c(1, 1441, 2881), 
     labe=c(as.character(wday(tidy$Date[1], label=T)),
            as.character(wday(tidy$Date[1]+1, label=T)),
            as.character(wday(tidy$Date[1]+2, label=T))))

dev.off()
