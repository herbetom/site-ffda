DEFAULT_GLUON_RELEASE := 2.5~$(shell date '+%Y%m%d')
DEFAULT_GLUON_PRIORITY := 0

# Enable multidomain support
GLUON_MULTIDOMAIN := 1

# Languages to include in images
GLUON_LANGS ?= en de

# Region information for regulatory compliance
GLUON_REGION ?= eu

# Allow overriding the release number from the command line
GLUON_RELEASE ?= $(DEFAULT_GLUON_RELEASE)
GLUON_PRIORITY ?= ${DEFAULT_GLUON_PRIORITY}

# Don't build factory firmware for deprecated devices
GLUON_DEPRECATED ?= upgrade

# Featureset, these are either virtual or packages prefixed with "gluon-"
GLUON_FEATURES := \
	autoupdater \
	config-mode-domain-select \
	config-mode-geo-location-osm \
	ebtables-filter-multicast \
	ebtables-filter-ra-dhcp \
	ebtables-limit-arp \
	ebtables-source-filter \
	mesh-batman-adv-15 \
	mesh-vpn-fastd-l2tp \
	radvd \
	radv-filterd \
	respondd \
	status-page \
	web-advanced \
	web-ffda-domain-director \
	web-logging \
	web-private-wifi \
	web-wizard

GLUON_FEATURES_standard := wireless-encryption-wpa3

# Additional packages to install on every image
GLUON_SITE_PACKAGES := \
	ffda-domain-director \
	iwinfo \
	respondd-module-airtime


# Additional package list generated by contrib/genpkglist.py


INCLUDE_USB := \
    usbutils

EXCLUDE_USB := \
    -usbutils

INCLUDE_USB_HID := \
    kmod-usb-hid \
    kmod-hid-generic

EXCLUDE_USB_HID := \
    -kmod-usb-hid \
    -kmod-hid-generic

INCLUDE_USB_SERIAL := \
    kmod-usb-serial \
    kmod-usb-serial-ftdi \
    kmod-usb-serial-pl2303

EXCLUDE_USB_SERIAL := \
    -kmod-usb-serial \
    -kmod-usb-serial-ftdi \
    -kmod-usb-serial-pl2303

INCLUDE_USB_STORAGE := \
    block-mount \
    blkid \
    kmod-fs-ext4 \
    kmod-fs-ntfs \
    kmod-fs-vfat \
    kmod-usb-storage \
    kmod-usb-storage-extras \
    kmod-usb-storage-uas \
    kmod-nls-base \
    kmod-nls-cp1250 \
    kmod-nls-cp437 \
    kmod-nls-cp850 \
    kmod-nls-cp852 \
    kmod-nls-iso8859-1 \
    kmod-nls-iso8859-13 \
    kmod-nls-iso8859-15 \
    kmod-nls-iso8859-2 \
    kmod-nls-utf8

EXCLUDE_USB_STORAGE := \
    -block-mount \
    -blkid \
    -kmod-fs-ext4 \
    -kmod-fs-ntfs \
    -kmod-fs-vfat \
    -kmod-usb-storage \
    -kmod-usb-storage-extras \
    -kmod-usb-storage-uas \
    -kmod-nls-base \
    -kmod-nls-cp1250 \
    -kmod-nls-cp437 \
    -kmod-nls-cp850 \
    -kmod-nls-cp852 \
    -kmod-nls-iso8859-1 \
    -kmod-nls-iso8859-13 \
    -kmod-nls-iso8859-15 \
    -kmod-nls-iso8859-2 \
    -kmod-nls-utf8

INCLUDE_USB_NET := \
    kmod-mii \
    kmod-usb-net \
    kmod-usb-net-asix \
    kmod-usb-net-asix-ax88179 \
    kmod-usb-net-cdc-eem \
    kmod-usb-net-cdc-ether \
    kmod-usb-net-cdc-subset \
    kmod-usb-net-dm9601-ether \
    kmod-usb-net-hso \
    kmod-usb-net-ipheth \
    kmod-usb-net-mcs7830 \
    kmod-usb-net-pegasus \
    kmod-usb-net-rndis \
    kmod-usb-net-rtl8152 \
    kmod-usb-net-smsc95xx \
    gluon-ffda-usb-wan-hotplug

EXCLUDE_USB_NET := \
    -kmod-mii \
    -kmod-usb-net \
    -kmod-usb-net-asix \
    -kmod-usb-net-asix-ax88179 \
    -kmod-usb-net-cdc-eem \
    -kmod-usb-net-cdc-ether \
    -kmod-usb-net-cdc-subset \
    -kmod-usb-net-dm9601-ether \
    -kmod-usb-net-hso \
    -kmod-usb-net-ipheth \
    -kmod-usb-net-mcs7830 \
    -kmod-usb-net-pegasus \
    -kmod-usb-net-rndis \
    -kmod-usb-net-rtl8152 \
    -kmod-usb-net-smsc95xx \
    -gluon-ffda-usb-wan-hotplug

INCLUDE_PCI := \
    pciutils

