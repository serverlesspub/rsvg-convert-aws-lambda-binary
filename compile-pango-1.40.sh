curl -OL https://downloads.sf.net/project/freetype/freetype2/2.7.1/freetype-2.7.1.tar.bz2 &&\
tar xf freetype-2.7.1.tar.bz2 &&\
cd freetype-2.7.1 &&\
./configure --prefix=$PREFIX --without-harfbuzz $LINKER_OPTS&&\
make && make install &&\
cd ..


curl -OL https://www.freedesktop.org/software/fontconfig/release/fontconfig-2.12.1.tar.bz2 &&\
tar xf fontconfig-2.12.1.tar.bz2 &&\
cd fontconfig-2.12.1 &&\
./configure --prefix=$PREFIX --disable-docs --enable-libxml2 $LINKER_OPTS &&\
make && make install &&\
cd ..


curl -OL https://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.4.2.tar.bz2 && \
tar xf harfbuzz-1.4.2.tar.bz2 && \
cd harfbuzz-1.4.2 && \
./configure  --prefix=$PREFIX --disable-dependency-tracking --enable-static --with-cairo=yes --with-freetype=yes $LINKER_OPTS && \
make && make install && \
cd ..

curl -OL https://download.gnome.org/sources/pango/1.40/pango-1.40.3.tar.xz &&\
tar xf pango-1.40.3.tar.xz &&\
cd pango-1.40.3 && \
./configure --prefix=$PREFIX --disable-dependency-tracking --disable-silent-rules --enable-introspection=yes $LINKER_OPTS &&\
make && make install &&\
cd ..


