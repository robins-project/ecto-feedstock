#!/bin/sh
mkdir build && cd build

pip install empy
pip install catkin-pkg

cmake -G "Ninja"                            \
    -DCMAKE_INSTALL_PREFIX=${PREFIX}        \
    -DCMAKE_PREFIX_PATH=${PREFIX}           \
    -DCMAKE_BUILD_TYPE=Release              \
    -DSETUPTOOLS_DEB_LAYOUT:BOOL=OFF        \
    -DPYTHON_EXECUTABLE=`which python`      \
    -DEMPY_EXECUTABLE=`python -c 'import em; print(em.__file__)'`       \
    -DCMAKE_LIBRARY_ARCHITECTURE=x86_64-linux-gnu \
    ..

ninja install
