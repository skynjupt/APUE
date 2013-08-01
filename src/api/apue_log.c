#include "apue.h"
#include <errno.h>	/* for definition of errno */
#include <stdarg.h>	/* ISO C variable aruments */
#include <syslog.h>

static void log_doit(int, int, const char *, va_list ap);

/*
 * Caller must define and set this:
 * nonzero if interactive, zero if daemon
 */
extern int log_to_stderr;
/*
 * Fatal error related to a system call.
 * Print a message and terminate.
 */
void log_sys(const char *fmt, ...)
{
	va_list ap;
	
	va_start(ap, fmt);
	log_doit(1, LOG_ERR, fmt, ap);
	va_end(ap);
	exit(2);	
}

/*
 * Print a message and return to caller.
 * Caller specifies "errnoflag" and "proority".
 */
static void log_doit(int errnoflag, int priority, const char *fmt, va_list ap)
{
	int errno_save;
	char buf[MAXLINE];

	errno_save = errno;	/* value caller might want printed */
	vsnprintf(buf, MAXLINE, fmt, ap);
	if (errnoflag)
	{
		snprintf(buf+strlen(buf), MAXLINE-strlen(buf), ": %s", strerror(errno_save));
	}
	strcat(buf, "\n");
	if(log_to_stderr)
	{
		fflush(stdout);
		fputs(buf, stderr);
		fflush(stderr);
	}
	else
	{
		syslog(priority, buf);
	}
}
