#   Python responsories
from os import getenv
from datetime import datetime, date

#   Database responsories
from databasePython import mariaDB

#   dotenv Responsories
from dotenv import load_dotenv


load_dotenv()

#   yagMail Responsories
import yagmail


class Calculators():
    '''         Calculators     

        DateCountDown :
            Calculates how many years, months days left
    '''

    def __init__(self):
        #   Initializing the classes

        pass

    def DateCountDown(self, arg):
        '''
            Calculates how many days left
            from today to arg
        '''
        today = date.today()
        arg = arg - today
        return arg

class SendMail():
    def __init__(self):

    # Loading environment values Needed to mask password and user 
        self.kalc = Calculators()

        return
    
    def sendMailOutlook(self, SMPTMASTER, SMTPPASSWORD, RECIEVER):
        pass

    def sendMailYahoo(self, SMPTMASTER, SMTPPASSWORD, RECIEVER):
        pass

    
    def SendMailGmail(self, SMPTMASTER, SMTPPASSWORD, RECIEVER):
        '''
            Sends an email, different functions for different mail 
            services setups.
        '''

        #   Initializing mariadb Connection 
        dc = mariaDB()
        database = getenv('database7')

        dates = []
        
        #   Fetch the enire row in order to use some of the information in the database to get contact information, name etc.
        query = 'SELECT * FROM lib'
        data = dc.selectFromTable(database, query)

        
        if bool(data) == True:
            for row in data:
                dates.append(row)

            #   Selecting the overdue date and return date, and create a countdown until
            #   The email should be sent
            self.kalc.dateCountDown(row[7])
            returnDate= self.kalc.dateCountDown(row[7])
            overDueDate = self.kalc.dateCountDown(row[8])
            returnDate = returnDate.days
            overDueDate = overDueDate.days

            print(row)
            if returnDate == 7:

                #   If date is 7days from returnDate send a reminder to the user
                msg = f'''   greetings, {row[9]}.
                This is reminder to return {row[2]}, by {row[3]} with-in {returnDate} days.
                If the store is closed, please deliver the given book in a propper box outside the store. 
                If the book is not delivered by {row[7]} a fine may apply\n This is an automatic generated email, please do not respond.'''   

                #  Sending an e-mail 
                yag = yagmail.SMTP(SMPTMASTER, SMTPPASSWORD).send(to=self.smtpUser,subject=self.subject,contents=msg)

            elif overDueDate == 0:

                #   If the person has not returned the book with-in 7days after the returnDate
                #   Send a new reminder incase the user has forgotten to deliver the book
                
                msg = f'''   greetings {row[3]}.
                We can see in our database you've forgotten to deliver {row[2]}. 
                We would appreciate if you could deliver the book with-in the next few days.
                If the store is closed, please deliver the given book in a propper box outside the store. 
                '''
                #  Send the email    
                yag = yagmail.SMTP(SMPTMASTER, SMTPPASSWORD).send(to=RECIEVER, subject=self.subject, contents=msg)

                    #attatchments

        elif bool(data) == False:
            print('Nothing in the selected table')
        
        dc.closeConnection()
        return

    def sendMailServer(self,SMPTMASTER, SMTPPASSWORD, RECIEVER):
        pass
