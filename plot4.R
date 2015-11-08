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
png('plot4.png',width=480,height=480,unit='px')
par(mfcol=c(2,2))
plot(datetime,data$Global_active_power,type='l',ylab='Global Active Power (kilowatts)',xlab='')
with(data,{
    plot(datetime,Sub_metering_1,type='n',ylab='Energy sub metering',xlab='')
    lines(datetime,Sub_metering_1,col='black')
    lines(datetime,Sub_metering_2,col='red')
    lines(datetime,Sub_metering_3,col='blue')
    legend('topright',bty='n',lty=c(1,1,1),col=c('black','red','blue'),
           legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
})
with(data,plot(datetime,Voltage,type='l'))
with(data,plot(datetime,Global_reactive_power,type='l'))

dev.off()

