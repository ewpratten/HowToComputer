-- title:  tic compression
-- author: ewpratten
-- desc:   a basic compression thingy
-- script: lua
-- input data --
ino={13,16,35,46,35,22,37,51,45,48,49,33,34,67,47,45,47,46,36,38,47,47,79,99}


comp={}
-- Setting and clearing variables --
a=0 b=0 c=0 d=0 e=0 f=0 g=0 h=0 state=2
a1=ino[1] a2=ino[2] a3=ino[3] b1=ino[4] b2=ino[5] b3=ino[6] c1=ino[7] c2=ino[8] c3=ino[9] d1=ino[10] d2=ino[11] d3=ino[12] e1=ino[13] e2=ino[14] e3=ino[15] f1=ino[16] f2=ino[17] f3=ino[18] g1=ino[19] g2=ino[20] g3=ino[21] h1=ino[22] h2=ino[23] h3=ino[24]
ia1=0 ia2=0 ia3=0 ib1=0 ib2=0 ib3=0 ic1=0 ic2=0 ic3=0 id1=0 id2=0 id3=0 ie1=0 ie2=0 ie3=0 if1=0 if2=0 if3=0 ig1=0 ig2=0 ig3=0 ih1=0 ih2=0 ih3=0
ia1=a1 ia2=a2 ia3=a3 ib1=b1 ib2=b2 ib3=b3 ic1=c1 ic2=c2 ic3=c3 id1=d1 id2=d2 id3=d3 ie1=e1 ie2=e2 ie3=e3 if1=f1 if2=f2 if3=f3 ig1=g1 ig2=g2 ig3=g3 ih1=h1 ih2=h2 ih3=h3

--for i=0, 18 do
--	end
	
-- Compression --
function compress()
j=1
for i=1, 8 do
	--trace((ino[i]+ino[i+1]+ino[i+2])/3)
	comp[j]=(ino[i]+ino[i+1]+ino[i+2])/3
	i=i+3
	j=j+1
end
end

function uncompress()
j=1
for i=1, 22 do
	mid=(comp[j]+comp[j+1])/2
	ino[i]=(comp[j]+mid)/2
	ino[i+1]=(comp[j+1]+mid)/2
	
	j=j+1
	i=i+2
end
end

-- Graphics --
function drawcpr()
	j=1
for i=1, 8 do
	if comp[i]>128 then comp[i]=128 end
	spr(1,j*8,comp[i])
	
	i=i+1
	j=j+3
end
end



function draw()
	
	-- Section 1 --
	if a1>128 then a1=128 end	spr(1,1*8-8,a1)
	
	if b1>128 then b1=128 end	spr(1,4*8-8,b1)
	
	if c1>128 then c1=128 end	spr(1,7*8-8,c1)
	
	if d1>128 then d1=128 end	spr(1,10*8-8,d1)
	
	if e1>128 then e1=128 end	spr(1,13*8-8,e1)
	
	if f1>128 then f1=128 end	spr(1,16*8-8,f1)
	
	if g1>128 then g1=128 end	spr(1,19*8-8,g1)
	
	if h1>128 then h1=128 end	spr(1,22*8-8,h1)
	
	-- Section 2 --
	if a2>128 then a2=128 end	spr(1,1*8,a2)
	
	if b2>128 then b2=128 end	spr(1,4*8,b2)
	
	if c2>128 then c2=128 end	spr(1,7*8,c2)
	
	if d2>128 then d2=128 end	spr(1,10*8,d2)
	
	if e2>128 then e2=128 end	spr(1,13*8,e2)
	
	if f2>128 then f2=128 end	spr(1,16*8,f2)
	
	if g2>128 then g2=128 end	spr(1,19*8,g2)
	
	if h2>128 then h2=128 end	spr(1,22*8,h)
	
	-- Section 3 --
	if a3>128 then a3=128 end	spr(1,1*8+8,a3)
	
	if b3>128 then b3=128 end	spr(1,4*8+8,b3)
	
	if c3>128 then c3=128 end	spr(1,7*8+8,c3)
	
	if d3>128 then d3=128 end	spr(1,10*8+8,d3)
	
	if e3>128 then e3=128 end	spr(1,13*8+8,e3)
	
	if f3>128 then f3=128 end	spr(1,16*8+8,f3)
	
	if g3>128 then g3=128 end	spr(1,19*8+8,g3)
	
	if h3>128 then h3=128 end	spr(1,22*8+8,h3)
end

function drawog()
	
	-- Section 1 --
	if ia1>128 then ia1=128 end	spr(1,1*8-8,ia1)
	
	if ib1>128 then ib1=128 end	spr(1,4*8-8,ib1)
	
	if ic1>128 then ic1=128 end	spr(1,7*8-8,ic1)
	
	if id1>128 then id1=128 end	spr(1,10*8-8,id1)
	
	if ie1>128 then ie1=128 end	spr(1,13*8-8,ie1)
	
	if if1>128 then if1=128 end	spr(1,16*8-8,if1)
	
	if ig1>128 then ig1=128 end	spr(1,19*8-8,ig1)
	
	if ih1>128 then ih1=128 end	spr(1,22*8-8,ih1)
	
	-- Section 2 --
	if ia2>128 then ia2=128 end	spr(1,1*8,ia2)
	
	if ib2>128 then ib2=128 end	spr(1,4*8,ib2)
	
	if ic2>128 then ic2=128 end	spr(1,7*8,ic2)
	
	if id2>128 then id2=128 end	spr(1,10*8,id2)
	
	if ie2>128 then ie2=128 end
	spr(1,13*8,ie2)
	
	if if2>128 then if2=128 end	spr(1,16*8,if2)
	
	if ig2>128 then ig2=128 end	spr(1,19*8,ig2)
	
	if ih2>128 then ih2=128 end	spr(1,22*8,h)
	
	-- Section 3 --
	if ia3>128 then ia3=128 end	spr(1,1*8+8,ia3)
	
	if ib3>128 then ib3=128 end	spr(1,4*8+8,ib3)
	
	if ic3>128 then ic3=128 end	spr(1,7*8+8,ic3)
	
	if id3>128 then id3=128 end	spr(1,10*8+8,id3)
	
	if ie3>128 then ie3=128 end	spr(1,13*8+8,ie3)
	
	if if3>128 then if3=128 end	spr(1,16*8+8,if3)
	
	if ig3>128 then ig3=128 end	spr(1,19*8+8,ig3)
	
	if ih3>128 then ih3=128 end	spr(1,22*8+8,ih3)
end


-- Startup --
compress()
-- remove this
a=comp[1] b=comp[2] c=comp[3] d=comp[4] e=comp[5] f=comp[6] g=comp[7] h=comp[8]

uncompress()

-- Main Loop --
function TIC()
	if state==0 then
		if btn(0) then state=1 end
		if btn(2) then state=2 end
		cls(13)
		drawcpr()
	elseif state==1 then
		if btn(1) then state=0 end
		if btn(2) then state=2 end
		cls(13)
		draw()
	elseif state==2 then
		if btn(0) then state=1 end
		if btn(1) then state=0 end
		cls(13)
		drawog()
	end
end
