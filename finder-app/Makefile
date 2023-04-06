#############
## TARGETS ##
#############
# target: prerequisites
#    commands

# The commands are a series of steps typically to make the target,
#   need to start with a tab character, not space
# The prerequisites are file names, separated by spaces.
#  These files need to exist before the commands for the target are run.

###############
## VARIABLES ##
###############
# Note: Variables can only be strings, no data types
# Note: single or double quotes for variables names or values have no meaning to Make
#

# %make -p // see predefined values
# CC: Program for compiling C programs; default cc
# CXX: Program for compiling C++ programs; default g++
# CFLAGS: Extra flags to give to the C compiler
# CXXFLAGS: Extra flags to give to the C++ compiler
# CPPFLAGS: Extra flags to give to the C preprocessor
# LDFLAGS: Extra flags to give to the linker
# TARGET_ARCH: for cross compiler
# COMPILE.c = $(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c

# Examples
# CXX_STANDARD = c++17
# CXX_WARNINGS = -Wall -Wextra -Wpedantic
# CXX = g++
# CXXFLAGS = $(CXX_WARNINGS) -std=$(CXX_STANDARD)
# LDFLAGS = -lmath

## argv = ARG_DIR ##
ARG_DIR = 0 
ifeq ($(ARG_DIR), 1)
DIRECTORY = ./tmp1/tmp2/tmp3/tmp.txt
else
DIRECTORY = /tmp/aeld-data/tmp.txt
endif

## argv = ARG_TEXT ##
TEXT_INPUT1 = "The quick brown fox jumps over the lazy dog near the bank of the river."
TEXT_INPUT2 = "Hello World"
TEXT_INPUT3 = "Cherelei Christine Castelo Banzon"
ARG_TEXT = 1
ifeq ($(ARG_TEXT), 1)
TEXT = $(TEXT_INPUT1)
else ifeq ($(ARG_TEXT), 2)
TEXT = $(TEXT_INPUT2)
else
TEXT = $(TEXT_INPUT3)
endif

## argv = ARG_DEBUG ##
ARG_DEBUG = 0
ifeq ($(ARG_DEBUG), 1)
GCC_DEBUG = -g -Wall
else
GCC_DEBUG =
endif

## argv = ARG_NO_LINK ##
ARG_NO_LINK = 0
ifeq ($(ARG_NO_LINK), 1)
GCC_NO_LINK = -c
GCC_NO_LINK_2 = -I/
else
GCC_NO_LINK =
GCC_NO_LINK_2 =
endif

GCC_OPTIONS = $(GCC_DEBUG) $(GCC_NO_LINK)
GCC_OPTIONS_2 = $(GCC_DEBUG) $(GCC_NO_LINK_2)

## argv = ARG_CROSS_COMPILE ##
ARG_CROSS_COMPILE = 
ifeq ($(ARG_CROSS_COMPILE), aarch64-none-linux-gnu-)
COMPILER_CALL = aarch64-none-linux-gnu-gcc $(GCC_OPTIONS)
else
COMPILER_CALL = gcc $(GCC_OPTIONS) 
endif

## CROSS_COMPILE_2 ##
CROSS_COMPILE_2 = 
ifeq ($(ARG_CROSS_COMPILE), aarch64-none-linux-gnu-)
COMPILER_CALL_2 = aarch64-none-linux-gnu-gcc $(GCC_OPTIONS_2)
else
COMPILER_CALL_2 = gcc $(GCC_OPTIONS_2) 
endif

build: writer

writer:
ifeq ($(ARG_NO_LINK), 0)
	$(COMPILER_CALL) writer.c -o writer
else
	$(COMPILER_CALL) writer.c -o writer.o
	$(COMPILER_CALL_2) writer.o -o writer
endif

execute:
	./writer $(DIRECTORY) $(TEXT)

clean:
	rm -rf *.o writer *.elf *.map
