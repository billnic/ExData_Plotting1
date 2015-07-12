if (!"dplyr" %in% installed.packages()){ install.packages("dplyr")}
library(dplyr)
Electric <- read.table(file.choose(),
                       header=TRUE, sep=";",na.strings = "?",
                       stringsAsFactors = FALSE)
Elec<-filter(Electric,Date=="1/2/2007" | Date=="2/2/2007")
rm(Electric)
a<-strptime(paste(Elec$Date, Elec$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
Elec<-cbind(Elec,DayTime=as.POSIXct(a))
rm(a)
png(file = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2),oma=c(0,0,0,0),mar=c(5,4,2,1))
plot(Elec$DayTime,Elec$Global_active_power,type="l",ylab="Global Active Power",xlab="")
plot(Elec$DayTime,Elec$Voltage,type="l",xlab="datetime",ylab="Voltage")

plot(as.numeric(Elec$Sub_metering_1),xaxt='n',type = "l",col="black",
     ylab = "Energy sub meetering",xlab = "")
lines(as.numeric(Elec$Sub_metering_2),col="red",xlab="")
lines(as.numeric(Elec$Sub_metering_3),col="blue")
axis(1, at=c(1,1441,2881),labels=c('Thu','Fri','Sat'))
legend("topright",lwd=2,col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n")
plot(Elec$DayTime,Elec$Global_reactive_power,type="l",
     xlab="datetime",ylab="Global_reactive_power")
#####dev.copy(png, file = "plot4.png",width = 480, height = 480)
dev.off()