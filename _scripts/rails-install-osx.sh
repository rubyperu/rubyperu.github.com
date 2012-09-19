#!/bin/sh
#
# This script is based in the RailsGirls OSX installation Script:
# https://raw.github.com/railsgirls/installation-scripts/master/rails-install-osx.sh

PACKAGE_URL="http://dl.dropbox.com/u/132031/tokaidoapp.tgz"
TOKAIDO_DIR="$HOME/.tokaidoapp"
RUBY_VERSION="1.9.3-p194"

function mktmpdir() {
dir=$(mktemp -t tokaido-XXXX)
rm -rf $dir
mkdir -p $dir
echo $dir
}

tmpdir=$(mktmpdir)
cd $tmpdir
echo "Downloading Tokaido.app"
curl $PACKAGE_URL -\# -o - | tar zxf -

echo "Setting up Tokaido.app"
mkdir -p $TOKAIDO_DIR
mkdir -p $TOKAIDO_DIR/rubies
mkdir -p $TOKAIDO_DIR/gems
mv .tokaidoapp/rubies/$RUBY_VERSION $TOKAIDO_DIR/rubies/
mv .tokaidoapp/gems/$RUBY_VERSION $TOKAIDO_DIR/gems/
mv .tokaidoapp/tokaidoapp.sh $TOKAIDO_DIR/

rm -rf $tmpdir

echo "[[ -s $HOME/.tokaidoapp/tokaidoapp.sh ]] && source $HOME/.tokaidoapp/tokaidoapp.sh" >> $HOME/.profile
source $HOME/.tokaidoapp/tokaidoapp.sh

echo -e "\n- - - - - - - - - \n"
echo -e "Ahora vamos a imprimir alguna información para probar que todo está correcto:\n"

echo -n "La versión de Ruby debería ser 1.9.3p194: "
ruby -v | cut -c 1-14
echo -n "La versión de Rails debería ser Rails 3.2.3: "
rails -v
echo -e "\n- - - - - - - - - \n"

echo "Hola! Si recién estás empezando con Ruby o Ruby on Rails,\n"
echo "vísitanos en http://ruby.pe/. Tenemos tutoriales en español\n"
echo "para aprender Ruby y Ruby on Rails - RubyPerú\n"

echo "Listo!"
echo "Por favor reinicia tu terminal."
