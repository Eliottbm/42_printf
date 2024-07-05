# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ebengtss <ebengtss@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/06/13 11:16:00 by ebengtss          #+#    #+#              #
#    Updated: 2024/07/04 15:42:16 by ebengtss         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

MAKEFLAGS 		+=	--no-print-directory

NAME			=	libftprintf.a

LIBFT			=	libft

CC				=	cc
CFLAGS			=	-Wall -Wextra -Werror -I
AR				=	ar rcs

SRCS_DIR		=	srcs/
OBJS_DIR		=	objs/
INCS_DIR		=	incs

SRCS_FILES		=	ft_printf.c			\
					ft_putaddress.c		\
					ft_putchar_len.c	\
					ft_puthex_len.c		\
					ft_putnbr_len.c		\
					ft_putstr_len.c		\
					ft_putuns_len.c

SRCS			=	$(addprefix $(SRCS_DIR), $(SRCS_FILES))
OBJS			=	$(addprefix $(OBJS_DIR), $(SRCS_FILES:.c=.o))

DEF_COLOR		=	\033[0;39m
MAGENTA			=	\033[0;95m
GREEN			=	\033[0;92m
DEF_WEIGHT		=	\e[0m
BOLD_WEIGHT		=	\e[1m

OBJSF			=	.cache_exists

all				:	$(NAME)

$(NAME)			:	$(OBJS)
	@make -C $(LIBFT)
	@cp libft/libft.a ./$(NAME)
	@$(AR) $@ $?
	@echo "$(BOLD_WEIGHT)[PRINTF]$(DEF_WEIGHT) make: $(GREEN)OK$(DEF_COLOR)"

$(OBJS_DIR)%.o	:	$(SRCS_DIR)%.c | $(OBJSF)
	@$(CC) $(CFLAGS) $(INCS_DIR) -c $< -o $@
	@echo "$(BOLD_WEIGHT)[PRINTF]$(DEF_WEIGHT) compiling: $(MAGENTA) $< $(DEF_COLOR)"

$(OBJSF)	:
	@mkdir -p $(OBJS_DIR)

clean			:
	@rm -rf $(OBJS_DIR)
	@make fclean -C $(LIBFT)
	@echo "$(BOLD_WEIGHT)[PRINTF]$(DEF_WEIGHT) clean: $(GREEN)OK$(DEF_COLOR)"

fclean			:	clean
	@rm -f $(NAME)
	@echo "$(BOLD_WEIGHT)[PRINTF]$(DEF_WEIGHT) fclean: $(GREEN)OK$(DEF_COLOR)"

re				:	fclean all

.PHONY			:	all clean fclean re