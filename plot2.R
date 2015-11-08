#It is actually a lot faster just reading the specified rows needed in the first place
#Hence in plot2, plot3, and plot4, I read the specified rows directly
#Row numbers were obtained using Notepad++


#extract column names
name <- names(read.table('household_power_consumption.txt',header=T,sep=';',
                         stringsAsFactors=F,nrows=5))


#read data
data <- read.table('household_power_consumption.txt',sep=';',stringsAsFactors=F,
                   skip=66637,nrows=69517-66637,col.names=name)

#merge date and time to create data for the x axis
datetime <- strptime(paste(data$Date,data$Time),format='%d/%m/%Y %H:%M:%S')


#create graph
png('plot2.png',width=480,height=480,unit='px')
plot(datetime,data$Global_active_power,type='l',ylab='Global Active Power (kilowatts)',xlab='')

dev.off()
