#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
./scripts/feeds update -a && ./scripts/feeds install -a

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
rm -rf feeds/luci/applications/luci-app-passwall
svn export https://github.com/xiaorouji/openwrt-passwall/trunk/luci-app-passwall feeds/luci/applications/luci-app-passwall
git clone https://github.com/xiaorouji/openwrt-passwall-packages.git feeds/packages/
svn export https://github.com/immortalwrt/packages/trunk/net/ddns-go openwrt/feeds/packages/net/ddns-go
svn export https://github.com/immortalwrt/luci/trunk/applications/luci-app-ddns-go openwrt/feeds/luci/applications/luci-app-ddns-go
rm -rf openwrt/feeds/packages/lang/golang
svn co https://github.com/openwrt/packages/branches/openwrt-23.05/lang/golang openwrt/feeds/packages/lang/golang 
