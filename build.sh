  #!/bin/bash

rm -rf .repo/local_manifests/
rm -rf device/xiaomi
rm -rf kernel/xiaomi/blossom
#rm -rf build
rm -rf TMP_PATCHES
#rm -rf frameworks/base
sudo apt update 
sudo apt install patchelf -y 
repo init -u https://github.com/Lunaris-AOSP/android -b 16.2 --git-lfs --depth=1
git clone https://github.com/james0y52-pnglocal_manifest_blossom -b A16-QP2 .repo/local_manifests
repo sync -c -j32 --force-sync --no-clone-bundle --no-tags
/opt/crave/resync.sh
. build/envsetup.sh
lunch lineage_blossom-bp4a-user
m installclean
m bacon
