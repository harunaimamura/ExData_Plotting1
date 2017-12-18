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


png(filename='./plot3.png', width=480, height=480, unit="px")

plot(tidy$Sub_metering_1, type="n",
     ylab='Energy sub metering',
     xlab='', xaxt="n")

points(tidy$Sub_metering_1, type="l", col='black')
points(tidy$Sub_metering_2, type="l", col='red')
points(tidy$Sub_metering_3, type="l", col='blue')

legend("topright", lty=c(1, 1, 1), 
       col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

axis(side=1, at=c(1, 1441, 2881), 
     labe=c(as.character(wday(tidy$Date[1], label=T)),
            as.character(wday(tidy$Date[1]+1, label=T)),
            as.character(wday(tidy$Date[1]+2, label=T))))

dev.off()
