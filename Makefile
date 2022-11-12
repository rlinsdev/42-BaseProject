# Collors
GREEN = \033[0;32m
RED = \033[0;31m
BLUE = \033[0;34m
RESET = \033[0m

# Paths
HEADERS_PATH = ./include/
SRCS_PATH = ./src/
OBJS_PATH = ./obj/
LIBS_PATH = ./lib/
BINS_PATH = ./bin/

# Compilation
CC = gcc
FLAGS = -Wall -Wextra -Werror

# Bash commands
RM = rm -f # -f Force
MKDIR = mkdir -p
MAKE_NOPRINT = $(MAKE) --no-print-directory

# Files
LIBNAME = baseproject.a
SRC_FILES = float_vector.c \
			mytime.c

SOURCES = $(addprefix $(SRCS_PATH), $(SRC_FILES))
OBJ_FILES = $(patsubst %.c, %.o, $(SRC_FILES))
OBJECTS = $(addprefix $(OBJS_PATH), $(OBJ_FILES))
EXECUTABLE = ft_baseproject_test

# TARGETS
all: libft $(LIBNAME)

# Compiles libft all over
libft:
	@echo "$(LIBNAME): $(BLUE)Generating... Just a minute$(RESET)"
	@cd $(LIBS_PATH)libft && $(MAKE_NOPRINT)
	@echo "$(LIBNAME): $(GREEN)Done!$(RESET)"

# Creates static library libft.a inside ./libs/ folder
$(LIBNAME): $(OBJECTS)
	@cp $(LIBS_PATH)/libft.a $(LIBS_PATH)$(LIBNAME)
	@ar -rcs $(LIBS_PATH)$(LIBNAME) $(OBJECTS)

# Creates object files for ft_baseprojct
$(OBJS_PATH)%.o : $(SRCS_PATH)%.c $(HEADERS_PATH)*.h
	@$(MKDIR) $(OBJS_PATH)
	@$(CC) $(FLAGS) -c $< -I $(HEADERS_PATH) -o $@

#
# RUN
#
# Creates the executable file $(EXECUTABLE) to test development
main:	./apps/app.c
	@$(MKDIR) $(BINS_PATH)
	@$(CC) $(CFLAGS) $< $(LIBS_PATH)$(LIBNAME) -I $(HEADERS_PATH) -o $(BINS_PATH)$(EXECUTABLE)

# Compile program and execute main file
run: all main
	@$(BINS_PATH)$(EXECUTABLE)
	@$(MAKE_NOPRINT) fclean

#
# SANITIZE
#
# Removing .o files
clean:
	@echo "$(LIBNAME): $(RED)object (*.o) files were deleted$(RESET)"
	@$(RM) $(OBJECTS)
	@cd $(LIBS_PATH)libft && $(MAKE_NOPRINT) $@

# Removing .o files, .a files
fclean: clean
	@echo "$(LIBNAME): $(RED)was deleted$(RESET)"
	@$(RM) $(BINS_PATH)$(EXECUTABLE)
	@$(RM) $(LIBS_PATH)$(LIBNAME)
	@cd $(LIBS_PATH)libft && $(MAKE_NOPRINT) $@

# Removing and running
re: fclean all

.PHONY: all run clean fclean re
