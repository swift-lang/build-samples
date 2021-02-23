#!/bin/zsh

print "BUILD SAMPLES RUN.SH"

DATE_FMT_NICE="%D{%Y-%m-%d} %D{%H:%M}"
date-nice()
{
  print ${(%)DATE_FMT_NICE}
}

print "START: $( date-nice )"

print "PWD: $( /bin/pwd )"

exit 

wget https://repo.anaconda.com/archive/Anaconda3-2020.11-Linux-x86_64.sh

conda install r

git clone https://github.com/spack/spack.git

# Substitute into etc/spack/packages.yaml

# Check using correct Python
# e.g. spack spec python => "python@3.6.2%gcc@7.1.0+..."
spack spec python
spack find --paths python # => /home/woz/Public/sfw/bebop/anaconda3

spack install ant autoconf automake jdk libtool m4 pcre swig zsh 
# Check that using system installations
spack find --paths zsh 

# Check that Spack is using correct installations
python mpi tcl r

spack install exmcutils
spack install adlbx
# Check using correct MPI e.g. spack spec => "^mpich@3.2"

spack install turbine

# Check using correct MPI, Python, R

spack install stc

# Check using correct JDK, Turbine
