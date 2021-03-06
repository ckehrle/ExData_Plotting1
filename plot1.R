#
#
#
#
library(dplyr)
library(lubridate)

powr_consump_fil <- tbl_df(read.csv("./data/household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",stringsAsFactors=FALSE)) %>%
    filter(dmy(Date) %in% c(ymd('2007/02/01'),ymd('2007/02/02'))) %>% 
    mutate(Date = dmy(Date))      

png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))

hist(powr_consump_fil$Global_active_power,
        ylab="Frequeny",
        xlab="Global active power (kilowatts)",
        col="red",
        main=" Global active Power",
        ylim=c(0,1200)

     )
dev.off()
        