FROM panubo/s3fs:latest

ADD https://github.com/99designs/cmdstalk/releases/download/v1.0.0/cmdstalk_linux_amd64.gz /tmp/
ADD https://www.docker.com/favicons/apple-touch-icon-120x120.png /media/watermark.png

RUN gunzip -f /tmp/cmdstalk_linux_amd64.gz && \
    mv /tmp/cmdstalk_linux_amd64 /usr/local/bin/cmdstalk && \
    chmod +x /usr/local/bin/cmdstalk

# add fmpeg
RUN echo "deb http://ftp.debian.org/debian jessie-backports main" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get -y -t jessie-backports install ffmpeg && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD cmdstalk.sh /
ADD commands /commands/
