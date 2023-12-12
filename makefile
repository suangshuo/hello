CC = g++
LK = ld
OBJ = obj
BIN = bin
INC = inc
SRC = src

INCS = -I $(INC)
SRCS = $(wildcard  $(SRC)/*.cpp)
OBJS = $(patsubst %.cpp , $(OBJ)/%.o , $(SRCS))


Build = $(BIN)/hello

$(Build):$(OBJS)
	$(CC) -o $@ $<
$(OBJS)/%.o:$(SRCS)/%.c
	$(CC) $(INCS) -c $< -o $@
	
run:
	$(Build)
clear:
	rm $(BIN)/$(Build)
	find $(OBJS) -name *.o -exec rm -rf {} \;
