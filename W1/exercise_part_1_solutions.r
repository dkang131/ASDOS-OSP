# Updated by Dedy Dwi Prastyo, Even Semester 2023/2024

# 1.
slu = "slumdog"
mil = "millionaire"
print(slu)
print(mil)
print(paste(slu, mil))

# 2.
a <- t(c(1,3,5,7,11,13,17,19)); a

aa = seq(1,19, by=2)
aaa = aa[-c(5,8)]
aaa

# 3.
b <-  2^(1:8); b

# 4.
c <- (1:8)^2; c

# 5.
which(c == b)

# 6.
M.c <- cbind(b,c)
dim(M.c)
M.c[7,]

# 7.
M.r <- rbind(a,t(b))
rownames(M.r) <- letters[1:2]
colnames(M.r) <- LETTERS[19:26]

# 8.
M.r[, -5]
M.r[, colnames(M.r) != "W"]
M.r[, colnames(M.r) != "W" & colnames(M.r) != "Z"]

# 9.
M.r[M.r > 12]

# 10.
x1 <- seq(-3,3, by=0.5)
exp(-x1)

# 11.
d <- (1:100)
e <- array(7,100)



# 12.
D <- matrix(d,10,10);
v <- 1/(1:100);
E <- matrix(v,10,10,byrow=TRUE);

# 13.
D + E;
D - E;
D %*% E;
D * E;

# 14.
P <- D %*% E
P[row(P) == col(P)]

# 15.
x <- c(-10, 0, 0.1, 10, 1000, 100000)
y1 <- x^5 + x^4 + x^3 + x^2 + x+1
y2 <- 1 + x*(1 + x*( 1+ x*( 1+x*( 1+x ))))

# 16.
grid = seq(0, 2*pi, length.out = 20)
sin.g = sin(grid)
cos.g = cos(grid)
tan.g = tan(grid)
diff.sct = sin.g/cos.g - tan.g

# 17.
price = c(2,3,5,3,2,5,7,4,2,5)
returns = diff(log(price)) 
return = log(price[-1]/price[-length(price)])
# alternative: return = log(price[-1]/price[-length(price)])

# 18.
ch.points = c(1,1,1,1,1,2,2,2,2,3,3,3,3,3,3,3,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,6,6,6,6,6)
which(diff(ch.points) == 1)

# 19. refers to # 16
length(which(sin.g > 0)) / length(which(sin.g < 0))

length(sin.g[sin.g > 0]) / length(sin.g[sin.g < 0])


# 20.
A = rbind(
c(-1.00,  3.71,  2.80, 0.01,  1.19),
c( 0.40, -1.81, -1.96, 1.84,  1.74),
c(-4.30,  1.71,  0.68, 0.11,  3.44),
c( 0.03,  3.90,  0.41, 0.02,  1.05),
c( 0.24, -0.01,  2.10, 2.87, -3.57))

# 21.
det(A)


# 22.
A.inv = solve(A)


A.inv %*% A - diag(5)

# 23.
install.packages("fBasics") #install packages
library(fBasics) # mengaktifkan packages

B = pascal(3)
B
C = matrix(1:9,nrow = 3, ncol = 3)
C
D = B
B[upper.tri(B, diag = F)] = C[upper.tri(C, diag = F)]
B
C[upper.tri(C, diag = F)] = D[upper.tri(D, diag = F)]
C
B[upper.tri(B, diag = T)] = C[upper.tri(C, diag = T)]
B
C[upper.tri(C, diag = T)] = D[upper.tri(D, diag = T)]
C

B[lower.tri(B, diag = F)] = 0
B
C[lower.tri(C, diag = F)] = 0
C
