/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   minishell.h                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rlins <rlins@student.42sp.org.br>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/11/12 08:51:11 by rlins             #+#    #+#             */
/*   Updated: 2022/11/13 15:37:39 by rlins            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef MINISHELL_H
# define MINISHELL_H
# define BUFFER_SIZE 1024;
# define TOK_BUFSIZE 64;
# define TOK_DELIM " \t\r\n\a"

# include "./libft.h"
# include <stdio.h> // Printf
# include <stdlib.h> // Malloc, Free, exit
# include <fcntl.h> // Open
# include <unistd.h> // read, execve, fork, pipe, getcwd
# include <sys/wait.h> // waitpid
# include <signal.h> // signal
# include <sys/types.h>
# include <dirent.h>
# include <stdio.h> // TODO: Allowed?

# include <readline/readline.h> // Readline
# include <readline/history.h> // History

/**
 * @brief First method in project.
 * @param argc Arguments count
 * @param argv Arguments Vector
 * @return int
 */
int	init(int argc, char **argv, char **envp);


void	echo_cmd();


#endif
