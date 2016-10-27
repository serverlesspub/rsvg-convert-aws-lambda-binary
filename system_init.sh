sudo yum-config-manager --enable epel
sudo yum install -y gcc gcc-c++ glib2-devel.x86_64 libxml2-devel.x86_64 libpng-devel.x86_64
#sudo yum install cairo cairo-devel -y
sudo yum install libtiff-devel libjpeg-devel libpng-devel -y
# sudo yum install gobject-introspection.x86_64 gobject-introspection-devel.x86_64 -y
# needed when rebuilding glib
#sudo yum install gettext-devel libmount-devel pcre-devel -y
