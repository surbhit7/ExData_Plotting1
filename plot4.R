#Plot4
setwd("D:/Courses/Exploratory Data Analysis/projects")
data=read.table("household_power_consumption.txt",nrows=400000,header=T,sep=";",na.strings="?")
datanew=data[data$Date,]
data$Date=as.Date(data$Date,"%d/%m/%Y")
data=data[(as.POSIXlt(data$Date)$mday==1|as.POSIXlt(data$Date)$mday==2)&(as.POSIXlt(data$Date)$year==as.POSIXlt("2007/2/2")$year)&(months(data$Date)=="February"),]

datestring=paste(data$Date,data$Time)
datestring
# 2007-02-02 23:58:00
datetime=strptime(datestring,"%Y-%m-%d %H:%M:%S") #Time object now
#head(datetime)
data=cbind(data,datetime)

png("plot4.png",width=480,height=480)
par("mfrow"=c(2,2))
plota= with(data,plot(datetime,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="",main=""))

plotb = with(data,plot(datetime,Voltage ,type="l",main=""))
plotc= with(data,{plot(datetime,Sub_metering_1,type="l",xlab="")
           points(Sub_metering_2,type="l",col="red")
           points(Sub_metering_3,type="l",col="blue")
           legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
})

plotd= with(data,plot(datetime,Global_reactive_power ,type="l",main=""))
dev.off()
