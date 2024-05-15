setwd("C:/Users/darre/Desktop/ASDOS OSP/W2")

df = read.csv('exercise2.csv', header = T, sep=";");df
attach(df)

# 1
max_x = max(index)
max_y = max(unemployment)
subset(Land, index==max_x)
subset(Land, unemployment==max_y)

min_x = min(index)
min_y = min(unemployment)
subset(Land, index==min_x)
subset(Land, unemployment==min_y)

# 2
range_x = max_x - min_x;range_x
range_y = max_y - min_y;range_y

# 3
quant_x = quantile(index, c(0.25,0.75));quant_x
quant_y = quantile(unemployment, c(0.25,0.75));quant_y

# 4
med_x = median(index)
med.x = quantile(index, 0.5)
med_y = median(unemployment)
med.y = quantile(unemployment, 0.5)

# 5
qdiff_x = quant_x[2]-quant_x[1];qdiff_x
qdiff_y = quant_y[2]-quant_y[1];qdiff_y

# 6
mean_x = mean(index);mean_x
mean.x = sum(index)/length(index);mean.x
mean_y = mean(unemployment);mean_y
mean.y = sum(unemployment)/length(unemployment)

# 7
mad_x = median(abs(index- med_x));mad_x
mad_y = median(abs(unemployment - med_y));mad_y
mad(unemployment, constant = 1)

# 8
var_x = var(index)
var.x = sum((index - mean_x)^2) / (length(index) - 1)
var_y = var(unemployment)
var.y = sum((unemployment - mean_y)^2) / (length(unemployment) - 1)

# 9
std_x = sqrt(var_x)
std.x = sd(index)
std_y = sqrt(var_y)
std.y = sd(unemployment)

# 10
par(mfrow=c(1,2))
boxplot(index, main="Boxplot Index", xlab = "index")
boxplot(unemployment, main="Boxplot Unemployment", xlab = "unemployment")
hist(index, main = "Histogram Index")
hist(unemployment, main = "Histogram Unemployment")
density_x = density(index)
density_y = density(unemployment)
plot(density_x, main = "Kernel Density Estimator Index")
plot(density_y, main = "Kernel Density Estimator Unemployment")
ecdf_x = ecdf(index)
ecdf_y = ecdf(unemployment)
plot(ecdf_x, xlab = "index", main = "EDF Index")
plot(ecdf_y, xlab = "unemployment", main = "EDF Unemployment")


# 11
cov_xy = cov(index, unemployment);cov_xy
xy_cov = (1/(length(index) - 1)) * sum(index*unemployment) - 
  ((length(index)/(length(index) - 1)) * (mean_x*mean_y))
cov_xx = cov(index, index)
cov_yy = cov(unemployment, unemployment)
dframe = data.frame(index, unemployment);dframe
cov.xy = cov(dframe);cov.xy

# 12 
cor = cor(index,unemployment)
cor_xy = cov_xy / sqrt(cov_xx * cov_yy); cor_xy
# cor(index, index)
# cor(unemployment, unemployment)

# 13
rank_x = rank(index);rank_x
rank_y = rank(unemployment);rank_y

# 14
cor_rank = cor(rank_x, rank_y);cor_rank
r_rank = sum((rank_x-mean(rank_x))*(rank_y-mean(rank_y))) / 
  sqrt(sum((rank_x-mean(rank_x))^2) * sum((rank_y-mean(rank_y))^2));r_rank

# 15
alpha = 0.05
ci_x = c(mean_x - (qnorm(1-alpha/2)*std_x)/sqrt(length(index)), 
         mean_x + (qnorm(1-alpha/2)*std_x)/sqrt(length(index)))

ci_y = c(mean_y - (qnorm(1-alpha/2)*std_y)/sqrt(length(unemployment)), 
         mean_y + (qnorm(1-alpha/2)*std_y)/sqrt(length(unemployment)))

# 16
t.test(index, alternative = "g", mu = 3)

t_x = (mean_x-3)/std_x * sqrt(length(index));t_x
pt(t_x, df = length(index) - 1, lower.tail = F)
# if pval < alpha -> tolak H0
ci_t = c(mean_x - 1/sqrt(length(index))* qt(1-alpha, length(index)-1) * std_x, Inf)

# 17
t.test(index, unemployment, mu = 0, alternative = "t", var.equal = T)

t_xy = (mean_x - mean_y) / sqrt((length(index)+length(unemployment))/(length(index)*length(unemployment))*
                                  ((length(index)-1)*var_x+(length(unemployment)-1)*var_y)/(length(index)+length(unemployment)-2))
2*pt(t_xy, df = length(index)+length(unemployment)-2)
# if pval < alpha -> tolak H0

# daerah penolakan
c(-qt(1-alpha/2, df = length(index)+length(unemployment)-2), qt(1-alpha/2, df = length(index)+length(unemployment)-2))

if(-qt(1-alpha/2, df = length(index)+length(unemployment)-2) <= t_xy && t_xy <= qt(1-alpha/2, df = length(index)+length(unemployment)-2)){
  print("Gagal Tolak H0")
}else{
  print("Tolak H0")
}

if(t_xy <= -qt(alpha/2, df = length(index)+length(unemployment)-2) || t_xy >= qt(alpha/2, df = length(index)+length(unemployment)-2)){
  print("Tolak H0")
}else{
  print("Gagal Tolak H0")
}

# 18
var.test(index, unemployment)

ftest = var_x / var_y
pf(ftest, df1 = length(index), df2 = length(unemployment))
# if pf < alpha -> tolak H0

# daerah penolakan
c(qf(1-alpha/2, df1 = length(index)-1, df2 = length(unemployment)-1), qf(alpha/2, df1 = length(index)-1, df2 = length(unemployment)-1))

if(ftest <= qf(1-alpha/2, df1 = length(index)-1, df2 = length(unemployment)-1) || ftest >= qf(alpha/2, df1 = length(index)-1, df2 = length(unemployment)-1)){
  print("Tolak H0")
}else{
  print("Gagal Tolak H0")
}
