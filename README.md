# From Click To Bit
## How computers work at a low level
#### By: [ewpratten](https://github.com/Ewpratten)
#### [Credits](https://github.com/Ewpratten/HowToComputer/blob/master/CONTRIBUTORS.md)

## Introduction
This is partially a school project but mostly for me to learn about how computers work at the machine code level.
<br>
<br>
The repo is organised in to folders for each project or tutorial.
<br>
<br>
The examples will be shown at three levels. First, an example of what the user sees (ex. a window with a button). I will be calling this the **User** level. Second, an example of the underlying code in a high level, interpreted language. I have chosen python because of it's simplicity and flexibility. Third, an example in [**machine code**](https://en.wikipedia.org/wiki/Machine_code) specifically, x86-64 assembly. I chose assembly because is a good way of showing what is happening on the computer at the lowest level.
<br><br>
An important detail to note is that all of the tutorials are designed for a **linux** system running on a **x86-64** cpu. The examples may work on other operating systems and architectures but have **not** been tested
## Hello world

Although these tutorials should start from the simplest example first, it is tradition to print the phrase **Hello, world!** as the first thing when learning a new programming language.
<br><br>
### User
At the user level, all you will see is the phrase **Hello, world!** printed on your screen or terminal. Here is a screenshot of the output of a simple *Hello, world!* script in python:
![alt text](https://raw.githubusercontent.com/Ewpratten/HowToComputer/master/img/python-hello.png "What the user sees")

### Python

This is how you can print out *Hello, world!* in python:
```python
#!/usr/bin/env python
print "Hello, world"

```
What this does is as follows:
<br><br>
The first line, `#!/usr/bin/env python` is called a shebang. it is to tell the system what to use to execute this script. In this case the shebang is pointing to python.
<br><br>
The second line is quite self-descriptive. In python, the `print()` function displays anything that is in the brackets in the terminal. In this case, the brackets contain the string `Hello, world!`. When printing text, it needs to be stored in a string. To store test in a string in python, just add double quotes around it. For example ` "Hello, world!"`. Simple! Right?
 Now let's look at what the computer is actually doing.
### x86-64 Assembly

This is how to print out *Hello, world!* in x86-64:

```assembly
section	.text
	global _start       ;must be declared for using gcc
_start:                     ;tell linker entry point
	mov	edx, len    ;message length
	mov	ecx, msg    ;message to write
	mov	ebx, 1	    ;file descriptor (stdout)
	mov	eax, 4	    ;system call number (sys_write)
	int	0x80        ;call kernel
	mov	eax, 1	    ;system call number (sys_exit)
	int	0x80        ;call kernel

section	.data

msg	db	'Hello, world!',0xa	;the string
len	equ	$ - msg			;length of the string
```
Due to the fact that assembly can require special execution commands, I will provide the command I use for each example.
```bash
nasm -f elf *.asm; ld -m elf_i386 -s -o demo *.o && demo
```
The text after the semicolon is a comment. Comments are used to explain what the line of instructions does.
<br><br>
Let's start at the first line.

# TODO: ADD INFO LATER

## Simple Math

Moving on to something simpler, it's time for some simple math. The end result of this should be printing the results of the following math problems to the terminal. These are the problems to solve: **1+1, 2\*4, 8/2, 3-2**. fairly simple, lets look at how this works on three different levels.

### User
This *User* example is not that interesting. All you will see is the following:
##### TODO: add image

### Python

### x86-64 Assembly

## How A Computer Works
