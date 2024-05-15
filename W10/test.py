nilai_siswa = [85,90,78,92,88]
def sorting(input):
    n = len(input)
    for i in range(n-1):
        for j in range(n - i - 1):
            if input[j] > input[j+1]:
                input[j], input[j+1] = input[j+1], input[j]

sorting(nilai_siswa)
nilai_siswa

i_0 = 0
i_1 = 1
next = i_1
i = 1
while i <= 5:
    print(next, end=" ")
    i += 1
    i_0, i_1 = i_1, next
    next = i_0 + i_1
print()