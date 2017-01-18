FROM ruby:2.2.3
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends apt-utils && apt-get install vim -y apache2 -y libpq-dev -y build-essential -y nodejs libxslt-dev -y libxml2-dev -y zlib1g-dev -y 
RUN mkdir User-Event-Management
WORKDIR /User-Event-Management
ADD Gemfile /User-Event-Management/Gemfile
ADD Gemfile.lock /User-Event-Management/Gemfile.lock
RUN gem install rails
RUN gem install bundler
RUN bundle install
ADD . /User-Event-Management
CMD RAILS_ENV=it bundle exec rake db:create db:migrate db:seed && rails server -b 0.0.0.0 -p 80