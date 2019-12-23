#!/bin/bash -l
#SBATCH --job-name=fes-samp$NUM
#SBATCH --partition all
#SBATCH --nodes 1
#SBATCH --gpus=1
#SBATCH --cpus-per-gpu=4
#SBATCH --mem=32G

module load openmpi/3.1.4
module load cuda/10.0
module load cuDNN/v7.6forcuda10.0
module load plumed/2.5.1
module load gromacs/2018.3

gmx mdrun -deffnm prod/_sol.$NUM -dhdl prod/_sol.$NUM.dhdl.xvg