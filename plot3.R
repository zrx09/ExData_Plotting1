fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL,"Electric power consumption.zip",method="curl")
unzip("Electric power consumption.zip")
data<-read.csv("household_power_consumption.txt",header=T,sep=";",na.strings="?")

datetime<-paste(data$Date,data$Time)
datetime<-strptime(datetime,format="%d/%m/%Y %H:%M:%S")
data1<-cbind(data,datetime)
data1$Date<-as.Date(data1$Date,format="%d/%m/%Y")
data2<-data1[which((data1$Date=="2007-02-01")|(data1$Date=="2007-02-02")),]

png("plot3.png")

plot(data2$datetime,data2$Sub_metering_1,type='l',ylab = "Energy sub metering",xlab="")
points(data2$datetime,data2$Sub_metering_2,type='l',col="red")
points(data2$datetime,data2$Sub_metering_3,type='l',col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("red","blue","black"),cex=0.75)

dev.off()