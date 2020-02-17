FROM alpine:latest
MAINTAINER Corpoflow <webmaster@corpoflow.nl>

# Setup working directory and expose as volume
RUN mkdir -p /workspace
WORKDIR /workspace
VOLUME /workspace

# Fetch composer
ADD https://getcomposer.org/composer.phar /usr/local/bin/composer

# Make composer executable
RUN chmod +x /usr/local/bin/composer

# Add composer to path variable
ENV PATH /root/.composer/vendor/bin:$PATH

# PHP binary & extensions
RUN echo "http://dl-cdn.alpinelinux.org/alpine/latest-stable/main" >> /etc/apk/repositories
RUN apk update 
RUN apk add --no-cache \
                      php7 \
                      php7-json \
                      php7-openssl \
                      php7-phar \
                      php7-ast \
                      php7-dom \
                      php7-tokenizer \
                      php7-mbstring \
                      php7-iconv \
                      php7-ctype \
                      php7-igbinary \
                      php7-pcntl

# Clear APK cache
RUN rm -rf /var/cache/apk/*

# Install phan/phan
RUN composer global require phan/phan

# Entry
ENTRYPOINT ["phan"]
