!#/bin/sh

echo "Downloading OpenWRT ..."

git clone git://git.openwrt.org/15.05/openwrt.git

echo "OpenWRT downloaded"

echo "Download MPTCP kernel patch ..."
git clone -b linux_3.18.29-mptcp_0.90 https://github.com/mytechpg/mptcp-kernel-patch.git

echo "Patch downloaded"

cd openwrt

echo "Preparing packages ..."
./scripts/feeds update -a
./scripts/feeds install -a

echo "Packages ready"

echo "Applyng patches"
cp -R ../package .
cp ../mptcp-kernel-patch/mptcp_linux_kernel.patch target/linux/generic/patches-3.18/622-mptcp_linux_kernel.patch

echo "System ready!"

