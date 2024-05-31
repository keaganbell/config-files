# project variabls
EXECUTABLE_NAME=sample-project

# compiler variables
CC=cc
CFLAGS=-Wall -Wextra
INCLUDE=-Isource/core -Isource/app

# manage proper directories for certain build configurations
# debug, release, retail, etc
BUILD_DIR=build
BIN_DIR=$(BUILD_DIR)/bin

all: $(EXECUTABLE_NAME)

$(EXECUTABLE_NAME): $(BIN_DIR)/sample-app.o
	$(CC) $(CFLAGS) $(INCLUDE) $(BIN_DIR)/sample-app.o -o $(BUILD_DIR)/$(EXECUTABLE_NAME)

$(BIN_DIR)/sample-app.o: source/app/sample_app.c
	$(CC) $(CFLAGS) $(INCLUDE) -r source/app/sample_app.c -o $(BIN_DIR)/sample-app.o

clean:
	rm $(BUILD_DIR)/$(EXECUTABLE_NAME)
	rm $(BIN_DIR)/*.o
