library(sqldf)
data = read.csv.sql('household_power_consumption.txt', header = T, sep = ';',
                    sql = 'select * from file where Date="1/2/2007" or Date="2/2/2007"')

data$ConvertedDate = strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S", tz = ' ')

Sys.setlocale("LC_TIME", "C")

plot(data$ConvertedDate, data$Sub_metering_1, type = 'l', ylab = 'Energy sub metering', xlab = '')
points(data$ConvertedDate, data$Sub_metering_2, type = 'l', col='red')
points(data$ConvertedDate, data$Sub_metering_3, type = 'l', col='blue')
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'),
       lty=1, cex=0.8)

dev.copy(png, 'plot3.png', width = 480, height = 480)
dev.off()

