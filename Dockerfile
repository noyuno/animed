FROM python:3.6-alpine

ENV ANIMED_OUTPUT /data
COPY . /opt/animed
RUN apk --update add sudo shadow && \
    rm -rf /var/cache/apk/* && \
    useradd worker && \
    groupadd sudo && \
    echo "%sudo ALL=(ALL) ALL" >> /etc/sudoers && \
    usermod -aG sudo worker && \
    pip install icalendar argparse && \
    mkdir -p $ANIMED_OUTPUT && \
    chown worker.worker $ANIMED_OUTPUT
USER worker
CMD /opt/animed/bin/animed

