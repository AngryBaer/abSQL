"""
    UI for database backup and recovery
"""


# -------------------------------------------------------------------------------------------------------------------- #
# IMPORTS
import os
import sys
import pprint
import subprocess

import mysql.connector
from mysql.connector import errorcode

from PySide import QtGui, QtCore
# -------------------------------------------------------------------------------------------------------------------- #


__login__ = None
__db__ = None

mysqldump_path = '"C:/Program Files/MySQL/MySQL Workbench 8.0 CE/mysqldump.exe"'
mysql_path = '"C:/Program Files/MySQL/MySQL Workbench 8.0 CE/mysql.exe"'
target = '"C:/Users/alex/OneDrive/ProjectBackup/SQL-DB/gos-db.sql"'


# -------------------------------------------------------------------------------------------------------------------- #
class MainWindow(QtGui.QFrame):
    def __init__(self):
        super(MainWindow, self).__init__()

        self.mainLayout = QtGui.QVBoxLayout()

        self.backupButton = QtGui.QPushButton("Backup")
        self.restoreButton = QtGui.QPushButton("Restore")

        self.backupButton.clicked.connect(self.backup)
        self.restoreButton.clicked.connect(self.restore)

        self.mainLayout.addWidget(self.backupButton)
        self.mainLayout.addWidget(self.restoreButton)

        self.setLayout(self.mainLayout)

        self.password = r'Jiggly&Puff42'

    def backup(self):
        call = r'"C:/Program Files/MySQL/MySQL Workbench 8.0 CE/mysqldump.exe" ' \
               r'-u root --password="{}" --routines gos --result-file=' \
               r'"C:/Users/alex/OneDrive/ProjectBackup/SQL-DB/gos-db.sql"'.format(self.password)
        subprocess.call(call)

    def restore(self):
        mysql_arguments = r' -u root --password={} gos < '.format(self.password)
        subprocess.Popen(r'{} {}{}'.format(mysql_path, mysql_arguments, target))

# -------------------------------------------------------------------------------------------------------------------- #


# -------------------------------------------------------------------------------------------------------------------- #
class Login(QtGui.QFrame):
    def __init__(self):
        super(Login, self).__init__()

        self.setWindowTitle("Database Login")

        self.mainLayout = QtGui.QVBoxLayout()

        self.passwordLabel = QtGui.QLabel("Password")
        self.passwordEdit = QtGui.QLineEdit()

        self.loginButton = QtGui.QPushButton("Login")
        self.loginButton.clicked.connect(self.validate)

        self.cancelButton = QtGui.QPushButton("Cancel")
        self.cancelButton.clicked.connect(close_login)

        self.mainLayout.addWidget(self.passwordLabel)
        self.mainLayout.addWidget(self.passwordEdit)
        self.mainLayout.addWidget(self.loginButton)
        self.mainLayout.addWidget(self.cancelButton)

        self.setLayout(self.mainLayout)

        self.password_input = ""

    def validate(self):
        self.password_input = self.passwordEdit.text()
        if test_connection(self.password_input):
            db_window = MainWindow(self.password_input)
            db_window.show()
        else:
            self.passwordLabel.setText("Password incorrect")
# -------------------------------------------------------------------------------------------------------------------- #


# -------------------------------------------------------------------------------------------------------------------- #
def test_connection(password):
    try:
        connection = mysql.connector.connect(
            user='root',
            database='gos',
            password=password
        )
        print("Password accepted")
        connection.close()
        return True

    except mysql.connector.Error as ex:
        if ex.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Something is wrong with your user name or password")
        elif ex.errno == errorcode.ER_BAD_DB_ERROR:
            print("Database does not exist")
        else:
            print(ex)

    return False
# -------------------------------------------------------------------------------------------------------------------- #


# -------------------------------------------------------------------------------------------------------------------- #
# clean open function
def open_login():
    """
    Closes any previous instance of the window and opens a fresh one.
    :return: None
    """
    global __login__
    if __login__:
        close_login()
    application = QtGui.QApplication(sys.argv)
    __login__ = MainWindow()
    __login__.show()
    sys.exit(application.exec_())


# clean close function
def close_login():
    """
    Closes the window and removes the instance from memory.
    :return: None
    """
    global __login__
    if __login__ is None:
        return
    __login__.close()
    __login__.deleteLater()
    __login__ = None
# -------------------------------------------------------------------------------------------------------------------- #


# -------------------------------------------------------------------------------------------------------------------- #
if __name__ == "__main__":
    open_login()
# -------------------------------------------------------------------------------------------------------------------- #
