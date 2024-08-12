Python 3.12.5 (tags/v3.12.5:ff3bc82, Aug  6 2024, 20:45:27) [MSC v.1940 64 bit (AMD64)] on win32
Type "help", "copyright", "credits" or "license()" for more information.
import mysql.connector
Traceback (most recent call last):
  File "<pyshell#0>", line 1, in <module>
    import mysql.connector
ModuleNotFoundError: No module named 'mysql'
con = mysql.connector.connect(host='localhost',database='biblioteca', user='root', password='')
Traceback (most recent call last):
  File "<pyshell#1>", line 1, in <module>
    con = mysql.connector.connect(host='localhost',database='biblioteca', user='root', password='')
NameError: name 'mysql' is not defined
>>> if con.is_connected():
...     db_info = con.get_server_info()
...     print("Conectado ao servidor MySQL versão",db_info)
...     cursor = con.cursor()
...     cursor.execute("Select database();")
...     linha = cursor.fetchone()
...     print("Conectado ao banco de dados",linha)
... if con.is_connected();
SyntaxError: invalid syntax
>>> if con.is_connected():
...     cursor.close()
...     con.close()
...     print("Conexão ao MySQL foi encerrado")
