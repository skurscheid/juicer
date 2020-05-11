#!/bin/bash


# CPU 
#~/software/bin/juicer/scripts/juicer.sh -g hg38 -s Arima -p ~/data/References/Genomes/Homo_sapiens/GRCh38_ensembl84/canonical/genome.fa.fai -t 32 -y ~/software/bin/juicer/restriction_sites/hg38_Arima.txt

# PBS
~/software/bin/juicer/scripts/juicer.sh -g hg38 -p ~/data/References/Genomes/Homo_sapiens/GRCh38_ensembl84/canonical/genome.fa.fai -y ~/software/bin/juicer/restriction_sites/hg38_Arima.txt -D ~/software/bin/juicer -s Arima