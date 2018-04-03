FROM ruby:2.3.3

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /myapp
WORKDIR /myapp

COPY . . 

RUN cp config/graphs-sample.json.erb config/graphs.json.erb
RUN cp config/index_parameters-sample.yml config/index_parameters.yml
RUN cp config/summary_parameters-sample.yml config/summary_parameters.yml
RUN cp config/parameters_edit-sample.yml config/parameters_edit.yml
RUN cp config/parameter_renderers-sample.yml config/parameter_renderers.yml
RUN cp config/roles-sample.yml config/roles.yml
RUN cp config/users-sample.yml config/users.yml

RUN bundle install
RUN bundle exec rake db:migrate

CMD ["rails", "s", "-b", "0.0.0.0"]