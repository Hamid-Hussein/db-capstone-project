#install mysql connection package
!pip install mysql-connector-python

# Print a message to guide the user
# Import MySQL Connector/Python 
print("Importing MySQL Connector/Python API")
import mysql.connector as connector
print("MySQL Connector/Python API is imported successfully.\n")

# Establis connection with authorized user/password
print("Establishing a new connection between MySQL and Python.")
#connection=connector.connect(user="your_username",password="your_password")

connection=connector.connect(user="userName",password="password")
print("A connection between MySQL and Python is successfully established")

#exiption handling
import mysql.connector as connector

try:
    connection=connector.connect(
        user="userName",
        password='password'
    )
except:
    print("""
    There was a problem connecting to the database.
    Please check your username or the password.
    """)

#exception handling
    import mysql.connector as connector

try:
    connection=connector.connect(
        user="hamid",
        password="password",
        database = "littleLemon")

except connector.Error as er:
    print("Error code:", er.errno)
    print("Error message:", er.msg)


# Let's close the cursor and the connection
if connection.is_connected():
    connection.close()
    print("MySQL connection is closed.")
else:
    print("Connection is already closed")