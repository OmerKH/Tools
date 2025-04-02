import os
import getpass

def user_name():
    # Get the username of the current user
    username = getpass.getuser()
    print(username)


user_name()