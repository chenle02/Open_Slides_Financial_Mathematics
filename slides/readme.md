# Work flow
1. Edit [toc.lua](toc.lua) for the table of contents.
2. Run [GenSlides.lua](GenSlides.lua) to generate section files.
3. Edit [Title.tex](Title.tex) for course information
4. Edit [GenChapter.sh](GenChapter.sh) to reflect chapters that are included in the slides and run it.

# Miscs
1. Edit whenever necessary [Common.tex](Common.tex) for colors and environments
	1. Here are a list of my environments:
		1. mythm
		2. mycor
		2. mysol
		3. remark
		4. myexample
		4. mydefinition
		4. myproof
	2. The numbering is using \mySecNum defined at beginning of each section file.
