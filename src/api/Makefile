include ../path.def
include $(RULES_DIR)/apue_generic.mak

###################################
## module
###################################
APUE_MODULE_NAME:=apue

APUE_BUILD_DIR:=$(APUE_CURR_DIR)
APUE_MODULE_ROOT:=$(APUE_CURR_DIR)
APUE_MODULE_EXPORT_DIR:=$(APUE_EXPORTS)
APUE_MODULE_LIB_NAME:=$(addsuffix .a,$(addprefix $(APUE_MODULE_EXPORT_DIR)/lib,$(APUE_MODULE_NAME)))

####################################
## path
####################################
vpath %.c $(APUE_MODULE_ROOT)/

CFLAGS += -I $(APUE_MODULE_ROOT)

####################################
## src
####################################
SRCS:=apue_err.c apue_log.c

####################################
## build
####################################

all:link_app

include $(RULES_DIR)/apue_rules.mak

link_app:$(PUBLIC_OBJS)
	@echo $(AR)" "$(APUE_MODULE_LIB_NAME)" <---"
	@$(AR) -rcs $(APUE_MODULE_LIB_NAME) $^

clean: subclean
