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

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
echo "src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main" >> "feeds.conf.default"
echo "src-git passwall https://github.com/xiaorouji/openwrt-passwall.git;main" >> "feeds.conf.default"
svn export https://github.com/immortalwrt/packages/trunk/net/ddns-go openwrt/feeds/packages/net/ddns-go
svn export https://github.com/immortalwrt/luci/trunk/applications/luci-app-ddns-go openwrt/feeds/luci/applications/luci-app-ddns-go
rm -rf openwrt/feeds/packages/lang/golang
svn co https://github.com/openwrt/packages/branches/openwrt-23.05/lang/golang openwrt/feeds/packages/lang/golang 
