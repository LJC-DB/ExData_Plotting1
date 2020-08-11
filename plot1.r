library(sqldf)
data = read.csv.sql('household_power_consumption.txt', header = T, sep = ';',
                    sql = 'select * from file where Date="1/2/2007" or Date="2/2/2007"')

data$ConvertedDate = strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S", tz = ' ')

hist(data$Global_active_power, col = 'red', xlab = 'Global Active Power (kilowatts)',
     main = 'Global Active Power')

dev.copy(png, 'plot1.png', width = 480, height = 480)
dev.off()
