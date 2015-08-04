#
#
#
#
library(dplyr)
library(lubridate)

powr_consump_fil <- tbl_df(read.csv("./data/household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",stringsAsFactors=FALSE)) %>%
    filter(dmy(Date) %in% c(ymd('2007/02/01'),ymd('2007/02/02'))) %>% 
    mutate(Date = parse_date_time(paste(Date,Time),"%d%m%y %H%M%S"))   

png(filename = "plot4.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))
par(mfrow=c(2,2))
plot(powr_consump_fil$Global_active_power ~ powr_consump_fil$Date,
     type="l",
     ylab="Global active Power",
     xlab="")

plot(powr_consump_fil$Voltage ~ powr_consump_fil$Date,
     type="l",
     ylab="Voltage",
     xlab="datetime")

plot(powr_consump_fil$Sub_metering_1 ~ powr_consump_fil$Date,
     type="l",
     ylab="Energy sub metering",
     xlab="",
     col="black")
lines(powr_consump_fil$Sub_metering_2 ~ powr_consump_fil$Date,
      col="red")
lines(powr_consump_fil$Sub_metering_3 ~ powr_consump_fil$Date,
      col="blue")
legend("topright", legend = names(powr_consump_fil[,7:9]), col=c("black","red","blue"),pch=1)

plot(powr_consump_fil$Global_reactive_power ~ powr_consump_fil$Date,
     type="l",
     ylab="Global reactive power",
     xlab="datetime")

dev.off()
    