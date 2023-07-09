FROM images.home.mtaylor.io/base:latest
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade -y && apt-get install -y python3-full python3-pip
RUN python3 -m venv /opt/venv
RUN /opt/venv/bin/pip install torch torchvision torchaudio \
  --index-url https://download.pytorch.org/whl/cu118
ADD requirements.txt /tmp/requirements.txt
RUN /opt/venv/bin/pip install -r /tmp/requirements.txt
ADD docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN adduser --disabled-password --gecos '' --uid 1000 jupyter
USER jupyter
ENTRYPOINT ["docker-entrypoint.sh"]
