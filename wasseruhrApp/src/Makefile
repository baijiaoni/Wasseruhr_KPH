TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = wasseruhr
# wasseruhr.dbd will be created and installed
DBD += wasseruhr.dbd

# wasseruhr.dbd will be made up from these files:
wasseruhr_DBD += base.dbd

# Include dbd files from all support applications:
#wasseruhr_DBD += xxx.dbd
wasseruhr_DBD += asSupport.dbd
wasseruhr_DBD += stream.dbd
wasseruhr_DBD += drvAsynIPPort.dbd
#wasseruhr_DBD += sncExample.dbd

# Add all the support libraries needed by this IOC
#wasseruhr_LIBS += xxx
wasseruhr_LIBS += asyn
wasseruhr_LIBS += autosave
wasseruhr_LIBS += stream
wasseruhr_LIBS += seq pv

# wasseruhr_registerRecordDeviceDriver.cpp derives from wasseruhr.dbd
wasseruhr_SRCS += wasseruhr_registerRecordDeviceDriver.cpp
#wasseruhr_SRCS += sncExample.st

# Build the main IOC entry point on workstation OSs.
wasseruhr_SRCS_DEFAULT += wasseruhrMain.cpp
wasseruhr_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#wasseruhr_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
wasseruhr_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

