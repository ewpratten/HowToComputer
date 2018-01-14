# echo "Hello, world!" >> /dev/null
## Learning how computers work through a series of small projects
#### By: [Evan Pratten](https://keybase.io/ewpratten)
#### With help from: 
- **[Ian Seyler](https://keybase.io/ianseyler)** 
- **[Warren Pratten](https://www.linkedin.com/in/warrenpratten)**

## Introduction
This is partially a school project but mostly for me to learn about how computers work at the machine code level.
<br><br>
A little bit of important information going in to this is, as of the time of me starting this document (Monday, December 4, 2017) I do not know anything about x86-64 assembly or computer architecture. I also have no experience in *lua* and didn't even know that I could get it from [AUR](https://www.archlinux.org/packages/extra/x86_64/lua/) (Arch linux User Repository) until a few days before starting this document.
<br><br>
Most of the examples will be shown at four levels. First level, an example of what the user sees (ex. a window with a button) that I will call the **User** level. Second level, there will be an example of the underlying code in a high level, fourth generation, interpreted language. I have chosen Python because of its simplicity and flexibility. Third level, there will be an example in C / C++ , Lastly, there will be an example in [**machine code**](https://en.wikipedia.org/wiki/Machine_code), specifically x86-64 assembly. I chose assembly because is a good way of showing what is happening on the computer at the lowest level. Computers directly read the instructions from assembly. This is different from interpreted and compiled languages because there is no layer in between the code and the computer. With a compiled language, the compiler turns the code into instructions.
<br><br>
An important detail to note is that all of the projects are designed for a **linux** system running on a **x86-64** based CPU. The examples may work on other operating systems, but have **not been tested** by me.

## Hello, world!

These tutorials should start from the simplest example first. It is tradition to print the phrase **"Hello, world!"** as the first thing when learning a new programming language, so that is the example I will proceed with.

### User
At the User Level, all you will see is the phrase **"Hello, world!"** printed on your screen or terminal. Here is a screenshot of the output of a simple *"Hello, world!"* script in Python: <br>
![alt text](https://raw.githubusercontent.com/Ewpratten/HowToComputer/master/img/python-hello.png "What the user sees")
<br>
The extra text at the top exists because the program does not clear the screen before executing.

### Python

This is the code used to print out *"Hello, world!"* in Python:
```python
#!/usr/bin/env python3
print("Hello, world")

```
What this does is as follows:
<br><br>
The first line, `#!/usr/bin/env python3` is called a *shebang* or *hashpling*. The shebang tells the system what to use to execute this script. In this case the shebang is pointing to Python3. in the `/usr/bin/env` directory of a standard UNIX system. 
<br><br>
In Python, the `print()` function displays anything that is in the brackets in the terminal. In this case, the brackets contain the string `Hello, world!`. When printing text, it needs to be stored in a string. To store test in a string in python, just add double quotes around `"test"`. For example ` "Hello, world!"`. Simple! Right?
 Now let's look at what the computer is actually doing.
### C++
```c
#include<stdio.h>

int main() {
    printf("Hello, world \n");
    return 0;
}
```
The first line imports the **st**an**d**ard **i**/**o** library using `#include<stdio.h>` . This allows the **C++** program to print to the screen, which is required to display text.
<br><br>
All code inside the curly brackets of the following line are run in order when the program starts. `int main(void) {}`. The `printf()` function prints whatever is inside the brackets. In this case, it prints `Hello, world!`. The `\n` signifies a new line. Then the program exits with a status code of *0* using the `return 0;` line. Exiting with a status code of *0* tells the computer that the program successfully ran without any errors. The `main()` function is declared as an *int* so it requires an integer (0) to have its value set correctly.


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
The text after the semicolon is a comment. Comments are used to explain what each line of instructions does.
<br><br>
Due to the fact that assembly can require special execution commands, I will provide the command I use for each example.
```bash
nasm -f elf *.asm; ld -m elf_i386 -s -o demo *.o && demo
```

First, is:
```assembly
section	.text
	global _start       ;must be declared for using gcc
_start:                     ;tell linker entry point
```
This section is called the *.text* section. It contains the actual program. The `global_start` and `_start` lines tell the computer where the program actually starts. `_start` is roughly equivalent to `main()` in C++.
<br><br>
In order, the program then does the following. The program stores the message length and contents into two registers, sets two registers with information to tell the kernel to print the stored message, then tells the kernel to exit the program. The kernel is what sends and receives binary data from the CPU. It is essentially a traffic cop. The decides what code can run, and where to run it.

```assembly
section .data

msg db  'Hello, world!',0xa 	;the string
len equ $ - msg         			;length of the string
```
The *.data* section is for setting values and initializing the program. In this case it stores the text and finds the length of the phrase. The `msg` opcode is effectively a variable. It is used to store text and converts the stored text to ASCII data to be displayed on the screen.

## Simple Math

Moving on to something simpler. It's time for some simple math. The end result of this example should be printing the results of the following math problems to the terminal. These are the problems to solve: **1+1, 2\*4, 8/2, 3-2**. Let's look at how this works on three different levels.

### User
This *User* example is not that interesting. All you will see is the following:

![IMAGE UNABLE TO DISPLAY](https://raw.githubusercontent.com/Ewpratten/HowToComputer/master/img/math.png "The output")

Nothing! That is because this program does not print anything. It just stores math results in either [variables](#) or the [stack](#). A stack is a last in, first out (LIFO) data structure. The push operation adds to the top of the list and the pop operation removes an item from the top of the list. 
### Python

```python
#!/usr/bin/env python3
a=int(1) + int(1)	# a==2
b=int(2) * int(4)	# b==8
c=int(8) / int(2)	# c==4
d=int(3) - int(2)	# d==1
```
First we start with the [shebang](#shebang). In Python all numbers must be surrounded by `int()`. In this case, *a* is equal to *1+1*. The same applies to the other lines, but with different numbers and operators.

### C++

```c

	int main(){
		int a = 1+1;	# a==2
		int b = 2*4;	# b==8
		int c = 8/2;	# c==4
		int d = 3-2;	# d==1
	};
```
C++ is similar to Python, except that surrounding the numbers in `int()` can be replaced with adding `int` to the start of the line. This tells the compiler that the variable will be an integer. The `int main(){` line tells the compiler that this is the main section of code, and to execute everything inside of the brackets (`{}`). The compiler is what converts C++ or C code to binary. The outputted binary is then directly run by the CPU.



### x86-64 Assembly

```assembly
section	.text
	global _start       ;must be declared for using gcc
_start:                     ;tell linker entry point
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
Due to the nature of assembly, every line of code is documented. The reason for this is that assembly opcodes are sometimes quite cryptic. Documenting every line of code helps the code's author or maintainer to understand how it works. All of the results are stored in the stack. After this program executes, the stack looks like this:<br>
\|	--	|<br>
\|	1	|<br>
\|	4	|<br>
\|	8	|<br>
\|	2	|<br>
\|	--	|<br>

## How A Computer Works
This section takes a look at some of the basic functions and software components of a computer. 

### Physical Architecture
A basic computer has three main parts. The CPU, memory, and I/O.

#### CPU
The CPU (Central Processing Unit) takes in the assembly instructions from memory and does what it is instructed to do.  A computer only does what it is told to do. If there is an error, it is not the computer making a mistake. The mistake is caused by the person who wrote the code.<br><br>This is also is where the registers are physically located.
##### Registers
Registers are used for temporarily storing data to be used by some operations in assembly.<br>
In assembly, a register can be set using the following:
```assembly
mov rax, 15
```
The opcode `mov` stands for *move* it is used to move the contents of registers to different places or to set a register with a specific value. In this case, the value *15* is stored in the register **rax**. Registers are labled using the following diagram:
<table border="1" cellspacing="0" cellpadding="2">
 <tbody><tr>
  <td align="center" colspan="12" bgcolor="#004080">&nbsp;<br><font size="+2" color="#FFFFFF" face="Arial">traditional general purpose registers</font><br>&nbsp;</td>
 </tr>
 <tr>
  <td width="18" align="center" bgcolor="#004080"><font color="#FFFFFF" face="Arial">6<br>3</font></td>
  <td width="350" align="center" bgcolor="#004080"><font color="#FFFFFF" face="Arial">&nbsp;</font></td>
  <td width="18" align="center" bgcolor="#004080"><font color="#FFFFFF" face="Arial">3<br>2</font></td>
  <td width="18" align="center" bgcolor="#004080"><font color="#FFFFFF" face="Arial">3<br>1</font></td>
  <td width="150" align="center" bgcolor="#004080"><font color="#FFFFFF" face="Arial">&nbsp;</font></td>
  <td width="18" align="center" bgcolor="#004080"><font color="#FFFFFF" face="Arial">1<br>6</font></td>
  <td width="18" align="center" bgcolor="#004080"><font color="#FFFFFF" face="Arial">1<br>5</font></td>
  <td width="50" align="center" bgcolor="#004080"><font color="#FFFFFF" face="Arial">&nbsp;</font></td>
  <td width="18" align="center" bgcolor="#004080"><font color="#FFFFFF" face="Arial">8</font></td>
  <td width="18" align="center" bgcolor="#004080"><font color="#FFFFFF" face="Arial">7</font></td>
  <td width="50" align="center" bgcolor="#004080"><font color="#FFFFFF" face="Arial">&nbsp;</font></td>
  <td width="18" align="center" bgcolor="#004080"><font color="#FFFFFF" face="Arial">0</font></td>
 </tr>
 <tr>
 </tr>
 <tr>
  <td align="center" colspan="12" bgcolor="#B0D0D0"><font face="Arial">RAX or R0</font></td>
 </tr>
 <tr>
  <td align="center" colspan="3" bgcolor="#008080"><font face="Arial">zero-extended</font></td>
  <td align="center" colspan="9"><font face="Arial">EAX or R0D</font></td>
 </tr>
 <tr>
  <td align="center" colspan="3" rowspan="2" bgcolor="#008080"><font face="Arial">preserved</font></td>
  <td align="center" colspan="3" rowspan="2" bgcolor="#808080"><font face="Arial">preserved</font></td>
  <td align="center" colspan="6"><font face="Arial">AX or R0W</font></td>
 </tr>
 <tr>
  <td align="center" colspan="3"><font face="Arial">AH</font></td>
  <td align="center" colspan="3"><font face="Arial">AL or R0B</font></td>
 </tr>
 <tr>
  <td align="center" colspan="12" bgcolor="#B0D0D0"><font face="Arial">RCX or R1</font></td>
 </tr>
 <tr>
  <td align="center" colspan="3" bgcolor="#008080"><font face="Arial">zero-extended</font></td>
  <td align="center" colspan="9"><font face="Arial">ECX or R1D</font></td>
 </tr>
 <tr>
  <td align="center" colspan="3" rowspan="2" bgcolor="#008080"><font face="Arial">preserved</font></td>
  <td align="center" colspan="3" rowspan="2" bgcolor="#808080"><font face="Arial">preserved</font></td>
  <td align="center" colspan="6"><font face="Arial">CX or R1W</font></td>
 </tr>
 <tr>
  <td align="center" colspan="3"><font face="Arial">CH</font></td>
  <td align="center" colspan="3"><font face="Arial">CL or R1B</font></td>
 </tr>
 <tr>
  <td align="center" colspan="12" bgcolor="#B0D0D0"><font face="Arial">RDX or R2</font></td>
 </tr>
 <tr>
  <td align="center" colspan="3" bgcolor="#008080"><font face="Arial">zero-extended</font></td>
  <td align="center" colspan="9"><font face="Arial">EDX or R2D</font></td>
 </tr>
 <tr>
  <td align="center" colspan="3" rowspan="2" bgcolor="#008080"><font face="Arial">preserved</font></td>
  <td align="center" colspan="3" rowspan="2" bgcolor="#808080"><font face="Arial">preserved</font></td>
  <td align="center" colspan="6"><font face="Arial">DX or R2W</font></td>
 </tr>
 <tr>
  <td align="center" colspan="3"><font face="Arial">DH</font></td>
  <td align="center" colspan="3"><font face="Arial">DL or R2B</font></td>
 </tr>
 <tr>
  <td align="center" colspan="12" bgcolor="#B0D0D0"><font face="Arial">RBX or R3</font></td>
 </tr>
 <tr>
  <td align="center" colspan="3" bgcolor="#008080"><font face="Arial">zero-extended</font></td>
  <td align="center" colspan="9"><font face="Arial">EBX or R3D</font></td>
 </tr>
 <tr>
  <td align="center" colspan="3" rowspan="2" bgcolor="#008080"><font face="Arial">preserved</font></td>
  <td align="center" colspan="3" rowspan="2" bgcolor="#808080"><font face="Arial">preserved</font></td>
  <td align="center" colspan="6"><font face="Arial">BX or R3W</font></td>
 </tr>
 <tr>
  <td align="center" colspan="3"><font face="Arial">BH</font></td>
  <td align="center" colspan="3"><font face="Arial">BL or R3B</font></td>
 </tr>
 <tr>
  <td align="center" colspan="12" bgcolor="#B0D0D0"><font face="Arial"><a href="sframe.htm">RSP or R4</a></font></td>
 </tr>
 <tr>
  <td align="center" colspan="3" bgcolor="#008080"><font face="Arial">zero-extended</font></td>
  <td align="center" colspan="9"><font face="Arial"><a href="sframe.htm">ESP or R4D</a></font></td>
 </tr>
 <tr>
  <td align="center" colspan="3" rowspan="2" bgcolor="#008080"><font face="Arial">preserved</font></td>
  <td align="center" colspan="3" bgcolor="#808080"><font face="Arial">preserved</font></td>
  <td align="center" colspan="6"><font face="Arial"><a href="sframe.htm">SP or R4W</a></font></td>
 </tr>
 <tr>
  <td align="center" colspan="6" bgcolor="#808080"><font face="Arial">preserved</font></td>
  <td align="center" colspan="3" bgcolor="#B0D0D0"><font face="Arial">SPL or R4B</font></td>
 </tr>
 <tr>
  <td align="center" colspan="12" bgcolor="#B0D0D0"><font face="Arial">RBP or R5</font></td>
 </tr>
 <tr>
  <td align="center" colspan="3" bgcolor="#008080"><font face="Arial">zero-extended</font></td>
  <td align="center" colspan="9"><font face="Arial">EBP or R5D</font></td>
 </tr>
 <tr>
  <td align="center" colspan="3" rowspan="2" bgcolor="#008080"><font face="Arial">preserved</font></td>
  <td align="center" colspan="3" bgcolor="#808080"><font face="Arial">preserved</font></td>
  <td align="center" colspan="6"><font face="Arial">BP or R5W</font></td>
 </tr>
 <tr>
  <td align="center" colspan="6" bgcolor="#808080"><font face="Arial">preserved</font></td>
  <td align="center" colspan="3" bgcolor="#B0D0D0"><font face="Arial">BPL or R5B</font></td>
 </tr>
 <tr>
  <td align="center" colspan="12" bgcolor="#B0D0D0"><font face="Arial">RSI or R6</font></td>
 </tr>
 <tr>
  <td align="center" colspan="3" bgcolor="#008080"><font face="Arial">zero-extended</font></td>
  <td align="center" colspan="9"><font face="Arial">ESI or R6D</font></td>
 </tr>
 <tr>
  <td align="center" colspan="3" rowspan="2" bgcolor="#008080"><font face="Arial">preserved</font></td>
  <td align="center" colspan="3" bgcolor="#808080"><font face="Arial">preserved</font></td>
  <td align="center" colspan="6"><font face="Arial">SI or R6W</font></td>
 </tr>
 <tr>
  <td align="center" colspan="6" bgcolor="#808080"><font face="Arial">preserved</font></td>
  <td align="center" colspan="3" bgcolor="#B0D0D0"><font face="Arial">SIL or R6B</font></td>
 </tr>
 <tr>
  <td align="center" colspan="12" bgcolor="#B0D0D0"><font face="Arial">RDI or R7</font></td>
 </tr>
 <tr>
  <td align="center" colspan="3" bgcolor="#008080"><font face="Arial">zero-extended</font></td>
  <td align="center" colspan="9"><font face="Arial">EDI or R7D</font></td>
 </tr>
 <tr>
  <td align="center" colspan="3" rowspan="2" bgcolor="#008080"><font face="Arial">preserved</font></td>
  <td align="center" colspan="3" bgcolor="#808080"><font face="Arial">preserved</font></td>
  <td align="center" colspan="6"><font face="Arial">DI or R7W</font></td>
 </tr>
 <tr>
  <td align="center" colspan="6" bgcolor="#808080"><font face="Arial">preserved</font></td>
  <td align="center" colspan="3" bgcolor="#B0D0D0"><font face="Arial">DIL or R7B</font></td>
 </tr>
</tbody></table>

#### Memory
The Random Access Memory or RAM for short, is used to store data for short periods of time. It is based on emmc flash ics (integrated circuits). emmc is also used in USB (Universal Serial Bus) devices and SSDs (Solid State Drives)

#### I/O
All external devices are connected through I/O (Input / Output). Some of these devices could be keyboards, mice, storage (hard drives and SSDs), graphics cards, printers, and USB devices.

## <div id="gis">Building a basic Global Information System </div>

The final mini project that I want to make is a basic GIS (Global Information System). A key function that a GIS deals with is terrain mapping. In this project, I will be graphing altitude data.

### Getting started
Due to its ease of use, I will be writing this program in [Lua](lua.org),  using the [Tic80](https://tic.computer) API. This allows easy packaged distribution (the entire program is stored in one file) of the program and an easy way to draw graphics, which will be important for displaying data.

### End goal
I am creating a system that will allow terrain altitude points to be entered. Then the points will be "compressed" in this scenario, the average of multiple points will be stored in an array to save space. I will also have a system to recreate a semi-accurate model of the original data using as little data points as possible. It is only *semi accurate* because I am using a lossy compression algorithm. Lossy means that the output data is not an exact replica of the input. The alternative to lossy compression is lossless. Lossless compression means that the data comes out exactly as it goes in.

### Tic80

Tic80 is a fantasy computer for making, playing and sharing games. It has built in tools for code, sprites (graphics), maps, sound editors and the command line which are enough tools to make a game. Games  are stored on `.cart` files that emulate game cartridges. It has a 240x136 pixels display, 16 colour palette, 256 8x8 colour sprites, and 4 channel sound.


### Limitations
Instead of having a 3D model of the mapping region, I will only be able to provide a 2D view because the Tic80 API does not easily allow 3D graphics. This could still be useful if you were to render a bunch of 2D views but I don't have the time or skill to make 3D graphics work.

### The Program

Due to the large file size, the code cannot be displayed in this file. I have made the code available on [GitHub](https://github.com/Ewpratten/HowToComputer/tree/master/minigis).

### Program Breakdown
Lua's [comments](#comments) are formatted in the following way:
```lua
--this is a comment
-- this is a comment
-- This Is A Comment --
```

The first section of the program is the [array](#arrays). All the information to be compressed is stored in the array called *ino*. Due to the lack of safety checks in the code, this array **must** contain 24 or more entries. Only the first 24 entries in the array will be used because of limited screen space on the Tic80 console.
```lua
-- input data --
ino={13,16,35,46,35,22,37,51,45,48,49,33,34,67,47,45,47,46,36,38,47,47,79,99}
```
The second section of the program declares + initializes variables and arrays.
```lua
-- Declare variables --
state=2 comp={} og={}
```
This section is important because lua requires variables to contain content in order to preform mathematical operations. I originally did not define variables and ended up with a screen full of errors or just crashing my computer.
<br><br>
The next section stores the inputted data in the *og* array so that the program can display the original data for comparing results. 
```lua
-- Store input data for use by draw("input") --
for i=1, 24 do
	og[i]=ino[i]
end
```
Next comes the most important part of this program!
```lua
-- Compression --
function compress()
	j=1
	for i=1, 8 do
		comp[j]=(ino[i]+ino[i+1]+ino[i+2])/3
		i=i+3 -step forward 3 in index
		j=j+1-step forward 1 in index
	end
end
```
This is the compression algorithm. The way it works is actually quite simple. The design is based on this diagram that I drew:

![IMAGE UNABLE TO DISPLAY](https://raw.githubusercontent.com/Ewpratten/HowToComputer/master/img/compression.jpeg "compression")

I will try to explain the algorithm in a way that is easier to understand. Let's start with three data points. Due to the 3:1 compression, these three points need to be made into one point. The way that I handle this is as follows. Let's say that these are the three points: *12, 15, 16*. The program then finds the average of the points and stores it in an [array](#arrays). In this case, the output would be *14.333*.
<br><br>
Now for the opposite.
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
This part un-compresses the data. It is the same as the compression algorithm but backwards. The output data is stored in the ino array.

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
This section is the drawing / graphing code. It has three states, *input, output, and compressed* for each state, it iterates through the given points then takes the data value and generates coordinates. The **x** coordinate is generated by finding the current position in the array then multiplying by 8. The **y** coordinate is the value stored in the array. Next, it draws the points using the Tic80 sprite function, which draws the little red dot.
<br><br>
The program initializes by compressing then uncompromising the data.

```lua
compress()
uncompress()
```
Then, finally, the main function executes

```lua
-- Main Loop --
function TIC()
	cls(13) -clear screen
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
The `TIC()` function runs once every 60 seconds. First, it clears the screen and then it tests if any buttons are being pressed. If a button is pressed, the *state* changes. Next, it checks the state and draws the matching data.

## Conclusion 
What have I learned? The answer is *a lot*! Going into this project, I did not expect to learn as much as I did. I even learned things that I thought I already knew, for example, how to properly make use of `for` loops to make small, efficient code that is very functional. I have also learned about the importance of commenting code, as I got lost while trying to figure out how my compression algorithm worked after two weeks of working on other parts of this project.

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
