FROM ruby:3.3
LABEL org.opencontainers.image.authors='leifcr@gmail.com'
LABEL description='Image for running rails 7 apps on kubernetes, with common gems preinstalled. Based on ruby:3.3 image'

ENV APP_HOME /app
ENV LANG C.UTF-8

RUN apt-get update -q && apt-get install -y --no-install-recommends ca-certificates curl gnupg wget \
    && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /etc/apt/keyrings \
    && curl -fsSL https://repo.mysql.com/RPM-GPG-KEY-mysql-2025 | gpg --dearmor -o /etc/apt/trusted.gpg.d/mysql.gpg \
    && curl -fsSL https://dl-ssl.google.com/linux/linux_signing_key.pub | gpg --dearmor -o /etc/apt/keyrings/google-chrome.gpg \
    && echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/google-chrome.gpg] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list \
    && curl -fsSL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor -o /etc/apt/keyrings/yarn.gpg \
    && echo "deb [signed-by=/etc/apt/keyrings/yarn.gpg] https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list

# Node
RUN curl -sL https://deb.nodesource.com/setup_22.x | bash -

# Add mysql8
# Configure the repo directly instead of via mysql-apt-config, whose debconf
# prompt hangs the build when apt-get upgrade pulls in a newer version.
# MySQL 8.0 has no packages for Debian trixie, so use 8.4 LTS
RUN . /etc/os-release \
    && echo "deb http://repo.mysql.com/apt/debian $VERSION_CODENAME mysql-8.4-lts mysql-tools" > /etc/apt/sources.list.d/mysql.list

# Install pkgs
RUN apt-get update -q && apt-get upgrade -y \
       && apt-get install -y \
       build-essential \
       libxml2-dev \
       libxslt1-dev \
       ghostscript \
       libmysqlclient-dev \
       libmysqlclient24 \
       mysql-client \
       postgresql-client \
       wget \
       curl \
       nodejs \
       yarn

RUN apt-get install -y google-chrome-stable --no-install-recommends
RUN rm -rf /var/lib/apt/lists/* && \
    set -x && \
    mkdir $APP_HOME && \
    groupadd -g 1001 rails && \
    useradd -s /bin/bash -m -d /home/rails --uid 1001 -g rails rails && \
    chown rails:rails /app

# Copy Imagemagick policy to allow converting PDF to thumbnails
COPY imagemagick_policy.xml /etc/ImageMagick-6/policy.xml

# Copy docker entry point
COPY docker-entrypoint.sh /usr/local/bin/

# Make entrypoint executable when building on Windows
# And backwards compatible entrypoint
RUN chmod +x /usr/local/bin/docker-entrypoint.sh && ln -s /usr/local/bin/docker-entrypoint.sh /docker-entrypoint.sh

# Continue as rails user
USER rails

# Set workdir to /app, so COPY, ADD, RUN and ENTRYPOINT is run within folder
WORKDIR $APP_HOME

# Add Gemfile
COPY --chown=rails:rails Gemfile Gemfile.lock ./
# Install gems
RUN gem install bundler && bundle install --jobs 20 --retry 5

# webdrivers gem is removed, so this is not needed anymore
# COPY --chown=rails:rails update_webdrivers.rb ./
# RUN bundle exec ruby update_webdrivers.rb

# Set entry point to bundle exec, as all cmd's with rails should be prepended
ENTRYPOINT ["docker-entrypoint.sh"]
