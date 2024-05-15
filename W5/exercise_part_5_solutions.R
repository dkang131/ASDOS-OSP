# solutions for SPL day 5

# No.1
##########

n = 100
x = rnorm(n, mean=0, sd=2)
y = array(0,n+1) #vector of zeros

for (i in 1:n){
	if(x[i] >= 0){
	  y[i+1] = y[i] + x[i]
	}
  else if (x[i] <= -1){
    y[i+1] = y[i] - x[i]
  }
  else{
    y[i+1] = y[i] - 2*x[i]
  }
}

plot(y)

# No.2
##########

library(datasets)
data(iris)
attach(iris)

print("maximum")
tapply(Sepal.Length, Species, max)

print("minimum")
tapply(Sepal.Length, Species, min)

detach(iris)

# No.3
##########

delNAfun = function(data) {
    data = data[- which(apply(data,1,function(x) any(is.na(x)))), ]
}

# f1 <- function(x) any(is.na(x))	
# example

a = c(1,2,NA,4,NA)
b = c(2,3,5,6,NA)
c = data.frame(a,b)
c
c = delNAfun(c)
c

### No.4
##########

library(tcltk)
tkmessageBox(message="Have you finished all the exercises?", 
             icon="question", type="yesno", default="yes")


	
### No.5
##########
x = 1
y = 40
i = c(1:10)

for(j in i){
  x = x + 3
  y = y - 2
}

cat("y =", y, "\nx =", x)


### No.6
##########
manual_sum = function(int1, int2){
  if(int1 != round(int1) || int2 != round(int2)){
    warning("arguments passed should be integer, consider converting to integer")
  }
  result = int1 + int2
  return(result)
}
manual_sum(3, 4)



### No.7
##########
number_in_vector = function(vector, integer){
  if(is.numeric(vector)!=TRUE || round(integer)!=integer){
    warning("arguments passed should be integer, consider converting to integer")
  }
  if(integer %in% vector){
    return(TRUE)
  }else{
    return(FALSE)
  }
}
# Return True
number_in_vector(c(1:10), 6)

# Return False
number_in_vector(c(1:10), 11)

# Raised an error
number_in_vector(c(1:10), 11.5)


colnames(df)


### No.8
##########
# Example using iris dataset
df = iris
name_class = function(df){
  for(column in colnames(df)){
    cat(column, "is a", class(df[[column]]), "column", "\n")
  }
}
name_class(df)


vector = c(1,2,90,8,8, 90)
seq_len(vector[3])
seq(vector[3])

### No.9
##########
xx = c(1,1,2,3,3,3,4,4,4,4,5)
remove_duplicates <- function(input){
  input = input[-which(diff(input)==0)]
  return(input)
}
remove_duplicates(xx)

### No.10
##########
vec_count <- function(a,x){
  count = 0
  for(i in 1:length(x)){
    if(a == x[i]){
      count = count + 1
    }
  }
  return(count)
}
vec_count(4,xx)

### No.11
##########
manual_summary = function(vector, show_median = F){
  cat("Average\t\t\t:", mean(vector),
      "\nStandard Deviation\t:", sd(vector))
  if(show_median==T){
    cat("\nMedian\t\t\t:", median(vector))
  }
}

manual_summary(c(1,2,90,8,8, 90), show_median = T)


### No.12
##########
all_factor = function(int) {
  factors = which(sapply(seq(int-1), function(i) int%%i==0))[-1]
  return(factors)
}
# 41 and 43 is twin prime
all_factor(43)
all_factor(41)

# 138929 is not a prime
all_factor(138929)

### No.13
##########
df = iris
refill_na = function(df, value) {
  df = sapply(df, function(df_value) replace(df_value, df_value==value, NA))
  df = as.data.frame(df)
  return(df)
}

# Check the dataframe
df = refill_na(df, 5.1)
df
