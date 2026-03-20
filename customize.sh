#!/sbin/sh
# customize.sh - KSU module installation script

ui_print "======================================="
ui_print " DDNS-Go v6.16.2 KSU Module "
ui_print " Downloading arm64 binary... "
ui_print "======================================="

BINARY_URL="https://github.com/jeessy2/ddns-go/releases/download/v6.16.2/ddns-go_6.16.2_android_arm64.tar.gz"

curl -L -o /tmp/ddns.tar.gz "$BINARY_URL" || { ui_print "Download failed! Check network."; exit 1; }

ui_print "Extracting binary..."
tar -xzf /tmp/ddns.tar.gz -C /tmp/

mkdir -p "$MODDIR/system/bin"
cp /tmp/ddns-go "$MODDIR/system/bin/ddns-go" 2>/dev/null || \
cp /tmp/*/ddns-go "$MODDIR/system/bin/ddns-go" 2>/dev/null || \
{ ui_print "Binary not found in tar!"; exit 1; }

chmod 0755 "$MODDIR/system/bin/ddns-go"
ui_print "Binary ready: $(du -sh "$MODDIR/system/bin/ddns-go" | awk '{print $1}')"

rm -f /tmp/ddns.tar.gz /tmp/ddns-go*
