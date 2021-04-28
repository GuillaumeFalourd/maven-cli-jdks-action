FROM maven:3.6-jdk-13

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]