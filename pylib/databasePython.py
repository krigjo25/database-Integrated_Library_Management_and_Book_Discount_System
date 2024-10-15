#   Python responsories
from sys import exit
from os import getenv
from datetime import datetime, date

#   Database responsories
import mariadb

#   dotenv Responsories
from dotenv import load_dotenv
load_dotenv()

#   Selecting, Inserting or updates a table
class mariaDB():

    '''         mariaDB

        Connects to the preferably used database from
        mariaDB. with Commands, such as SELECT, INSERT,
        UPDATE, CREATE DATABASE, CREATE TABLE
                
        the function also calls a procedure and a function.
    '''

    def __init__(self):

        try:
            #   Initializing the database connection
            self.conn = mariadb.connect(
                                        host = getenv('H0ST'), 
                                        user = getenv('MASTER'), 
                                        port = int(getenv('PORT')), 
                                        password = getenv('PASSWORD'),
                                        database = getenv('database'))
            
            #   Creating a cursor to execute the statements
            self.cur = self.conn.cursor()

        except mariadb.Error as e:
            print(f"Error connecting to the database: \n {e}")
            exit(1)

        return
    def closeConnection (self):

        #   Closing the connection to the database
        self.conn.close()


        return

    def selectFromTable (self, database, query):


        #   Database selection
        self.conn.database = database

        #  Execute the query.
        self.cur.execute(query)


        #   Fetching the sql selection
        sql = self.cur.fetchall()

        #   Initializing a list to return
        sqlData = []

        #   append to the list
        for i in sql:
            sqlData.append(i)

        #   Returning the values in sqlData
        return sqlData

    def RowCount(self, database, query):

        #   Database selection
        self.conn.database = database

        #   Executes the query and retrieve the rows
        self.cur.execute(query)

        #   Fetch the cursor
        self.cur.fetchall()

        #   Counts the rows in the cursor
        counter = self.cur.rowcount

        return counter

    def updateTable (self, database, query):

        #   Database selection
        self.conn.database = database

        self.database = database

        #   Executes the query and close the connection

        self.cur.execute(query)
        self.conn.close()

        return

    def callProcedure (self, database, query):

        #   Database Connection 
        self.conn.database = database

        #   calling a procedure
        self.cur.callproc(f'{query}')

        return

    def CreateDatabase(self, name):

        query = f'CREATE DATABASE IF NOT EXISTS {name}'
        self.cur.execute(query)
        self.conn.database = name

        if self.conn == True:
            msg = f'{name}, were successfully created'
        else:
            msg = ' An error occurred'

        return print(msg)

    def DropDatabase(self, name):

        query = f'DROP DATABASE IF NOT EXISTS {name}'
        self.cur.execute(query)

        if self.conn == False:
            msg = f'{name}, were successfully deleted'
        else:
            msg = ' An error occurred'

        return print(msg)
    def DropTable(self, database, name):
        #   Database selection
        self.conn.database = database

        #   Creating a query and execute it
        query = f'DROP TABLE IF EXISTS {name};'
        self.cur.execute(query)

        return