#!../../bin/linux-x86_64/wasseruhr

## You may have to change wasseruhr to something else
## everywhere it appears in this file

< envPaths
epicsEnvSet("STREAM_PROTOCOL_PATH", ".:../../db")

cd "${TOP}"
#dbLoadRecords("db/asynRecord.db","")

## Register all support components
dbLoadDatabase "dbd/wasseruhr.dbd"
wasseruhr_registerRecordDeviceDriver pdbbase

save_restoreSet_Debug(10)

#< ./iocBoot/$(IOC)/AutoSaveSetup.cmd

drvAsynIPPortConfigure("UHR_PORT","10.32.240.76:4006",0,0,0) 

#asynSetTraceIOMask("UHR_PORT",-1,0x2)
#asynSetTraceMask("UHR_PORT",-1,0x9)

## Load record instances
#dbLoadRecords("db/xxx.db","user=baiHost")
dbLoadRecords("db/wasseruhr.db","PORT=UHR_PORT")

cd "${TOP}/iocBoot/${IOC}"
iocInit

#< AutoSaveTask.cmd

## Start any sequence programs
#seq sncxxx,"user=baiHost"
