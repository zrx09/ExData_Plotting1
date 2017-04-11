fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL,"Electric power consumption.zip",method="curl")
unzip("Electric power consumption.zip")
dataset<-read.csv("household_power_consumption.txt",header=T,sep=";",na.strings="?")

datetime<-paste(data$Date,data$Time)
datetime<-strptime(datetime,format="%d/%m/%Y %H:%M:%S")
dataset1<-cbind(data,datetime)
dataset1$Date<-as.Date(dataset1$Date,format="%d/%m/%Y")
dataset2<-dataset1[which((dataset1$Date=="2007-02-01")|(dataset1$Date=="2007-02-02")),]

png("plot3.png",width=480,height=480)

plot(dataset2$datetime,dataset2$Sub_metering_1,type='l',ylab = "Energy sub metering",xlab="")
points(dataset2$datetime,dataset2$Sub_metering_2,type='l',col="red")
points(dataset2$datetime,dataset2$Sub_metering_3,type='l',col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("red","blue","black"),cex=0.75)

dev.off()