#!/bin/bash

allel=$1

module load metal

echo "MARKER allele" > meta.script
echo "PVALUE h_p" >> meta.script
echo "EFFECT h_b" >> meta.script
echo "WEIGHT HLA_ntotal" >> meta.script
echo "SCHEME STDERR" >> meta.script
echo "STDERR h_StdErr" >> meta.script
echo "FREQLABEL HLA_freq" >> meta.script
echo "AVERAGEFREQ ON" >> meta.script
echo "MINMAXFREQ ON" >> meta.script
echo "PROCESS      result/HLA-${allel}_NIND_Euro_Pos13H.txt" >> meta.script
echo "PROCESS      result/HLA-${allel}_IPDGC_Euro_Pos13H.txt" >> meta.script
echo "PROCESS      result/HLA-${allel}_APDGC_Euro_Pos13H.txt" >> meta.script
echo "PROCESS      result/HLA-${allel}_Oslo_Euro_Pos13H.txt" >> meta.script
echo "PROCESS      result/HLA-${allel}_MCGILL_Euro_Pos13H.txt" >> meta.script
echo "PROCESS      result/HLA-${allel}_PPMI_Euro_Pos13H.txt" >> meta.script
echo "PROCESS      result/HLA-${allel}_NGRC_Euro_Pos13H.txt" >> meta.script
echo "PROCESS      ukbb/HLA-${allel}_ukbb_PD_Pos13H.txt" >> meta.script
echo "EFFECT h_b_adjusted" >> meta.script
echo "STDERR h_StdErr_adjusted" >> meta.script
echo "PROCESS      ukbb/HLA-${allel}_ukbb_Proxy_Pos13H.txt" >> meta.script
echo "OUTFILE	METAL-HLA-${allel}_Pos13H .tbl" >> meta.script
echo "ANALYZE HETEROGENEITY" >> meta.script
echo "QUIT" >> meta.script


metal meta.script

cut -f1,4- METAL-HLA-${allel}_Pos13H1.tbl | sed 's/MarkerName/Allele/' > METAL-HLA-${allel}_Pos13H.tbl

rm METAL-HLA-${allel}_Pos13H1.tbl
mv METAL-HLA-${allel}_Pos13H1.tbl.info METAL-HLA-${allel}_Pos13H.tbl.info
