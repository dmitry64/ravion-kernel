#
# Makefile for the kernel MemoryStick core.
#

ifeq ($(CONFIG_MEMSTICK_DEBUG),y)
	ccflags-y		+= -DDEBUG
endif

obj-$(CONFIG_MEMSTICK)		+= memstick.o

obj-$(CONFIG_MSPRO_BLOCK)	+= mspro_block.o
