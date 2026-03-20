#!/system/bin/sh
# service.sh - late_start service for ddns-go

MODDIR=${0%/*}

# 等待网络（可选加 sleep 30）
until ping -c 1 8.8.8.8; do sleep 5; done

# 启动 ddns-go（-s 服务模式，配置在 /data/adb/modules/[module_id]/config 或默认）
$MODDIR/system/bin/ddns-go -s -noweb >> /data/local/tmp/ddns-go.log 2>&1 &
