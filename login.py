import hashlib
db = {
    'michael': 'e10adc3949ba59abbe56e057f20f883e',
    'bob': '878ef96e86145580c38c87f0410ad153',
    'alice': '99b1c2188db85afee403b1536010c2c9'
}

def login(user,password):
	db_password = db[user]
	md5 = hashlib.md5()
	md5.update(password.encode('utf-8'))
	password = md5.hexdigest()
	if db_password == password:
		return True
	else:
		return False
	


result = login('michael','1234567')
print('登录结果:'+str(result))