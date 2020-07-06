library(readr)
df <- read_delim("household_power_consumption.txt", 
                 ";", escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y"), 
                                                              Time = col_time(format = "%H:%M:%S")), 
                 trim_ws = TRUE)
df1 <- df[df$Date >= "2007-02-01" & df$Date <= "2007-02-02",]
df1$datetime <- as.POSIXct(paste(df1$Date, df1$Time), format="%Y-%m-%d %H:%M:%S")
plot(df1$datetime,df1$Sub_metering_1,type = "l",xlab = "",ylab = "Energy Metering") + 
  lines(df1$datetime,df1$Sub_metering_2,col = 'red')+ 
  lines(df1$datetime,df1$Sub_metering_3,col = 'blue') 

dev.copy(png,"plot3.png", width = 480, height = 480)
dev.off()
