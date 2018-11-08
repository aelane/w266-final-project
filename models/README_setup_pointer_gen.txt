0) Increase memory (and CPU/GPU speed) on Google Cloud Instance: 8 CPU with 23 GB RAM seems to be good for training/eval. If system does not have enough memory, OS will kill tensorflow due to memory overflow.

1) Make sure the repository (w266-final-project) is checked out into the home directory (~/).

2) Install pyrouge: 
   a) Perl should already be installed (check by using apt list --installed)
   b) Clone Rouge perl script into home directory (~): 
      -> git clone https://github.com/andersjo/pyrouge
   c) Install pyrouge:
      -> Make sure you  are in the home directory (~), then execute the following commands:
      -> mkdir pyrouge-setup
      -> git clone https://github.com/bheinzerling/pyrouge pyrouge-setup
      -> cd pyrouge-setup
      -> python setup.py install
   d) Install XML parser: 
      -> sudo apt-get install libxml-parser-perl
   e) Set home directory for rouge: 
      -> pyrouge_set_rouge_path ~/pyrouge/tools/ROUGE-1.5.5
   f) Test if pyrouge works: 
      -> python -m pyrouge.test

3) Install java: 
sudo apt install default-jre

4) Add the following line to the end of the .profile file (~/.profile) and run 'source .profile' after or restart system:
export CLASSPATH=~/w266-final-project/models/pointer-generator/stanford-corenlp-full-2018-10-05/stanford-corenlp-3.9.2.jar

5) Run setup_pointer_gen.sh:
./setup_pointer_gen.sh

6) For training, navigate into "~/w266-final-project/models/pointer-generator/pointer-generator-master" and execute the following, after replacing 'morris_burkhardt' with your own user name:
python run_summarization.py --mode=train --data_path=/home/morris_burkhardt/w266-final-project/models/pointer-generator/cnn-dailymail-master/finished_files/chunked/train_* --vocab_path=/home/morris_burkhardt/w266-final-project/models/pointer-generator/cnn-dailymail-master/finished_files/vocab --log_root=/home/morris_burkhardt/w266-final-project/models/pointer-generator/log --exp_name=myexperiment

7) For evaluation, navigate into "~/w266-final-project/models/pointer-generator/pointer-generator-master" and execute the following, after replacing 'morris_burkhardt' with your own user name:
python run_summarization.py --mode=eval --data_path=/home/morris_burkhardt/w266-final-project/models/pointer-generator/cnn-dailymail-master/finished_files/chunked/val_* --vocab_path=/home/morris_burkhardt/w266-final-project/models/pointer-generator/cnn-dailymail-master/finished_files/vocab --log_root=/home/morris_burkhardt/w266-final-project/models/pointer-generator/log --exp_name=myexperiment

8) For beam search decoding, navigate into "~/w266-final-project/models/pointer-generator/pointer-generator-master" and execute the following, after replacing 'morris_burkhardt' with your own user name:
python run_summarization.py --mode=decode --data_path=/home/morris_burkhardt/w266-final-project/models/pointer-generator/cnn-dailymail-master/finished_files/chunked/val_* --vocab_path=/home/morris_burkhardt/w266-final-project/models/pointer-generator/cnn-dailymail-master/finished_files/vocab --log_root=/home/morris_burkhardt/w266-final-project/models/pointer-generator/log --exp_name=myexperiment


