# N3N supernode docker

## 使用

### 服务端
1. 创建配置文件`./conf/supernode.conf`
```
[connection]
bind=7777
[supernode]
federation=qibao
spoofing_protection=false
```
2. 启动容器
```
docker run --name n3n-server -d --restart always \
  -p 57711:7777 \
  -p 57711:7777/udp \
  -v /etc/localtime:/etc/localtime:ro \
  -v $PWD/conf:/etc/n3n:ro \
  chenweiwen/n3n-docker \
  n3n-supernode start
```

### 客户端
1. 创建配置文件`./edge.conf`
```
[community]
name=xxx
cipher=AES
key=xxx
supernode=xxx:57711

[daemon]
background = false

[tuntap]
metric=1

[filter]
allow_routing=true
```
2. 启动容器
```
docker run -d --restart always --net host --name n3n-client \
  --cap-add=NET_ADMIN --device /dev/net/tun:/dev/net/tun \
  -v $PWD/edge.conf:/etc/n3n/edge.conf:ro \
  chenweiwen/n3n-docker:latest \
  n3n-edge start
```

## 参考
[n42n/n3n](https://github.com/n42n/n3n)