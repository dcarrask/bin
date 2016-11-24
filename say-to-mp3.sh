#!/bin/bash
FULLFILE=$1;
FILE="${FULLFILE%%.*}";
# Convert to an audio file at 310 words per minute. I personally select the UK's Serena as the Mac default voice 
echo "converting $FILE.txt to $FILE.aiff";
`say -f $FILE.txt -r 310 -o $FILE.aiff --progress`;
echo "conververting $FILE.aiff to $FILE.mp3";
`ffmpeg -i $FILE.aiff $FILE.mp3`;
# Change the MP3 ID3 for the Album
id3tag -A$FILE $FILE.mp3;
`rm $FILE.aiff`;

#say -o interlaken.aac 'INTERLAKEN'
#say --progress --rate=10 'Las primeras hipótesis apuntan a que el agresor sufre problemas mentales aunque no se descarta que el suceso esté relacionado con el terrorismo'
#say -f songs-list.txt --rate=10 --interactive