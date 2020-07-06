library(readr)
df <- read_delim("household_power_consumption.txt", 
                 ";", escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y"), 
                                                              Time = col_time(format = "%H:%M:%S")), 
                 trim_ws = TRUE)
df1 <- df[df$Date >= "2007-02-01" & df$Date <= "2007-02-02",]
hist(df1$Global_active_power, col = "red", xlab = "Global Active Power (killowats)",main ="Global Active Power")
dev.copy(png,"plot1.png", width = 480, height = 480)
dev.off()
