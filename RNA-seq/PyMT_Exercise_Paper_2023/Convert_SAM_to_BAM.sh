#! /bin/bash

# Get current user
username=$(whoami)

# Get aboslute path of current directory
current_dir=$(pwd)

#####################################################################
######################## USER DEFINED VALUES ########################
#####################################################################

# It should be the full path, don't use ~
alignments_dir="${current_dir}/alignments"

#####################################################################
#####################################################################
#####################################################################

# Change to main project directory
cd ${alignments_dir}

# Loop through the sam files in the alignments_dir
for sam_file in "${alignments_dir}"/*.sam; do
  # Extract the file name without the path and file extension
  file_name=$(basename ${sam_file} .sam)

  # Run samtools sort to convert from sam to bam
  cmd="samtools sort -@ 28 -o ${file_name}.bam ${file_name}.sam"

  # Run command
  printf "Running command: ${cmd}\n"
  $cmd
done

# Delete all .sam files to free up space as they are no longer needed.
# rm -f *.sam
