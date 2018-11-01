#!/bin/sh

mydir=$(pwd)


mkdir pointer-generator

cd pointer-generator

# Download and unpack pointer-generator model for python 3:
rm -r master.zip

wget  https://github.com/becxer/pointer-generator/archive/master.zip

unzip master.zip

rm -r master.zip

# Download and unpack cnn-dailymail-master
rm -r master.zip

wget https://github.com/becxer/cnn-dailymail/archive/master.zip

unzip master.zip

rm -r master.zip

# Download and unpack daily-mail and cnn stories:
mkdir stories

filename="stories/dailymail_stories.tgz"
file_id="0BwmD_VLjROrfM1BxdkxVaTY2bWs"
query=`curl -c ./cookie.txt -s -L "https://drive.google.com/uc?export=download&id=${file_id}" \
| perl -nE'say/uc-download-link.*? href="(.*?)\">/' \
| sed -e 's/amp;//g' | sed -n 2p`
url="https://drive.google.com$query"
curl -b ./cookie.txt -L -o ${filename} $url


filename="stories/cnn_stories.tgz"
file_id="0BwmD_VLjROrfTHk4NFg2SndKcjQ"
query=`curl -c ./cookie.txt -s -L "https://drive.google.com/uc?export=download&id=${file_id}" \
| perl -nE'say/uc-download-link.*? href="(.*?)\">/' \
| sed -e 's/amp;//g' | sed -n 2p`
url="https://drive.google.com$query"
curl -b ./cookie.txt -L -o ${filename} $url

cd stories

tar xvzf dailymail_stories.tgz

tar xvzf cnn_stories.tgz

cd ..

# Download and unpack Stanford CoreNLP Tokenizer:
wget http://nlp.stanford.edu/software/stanford-corenlp-full-2018-10-05.zip

unzip stanford-corenlp-full-2018-10-05.zip

rm -r stanford-corenlp-full-2018-10-05.zip


# Tokenize all stories:

cd cnn-dailymail-master

python make_datafiles.py ~/w266-final-project/models/pointer-generator/stories/cnn/stories ~/w266-final-project/models/pointer-generator/stories/dailymail/stories

cd ..

# Create log files:

mkdir pointer-generator-log


cd $mydir




# Manual steps (execute before script):
# 1) Install Java:
#    apt install default-jre
# 2) Add the following line to the end of the .profile file in the home directory (~):
#    export CLASSPATH=~/w266-final-project/models/pointer-generator/stanford-corenlp-full-2018-10-05/stanford-corenlp-3.9.2.jar
# 3) Install pyrouge:
#    pip install pyrouge


