#!/usr/bin/env python3
import os
import subprocess

exDir = "ex"
Timeout = 0.5

ex = os.listdir(exDir)

if not os.path.exists("temp"):
    os.system("mkdir temp")

for student in ex:
    sourceDir = exDir+"/"+student
    sourceFile = os.listdir(sourceDir)
    for sF in sourceFile:
        if not (sF[sF.rfind("."):] in ('.cpp','.c')):
            continue
        objName = sF[:sF.rfind(".")]
        path = sourceDir + "/" + sF
        os.system("gcc "+'"'+path+'"'+" -o "+'"temp/'+objName+'"')

        if os.path.exists("input/"+objName+".txt"):
            inFile = open("input/"+objName+".txt","r")
        else:
            inFile = None
        outFile = open(sourceDir+'/'+objName+'.txt',"w")
        try:
            subprocess.run(['temp/'+objName],stdin=inFile,stdout=outFile,timeout=Timeout)
        except:
            print(student+':'+sF+" Timeout!")

ex = os.system("rm temp -r")
