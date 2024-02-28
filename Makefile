##
## EPITECH PROJECT, 2024
## MinilibC
## File description:
## Going deeper into the rabbit hole
##

NAME		=	libasm.so

CC			=	gcc -g3
rm			=	rm -f

SRC			=	$(shell find src -type f -name "*.asm")
OBJ			=	$(SRC:.asm=.o)

ASM			=	nasm -f elf64
LD			=	ld -shared

all: $(NAME)

$(NAME):	$(OBJ)
			$(LD) $(OBJ) -o $(NAME)
%.o: %.asm
			$(ASM) -o $@ $<

clean:
			$(RM) $(OBJ)
			$(RM) $(TEST_OBJ)

fclean:		clean
			$(RM) $(NAME)

re: fclean all


.PHONY: all clean fclean re
