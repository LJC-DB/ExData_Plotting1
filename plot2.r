library(sqldf)
data = read.csv.sql('household_power_consumption.txt', header = T, sep = ';',
                    sql = 'select * from file where Date="1/2/2007" or Date="2/2/2007"')

data$ConvertedDate = strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S", tz = ' ')

Sys.setlocale("LC_TIME", "C")

plot(data$ConvertedDate, data$Global_active_power, type = 'l', ylab = 'Global Active Power (kilowatts)',
     xlab = '')

dev.copy(png, 'plot2.png', width = 480, height = 480)
dev.off()

