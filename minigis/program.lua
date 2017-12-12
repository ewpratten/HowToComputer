a=0 b=0 c=0 d=0 e=0 f=0 g=0 h=0 state=0

a1=13
a2=16
a3=35
b1=46
b2=35
b3=22
c1=37
c2=51
c3=45
d1=48
d2=49
d3=33
e1=34
e2=67
e3=47
f1=45
f2=47
f3=46
g1=36
g2=38
g3=47
h1=47
h2=79
h3=99

ia1=0
ia2=0
ia3=0
ib1=0
ib2=0
ib3=0
ic1=0
ic2=0
ic3=0
id1=0
id2=0
id3=0
ie1=0
ie2=0
ie3=0
if1=0
if2=0
if3=0
ig1=0
ig2=0
ig3=0
ih1=0
ih2=0
ih3=0

function clearmem()
a1=0 a2=0 a3=0 b1=0 b2=0 b3=0 c1=0 c2=0 c3=0 d1=0 d2=0 d3=0 e1=0 e2=0 e3=0 f1=0 f2=0 f3=0 g1=0 g2=0 g3=0 h1=0 h2=0 h3=0
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
-- clearmem()
end

function drawcpr()
	if a>128 then a=128 end
	spr(2,1*8,a)
	
	if b>128 then b=128 end
	spr(2,4*8,b)
	
	if c>128 then c=128 end
	spr(2,7*8,c)
	
	if d>128 then d=128 end
	spr(2,10*8,d)
	
	if e>128 then e=128 end
	spr(2,13*8,e)
	
	if f>128 then f=128 end
	spr(2,16*8,f)
	
	if g>128 then g=128 end
	spr(2,19*8,g)
	
	if h>128 then h=128 end
	spr(2,22*8,h)
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
	
		if a1>128 then a1=128 end
	spr(1,1*8-8,a1)
	
	if b1>128 then b1=128 end
	spr(1,4*8-8,b1)
	
	if c1>128 then c1=128 end
	spr(1,7*8-8,c1)
	
	if d1>128 then d1=128 end
	spr(1,10*8-8,d1)
	
	if e1>128 then e1=128 end
	spr(1,13*8-8,e1)
	
	if f1>128 then f1=128 end
	spr(1,16*8-8,f1)
	
	if g1>128 then g1=128 end
	spr(1,19*8-8,g1)
	
	if h1>128 then h1=128 end
	spr(1,22*8-8,h1)
	
		if a2>128 then a2=128 end
	spr(1,1*8,a2)
	
	if b2>128 then b2=128 end
	spr(1,4*8,b2)
	
	if c2>128 then c2=128 end
	spr(1,7*8,c2)
	
	if d2>128 then d2=128 end
	spr(1,10*8,d2)
	
	if e2>128 then e2=128 end
	spr(1,13*8,e2)
	
	if f2>128 then f2=128 end
	spr(1,16*8,f2)
	
	if g2>128 then g2=128 end
	spr(1,19*8,g2)
	
	if h2>128 then h2=128 end
	spr(1,22*8,h)
	
		if a3>128 then a3=128 end
	spr(1,1*8+8,a3)
	
	if b3>128 then b3=128 end
	spr(1,4*8+8,b3)
	
	if c3>128 then c3=128 end
	spr(1,7*8+8,c3)
	
	if d3>128 then d3=128 end
	spr(1,10*8+8,d3)
	
	if e3>128 then e3=128 end
	spr(1,13*8+8,e3)
	
	if f3>128 then f3=128 end
	spr(1,16*8+8,f3)
	
	if g3>128 then g3=128 end
	spr(1,19*8+8,g3)
	
	if h3>128 then h3=128 end
	spr(1,22*8+8,h3)
end

function drawog()
	
	
		if ia1>128 then ia1=128 end
	spr(1,1*8-8,ia1)
	
	if ib1>128 then ib1=128 end
	spr(1,4*8-8,ib1)
	
	if ic1>128 then ic1=128 end
	spr(1,7*8-8,ic1)
	
	if id1>128 then id1=128 end
	spr(1,10*8-8,id1)
	
	if ie1>128 then ie1=128 end
	spr(1,13*8-8,ie1)
	
	if if1>128 then if1=128 end
	spr(1,16*8-8,if1)
	
	if ig1>128 then ig1=128 end
	spr(1,19*8-8,ig1)
	
	if ih1>128 then ih1=128 end
	spr(1,22*8-8,ih1)
	
		if ia2>128 then ia2=128 end
	spr(1,1*8,ia2)
	
	if ib2>128 then ib2=128 end
	spr(1,4*8,ib2)
	
	if ic2>128 then ic2=128 end
	spr(1,7*8,ic2)
	
	if id2>128 then id2=128 end
	spr(1,10*8,id2)
	
	if ie2>128 then ie2=128 end
	spr(1,13*8,ie2)
	
	if if2>128 then if2=128 end
	spr(1,16*8,if2)
	
	if ig2>128 then ig2=128 end
	spr(1,19*8,ig2)
	
	if ih2>128 then ih2=128 end
	spr(1,22*8,h)
	
		if ia3>128 then ia3=128 end
	spr(1,1*8+8,ia3)
	
	if ib3>128 then ib3=128 end
	spr(1,4*8+8,ib3)
	
	if ic3>128 then ic3=128 end
	spr(1,7*8+8,ic3)
	
	if id3>128 then id3=128 end
	spr(1,10*8+8,id3)
	
	if ie3>128 then ie3=128 end
	spr(1,13*8+8,ie3)
	
	if if3>128 then if3=128 end
	spr(1,16*8+8,if3)
	
	if ig3>128 then ig3=128 end
	spr(1,19*8+8,ig3)
	
	if ih3>128 then ih3=128 end
	spr(1,22*8+8,ih3)

end

ia1=a1
ia2=a2
ia3=a3
ib1=b1
ib2=b2
ib3=b3
ic1=c1
ic2=c2
ic3=c3
id1=d1
id2=d2
id3=d3
ie1=e1
ie2=e2
ie3=e3
if1=f1
if2=f2
if3=f3
ig1=g1
ig2=g2
ig3=g3
ih1=h1
ih2=h2
ih3=h3
-- One Time ---
compress()
uncompress()

function TIC()
	if state==0 then
		cls(13)
		if btn(0) then state=1 end
		if btn(2) then state=2 end
		--compress()
		drawcpr()
	elseif state==1 then
		if btn(1) then state=0 end
		if btn(2) then state=2 end
		cls(13)
		--uncompress()
		draw()
	elseif state==2 then
		if btn(0) then state=1 end
		if btn(1) then state=0 end
		cls(13)
		drawog()
	end
end
