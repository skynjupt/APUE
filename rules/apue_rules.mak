################################
# apue_rules.mak
################################

################################
## SRCS ==> OBJS
################################

PUBLIC_OBJS = $(SRCS:.c=.o)
DEP_OBJS := $(PUBLIC_OBJS:.o=.d)

################################
## OPTIMIZATION_LEVEL
################################

ifeq "$(origin OPTIMIZATION_LEVEL)" "undefined"
	OPTIMIZATION_LEVEL := -O2
endif

################################
## build
################################

#$(TARGET): $(PUBLIC_OBJS)

subclean:
	@-$(RM) $(PUBLIC_OBJS)
	@-$(RM) $(DEP_OBJS)	

################################
## Automatic Dependency Generation
################################
SRCS_TO_BE_ADG = $(SRCS)

DEP ?= $(subst .c,.d,$(SRCS_TO_BE_ADG))

-include $(DEP)

################################
## Rules
################################

%.d:%.c
	@$(CC) -MM $(CFLAGS) $< > $@.$$$$ 2>/dev/null; \
	sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
	$(RM) $@.$$$$
	
%.o:%.c
	@echo "-----"$(CC)" "$<"-----"
	$(CC) $(CFLAGS) -c $< $(OPTIMIZATION_LEVEL) -o $@

################################
## eof
################################
