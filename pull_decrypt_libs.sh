#!/bin/bash
#
# Copyright (C) 2017 The OmniRom Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Made By rishabhrao

filelist="/system/bin/linker64 \
/system/lib64/libbacktrace.so \
/system/lib64/libbase.so \
/system/lib64/libnetd_client.so \
/system/lib64/libunwind.so \
/system/lib64/libutils.so \
/system/lib64/libc.so \
/system/lib64/libcrypto.so \
/system/lib64/libcutils.so \
/system/lib64/libdl.so \
/system/lib64/libhardware.so \
/system/lib64/liblog.so \
/system/lib64/libm.so \
/system/lib64/libstdc++.so \
/system/lib64/libc++.so \
/system/vendor/lib64/libQSEEComAPI.so \
/system/vendor/lib64/hw/keystore.msm8952.so \
/system/vendor/lib64/libdrmfs.so \
/system/vendor/lib64/libdrmtime.so \
/system/vendor/lib64/librpmb.so \
/system/vendor/lib64/libssd.so \
/system/vendor/lib64/libdiag.so"
# Already Supplied by MultiRom: libcryptfslollipop.so
rm -r multirom_enc_blobs
for i in $filelist
do
	echo $i
	outfile="multirom_enc_blobs/`basename $i`"
	mkdir -p `dirname $outfile`
	adb pull $i $outfile
done
	adb shell "su -c cp /system/bin/qseecomd /sdcard/qseecomd"
	adb pull /sdcard/qseecomd multirom_enc_blobs/qseecomd
	adb shell "rm /sdcard/qseecomd"
mv multirom_enc_blobs/linker64 multirom_enc_blobs/linker
mkdir -p multirom_enc_blobs/vendor/lib64/hw
cp multirom_enc_blobs/keystore.msm8952.so multirom_enc_blobs/vendor/lib64/hw/keystore.default.so
mv multirom_enc_blobs/keystore.msm8952.so multirom_enc_blobs/vendor/lib64/hw/
chmod 755 multirom_enc_blobs/*
