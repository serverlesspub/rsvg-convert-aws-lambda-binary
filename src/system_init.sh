#sudo yum update -y
sudo yum-config-manager --enable epel
sudo yum install -y gcc gcc-c++ glib2-devel libxml2-devel libpng-devel libtiff-devel libjpeg-devel freetype-devel poppler-devel intltool flex bison -y
sudo yum install shared-mime-info gobject-introspection gobject-introspection-devel giflib-devel libjpeg-turbo-devel poppler-glib-devel pango-devel -y
# needed when rebuilding glib
#sudo yum install gettext-devel libmount-devel -y
#sudo yum install cairo cairo-devel -y
#
#needed to rebuild gobject-introspection
