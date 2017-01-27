sudo yum update -y

sudo yum-config-manager --enable epel

sudo yum install -y gcc gcc-c++ glib2-devel libxml2-devel \
  libpng-devel libtiff-devel libjpeg-devel freetype-devel poppler-devel \
  intltool flex bison libjpeg-turbo-devel poppler-glib-devel \
  shared-mime-info cairo cairo-devel cairo-gobject-devel \
  gobject-introspection gobject-introspection-devel giflib-devel \
  libjpeg-turbo-devel poppler-glib-devel pango-devel harfbuzz-devel libmount-devel

# needed when rebuilding glib
#sudo yum install gettext-devel libmount-devel -y
#sudo yum install cairo cairo-devel -y
#
#needed to rebuild gobject-introspection
