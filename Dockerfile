FROM php:7.1-fpm

RUN apk add --update \
    vim \
    git \
    unzip \
    icu-dev \
    libmcrypt-dev \
    libpng-dev \
    jpeg-dev \
    nodejs \
    zlib-dev \
    imagemagick \
    imagemagick-dev \
    ghostscript \
    autoconf \
    pcre-dev \
    libtool \
    python \
    gcc \
    make \
    g++ \
    python \
    && upgrade

RUN docker-php-ext-install iconv pdo pdo_mysql mysqli mbstring intl json gd mcrypt zip bcmath

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer --version

# install dependencies
RUN npm install --quiet
RUN npm install gulp-cli -g 
RUN npm install gulp -D
RUN npm install -g bower bower-npm-resolver
RUN npm i gulp

# Set timezone
RUN rm /etc/localtime
RUN ln -s /usr/share/zoneinfo/UTC /etc/localtime
RUN "date"

WORKDIR /var/www
