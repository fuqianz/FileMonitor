FROM ubuntu-debootstrap

# Copy and rebuild the code into docker
WORKDIR /opt/
ADD . .
RUN mkdir -p /var/log/supervisord/
RUN mkdir -p FileMonitor/log/ 
RUN cp -r FileMonitor/lib/* /usr/lib/
RUN cp -r FileMointor/include/* /usr/include/
RUN cp FileMonitor/supervisord.conf /etc/supervisord.conf
RUN /sbin/ldconfig /usr/lib

# change source list
ADD FileMonitor/sources.list /etc/apt/sources.list 
# Set TimeZone
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

#apt-get
RUN apt-get update && apt-get install -y libboost-all-dev libssl-dev inotify-tools g++ make supervisor

WORKDIR /opt/File_Monitor
RUN make 

# Entrypoint that reads the shell ENV variables as config flags
ENTRYPOINT ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
