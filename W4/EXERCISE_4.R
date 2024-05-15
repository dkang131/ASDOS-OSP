setwd('C:/Users/darre/Desktop/ASDOS OSP/W4')
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


data <- data.frame(
  Years_Exp = c(1.1, 1.3, 1.5, 2.0, 2.2, 2.9, 3.0, 3.2, 3.2, 3.7),
  Salary = c(39343.00, 46205.00, 37731.00, 43525.00,
             39891.00, 56642.00, 60150.00, 54445.00, 64445.00, 57189.00),
  Experience_Score = c(5, 7, 6, 8, 7, 9, 8, 10, 9, 11)
)

ols = lm(data=data, data$Salary ~ data$Years_Exp)

summary(ols)
win.graph()
# Menggunakan plot biasa
plot(data$Years_Exp, data$Salary, col="red", lwd=3, xlab="Years of Experience", ylab="Salary", main="Salary vs. Years of Experience")
lines(data$Years_Exp, ols$fitted.values, col="green", lwd=3)

# Menggunakan ggplot
library(ggplot2)

ggplot(data, aes(x = Years_Exp, y = Salary)) +
  geom_point(color = "red") +
  geom_line(aes(y = ols$fitted.values), color = "green", linewidth = 1) +
  labs(x = "Years of Experience", y = "Salary", title = "Salary vs. Years of Experience")

# Menggunakan Plotly (interaktif)
library(plotly)
data %>% 
  plot_ly(x = ~Years_Exp) %>% 
  add_markers(y = ~Salary) %>% 
  add_lines(x = ~Years_Exp, y = fitted(ols))

# Menggunakan library scatterplot3d
library(scatterplot3d)
ols = lm(data=data, data$Salary ~ data$Years_Exp + data$Experience_Score)

sc3d = scatterplot3d(data$Years_Exp, data$Experience_Score, data$Salary, pch=16, type="h", highlight.3d=T)
sc3d$plane3d(ols, lty.box = "solid", col="blue")

# Menggunakan plotly (minusnya, sampai saat ini aku belum tahu bagaimana caranya mengeluarkan fitted plane
plot_ly(data, x=~Years_Exp, y=~Experience_Score, z=~Salary) %>%
  add_markers() %>%
  layout(scene = list(xaxis = list(title = 'Years of Experience'),
                      yaxis = list(title = 'Experience Score'),
                      zaxis = list(title = 'Salary'))) 
