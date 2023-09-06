#!bin/bash

#This script runs kallisto which computes equivalence classes for reads and quantifies abundances.

#For clean RNA-Seq samples processed by Trimgalore.

#make sure you add your username and what the path to the data is
cd ~/clean_Chen_Foundation_FASTQ_ALL

# loop for all the samples - define how many samples you have
for j in {1..27};
do
	FILENAME=`sed -n ''$j'p' ~/novaseq_RNA_EOAD.NDC.txt` 
    	echo $FILENAME
	#Make a kallisto out directory for each sample
	mkdir ~/KallistoOut_RNA_Chen/${FILENAME}
	#Run kallisto v0.46
	#make sure to define the index, -i, whether you downloaded the premade one or made your own
	#make sure to use the correct strand info
	#t is the number of processers
    	~/kallisto/kallisto quant \
    	-i ~/homo_sapiens_104/Homo_sapiens.GRCh38.cdna.all.release-104_k31.idx \
    	-o ~/KallistoOut_RNA_Chen/${FILENAME} \
    	--bias \
    	--rf-stranded \
    	-b 100 \
    	-t 6 \
    	${FILENAME}_R1_001_val_1.fq.gz ${FILENAME}_R2_001_val_2.fq.gz \
    	&> ${FILENAME}.kallisto.log
done
