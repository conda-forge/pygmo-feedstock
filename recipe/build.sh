#!/usr/bin/env bash

mkdir build
cd build

if [[ "$(uname)" == "Darwin" ]]; then
    export CPP_STANDARD=14
else
    export CPP_STANDARD=17
fi

cmake \
    -DBoost_NO_BOOST_CMAKE=ON \
    -DCMAKE_CXX_STANDARD=$CPP_STANDARD \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DCMAKE_PREFIX_PATH=$PREFIX \
    ..

make

make install
