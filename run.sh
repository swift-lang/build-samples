#!/bin/zsh
set -eu

print "HOST: $( hostname )"

TOP=$( /bin/pwd )
print "PWD: $TOP"

print "USER: $USER"
print "WHOAMI: $( whoami )"

set -x

mkdir -pv downloads sfw
ANACONDA_SH=Anaconda3-2020.11-Linux-x86_64.sh
cd downloads
if [[ ! -f $ANACONDA_SH ]] {
  wget --no-verbose https://repo.anaconda.com/archive/$ANACONDA_SH
}

cd ..
cd sfw

if [[ ! -d anaconda3 ]] {
  bash ../downloads/$ANACONDA_SH -bs -p $TOP/sfw/anaconda3
}

PATH=$TOP/sfw/anaconda3/bin:$PATH

conda install r

if [[ ! -d spack ]] {
  git clone https://github.com/spack/spack.git
}

exit

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
