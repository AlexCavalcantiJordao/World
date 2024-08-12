import mysql.connector

con = mysql.connector.connect(host='localhost',database='biblioteca',user='root',password='')

if con.is_connected():
    db_info = con.get_server_info()
    print("Conectado ao servidor MySQL versão",db_info)
    cursor = con.cursor()
    cursor.execute("Select database();")
    linha = cursor.fetchone()
    print("Conectado ao banco de dados",linha)
    
if con.is_connected():
    cursor.close()
    con.close()
    print("Conexão ao MySQL foi encerrado")
 
