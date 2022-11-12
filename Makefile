# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rlins <rlins@student.42sp.org.br>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/12 08:46:02 by rlins             #+#    #+#              #
#    Updated: 2022/11/12 13:24:40 by rlins            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = minishell

# Collors
RESET 	= \033[0m
GREEN 	= \033[0;32m
RED 	= \033[0;31m

# Paths
PATH_SRC 		= ./src/
PATH_MAIN 		= $(PATH_SRC)main/
PATH_INIT 		= $(PATH_SRC)init/
PATH_BUILTINS 	= $(PATH_SRC)builtins/
PATH_OBJS 		= ./objs/

INC_PATH 		= ./include/

# Libft files and directories
LIBFT_PATH 		= ./lib/libft/
LIBFT 			= ./lib/libft.a

# Compilation
CC = gcc

# TODO: RollBack this flags
# CFLAGS = -g -Wall -Werror -Wextra
CFLAGS = -g

RM = rm -rf

INCLUDE = -I $(INC_PATH) -I $(LIBFT_PATH)

SRCS =	$(PATH_MAIN)main.c \
		$(PATH_INIT)init.c \
		$(PATH_BUILTINS)echo.c

OBJS = $(patsubst $(PATH_SRC)%.c, $(PATH_OBJS)%.o, $(SRCS))

all: $(LIBFT) $(NAME)

# $(NAME): $(OBJS)
# 	@$(CC) $(CFLAGS) $(INCLUDE) ./objs/*/*.o -o $(NAME) $(LIBFT) -lreadline
# 	@echo "$(GREEN)Build Successfully$(RESET)"
$(NAME): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@ $(INCLUDE) $(LIBFT) -l readline
	@echo "$(GREEN)Build Successfully$(RESET)"

$(PATH_OBJS)%.o: $(PATH_SRC)%.c
	@mkdir -p $(PATH_OBJS)
	@mkdir -p $(PATH_OBJS)main/
	@mkdir -p $(PATH_OBJS)init/
	@mkdir -p $(PATH_OBJS)builtins/
	@$(CC) $(CFLAGS) $(INCLUDE) -I. -c $< -o $@

# Libft rule
$(LIBFT):
	make -C $(LIBFT_PATH)

clean:
	@echo "$(RED)Cleaning objects$(RESET)"
	@$(RM) $(PATH_OBJS)
	make -C $(LIBFT_PATH) clean
	@echo "$(GREEN)Done!$(RESET)"

fclean: clean
	@echo  "$(RED)Cleaning all$(RESET)"
	@$(RM) $(NAME)
	make -C $(LIBFT_PATH) fclean
	@echo  "$(RED)Cleaning binaries$(RESET)"
	@echo "$(GREEN)Done!$(RESET)"

re: fclean all

run:
	make re && ./minishell

.PHONY: all bonus run run_bonus re re_bonus clean fclean
