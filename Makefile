# project variabls
EXECUTABLE_NAME=sample-project

# manage proper directories for certain build configurations
# debug, release, retail, etc
BUILD_DIR=build
BIN_DIR=$(BUILD_DIR)/bin
EXECUTABLE=$(BUILD_DIR)/$(EXECUTABLE_NAME)

RM=rm -f
CC=cc

# platform detection
ifeq ($(OS), Windows_NT)
	PLATFORM=Windows
else
	PLATFORM=$(shell uname)
endif

# specify platform specific variables like commands, paths, etc
ifeq ($(PLATFORM), Windows)
	RM=del
	CC=gcc
	BIN_DIR=$(BUILD_DIR)\bin
	EXECUTABLE="$(BUILD_DIR)\$(EXECUTABLE_NAME).exe"
endif


# compiler variables
CFLAGS=-Wall -Wextra
INCLUDE=-Isource/core -Isource/app


all: $(EXECUTABLE_NAME)

$(EXECUTABLE_NAME): $(BIN_DIR)/sample-app.o
	@mkdir -p $(BIN_DIR)
	$(CC) $(CFLAGS) $(INCLUDE) $(BIN_DIR)/sample-app.o -o $(EXECUTABLE)

$(BIN_DIR)/sample-app.o: source/app/sample_app.c
	@mkdir -p $(BIN_DIR)
	$(CC) $(CFLAGS) $(INCLUDE) -r source/app/sample_app.c -o $(BIN_DIR)/sample-app.o

ifeq ($(PLATFORM), Windows)
clean:
	$(RM) $(EXECUTABLE)
	$(RM) $(BIN_DIR)\*.o
else ifeq ($(PLATFORM), Linux)
clean:
	$(RM) $(EXECUTABLE)
	$(RM) $(BIN_DIR)/*.o
endif
