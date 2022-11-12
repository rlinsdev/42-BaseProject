# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rlins <rlins@student.42sp.org.br>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/12 08:46:02 by rlins             #+#    #+#              #
#    Updated: 2022/11/12 09:23:23 by rlins            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = minishell

CC = gcc

# CFLAGS = -g -Wall -Werror -Wextra
CFLAGS = -g

RM = rm -rf

INCLUDE = -I ./include/

PATH_SRC = ./src/
PATH_MAIN = $(PATH_SRC)main/
PATH_INIT = $(PATH_SRC)init/
PATH_BUILTINS = $(PATH_SRC)builtins/
# PATH_COMMAND = $(PATH_SRC)command/
# PATH_ENV = $(PATH_SRC)env/
# PATH_OPERATOR = $(PATH_SRC)operators/
# PATH_MESSAGE = $(PATH_SRC)message/
# PATH_PARSE = $(PATH_SRC)parse/
# PATH_UTILS = $(PATH_SRC)utils/
PATH_OBJS = ./objs/


SRCS =	$(PATH_MAIN)main.c \
		$(PATH_INIT)init.c \
		$(PATH_BUILTINS)echo.c

OBJS = $(patsubst $(PATH_SRC)%.c, $(PATH_OBJS)%.o, $(SRCS))

all: $(NAME)

message:
	@echo "\033[1;35mCompiling Shell\033[0m"

$(NAME): $(OBJS)
	@$(CC) $(CFLAGS) $(INCLUDE) ./objs/*/*.o -o $(NAME) -lreadline
	@echo "\033[1;32mREADY TO LAUNCH\033[0m"

$(PATH_OBJS)%.o: $(PATH_SRC)%.c
	@mkdir -p $(PATH_OBJS)
	@mkdir -p $(PATH_OBJS)main/
	@mkdir -p $(PATH_OBJS)init/
	@mkdir -p $(PATH_OBJS)builtins/
# @mkdir -p $(PATH_OBJS)command/
# @mkdir -p $(PATH_OBJS)env/
# @mkdir -p $(PATH_OBJS)message/
# @mkdir -p $(PATH_OBJS)operators/
# @mkdir -p $(PATH_OBJS)parse/
# @mkdir -p $(PATH_OBJS)utils/
	@$(CC) $(CFLAGS) $(INCLUDE) -I. -c $< -o $@ -lreadline

clean:
	@echo "\033[1;33mCleaning objects\033[0m"
	@$(RM) $(PATH_OBJS)
	@echo "\033[1;32mDone!\033[0m"

fclean: clean
	@echo  "\033[1;33mCleaning all\033[0m"
	@$(RM) $(NAME)
	@echo  "\033[1;33mCleaning binaries\033[0m"
	@echo "\033[1;32mDone!\033[0m"

re: fclean all

run:
	make re && ./minishell

.PHONY: all bonus run run_bonus re re_bonus clean fclean


#TODO: Libft
#TODO: Fix collor
