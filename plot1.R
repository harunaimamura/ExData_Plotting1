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


png(filename='./plot1.png', width=480, height=480, unit="px")

hist(tidy$Global_active_power, col='red', 
     xlab='Global Active Power (kilowatts)',
     main='Global Active Power')

dev.off()
