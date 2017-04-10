fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL,"Electric power consumption.zip",method="curl")
unzip("Electric power consumption.zip")
data<-read.csv("household_power_consumption.txt",header=T,sep=";",na.strings="?")

datetime<-paste(data$Date,data$Time)
datetime<-strptime(datetime,format="%d/%m/%Y %H:%M:%S")
data1<-cbind(data,datetime)
data1$Date<-as.Date(data1$Date,format="%d/%m/%Y")
data2<-data1[which((data1$Date=="2007-02-01")|(data1$Date=="2007-02-02")),]

png("plot2.png")

plot(data2$datetime,data2$Global_active_power,type='l',ylab = "Global Active Power (kilowatts)",xlab="")

dev.off()