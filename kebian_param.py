# 可变参数
def calc(*numbers):
	sum = 0
	for n in numbers:
		sum = sum + n * n
	return sum

nums = [1,3,5]
a = calc(*nums)
#a = calc(1,3,5)
print(a)