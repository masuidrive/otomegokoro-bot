FROM ruby:2.3.0
ENV LANG C.UTF-8
WORKDIR /usr/src/app
RUN gem install bundler

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
RUN bundle install

COPY . /usr/src/app