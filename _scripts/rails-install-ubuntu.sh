# This script is based in the RailsGirls Ubuntu installation script:
# https://raw.github.com/railsgirls/installation-scripts/master/rails-install-ubuntu.sh

set -e

echo "Actualizando los paquetes instalados. Ingresa tu password para continuar."
sudo apt-get update -y

echo "Instalando paquetes. Ingresa tu password cuando te lo pidan."
sudo apt-get install build-essential bison openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev nodejs -y

echo "Instalando ImageMagick para procesamiento de imágenes."
sudo apt-get install imagemagick --fix-missing -y

echo "Instalando RVM (Ruby Version Manager) para manejar la instalación de Ruby."
curl -L get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm

echo "Instalando Ruby"
rvm install 1.9.3-p194
rvm use 1.9.3-p194 --default

gem install bundler --no-rdoc --no-ri
gem install rails --no-rdoc --no-ri

echo "Instalando el editor gedit."
sudo apt-get install gedit -y

echo -e "\n- - - - - -\n"
echo -e "Ahora vamos a imprimir alguna información para probar que todo está correcto:"

echo -n "La versión de sqlite debería ser 3.7.3 o mayor: sqlite "
sqlite3 --version
echo -n "La versión de rvm es rvm 1.6.32 o mayor: "
rvm --version | sed '/^.*$/N;s/\n//g' | cut -c 1-10
echo -n "La versión de Ruby debería ser ruby 1.9.3p194: "
ruby -v | -d " " -f 2
echo -n "La versión de Rails debería ser Rails 3.2.3: "
rails -v
echo -e "\n- - - - - -\n"

echo "Hola! Si recién estás empezando con Ruby o Ruby on Rails,"
echo "vísitanos en http://ruby.pe/. Tenemos tutoriales en español"
echo "para aprender Ruby y Ruby on Rails - RubyPerú."

echo "Listo!"
echo "Por favor reinicia tu terminal."
