############################
# apue_generic.mak
############################

############################
## build dir
############################

APUE_CURR_DIR := $(shell cd ./;pwd)
ifeq "$(origin APUE_EXPORTS)" "undefined"
APUE_EXPORTS := $(LIB_DIR)
endif

############################
## include
############################

include $(RULES_DIR)/apue_environment.mak
include $(RULES_DIR)/apue_toolset.mak

############################
## eof
############################

