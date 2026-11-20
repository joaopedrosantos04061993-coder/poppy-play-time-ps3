.SUFFIXES:
ifeq ($(strip $(PSL1GHT)),)
$(error "PSL1GHT nao definido")
endif

include $(PSL1GHT)/ppu_rules

.RECIPEPREFIX = >

TARGET    := PoppyPlaytimePS3
BUILDDIR  := $(CURDIR)/build
DEPSDIR   := $(BUILDDIR)
$(shell mkdir -p $(BUILDDIR))

SRCS      := $(wildcard src/*.c)
OFILES    := $(SRCS:.c=.o)

TITLE     := Poppy Playtime PS3
APPID     := POPT00001
CONTENTID := UP0001-$(APPID)_00-0000000000000000
SFOXML    := $(CURDIR)/sfo.xml
ICON0     := $(CURDIR)/ICON0.PNG

PORTLIBS  := $(PS3DEV)/portlibs/ppu
CFLAGS    = -O2 -Wall -mcpu=cell $(MACHDEP) -I$(PS3DEV)/ppu/include -I$(PORTLIBS)/include -Isrc
LDFLAGS   = $(MACHDEP) -L$(PS3DEV)/ppu/lib -L$(PORTLIBS)/lib
LIBS      := -ltiny3d -lrsx -lgcm_sys -lsysutil -lio -lm

.PHONY: all pkg clean

all: pkg

pkg: $(TARGET).pkg

$(TARGET).elf: $(OFILES)
> $(CC) $^ $(LDFLAGS) $(LIBS) -o $@

clean:
> rm -rf build src/*.o $(TARGET).elf $(TARGET).self $(TARGET).pkg
