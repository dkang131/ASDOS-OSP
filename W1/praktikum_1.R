a = "slumdog"
b = "millionaire"
a
b
paste(a,b)

a = seq(1,19,2)
a = a[-c(5,8)]
a

b = 2^(1:8)
c = (1:8)^2

which(b==c)
b[which(b==c)]
c[which(b==c)]

M.c = cbind(b,c)
dim(M.c)
M.c[7,]

M.r = rbind(a,b)
rownames(M.r) = (c("a","b"))
colnames(M.r) = (c("S","T","U","V","W","x","Y","Z"))
M.r[, -5]
M.r[, colnames(M.r) != "W"]
M.r > 12
M.r[M.r > 12]

x = seq(-3,3,0.5)
y = exp(-x)
y

d = (1:100)
d
e = rep(7,100)
e

D = matrix(c(1:100),10,10)
D
E = matrix(c(1/d),10,10,byrow=T)
E

D+E
D-E
D %*% E
D * E
P = D%*%E
diag(P)
P[row(P)==col(P)]

x <- c(-10, 0, 0.1, 10, 1000, 100000)
y1 <- x^5 + x^4 + x^3 + x^2 + x+1
y2 <- 1 + x*(1 + x*( 1+ x*( 1+x*( 1+x ))))

grid <- seq(0,2*pi, length.out=10);grid
# grid <- seq(0,2*pi);grid
sin.grid <- sin(grid)
cos.grid <- cos(grid)
tan.grid <- tan(grid)
diff.grid <- sin.grid/cos.grid - tan.grid
diff.grid
tan.grid

price = c(2,3,5,3,2,5,7,4,2,5)
returns = diff(log(price)) 
return = log(price[-1]/price[-length(price)])

ch.points = c(1,1,1,1,1,2,2,2,2,3,3,3,3,3,3,3,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,6,6,6,6,6)
which(diff(ch.points) == 1)

length(which(sin.grid > 0)) / length(which(sin.grid < 0))

A = rbind(
  c(-1.00,  3.71,  2.80, 0.01,  1.19),
  c( 0.40, -1.81, -1.96, 1.84,  1.74),
  c(-4.30,  1.71,  0.68, 0.11,  3.44),
  c( 0.03,  3.90,  0.41, 0.02,  1.05),
  c( 0.24, -0.01,  2.10, 2.87, -3.57))
A = matrix(c(#masukin nilai),5,5,byrow=F)
det(A)
inv.A = solve(A)
inv.A
inv.A %*% A
