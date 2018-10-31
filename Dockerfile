FROM python:3.6-alpine

ENV ANIMED_OUTPUT /data
COPY . /opt/animed
RUN adduser -D worker && \
    pip install icalendar argparse && \
    mkdir -p $ANIMED_OUTPUT && \
    chown worker.worker $ANIMED_OUTPUT
USER worker
CMD /opt/animed/bin/animed

