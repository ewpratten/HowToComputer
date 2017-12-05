# From Click To Bit
## How computers work at a low level
#### By: ewpratten
#### [Credits](https://github.com/Ewpratten/HowToComputer/blob/master/CONTRIBUTORS.md)

## Introduction
This is partially a school project but mostly for me to learn about how computers work at the machine code level.
<br>
<br>
The repo is organised in to folders for each project or tutorial.
<br>
<br>
The examples will be shown at three levels. First, an example of what the user sees (ex. a window with a button). I will be calling this the ** User ** level. Second, an example of the underlying code in a high level, interpreted language. I have chosen python because of it's simplicity and flexibility. Third, an example in [**machine code**](https://en.wikipedia.org/wiki/Machine_code) specifically, x86-64 assembly. I chose assembly because is a good way of showing what is happening on the computer at the lowest level.
<br><br>
An important detail to note is that all of the tutorials are designed for a **linux** system running on a ** x86-64 ** cpu. The examples may work on other operating systems and architectures but have ** not ** been tested
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
