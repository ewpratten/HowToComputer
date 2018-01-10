# echo "Hello, world!" >> /dev/null
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
An important detail to note is that all of the tutorials are designed for a **linux** system running on a **x86-64** based cpu. The examples may work on other operating systems and architectures but have **not been tested. **

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
The first line, `#!/usr/bin/env python` is called a <div id="shebang">shebang</div> or hashpling. It is to tell the system what to use to execute this script. In this case the shebang is pointing to python in the `/usr/bin/env` directory of a standard unix system.
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
First, is:
```assembly
section	.text
	global _start       ;must be declared for using gcc
_start:                     ;tell linker entry point
```
This section is called the *.text* section. It contains the actual program. The `global_start` and `_start` lines tell the computer where the program actually starts.
<br><br>
In order, the program then does the following. Store the message length and contents into two registers, Set two registers with info to exit the kernel to print the stored message, then tell the kernel to exit the program.

```assembly
section .data

msg db  'Hello, world!',0xa ;the string
len equ $ - msg         ;length of the string
```
The *.data* section is for setting values and initializing the program. In this case it stores the text and finds the length.

## Simple Math

Moving on to something simpler, it's time for some simple math. The end result of this should be printing the results of the following math problems to the terminal. These are the problems to solve: **1+1, 2\*4, 8/2, 3-2**. fairly simple, lets look at how this works on three different levels.

### User
This *User* example is not that interesting. All you will see is the following:

