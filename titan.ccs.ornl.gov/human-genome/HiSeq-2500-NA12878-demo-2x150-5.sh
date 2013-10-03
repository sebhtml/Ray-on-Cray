#PBS -N HiSeq-2500-NA12878-demo-2x150-5
#PBS -l walltime=12:00:00 
#PBS -l nodes=313
#PBS -A LSC005
#PBS -l gres=widow1

cd $PBS_O_WORKDIR

# 313 * 8 * 2 = 5008
#-debug \

aprun -n 5008 -N 16 \
./software/lsc005/Ray/616d2a26cc1e39f59325a0e632af46262edaa12c-1/Ray
-k 31 \
-detect-sequence-files HiSeq-2500-NA12878-demo-2x150 \
-o HiSeq-2500-NA12878-demo-2x150-5 \

