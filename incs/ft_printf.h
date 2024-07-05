/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf.h                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ebengtss <ebengtss@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/06/12 13:52:46 by ebengtss          #+#    #+#             */
/*   Updated: 2024/06/21 13:49:49 by ebengtss         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef FT_PRINTF_H

# define FT_PRINTF_H

# include <unistd.h>
# include <stdlib.h>
# include <stddef.h>
# include <stdarg.h>
# include <stdint.h>
# include "../libft/incs/libft.h"

void	ft_putchar_len(char c, int *counter);

void	ft_putstr_len(char *s, int *counter);

void	ft_putnbr_len(int n, int *counter);

void	ft_puthex_len(unsigned int nb, int uplow, int *counter);

void	ft_putuns_len(unsigned int n, int *counter);

void	ft_getaddress(void *ptr, int *counter);

int		ft_printf(const char *args, ...);

#endif