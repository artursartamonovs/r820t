PROJECT=r820t
CC=gcc
CFLAGS=
INCLUDE=-I./include 
INCLUDE+=`pkg-config --cflags libusb`
LDFLAGS=
LDFLAGS+=`pkg-config --libs libusb`

SOURCES=
SRC_LIB=
OBJ_LIB=
SRC_UTILS=
OBJ_UTILS=

BUILD_DIR=build/

include src/make.mk
include utils/make.mk

OBJECTS=$(SOURCES:.c=.o)

lib: src-lib

utils: $(DIR)-pre $(OBJ_UTILS)

all: $(OBJECTS)

make: $(OBJECTS)
	echo $(OBJECTS)


%.o: %.c
	$(CC) $(CFLAGS) $(INCLUDE) -c $< -o $(BUILD_DIR)$@

clean:
	rm -f *.a
	rm -f *.so
	rm -f *.so.1
	rm -f build/src/*.o
	rm -f build/utils/rtl_*
	rm -f build/utils/convenience/*.o
