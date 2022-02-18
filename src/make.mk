DIR_SRC=src
SRC_LIB += $(wildcard $(DIR_SRC)/*.c)
OBJ_LIB += $(SRC_LIB:.c=.o)
LDFLAGS_LIB=`pkg-config --libs libusb` -lc

$(DIR_SRC)-lib-o: $(OBJ_LIB)

$(DIR_SRC)-lib: $(DIR_SRC)-lib-o
	gcc -shared -Wl,-soname,lib$(PROJECT).so -o lib$(PROJECT).so $(subst $(DIR_SRC)/,$(BUILD_DIR)$(DIR_SRC)/,$(OBJ_LIB)) $(LDFLAGS_LIB) 
	ar rcv lib$(PROJECT).a $(subst $(DIR_SRC)/,$(BUILD_DIR)$(DIR_SRC)/,$(OBJ_LIB))

$(DIR_SRC)/%.o: $(DIR_SRC)/%.c
	$(CC) $(CFLAGS) -fPIC $(INCLUDE) -c $< -o $(BUILD_DIR)$@
