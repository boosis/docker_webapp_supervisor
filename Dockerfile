FROM dyln/webapp:latest

RUN apt-get update -y && \
    apt-get install -y -o Dpkg::Options::=--force-confnew supervisor && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*  
RUN mkdir /etc/service/supervisor    
COPY supervisor.sh /etc/service/supervisor/run
RUN chmod +x /etc/service/supervisor/run
RUN touch /tmp/supervisor.sock && chmod 777 /tmp/supervisor.sock
COPY supervisord.conf /etc/