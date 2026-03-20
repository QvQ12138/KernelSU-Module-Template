#!/system/bin/sh
# service.sh - late_start service

MODDIR=${0%/*}

# 等待网络就绪
sleep 15

# 启动 ddns-go（服务模式，无 web UI；想用 web UI 删掉 -noweb）
# 配置默认在 /data/adb/modules/ddns-go-ksu/ 或 \~/.ddns-go
nohup $MODDIR/system/bin/ddns-go -s -noweb >> /data/local/tmp/ddns-go.log 2>&1 &
