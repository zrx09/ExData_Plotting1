fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL,"Electric power consumption.zip",method="curl")
unzip("Electric power consumption.zip")
dataset<-read.csv("household_power_consumption.txt",header=T,sep=";",na.strings="?")

datetime<-paste(data$Date,data$Time)
datetime<-strptime(datetime,format="%d/%m/%Y %H:%M:%S")
dataset1<-cbind(data,datetime)
dataset1$Date<-as.Date(dataset1$Date,format="%d/%m/%Y")
dataset2<-dataset1[which((dataset1$Date=="2007-02-01")|(dataset1$Date=="2007-02-02")),]

png("plot1.png",width=480,heigh=480)
hist(dataset2$Global_active_power,col="red",xlab = "Global Active Power (kilowatts)",main="Global Active Power")

dev.off()