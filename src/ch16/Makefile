include ../path.def
include $(RULES_DIR)/apue_generic.mak

APUE_APP_GETADDRINFO_NAME:=getaddrinfo
APUE_APP_UPTIME_CLIENT_NAME:=ruptime
APUE_APP_UPTIME_SERVER_NAME:=ruptimed

APUE_ALL_APP_NAME:=$(APUE_APP_GETADDRINFO_NAME) $(APUE_APP_UPTIME_CLIENT_NAME) $(APUE_APP_UPTIME_SERVER_NAME) 

####################################
## src
####################################
SRCS:= 16_01_getaddinfo.c 16_02_connect_retry.c 16_03_initserver.c 16_04_ruptime.c 16_05_ruptimed.c

####################################
## lib
####################################

LIB_PATH := $(LIB_DIR)/
LIB_NAME := -lapue 

####################################
## build
####################################

all:link_app

include $(RULES_DIR)/apue_rules.mak

#LDFLAGS += -static

link_app:$(PUBLIC_OBJS)
#	@echo linking applation $@ $^
#	$(CC) -o $(APUE_APP_NAME) $<
	$(CC) -o $(APUE_APP_GETADDRINFO_NAME) 16_01_getaddinfo.o -L$(LIB_PATH) $(LIB_NAME) $(LDFLAGS)
	$(CC) -o $(APUE_APP_UPTIME_CLIENT_NAME) 16_04_ruptime.o 16_02_connect_retry.o -L$(LIB_PATH) $(LIB_NAME) $(LDFLAGS)
	$(CC) -o $(APUE_APP_UPTIME_SERVER_NAME) 16_05_ruptimed.o 16_03_initserver.o -L$(LIB_PATH) $(LIB_NAME) $(LDFLAGS)

clean: subclean
	@-$(RM) $(APUE_ALL_APP_NAME)
