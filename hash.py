import hashlib
# 摘要算法
md5 = hashlib.md5()
# md5.update('how to use md5 in python hashlib?'.encode('utf-8'))
md5.update('how to use md5 in '.encode('utf-8'))
md5.update('python hashlibs?'.encode('utf-8'))
print(md5.hexdigest())