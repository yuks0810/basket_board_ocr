FROM ruby:2.7.0
ENV LANG C.UTF-8

ENV DIRPATH /app

RUN apt-get update -qq \
    && apt-get install -y \
    build-essential libpq-dev curl apt-transport-https wget default-mysql-client nodejs graphviz ruby-dev\
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install -y yarn \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir $DIRPATH
WORKDIR $DIRPATH
COPY . $DIRPATH
RUN gem install bundler --conservative
RUN bundle install --path vendor/bundle
RUN bin/yarn
RUN bin/rails log:clear tmp:clear
RUN bin/rails restart
RUN bin/rails webpacker:install

EXPOSE 3000 1234 26162
CMD ["rails", "server", "-b", "0.0.0.0"]
