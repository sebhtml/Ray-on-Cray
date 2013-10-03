#!/bin/bash

module purge
module load PrgEnv-intel/4.1.40
module load cray-mpich2/5.6.3
module load git/1.8.2.1

project=/tmp/proj/lsc005

cd $project/software/src/RayPlatform
git pull origin master
cd $project/software/src/ray
git pull origin master

make MPICXX=CC CXXFLAGS="-xHOST -O3 -static" -j 4 HAVE_LIBZ=y clean
make MPICXX=CC CXXFLAGS="-xHOST -O3 -static" -j 4 HAVE_LIBZ=y 

commit=$( git log|head -n1|awk '{print $2}')

mkdir -p $project/software/lsc005/Ray/$commit-1
destination=$project/software/lsc005/Ray/$commit-1
cp Ray $destination

echo "Installed to $destination/Ray"
