FROM centos

RUN yum install -y make gcc-c++ ruby-devel coreutils atomic docker

ADD . /app
WORKDIR /app

RUN gem install bundler && bundle install