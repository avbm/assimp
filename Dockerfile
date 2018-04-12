FROM 'jenkins_slave'

RUN mkdir /workspace
COPY . /workspace

WORKDIR "/workspace"
RUN cmake CMakeLists.txt -G 'Unix Makefiles'
RUN make
RUN make install

