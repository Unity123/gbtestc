if [ ! -d work ]; then
  mkdir work && cd work
else
  cd work
fi
if [ ! -d Zeta ]; then
  git clone https://github.com/redcode/Zeta.git
  cd Zeta
  mkdir build && cd build
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=$HOME/.local \
    -DZeta_WITH_CMAKE_SUPPORT=YES \
    -DZeta_WITH_PKGCONFIG_SUPPORT=YES \
    ..
else
  echo "zeta already built"
  cd Zeta/build/
fi
cmake --install . --config Release
cd ../../
if [ ! -d Z80 ]; then
  git clone https://github.com/redcode/Z80.git
  cd Z80
  mkdir build && cd build
  cmake \
    -DBUILD_SHARED_LIBS=YES \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=$HOME/.local \
    -DZ80_WITH_CMAKE_SUPPORT=YES \
    -DZ80_WITH_PKGCONFIG_SUPPORT=YES \
    -DZ80_WITH_EXECUTE=YES \
    -DZ80_WITH_FULL_IM0=YES \
    -DZ80_WITH_IM0_RETX_NOTIFICATIONS=YES \
    -DZ80_WITH_Q=YES \
    -DZ80_WITH_ZILOG_NMOS_LD_A_IR_BUG=YES \
    ..
  cmake --build . --config Release
else
  echo "Z80 already built"
  cd Z80/build/
fi
cmake --install . --config Release --strip
cd ../../
if [ ! -d xorgproto-2023.2 ]; then
  wget https://www.x.org/releases/individual/proto/xorgproto-2023.2.tar.gz
  tar xf xorgproto-2023.2.tar.gz
  rm xorgproto-2023.2.tar.gz
  cd xorgproto-2023.2
  ./configure --prefix=$HOME/.local --quiet
else
  echo "xorgproto already built"
  cd xorgproto-2023.2
fi
make install --silent
p=$HOME/.local/share/pkgconfig
export PKG_CONFIG_PATH=$p
cd ../
if [ ! -d xcb-proto-1.16.0 ]; then
  wget https://x.org/releases/individual/proto/xcb-proto-1.16.0.tar.gz
  tar xf xcb-proto-1.16.0.tar.gz
  rm xcb-proto-1.16.0.tar.gz
  cd xcb-proto-1.16.0
  ./configure --prefix=$HOME/.local --quiet
  make --silent
else
  echo "xcb-proto already built"
  cd xcb-proto-1.16.0
fi
make install --silent
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$HOME/.local/lib/pkgconfig
ls $HOME/.local/lib/pkgconfig
cd ../
if [ ! -d libXau-1.0.11 ]; then
  wget https://www.x.org/releases/individual/lib/libXau-1.0.11.tar.gz
  tar xf libXau-1.0.11.tar.gz
  rm libXau-1.0.11.tar.gz
  cd libXau-1.0.11
  ./configure --prefix=$HOME/.local --quiet
  make
else
  echo "libxau already built"
  cd libXau-1.0.11
fi
make install
cd ../
if [ ! -d libxcb-1.16 ]; then
  wget https://x.org/releases/individual/xcb/libxcb-1.16.tar.gz
  tar xf libxcb-1.16.tar.gz
  rm libxcb-1.16.tar.gz
  cd libxcb-1.16
  ./configure --prefix=$HOME/.local --quiet
  make
else
  echo "libxcb already built"
  cd libxcb-1.16
fi
make install
cd ../
if [ ! -d xtrans-1.5.0 ]; then
  wget https://x.org/releases/individual/lib/xtrans-1.5.0.tar.gz
  tar xf xtrans-1.5.0.tar.gz
  rm xtrans-1.5.0.tar.gz
  cd xtrans-1.5.0
  ./configure --prefix=$HOME/.local --quiet
  make
else
  echo "xtrans already built"
  cd xtrans-1.5.0
