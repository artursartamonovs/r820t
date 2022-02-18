DIR=utils

SRC_UTILS     += $(wildcard $(DIR)/*.c)
SRC_UTILS_PRE += $(wildcard $(DIR)/convenience/*.c)
OBJ_UTILS     += $(SRC_UTILS:.c=)
OBJ_UTILS_PRE += $(SRC_UTILS_PRE:.c=.o)
LDFLAGS_UTILS = -pthread  -lr820t -lm -L.

$(DIR)-pre: $(OBJ_UTILS_PRE)

$(DIR)/convenience/%.o: $(DIR)/convenience/%.c
	$(CC) $(CFLAGS) $(INCLUDE) -c $< -o $(BUILD_DIR)$@

$(DIR)/%:  $(DIR)/%.c
	$(CC) $(CFLAGS) $(INCLUDE) $(BUILD_DIR)$(OBJ_UTILS_PRE)  $< -o $(BUILD_DIR)$@ $(LDFLAGS_UTILS) 
