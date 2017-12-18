-- input data --
ino={13,16,35,46,35,22,37,51,45,48,49,33,34,67,47,45,47,46,36,38,47,47,79,99}

-- Declare variables --
state=2 comp={} og={}

-- Store input data for use by draw("input") --
for i=1, 24 do
	og[i]=ino[i]
end

-- Compression --
function compress()
	j=1
	for i=1, 8 do
		comp[j]=(ino[i]+ino[i+1]+ino[i+2])/3
		i=i+3
		j=j+1
	end
end

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

-- Graphics --
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

-- Startup --
compress()
uncompress()

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
