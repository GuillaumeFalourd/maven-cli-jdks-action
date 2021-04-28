FROM maven:3.8.1-openjdk-17-slim

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]