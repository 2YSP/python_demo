from PIL import Image,ImageFont,ImageDraw

img = Image.open("D:\\微信图片_20190124103137.jpg")
print(img.format,img.size,img.mode)
w,h=img.size
draw = ImageDraw.Draw(img)
font = ImageFont.truetype("arial.ttf",15)
fillColor="#ff0000"
draw.text((w-20,10),"4",font=font,fill=fillColor)
img.show()
img.save("22222.jpeg","jpeg")
