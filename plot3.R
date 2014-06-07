#Plot3
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

png("plot3.png")
with(data,{plot(datetime,Sub_metering_1,type="l",xlab="")
     points(datetime,Sub_metering_2,type="l",col="red")
     points(datetime,Sub_metering_3,type="l",col="blue")
     legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
})
dev.off()

