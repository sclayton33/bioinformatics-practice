#!/bin/bash
#
# The script extracts all of the alignment percentages from the
# aligngments_DATE.log file generated by the script "HISAT2_alignment.sh"

# Get current date and time
current_date=$(date +%Y-%m-%d_%H-%M-%S)

# Check if the input file is provided
if [ $# -ne 1 ]; then
  echo "Usage: $0 input_file"
  exit 1
fi

input_file=$1

# Check if the input file exists
if [ ! -f "$input_file" ]; then
  echo "Error: File '$input_file' not found."
  exit 1
fi

# Get the absolute file path of the input file
# This way the output file can be placed in the same directory
file_directory=$(dirname "$(readlink -f "$input_file")")

# Read the input file and print the first 5 characters of every 15th line
# It extracts 5 charactesr since the decimal point counts as one
awk 'NR % 15 == 0 {print substr($0, 1, 5)}' "$input_file" >> "$file_directory/per_sample_alignment_percentage_$current_date.txt"

# for line in output; do