EXCLUDE_PCI := \
    -pciutils

INCLUDE_PCI_NET := \
    kmod-bnx2

EXCLUDE_PCI_NET := \
    -kmod-bnx2

INCLUDE_TLS := \
    ca-bundle \
    libustream-openssl

EXCLUDE_TLS := \
    -ca-bundle \
    -libustream-openssl

ifeq ($(GLUON_TARGET),ath79-generic)
    GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

    GLUON_avm-fritz-wlan-repeater-450e_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_d-link-dap-1330-a1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_d-link-dap-1365-a1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_d-link-dap-2660-a1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_devolo-wifi-pro-1200e_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_devolo-wifi-pro-1200i_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_devolo-wifi-pro-1750c_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_devolo-wifi-pro-1750e_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_devolo-wifi-pro-1750i_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_devolo-wifi-pro-1750x_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_enterasys-ws-ap3705_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_joy-it-jt-or750i_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_ocedo-raccoon_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_openmesh-a40_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_openmesh-a60_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_openmesh-mr1750-v1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_openmesh-mr1750-v2_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_openmesh-mr600-v1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_openmesh-mr600-v2_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_openmesh-mr900-v1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_openmesh-mr900-v2_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_openmesh-om2p-hs-v1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_openmesh-om2p-hs-v2_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_openmesh-om2p-hs-v3_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_openmesh-om2p-hs-v4_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_openmesh-om2p-lc_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_openmesh-om2p-v1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_openmesh-om2p-v2_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_openmesh-om2p-v4_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_openmesh-om5p_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_openmesh-om5p-ac-v1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_openmesh-om5p-ac-v2_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_openmesh-om5p-an_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_plasma-cloud-pa300_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_plasma-cloud-pa300e_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_siemens-ws-ap3610_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_tp-link-archer-c2-v3_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_tp-link-archer-c6-v2_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_tp-link-cpe210-v1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_tp-link-cpe210-v2_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_tp-link-cpe220-v3_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_tp-link-cpe510-v1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_tp-link-cpe510-v2_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_tp-link-cpe510-v3_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_tp-link-eap225-outdoor-v1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_tp-link-tl-wr810n-v1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_tp-link-wbs210-v1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_tp-link-wbs210-v2_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_ubiquiti-nanostation-m-xw_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_ubiquiti-unifi-ac-lite_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_ubiquiti-unifi-ac-lr_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_ubiquiti-unifi-ac-mesh_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_ubiquiti-unifi-ap_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_ubiquiti-unifi-ap-pro_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
endif

# no pkglists for target ath79-nand


ifeq ($(GLUON_TARGET),bcm27xx-bcm2708)
    GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_HID) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

endif

ifeq ($(GLUON_TARGET),bcm27xx-bcm2709)
    GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_HID) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

endif

ifeq ($(GLUON_TARGET),bcm27xx-bcm2710)
    GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_HID) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

endif

ifeq ($(GLUON_TARGET),ipq40xx-generic)
    GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

endif

ifeq ($(GLUON_TARGET),ipq806x-generic)
    GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

endif

ifeq ($(GLUON_TARGET),lantiq-xrx200)
    GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

endif

ifeq ($(GLUON_TARGET),lantiq-xway)
    GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

endif

ifeq ($(GLUON_TARGET),mediatek-mt7622)
    GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

    GLUON_ubiquiti-unifi-6-lr_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
endif

ifeq ($(GLUON_TARGET),mpc85xx-p1010)
    GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

endif

ifeq ($(GLUON_TARGET),mpc85xx-p1020)
    GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

endif

ifeq ($(GLUON_TARGET),mvebu-cortexa9)
    GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

endif

ifeq ($(GLUON_TARGET),ramips-mt7620)
    GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

endif

ifeq ($(GLUON_TARGET),ramips-mt7621)
    GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

    GLUON_netgear-ex6150_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_ubiquiti-edgerouter-x_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_ubiquiti-edgerouter-x-sfp_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
endif

ifeq ($(GLUON_TARGET),ramips-mt76x8)
    GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

    GLUON_cudy-wr1000_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_gl.inet-vixmini_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_tp-link-archer-c50-v3_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_tp-link-archer-c50-v4_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_tp-link-tl-wa801nd-v5_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_tp-link-tl-wr841n-v13_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
endif

ifeq ($(GLUON_TARGET),rockchip-armv8)
    GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

endif

ifeq ($(GLUON_TARGET),sunxi-cortexa7)
    GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

endif

ifeq ($(GLUON_TARGET),x86-64)
    GLUON_SITE_PACKAGES += $(INCLUDE_PCI) $(INCLUDE_PCI_NET) $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

endif

ifeq ($(GLUON_TARGET),x86-generic)
    GLUON_SITE_PACKAGES += $(INCLUDE_PCI) $(INCLUDE_PCI_NET) $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

endif

ifeq ($(GLUON_TARGET),x86-geode)
    GLUON_SITE_PACKAGES += $(INCLUDE_PCI) $(INCLUDE_PCI_NET) $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

endif

# no pkglists for target x86-legacy
