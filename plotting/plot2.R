
library(sqldf)

data_path <- 'raw_data/household_power_consumption.txt'

start_date <- as.Date('2007-02-01')
end_date <- as.Date('2007-02-02')

my_data <- read.csv(data_path, sep = ';')
my_data <- subset(my_data, as.Date(my_data$Date, format = '%d/%m/%Y') >= start_date &
                      as.Date(my_data$Date, format = '%d/%m/%Y') <= end_date)

dim(my_data)
names(my_data)

my_data$Global_active_power <- as.numeric(as.character(my_data$Global_active_power))
head(my_data)
class(my_data$Date)

head(paste(my_data$Date, my_data$Time))
my_date_time <- as.POSIXlt(paste(my_data$Date, my_data$Time), format = '%d/%m/%Y %H:%M:%S')
head(my_date_time)

any(is.na(my_date_time))
any(is.na(my_data$Global_active_power))
length(my_data$Global_active_power) == length(my_date_time)
head(strptime(my_date_time))


png('output/plot2.png')
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

dev.off()
