0) Increase memory (and CPU/GPU speed) on Google Cloud Instance. 3.75 GB memory is not enough for training/eval. OS will kill tensorflow due to memory overflow.

1) Make sure the repository (w266-final-project) is checked out into the home directory (~/).

2) Install pyrouge: 
pip install pyrouge

3) Install java: 
apt install default-jre

4) Add the following line to the end of the .profile file (~/.profile): 
export CLASSPATH=~/w266-final-project/models/pointer-generator/stanford-corenlp-full-2018-10-05/stanford-corenlp-3.9.2.jar

5) Run setup_pointer_gen.sh:
./setup_pointer_gen.sh

6) For training, navigate into "~/w266-final-project/models/pointer-generator/pointer-generator-master" and execute the following, after replacing 'morris_burkhardt' with your own user name:
python run_summarization.py --mode=train --data_path=/home/morris_burkhardt/w266-final-project/models/pointer-generator/cnn-dailymail-master/finished_files/chunked/train_* --vocab_path=/home/morris_burkhardt/w266-final-project/models/pointer-generator/cnn-dailymail-master/finished_files/vocab --log_root=/home/morris_burkhardt/w266-final-project/models/pointer-generator/log --exp_name=myexperiment

7) For evaluation, navigate into "~/w266-final-project/models/pointer-generator/pointer-generator-master" and execute the following, after replacing 'morris_burkhardt' with your own user name:
python run_summarization.py --mode=eval --data_path=/home/morris_burkhardt/w266-final-project/models/pointer-generator/cnn-dailymail-master/finished_files/chunked/val_* --vocab_path=/home/morris_burkhardt/w266-final-project/models/pointer-generator/cnn-dailymail-master/finished_files/vocab --log_root=/home/morris_burkhardt/w266-final-project/models/pointer-generator/log --exp_name=myexperiment
