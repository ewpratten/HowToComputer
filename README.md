# echo "Hello, world!" | /dev/null
## Learning how computers work through a series of small projects
#### By: [Evan Pratten](https://keybase.io/ewpratten)
#### With help from: 
> **[Ian Seyler](https://keybase.io/ianseyler)**
<br>
> **[Warren Pratten](https://www.linkedin.com/in/warrenpratten)**

## Introduction
This is partially a school project but mostly for me to learn about how computers work at the machine code level.
<br><br>
A little bit of important information going in to this is, as of the time of me starting this document (Monday, December 4, 2017) I do not know anything about x86-64 assembly or computer architecture. I also have no experience in lua and didn't even know that I could get it from [AUR](https://www.archlinux.org/packages/extra/x86_64/lua/) until a few days ago.
<br><br>
Most of the examples will be shown at four levels. First, an example of what the user sees (ex. a window with a button). I will be calling this the **User** level. Second, an example of the underlying code in a high level, interpreted language. I have chosen python because of it's simplicity and flexibility. Third, an example in C / C++  . Fourth, an example in [**machine code**](https://en.wikipedia.org/wiki/Machine_code) specifically, x86-64 assembly. I chose assembly because is a good way of showing what is happening on the computer at the lowest level. 
<br><br>
An important detail to note is that all of the tutorials are designed for a **linux** system running on a **x86-64** cpu. The examples may work on other operating systems and architectures but have **not been tested. **

## Hello world

Although these tutorials should start from the simplest example first, it is tradition to print the phrase **Hello, world!** as the first thing when learning a new programming language.
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
The first line, `#!/usr/bin/env python` is called a shebang or hashpling. It is to tell the system what to use to execute this script. In this case the shebang is pointing to python in the `/usr/bin/env` directory of a standard unix system.
<br><br>
The second line is quite self-descriptive. In python, the `print()` function displays anything that is in the brackets in the terminal. In this case, the brackets contain the string `Hello, world!`. When printing text, it needs to be stored in a string. To store test in a string in python, just add double quotes around it. For example ` "Hello, world!"`. Simple! Right?
 Now let's look at what the computer is actually doing.
### C
```c
#include<stdio.h>

int main(void) {
    printf("Hello World\n");
    return 0;
}
```
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

#####MORE INFO HERE

## Building a basic Global Information System

The final mini project that I want to make is a basic GIS (Global Information System). A key function that a GIS deals with is terrain mapping. In this project, I will be graphing altitude data.

### Limitations
Due to some time limitations, this will be very simple. My end goal will be explained in the next section. In staid of having a 3D model of the mapping region, I will only be able to provide a 2D view. This could still be useful if you where to render a bunch of 2D views but I don't have the time or skill to make it work.

### End goal
I am hoping to have a system that will allow terrain altitude points to be entered. Then the points will be "compressed" in this scenario, the average of multiple points will be stored in an array to save space. The I will also have a system to try to recreate a semi-accurate model of the original data using as little data points as possible.

### Getting started
Due to it's ease of use, I will be writing this program in [Lua](lua.org). Specifically,  using the Tic80 api. This allows ease packaged distribution of the program and an easy way to draw graphics, which will be important for displaying data.

### Tic80

add info

### The program

Due to the large file size, the code can not me displayed in this file. I have a mirror of the code both at [GitHub](https://github.com/Ewpratten/HowToComputer/tree/master/minigis) and the [RetryLife mirror server](https://raw.githubusercontent.com/Ewpratten/HowToComputer/master/minigis/program.lua).

### Program breakdown

The first section of the program is just to define and set variables.

```lua
a=0 b=0 c=0 d=0 e=0 f=0 g=0 h=0 state=0
```
The variables *a,b,c,d,e,f,g,h,* are used to store the compressed data that is generated in the `compress()` function. The *state* variable is used to switch the display from compressed to uncompressed mode.
<br><br>
Next, is the variables used for storing the original data and later stores the uncompressed data for the `draw()` function to read from.

```lua
a1=0
a2=0
a3=0
b1=0
b2=0
b3=0
c1=0
c2=0
c3=0
d1=0
d2=0
d3=0
e1=0
e2=0
e3=0
f1=0
f2=0
f3=0
g1=0
g2=0
g3=0
h1=0
h2=0
h3=0
```
Next is the `memclear()` function.

```lua
function clearmem()
a1=0 a2=0 a3=0 b1=0 b2=0 b3=0 c1=0 c2=0 c3=0 d1=0 d2=0 d3=0 e1=0 e2=0 e3=0 f1=0 f2=0 f3=0 g1=0 g2=0 g3=0 h1=0 h2=0 h3=0
end
```
This function is only used for debugging. All it does is set all the input variables to *0*.
<br><br>
Next, is the `compress()` function.
```lua
function compress()
a=(a1+a2+a3)/3
b=(b1+b2+b3)/3
c=(c1+c2+c3)/3
d=(d1+d2+d3)/3
e=(e1+e2+e3)/3
f=(f1+f2+f3)/3
g=(g1+g2+g3)/3
h=(h1+h2+h3)/3
-- clearmem()
end
```

This function preforms a simple equation that finds the average of three numbers. the average is stored in a single variable. This cuts down the file size from 24 bytes (assuming only whole numbers are inputted) to 8 bytes (assuming only whole numbers are inputted).
<br><br>
The next function is to draw the data on the Tic80 screen.
```lua
function drawcpr()
	if a>128 then a=128 end
	spr(1,1*8,a)
	
	if b>128 then b=128 end
	spr(1,4*8,b)
	
	if c>128 then c=128 end
	spr(1,7*8,c)
	
	if d>128 then d=128 end
	spr(1,10*8,d)
	
	if e>128 then e=128 end
	spr(1,13*8,e)
	
	if f>128 then f=128 end
	spr(1,16*8,f)
	
	if g>128 then g=128 end
	spr(1,19*8,g)
	
	if h>128 then h=128 end
	spr(1,22*8,h)
end
```

## References
Easy x86-64. (2017). Ian.seyler.me. Retrieved 4 December 2017, from http://ian.seyler.me/easy_x86-64/
