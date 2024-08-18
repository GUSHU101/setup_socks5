#!/bin/bash

# 更新系统并安装必要的软件包
sudo apt update && sudo apt upgrade -y
sudo apt install -y shadowsocks-libev

# 创建配置文件目录
sudo mkdir -p /etc/shadowsocks-libev

# 生成Shadowsocks配置文件
sudo tee /etc/shadowsocks-libev/config.json > /dev/null <<EOL
{
    "server": "0.0.0.0",           // 监听所有 IP 地址
    "server_port": 8388,           // 代理服务器的端口号
    "local_port": 1080,            // 本地监听端口号
    "password": "yourpassword",    // 设置代理服务器的密码
    "timeout": 60,
    "method": "chacha20-ietf-poly1305",  // 加密方式
    "mode": "tcp_and_udp"          // 支持TCP和UDP
}
EOL

# 启动并启用 Shadowsocks 服务
sudo systemctl enable shadowsocks-libev
sudo systemctl start shadowsocks-libev

echo "Socks5 代理已配置并启动。"
