# 关键字参数 kw是一个dict
def person(name,age,**kw):
	print('name:',name,'age:',age,'other:',kw)


person('Michael',20)
person('Michael',20,city='shenzheng')
person('Michael',20,city='shenzheng',job='Engineer')