from socket import *
import psycopg as psy
from datetime import datetime

conn_paras = """
    dbname='cats'
    user='pi'
    host='134.93.64.85'
    password='2406'
    port='5432'
"""

serverSocket = socket(AF_INET, SOCK_DGRAM)
serverSocket.bind(('', 12001))

def catch(cat):
    result = ""
    with psy.connect(conn_paras) as conn:
        with conn.cursor() as cur:
            cur = conn.cursor()
            cur.execute(f'''
                Select time from ate
                Where cat_name = '{cat}'
                AND DATE(time) = CURRENT_DATE;
            ''')
            ate = cur.fetchall()
            for i in ate:
                result += i[0].strftime("%H:%M") + "\n"

    return result

def feed_cat(cat):
    with psy.connect(conn_paras) as conn:
        with conn.cursor() as cur:
            cur.execute(f'''
            Insert Into Ate Values('{cat}', '{datetime.now()}');
            ''')

while True:
    msg, add = serverSocket.recvfrom(1024)
    if msg.decode() == 'quit': break
    msg_decoded = msg.decode()
    msg_splitted = msg_decoded.split(' ')
    if len(msg_splitted) == 2:
        msg_comm = msg_splitted[0]
        if msg_comm == "Feed":
            feed_cat(msg_splitted[1])
            print(f"{msg_splitted[1]} fed!")
        elif msg_comm == "Look":
            result = catch(msg_splitted[1])
            serverSocket.sendto(result.encode(), add)    
    else:
        print(msg_decoded)
        answer = catch().encode()
        serverSocket.sendto(answer, add)

serverSocket.close()
