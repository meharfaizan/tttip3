FROM python:3.9.2-slim-buster
RUN mkdir /bot && chmod 777 /bot
WORKDIR /bot
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y mediainfo
RUN apt -qq update && apt -qq install -y git wget pv jq ffmpeg
RUN apt-get install neofetch wget -y -f

COPY . .
RUN pip3 install -r requirements.txt
CMD ["bash","run.sh"]
