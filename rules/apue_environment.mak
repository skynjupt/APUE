#############################
# apue_environment.mak
#############################

#############################
## include
#############################

APUE_INCLUDE_PATH := -I $(INC_DIR)

#############################
## CFLAGS
#############################
CFLAGS += $(APUE_INCLUDE_PATH)

## eof
