mkdir build
cd build

cmake ^
    -G "Visual Studio 16 2019" -A x64 ^
    -DPython3_EXECUTABLE=%PREFIX%\python.exe ^
    -DBoost_NO_BOOST_CMAKE=ON ^
    -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DPYGMO_ENABLE_IPO=yes ^
    ..

cmake --build . --config RelWithDebInfo --target install
