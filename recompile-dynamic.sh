sudo yum install shared-mime-info cairo cairo-devel gobject-introspection gobject-introspection-devel giflib-devel libjpeg-turbo-devel poppler-glib-devel pango-devel harfbuzz-devel -y

export PKG_CONFIG_PATH=/usr/lib64/pkgconfig:/usr/lib/pkgconfig

curl -OL http://ftp.gnome.org/pub/GNOME/sources/libcroco/0.6/libcroco-0.6.8.tar.xz
tar xf libcroco-0.6.8.tar.xz 
cd libcroco-0.6.8
./configure --prefix=/usr && make && sudo make install && sudo ldconfig && cd ..

curl -OL http://ftp.gnome.org/pub/GNOME/sources/gdk-pixbuf/2.28/gdk-pixbuf-2.28.2.tar.xz 
tar xf gdk-pixbuf-2.28.2.tar.xz 
cd gdk-pixbuf-2.28.2
./configure --prefix=/usr
make && sudo make install && sudo ldconfig && sudo gdk-pixbuf-query-loaders --update-cache && cd ..

curl -OL http://ftp.gnome.org/pub/GNOME/sources/librsvg/2.26/librsvg-2.26.3.tar.gz
tar xf librsvg-2.26.3.tar.gz 
cd librsvg-2.26.3
./configure --prefix=/usr && make && sudo make install && sudo ldconfig && cd ..

