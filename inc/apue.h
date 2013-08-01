#ifndef _APUE_H_
#define _APUE_H_

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define MAXLINE 4096	/* max line length */

void err_msg(const char *, ...);
void err_quit(const char *, ...);
void err_sys(const char *, ...);

void log_sys(const char *, ...);

#endif
