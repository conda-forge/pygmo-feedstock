#!/usr/bin/env bash

mkdir build
cd build

if [[ "$(uname)" == "Darwin" ]]; then
    export AR_CMAKE_SETTING=
    export RANLIB_CMAKE_SETTING=
else
    # Workaround for making the LTO machinery work on Linux.
    export AR_CMAKE_SETTING="-DCMAKE_CXX_COMPILER_AR=$GCC_AR -DCMAKE_C_COMPILER_AR=$GCC_AR"
    export RANLIB_CMAKE_SETTING="-DCMAKE_CXX_COMPILER_RANLIB=$GCC_RANLIB -DCMAKE_C_COMPILER_RANLIB=$GCC_RANLIB"
fi

export PYGMO_BUILD_DIR=`pwd`

git clone https://github.com/pybind/pybind11.git
cd pybind11
git checkout 4f72ef846fe8453596230ac285eeaa0ce3278bb4
mkdir build
cd build
pwd
cmake \
    -DPYBIND11_TEST=NO \
    -DCMAKE_INSTALL_PREFIX=$PYGMO_BUILD_DIR \
    -DCMAKE_PREFIX_PATH=$PYGMO_BUILD_DIR \
    ..
make install
cd ../..

cmake \
    -DBoost_NO_BOOST_CMAKE=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DCMAKE_PREFIX_PATH=$PREFIX \
    -Dpybind11_DIR=$PYGMO_BUILD_DIR/share/cmake/pybind11/ \
    -DPYGMO_ENABLE_IPO=yes \
    $AR_CMAKE_SETTING \
    $RANLIB_CMAKE_SETTING \
    ..

make

make install
