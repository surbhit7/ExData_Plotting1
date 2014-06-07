#Plot2
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



png("plot2.png",width=480,height=480)
with(data,plot(datetime,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="",main=""))
dev.off()


