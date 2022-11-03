#!/usr/bin/env python3
import os
import sys
import subprocess


exDir = "ex"
inputDir = "input"
tempDir = "temp"
Timeout = 0.5

os.chdir(os.path.dirname(sys.argv[0]))

inFileMap = {}
for iF in os.listdir(inputDir):
    index = iF.find('-')
    point = iF.find('.')
    if index == -1:
        inFileMap[iF[:point]] = {"": iF}
    else:
        if iF[:index] in inFileMap:
            inFileMap[iF[:index]][iF[index+1:point]] = iF
        else:
            inFileMap[iF[:index]] = {iF[index+1:point]: iF}

if not os.path.exists(tempDir):
    os.makedirs(tempDir)

ex = os.listdir(exDir)

for student in ex:
    sourceDir = os.path.join(exDir, student)
    sourceFile = os.listdir(sourceDir)
    for sF in sourceFile:
        if not (sF[sF.rfind("."):] in ('.cpp', '.c')):
            continue
        objName = sF[:sF.rfind(".")]
        path = os.path.join(sourceDir, sF)
        subprocess.run(
            ["gcc", path,
             "-O2",
             "-o", os.path.join(tempDir, objName+".out")])

        inFileList = inFileMap.get(objName, {"": ""})

        for key, value in inFileList.items():
            if key == "":
                outFile = open(os.path.join(sourceDir, objName+'.txt'), "w")
            else:
                outFile = open(os.path.join(
                    sourceDir, objName+'-'+key+'.txt'), "w")

            if value == "":
                inFile = None
            else:
                inFile = open(os.path.join(inputDir, value), "r")

            try:
                subprocess.run(
                    [os.path.join('temp', objName+".out")],
                    stdin=inFile,
                    stdout=outFile,
                    timeout=Timeout)
            except:
                print(student+': '+sF+" Running Timeout!")

for file in os.listdir(tempDir):
    os.remove(os.path.join(tempDir, file))
os.rmdir(tempDir)
