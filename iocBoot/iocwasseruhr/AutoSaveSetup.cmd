save_restoreSet_Debug(40)                    # 0=initially
sr_restore_incomplete_sets_ok = 1
#reboot_restoreDateBU = 1
save_restoreSet_status_prefix("UHR_PORT")

set_savefile_path("$(TOP)/iocBoot/$(IOC)","")
set_savefile_path("$(TOP)/iocBoot/$(IOC)","autosave")

set_requestfile_path("$(TOP)/iocBoot/$(IOC)", "")
set_requestfile_path("$(TOP)/iocBoot/$(IOC)", "autosave")

#set_pass0_restoreFile("info_positions.sav") 
set_pass1_restoreFile("info_positions.sav") 

save_restoreSet_IncompleteSetsOk(1)

#save_restoreSet_DatedBackupFiles(1)
#save_restoreSet_FilePermissions(0640)
save_restoreShow(1)
save_restoreSet_NumSeqFiles(3)             # 3=initially
save_restoreSet_SeqPeriodInSeconds(180)    #60=initially 
save_restoreSet_RetrySeconds(10)           #60=initially
save_restoreSet_CAReconnect(1)

