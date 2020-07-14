FROM debian:9
#MAINTENER Ayoub
RUN apt-get update
RUN apt-get install -y apache2 vim net-tools php libapache2-mod-php php-opcache php-cli php-gd php-curl php-mysql 
EXPOSE 80
CMD apache2ctl -D FOREGROUND



