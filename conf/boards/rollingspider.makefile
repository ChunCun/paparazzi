# Hey Emacs, this is a -*- makefile -*-
#
# bebop.makefile
#
# http://wiki.paparazziuav.org/wiki/RollingSpider
#

BOARD=rollingspider
BOARD_CFG=\"boards/$(BOARD).h\"

ARCH=linux
$(TARGET).ARCHDIR = $(ARCH)
# include conf/Makefile.rollingspider (with specific upload rules) instead of only Makefile.linux:
ap.MAKEFILE = rollingspider

# -----------------------------------------------------------------------
USER=foobar
HOST?=192.168.2.1
SUB_DIR=internal_000/paparazzi
FTP_DIR=/data/ftp
TARGET_DIR=$(FTP_DIR)/$(SUB_DIR)
# -----------------------------------------------------------------------

# The datalink default uses UDP
MODEM_HOST         ?= 192.168.2.255

# The GPS sensor is connected internally
GPS_PORT           ?= UART1
GPS_BAUD           ?= B230400

# handle linux signals by hand
$(TARGET).CFLAGS += -DUSE_LINUX_SIGNAL

# Compile the video specific parts
$(TARGET).srcs +=  $(SRC_BOARD)/video.c

# -----------------------------------------------------------------------

# default LED configuration
RADIO_CONTROL_LED				?= none
BARO_LED           			?= none
AHRS_ALIGNER_LED   			?= 1
GPS_LED            			?= none
SYS_TIME_LED       			?= 0