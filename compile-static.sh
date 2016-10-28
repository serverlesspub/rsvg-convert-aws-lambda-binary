sudo yum install shared-mime-info cairo cairo-devel cairo-gobject-devel gobject-introspection gobject-introspection-devel giflib-devel libjpeg-turbo-devel poppler-glib-devel pango-devel harfbuzz-devel -y

export PKG_CONFIG_PATH=/home/ec2-user/build/lib/pkgconfig:/usr/lib64/pkgconfig:/usr/lib/pkgconfig
rm -rf build *.pdf

curl -OL http://ftp.gnome.org/pub/GNOME/sources/libcroco/0.6/libcroco-0.6.8.tar.xz
tar xf libcroco-0.6.8.tar.xz 
cd libcroco-0.6.8
./configure --prefix=/home/ec2-user/build --disable-shared --enable-static
make && make install 
cd ..

curl -OL http://ftp.gnome.org/pub/GNOME/sources/pango/1.28/pango-1.28.4.tar.bz2
tar xf pango-1.28.4.tar.bz2
cd pango-1.28.4
./configure --prefix=/home/ec2-user/build --disable-shared --enable-static
make && make install 
cd ..

curl -OL http://ftp.gnome.org/pub/GNOME/sources/gdk-pixbuf/2.28/gdk-pixbuf-2.28.2.tar.xz 
tar xf gdk-pixbuf-2.28.2.tar.xz 
cd gdk-pixbuf-2.28.2
./configure --prefix=/home/ec2-user/build --without-gdiplus --disable-modules --with-included-loaders=yes --disable-shared --enable-static
make && make install
cd ..

curl -OL http://ftp.gnome.org/pub/GNOME/sources/librsvg/2.26/librsvg-2.26.3.tar.gz
tar xf librsvg-2.26.3.tar.gz 
cd librsvg-2.26.3
./configure --prefix=/home/ec2-user/build --disable-shared --enable-static 
make && make install 
cd ..

./build/bin/rsvg-convert map.svg -o map-x.pdf -f pdf
ls -la *.pdf

