include makefile.def
-include nofile.def1
sinclude nofile.def2
#include makefile.config

OBJS = main.o a.o b.o c.o

all:main

.PHONY: all

main: $(OBJS)
	g++ -o main $(OBJS)


%.o:%.cpp 
	@echo $@
	g++ -c $^ -o $@
#%d:%.cpp
#	g++ -MMM $< >$@.$$$$
#	sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@

command1:
	@cd ~; pwd
command2:
	@cd ~
	@pwd 
command3:
	-@mkdir testDir
command4:
	@mkdir testDir
command5:
	@echo $(MAKEFLAGS)
command6:
	@echo $$$$ 

value=world
var1=$(value)
var2:=$(value)
value=hello

command7:
	@echo $(var1)
	@echo $(var2)

cur_dir=$(shell pwd)
command8:
	@echo $(SHELL)
	@echo $(cur_dir)
	@echo $(MAKELEVEL)

define tow-line
	echo hello
	echo world 
endef

command9:
	@echo $(tow-line)

command10:
	var=$(shell whoami)
	@echo $(var)

command11:
	filelist=$(shell find . -type f |grep "cpp")
	@echo $(filelist)

command12:
	@echo $(MAKECMDGOALS)

.PHONY: clean
clean:
	rm -rf $(OBJS) main
