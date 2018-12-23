BEGIN {FS = "\n"; RS = "\n\n";
printf("<!DOCTYPE html PUBLIC \"-//IETF//DTD HTML 2.0//EN\"><HTML>\n<HEAD>\n<TITLE>MARKDOWN DOCUMENT (TRANSLATED TO HTML2.0)</TITLE>\n</HEAD>\n<BODY>\n");
}
{
if ($2 ~ /[===]+/)
	myheader()
else if ($2 ~ /[---]+/)
	mysubheader()
else
	myparagraph()
}
function myheader(){
printf("<H1>\n");print $1;printf("</H1>\n");
}
function mysubheader(){
printf("<H3>\n");print $1;printf("</H3>\n");
}
function myparagraph(){
printf("<P>\n");print $0;printf("\n</P>\n")
}
END {
printf("</BODY></HTML>")
}
