import math

x = int(input("Enter x: "))

math = math.exp(x)

def power(x,n):
    return x**n

def factorial(x):
    if x <= 1:
        return 1
    else:
        return x*factorial(x-1)
    
def exp(x):
    n = 0
    sum = 0
    threshold = 0.0001
    current = 1
    previous = 0

    while True:
        sum += power(x,n) / factorial(n)
        current = sum

        if abs(current - previous) <= threshold:
            break

        previous = current
        n += 1
    
    return current, n

res, iter = exp(x)

print(f"exp {x} : {res}, after {iter} iterations")
print(f"crosscheck by math : {math}")