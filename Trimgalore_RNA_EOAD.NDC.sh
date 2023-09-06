#!bin/bash

#This script runs trimgalore.
#For RNA-Seq Chen Foundation Samples

#Change to the directory containing all the RNA-Seq samples in FASTQ format (.fastq.gz)
cd ~/Chen_Foundation_FASTQ

#Load the fastqc module
module load fastqc

# loop for all the samples
for j in {1..27};
do
	FILENAME=`sed -n ''$j'p' ~/novaseq_RNA_EOAD.NDC.txt` 
	echo $FILENAME
	#Run trimgalore
	~/programs/TrimGalore-0.6.5/trim_galore \
	--quality 25 \
	--fastqc \
        --illumina \
	--length 98 \
        --paired \
	--cores 4 \
	-o ~/clean_Chen_Foundation_FASTQ_files \
	${FILENAME}_R1_001.fastq.gz ${FILENAME}_R2_001.fastq.gz
done
