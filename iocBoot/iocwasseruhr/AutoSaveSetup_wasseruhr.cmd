#
######## autoSaveRestore setup ########
#
#Increase to get more informational messages printed to the console.
save_restoreSet_Debug(0)                    # 0=initially

#
# status-PV prefix, so save_restore can find its status PV's.
#save_restoreSet_status_prefix("xxx:")
save_restoreSet_status_prefix("UHR_PORT")
#
save_restoreSet_IncompleteSetsOk(1)
# In the restore operation, a copy of the save file will be written.  The
# file name can look like "auto_settings.sav.bu", and be overwritten every
# reboot (0), or it can look like "auto_settings.sav_020306-083522" (this is what
# is meant by a dated backup file) and every reboot will write a new copy (1).
##save_restoreSet_DatedBackupFiles(1)
#
# sepecify where save files should go
set_savefile_path("$(TOP)/iocBoot/$(IOC)", "autosave")
#
# specify where request files can be found
# current directory
set_requestfile_path("$(TOP)/iocBoot/$(IOC)", "")
#
set_pass0_restoreFile("info_wasseruhr.sav")
#
# Number of sequenced backup files (e.g., 'auto_settings.sav0') to write
save_restoreSet_NumSeqFiles(3)             # 3=initially
#
# Time interval between sequenced backups 
save_restoreSet_SeqPeriodInSeconds(600)    #60=initially 
#
# Time between failed .sav-file write and the retry.
save_restoreSet_RetrySeconds(60)           #60=initially

# Ok to retry connecting to PVs whose initial connection attempt failed?
save_restoreSet_CAReconnect(1)
#
######## end autoSaveRestore setup #######
#
