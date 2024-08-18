#!/bin/bash

# 更新系统
sudo apt update
sudo apt upgrade -y

# 安装 Shadowsocks-libev 和其他必要的软件
sudo apt install -y shadowsocks-libev

# 创建 Shadowsocks 配置文件
sudo tee /etc/shadowsocks-libev/config.json > /dev/null <<EOF
{
    "server": "0.0.0.0",     
    "server_port": 8388,        
    "local_address": "127.0.0.1", 
    "local_port": 1080,           
    "password": "123456", 
    "timeout": 60,                
    "method": "chacha20-ietf-poly1305"  
}
EOF

# 设置服务开机自启
sudo systemctl enable shadowsocks-libev

# 启动 Shadowsocks 服务
sudo systemctl start shadowsocks-libev

# 检查 Shadowsocks 服务状态
sudo systemctl status shadowsocks-libev

# 输出服务日志（如果有问题）
echo "查看日志以调试问题："
sudo journalctl -u shadowsocks-libev
