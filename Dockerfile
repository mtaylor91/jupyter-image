FROM alpine:latest

# Install packages
RUN apk add --no-cache python3 py3-pip
RUN pip3 install --upgrade pip
RUN pip3 install torch torchvision torchaudio \
  --index-url https://download.pytorch.org/whl/cu118
ADD requirements.txt /tmp/requirements.txt
RUN pip3 install -r /tmp/requirements.txt
