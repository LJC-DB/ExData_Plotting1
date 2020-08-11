library(sqldf)
data = read.csv.sql('household_power_consumption.txt', header = T, sep = ';',
                    sql = 'select * from file where Date="1/2/2007" or Date="2/2/2007"')

data$ConvertedDate = strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S", tz = ' ')

Sys.setlocale("LC_TIME", "C")

par(mfrow=c(2, 2))

with(data, {
  plot(ConvertedDate, Global_active_power, type = 'l', ylab = 'Global Active Power', xlab = '')
  plot(ConvertedDate, Voltage, type = 'l', ylab = 'Voltage', xlab = 'datetime')
  plot(ConvertedDate, Sub_metering_1, type = 'l', ylab = 'Energy sub metering', xlab = '')
  points(ConvertedDate, Sub_metering_2, type = 'l', col='red')
  points(ConvertedDate, Sub_metering_3, type = 'l', col='blue')
  legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'),
         lty=1, cex=0.5, box.lty=0)
  plot(ConvertedDate, Global_reactive_power, type = 'l', xlab = 'datetime')
})

dev.copy(png, 'plot4.png', width = 480, height = 480)
dev.off()

