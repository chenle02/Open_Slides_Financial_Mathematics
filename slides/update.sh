#!/usr/bin/env bash
# #!/bin/bash
if [ $# -eq 0 ]
then
   echo ""
   echo ""
   echo "Usage: $0 [Yes]"
   echo "Update the public git repository for slides"
   echo "by Le CHEN, (chenle02@gmail.com)"
   echo "Thu 22 Jul 2021 06:35:38 AM EDT"
   echo ""
   echo ""
   exit 1
fi

to=/home/lechen/Dropbox/Teaching/svn_teaching/2021_Fall_Math5870/public/slides
from=/home/lechen/Dropbox/Teaching/svn_teaching/2021_Fall_Math5870/slides

for f in *.pdf
do
	# FAILSAFE #
	# Check if "$f" FILE exists and is a regular file and then only copy it #
  if [ -f "$f" ]
  then
    echo "Processing $f file..."
    rsync -akrzv --copy-links $from/$f $to/$f
  else
    echo "Warning: Some problem with \"$f\""
  fi
done

cd $to
git add *
git commit -m 'Update slides'
git push
cd $from
