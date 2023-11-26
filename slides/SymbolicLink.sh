#!/usr/bin/env bash

to=/home/lechen/Dropbox/Teaching/svn_teaching/2021_Fall_Math5870/vimwiki_html
from=/home/lechen/Dropbox/Teaching/svn_teaching/2021_Fall_Math5870/slides

for f in *.pdf
do
	# FAILSAFE #
	# Check if "$f" FILE exists and is a regular file and then only copy it #
  if [ -f "$f" ]
  then
    echo "Processing $f file..."
    ln -s $from/$f $to/$f
  else
    echo "Warning: Some problem with \"$f\""
  fi
done
exit 0
