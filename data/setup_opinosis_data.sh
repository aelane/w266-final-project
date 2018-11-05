#!/bin/sh

mydir=$(pwd)

cd raw

rm -r opinosis_data

mkdir opinosis_data

cd opinosis_data

mkdir combined

wget https://github.com/kavgan/opinosis/raw/master/OpinosisDataset1.0_0.zip

unzip OpinosisDataset1.0_0.zip

rm OpinosisDataset1.0_0.zip

filetopics=topics/*.txt.data
for f1 in $filetopics
do
  echo "$f1"
  f1nosuffix=${f1%.txt.data}
  f1noprefix=${f1nosuffix#"topics/"}
  foldername=summaries-gold/$f1noprefix/*.gold
  for f2 in $foldername
  do
    echo "$f2"
    review=$mydir/raw/opinosis_data/$f1
    summary=$mydir/raw/opinosis_data/$f2
    f2nosuffix=${f2%.gold}
    f2noprefix=${f2nosuffix#${foldername%.gold}}
    #echo "foldername $foldername"
    #echo "f2 $f2"
    #echo "f2noprefix $f2noprefix"

    cat $review > $mydir/raw/opinosis_data/combined/$f2noprefix.gold
    echo " " >> $mydir/raw/opinosis_data/combined/$f2noprefix.gold
    sed 's/^/\n@highlight\n/' $summary >> $mydir/raw/opinosis_data/combined/$f2noprefix.gold
    #echo "@highlight" >> $mydir/raw/opinosis_data/combined/$f2noprefix.gold
    #echo " " >> $mydir/raw/opinosis_data/combined/$f2noprefix.gold
    #cat $summary >> $mydir/raw/opinosis_data/combined/$f2noprefix.gold
  done

done


cp ~/w266-final-project/data/make_opinosis_data.py ~/w266-final-project/data/raw/opinosis_data


python make_opinosis_data.py ~/w266-final-project/data/raw/opinosis_data/combined



cd $mydir
