#ifndef _INCLUDE_DRIVERS_TTY_H
#define _INCLUDE_DRIVERS_TTY_H

#include <stddef.h>
 
void terminal_initialize(void);
void terminal_putchar(char c);
void terminal_write(const char* data, size_t size);
void terminal_writestring(const char* data);
 
#endif //_INCLUDE_DRIVERS_TTY_H