
### solutions to the excersises from the day 2 of SPL

x = c(2.8, 1.2, 2.1, 1.6, 1.5, 4.6, 3.6, 2.1, 6.5, 4.6, 3.0, 1.3, 4.2)
y = c(9.4, 10.4, 10.8, 10.5, 18.4, 11.1, 2.6, 8.8, 5.0, 21.5, 6.7, 2.5, 5.6)
countries = c("Belgium", "Denmark", "France", "GB", "Ireland", "Italy", "Luxembourg", "Holland", "Portugal", "Spain", "USA", "Japan", "Deutschland")

myframe = data.frame(index = x, unemp = y)

rownames(myframe) = countries

myframe1=data.frame(countries,index=x,unemploy=y)

n = dim(myframe)[1]
attach(myframe); attach(myframe1)

## descriptive statistics
# No.1
minx = min(index); minx 
miny = min(unemploy); miny

#for myframe
rownames(myframe)[which(min(index) == index)]

#for myframe1
subset(countries,index==minx)
subset(countries,unemploy==miny)

maxx = max(index); maxx
maxy =max(unemploy); maxy

#for myframe
rownames(myframe)[which(max(index) == index)]

#for myframe1
subset(countries,unemploy==maxy)

# No.2
range(index) # min and max together
span = maxx - minx # alternative diff(range(index))
span

# No.3
quartiles = quantile(index, c(0.25,0.75))
quartiles

# No.4
medx = median(index) # alternative quantile(index, 0.5)
medx

# No.5
qd = as.numeric(diff(quartiles))
qd

# No.6
meanx = mean(index) # sum(index) / n
meanx

# No.7
madx = mad(index, constant = 1); madx # alternative 
median(abs(index - medx)); # constant is the scale vector


# No.8
varx = var(index) # alternative sum((index - meanx)^2) / (n-1)
varx

# No.9
sdx = sd(index) # alternative sqrt(varx)
sdx

summary(index)

# No.10
# TOMORROW --> next section about Graphics

# No.11
covxy = cov(myframe) # cov(index, unemp); (1/(n-1)) * sum(index * unemp) - n/(n-1) * mean(index) * mean(unemp)
covxy

# No.12
corxy = cor(myframe) # cor(index, unemp); cov(index, unemp) / (sd(index) * sd(unemp))
corxy

# No.13
rank(index)
rank(unemp)

# No.14
cor(rank(index), rank(unemp)) # alternative cor(index, unemp, method = "spearman")

# No.15

indexmean = mean(index); indexmean 
unempmean = mean(unemp); unempmean

# confidence intervals
# 15.1.variance known (quantile of sd. normal distr.)

alpha = 0.05
KI.n = c(mean(index) - qnorm(1-alpha/2) * sd(index) / sqrt(n), mean(index) + qnorm(1-alpha/2) * sd(index) / sqrt(n))
KI.n

# 15.2.variance unknown (quantile of student-t distr.)

KI.t = c(mean(index) - qt(1-alpha/2, df = (n-1)) * sd(index) / sqrt(n), mean(index) + qt(1-alpha/2, df = (n-1)) * sd(index) / sqrt(n))
KI.t

# No.16
# one sample mean test

mu0 = 3
T = (mean(index)-mu0)/(sqrt(n)*sd(index)); T 
critval=qt(0.95,n-1); critval #abs(T)<critval: H_0 can not be rejected

# konfidence interval for the test of the mean (just check if mu0 is in the confidence region)

KI = c((mean(index)) - qt(1-alpha, df = (n-1)) * sd(index) / sqrt(n), Inf)
KI

# much more easier solution !!!

t.test(index, alternative = "g", mu = 3) 

# No.17
# two sample test of mean with equal variance

T.twosample = (mean(index) - mean(unemp)) / sqrt((n+n)/(n*n) * ((n-1)*var(index) + (n-1)*var(unemp))/(n+n-2))
T.twosample

df.tst = n + n - 2; df.tst
qt.tst = qt(1-alpha/2, df = df.tst); qt.tst

# non rejection region
AB.tst = c(- qt.tst, qt.tst); AB.tst 

# The simple way
    
t.test(index, unemp, alternative = "t", var.equal = T)

t.test(index, unemp, alternative = "t") # assumption, that two variances are not equal

# No.18
# F-test of the variance

T = var(index) / var(unemp); T

# non rejection region
qf.vartest = c(qf(alpha/2, n-1,n-1), qf(1-alpha/2, n-1,n-1)); qf.vartest 

# the simple way
var.test(index, unemp)

