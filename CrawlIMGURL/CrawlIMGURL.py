'''
Author: MomoTori
Date: 2022-01-26 12:15:21
LastEditors: MomoTori
LastEditTime: 2022-02-21 21:37:48
FilePath: \SmallTools\CrawlIMGURL\CrawlIMGURL.py
Description: 
Copyright (c) 2022 by MomoTori, All Rights Reserved. 
'''
import re
import requests
type=input("0.subject作品\n1.character角色\n(0/1):")
if type=="0":
    type="subject"
    Pat=re.compile(r'href="(.*?)".*class="thickbox cover"')
elif type=="1":
    type="character"
    Pat=re.compile(r'img src="(.*?/m/.*?)".*class="cover"')
number=input("number:")
baseurl="http://bgm.tv/"

url=baseurl+type+'/'+number
head = {  # 模拟浏览器头部信息
        "User-Agent": "Mozilla / 5.0(Windows NT 10.0; Win64; x64) AppleWebKit / 537.36(KHTML, like Gecko) Chrome / 80.0.3987.122  Safari / 537.36"
    }
res=requests.get(url,headers=head)
res.encoding="UTF-8"#utf-8编码
answer=Pat.findall(res.text)[0]
if answer==None:
    print("ERROR")
else:
    picurl="http:"+answer
    print(picurl)
    print("Finished.")
    