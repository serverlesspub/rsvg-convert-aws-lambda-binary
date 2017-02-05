export PREFIX=/home/ec2-user/build
export PKG_CONFIG_PATH=$PREFIX/lib/pkgconfig:/usr/lib64/pkgconfig:$PKG_CONFIG_PATH
#export LD_LIBRARY_PATH=$PREFIX/lib:$LD_LIBRARY_PATH
export XDG_DATA_DIRS=$PREFIX/share:$XDG_DATA_DIRS
export LINKER_OPTS="--enable-static=yes" # --"enable-shared=no"
export CCFLAGS="-pthread"

sudo rm -rf $PREFIX

rm -rf fontconfig-2.12.1* gdk-pixbuf-2.36.2* glib-2.50.2* libpng-1.6.21* libcroco-0.6.11* librsvg-2.40.16* shared-mime-info-1.7* pango-1.32.6* pcre-8.40* gobject-introspection-1.50.0*

mkdir -p $PREFIX

## make a more recent PCRE, required by GLIB

curl -OL ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.40.tar.bz2 &&\
tar xf pcre-8.40.tar.bz2 && \
cd pcre-8.40 && \
./configure --prefix=$PREFIX --disable-dependency-tracking --enable-utf8 --enable-pcre8 --enable-pcre16 --enable-pcre32 --enable-unicode-properties $LINKER_OPTS &&\
make clean && make && make install &&\
cd ..

## make an up-to-date GLIB, required by GDK-PIXBUF

curl -OL https://download.gnome.org/sources/glib/2.50/glib-2.50.2.tar.xz &&\
tar xf glib-2.50.2.tar.xz &&\
cd glib-2.50.2 &&\
./configure --prefix=$PREFIX $LINKER_OPTS &&\
make clean && make && make install &&\
cd ..

curl -OL https://freedesktop.org/~hadess/shared-mime-info-1.7.tar.xz &&\
tar xf shared-mime-info-1.7.tar.xz &&\
cd  shared-mime-info-1.7 &&\
./configure --prefix=$PREFIX --disable-dependency-tracking --disable-update-mimedb  &&\
make clean && make && make install &&\
$PREFIX/bin/update-mime-database $PREFIX/share/mime &&\
cd ..


curl -OL https://download.gnome.org/sources/gobject-introspection/1.50/gobject-introspection-1.50.0.tar.xz &&\
tar xf gobject-introspection-1.50.0.tar.xz &&\
cd  gobject-introspection-1.50.0 &&\
./configure --prefix=$PREFIX $LINKER_OPTS --disable-doctool &&\
make clean && make && make install &&\
cd ..

curl -OL ftp://ftp.gnome.org/pub/gnome/sources/libcroco/0.6/libcroco-0.6.11.tar.xz &&\
tar xf libcroco-0.6.11.tar.xz &&\
cd libcroco-0.6.11 &&\
./configure --prefix=$PREFIX --disable-dependency-tracking --disable-Bsymbolic  --enable-introspection=no  $LINKER_OPTS &&\
make && make install &&\
cd ..

curl -OL https://downloads.sourceforge.net/libpng/libpng-1.6.21.tar.xz &&\
tar xf libpng-1.6.21.tar.xz &&\
cd libpng-1.6.21 &&\
./configure --prefix=$PREFIX --disable-dependency-tracking --disable-silent-rules $LINKER_OPTS &&\
make && make install &&\
cd ..

mkdir -p $PREFIX/lib/gdk-pixbuf-2.0/2.10.0
curl -OL https://download.gnome.org/sources/gdk-pixbuf/2.36/gdk-pixbuf-2.36.2.tar.xz &&\
tar xf gdk-pixbuf-2.36.2.tar.xz &&\
cd gdk-pixbuf-2.36.2 &&\
./configure --prefix=$PREFIX --with-included-loaders=yes $LINKER_OPTS &&\
make && make install &&\
$PREFIX/bin/gdk-pixbuf-query-loaders --update-cache &&\
cd ..


curl -OL https://www.freedesktop.org/software/fontconfig/release/fontconfig-2.12.1.tar.bz2 &&\
tar xf fontconfig-2.12.1.tar.bz2 &&\
cd fontconfig-2.12.1 &&\
./configure --prefix=$PREFIX --disable-docs --enable-libxml2 $LINKER_OPTS &&\
make clean && make && make install &&\
cd ..

curl -OL https://download.gnome.org/sources/pango/1.32/pango-1.32.6.tar.xz &&\
tar xf pango-1.32.6.tar.xz &&\
cd pango-1.32.6 && \
./configure --prefix=$PREFIX --disable-dependency-tracking --disable-silent-rules --enable-introspection=no $LINKER_OPTS &&\
make clean && make && make install &&\
cd ..

curl -OL ftp://ftp.gnome.org/pub/GNOME/sources/librsvg/2.40/librsvg-2.40.16.tar.xz &&\
tar xf librsvg-2.40.16.tar.xz &&\
cd librsvg-2.40.16 &&\
./configure --prefix=$PREFIX --disable-shared --enable-pixbuf-loader=no $LINKER_OPTS &&\
make clean && make && make install &&\
cd ..
#&& make && make install && ldconfig && cd ..


sudo touch /etc/ld.so.conf.d/local-build
sudo chmod a+w /etc/ld.so.conf.d/local-build
echo $PREFIX/lib > /etc/ld.so.conf.d/local-build
sudo ldconfig
