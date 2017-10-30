# OpenWrt custom packages feed

## Description

GitHub Pages repository for my own OpenWrt binary packages feed.

## Usage

```
$ opkg install libustream-mbedtls
$ wget https://hnw.github.io/openwrt-packages/public.key
$ opkg-key add public.key
$ echo 'src/gz pkgs-by-hnw https://hnw.github.io/openwrt-packages/17.01/mips_24kc' >> /etc/opkg/customfeeds.conf
$ opkg update
```

## Supporting platforms and packages

* OpenWrt 15.05.1
  * [mips_24kc](https://github.com/hnw/openwrt-packages/tree/gh-pages/15.05.1/mips_24kc)
* LEDE 17.01.x
  * [mips_24kc](https://github.com/hnw/openwrt-packages/tree/gh-pages/17.01/mips_24kc)
  * [mipsel_24kc](https://github.com/hnw/openwrt-packages/tree/gh-pages/17.01/mipsel_24kc)
  * [arm_cortex-a9](https://github.com/hnw/openwrt-packages/tree/gh-pages/17.01/arm_cortex-a9)

## Packages

- [digitemp](https://github.com/hnw/openwrt-packages-digitemp)
- [lv](https://github.com/hnw/openwrt-packages-lv)
- [mackerel-agent](https://github.com/hnw/openwrt-packages-mackerel-agent)
- [mackerel-plugin-iw](https://github.com/hnw/openwrt-packages-mackerel-plugin-iw)
- [miruo](https://github.com/hnw/openwrt-packages-miruo)
- [netstat-nat](https://github.com/hnw/openwrt-packages-netstat-nat)
- [nkf](https://github.com/hnw/openwrt-packages-nkf)

## License

See [LICENSE](LICENSE) file.
