from email.mime.text import MIMEText
from email import encoders
from email.header import Header
from email.utils import parseaddr,formataddr
import smtplib

def _fromat_addr(s):
	# print(s) 
	name, addr = parseaddr(s)
	# print(name)
	return formataddr((Header(name,'utf-8').encode(),addr))


def _send_mail():
	# 输入Email地址和口令
	#from_addr = input('From:')
	from_addr = '1123804727@qq.com'
	#password = input('Password:')
	password = 'plrofnmdbsndhgea'
	# 输入收件人地址
	#to_addr = input('To:')
	to_addr = '1101044005@qq.com'
	# 输入SMTP服务器地址
	#smtp_server = input('SMTP　Server:')
	smtp_server = 'smtp.qq.com'

	msg = MIMEText('hello,send by Python...','plain','utf-8')
	msg['From'] = _fromat_addr('Python爱好者<%s>' % from_addr)
	msg['To'] = _fromat_addr('秋静<%s>' % to_addr)
	msg['Subject'] = Header('来自SMTP的问候....','utf-8').encode()

	server = smtplib.SMTP(smtp_server,25)
	server.set_debuglevel(1)
	server.login(from_addr,password)
	server.sendmail(from_addr,[to_addr],msg.as_string())
	server.quit()

for i in range(1,1000):
	_send_mail()
	print(i)
print('邮件发送完毕')