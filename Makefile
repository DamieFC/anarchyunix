# F*ckin makefile

ARCH = i386
CC = ./toolchain/compiler/bin/i686-elf-gcc
AS = ./toolchain/compiler/bin/i686-elf-as
LD = $(CC)
INCLUDE = -I./kernel/include/ -I./kernel/ -I./lib/libc/include
KERNEL_FILE = kernel.bin
ISO_FILE = anarchy-unix.iso

CFLAGS = -ffreestanding $(INCLUDE)
LDFLAGS = -T./kernel/arch/$(ARCH)/linker.ld -ffreestanding -O2 -nostdlib

C_SOURCES = $(shell find kernel/ -name '*.c')
ASM_SOURCES = $(shell find kernel/ -name '*.S')
OBJ_FILES = $(C_SOURCES:.c=.o) $(ASM_SOURCES:.S=.o)

$(ISO_FILE): $(KERNEL_FILE)
	@cp $(KERNEL_FILE) boot/
	@grub-mkrescue -o $(ISO_FILE) boot

$(KERNEL_FILE): $(OBJ_FILES)
	@echo "LD $^"
	@$(LD) $(LDFLAGS) $^ -o $@

%.o: %.c
	@echo "CC $<"
	@$(CC) $(CFLAGS) -c $< -o $@

%.o: %.S
	@echo "AS $<"
	@$(AS) $< -o $@
	
clean:
	@rm $(OBJ_FILES)
	@rm $(KERNEL_FILE) $(ISO_FILE)
	
run:
	@qemu-system-i386 $(ISO_FILE)
