FROM ubuntu:vivid

RUN echo mail > /etc/hostname; \
  echo "postfix postfix/main_mailer_type string Local only" > preseed.txt; \
  echo "postfix postfix/mailname string catchall.com" >> preseed.txt; \
  echo "roundcube roundcube/hosts string 127.0.0.1" >> preseed.txt; \
  echo "dovecot-core dovecot-core/create-ssl-cert boolean true" >> preseed.txt; \
  echo "dovecot-core dovecot-core/ssl-cert-name string localhost" >> preseed.txt; \
  echo "roundcube-core dbconfig-common/dbconfig-install boolean true" >> preseed.txt; \
  debconf-set-selections preseed.txt; \
  rm preseed.txt


RUN apt-get update && apt-get install -y \
  dovecot-imapd \
  postfix-pcre \
  roundcube \
  roundcube-sqlite3
