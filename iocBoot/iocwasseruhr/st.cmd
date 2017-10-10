#!../../bin/linux-x86_64/wasseruhr

## You may have to change wasseruhr to something else
## everywhere it appears in this file

< envPaths
epicsEnvSet("STREAM_PROTOCOL_PATH", ".:../../db")
epicsEnvSet "K_1" "$(K_1=melba:wedlposu02:)"


cd "${TOP}"
dbLoadRecords("db/asynRecord.db","P=norum:,R=asyn,PORT=L0,ADDR=24,IMAX=100,OMAX=100")

## Register all support components
dbLoadDatabase "dbd/wasseruhr.dbd"
wasseruhr_registerRecordDeviceDriver pdbbase

< ./iocBoot/$(IOC)/AutoSaveSetup.cmd

drvAsynIPPortConfigure("UHR_PORT","10.32.240.76:4006",0,0,0) 

asynSetTraceIOMask("K_1_PORT",-1,0x2)
asynSetTraceMask("K_1_PORT",-1,0x9)

## Load record instances
#dbLoadRecords("db/xxx.db","user=baiHost")
dbLoadRecords("db/wasseruhr.db","WASSER=$(K_1), PORT=UHR_PORT")
#dbLoadRecords("$(AUTOSAVE)/asApp/Db/save_restoreStatus.db", "P=$(K_1)")

cd "${TOP}/iocBoot/${IOC}"
iocInit

< AutoSaveTask.cmd

## Start any sequence programs
#seq sncxxx,"user=baiHost"
