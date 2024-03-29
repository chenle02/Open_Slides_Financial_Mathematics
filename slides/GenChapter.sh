#!/bin/bash
if [ ! $# -eq 1 ]
then
   echo ""
   echo ""
   echo "Usage: $0 number"
   echo "1. Edit toc.lua for the table of content."
   echo "2. Run toc.lua to generate toc.table."
   echo "3. Run GenSlides.lua to generate Section files."
   echo "4. Edit Title.tex for course name and other meta data."
   echo "5. Finally run this file to generate chapter files."
   echo "by Le CHEN, (chenle02@gmail.com)"
   echo "2021-May-15"
   echo ""
   echo ""
   exit 1
fi

if [ $1 -ge 21 ] || [ $1 -le -1 ]
then
	echo ""
	echo "Please give a number between 1 and 20"
	echo "0 for all chapters"
	echo ""
	exit 1
fi

declare -a arr=(
	"Chapter-1"
	"Chapter-2"
	"Chapter-3"
	"Chapter-4"
	"Chapter-5"
	"Chapter-6"
	"Chapter-7"
	"Chapter-8"
	"Chapter-9"
	"Chapter-10"
	"Chapter-11"
	"Chapter-12"
	"Chapter-13"
	"Chapter-14"
	"Chapter-15"
	"Chapter-16"
	"Chapter-17"
	"Chapter-18"
	"Chapter-19"
	"Chapter-20"
	)

# Skipping some chapters.
for i in 4 6 7 8 15 16 17
do
	if [ $i == $1 ]; then
		echo "We do not teach this Chapter."
		exit 1
	fi
done

# Generating all chapters.
if [ $1 == 0 ]; then
	for i in 1 2 3 5 9 10 11 12 13 14 18 19 20
	do
		Chapter=${arr[$i-1]}
		echo "Generating $Chapter "
		echo "Working .... "
		if test -f $Chapter".conf"; then
			echo "Generate $Chapter"
			Full=$Chapter"_full.tex"
			FullPdf=$Chapter"_full.pdf"
			Compact=$Chapter"_compact.tex"
			CompactPdf=$Chapter"_compact.pdf"
			cp Heads.tex $Full
			cp Heads.tex $Compact
			sed -i '1d' $Full # Remove the first line in place
			sed -i '1s/^.//' $Full # Remove the first character.
			cat  $Chapter".conf" >> $Full
			cat  $Chapter".conf" >> $Compact
			echo "Gererating the full version ...."
			cp $Full $Chapter".tex"
			time	lualatex --interaction=batchmode $Full
			time	lualatex --interaction=batchmode $Full
			echo "Generating the compact version ...."
			time 	lualatex --interaction=batchmode $Compact
			time 	lualatex --interaction=batchmode $Compact
			# echo "Uploading to the webste ... "
			# scp $FullPdf Emory:/home/lchen41/share/public_html/teaching/2020_Spring
			# scp $CompactPdf Emory:/home/lchen41/share/public_html/teaching/2020_Spring
			echo "Done with $Chapter. "
			echo ""
		else
			echo "Please specify " $Chapter".conf first."
						echo ""
		fi
	done
	exit 2
fi

# Generating one chapter.

Chapter=${arr[$1-1]}

echo "Generating $Chapter "
echo "Working .... "
if test -f $Chapter".conf"; then
	echo "Generate $Chapter"
	Full=$Chapter"_full.tex"
	FullPdf=$Chapter"_full.pdf"
	Compact=$Chapter"_compact.tex"
	CompactPdf=$Chapter"_compact.pdf"
	cp Heads.tex $Full
	cp Heads.tex $Compact
	sed -i '1d' $Full # Remove the first line in place
	sed -i '1s/^.//' $Full # Remove the first character.
	cat  $Chapter".conf" >> $Full
	cat  $Chapter".conf" >> $Compact
	echo "Gererating the full version ...."
	cp $Full $Chapter".tex"
	time	lualatex --interaction=batchmode $Full
	time	lualatex --interaction=batchmode $Full
	echo "Generating the compact version ...."
	time 	lualatex --interaction=batchmode $Compact
	time 	lualatex --interaction=batchmode $Compact
	# echo "Uploading to the webste ... "
	# scp $FullPdf Emory:/home/lchen41/share/public_html/teaching/2020_Spring
	# scp $CompactPdf Emory:/home/lchen41/share/public_html/teaching/2020_Spring
	echo "Done with $Chapter. "
	echo ""
else
	echo "Please specify " $Chapter".conf first."
       	echo ""
fi

exit 0


# # The following codes generate all lectures.
# for i in {0..21..1}
# do
# 	Lecture=${arr[$i]}
# 	if test -f $Chapter".conf"; then
# 		echo $Chapter " on date"  $Date
# 		echo "Generate $Chapter"
# 		cp Heads.tex $Chapter".tex"
# 		sed -i "s/2020 Spring/$Date/g" $Chapter".tex"
# 		cat  $Chapter".conf" >> $Chapter".tex"
# 		pdflatex --interaction=batchmode $Chapter".tex"
# 		pdflatex --interaction=batchmode $Chapter".tex"
# 		scp $Chapter".pdf" Emory:/home/lchen41/share/public_html/teaching/2020_Spring
# 		echo "Done with $Chapter. "
# 		echo ""
# 	fi
# done
#
