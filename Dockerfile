FROM alpine

COPY script.sh /
RUN chmod 755 /script.sh

CMD ["/script.sh"]
