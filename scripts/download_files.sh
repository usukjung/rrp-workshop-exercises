#!/bin/bash

# Set some useful settings to handle errors
set -euo pipefail

# Define URLs and file paths
FASTQ_R1="subset-SRR11518889_1.fastq.gz"
FASTQ_R2="subset-SRR11518889_2.fastq.gz"
FASTQ_URL="https://raw.githubusercontent.com/AlexsLemonade/reproducible-research/main/instructor_notes/fastq_subset"

# Define a save location
DATA_DIR="../data/raw/fastq/SRP255885"
mkdir -p ${DATA_DIR}

###### Download the R1 file ######
echo "Downloading the R1 file"

# Download
# -O: keep same file name as on internet
# -s: don't print status bar or errors
# -S: but actually I do want to print errors
curl -sSO ${FASTQ_URL}/${FASTQ_R1}

# Move the file
mv ${FASTQ_R1} ${DATA_DIR}

# Print the number of lines in the file
gunzip -c ${DATA_DIR}/${FASTQ_R1} | wc -l


###### Download the R2 file ######
echo "Downloading the R2 file"

# Download
curl -sSO ${FASTQ_URL}/${FASTQ_R2}

# Move the file
mv ${FASTQ_R2} ${DATA_DIR}

# Print the number of lines in the file
gunzip -c ${DATA_DIR}/${FASTQ_R2} | wc -l
