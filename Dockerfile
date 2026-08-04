FROM docker.io/nginx:alpine

COPY src/ /usr/share/nginx/html
COPY run-tests.sh /run-tests.sh
RUN chmod +x /run-tests.sh