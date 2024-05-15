# ETS Open Source Programming

setwd("C:/Users/darre/Desktop/ASDOS OSP/W8")

#### Number 1 ####
data1 <- read.csv('data_ets.csv', header = T, sep=";")
head(data1)
attach(data1)

prestige_label = matrix(0, nrow=nrow(data1))
for(i in 1:nrow(data1)){
  if(Prestige[i] > 80){
    prestige_label[i] = 1
  }else{
    prestige_label[i] = 0
  }
}

data2 <- data.frame(data1, prestige_label)
head(data2)

tapply(Income, prestige_label, mean)
tapply(Education, prestige_label, mean)
tapply(Prestige, prestige_label, mean)

# scatterplot Income vs Education
colors <- c("red", "green")
win.graph()
plot(Income, Education, col=colors[factor(prestige_label)])
legend("topleft", legend = levels(factor(prestige_label)), col = colors, pch=1)
# scatterplot Income vs Prestige
win.graph()
plot(Income, Prestige, col=colors[factor(prestige_label)])
legend("topleft", legend = levels(factor(prestige_label)), col = colors, pch=1)
# scatterplot Education vs Prestige
win.graph()
plot(Education, Prestige, col=colors[factor(prestige_label)])
legend("topleft", legend = levels(factor(prestige_label)), col = colors, pch=1)

#### Number 2 ####
data_cor <- data.frame(Income, Education)
datakorelasi <- matrix(0, nrow=nrow(data_cor)-1)
for(i in 1:nrow(data_cor)){
  datakorelasi[i] <- cor(data_cor[-i,])[2]
}

write.csv(datakorelasi, 'datakorelasi.csv', row.names = F)

myFunction <- function(input){
  datacor <- matrix(0, nrow = nrow(input))
  for(i in 1:nrow(input)){
    datacor[i] <- cor(input[-i,])[2]
  }
  #return(datacor)
  write.csv(datacor, 'hasil_function.csv', row.names = F)
}
myFunction(data_cor)
