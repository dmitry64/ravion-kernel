#
# Makefile for the kernel MemoryStick device drivers.
#

ifeq ($(CONFIG_MEMSTICK_DEBUG),y)
	ccflags-y		+= -DDEBUG
endif

obj-$(CONFIG_MEMSTICK)		+= core/
obj-$(CONFIG_MEMSTICK)		+= host/

