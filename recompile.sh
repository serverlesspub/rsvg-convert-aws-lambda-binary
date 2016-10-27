
BUILD_DIR=`pwd`/build
export XDG_DATA_DIRS=$BUILD_DIR/share/
export PKG_CONFIG_PATH=$BUILD_DIR/lib/pkgconfig:/usr/lib64/pkgconfig:/usr/lib/pkgconfig
export PATH=$BUILD_DIR/bin:/usr/bin:$PATH
export LDFLAGS=-L$BUILD_DIR/lib:/usr/lib64:/usr/lib
export LD_LIBRARY_PATH=$BUILD_DIR/lib:/usr/lib64:/usr/lib
export CPPFLAGS=-I$BUILD_DIR/include:/usr/include

rebuild () 
{
echo "installing $2"
rm -rf $2*
curl -OL $1 && tar xf $2* 
if [ $? -ne 0 ]; then
  echo "downloading $1 failed, bailing"
  exit 1
fi
cd $2*
./configure --prefix=$BUILD_DIR --disable-shared --enable-static=yes $3 $4 && make && make install
if [ $? -ne 0 ]; then
  echo "installing $2 failed, bailing"
  exit 1
fi
cd ..
}

cd ~
rm -rf $BUILD_DIR
mkdir -p $BUILD_DIR

rebuild http://ftp.gnome.org/pub/GNOME/sources/libcroco/0.6/libcroco-0.6.8.tar.xz libcroco
rebuild https://www.freedesktop.org/software/harfbuzz/release/harfbuzz-0.9.20.tar.bz2 harfbuzz
rebuild http://www.freedesktop.org/software/fontconfig/release/fontconfig-2.10.91.tar.gz fontconfig --enable-libxml2 --disable-docs
rebuild https://www.cairographics.org/releases/pixman-0.34.0.tar.gz pixman
rebuild http://cairographics.org/releases/cairo-1.14.6.tar.xz cairo
rebuild http://ftp.gnome.org/pub/GNOME/sources/pango/1.34/pango-1.34.1.tar.xz pango
rebuild http://ftp.gnome.org/pub/GNOME/sources/gdk-pixbuf/2.28/gdk-pixbuf-2.28.2.tar.xz gdk-pixbuf --disable-modules
rebuild http://ftp.gnome.org/pub/GNOME/sources/librsvg/2.40/librsvg-2.40.6.tar.xz librsvg --disable-introspection

