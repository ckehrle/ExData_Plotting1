#
#
#
#
library(dplyr)
library(lubridate)

powr_consump_fil <- tbl_df(read.csv("./data/household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",stringsAsFactors=FALSE)) %>%
    filter(dmy(Date) %in% c(ymd('2007/02/01'),ymd('2007/02/02'))) %>% 
    mutate(Date = parse_date_time(paste(Date,Time),"%d%m%y %H%M%S"))   

png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))

plot(powr_consump_fil$Sub_metering_1 ~ powr_consump_fil$Date,
     type="l",
     ylab="Energy sub metering",
     xlab="",
     col="black")
lines(powr_consump_fil$Sub_metering_2 ~ powr_consump_fil$Date,
     col="red")
lines(powr_consump_fil$Sub_metering_3 ~ powr_consump_fil$Date,
     col="blue")
legend("topright", legend = 1:3, col=1:3, pch=1)
dev.off()
