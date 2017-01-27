

export XDG_DATA_DIRS=/home/ec2-user/build/share/
export PKG_CONFIG_PATH=/home/ec2-user/build/lib/pkgconfig:/usr/lib64/pkgconfig:/usr/lib/pkgconfig
export PATH=/home/ec2-user/build/bin:$PATH
rm -rf build *.pdf

mkdir build

curl -OL ftp://ftp.gnome.org/pub/gnome/sources/libcroco/0.6/libcroco-0.6.11.tar.xz
tar xf libcroco-0.6.8.tar.xz 
cd libcroco-0.6.8
./configure --prefix=/home/ec2-user/build --disable-shared --enable-static
make install 
cd ..

curl -OL http://www.freedesktop.org/software/fontconfig/release/fontconfig-2.12.1.tar.bz2
tar xf fontconfig-2.12.1.tar.bz2 
cd fontconfig-2.12.1
./configure --prefix=$PREFIX --disable-shared --enable-static --disable-docs --enable-libxml2 --localstatedir=/var --sysconfdir=/etc
make install
cd ..

curl -OL ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.40.tar.bz2 && \
tar xf pcre-8.40.tar.bz2 && \
cd pcre-8.40 && \
./configure --prefix=$PREFIX --disable-dependency-tracking --enable-utf8 --enable-pcre8 --enable-pcre16 --enable-pcre32 --enable-unicode-properties --enable-pcregrep-libz --enable-pcregrep-libbz2 --enable-jit && \
make && make install && \
cd ..

curl -OL http://ftp.acc.umu.se/pub/GNOME/sources/pango/1.32/pango-1.32.6.tar.xz
tar xf pango-1.32.6.tar.xz
cd pango-1.32.6
./configure --prefix=/home/ec2-user/build --disable-shared --enable-static
make install 
cd ..

curl -OL  ftp://ftp.gnome.org/pub/gnome/sources/glib/2.50/glib-2.50.2.tar.xz
tar xf glib-2.50.2.tar.xz 
cd glib-2.50.2
./configure --prefix=/usr --with-pcre=system  --prefix=/home/ec2-user/build --disable-shared --enable-static
make install
cd ..

curl -OL http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.36/gdk-pixbuf-2.36.4.tar.xz
tar xf gdk-pixbuf-2.36.4.tar.xz
cd gdk-pixbuf-2.36.4
./configure --prefix=/home/ec2-user/build --without-gdiplus --disable-modules --with-included-loaders=yes --disable-shared --enable-static
make install
cd ..

curl -OL http://ftp.gnome.org/pub/GNOME/sources/librsvg/2.40/librsvg-2.40.16.tar.xz
tar xf librsvg-2.40.16.tar.xz
cd librsvg-2.40.16
./configure --prefix=/home/ec2-user/build --disable-shared --enable-static --without-pango 
make install 
cd ..

#./build/bin/rsvg-convert map.svg -o map-x.pdf -f pdf
#ls -la *.pdf

