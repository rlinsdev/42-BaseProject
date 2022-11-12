# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rlins <rlins@student.42sp.org.br>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/12 08:46:02 by rlins             #+#    #+#              #
#    Updated: 2022/11/12 10:39:03 by rlins            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Color Aliases
DEFAULT 	= \033[0;39m
GRAY 		= \033[0;90m
RED 		= \033[0;91m
GREEN 		= \033[0;92m
YELLOW 		= \033[0;93m
BLUE 		= \033[0;94m
MAGENTA 	= \033[0;95m
CYAN 		= \033[0;96m
WHITE 		= \033[0;97m

SHELL=/bin/bash
# UNAME = $(shell uname -s)

# # Properties for MacOS
# CDEBUG = #-fsanitize=address
# CHECKER = tests/checker_Mac
# ifeq ($(UNAME), Linux)
# 	#Properties for Linux
# 	LEAKS = valgrind --leak-check=full --track-fds=yes --trace-children=yes -s -q
# endif

# Make variables
AR = ar rcs
# CFLAGS = -Wall -Wextra -Werror -MD -g3
CFLAGS = -g
RM = rm -f
CC = gcc
PRINTF = LC_NUMERIC="en_US.UTF-8" printf

SRC_DIR = src
OBJ_DIR = obj
BIN_DIR = bin

# LIBFT = libft/bin/libft.a
LIBFT 	= lib/libft/libft.a
BIN 	= minishell
NAME 	= $(BIN_DIR)/$(BIN)

SRC = ./src/main/main.c ./src/builtins/builtins.c ./src/init/init.c

OBJ = $(addprefix $(OBJ_DIR)/, $(SRC:.c=.o))

OBJ_LFT = $(addprefix $(OBJ_LFT_DIR)/, $(SRC_LFT:.c=.o))

# Progress vars
SRC_COUNT_TOT := $(shell expr $(shell echo -n $(SRC) | wc -w) - $(shell ls -l $(OBJ_DIR) 2>&1 | grep ".o" | wc -l) + 1)
ifeq ($(shell test $(SRC_COUNT_TOT) -le 0; echo $$?),0)
	SRC_COUNT_TOT := $(shell echo -n $(SRC) | wc -w)
endif
SRC_COUNT := 0
SRC_PCT = $(shell expr 100 \* $(SRC_COUNT) / $(SRC_COUNT_TOT))

all: $(NAME)

$(NAME): create_dirs compile_libft $(OBJ)
	@$(CC) -L /usr/local/opt/readline/lib -I /usr/local/opt/readline/include -L ~/.brew/opt/readline/lib -I ~/.brew/opt/readline/include $(CFLAGS) $(CDEBUG) $(OBJ) $(LIBFT) -lreadline -o $@
	@$(PRINTF) "\r%100s\r$(GREEN)$(BIN) is up to date!$(DEFAULT)\n"

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@$(eval SRC_COUNT = $(shell expr $(SRC_COUNT) + 1))
	@$(PRINTF) "\r%100s\r[ %d/%d (%d%%) ] Compiling $(BLUE)$<$(DEFAULT)..." "" $(SRC_COUNT) $(SRC_COUNT_TOT) $(SRC_PCT)
	@$(CC) -I ~/.brew/opt/readline/include -I /usr/local/opt/readline/include $(CFLAGS) $(CDEBUG) -c $< -o $@

compile_libft:
# @if [ ! -d "lib/libft" ]; then \
# 	cd lib && git clone https://github.com/rlinsdev/42-Libft.git; \
# fi
	@make -C lib/libft

create_dirs:
	@mkdir -p $(OBJ_DIR)
	@mkdir -p $(BIN_DIR)

run: all
	@$(LEAKS)./$(NAME)

clean:
	@$(PRINTF) "$(CYAN)Cleaning up object files in $(BIN)...$(DEFAULT)\n"
	@if [ -d "lib/libft" ]; then \
		make clean -C libft/; \
	fi
	@$(RM) -r $(OBJ_DIR)

fclean: clean
	@$(RM) -r $(BIN_DIR)
	@$(PRINTF) "$(CYAN)Removed $(BIN)$(DEFAULT)\n"

norminette:
	@if [ -d "lib/libft" ]; then \
		make norminette -C libft/; \
	fi
	@$(PRINTF) "$(CYAN)\nChecking norm for $(BIN)...$(DEFAULT)\n"
	@norminette -R CheckForbiddenSourceHeader $(SRC_DIR) inc/

re: fclean
	@make all

-include $(OBJ_DIR)/*.d
-include $(OBJB_DIR)/*.d

.PHONY: all clean fclean norminette create_dirs test git re

