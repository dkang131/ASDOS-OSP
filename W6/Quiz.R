setwd('C:/Users/darre/Desktop/ASDOS OSP/W6')

### Number 1
#####
i = rep(c(1:12), 18)
m = rep(month.abb,18)
y = rep(c(2006:2023), each = 12)
t = c(1:length(i))

data <- data.frame(i,m,y,t)
colnames(data) <- c("Index", "Month", "Year", "Time")
head(data)

### Number 2
#####
set.seed(184)
yt = matrix(0, nrow = 216)
error = rnorm(216, 0, 1)
for(i in 1:216){
  yt[i] = 100 + (10*i) + 50 * sin(2*pi*i/12) + error[i]
}
yt

data <- cbind(data, yt)
head(data)
win.graph()
where.put = c(1, which(diff(data[,3]) == 1) + 1) # ini adalah kunci
plot(data[,5], type = "l", lwd = 3, lty = 1, pch = 16, col = "red", xlab = "Time",
     ylab = "Yt", axes = F, frame = T)
abline(h = seq(100,2500, by=100), lty = 'dotted', lwd=0.5, col="grey")
abline(v = where.put, lty="dotted", lwd=0.5, col = "grey")
axis(side=2, at=seq(100,2500,by=100), label=seq(100,2500,by=100), lwd=1)
axis(side=1, at=where.put, label=data[,3][where.put], lwd=0.5)

### Number 3
#####

library(readxl)
sabun <- as.data.frame(read_excel("sabun.xlsx"))
head(sabun)
rataan <- (sabun[,3] + sabun[,4])/2
rataan

sabun <- cbind(sabun, rataan)
head(sabun)