setwd('C:/Users/darre/Desktop/ASDOS OSP/W5')

# Number 1
x <- rt(100, df = 2)
find_y <- function(input){
  y <- array(0, 100)
  for(i in 1:length(x)){
    if(x[i] >= 0){
      y[i+1] = y[i] + x[i]
    }else if(x[i] <= -1){
      y[i+1] = y[i] - x[i]
    }else{
      y[i+1] = y[i] - 2*x[i]
    }
  }
  y
}
find_y(x)

# Number 2
data <- iris
attach(data)
tapply(Sepal.Length, Species, max)
tapply(Sepal.Length, Species, min)

# Number 3
f1 = function(input){
  input = input[-which(apply(input, 1, function(x)any(is.na(x)))),]
}

a = c(1,2,NA,4,NA)
b = c(2,3,5,6,NA)
c = data.frame(a,b)
c
c = f1(c)
c

# Number 4
#install.packages('tcltk')
library(tcltk)
tkmessageBox(message="Have you finished all the exercises?", 
             icon="question", type="yesno", default="yes")

# Number 5
x = 1
y = 40
for(i in 1:10){
  x = x+3
  y = y-2
}
x
y

# Number 6
summation <- function(a,b){
  result = a + b
  return(result)
}

# Number 7
vec_check <- function(a,x){
  for(i in 1:length(x)){
    if(a %in% x[i]){
      return("TRUE")
    }else{
      return("FALSE")
    }
  }
}
vec = c(1,2,3,4,5)
vec_check(1,vec)

# Number 8
col_class <- function(df){
  for(col_name in names(df)){
    col_class <- class(df[[col_name]])
    print(paste(col_name, "is", col_class))
  }
}
frame <- data.frame(
  x1 = c(1, 2, 3),
  x2 = c("a", "b", "c"),
  x3 = c(TRUE, FALSE, TRUE),
  x4 = c("yes", "No", "yes no")
)
col_class(frame)
frame[["x1"]]
names(frame)

# Number 9
vec <- c(1, 2, 2, 3, 4, 4, 4)
print(unique(vec))
remove_duplicates <- function(input){
  input = input[-which(diff(input)==0)]
  return(input)
}
remove_duplicates(vec)

# Number 10
vec_count <- function(a,x){
  count = 0
  for(i in 1:length(x)){
    if(a == x[i]){
      count = count + 1
    }
  }
  return(count)
}
xx = c(1,1,2,3,3,3,4,4,4,4,5)
vec_count(6,xx)

# Number 11
statdes <- function(input, print_med){
  mean = mean(input)
  std = sd(input)
  if(print_med == TRUE){
    med = median(input)
    list(median = med, mean = mean, standard_deviation = std)
  }else{
    list(mean = mean, standard_deviation = std)
  }
}
xy = c(1,2,3,4,5)
statdes(xy, F)

# Number 12
divisors <- function(a){
  div = c(1:a)
  count = 0
  for(i in 1:length(div)){
    if(a %% div[i] == 0){
      count = count + 1
    }
  }
  return(list(divisors = div[a %% div == 0], count = count))
}
divisors(6)

# Number 13
fill_na <- function(input, value){
  for(i in 1:nrow(input)){
    for(j in 1:ncol(input)){
      if(input[i,j] %in% value){
        input[i,j] = NA
      }
    }
  }
  return(input)
}
df = data.frame(
  x1 = c(1,2,3,4,5),
  x2 = c("one", "two", "three", "four", "five")
)
df

fill_na(df, 1)
fill_na(df, c(2, "five"))
