#!/sbin/sh
# customize.sh for ddns-go KSU module

# Module directory
MODDIR=${0%/*}

ui_print "Downloading latest ddns-go v6.16.2 arm64..."

# 下载官方 arm64 tar.gz
curl -L -o /tmp/ddns.tar.gz "https://github.com/jeessy2/ddns-go/releases/download/v6.16.2/ddns-go_6.16.2_android_arm64.tar.gz"

ui_print "Extracting binary..."
tar -xzf /tmp/ddns.tar.gz -C /tmp/

# 移动到 module 的 system/bin
mkdir -p $MODDIR/system/bin
cp /tmp/ddns-go $MODDIR/system/bin/ddns-go || cp /tmp/ddns-go_* $MODDIR/system/bin/ddns-go  # 以防名字变
chmod 0755 $MODDIR/system/bin/ddns-go

rm -f /tmp/ddns.tar.gz /tmp/ddns-go*

ui_print "ddns-go binary installed!"
