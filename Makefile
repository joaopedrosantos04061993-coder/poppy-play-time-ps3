.SUFFIXES:
ifeq ($(strip $(PSL1GHT)),)
$(error "PSL1GHT nao definido")
endif

include $(PSL1GHT)/ppu_rules

TARGET    := PoppyPlaytimePS3
BUILD     := build
SOURCES   := src
INCLUDES  := src
LIBS      := -ltiny3d -lrsx -lgcm_sys -lsysutil -lio -lm

TITLE     := Poppy Playtime PS3
APPID     := POPT00001
CONTENTID := UP0001-$(APPID)_00-0000000000000000
SFOXML    := sfo.xml

include $(PSL1GHT)/base_rules
