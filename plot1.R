#Read data and subsetting data
data <- read.table('household_power_consumption.txt',header=T,sep=';',stringsAsFactors=F)

index <- data[,'Date']=='1/2/2007'|data[,'Date']=='2/2/2007'
data <- data[index,]

#creating the graph
png('plot1.png',width=480,height=480,unit='px')
hist(as.numeric(data$Global_active_power),col='red',main='Global Active Power',xlab='Global Active Power (kilowatts)')

dev.off()