fi
make install
cd ../
if [ ! -d libX11-1.8.7 ]; then
  wget https://www.x.org/releases/individual/lib/libX11-1.8.7.tar.gz
  tar xf libX11-1.8.7.tar.gz
  rm libX11-1.8.7.tar.gz
  cd libX11-1.8.7
  ./configure --prefix=$HOME/.local --quiet
  make
else
  echo "libx11 already built"
  cd libX11-1.8.7
fi
make install
cd ../
if [ ! -d libXfixes-6.0.1 ]; then
  wget https://x.org/releases/individual/lib/libXfixes-6.0.1.tar.gz
  tar xf libXfixes-6.0.1.tar.gz
  rm libXfixes-6.0.1.tar.gz
  cd libXfixes-6.0.1
  ./configure --prefix=$HOME/.local --quiet
  make
else
  echo "libXfixes already built"
  cd libXfixes-6.0.1
fi
make install
cd ../
if [ ! -d libXrender-0.9.11 ]; then
  wget https://x.org/releases/individual/lib/libXrender-0.9.11.tar.gz
  tar xf libXrender-0.9.11.tar.gz
  rm libXrender-0.9.11.tar.gz
  cd libXrender-0.9.11
  ./configure --prefix=$HOME/.local --quiet
  make
else
  echo "libxrender already built"
  cd libXrender-0.9.11
fi
make install
cd ../
if [ ! -d libXcursor-1.2.2 ]; then
  wget https://www.x.org/releases/individual/lib/libXcursor-1.2.2.tar.gz
  tar xf libXcursor-1.2.2.tar.gz
  rm libXcursor-1.2.2.tar.gz
  cd libXcursor-1.2.2
  ./configure --prefix=$HOME/.local --quiet
  make
else
  echo "libxcursor already built"
  cd libXcursor-1.2.2
fi
make install
cd ../
if [ ! -d libXext-1.3.6 ]; then
  wget https://www.x.org/releases/individual/lib/libXext-1.3.6.tar.gz
  tar xf libXext-1.3.6.tar.gz
  rm libXext-1.3.6.tar.gz
  cd libXext-1.3.6
  ./configure --prefix=$HOME/.local --quiet
  make
else
  echo "libxext already built"
  cd libXext-1.3.6
fi
make install
cd ../
if [ ! -d libXrandr-1.5.4 ]; then
  wget https://www.x.org/releases/individual/lib/libXrandr-1.5.4.tar.gz
  tar xf libXrandr-1.5.4.tar.gz
  rm libXrandr-1.5.4.tar.gz
  cd libXrandr-1.5.4
  ./configure --prefix=$HOME/.local --quiet
  make
else
  echo "libxrandr already built"
  cd libXrandr-1.5.4
fi
make install
cd ../
if [ ! -d SDL ]; then
  git clone https://github.com/libsdl-org/SDL
  cd SDL
  git checkout release-2.30.0
  mkdir build && cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=$HOME/.local \
    ..
  cmake --build .
else
  echo "SDL already built"
  cd SDL/build/
fi
cmake --install . --strip
#cd ../../
#if [ ! -d freetype ]; then
#  git clone https://gitlab.freedesktop.org/freetype/freetype
#  cd freetype
#  mkdir build && cd build
#  cmake \
#    -DCMAKE_INSTALL_PREFIX=$HOME/.local \
#    ..
#  cmake --build .
#else 
#  echo "freetype already built"
#  cd freetype/build/
#fi
#cmake --install . --strip
#cd ../../
#if [ ! -d SDL_ttf ]; then
#  git clone https://github.com/libsdl-org/SDL_ttf
#  cd SDL_ttf
#  git checkout release-2.22.0
#  mkdir build && cd build
#  cmake \
#    -DCMAKE_INSTALL_PREFIX=$HOME/.local \
#    ..
#  cmake --build .
#else
#  echo "SDL_ttf already built"
#  cd SDL_ttf/build/
#fi
#cmake --install . --strip
cd ../../../
cd include
if [ ! -d font8x8 ]; then
  git clone https://github.com/dhepper/font8x8
else
  echo "font8x8 already installed"
fi