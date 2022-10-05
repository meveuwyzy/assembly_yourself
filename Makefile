# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dalonso <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/06 01:25:22 by dalonso           #+#    #+#              #
#    Updated: 2021/04/06 01:25:27 by dalonso          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a

SRC= ft_write.s \
	 ft_read.s \
	 ft_strlen.s \
	 ft_strcmp.s \
	 ft_strcpy.s \
	 ft_strdup.s

NFLAGS = nasm -f macho64 -o 

OBJ=$(SRC:.s=.o)

all: $(NAME)

$(NAME): $(OBJ)
	ar rc $(NAME) $(OBJ)

%.o: %.s
	$(NFLAGS) $@ $<

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all

test: re
	rm -f libasm
	gcc -Wall -Wextra -Werror main.c -L. -lasm -o test
	./test