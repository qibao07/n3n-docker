FROM ubuntu:22.04

ARG URL=https://ghproxy.net/https://github.com/n42n/n3n/releases/download/3.3.3/n3n_3.3.3-1_arm64.deb

RUN sed -i 's/ports.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN apt update && apt install -y wget

RUN ln -s /bin/true /bin/systemctl
RUN wget ${URL} -O n2n.deb \
  && apt install -y ./n2n.deb

COPY docker-start.sh /

CMD ["/docker-start.sh"]
