sudo yum update -y

sudo yum-config-manager --enable epel

sudo yum group install "Development tools"  -y

sudo yum install -y libffi-devel libxml2-devel libpng-devel libtiff-devel libjpeg-devel giflib-devel libjpeg-turbo-devel libmount-devel \
cairo cairo-devel harfbuzz-devel cairo-gobject-devel shared-mime-info -y

# needed when rebuilding glib
#sudo yum install gettext-devel libmount-devel -y

#
#needed to rebuild gobject-introspection
