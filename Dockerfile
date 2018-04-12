FROM 'jenkins_slave'

RUN mkdir /workspace
COPY . /workspace

WORKDIR "/workspace"
RUN ASSIMP_ROOT_DIR=/apps/assimp cmake CMakeLists.txt -G 'Unix Makefiles'
RUN make
RUN make install

RUN fpm -s dir -t deb --prefix /apps assimp 
RUN bash
