# Selecting the cpp compiler
COMPILER=g++

# Compiling-process' Flags
CFLAGS=-g -Wall

# OBJ_FILES contains all file
OBJ_FILES=\
	main.o

# Naming the output
TARGET_EXEC=app.out
BUILD_DIR=./build
HEADER_DIR=./include
SRC_DIR=./src


###########################
## DO NOT MODIFY         ##
##                       ##
###########################

# Search for .c files in src diractory;
# and for .h files in include diractory;
# plus the .o files
vpath %.cpp $(SRC_DIR)
vpath %.h $(HEADER_DIR)
vpath %.o $(BUILD_DIR)


all: $(TARGET_EXEC)
	 echo ----- Running $^ -----
	$(BUILD_DIR)/$^

# To compile our project into an executable file
# The files that are going to be used are only the ones metionned in OBJ_FILES
$(TARGET_EXEC): $(OBJ_FILES)
	$(COMPILER) $(CFLAGS) -o $(BUILD_DIR)/$@ $(BUILD_DIR)/$^

# Rule to compile source files into object files
# The matched source files include their path. so there is no need to specify the SRC_DIR
%.o: %.cpp
	$(COMPILER) $(CFLAGS) -c -o $(BUILD_DIR)/$@ $^

clean:
	rm $(BUILD_DIR)/*.o $(BUILD_DIR)/$(TARGET_EXEC)
