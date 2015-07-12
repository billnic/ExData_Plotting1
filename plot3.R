Electric <- read.table(file.choose(),
                       header=TRUE, sep=";",na.strings = "?",
                       stringsAsFactors = FALSE)
Elec<-filter(Electric,Date=="1/2/2007" | Date=="2/2/2007")
rm(Electric)
a<-strptime(paste(Elec$Date, Elec$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
Elec<-cbind(Elec,DayTime=as.POSIXct(a))
rm(a)
par(mar=c(3,5,4,1))
plot(as.numeric(Elec$Sub_metering_1),xaxt='n',type = "l",col="black",
     ylab = "Energy sub meetering")
lines(as.numeric(Elec$Sub_metering_2),col="red")
lines(as.numeric(Elec$Sub_metering_3),col="blue")
axis(1, at=c(1,1441,2881),labels=c('Thu','Fri','Sat'))
legend("topright",lwd=2,col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file = "plot3.png",width = 480, height = 480)
dev.off()