# Executing juicer pipeline on PBS-Pro based clusters
## Rationale
Adapting the existing PBS scripts from the juicer repository has proven to be rather complicated due to the nested and poorly documented nature of the code. There also remain many hard-coded values which are not easily tracked in the scripts and thus need to be fixed in a trial & error manner. Therefore I decided to use the existing 'CPU' scripts and run these as individual jobs, instead of relying on the scheduling/batch-submission of the 'PBS' scripts.
Even though, there are still a number of modifications necessary in order to make the 'CPU' scripts executable on gadi.

### Example directory structure
This directory structure is the result of a successful juicer run. The basic setup requires one (1) directory per sample/replicate, and a further 'fastq' subdirectory which will contain the FASTQ files (gz is permissible). It is also possible to just include these files via symlinks instead of hard copies.

```
MCF10AWT1/arima
|-- ARIMA001
|   |-- aligned
|   |   |-- all_chrom_loops
|   |   |-- all_chrom_loops_medium_resolution
|   |   |-- inter_30_contact_domains
|   |   |-- pre_tmp
|   |   `-- test_loops
|   |-- fastq
|   `-- splits
`-- ARIMA002
    |-- aligned
    |   |-- all_chrom_loops
    |   |-- all_chrom_loops_medium_resolution
    |   `-- inter_30_contact_domains
    |-- fastq
    `-- splits
```

### Files within the subdirectory
The basic idea for the CPU scripts is to place these within the sample directory and execute juicer from there. I have solved this by placing a link to the actual qsub script into the sample directory. Upon executing 'qsub qsub_juicer_arima.sh' a job is submitted to the scheduler that then runs the juicer.sh script to process the data within the directory.

```
MCF10AWT1/arima/ARIMA001
|-- fastq
|   |-- ARIMA001_R1.fastq.gz -> ../../../../raw/A00548_0100_DTremethick_JCSMR_HiC_Arima_1_4/HiC_1_10A_S1_R1_001.fastq.gz
|   `-- ARIMA001_R2.fastq.gz -> ../../../../raw/A00548_0100_DTremethick_JCSMR_HiC_Arima_1_4/HiC_1_10A_S1_R2_001.fastq.gz
|
`-- qsub_juicer_arima.sh -> /home/150/sxk150/mcf10a_hic/scripts/qsub_juicer_arima.sh
```