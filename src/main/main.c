/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rlins <rlins@student.42sp.org.br>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/11/12 09:16:27 by rlins             #+#    #+#             */
/*   Updated: 2022/11/12 13:19:57 by rlins            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <minishell.h>

/**
 * @brief Main Class of program
 * @param argc Arguments Count
 * @param argv Arguments Vector
 * @param envp Environment variables
 * @return int
 */
int main(int argc, char **argv, char **envp)
{
	char	param[100] = "Ola ventilador"; // 14
	printf("Orig: %ld\n", strlen(param));
	printf("Alte: %d\n", ft_strlen(param));

	init(argc, argv, envp);
	return (0);
}
