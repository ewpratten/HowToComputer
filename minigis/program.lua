a=0
b=0
c=0
d=0
e=0
f=0
g=0

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

state=0

function clearmem()
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
end

function compress()
a=(a1+a2+a3)/3
b=(b1+b2+b3)/3
c=(c1+c2+c3)/3
d=(d1+d2+d3)/3
e=(e1+e2+e3)/3
f=(f1+f2+f3)/3
g=(g1+g2+g3)/3
h=(h1+h2+h3)/3
clearmem()
end

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

function uncompress()
	a2=a
	aa2=(a+b)/2
	a3=(aa2+a)/2
	
	b2=b
	bb1=(b+c)/2
	b1=(bb1+b)/2
	bb2=(b+c)/2
	b3=(bb2+b)/2
	
	c2=c
	cc1=(c+d)/2
	c1=(cc1+c)/2
	cc2=(c+d)/2
	c3=(cc2+c)/2
	
	d2=d
	dd1=(d+e)/2
	d1=(dd1+d)/2
	dd2=(d+e)/2
	d3=(dd2+d)/2
	
	e2=e
	ee1=(e+f)/2
	e1=(ee1+e)/2
	ee2=(e+f)/2
	e3=(e2+e)/2
	
	f2=f
	ff1=(f+g)/2
	f1=(ff1+f)/2
	ff2=(f+g)/2
	f3=(ff2+f)/2
	
	g2=g
	gg1=(g+h)/2
	g1=(gg1+g)/2
	gg2=(g+h)/2
	g3=(gg2+g)/2
	
	h2=h
	h1=(g3+h)/2
end

function draw()
		if a>128 then a=128 end
	spr(1,1,a)
	
	if b>128 then b=128 end
	spr(1,4,b)
	
	if c>128 then c=128 end
	spr(1,7,c)
	
	if d>128 then d=128 end
	spr(1,10,d)
	
	if e>128 then e=128 end
	spr(1,13,e)
	
	if f>128 then f=128 end
	spr(1,16,f)
	
	if g>128 then g=128 end
	spr(1,19,g)
	
	if h>128 then h=128 end
	spr(1,22,h)
	
		if a1>128 then a1=128 end
	spr(1,1,a1)
	
	if b1>128 then b1=128 end
	spr(1,4,b1)
	
	if c1>128 then c1=128 end
	spr(1,7,c1)
	
	if d1>128 then d1=128 end
	spr(1,10,d1)
	
	if e1>128 then e1=128 end
	spr(1,13,e1)
	
	if f1>128 then f1=128 end
	spr(1,16,f1)
	
	if g1>128 then g1=128 end
	spr(1,19,g1)
	
	if h1>128 then h1=128 end
	spr(1,22,h1)
	
		if a2>128 then a2=128 end
	spr(1,1,a2)
	
	if b2>128 then b2=128 end
	spr(1,4,b2)
	
	if c2>128 then c2=128 end
	spr(1,7,c2)
	
	if d2>128 then d2=128 end
	spr(1,10,d2)
	
	if e2>128 then e2=128 end
	spr(1,13,e2)
	
	if f2>128 then f2=128 end
	spr(1,16,f2)
	
	if g2>128 then g2=128 end
	spr(1,19,g2)
	
	if h2>128 then h2=128 end
	spr(1,22,h)
	
		if a3>128 then a3=128 end
	spr(1,1,a3)
	
	if b3>128 then b3=128 end
	spr(1,4,b3)
	
	if c3>128 then c3=128 end
	spr(1,7,c3)
	
	if d3>128 then d3=128 end
	spr(1,10,d3)
	
	if e3>128 then e3=128 end
	spr(1,13,e3)
	
	if f3>128 then f3=128 end
	spr(1,16,f3)
	
	if g3>128 then g3=128 end
	spr(1,19,g3)
	
	if h3>128 then h3=128 end
	spr(1,22,h3)
end

function TIC()
	if state==0 then
		cls(13)
		if btn(0) then state=1 end
		compress()
		drawcpr()
	elseif state==1 then
		if btn(0) then state=0 end
		cls(13)
		uncompress()
		draw()
	end
end
