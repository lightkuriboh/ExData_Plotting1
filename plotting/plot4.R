
library(sqldf)

data_path <- 'raw_data/household_power_consumption.txt'

start_date <- as.Date('2007-02-01')
end_date <- as.Date('2007-02-02')

my_data <- read.csv(data_path, sep = ';')
my_data <- subset(my_data, as.Date(my_data$Date, format = '%d/%m/%Y') >= start_date &
                      as.Date(my_data$Date, format = '%d/%m/%Y') <= end_date)

my_data$Global_active_power <- as.numeric(as.character(my_data$Global_active_power))

my_date_time <- as.POSIXlt(paste(my_data$Date, my_data$Time), format = '%d/%m/%Y %H:%M:%S')

png('output/plot4.png')

par(mfrow = c(2, 2))


plot(my_date_time,
    my_data$Global_active_power,
    ylab = 'Global Active Power (kilowatts)',
    col = 'black',
    type = 'l',
    xlab = '',
    axes = F
)

axis(side = 2, at = seq(0, 6, 2), labels = seq(0, 6, 2))
axis(side = 1, at = seq(min(my_date_time), max(my_date_time), length.out = 3), labels = c('Thu', 'Fri', 'Sat'))
box(which = "plot", lty = "solid")


plot(my_date_time,
    my_data$Voltage,
    ylab = 'Voltage',
    col = 'black',
    type = 'l',
    xlab = 'datetime',
    axes = F
)
axis(side = 2, at = seq(234, 246, 4), labels = seq(234, 246, 4))
axis(side = 1, at = seq(min(my_date_time), max(my_date_time), length.out = 3), labels = c('Thu', 'Fri', 'Sat'))
box(which = "plot", lty = "solid")


plot(my_date_time,
    my_data$Sub_metering_1,
    ylab = 'Energy sub metering',
    col = 'black',
    type = 'l',
    xlab = '',
    axes = F
)

lines(my_date_time, my_data$Sub_metering_2, col = 'red')
lines(my_date_time, my_data$Sub_metering_3, col = 'blue')

axis(side = 2, at = seq(0, 30, 10), labels = seq(0, 30, 10))
axis(side = 1, at = seq(min(my_date_time), max(my_date_time), length.out = 3), labels = c('Thu', 'Fri', 'Sat'))

box(which = "plot", lty = "solid")

         
         
plot(my_date_time,
    my_data$Global_reactive_power,
    ylab = 'Global Reactive Power',
    col = 'black',
    type = 'l',
    xlab = '',
    axes = F
)

axis(side = 2, at = seq(0.0, 0.5, 0.1), labels = seq(0.0, 0.5, 0.1))
axis(side = 1, at = seq(min(my_date_time), max(my_date_time), length.out = 3), labels = c('Thu', 'Fri', 'Sat'))
box(which = "plot", lty = "solid")


dev.off()

