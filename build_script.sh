#!/bin/bash

set -e
# Get the directory of this script, which must be the root for this repository.
TOPDIR="$(pwd)/external/junction_turf_bazel/"
TURFDIR=${TOPDIR}/turf
JUNCTIONDIR=${TOPDIR}/junction

# Default install dir
# INSTALLDIR=${TOPDIR}/install
INSTALLDIR=${TOPDIR}/install
CONFIGDIR=${TOPDIR}/config
echo ${INSTALLDIR}
echo ${JUNCTIONDIR}
echo ${TURFDIR}
ls
pwd

# If one is specified in arguments, override it.
for i in "$@"
do
case $i in
    --install_dir=*)
    INSTALLDIR="${i#*=}"
    shift # past argument=value
    ;;
    *)
    ;;
esac
done

mkdir ${CONFIGDIR}
cd ${CONFIGDIR}
cmake -DCMAKE_INSTALL_PREFIX=${INSTALLDIR} -DTURF_WITH_SAMPLES=OFF -DTURF_PREFER_CPP11=true -DTURF_HAS_STATIC_ASSERT=true ${JUNCTIONDIR}
cmake --build . --target install --config RelWithDebInfo -- -j 8
