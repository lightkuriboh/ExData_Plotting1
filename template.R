
library(sqldf)

data_path <- 'raw_data/household_power_consumption.txt'

start_date <- as.Date('2007-02-01')
end_date <- as.Date('2007-02-02')

my_data <- read.csv(data_path, sep = ';')
my_data <- subset(my_data, as.Date(my_data$Date, format = '%d/%m/%Y') >= start_date &
                      as.Date(my_data$Date, format = '%d/%m/%Y') <= end_date)

png('output/plot.png')



dev.off()
