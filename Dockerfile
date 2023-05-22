# Utiliza la imagen oficial de Ruby 2.7.1 como imagen base
FROM ruby:2.7.1

# Instala las dependencias del sistema requeridas para Rails
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Crea un directorio de trabajo para tu aplicación en el contenedor
WORKDIR /app

# Instala Rails
RUN gem install rails -v 5.2

# Crea una nueva aplicación de Rails en el directorio de trabajo
RUN rails new . --force --no-deps --skip-bundle

# Instala las gemas requeridas
RUN bundle install

# Expone el puerto 3000 para acceder a tu aplicación Rails desde el exterior
EXPOSE 3000

# Configura el comando de inicio del contenedor
CMD ["rails", "server", "-b", "0.0.0.0"]

