mkdir build
cd build

cmake ^
    -G "NMake Makefiles" ^
    -DBoost_NO_BOOST_CMAKE=ON ^
    -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DPAGMO_BUILD_PAGMO=no ^
    -DPAGMO_BUILD_PYGMO=yes ^
    ..

cmake --build . --config Release

cmake --build . --config Release --target install
