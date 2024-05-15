isprime <- function(input){
  if(input <= 1){
    return(F)
  }
  if(input == 2){
    return(T)
  }
  for(i in 2:round(input/2)){
    if(input %% i == 0){
      return(F)
    }
  }
  return(T)
}
isprime(2)
isprime(3)
isprime(5)
isprime(37)

factorial <- function(input){
  if(input <= 1){
    return(1)
  }else{
    return(input * factorial(input-1))
  }
}

factorial(0)
factorial(1)
factorial(3)
factorial(4)
