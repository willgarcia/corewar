AUXFILES := Makefile Vagranfile README.md
PROJDIRS := functions
SRCFILES := $(find $(PROJDIRS) -type f -name "*.c")
HDRFILES := $(find $(PROJDIRS) -type f -name "*.h")
OBJFILES := $(patsubst %.s,%.o,$(SRCFILES))
ALLFILES := $(SRCFILES) $(HDRFILES) $(AUXFILES)

CC		 := gcc
WARNINGS :=  -Wall -Wfatal-errors -Werror -Wextra -pedantic -Wshadow -Wpointer-arith -Wcast-align \
            -Wwrite-strings -Wmissing-prototypes -Wmissing-declarations \
            -Wredundant-decls -Wnested-externs -Winline -Wno-long-long \
            -Wuninitialized -Wconversion -Wstrict-prototypes -Wmissing-include-dirs
CFLAGS   := -g -std=c99 $(WARNINGS) -ansi -O3
LDFLAGS	 :=  -lmy -lm -lcurses -l efence -l X11

.PHONY: all clean test

all:
	echo $(PROJDIRS)
	echo $(SRCFILES)
	$(CC) -S $(CFLAGS) $(LDFLAGS) -I include -o will $(SRCFILES)
	@echo
	@echo "Build complete."
	@echo

clean:
	-@$(RM) $(wildcard $(OBJFILES))

test:
	-@rc=0; count=0; \
	for file in $(TSTFILES); do \
		echo " TST     $$file"; ./$$file; \
		rc=`expr $$rc + $$?`; count=`expr $$count + 1`; \
	done; \
	echo; echo "Tests executed: $$count  Tests failed: $$rc"
