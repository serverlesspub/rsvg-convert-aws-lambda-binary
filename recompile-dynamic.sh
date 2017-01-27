export PREFIX=/usr/local
export PKG_CONFIG_PATH=$PREFIX/lib/pkgconfig:/usr/lib64/pkgconfig:$PKG_CONFIG_PATH
export LD_LIBRARY_PATH=$PREFIX/lib:$LD_LIBRARY_PATH
export XDG_DATA_DIRS=$PREFIX/share:$XDG_DATA_DIRS

## make a more recent PCRE, required by GLIB

curl -OL ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.40.tar.bz2 && \
  tar xf pcre-8.40.tar.bz2 && \
  cd pcre-8.40 && \
  ./configure --prefix=$PREFIX --disable-dependency-tracking --enable-utf8 --enable-pcre8 --enable-pcre16 --enable-pcre32 --enable-unicode-properties && \
  make && sudo make install && sudo ldconfig && \
  cd ..

## make an up-to-date GLIB, required by GDK-PIXBUF

curl -OL https://download.gnome.org/sources/glib/2.50/glib-2.50.2.tar.xz && \
  tar xf glib-2.50.2.tar.xz && \
  cd glib-2.50.2 && \
  ./configure --prefix=$PREFIX --disable-maintainer-mode --disable-dependency-tracking --disable-silent-rules --disable-dtrace --disable-libelf --enable-static
  make && sudo make install && sudo ldconfig && \
  cd ..

curl -OL ftp://ftp.gnome.org/pub/gnome/sources/libcroco/0.6/libcroco-0.6.11.tar.xz && \
  tar xf libcroco-0.6.11.tar.xz && \
  cd libcroco-0.6.11 && \
  ./configure --prefix=$PREFIX --disable-dependency-tracking --disable-Bsymbolic && \
   make && sudo make install && sudo ldconfig && \
  cd ..

curl -OL https://downloads.sourceforge.net/libpng/libpng-1.6.21.tar.xz && \
  tar xf libpng-1.6.21.tar.xz && \
  cd libpng-1.6.21 && \
  ./configure --prefix=$PREFIX --disable-dependency-tracking --disable-silent-rules && \
  make && sudo make install && sudo ldconfig && \
  cd ..

sudo mkdir -p $PREFIX/lib/gdk-pixbuf-2.0/2.10.0

rm -rf gdk-pixbuf* && \
curl -OL https://download.gnome.org/sources/gdk-pixbuf/2.36/gdk-pixbuf-2.36.2.tar.xz && \
  tar xf gdk-pixbuf-2.36.2.tar.xz && \
  cd gdk-pixbuf-2.36.2 && \
  ./configure --prefix=$PREFIX --disable-dependency-tracking --disable-maintainer-mode --enable-debug=no --enable-introspection=yes --disable-Bsymbolic --enable-static --without-gdiplus --with-included-loaders=yes && \ 
  make && sudo make install && sudo ldconfig && \
  sudo $PREFIX/bin/gdk-pixbuf-query-loaders --update-cache && \
  cd ..

curl -OL https://www.freedesktop.org/software/fontconfig/release/fontconfig-2.12.1.tar.bz2 && \
  tar xf fontconfig-2.12.1.tar.bz2 && \
  cd fontconfig-2.12.1 && \
  ./configure --prefix=$PREFIX --disable-docs --enable-libxml2 --localstatedir=/var --sysconfdir=/etc && \
  make && sudo make install && sudo ldconfig && \
  cd ..

curl -OL https://downloads.sf.net/project/freetype/freetype2/2.7.1/freetype-2.7.1.tar.bz2 && \
  tar xf freetype-2.7.1.tar.bz2 && \
  cd freetype-2.7.1 && \
  ./configure --prefix=$PREFIX --without-harfbuzz && \
  make && sudo make install && sudo ldconfig && \
  cd ..

curl -OL https://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.4.2.tar.bz2 && \
  tar xf harfbuzz-1.4.2.tar.bz2 && \
  cd harfbuzz-1.4.2 && \
  ./configure  --prefix=$PREFIX --disable-dependency-tracking --enable-static --with-cairo=yes --with-freetype=yes && \
  make && sudo make install && sudo ldconfig && \
  cd ..

rm -rf pango-1.40.3*
curl -OL https://download.gnome.org/sources/pango/1.40/pango-1.40.3.tar.xz && \
  tar xf pango-1.40.3.tar.xz && \
  cd pango-1.40.3 && \
  ./configure --prefix=$PREFIX --disable-dependency-tracking --disable-silent-rules --enable-introspection=yes && \
   make && sudo make install && sudo ldconfig && \
  cd ..

curl -OL ftp://ftp.gnome.org/pub/GNOME/sources/librsvg/2.40/librsvg-2.40.16.tar.xz && \
  tar xf librsvg-2.40.16.tar.xz && \
  cd librsvg-2.40.16 && \
  ./configure --prefix=$PREFIX --disable-dependency-tracking --disable-Bsymbolic --enable-tools=yes --enable-pixbuf-loader=no --enable-introspection=yes --enable-static && \ 
  make && sudo make install && sudo ldconfig && \
  cd ..
 #&& make && sudo make install && sudo ldconfig && cd ..
