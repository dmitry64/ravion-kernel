#
# Makefile for PPS clients.
#

obj-$(CONFIG_PPS_CLIENT_KTIMER)	+= pps-ktimer.o
obj-$(CONFIG_PPS_CLIENT_LDISC)	+= pps-ldisc.o

ifeq ($(CONFIG_PPS_DEBUG),y)
ccflags-y += -DDEBUG
endif
