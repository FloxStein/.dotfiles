import requests
from requests.packages.urllib3.exceptions import InsecureRequestWarning
from datetime import datetime

def catch():
    result = ""
    url = 'https://floxsite.de:2604/check_meds/'
    res = requests.get(url, verify=False)
    return res.text

requests.packages.urllib3.disable_warnings(InsecureRequestWarning)
ate = catch()

if ate != "None":
    print(ate)
else:
    url = 'https://floxsite.de:2604/meds/'
    res = requests.get(url, verify=False)

    if res.status_code == 200:
        print("erfolgreich")
    else:
        print("nicht")
