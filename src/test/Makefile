include ../path.def
include $(RULES_DIR)/apue_generic.mak

#ifeq "$(origin APUE_APP_NAME)" "undefined"
	APUE_APP_NAME:=apueApp
#endif

####################################
## src
####################################
SRCS:=main.c

####################################
## build
####################################

all:link_app

include $(RULES_DIR)/apue_rules.mak

link_app:$(PUBLIC_OBJS)
	@echo linking applation $@ $^
	$(CC) -o $(APUE_APP_NAME) $<

clean: subclean
	@-$(RM) $(APUE_APP_NAME)
