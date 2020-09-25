mkdir build
cd build
SET PYGMO_BUILD_DIR=%cd%

git clone https://github.com/pybind/pybind11.git
cd pybind11
git checkout 4f72ef846fe8453596230ac285eeaa0ce3278bb4
mkdir build
cd build
cmake ^
    -G "Ninja" ^
    -DPYBIND11_TEST=NO ^
    -DCMAKE_INSTALL_PREFIX=%PYGMO_BUILD_DIR% ^
    -DCMAKE_PREFIX_PATH=%PYGMO_BUILD_DIR% ^
    -DCMAKE_BUILD_TYPE=Release ^
    ..
cmake --build . --target install
cd ../..

cmake ^
    -G "Visual Studio 15 2017 Win64" ^
    -DBoost_NO_BOOST_CMAKE=ON ^
    -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -Dpybind11_DIR=%PYGMO_BUILD_DIR%\share\cmake\pybind11\ ^
    -DPYGMO_ENABLE_IPO=yes ^
    ..

cmake --build . --config RelWithDebInfo --target install