![IMAGE UNABLE TO DISPLAY](https://raw.githubusercontent.com/Ewpratten/HowToComputer/master/img/math.png "The output")

Nothing! That is because this program does not print anything. It just stores math results in either [variables]() or [registers]().
### Python

```python
#!/usr/bin/env python
a=int(1) + int(1)
b=int(2) * int(4)
c=int(8) / int(2)
d=int(3) - int(2)
```
First we start with the [shebang](#shebang). The the math. All numbers must be surrounded in `int()`. In this case, *a* is equal to *1 + 1*. The same applies to the other lines, but with different numbers and operations.

### C++

```c

	int main(){
		int a = 1+1
		int b = 2*4
		int c = 8/2
		int d = 3-2
	}
```
C++ is similar to python, except that surrounding the numbers in `int()` can be replaced with adding `int` to the start of the line. This tells the compiler that the variable will be an integer. The `int main(){` line tells the compiler that this is the main section of code, and to run everything inside of the brackets (`{}`).


### x86-64 Assembly

```
mov rax, 1	; store 1 in register rax
add rax, 1	; add 1 to rax (1+1)
push rax	; put the value of rax (2) into the stack
mov rax, 2	; store 2 in register rax
mov rcx, 4	; store 4 in register rcx
mul rcx		; multiplies rcx by rax, then stores the output in rax
push rax	; put the value of rax (8) into the stack
mov rax, 8	; store 8 in register rax
mov rdx, 0	; clear rdx to 0
mov rbx, 2	; store 2 in register rax
div rbx		; Divide rax by rbx. rdx will be set to 0, and rax will be set to 4
push rax 	; put the value of rax (4) into the stack
mov rax, 3	; store 3 in register rax
sub rax, 2	; subtract 2 from rax (3-2)
push rax	; put the value of rax (1) into the stack
```
Due to the nature of assembly, every line of code is documented. so this does not require much explanation. All of the results are stored in the stack. A stack is a last in, first out (LIFO) data structure. The push operation adds to the top of the list and the pop operation removes an item from the top of the list. 
## How A Computer Works
This section takes a look at some of the basic functions and software components of a computer.

# TODO: FIX

### <div id="comments">Comments</div>
Comments are an important part of writing a program, but are not required. The computer never sees comments when executing code but they can be used to document your code or to k=just have a TODO list. For example I have a TODO list in the comments in this document so I can keep track of my work and goals.

![alt text](https://raw.githubusercontent.com/Ewpratten/HowToComputer/master/img/todo.png "My commented TODO list")

### <div id="arrays">Arrays</div>
An array is used to store large quantities of similar data. For example, in my [mini GIS](#gis) project, I use an array to store altitude data.

## <div id="gis">Building a basic Global Information System </div>

The final mini project that I want to make is a basic GIS (Global Information System). A key function that a GIS deals with is terrain mapping. In this project, I will be graphing altitude data.

### Limitations
Due to some time limitations, this will be very simple. My end goal will be explained in the next section. In staid of having a 3D model of the mapping region, I will only be able to provide a 2D view. This could still be useful if you where to render a bunch of 2D views but I don't have the time or skill to make 3D graphics work.

### End goal
I am hoping to have a system that will allow terrain altitude points to be entered. Then the points will be "compressed" in this scenario, the average of multiple points will be stored in an array to save space. The I will also have a system to try to recreate a semi-accurate model of the original data using as little data points as possible.

### Getting started
Due to it's ease of use, I will be writing this program in [Lua](lua.org). Specifically,  using the [Tic80](https://tic.computer) api. This allows easy packaged distribution of the program and an easy way to draw graphics, which will be important for displaying data.

### Tic80

TIC-80 is a fantasy computer for making, playing and sharing games. It has built in tools for code, sprites, maps, sound editors and the command line which are enough tools to make a game. Games  are stored on `.cart` files that emulate game cartridges. It has a 240x136 pixels display, 16 color palette, 256 8x8 color sprites, and 4 channel sound.

### The program

Due to the large file size, the code can not me displayed in this file. I have a mirror of the code both at [GitHub](https://github.com/Ewpratten/HowToComputer/tree/master/minigis) and the [RetryLife mirror server](https://raw.githubusercontent.com/Ewpratten/HowToComputer/master/minigis/program.lua).

### Program breakdown
Lua's [comments](#comments) are formatted in the following way:
```lua
--this is a comment
-- this is a comment
-- This Is A Comment --
```

The first section is the [array](#arrays). All the information to be compressed is stored in the array. Due to the lack of safety checks in the code, This array ** must ** contain 24 or more entries.
```lua
-- input data --
ino={13,16,35,46,35,22,37,51,45,48,49,33,34,67,47,45,47,46,36,38,47,47,79,99}
```
Second, declaring and initialising variables and arrays.
```lua
-- Declare variables --
state=2 comp={} og={}
```
This section is important because lua requires variables to contain content in order to preform mathematical operations. I originally did not define variables and ended up with a screen full of errors or just crashing my computer.
<br><br>
The next section stores the inputted data in another array so that the program can display the original data for comparing results. If this program was to actually be used for compression, this code should be removed. 

```lua
-- Store input data for use by draw("input") --
for i=1, 24 do
	og[i]=ino[i]
end
```
Next, the most important part of this program.
```lua
-- Compression --
function compress()
	j=1
	for i=1, 8 do
		comp[j]=(ino[i]+ino[i+1]+ino[i+2])/3
		i=i+3
		j=j+1
	end
end
```
This, is the compression algorithm. The way it works is actually quite simple. The disign is based on this diagram that I drew:

![IMAGE UNABLE TO DISPLAY](https://raw.githubusercontent.com/Ewpratten/HowToComputer/master/img/compression.jpeg "compression")

I will try to explain the algorithm in a way that is easier to understand. Let's take three data points. Due to the 3:1 compression, these three points need to be made in to one point. The way that i handle this is as follows. Let's say that these are the three points: *12, 15, 16*. The program then finds the average of the points and stores it in an [array](#arrays). In this case, the output would be *14.333*.
<br><br>
Now for the oppisite.
```lua
function uncompress()
	i=1
	for j=1, 7 do
		ino[i]=comp[j]
		mid=(comp[j]+comp[j+1])/2
		ino[i+1]=(comp[j]+mid)/2
		ino[i+2]=(comp[j+1]+mid)/2
		i=i+3
	end
end
```
This part is quite difficult to explain. Basically, what it does is, find the midpoint between two points, then find the midpoint between the previous midpoint and the original points. Then the data is stored in an array.

```lua
function draw(inp)
	if inp=="input" then
		j=1
		for i=1, 22, 3 do
			if og[i]>128 then og[i]=128 end spr(1,j*8-8,og[i])
			if og[i+1]>128 then og[i+1]=128 end spr(1,j*8,og[i+1])
			if og[i+2]>128 then og[i+2]=128 end spr(1,j*8+8,og[i+2])
			j=j+3
		end
	elseif inp=="output" then
		j=1
		for i=1, 22, 3 do
			if ino[i]>128 then ino[i]=128 end spr(1,j*8-8,ino[i])
			if ino[i+1]>128 then ino[i+1]=128 end spr(1,j*8,ino[i+1])
			if ino[i+2]>128 then ino[i+2]=128 end spr(1,j*8+8,ino[i+2])
			j=j+3
		end
	elseif inp=="compressed" then
		j=1
		for i=1, 8 do
			if comp[i]>128 then comp[i]=128 end
				spr(1,j*8,comp[i])
				j=j+3
		end
	else
		trace("ERROR: Invalid draw mode")
		trace("try input, output, or compressed")
		exit()
	end
end
```
This section is the drawing / graphing code. It has three states, *input, output, and compressed* for each state, it iterates through the given points then takes the data value and generates coordinates. Next, it draws the points using the Tic80 sprite function, which draws the little red dot.
<br><br>
Next, the program initializes by compressing then uncompromising the data.

```lua
compress()
uncompress()
```
Then, finally, the main function.

```lua
-- Main Loop --
function TIC()
	cls(13)
	if btn(0) then state=1 end
	if btn(2) then state=2 end
	if btn(1) then state=0 end
	if state==0 then
		draw("compressed")
	elseif state==1 then
		draw("output")
	elseif state==2 then
		draw("input")
	end
end
```
The `TIC()` function runs once every 60 seconds. First, it clears the screen. Then, tests if any buttons are being pressed. If a button is pressed, the *state* changes. Next, it checks the state and draws the matching data.



## References
Easy x86-64. (2017). Ian.seyler.me. Retrieved 4 December 2017, from http://ian.seyler.me/easy_x86-64/
<br><br>
TIC-80 Wiki. (2017). GitHub. Retrieved 11 December 2017, from https://github.com/nesbox/TIC-80/wiki
<br><br>
TIC-80 Tutorials. (2017). GitHub. Retrieved 13 December 2017, from https://github.com/nesbox/TIC-80/wiki/Simple-Platformer-tutorial
<br><br>
Lua: FAQ. (2017). Lua.org. Retrieved 15 December 2017, from https://www.lua.org/faq.html
<br><br>
Lua 5.3 Reference Manual - contents. (2017). Lua.org. Retrieved 13 December 2017, from https://www.lua.org/manual/5.3/
<br><br>
Assembly Basic Syntax. (2018). www.tutorialspoint.com. Retrieved 10 January 2018, from https://www.tutorialspoint.com/assembly_programming/assembly_basic_syntax.htm

