#include <drivers/tty.h>

void kmain(void) {
    terminal_writestring("You're not welcome to AnarchyUnix\n");
    terminal_writestring("Version: 0.01\n");
    terminal_writestring("Anarchy burger!! Hold the government!\n");
}
