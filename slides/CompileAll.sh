#!/bin/bash
if [ $# -eq 0 ]
then
   echo ""
   echo ""
   echo "Usage: $0 "
   echo "Work under working directory."
   echo "by Le CHEN, (chenle02@gmail.com)"
   echo "Sun 15 Aug 2021 11:32:09 PM EDT"
   echo ""
   echo ""
   exit 1
fi

for x in 1 2 3 5 9 10 11 12 13 14 18 19 20
do
   echo $x
   ./CompileChapter.sh $x
done

../upload yes
./update.sh yes

