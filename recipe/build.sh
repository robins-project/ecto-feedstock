#!/bin/sh
mkdir build && cd build

pip install empy
pip install catkin-pkg

cmake -G "Ninja"                            \
    -DCMAKE_INSTALL_PREFIX=${PREFIX}        \
    -DCMAKE_BUILD_TYPE=Release              \
    -DRT_LIBRARY=${PREFIX}/lib/libmkl_rt.so \
    -DSETUPTOOLS_DEB_LAYOUT:BOOL=OFF        \
    ..

ninja install
