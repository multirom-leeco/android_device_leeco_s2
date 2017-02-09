#!/sbin/sh

# This pulls the files out of /system that are needed for decrypt
# This allows us to decrypt the device in recovery and still be
# able to unmount /system when we are done.

mount -t ext4 -o ro /dev/block/platform/soc.0/7824900.sdhci/by-name/system /system

cp /system/bin/linker64 /sbin/linker64
cp /system/lib64/libbacktrace.so /sbin/libbacktrace.so
cp /system/lib64/libbase.so /sbin/libbase.so
cp /system/lib64/libnetd_client.so /sbin/libnetd_client.so
cp /system/lib64/libunwind.so /sbin/libunwind.so
cp /system/lib64/libutils.so /sbin/libutils.so
cp /system/lib64/libc.so /sbin/libc.so
cp /system/lib64/libcrypto.so /sbin/libcrypto.so
cp /system/lib64/libcutils.so /sbin/libcutils.so
cp /system/lib64/libdl.so /sbin/libdl.so
cp /system/lib64/libhardware.so /sbin/libhardware.so
cp /system/lib64/liblog.so /sbin/liblog.so
cp /system/lib64/libm.so /sbin/libm.so
cp /system/lib64/libstdc++.so /sbin/libstdc++.so
cp /system/lib64/libc++.so /sbin/libc++.so
cp /system/vendor/lib64/libQSEEComAPI.so /sbin/libQSEEComAPI.so
cp /system/vendor/lib64/hw/keystore.msm8952.so /sbin/keystore.msm8952.so
cp /system/vendor/lib64/libdrmfs.so /sbin/libdrmfs.so
cp /system/vendor/lib64/libdrmtime.so /sbin/libdrmtime.so
cp /system/vendor/lib64/librpmb.so /sbin/librpmb.so
cp /system/vendor/lib64/libssd.so /sbin/libssd.so
cp /system/vendor/lib64/libdiag.so /sbin/libdiag.so

umount /system

mkdir -p /system/vendor/lib64/hw
cp /sbin/keystore.msm8952.so /system/vendor/lib64/hw/keystore.msm8952.so
