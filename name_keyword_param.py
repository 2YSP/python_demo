# 命名关键字参数
def person(name,age,*,city='shenzheng',job):
	print(name,age,city,job)


person('zhangsan',24,city='shenzheng',job='Engineer')

person('lisi',24,job='Engineer')
# person('zhangsan',24,'shenzheng','Engineer')
person('zhangsan',24)