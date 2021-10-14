import requests
from lxml import html

# time series weather forecast
URL = 'http://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=1153079000'

r = requests.get(URL)
t = html.fromstring(r.content)
q = t.xpath('//*[@seq=0]')

x = q[0].text_content().encode('utf8')

temperature = x.split()[2]
forecast = x.split()[7]
latitude = '37.493423'
longitude = '126.834054'

import sys

sys.stdout.write(temperature + ' ' + forecast + ' ' + latitude + ' ' + longitude )
