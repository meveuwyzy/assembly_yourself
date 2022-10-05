/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dalonso <marvin@42.fr>                     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/04/08 19:11:51 by dalonso           #+#    #+#             */
/*   Updated: 2021/04/08 19:11:53 by dalonso          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"

void		test_strlen(void)
{
	char	s[1000];
	int		i;

	i = 0;
	while (i < 1000)
	{
		s[i] = 'z';
		i++;
	}
	printf("------ft_strlen------\n");
	printf("empty libasm:   %zu\n", ft_strlen(""));
	printf("empty original: %zu\n", strlen(""));
	printf("'Hello' by libasm:   %zu\n", ft_strlen("Hello"));
	printf("'Hello' by original: %zu\n", strlen("Hello"));
	printf("long str by libasm:   %zu\n", ft_strlen(s));
	printf("long str by original: %zu\n\n\n", strlen(s));
}

void		test_strcmp(void)
{
	printf("-------ft_strcmp------\n");
	printf("2 empty str: %d\n", ft_strcmp("", ""));
	printf("'Hello', empty: %d\n", ft_strcmp("Hello", ""));
	printf("empty, 'Hello': %d\n", ft_strcmp("", "Hello"));
	printf("'Hello', 'Hello': %d\n", ft_strcmp("Hello", "Hello"));
	printf("'Hello', 'Hell': %d\n", ft_strcmp("Hello", "Hell"));
	printf("'Help', 'Hello': %d\n\n\n", ft_strcmp("Help", "Hello"));
}

void		test_strcpy(void)
{
	char	dest[100];

	printf("-------ft_strcpy-------\n");
	printf("empty: %s\n", ft_strcpy(dest, ""));
	printf("copy 'Hello' to empty str: %s\n\n\n", ft_strcpy(dest, "Hello"));
}

void		test_strdup(void)
{
	printf("-------ft_strdup-------\n");
	printf("empty: %s\n", ft_strdup(""));
	printf("'Hello, bastards': %s\n", ft_strdup("Hello, bastards"));
	printf("strduping 'zzzzzzzzzzzzz': %s\n\n\n", ft_strdup("zzzzzzzzzzzzz"));
}

void		test_write(void)
{
	int		fd;
	char *str = "I do`t have any idea\n";

	printf("-------ft_write-------\n");
	ft_write(1, str, 21);
	write(1, str, 21);
	ft_write(1, &"", 1);
	ft_write(1, &"", 1);
	fd = open("write.txt", O_CREAT | O_APPEND | O_WRONLY, S_IRUSR | S_IWUSR);
	printf("write to file..\n");
	ft_write(fd, str, 21);
	write(fd, str, 21);
	close(fd);
	errno = 0;
	ft_write(-1, str, 21);
	printf("fd = -1, code of error: %d\n\n\n", errno);
}

void		test_read(void)
{
	int		fd;
	int		ret;
	char	*buf;

	printf("--------ft_read---------\n");
	fd = open("read.txt", O_RDONLY);
	buf = calloc(23, sizeof(char));
	ret = read(fd, buf, 22);
	buf[23] = '\0';
	printf("read from file: %s\n", buf);
	errno = 0;
	buf = calloc(100, sizeof(char));
	ret = read(-1, buf, 50);
	printf("if error(fd = -1):\nerrno = %d\n", errno);
	free(buf);
}

int			main(void)
{
	printf("********** TEST LIBASM ***********\n\n");
	test_strlen();
	test_strcmp();
	test_strcpy();
	test_strdup();
	test_write();
	test_read();
}
