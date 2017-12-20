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
This section takes a look at some of the basic functions and software components of a computer.

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
Due to it's ease of use, I will be writing this program in [Lua](lua.org). Specifically,  using the [Tic80](https://tic.computer) api. This allows ease packaged distribution of the program and an easy way to draw graphics, which will be important for displaying data.

### Tic80

add info

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

##### TODO: fix image
![IMAGE UNABLE TO DISPLAY](https://raw.githubusercontent.com/Ewpratten/HowToComputer/master/img/compression.png "compression")

I will try to explain the algorithm in a way that is easier to explain. Let's take three data points. Due to the 3:1 compression, these three points need to be made in to one point. The way that i handle this is as follows. Let's say that these are the three points: *12, 15, 16*. The program then finds the average of the points and stores it in an [array](#arrays). In this case, the output would be *14.333*.
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

# TODO
- snapcode
-  images
- documenting
- repo
