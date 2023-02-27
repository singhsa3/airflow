import pip
import os

def import_or_install(package):
    try:
        __import__(package)
        print(package + " already exists" )
    except ImportError:        
        os.system("python -m pip install " +package)
        #pip.main(['install', package])  
filename="requirements.txt"
with open(filename) as file:
    lines = [line.rstrip() for line in file]
for package in lines:
    import_or_install(package)
os.system('rm test1.txt')
os.system('echo "I am all done" > test1.txt')
