FROM ruby:3.3
LABEL org.opencontainers.image.authors='leifcr@gmail.com'
LABEL description='Image for running rails 7 apps on kubernetes, with common gems preinstalled. Based on ruby:3.3 image'

ENV APP_HOME /app
ENV LANG C.UTF-8

# For stretch:
# RUN  apt-get install -y apt-transport-https ca-certificates gnupg wget --no-install-recommends && \
RUN curl -sL https://deb.nodesource.com/setup_22.x | bash - \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -q && apt-get upgrade -y \
    && apt-get install -y \
       build-essential \
       default-libmysqlclient-dev \
       libxml2-dev \
       libxslt1-dev \
       ghostscript \
       default-mysql-client \
       postgresql-client \
       wget \
       curl \
       nodejs \
       yarn

RUN set -x && \
    mkdir $APP_HOME && \
    groupadd -g 1001 rails && \
    useradd -s /bin/bash -m -d /home/rails --uid 1001 -g rails rails && \
    chown rails:rails /app

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
RUN gem install bundler && bundle --version && BUNDLE_WITHOUT="development:test" bundle install --jobs 20 --retry 5

# Set entry point to bundle exec, as all cmd's with rails should be prepended
ENTRYPOINT ["docker-entrypoint.sh"]
