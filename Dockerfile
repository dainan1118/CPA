# 使用官方的 Docker 镜像作为基础
FROM ubuntu:20.04

# 安装必要的依赖
RUN apt-get update && apt-get install -y \
    docker.io \
    curl \
    git \
    && apt-get clean

# 安装 Docker Compose
RUN curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

# 复制你的项目文件
COPY . /app

WORKDIR /app

# 安装 CPA 所需的依赖
RUN docker-compose up -d

# 容器启动时运行你的服务
CMD ["docker-compose", "up", "-d"]
