# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rlins <rlins@student.42sp.org.br>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/12 08:46:02 by rlins             #+#    #+#              #
#    Updated: 2022/11/12 08:47:44 by rlins            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = minishell

CC = gcc

CFLAGS = -g -Wall -Werror -Wextra

RM = rm -rf

INCLUDE = -I ./includes/

PATH_SRC = ./srcs/
PATH_MAIN = $(PATH_SRC)main/
PATH_COMMAND = $(PATH_SRC)command/
PATH_ENV = $(PATH_SRC)env/
PATH_OPERATOR = $(PATH_SRC)operators/
PATH_MESSAGE = $(PATH_SRC)message/
PATH_PARSE = $(PATH_SRC)parse/
PATH_BUILTINS = $(PATH_SRC)builtins/
PATH_UTILS = $(PATH_SRC)utils/
PATH_OBJS = ./objs/


SRCS =	$(PATH_MAIN)main.c	$(PATH_MAIN)init.c $(PATH_MAIN)clean_trash.c\
		$(PATH_BUILTINS)env.c $(PATH_BUILTINS)check_builtin.c $(PATH_BUILTINS)pwd.c\
		$(PATH_BUILTINS)cd.c $(PATH_BUILTINS)my_exit.c $(PATH_BUILTINS)echo.c\
		$(PATH_BUILTINS)set_color.c\
		$(PATH_COMMAND)execute_command.c $(PATH_COMMAND)helper_command.c $(PATH_COMMAND)check_command.c\
		$(PATH_COMMAND)relations.c $(PATH_COMMAND)exec_helper.c\
		$(PATH_ENV)create_env.c $(PATH_ENV)get_matrix.c\
		$(PATH_MESSAGE)errors.c $(PATH_MESSAGE)hazzard.c\
		$(PATH_OPERATOR)pipe.c $(PATH_OPERATOR)redirect.c $(PATH_OPERATOR)signal.c\
		$(PATH_OPERATOR)redirect_helper.c\
		$(PATH_PARSE)parse_string.c $(PATH_PARSE)parse_quotes.c $(PATH_PARSE)get_path.c\
		$(PATH_PARSE)expand_vars.c $(PATH_PARSE)check_grammar.c\
		$(PATH_UTILS)ft_bzero.c $(PATH_UTILS)ft_calloc.c $(PATH_UTILS)ft_split.c\
		$(PATH_UTILS)ft_strdup.c $(PATH_UTILS)ft_strjoin.c $(PATH_UTILS)ft_strlen.c\
		$(PATH_UTILS)ft_strncmp.c $(PATH_UTILS)ft_strtrim.c $(PATH_UTILS)ft_substr.c \
		$(PATH_UTILS)get_next_line.c $(PATH_UTILS)handler_final_file.c $(PATH_UTILS)is_in.c\
		$(PATH_UTILS)close_fd.c	$(PATH_UTILS)ft_atoi.c $(PATH_UTILS)ft_itoa.c \
		$(PATH_UTILS)ft_strlcpy.c $(PATH_UTILS)merge_matriz.c $(PATH_UTILS)is_alpha.c $(PATH_UTILS)is_empty.c


OBJS = $(patsubst $(PATH_SRC)%.c, $(PATH_OBJS)%.o, $(SRCS))

all: $(NAME)

message:
	@echo "\033[1;35mCompiling Shell\033[0m"

$(NAME): $(OBJS)
	@$(CC) $(CFLAGS) $(INCLUDE) ./objs/*/*.o -o $(NAME) -lreadline
	@echo "\033[1;32mREADY TO LAUNCH\033[0m"

$(PATH_OBJS)%.o: $(PATH_SRC)%.c
	@mkdir -p $(PATH_OBJS)
	@mkdir -p $(PATH_OBJS)builtins/
	@mkdir -p $(PATH_OBJS)command/
	@mkdir -p $(PATH_OBJS)env/
	@mkdir -p $(PATH_OBJS)message/
	@mkdir -p $(PATH_OBJS)operators/
	@mkdir -p $(PATH_OBJS)parse/
	@mkdir -p $(PATH_OBJS)utils/
	@mkdir -p $(PATH_OBJS)main/
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

run_bonus:
	make re_bonus && valgrind --leak-check=full --show-leak-kinds=all --suppressions=readline.supp ./minishell_bonus

.PHONY: all bonus run run_bonus re re_bonus clean fclean
