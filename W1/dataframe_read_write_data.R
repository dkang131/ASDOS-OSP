a=c(10,20,15,43,76,41)
a
b=factor(c("m","f","m","f","m","f"))
b
c=c(2,5,8,3,6,1)
c

myframe=data.frame(a,b,c)
myframe

colnames(myframe) = c("Age","Sex","Siblings")
myframe
myframe[,1] # myframe[1,2] 1 = baris , 2 kolom
myframe["Age"] # munculin kolom "Age"
myframe$Age # ngambil data dalam kolom "Age"
myframe[3,3]=2
myframe
myframe[,-2]

#write data
library('datasets')
data('Orange')
Orange
# getwd()
# setwd("C:/Users/darre/Desktop/ASDOS OSP/W1")
write.table(Orange, 'orange1.txt')
write.table(Orange, 'orange2.txt', col.names=F, row.names = F)
write.table(Orange, "orange3.txt", sep = "\t")
write.csv2(Orange, "orange4.csv")

#read txt
data = read.table("orange1.txt", header = T)

#read excel
library(readxl)
data_xl = read_excel("C:/Users/darre/Desktop/ASDOS OSP/W1")

# read csv
data_csv=read.csv("orange4.csv", sep=";", header=TRUE)
