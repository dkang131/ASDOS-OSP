##############
# No. 1
##############

# dist    = c(0.032, 0.034, 0.214, 0.263, 0.275, 0.275, 0.45, 0.5, 0.5 , 0.63, 0.8,0.9, 0.9, 0.9, 0.9, 1.0, 1.1, 1.1, 1.4, 1.7, 2.0, 2.0, 2.0, 2.0 ) 
# rec.vel = c(170 , 290, -130 , -70, -185 , -220 , 200, 290, 270, 200, 300, -30, 650, 150, 500, 920, 450, 500, 500, 960, 500, 850, 800, 1090)

Hubble = read.table("Hubble.txt", sep="", header=T)
# or read the xlsx data

dist    = Hubble$distance
rec.vel = Hubble$recession_velocity

Hlm     = lm(rec.vel ~ dist)
summary(Hlm)

Hlm     = lm(rec.vel ~ dist - 1)
summary(Hlm)

# t-test

beta   = coef(Hlm); beta
betasd = sqrt(vcov(Hlm)); betasd

fit    = Hlm$fitted.value
fit

# test statistic

T     = beta / betasd; T
df    = length(dist)-length(beta); df
tcritic = qt(0.975, df); tcritic
print("Reject H_0?")
as.logical(abs(T) > tcritic)

plot(rec.vel, dist, col="blue", lwd=3)
lines(fit, dist, col="red", lwd=3)


################
# No. 2
################

cereal = read.table("cereal.txt", sep="", header=T)
attach(cereal)
clm    = lm(rating ~ sugars + fat, data=cereal)

# for significance of betas see p-values, for significance f all betas see F-statistics

summary(clm)

library(scatterplot3d)
sc3d = scatterplot3d(cereal$sugars, cereal$fat, cereal$rating, pch=16, type="h", highlight.3d=T)
sc3d$plane3d(clm, lty.box = "solid", col="blue")


################
# No.3
################

clm2 <- lm(rating ~ sugars + fat + potass + vitamins, data=cereal)
summary(clm2)  #  look at R^2_adj

# No.4
###############

sim.arma<-arima.sim(list(ar=c(0.6,0.1),ma=c(0.2)),n=1000)
plot(sim.arma)

# stationarity tests
library(tseries)
adf.test(sim.arma)
kpss.test(sim.arma)

# autocorrelation
par(mfrow=c(2,1))
acf(sim.arma, main="ACF of ARMA(2,1)")
pacf(sim.arma, main="PACF of ARMA(2,1)")

# parameter estimation
fit <- arima(sim.arma, order=c(2,0,1))
fit

# diagnostic
tsdiag(fit)
Box.test(fit$residuals)

