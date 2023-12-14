import psycopg2 as psy
from datetime import datetime
import sys

conn = psy.connect(
        database='cats',
        user='pi',
        password='2406',
        port='5432'
        )
cursor = conn.cursor()

cat = sys.argv[1]
date = datetime.now()
cursor.execute(f'''
        Insert Into Ate Values('{cat}', '{date}');
''')

conn.commit()
