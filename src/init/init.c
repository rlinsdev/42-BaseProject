/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   init.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rlins <rlins@student.42sp.org.br>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/11/12 08:54:58 by rlins             #+#    #+#             */
/*   Updated: 2022/11/12 13:53:31 by rlins            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../include/minishell.h"

int	init(int argc, char **argv, char **envp)
{
	char	param[100] = "Ola ventilador"; // 14
	printf("Orig: %ld\n", strlen(param));
	printf("Alte: %ld\n", ft_strlen(param));

	printf("opa");
	return (0);
}
