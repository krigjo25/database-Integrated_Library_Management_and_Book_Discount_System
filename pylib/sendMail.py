from os import getenv
from customFunctions import SendMail

SMPTMASTER, SMTPPASSWORD, RECIEVER = getenv('SMPTMASTER'), getenv('SMTPPASSWORD'), getenv('RECIEVER')

if __name__=='__main__':
        mail = SendMail()
        mail.SendMailGmail(SMPTMASTER, SMTPPASSWORD,RECIEVER)
        mail.sendMailYahoo(SMPTMASTER, SMTPPASSWORD,RECIEVER)
        mail.sendMailServer(SMPTMASTER, SMTPPASSWORD,RECIEVER)
        mail.sendMailOutlook(SMPTMASTER, SMTPPASSWORD,RECIEVER)