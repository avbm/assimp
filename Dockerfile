FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install cmake g++ -y
RUN make --version

RUN mkdir /workspace
COPY . /workspace

WORKDIR "/workspace"
RUN cmake CMakeLists.txt -G 'Unix Makefiles'
RUN make
RUN make install

RUN apt-get install rubygems
RUN gem install fpm
