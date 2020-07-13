
library(sqldf)

data_path <- 'raw_data/household_power_consumption.txt'

start_date <- as.Date('2007-02-01')
end_date <- as.Date('2007-02-02')

my_data <- read.csv(data_path, sep = ';')
my_data <- subset(my_data, as.Date(my_data$Date, format = '%d/%m/%Y') >= start_date &
                      as.Date(my_data$Date, format = '%d/%m/%Y') <= end_date)

names(my_data)
my_data$Global_active_power <- as.numeric(as.character(my_data$Global_active_power))
dim(my_data)

png('plot1.png')

hist(
    my_data$Global_active_power,
    col = 'red',
    main = 'Global Active Power',
    xlab = 'Global Active Power (kilowatts)',
    ylab = 'Frequency',
    axes = F,
    freq = T,
    xlim = c(0, 6)
)
axis(side = 1, at = seq(0, 6, 2), labels = seq(0, 6, 2))
axis(side = 2, at = seq(0, 1200, 200), labels = seq(0, 1200, 200))
dev.off()
