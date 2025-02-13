#! /bin/bash

#####################################################################
######################## USER DEFINED VALUES ########################
#####################################################################

# It should be the full path, don't use ~
fastq_dir="/home/user/bioinformatics/PyMT_Exercise_Paper_2023"

#####################################################################
#####################################################################
#####################################################################

# Get current date and time
current_date=$(date +%Y-%m-%d_%H-%M-%S)

# Get current user
username=$(whoami)

# Change directory
cd ${fastq_dir}

# Activate conda env
# Doing it this way instead of "conda activate bioinformatics" prevents conda init error
source /home/${username}/anaconda3/bin/activate bioinformatics

# Run fastqc on all FASTQ files in the directory
fastqc -t 24 *.fastq.gz

# Run multiqc in same directory as the fastqc reports
multiqc .

# Rename the multiqc report
rename multiqc_report pre-alignment_multiqc_report_${current_date} ${fastq_dir}/multiqc_report.html

# Make new directory for the fastqc outputs and move
mkdir fastqc -p && mv *_fastqc* fastqc
