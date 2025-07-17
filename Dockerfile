# Usa la imagen base PHP 7.4 con Apache
FROM php:7.4-apache

# Activa el módulo rewrite de Apache
RUN a2enmod rewrite

# Instala la extensión mysqli
RUN docker-php-ext-install mysqli


# Establece el directorio de trabajo 
WORKDIR /var/www/html

# Copia tus archivos al directorio raíz del servidor web
COPY wordpress/ .

# Establece permisos para que Apache pueda leer los archivos
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Expone el puerto 80
EXPOSE 80




