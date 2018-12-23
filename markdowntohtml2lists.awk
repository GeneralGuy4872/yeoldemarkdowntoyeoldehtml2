BEGIN {
para=0
list=0
}
{
if (list == 2)
	dosublist()
else if (list == 1)
	dolist()
else if (para == 1)
	dopara()
else
	dobody()
}
function dobody(){
	if ($0 ~ /<P>/)
		doparainit()
	else
		print
}
function doparainit(){
	para++
	dopara()
}
function dopara(){
	if ($0 ~ /^[*+-][ \.\t]*/)
		dolistinit()
	else if ($0 ~ /<\/P>/)
		doparaexit()
	else
		print
}
function doparaexit(){
	para--
	print
}
function dolistinit(){
	list++
	printf("<UL>\n")
	dolist()
}
function dolist(){
	if ($0 ~ /^[ \t]*[*][ \t]+/)
		dolistprint()
	else if ($0 ~ /^[ \t]*[+-][ \t]+/)
		dosublistinit()
	else
		dolistexit()
}
function dolistprint(){
	printf("<LI>")
	$1=""
	$0=$0
	print
}
function dolistexit(){
	list--
	printf("</UL>\n")
	dopara()
}
function dosublistinit(){
	list++
	printf("<UL COMPACT>\n")
	dosublist()
}
function dosublist(){
	if ($0 ~ /^[ \t]*[+-][ \t]+/)
		dolistprint()
	else
		dosublistexit()
}
function dosublistexit(){
	list--
	printf("</UL>\n")
	dolist()
}
