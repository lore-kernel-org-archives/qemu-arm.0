Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1236860njf;
        Mon, 2 Sep 2024 14:31:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWcp+UTz4YioQXwVWJDEyfJ/wnBIZf9G0EJZI+AoGVkrXnMaQVX79hN00n+exHZ3IeohzSMQejii+7D+g==@linaro.org
X-Google-Smtp-Source: AGHT+IHcjo9b8VNdWQp01opa5iB7B/EwySN7wXeMgjpH2wSWti7JHL2UfD1lOWmGYiMpBkbo9usU
X-Received: by 2002:a05:6214:3109:b0:6c3:6524:b242 with SMTP id 6a1803df08f44-6c36524b3c8mr53232826d6.20.1725312709243;
        Mon, 02 Sep 2024 14:31:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725312709; cv=none;
        d=google.com; s=arc-20160816;
        b=GF7kvW5tCzHYM1BknaufgzFfF5LRuTTj6eAVvExHcxaaxgrN+pWw1BAoFea6aIpBaN
         7IPDP9Bt1QuUgwx1Wm0Gui6zsALihxCcc9P/v1q2FLMD4nj0zdAm4stxLaBSsCS6/3/8
         lX0Ws2zlZj1vMU7d+u2VfWW6WGo/yQEhei4Y4pYunoXOhOyR8ztG5IINDTMGdV0ps77Y
         eRp7XWEKD8BvDVoe7Tosc9gzOb4k7ldsIjhYykpyYguyXIozK2gipxvb0HGU6b7YNFb/
         G/yLcPKxVfnd0fXJOYlyXqcG9xC7LdkwB9IFozhDAorX2NRN1tJ8V19kK7DwIXAb80GK
         WdKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=U9qPF2XSXn2X9ALSTu53xl9NXRcx83ibSPHm8UW6Zg4=;
        fh=LuaWtQkKwT7QH/V65gOG3gVj1z7W2F6jo5fJ9zJo5xo=;
        b=EW15HY8Rd1D9u4Vs9YxA9s/euEisyO4mpb99hbQHoGJdRLKaKWmKjQgup/xbiyOaMU
         3k479lvy83RZkqZ3hFzTzaUfOP3U5S4RkBQEYPoFPDnP8ZPDEXK45Tb9dC3xLLpQQq1k
         xzLjCWbJc8tnYv51DGQeagjeZmq8hQoWA9/6BhU6k/k18S3khYL89ffgabsAVGKaBJsb
         HoKkJQ/lpcF4mQQoeesdKncKn0MHt1HF3/AasIexsjjKKGzwutSZ8Pl7OmvRBnl0sj9n
         iQwFKSmF02Umg54PWzHF+J6tP8qfzV0CjmiXQjdO+F3aup9Mke80sFNAYjR+80pC+AGw
         CBpQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qq7VKVMl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c354ff9d07si73652046d6.181.2024.09.02.14.31.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Sep 2024 14:31:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qq7VKVMl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slEe4-0007lp-WD; Mon, 02 Sep 2024 17:31:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marietto2008@gmail.com>)
 id 1slEe3-0007km-Tb; Mon, 02 Sep 2024 17:31:31 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marietto2008@gmail.com>)
 id 1slEdy-0007CI-VX; Mon, 02 Sep 2024 17:31:31 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-2d679b094ffso3322706a91.1; 
 Mon, 02 Sep 2024 14:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725312685; x=1725917485; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=U9qPF2XSXn2X9ALSTu53xl9NXRcx83ibSPHm8UW6Zg4=;
 b=Qq7VKVMl26U4/+dhCZpi04hAyMxkTRHHVzo7UCrSey7L2JVVgycKSLg6UrhCI47T1G
 5WHf82lW0HBiouJWVGa9ygpiizw1OYj7O5WkAAqZYK3qw0tdRD/NF4496ZZEBrFt1VO1
 yKB9yrLBA6l1weJM8hg3jcbxcpx4mECqoNiorNna8PROFSDe4YdTrVMk2aDbk1pdkPNG
 1QhpzU7+RblqTlYfAxukdQ1gSzKHfkOc7BTeUcxYDYgrletKcCJljuToVDX976xAzPrL
 m2mGMgB3wKaeitp6IxkWkiTYKvoukpQWc/RLlu4WFdt3cIbS2k94u0qcLbGf5RmMSTx8
 BEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725312685; x=1725917485;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U9qPF2XSXn2X9ALSTu53xl9NXRcx83ibSPHm8UW6Zg4=;
 b=XKnRdV5vl4Q9lGbvJqqHarzKNjakvtA8iudbTwTbTiY/46DN+/OI5qez5gh1mx8QFr
 i0PNEuIQ0w/a+xrOS+LvikR/izgK+6mawTZ+znxUXiZd1eHSrePxL90y3wZr7bejD84n
 czRgbscM5CY7y6QIgb2VVe1VueZr3y+lPFhXt5o+vuKGrwoTCtaFIpVDtJ2WNQHDXq/X
 c8oTWK0WRae8ZGtGicclrH5JoSk+xq24QcmPn5Dv7MJw346tX5ddr+qqQPSOpfq+LM5J
 eH8zZYOSiuppq3P9o+sga/S+XKbLLzcUnGmXq1airrY1dPCQMwkNQF1C0pcKcbBlLZS5
 X5KQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMqXxXFxfIBhfQIp5SSFTSk8+Ru9Ce1FLhcV1QRYIeBfEmnNdZqOBFNe7NVp0f3/jzJ6tNyMSwkw==@nongnu.org
X-Gm-Message-State: AOJu0YzPs+KBEFnmdx6QStosv8eYnZRnZQ//uMHezGQrye62CbBYiGLD
 SCCbQ058Ym84Z+w/wLVzGeqULueBa3zACBvEIwQ5I16jY3v8g8LLy8MraONiGcEW3cTC9q4XbPM
 zl2tXiWVOfHylW4FpwxF5JhOgvO4=
X-Received: by 2002:a17:90a:d985:b0:2d8:7561:db71 with SMTP id
 98e67ed59e1d1-2d87561eb2amr9233498a91.25.1725312684748; Mon, 02 Sep 2024
 14:31:24 -0700 (PDT)
MIME-Version: 1.0
References: <CA+1FSiirzpq4wjcKTLSexiOWtv26sgD37h=wA2qxv8Qh5MW_-w@mail.gmail.com>
 <23d60255-614a-4a06-b449-644f215555d0@linaro.org>
 <CA+1FSiitcSBa3JZaAZMGkdB356d2M0rPqscwFnNXGML5HghVCQ@mail.gmail.com>
 <c80e855a-ac1c-40b6-8a76-966e53c0b7d7@linaro.org>
 <4cbc21b0-0634-445d-8a67-7705a4e186d8@linaro.org>
 <CA+1FSigiu8xXF1OPs1oSPS7LiGe23gsN73RwPpJUYH=X5EkTRQ@mail.gmail.com>
In-Reply-To: <CA+1FSigiu8xXF1OPs1oSPS7LiGe23gsN73RwPpJUYH=X5EkTRQ@mail.gmail.com>
From: Mario Marietto <marietto2008@gmail.com>
Date: Mon, 2 Sep 2024 23:30:48 +0200
Message-ID: <CA+1FSiiH9LP-7UupNLjDyZJGqJAHAjN2nSLFm9fCx=ZNphxGoQ@mail.gmail.com>
Subject: Re: Error : init: partition(s) not found in /sys, waiting for their
 uevent(s): mmcblk0p2, mmcblk0p3 while trying to emulate Android 14 on Ubuntu
 24.04 X64 bit using qemu-system-aarch64.
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-discuss@nongnu.org, qemu-arm <qemu-arm@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000b3773e062129a902"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=marietto2008@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: SjrT3gxky/2E

--000000000000b3773e062129a902
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Something is not right :

ziomario@Z390-AORUS-PRO-DEST:
/mnt/zroot-133/_OS/Android/aosp_14/android-image$ unzip ../aosp_cf_*.zip

Archive:  ../aosp_cf_arm64_only_phone-img-12309296.zip
 inflating: android-info.txt
 inflating: fastboot-info.txt
 inflating: kernel_16k
 inflating: ramdisk_16k.img
 inflating: boot.img
 inflating: boot_16k.img
 inflating: bootloader
 inflating: init_boot.img
 inflating: userdata.img
 inflating: vbmeta.img
 inflating: vbmeta_system.img
 inflating: vbmeta_system_dlkm.img
 inflating: vbmeta_vendor_dlkm.img
 inflating: vendor_boot.img
 inflating: super.img

ziomario@Z390-AORUS-PRO-DEST:
/mnt/zroot-133/_OS/Android/aosp_14/android-image$ tar xzvf
../cvd-host_package.tar.gz


./
./lib64/
./lib64/android.hardware.keymaster@3.0.so
./lib64/libciborium_io.dylib.so
./lib64/libjpeg.so
./lib64/cuttlefish_net.so
./lib64/libbase.so
./lib64/vulkan.pastel.so
./lib64/libcuttlefish_host_config.so
./lib64/libflagset.dylib.so
./lib64/libkmr_common.dylib.so
./lib64/libpkcs1.dylib.so
./lib64/libicui18n-host.so
./lib64/libwayland_client.so
./lib64/libunwindstack.so
./lib64/libkmr_ta.dylib.so
./lib64/libcoset.dylib.so
./lib64/libcppbor.so
./lib64/libgatekeeper.so
./lib64/libyuv.so
./lib64/libgrpc++.so
./lib64/libkmr_cf_ffi.so
./lib64/libcppcose_rkp.so
./lib64/libcuttlefish_transport.so
./lib64/liblzma.so
./lib64/libciborium_ll.dylib.so
./lib64/libcuttlefish_allocd_utils.so
./lib64/libgflags.so
./lib64/android.hardware.keymaster@4.0.so
./lib64/libcfg_if.dylib.so
./lib64/libspki.dylib.so
./lib64/libzeroize.dylib.so
./lib64/libcgrouprc.so
./lib64/libprotobuf-cpp-full.so
./lib64/libcutils.so
./lib64/libsqlite.so
./lib64/libcuttlefish_utils_result.so
./lib64/libbinder_ndk.so
./lib64/libext2_uuid-host.so
./lib64/libhex.dylib.so
./lib64/libc_musl.so
./lib64/libconst_oid.dylib.so
./lib64/libprotobuf_support.dylib.so
./lib64/tpm2-tss2-tcti.so
./lib64/libserde.dylib.so
./lib64/libartpalette.so
./lib64/liblog.so
./lib64/libonce_cell.dylib.so
./lib64/libthiserror.dylib.so
./lib64/libssl-host.so
./lib64/libc++.so
./lib64/libext4_utils.so
./lib64/libpkcs8.dylib.so
./lib64/libsparse-host.so
./lib64/sandboxed_api_sandbox2.so
./lib64/libcuttlefish_command_util.so
./lib64/libbssl_sys.dylib.so
./lib64/libkeymaster_messages.so
./lib64/libcuttlefish_web.so
./lib64/libvpx.so
./lib64/libopus.so
./lib64/libminijail.so
./lib64/libcurl-host.so
./lib64/libcuttlefish_kernel_log_monitor_utils.so
./lib64/tpm2-tss2-util.so
./lib64/liblibc.dylib.so
./lib64/libprotobuf.dylib.so
./lib64/libbitflags.dylib.so
./lib64/libutils.so
./lib64/libjsoncpp.so
./lib64/libext2_blkid-host.so
./lib64/libnl.so
./lib64/tpm2-tss2-sys.so
./lib64/libartbase.so
./lib64/libxml2.so
./lib64/libkmr_proto_rust.dylib.so
./lib64/libcuttlefish_security.so
./lib64/libsecure_env_tpm.dylib.so
./lib64/libz-host.so
./lib64/libprocessgroup.so
./lib64/libcrypto_utils.so
./lib64/libder.dylib.so
./lib64/libdexfile.so
./lib64/cf_metrics_proto.so
./lib64/tpm2-tss2-esys.so
./lib64/libcuttlefish_utils.so
./lib64/libkeymaster_portable.so
./lib64/libfruit.so
./lib64/tpm2-tss2-rc.so
./lib64/libcap.so
./lib64/libnix.dylib.so
./lib64/libicuuc-host.so
./lib64/libziparchive.so
./lib64/libkmr_ta_nonsecure.dylib.so
./lib64/libstd.dylib.so
./lib64/libhalf.dylib.so
./lib64/tpm2-tss2-mu.so
./lib64/libmemoffset.dylib.so
./lib64/liblp.so
./lib64/libcuttlefish_fs.so
./lib64/libProxyConfig.so
./lib64/libopenssl.dylib.so
./lib64/libkmr_wire.dylib.so
./lib64/libkmr_crypto_boring.dylib.so
./lib64/liblog_rust.dylib.so
./lib64/libhidlbase.so
./lib64/libgrpc_wrap.so
./lib64/libgrpc++_unsecure.so
./lib64/libbytes.dylib.so
./lib64/libsoft_attestation_cert.so
./lib64/libcuttlefish_run_cvd_proto.so
./lib64/libbinder.so
./lib64/libcrypto-host.so
./lib64/libwebm_mkvmuxer.so
./lib64/libkmr_cf.dylib.so
./lib64/libciborium.dylib.so
./lib64/libpuresoftkeymasterdevice_host.so
./lib64/libx509_cert.dylib.so
./lib64/libsec1.dylib.so
./nativetest64/
./nativetest64/modem_simulator_test/
./nativetest64/modem_simulator_test/modem_simulator_test
./nativetest64/cuttlefish_net_tests/
./nativetest64/cuttlefish_net_tests/cuttlefish_net_tests
./etc/
./etc/modem_simulator/
./etc/modem_simulator/files/
./etc/modem_simulator/files/iccprofile_for_sim0_for_CtsCarrierApiTestCases.=
xml

./etc/modem_simulator/files/iccprofile_for_sim0.xml
./etc/modem_simulator/files/numeric_operator.xml
./etc/cvd_rsa4096.avbpubkey
./etc/bootloader_aarch64/
./etc/bootloader_aarch64/bootloader.qemu
./etc/bootloader_aarch64/bootloader.crosvm
./etc/bootloader_riscv64/
./etc/bootloader_riscv64/bootloader.qemu
./etc/automotive/
./etc/automotive/vhalconfig/
./etc/automotive/vhalconfig/VendorClusterTestProperties.json
./etc/automotive/vhalconfig/DefaultProperties.json
./etc/automotive/vhalconfig/TestProperties.json
./etc/automotive/proxy_config.json
./etc/cvd_rsa2048.avbpubkey
./etc/cvd_avb_testkey_rsa4096.pem
./etc/bootloader_arm/
./etc/bootloader_arm/bootloader.qemu
./etc/bootloader_x86_64/
./etc/bootloader_x86_64/bootloader.qemu
./etc/bootloader_x86_64/bootloader.crosvm
./etc/cvd_avb_testkey_rsa2048.pem
./etc/openwrt/
./etc/openwrt/images/
./etc/openwrt/images/openwrt_kernel_aarch64
./etc/openwrt/images/openwrt_rootfs_x86_64
./etc/openwrt/images/openwrt_rootfs_aarch64
./etc/openwrt/images/openwrt_kernel_x86_64
./etc/cvd_config/
./etc/cvd_config/cvd_config_tv.json
./etc/cvd_config/cvd_config_tablet.json
./etc/cvd_config/cvd_config_wear.json
./etc/cvd_config/cvd_config_auto_portrait.json
./etc/cvd_config/cvd_config_slim.json
./etc/cvd_config/cvd_config_go.json
./etc/cvd_config/cvd_config_foldable.json
./etc/cvd_config/cvd_config_auto.json
./etc/cvd_config/cvd_config_auto_md.json
./etc/cvd_config/cvd_config_phone.json
./usr/
./usr/share/
./usr/share/vulkan/
./usr/share/vulkan/icd.d/
./usr/share/vulkan/icd.d/vk_swiftshader_icd.json
./usr/share/qemu/
./usr/share/qemu/aarch64-linux-gnu/
./usr/share/qemu/aarch64-linux-gnu/opensbi-riscv64-generic-fw_dynamic.bin
./usr/share/qemu/aarch64-linux-gnu/efi-virtio.rom
./usr/share/qemu/aarch64-linux-gnu/keymaps/
./usr/share/qemu/aarch64-linux-gnu/keymaps/en-us
./usr/share/webrtc/
./usr/share/webrtc/assets/
./usr/share/webrtc/assets/style.css
./usr/share/webrtc/assets/index.css
./usr/share/webrtc/assets/index.html
./usr/share/webrtc/assets/js/
./usr/share/webrtc/assets/js/location.js
./usr/share/webrtc/assets/js/rootcanal.js
./usr/share/webrtc/assets/js/app.js
./usr/share/webrtc/assets/js/touch.js
./usr/share/webrtc/assets/js/adb.js
./usr/share/webrtc/assets/js/index.js
./usr/share/webrtc/assets/js/cf_webrtc.js
./usr/share/webrtc/assets/js/server_connector.js
./usr/share/webrtc/assets/js/controls.js
./usr/share/webrtc/assets/controls.css
./usr/share/webrtc/assets/custom.css
./usr/share/webrtc/assets/client.html
./usr/share/webrtc/certs/
./usr/share/webrtc/certs/server.p12
./usr/share/webrtc/certs/server.key
./usr/share/webrtc/certs/trusted.pem
./usr/share/webrtc/certs/server.crt
./usr/share/zoneinfo/
./usr/share/zoneinfo/tzdata
./usr/share/crosvm/
./usr/share/crosvm/aarch64-linux-gnu/
./usr/share/crosvm/aarch64-linux-gnu/seccomp/
./usr/share/crosvm/aarch64-linux-gnu/seccomp/snd_null_device.policy
./usr/share/crosvm/aarch64-linux-gnu/seccomp/gpu_render_server.policy
./usr/share/crosvm/aarch64-linux-gnu/seccomp/battery.policy
./usr/share/crosvm/aarch64-linux-gnu/seccomp/block_device.policy
./usr/share/crosvm/aarch64-linux-gnu/seccomp/pmem_device.policy
./usr/share/crosvm/aarch64-linux-gnu/seccomp/wl_device.policy
./usr/share/crosvm/aarch64-linux-gnu/seccomp/9p_device.policy
./usr/share/crosvm/aarch64-linux-gnu/seccomp/input_device.policy
./usr/share/crosvm/aarch64-linux-gnu/seccomp/net_device.policy
./usr/share/crosvm/aarch64-linux-gnu/seccomp/rng_device.policy
./usr/share/crosvm/aarch64-linux-gnu/seccomp/coiommu_device.policy
./usr/share/crosvm/aarch64-linux-gnu/seccomp/gpu_device.policy
./usr/share/crosvm/aarch64-linux-gnu/seccomp/serial_device.policy
./usr/share/crosvm/aarch64-linux-gnu/seccomp/cras_audio_device.policy
./usr/share/crosvm/aarch64-linux-gnu/seccomp/null_audio_device.policy
./usr/share/crosvm/aarch64-linux-gnu/seccomp/snd_cras_device.policy
./usr/share/crosvm/aarch64-linux-gnu/seccomp/vhost_scmi_device.policy
./usr/share/crosvm/aarch64-linux-gnu/seccomp/balloon_device.policy
./usr/share/crosvm/aarch64-linux-gnu/seccomp/vhost_net_device.policy
./usr/share/crosvm/aarch64-linux-gnu/seccomp/vhost_vsock_device.policy
./usr/share/crosvm/aarch64-linux-gnu/seccomp/fs_device.policy
./usr/share/crosvm/aarch64-linux-gnu/seccomp/video_device.policy
./usr/share/crosvm/aarch64-linux-gnu/seccomp/xhci_device.policy
./usr/share/crosvm/aarch64-linux-gnu/seccomp/vios_audio_device.policy
./bin/
./bin/modem_simulator
./bin/ms-tpm-20-ref
./bin/mkenvimage_slim
./bin/metrics
./bin/socket_vsock_proxy
./bin/resize.f2fs
./bin/metrics_launcher
./bin/automotive_vsock_proxy
./bin/newfs_msdos
./bin/netsim-ui/
./bin/netsim-ui/assets/
./bin/netsim-ui/assets/grid-background.svg
./bin/netsim-ui/assets/netsim-logo.svg
./bin/netsim-ui/assets/polar-background.svg
./bin/netsim-ui/assets/hexagonal-background.png
./bin/netsim-ui/assets/netsim-logo-b.svg
./bin/netsim-ui/node_modules/
./bin/netsim-ui/node_modules/tslib/
./bin/netsim-ui/node_modules/tslib/tslib.es6.js
./bin/netsim-ui/index.html
./bin/netsim-ui/js/
./bin/netsim-ui/js/device-info.js
./bin/netsim-ui/js/device-list.js
./bin/netsim-ui/js/packet-info.js
./bin/netsim-ui/js/device-dropzone.js
./bin/netsim-ui/js/navigation-bar.js
./bin/netsim-ui/js/device-map.js
./bin/netsim-ui/js/device-dragzone.js
./bin/netsim-ui/js/netsim-app.js
./bin/netsim-ui/js/customize-map-button.js
./bin/netsim-ui/js/device-observer.js
./bin/netsim-ui/js/license-info.js
./bin/netsim-ui/js/cube-sprite.js
./bin/netsim-ui/js/pyramid-sprite.js
./bin/unpack_bootimg
./bin/adb
./bin/extract-vmlinux
./bin/health
./bin/screen_recording_server
./bin/lz4
./bin/wmediumd_gen_config
./bin/gnss_grpc_proxy
./bin/simg2img
./bin/secure_env
./bin/mke2fs
./bin/snapshot_util_cvd
./bin/cvd_internal_display
./bin/acloud_translator
./bin/defrag.f2fs
./bin/tombstone_receiver
./bin/root-canal
./bin/netsimd
./bin/console_forwarder
./bin/powerwash_cvd
./bin/process_restarter
./bin/fsck.f2fs
./bin/cvd_host_bugreport
./bin/extract-ikconfig
./bin/cvd_internal_status
./bin/webRTC
./bin/acloud
./bin/tcp_connector
./bin/process_sandboxer
./bin/webrtc_operator
./bin/cvd_update_location
./bin/e2fsdroid
./bin/avbtool
./bin/fastboot
./bin/build_super_image
./bin/powerbtn_cvd
./bin/allocd_client
./bin/dump.f2fs
./bin/netsim
./bin/casimir
./bin/pica
./bin/cvd_update_security_algorithm
./bin/record_cvd
./bin/vhal_proxy_server
./bin/cvd_status
./bin/cvd_import_locations
./bin/launch_cvd
./bin/cvd_internal_start
./bin/restart_cvd
./bin/cvd_internal_host_bugreport
./bin/mkuserimg_mke2fs
./bin/fec
./bin/cvd_internal_env
./bin/vhost_device_vsock
./bin/cvd_internal_stop
./bin/cvd_send_sms
./bin/assemble_cvd
./bin/cvd_send_id_disclosure
./bin/mcopy
./bin/operator_proxy
./bin/mkbootfs
./bin/run_cvd
./bin/openwrt_control_server
./bin/mkbootimg
./bin/kernel_log_monitor
./bin/mmd
./bin/toybox
./bin/crosvm
./bin/aarch64-linux-musl/
./bin/aarch64-linux-musl/crosvm
./bin/sefcontext_compile
./bin/wmediumd
./bin/echo_server
./bin/log_tee
./bin/lpmake
./bin/logcat_receiver
./bin/lpunpack
./bin/control_env_proxy_server
./bin/mtools
./bin/adb_connector
./bin/aarch64-linux-gnu/
./bin/aarch64-linux-gnu/libepoxy.so.0
./bin/aarch64-linux-gnu/libffi.so.7
./bin/aarch64-linux-gnu/qemu/
./bin/aarch64-linux-gnu/qemu/qemu-system-x86_64
./bin/aarch64-linux-gnu/qemu/libepoxy.so.0
./bin/aarch64-linux-gnu/qemu/libvirglrenderer.so.1
./bin/aarch64-linux-gnu/qemu/libgbm.so.1
./bin/aarch64-linux-gnu/qemu/libgfxstream_backend.so.0
./bin/aarch64-linux-gnu/qemu/librutabaga_gfx_ffi.so.0
./bin/aarch64-linux-gnu/qemu/qemu-system-riscv64
./bin/aarch64-linux-gnu/qemu/qemu-system-aarch64
./bin/aarch64-linux-gnu/qemu/libc++.so.1
./bin/aarch64-linux-gnu/qemu/libunwind.so.1
./bin/aarch64-linux-gnu/qemu/libz.so.1
./bin/aarch64-linux-gnu/qemu/libc++abi.so.1
./bin/aarch64-linux-gnu/libvirglrenderer.so.1
./bin/aarch64-linux-gnu/libdrm.so.2
./bin/aarch64-linux-gnu/libgbm.so.1
./bin/aarch64-linux-gnu/libgfxstream_backend.so
./bin/aarch64-linux-gnu/libwayland-client.so.0
./bin/aarch64-linux-gnu/libminijail.so
./bin/aarch64-linux-gnu/gfxstream_graphics_detector
./bin/aarch64-linux-gnu/crosvm
./bin/lpadd
./bin/make_f2fs
./bin/sandboxer_proxy
./bin/stop_cvd
./bin/casimir_control_server


ziomario@Z390-AORUS-PRO-DEST:
/mnt/zroot-133/_OS/Android/aosp_14/android-image$ HOME=3D$(pwd)
./bin/launch_cvd -vm_manager qemu_cli -report_anonymous_usage_stats=3Dn
--start_webrtc=3Dfalse


09-02 23:27:10.473 2729990 2729990 I launch_cvd: main.cc:235 Using
system_image_dir of:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
NOTICE:

By using this Android Virtual Device, you agree to
Google Terms of Service (https://policies.google.com/terms).
The Google Privacy Policy (https://policies.google.com/privacy)
describes how Google handles information generated as you use
Google Services.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Reading --config option from:
/mnt/zroot-133/_OS/Android/aosp_14/android-image/android-info.txt
Launching CVD using --config=3D'phone'.
aarch64-binfmt-P: Could not open '/lib/ld-linux-aarch64.so.1': No such file
or directory
Failed to run graphics detector, bad return value: 255. Assuming no
availability.
GPU auto mode: did not detect prerequisites for accelerated rendering
support, enabling --gpu_mode=3Dguest_swiftshader.
GPU vhost user auto mode: not needed for --gpu_mode=3Dguest_swiftshader. No=
t
enabling vhost user gpu.
Requested resuming a previous session (the default behavior) but the base
images have changed under the overlay, making the overlay inc
ompatible. Wiping the overlay files.
Path for instance UDS: /tmp/cf_avd_1000
Failed to run `/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/crosvm
create_qcow2 --backing-file /mnt/zroot-133/_OS/Android/aosp_
14/android-image/cuttlefish/instances/cvd-1/persistent_composite.img
/mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/instan
ces/cvd-1/persistent_composite_overlay.img`
stdout:
###

###
stderr:
###
/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/crosvm: riga 3:
/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/x86_64-linux-
musl/crosvm: File o directory non esistente

###
Return code: "127"
qemu: uncaught target signal 6 (Aborted) - core dumped
09-02 23:27:31.223 2729990 2729990 E launch_cvd: subprocess.cpp:207
Subprocess 2730018 was interrupted by a signal 'Aborted' (6)
09-02 23:27:31.224 2729990 2729990 E launch_cvd: main.cc:323 assemble_cvd
returned -1

On Mon, Sep 2, 2024 at 11:20=E2=80=AFPM Mario Marietto <marietto2008@gmail.=
com>
wrote:

> Hello.
>
> I've downloaded this file : aosp_cf_arm64_only_phone-img-12309296.zip and
> this file : cvd-host_package.tar.gz
>
> from here :
> https://ci.android.com/builds/submitted/12309296/aosp_cf_arm64_only_phone=
-trunk_staging-userdebug/latest
>
> But let's say that I don't want to use the *.img files that are stored
> inside "aosp_cf_arm64_only_phone-img-12309296.zip",but the same files tha=
t
> have been produced when I have compiled this version of Android :
>
>
> https://github.com/raspberry-vanilla/android_local_manifest?tab=3Dreadme-=
ov-file
>
> Can I do it ? Is it supposed to work the same ?
>
> Thanks.
>
> On Mon, Sep 2, 2024 at 10:23=E2=80=AFPM Pierrick Bouvier <
> pierrick.bouvier@linaro.org> wrote:
>
>>
>>
>> On 9/2/24 13:20, Pierrick Bouvier wrote:
>> > On 9/2/24 12:53, Mario Marietto wrote:
>> >> Hello Pierrick.
>> >>
>> >> With Cuttlefish can I emulate Android 14 for arm64 ? I ask because in
>> >> your script I read :
>> >>
>> >> "|/home/user/.work/qemu/build/qemu-system-x86_64", so,I suspect that
>> you
>> >> have emulated Android x64 bit,but I need arm64. |
>> >>
>> >
>> > Yes, it works for both architecture. The only thing I didn't try is an
>> > arm64 vm accelerated with kvm (I don't have this a linux-aarch64
>> > machine), but it should work.
>>
>> And of course, if you want to write a custom wrapper for qemu, name it
>> qemu-system-aarch64, and call the same binary instead of x86_64 variants=
.
>>
>> >
>> >> I also read "for aarch64 images: select
>> >> |aosp_cf_arm64_only_phone-trunk_staging-userdebug" : I'm not able to
>> >> download this kind of images. I don't understand how the Branch Grid
>> >> works. Can you explain to me a little bit more ?
>> >> |
>> >
>> > You have a link just next to it ("Branch grid") on the wiki page.
>> > Once on ci android page, click on filter button (three bars, inverted
>> > pyramid), and select aosp_cf_arm64_only_phone-trunk_staging-userdebug.
>> > Then go to artifacts, and download image and cvd_host_x86_64 package, =
as
>> > wiki mentions.
>> >
>> > Don't hesitate to ask more questions on this. I imagine this topic mig=
ht
>> > interest some people who try to do the same thing.
>> >
>> > Pierrick
>> >
>> >> |
>> >> |
>> >>
>> >>
>> >> On Mon, Sep 2, 2024 at 8:47=E2=80=AFPM Pierrick Bouvier
>> >> <pierrick.bouvier@linaro.org <mailto:pierrick.bouvier@linaro.org>>
>> wrote:
>> >>
>> >>      Hello Mario,
>> >>
>> >>      very recently, I had to investigate booting time of Android when
>> using
>> >>      QEMU. You can probably manage to boot this with only QEMU alone,
>> but in
>> >>      my experience, using Cuttlefish tooling is an easier approach.
>> >>
>> >>      If you really want to use only QEMU, you can use Cuttlefish to g=
et
>> >>      exact
>> >>      command line used (which disk goes where), and iterate from that=
.
>> >>
>> >>      Instructions:
>> >>
>> https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+Andr=
oid+using+QEMU
>> <
>> https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+Andr=
oid+using+QEMU
>> >
>> >>
>> >>      As you'll see, I could not get a direct graphic output, but usin=
g
>> >>      scrcpy, it worked well for me. Hope it can fit your use case.
>> >>
>> >>      Regards,
>> >>      Pierrick
>> >>
>> >>      On 9/2/24 06:49, Mario Marietto wrote:
>> >>       > Hello.
>> >>       >
>> >>       > I would like to emulate Android 14 on my Ubuntu 24.04 OS X64
>> bit
>> >>      using
>> >>       > qemu-system-aarch64. I tried using the following parameters :
>> >>       >
>> >>       > qemu-system-aarch64 \
>> >>       >          -smp 4 \
>> >>       >          -m 2048 \
>> >>       >          -cpu cortex-a72 \
>> >>       >          -M virt \
>> >>       >          -device virtio-gpu-pci,xres=3D1024,yres=3D768 \
>> >>       >          -display sdl,gl=3Don \
>> >>       >          -device usb-ehci \
>> >>       >          -device usb-kbd \
>> >>       >          -device virtio-tablet-pci \
>> >>       >          -usb \
>> >>       >          -serial stdio \
>> >>       >          -kernel /mnt/zroot-133/_OS/Android/rpi4/Image \
>> >>       >          -initrd /mnt/zroot-133/_OS/Android/rpi4/ramdisk.img =
\
>> >>       >          -drive
>> >>       >
>> >>
>> index=3D0,if=3Dnone,id=3Dsystem,file=3D/mnt/zroot-133/_OS/Android/rpi4/b=
oot.img \
>> >>       >          -device virtio-blk-pci,drive=3Dboot \
>> >>       >          -drive
>> >>       >
>> >>
>> index=3D1,if=3Dnone,id=3Dsystem,file=3D/mnt/zroot-133/_OS/Android/rpi4/s=
ystem.img \
>> >>       >          -device virtio-blk-pci,drive=3Dsystem \
>> >>       >          -drive
>> >>       >
>> >>
>> index=3D2,if=3Dnone,id=3Dvendor,file=3D/mnt/zroot-133/_OS/Android/rpi4/v=
endor.img \
>> >>       >          -device virtio-blk-pci,drive=3Dvendor \
>> >>       > -append "console=3DttyAMA0,38400 drm.debug=3D0x0 rootwait
>> rootdelay=3D5
>> >>       > root=3D/dev/mmcblk0p2 androidboot.hardware=3Drpi4
>> >>       > androidboot.selinux=3Dpermissive security=3Dselinux selinux=
=3D1
>> >>       > androidboot.qemu.hw.mainkeys=3D0 androidboot.lcd.density=3D16=
0"
>> >>       >
>> >>       > The error I get in short is :
>> >>       >
>> >>       > [ 1.993668] init: bool
>> >>       >
>> >>
>> android::init::BlockDevInitializer::InitDevices(std::set<std::string>):
>> >>       > partition(s) not found in /sys, waiting for their uevent(s):
>> >>      mmcblk0p2,
>> >>       > mmcblk0p3
>> >>       >
>> >>       >
>> >>       > One user suggested to :
>> >>       >
>> >>       >
>> >>       >
>> >>       >
>> >>       >
>> >>       > Hi!!! The "/sys" is a "dynamic fs" created at ram from the
>> >>      kernel, to
>> >>       > export a lot of things...so most of the files only exist at
>> runtime.
>> >>       > Normally, the partitions from the block device have a symlink
>> at
>> >>       > /sys/<something>/<...> that points to /dev/ block node. It
>> seems
>> >>      that
>> >>       > there are no such files under /sys according to what init is
>> looking
>> >>       > for. You can double check this at init source code to check t=
he
>> >>      exact
>> >>       > path but I'm guessing that you'll have to change the qemu
>> arguments
>> >>       > regarding the block device.
>> >>       >
>> >>       > About userdata.img I think it's normal since in the old days,
>> the
>> >>      image
>> >>       > was a "empty sparse image", that means, at the first flashing
>> >>      process,
>> >>       > there isn't userdata information, we're just "flashing the
>> >>      partition"
>> >>       > with empty data.
>> >>       > Tks!!!
>> >>       >
>> >>       >
>> >>       >
>> >>       > So,in short I should change the qemu arguments regarding the
>> block
>> >>       > device. I tried in this way :
>> >>       >
>> >>       >
>> >>       > qemu-system-aarch64 \
>> >>       >          -smp 4 \
>> >>       >          -m 2048 \
>> >>       >          -cpu cortex-a72 \
>> >>       >          -M virt \
>> >>       >          -device virtio-gpu-pci,xres=3D1024,yres=3D768 \
>> >>       >          -display sdl,gl=3Don \
>> >>       >          -device usb-ehci \
>> >>       >          -device usb-kbd \
>> >>       >          -device virtio-tablet-pci \
>> >>       >          -usb \
>> >>       >          -serial stdio \
>> >>       >          -kernel /mnt/zroot-133/_OS/Android/rpi4/Image \
>> >>       >          -initrd /mnt/zroot-133/_OS/Android/rpi4/ramdisk.img =
\
>> >>       >          -hda /mnt/zroot-133/_OS/Android/rpi4/boot.img \
>> >>       >          -hdb /mnt/zroot-133/_OS/Android/rpi4/system.img \
>> >>       >          -hdc /mnt/zroot-133/_OS/Android/rpi4/vendor.img \
>> >>       >        -append "console=3DttyAMA0,38400 drm.debug=3D0x0 rootw=
ait
>> >>      rootdelay=3D5
>> >>       > root=3D/dev/mmcblk0p2 androidboot.hardware=3Drpi4
>> >>       > androidboot.selinux=3Dpermissive security=3Dselinux selinux=
=3D1
>> >>       > androidboot.qemu.hw.mainkeys=3D0 androidboot.lcd.density=3D16=
0"
>> >>       >
>> >>       >
>> >>       > but the error is still there. Do you know some different
>> alternative
>> >>       > block devices to try ? thanks.
>> >>       >
>> >>       >
>> >>       > --
>> >>       > Mario.
>> >>
>> >>
>> >>
>> >> --
>> >> Mario.
>>
>
>
> --
> Mario.
>


--=20
Mario.

--000000000000b3773e062129a902
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span style=3D"font-family:monospace"><span style=3D"=
font-weight:bold;color:rgb(84,255,84);background-color:rgb(255,255,255)">So=
mething is not right :</span></span></div><div><span style=3D"font-family:m=
onospace"><span style=3D"font-weight:bold;color:rgb(84,255,84);background-c=
olor:rgb(255,255,255)"><br></span></span></div><div><span style=3D"font-fam=
ily:monospace"><span style=3D"font-weight:bold;color:rgb(84,255,84);backgro=
und-color:rgb(255,255,255)">ziomario@Z390-AORUS-PRO-DEST</span><span style=
=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">:</span><span style=
=3D"font-weight:bold;color:rgb(84,84,255);background-color:rgb(255,255,255)=
">/mnt/zroot-133/_OS/Android/aosp_14/android-image</span><span style=3D"col=
or:rgb(0,0,0);background-color:rgb(255,255,255)">$ unzip ../aosp_cf_*.zip
</span></span></div><div><span style=3D"font-family:monospace"></span></div=
><div><span style=3D"font-family:monospace"><br></span></div><div><span sty=
le=3D"font-family:monospace">Archive: =C2=A0../aosp_cf_arm64_only_phone-img=
-12309296.zip
</span></div><div><span style=3D"font-family:monospace"></span></div><span =
style=3D"font-family:monospace"> =C2=A0inflating: android-info.txt =C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br> =C2=A0inflating: fastboot-in=
fo.txt =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br> =C2=A0inflating: kern=
el_16k =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0<br> =C2=A0inflating: ramdisk_16k.img =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br> =C2=A0inflating: boot.img =C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0<br> =C2=A0inflating: boot_16k.img =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br> =C2=A0inflating: bootl=
oader =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0<br> =C2=A0inflating: init_boot.img =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br> =C2=A0inflating: userdata.im=
g =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<=
br> =C2=A0inflating: vbmeta.img =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br> =C2=A0inflating: vbmeta_syst=
em.img =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br> =C2=A0inflating: vbme=
ta_system_dlkm.img =C2=A0=C2=A0<br> =C2=A0inflating: vbmeta_vendor_dlkm.img=
 =C2=A0=C2=A0<br> =C2=A0inflating: vendor_boot.img =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br></span><div><span style=3D"font-family:mo=
nospace"> =C2=A0inflating: super.img =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0</span><=
/div><div><span style=3D"font-family:monospace">=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br></span></div><div><span style=3D"font-famil=
y:monospace"></span></div><div><span style=3D"font-family:monospace"><span =
style=3D"font-weight:bold;color:rgb(84,255,84);background-color:rgb(255,255=
,255)">ziomario@Z390-AORUS-PRO-DEST</span><span style=3D"color:rgb(0,0,0);b=
ackground-color:rgb(255,255,255)">:</span><span style=3D"font-weight:bold;c=
olor:rgb(84,84,255);background-color:rgb(255,255,255)">/mnt/zroot-133/_OS/A=
ndroid/aosp_14/android-image</span><span style=3D"color:rgb(0,0,0);backgrou=
nd-color:rgb(255,255,255)">$ tar xzvf ../cvd-host_package.tar.gz
</span></span></div><br><div><br><span style=3D"font-family:monospace"></sp=
an></div><span style=3D"font-family:monospace">./
<br>./lib64/
<br>./lib64/<a href=3D"mailto:android.hardware.keymaster@3.0.so">android.ha=
rdware.keymaster@3.0.so</a>
<br>./lib64/<a href=3D"http://libciborium_io.dylib.so">libciborium_io.dylib=
.so</a>
<br>./lib64/libjpeg.so
<br>./lib64/cuttlefish_net.so
<br>./lib64/libbase.so
<br>./lib64/<a href=3D"http://vulkan.pastel.so">vulkan.pastel.so</a>
<br>./lib64/libcuttlefish_host_config.so
<br>./lib64/<a href=3D"http://libflagset.dylib.so">libflagset.dylib.so</a>
<br>./lib64/<a href=3D"http://libkmr_common.dylib.so">libkmr_common.dylib.s=
o</a>
<br>./lib64/<a href=3D"http://libpkcs1.dylib.so">libpkcs1.dylib.so</a>
<br>./lib64/libicui18n-host.so
<br>./lib64/libwayland_client.so
<br>./lib64/libunwindstack.so
<br>./lib64/<a href=3D"http://libkmr_ta.dylib.so">libkmr_ta.dylib.so</a>
<br>./lib64/<a href=3D"http://libcoset.dylib.so">libcoset.dylib.so</a>
<br>./lib64/libcppbor.so
<br>./lib64/libgatekeeper.so
<br>./lib64/libyuv.so
<br>./lib64/libgrpc++.so
<br>./lib64/libkmr_cf_ffi.so
<br>./lib64/libcppcose_rkp.so
<br>./lib64/libcuttlefish_transport.so
<br>./lib64/liblzma.so
<br>./lib64/<a href=3D"http://libciborium_ll.dylib.so">libciborium_ll.dylib=
.so</a>
<br>./lib64/libcuttlefish_allocd_utils.so
<br>./lib64/libgflags.so
<br>./lib64/<a href=3D"mailto:android.hardware.keymaster@4.0.so">android.ha=
rdware.keymaster@4.0.so</a>
<br>./lib64/<a href=3D"http://libcfg_if.dylib.so">libcfg_if.dylib.so</a>
<br>./lib64/<a href=3D"http://libspki.dylib.so">libspki.dylib.so</a>
<br>./lib64/<a href=3D"http://libzeroize.dylib.so">libzeroize.dylib.so</a>
<br>./lib64/libcgrouprc.so
<br>./lib64/libprotobuf-cpp-full.so
<br>./lib64/libcutils.so
<br>./lib64/libsqlite.so
<br>./lib64/libcuttlefish_utils_result.so
<br>./lib64/libbinder_ndk.so
<br>./lib64/libext2_uuid-host.so
<br>./lib64/<a href=3D"http://libhex.dylib.so">libhex.dylib.so</a>
<br>./lib64/libc_musl.so
<br>./lib64/<a href=3D"http://libconst_oid.dylib.so">libconst_oid.dylib.so<=
/a>
<br>./lib64/<a href=3D"http://libprotobuf_support.dylib.so">libprotobuf_sup=
port.dylib.so</a>
<br>./lib64/tpm2-tss2-tcti.so
<br>./lib64/<a href=3D"http://libserde.dylib.so">libserde.dylib.so</a>
<br>./lib64/libartpalette.so
<br>./lib64/liblog.so
<br>./lib64/<a href=3D"http://libonce_cell.dylib.so">libonce_cell.dylib.so<=
/a>
<br>./lib64/<a href=3D"http://libthiserror.dylib.so">libthiserror.dylib.so<=
/a>
<br>./lib64/libssl-host.so
<br>./lib64/libc++.so
<br>./lib64/libext4_utils.so
<br>./lib64/<a href=3D"http://libpkcs8.dylib.so">libpkcs8.dylib.so</a>
<br>./lib64/libsparse-host.so
<br>./lib64/sandboxed_api_sandbox2.so
<br>./lib64/libcuttlefish_command_util.so
<br>./lib64/<a href=3D"http://libbssl_sys.dylib.so">libbssl_sys.dylib.so</a=
>
<br>./lib64/libkeymaster_messages.so
<br>./lib64/libcuttlefish_web.so
<br>./lib64/libvpx.so
<br>./lib64/libopus.so
<br>./lib64/libminijail.so
<br>./lib64/libcurl-host.so
<br>./lib64/libcuttlefish_kernel_log_monitor_utils.so
<br>./lib64/tpm2-tss2-util.so
<br>./lib64/<a href=3D"http://liblibc.dylib.so">liblibc.dylib.so</a>
<br>./lib64/<a href=3D"http://libprotobuf.dylib.so">libprotobuf.dylib.so</a=
>
<br>./lib64/<a href=3D"http://libbitflags.dylib.so">libbitflags.dylib.so</a=
>
<br>./lib64/libutils.so
<br>./lib64/libjsoncpp.so
<br>./lib64/libext2_blkid-host.so
<br>./lib64/libnl.so
<br>./lib64/tpm2-tss2-sys.so
<br>./lib64/libartbase.so
<br>./lib64/libxml2.so
<br>./lib64/<a href=3D"http://libkmr_proto_rust.dylib.so">libkmr_proto_rust=
.dylib.so</a>
<br>./lib64/libcuttlefish_security.so
<br>./lib64/<a href=3D"http://libsecure_env_tpm.dylib.so">libsecure_env_tpm=
.dylib.so</a>
<br>./lib64/libz-host.so
<br>./lib64/libprocessgroup.so
<br>./lib64/libcrypto_utils.so
<br>./lib64/<a href=3D"http://libder.dylib.so">libder.dylib.so</a>
<br>./lib64/libdexfile.so
<br>./lib64/cf_metrics_proto.so
<br>./lib64/tpm2-tss2-esys.so
<br>./lib64/libcuttlefish_utils.so
<br>./lib64/libkeymaster_portable.so
<br>./lib64/libfruit.so
<br>./lib64/tpm2-tss2-rc.so
<br>./lib64/libcap.so
<br>./lib64/<a href=3D"http://libnix.dylib.so">libnix.dylib.so</a>
<br>./lib64/libicuuc-host.so
<br>./lib64/libziparchive.so
<br>./lib64/<a href=3D"http://libkmr_ta_nonsecure.dylib.so">libkmr_ta_nonse=
cure.dylib.so</a>
<br>./lib64/<a href=3D"http://libstd.dylib.so">libstd.dylib.so</a>
<br>./lib64/<a href=3D"http://libhalf.dylib.so">libhalf.dylib.so</a>
<br>./lib64/tpm2-tss2-mu.so
<br>./lib64/<a href=3D"http://libmemoffset.dylib.so">libmemoffset.dylib.so<=
/a>
<br>./lib64/liblp.so
<br>./lib64/libcuttlefish_fs.so
<br>./lib64/libProxyConfig.so
<br>./lib64/<a href=3D"http://libopenssl.dylib.so">libopenssl.dylib.so</a>
<br>./lib64/<a href=3D"http://libkmr_wire.dylib.so">libkmr_wire.dylib.so</a=
>
<br>./lib64/<a href=3D"http://libkmr_crypto_boring.dylib.so">libkmr_crypto_=
boring.dylib.so</a>
<br>./lib64/<a href=3D"http://liblog_rust.dylib.so">liblog_rust.dylib.so</a=
>
<br>./lib64/libhidlbase.so
<br>./lib64/libgrpc_wrap.so
<br>./lib64/libgrpc++_unsecure.so
<br>./lib64/<a href=3D"http://libbytes.dylib.so">libbytes.dylib.so</a>
<br>./lib64/libsoft_attestation_cert.so
<br>./lib64/libcuttlefish_run_cvd_proto.so
<br>./lib64/libbinder.so
<br>./lib64/libcrypto-host.so
<br>./lib64/libwebm_mkvmuxer.so
<br>./lib64/<a href=3D"http://libkmr_cf.dylib.so">libkmr_cf.dylib.so</a>
<br>./lib64/<a href=3D"http://libciborium.dylib.so">libciborium.dylib.so</a=
>
<br>./lib64/libpuresoftkeymasterdevice_host.so
<br>./lib64/<a href=3D"http://libx509_cert.dylib.so">libx509_cert.dylib.so<=
/a>
<br>./lib64/<a href=3D"http://libsec1.dylib.so">libsec1.dylib.so</a>
<br>./nativetest64/
<br>./nativetest64/modem_simulator_test/
<br>./nativetest64/modem_simulator_test/modem_simulator_test
<br>./nativetest64/cuttlefish_net_tests/
<br>./nativetest64/cuttlefish_net_tests/cuttlefish_net_tests
<br>./etc/
<br>./etc/modem_simulator/
<br>./etc/modem_simulator/files/
<br>./etc/modem_simulator/files/iccprofile_for_sim0_for_CtsCarrierApiTestCa=
ses.xml
<br>./etc/modem_simulator/files/iccprofile_for_sim0.xml
<br>./etc/modem_simulator/files/numeric_operator.xml
<br>./etc/cvd_rsa4096.avbpubkey
<br>./etc/bootloader_aarch64/
<br>./etc/bootloader_aarch64/bootloader.qemu
<br>./etc/bootloader_aarch64/bootloader.crosvm
<br>./etc/bootloader_riscv64/
<br>./etc/bootloader_riscv64/bootloader.qemu
<br>./etc/automotive/
<br>./etc/automotive/vhalconfig/
<br>./etc/automotive/vhalconfig/VendorClusterTestProperties.json
<br>./etc/automotive/vhalconfig/DefaultProperties.json
<br>./etc/automotive/vhalconfig/TestProperties.json
<br>./etc/automotive/proxy_config.json
<br>./etc/cvd_rsa2048.avbpubkey
<br>./etc/cvd_avb_testkey_rsa4096.pem
<br>./etc/bootloader_arm/
<br>./etc/bootloader_arm/bootloader.qemu
<br>./etc/bootloader_x86_64/
<br>./etc/bootloader_x86_64/bootloader.qemu
<br>./etc/bootloader_x86_64/bootloader.crosvm
<br>./etc/cvd_avb_testkey_rsa2048.pem
<br>./etc/openwrt/
<br>./etc/openwrt/images/
<br>./etc/openwrt/images/openwrt_kernel_aarch64
<br>./etc/openwrt/images/openwrt_rootfs_x86_64
<br>./etc/openwrt/images/openwrt_rootfs_aarch64
<br>./etc/openwrt/images/openwrt_kernel_x86_64
<br>./etc/cvd_config/
<br>./etc/cvd_config/cvd_config_tv.json
<br>./etc/cvd_config/cvd_config_tablet.json
<br>./etc/cvd_config/cvd_config_wear.json
<br>./etc/cvd_config/cvd_config_auto_portrait.json
<br>./etc/cvd_config/cvd_config_slim.json
<br>./etc/cvd_config/cvd_config_go.json
<br>./etc/cvd_config/cvd_config_foldable.json
<br>./etc/cvd_config/cvd_config_auto.json
<br>./etc/cvd_config/cvd_config_auto_md.json
<br>./etc/cvd_config/cvd_config_phone.json
<br>./usr/
<br>./usr/share/
<br>./usr/share/vulkan/
<br>./usr/share/vulkan/icd.d/
<br>./usr/share/vulkan/icd.d/vk_swiftshader_icd.json
<br>./usr/share/qemu/
<br>./usr/share/qemu/aarch64-linux-gnu/
<br>./usr/share/qemu/aarch64-linux-gnu/opensbi-riscv64-generic-fw_dynamic.b=
in
<br>./usr/share/qemu/aarch64-linux-gnu/efi-virtio.rom
<br>./usr/share/qemu/aarch64-linux-gnu/keymaps/
<br>./usr/share/qemu/aarch64-linux-gnu/keymaps/en-us
<br>./usr/share/webrtc/
<br>./usr/share/webrtc/assets/
<br>./usr/share/webrtc/assets/style.css
<br>./usr/share/webrtc/assets/index.css
<br>./usr/share/webrtc/assets/index.html
<br>./usr/share/webrtc/assets/js/
<br>./usr/share/webrtc/assets/js/location.js
<br>./usr/share/webrtc/assets/js/rootcanal.js
<br>./usr/share/webrtc/assets/js/app.js
<br>./usr/share/webrtc/assets/js/touch.js
<br>./usr/share/webrtc/assets/js/adb.js
<br>./usr/share/webrtc/assets/js/index.js
<br>./usr/share/webrtc/assets/js/cf_webrtc.js
<br>./usr/share/webrtc/assets/js/server_connector.js
<br>./usr/share/webrtc/assets/js/controls.js
<br>./usr/share/webrtc/assets/controls.css
<br>./usr/share/webrtc/assets/custom.css
<br>./usr/share/webrtc/assets/client.html
<br>./usr/share/webrtc/certs/
<br>./usr/share/webrtc/certs/server.p12
<br>./usr/share/webrtc/certs/server.key
<br>./usr/share/webrtc/certs/trusted.pem
<br>./usr/share/webrtc/certs/server.crt
<br>./usr/share/zoneinfo/
<br>./usr/share/zoneinfo/tzdata
<br>./usr/share/crosvm/
<br>./usr/share/crosvm/aarch64-linux-gnu/
<br>./usr/share/crosvm/aarch64-linux-gnu/seccomp/
<br>./usr/share/crosvm/aarch64-linux-gnu/seccomp/snd_null_device.policy
<br>./usr/share/crosvm/aarch64-linux-gnu/seccomp/gpu_render_server.policy
<br>./usr/share/crosvm/aarch64-linux-gnu/seccomp/battery.policy
<br>./usr/share/crosvm/aarch64-linux-gnu/seccomp/block_device.policy
<br>./usr/share/crosvm/aarch64-linux-gnu/seccomp/pmem_device.policy
<br>./usr/share/crosvm/aarch64-linux-gnu/seccomp/wl_device.policy
<br>./usr/share/crosvm/aarch64-linux-gnu/seccomp/9p_device.policy
<br>./usr/share/crosvm/aarch64-linux-gnu/seccomp/input_device.policy
<br>./usr/share/crosvm/aarch64-linux-gnu/seccomp/net_device.policy
<br>./usr/share/crosvm/aarch64-linux-gnu/seccomp/rng_device.policy
<br>./usr/share/crosvm/aarch64-linux-gnu/seccomp/coiommu_device.policy
<br>./usr/share/crosvm/aarch64-linux-gnu/seccomp/gpu_device.policy
<br>./usr/share/crosvm/aarch64-linux-gnu/seccomp/serial_device.policy
<br>./usr/share/crosvm/aarch64-linux-gnu/seccomp/cras_audio_device.policy
<br>./usr/share/crosvm/aarch64-linux-gnu/seccomp/null_audio_device.policy
<br>./usr/share/crosvm/aarch64-linux-gnu/seccomp/snd_cras_device.policy
<br>./usr/share/crosvm/aarch64-linux-gnu/seccomp/vhost_scmi_device.policy
<br>./usr/share/crosvm/aarch64-linux-gnu/seccomp/balloon_device.policy
<br>./usr/share/crosvm/aarch64-linux-gnu/seccomp/vhost_net_device.policy
<br>./usr/share/crosvm/aarch64-linux-gnu/seccomp/vhost_vsock_device.policy
<br>./usr/share/crosvm/aarch64-linux-gnu/seccomp/fs_device.policy
<br>./usr/share/crosvm/aarch64-linux-gnu/seccomp/video_device.policy
<br>./usr/share/crosvm/aarch64-linux-gnu/seccomp/xhci_device.policy
<br>./usr/share/crosvm/aarch64-linux-gnu/seccomp/vios_audio_device.policy
<br>./bin/
<br>./bin/modem_simulator
<br>./bin/ms-tpm-20-ref
<br>./bin/mkenvimage_slim
<br>./bin/metrics
<br>./bin/socket_vsock_proxy
<br>./bin/resize.f2fs
<br>./bin/metrics_launcher
<br>./bin/automotive_vsock_proxy
<br>./bin/newfs_msdos
<br>./bin/netsim-ui/
<br>./bin/netsim-ui/assets/
<br>./bin/netsim-ui/assets/grid-background.svg
<br>./bin/netsim-ui/assets/netsim-logo.svg
<br>./bin/netsim-ui/assets/polar-background.svg
<br>./bin/netsim-ui/assets/hexagonal-background.png
<br>./bin/netsim-ui/assets/netsim-logo-b.svg
<br>./bin/netsim-ui/node_modules/
<br>./bin/netsim-ui/node_modules/tslib/
<br>./bin/netsim-ui/node_modules/tslib/tslib.es6.js
<br>./bin/netsim-ui/index.html
<br>./bin/netsim-ui/js/
<br>./bin/netsim-ui/js/device-info.js
<br>./bin/netsim-ui/js/device-list.js
<br>./bin/netsim-ui/js/packet-info.js
<br>./bin/netsim-ui/js/device-dropzone.js
<br>./bin/netsim-ui/js/navigation-bar.js
<br>./bin/netsim-ui/js/device-map.js
<br>./bin/netsim-ui/js/device-dragzone.js
<br>./bin/netsim-ui/js/netsim-app.js
<br>./bin/netsim-ui/js/customize-map-button.js
<br>./bin/netsim-ui/js/device-observer.js
<br>./bin/netsim-ui/js/license-info.js
<br>./bin/netsim-ui/js/cube-sprite.js
<br>./bin/netsim-ui/js/pyramid-sprite.js
<br>./bin/unpack_bootimg
<br>./bin/adb
<br>./bin/extract-vmlinux
<br>./bin/health
<br>./bin/screen_recording_server
<br>./bin/lz4
<br>./bin/wmediumd_gen_config
<br>./bin/gnss_grpc_proxy
<br>./bin/simg2img
<br>./bin/secure_env
<br>./bin/mke2fs
<br>./bin/snapshot_util_cvd
<br>./bin/cvd_internal_display
<br>./bin/acloud_translator
<br>./bin/defrag.f2fs
<br>./bin/tombstone_receiver
<br>./bin/root-canal
<br>./bin/netsimd
<br>./bin/console_forwarder
<br>./bin/powerwash_cvd
<br>./bin/process_restarter
<br>./bin/fsck.f2fs
<br>./bin/cvd_host_bugreport
<br>./bin/extract-ikconfig
<br>./bin/cvd_internal_status
<br>./bin/webRTC
<br>./bin/acloud
<br>./bin/tcp_connector
<br>./bin/process_sandboxer
<br>./bin/webrtc_operator
<br>./bin/cvd_update_location
<br>./bin/e2fsdroid
<br>./bin/avbtool
<br>./bin/fastboot
<br>./bin/build_super_image
<br>./bin/powerbtn_cvd
<br>./bin/allocd_client
<br>./bin/dump.f2fs
<br>./bin/netsim
<br>./bin/casimir
<br>./bin/pica
<br>./bin/cvd_update_security_algorithm
<br>./bin/record_cvd
<br>./bin/vhal_proxy_server
<br>./bin/cvd_status
<br>./bin/cvd_import_locations
<br>./bin/launch_cvd
<br>./bin/cvd_internal_start
<br>./bin/restart_cvd
<br>./bin/cvd_internal_host_bugreport
<br>./bin/mkuserimg_mke2fs
<br>./bin/fec
<br>./bin/cvd_internal_env
<br>./bin/vhost_device_vsock
<br>./bin/cvd_internal_stop
<br>./bin/cvd_send_sms
<br>./bin/assemble_cvd
<br>./bin/cvd_send_id_disclosure
<br>./bin/mcopy
<br>./bin/operator_proxy
<br>./bin/mkbootfs
<br>./bin/run_cvd
<br>./bin/openwrt_control_server
<br>./bin/mkbootimg
<br>./bin/kernel_log_monitor
<br>./bin/mmd
<br>./bin/toybox
<br>./bin/crosvm
<br>./bin/aarch64-linux-musl/
<br>./bin/aarch64-linux-musl/crosvm
<br>./bin/sefcontext_compile
<br>./bin/wmediumd
<br>./bin/echo_server
<br>./bin/log_tee
<br>./bin/lpmake
<br>./bin/logcat_receiver
<br>./bin/lpunpack
<br>./bin/control_env_proxy_server
<br>./bin/mtools
<br>./bin/adb_connector
<br>./bin/aarch64-linux-gnu/
<br>./bin/aarch64-linux-gnu/libepoxy.so.0
<br>./bin/aarch64-linux-gnu/libffi.so.7
<br>./bin/aarch64-linux-gnu/qemu/
<br>./bin/aarch64-linux-gnu/qemu/qemu-system-x86_64
<br>./bin/aarch64-linux-gnu/qemu/libepoxy.so.0
<br>./bin/aarch64-linux-gnu/qemu/libvirglrenderer.so.1
<br>./bin/aarch64-linux-gnu/qemu/libgbm.so.1
<br>./bin/aarch64-linux-gnu/qemu/libgfxstream_backend.so.0
<br>./bin/aarch64-linux-gnu/qemu/librutabaga_gfx_ffi.so.0
<br>./bin/aarch64-linux-gnu/qemu/qemu-system-riscv64
<br>./bin/aarch64-linux-gnu/qemu/qemu-system-aarch64
<br>./bin/aarch64-linux-gnu/qemu/libc++.so.1
<br>./bin/aarch64-linux-gnu/qemu/libunwind.so.1
<br>./bin/aarch64-linux-gnu/qemu/libz.so.1
<br>./bin/aarch64-linux-gnu/qemu/libc++abi.so.1
<br>./bin/aarch64-linux-gnu/libvirglrenderer.so.1
<br>./bin/aarch64-linux-gnu/libdrm.so.2
<br>./bin/aarch64-linux-gnu/libgbm.so.1
<br>./bin/aarch64-linux-gnu/libgfxstream_backend.so
<br>./bin/aarch64-linux-gnu/libwayland-client.so.0
<br>./bin/aarch64-linux-gnu/libminijail.so
<br>./bin/aarch64-linux-gnu/gfxstream_graphics_detector
<br>./bin/aarch64-linux-gnu/crosvm
<br>./bin/lpadd
<br>./bin/make_f2fs
<br>./bin/sandboxer_proxy
<br>./bin/stop_cvd
<br></span><div><span style=3D"font-family:monospace">./bin/casimir_control=
_server
</span></div><br><div><br><span style=3D"font-family:monospace"></span></di=
v><div><span style=3D"font-family:monospace"><span style=3D"font-weight:bol=
d;color:rgb(84,255,84);background-color:rgb(255,255,255)">ziomario@Z390-AOR=
US-PRO-DEST</span><span style=3D"color:rgb(0,0,0);background-color:rgb(255,=
255,255)">:</span><span style=3D"font-weight:bold;color:rgb(84,84,255);back=
ground-color:rgb(255,255,255)">/mnt/zroot-133/_OS/Android/aosp_14/android-i=
mage</span><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)">$ HOME=3D$(pwd) ./bin/launch_cvd -vm_manager qemu_cli -repor</span>t_ano=
nymous_usage_stats=3Dn --start_webrtc=3Dfalse
</span></div><br><div><br><span style=3D"font-family:monospace"></span></di=
v><span style=3D"font-family:monospace">09-02 23:27:10.473 2729990 2729990 =
I launch_cvd: main.cc:235 Using system_image_dir of: =C2=A0<br>=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
<br>NOTICE:
<br>
<br>By using this Android Virtual Device, you agree to
<br>Google Terms of Service (<a href=3D"https://policies.google.com/terms">=
https://policies.google.com/terms</a>).
<br>The Google Privacy Policy (<a href=3D"https://policies.google.com/priva=
cy">https://policies.google.com/privacy</a>)
<br>describes how Google handles information generated as you use
<br>Google Services.
<br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
<br>
<br>Reading --config option from: /mnt/zroot-133/_OS/Android/aosp_14/androi=
d-image/android-info.txt
<br>Launching CVD using --config=3D&#39;phone&#39;.
<br>aarch64-binfmt-P: Could not open &#39;/lib/ld-linux-aarch64.so.1&#39;: =
No such file or directory
<br>Failed to run graphics detector, bad return value: 255. Assuming no ava=
ilability.
<br>GPU auto mode: did not detect prerequisites for accelerated rendering s=
upport, enabling --gpu_mode=3Dguest_swiftshader.
<br>GPU vhost user auto mode: not needed for --gpu_mode=3Dguest_swiftshader=
. Not enabling vhost user gpu.
<br>Requested resuming a previous session (the default behavior) but the ba=
se images have changed under the overlay, making the overlay inc<br>ompatib=
le. Wiping the overlay files.
<br>Path for instance UDS: /tmp/cf_avd_1000
<br>Failed to run `/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/cro=
svm create_qcow2 --backing-file /mnt/zroot-133/_OS/Android/aosp_<br>14/andr=
oid-image/cuttlefish/instances/cvd-1/persistent_composite.img /mnt/zroot-13=
3/_OS/Android/aosp_14/android-image/cuttlefish/instan<br>ces/cvd-1/persiste=
nt_composite_overlay.img`
<br>stdout:
<br>###
<br>
<br>###
<br>stderr:
<br>###
<br>/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/crosvm: riga 3: /m=
nt/zroot-133/_OS/Android/aosp_14/android-image/bin/x86_64-linux-<br>musl/cr=
osvm: File o directory non esistente
<br>
<br>###
<br>Return code: &quot;127&quot;
<br>qemu: uncaught target signal 6 (Aborted) - core dumped
<br>09-02 23:27:31.223 2729990 2729990 E launch_cvd: subprocess.cpp:207 Sub=
process 2730018 was interrupted by a signal &#39;Aborted&#39; (6)
<br>09-02 23:27:31.224 2729990 2729990 E launch_cvd: main.cc:323 assemble_c=
vd returned -1</span></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Sep 2, 2024 at 11:20=E2=80=AFPM Mario Marietto=
 &lt;<a href=3D"mailto:marietto2008@gmail.com">marietto2008@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div d=
ir=3D"ltr"><div>Hello.</div><div><div><br></div><div>I&#39;ve downloaded th=
is file : aosp_cf_arm64_only_phone-img-12309296.zip and this file : cvd-hos=
t_package.tar.gz</div><div><div><br></div></div></div><div>from here : <a h=
ref=3D"https://ci.android.com/builds/submitted/12309296/aosp_cf_arm64_only_=
phone-trunk_staging-userdebug/latest" target=3D"_blank">https://ci.android.=
com/builds/submitted/12309296/aosp_cf_arm64_only_phone-trunk_staging-userde=
bug/latest</a></div><div></div><div><br></div><div>But let&#39;s say that I=
 don&#39;t want to use the *.img files that are stored inside &quot;aosp_cf=
_arm64_only_phone-img-12309296.zip&quot;,but the same files that have been =
produced when I have compiled this version of Android :</div><div><br></div=
><div><a href=3D"https://github.com/raspberry-vanilla/android_local_manifes=
t?tab=3Dreadme-ov-file" target=3D"_blank">https://github.com/raspberry-vani=
lla/android_local_manifest?tab=3Dreadme-ov-file</a></div><div><br></div><di=
v>Can I do it ? Is it supposed to work the same ? <br></div><div><br></div>=
<div>Thanks.<br></div><div><div></div></div></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 2, 2024 at 10:23=E2=
=80=AFPM Pierrick Bouvier &lt;<a href=3D"mailto:pierrick.bouvier@linaro.org=
" target=3D"_blank">pierrick.bouvier@linaro.org</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 9/2/24 13:20, Pierrick Bouvier wrote:<br>
&gt; On 9/2/24 12:53, Mario Marietto wrote:<br>
&gt;&gt; Hello Pierrick.<br>
&gt;&gt;<br>
&gt;&gt; With Cuttlefish can I emulate Android 14 for arm64 ? I ask because=
 in<br>
&gt;&gt; your script I read :<br>
&gt;&gt;<br>
&gt;&gt; &quot;|/home/user/.work/qemu/build/qemu-system-x86_64&quot;, so,I =
suspect that you<br>
&gt;&gt; have emulated Android x64 bit,but I need arm64. |<br>
&gt;&gt;<br>
&gt; <br>
&gt; Yes, it works for both architecture. The only thing I didn&#39;t try i=
s an<br>
&gt; arm64 vm accelerated with kvm (I don&#39;t have this a linux-aarch64<b=
r>
&gt; machine), but it should work.<br>
<br>
And of course, if you want to write a custom wrapper for qemu, name it <br>
qemu-system-aarch64, and call the same binary instead of x86_64 variants.<b=
r>
<br>
&gt; <br>
&gt;&gt; I also read &quot;for aarch64 images: select<br>
&gt;&gt; |aosp_cf_arm64_only_phone-trunk_staging-userdebug&quot; : I&#39;m =
not able to<br>
&gt;&gt; download this kind of images. I don&#39;t understand how the Branc=
h Grid<br>
&gt;&gt; works. Can you explain to me a little bit more ?<br>
&gt;&gt; |<br>
&gt; <br>
&gt; You have a link just next to it (&quot;Branch grid&quot;) on the wiki =
page.<br>
&gt; Once on ci android page, click on filter button (three bars, inverted<=
br>
&gt; pyramid), and select aosp_cf_arm64_only_phone-trunk_staging-userdebug.=
<br>
&gt; Then go to artifacts, and download image and cvd_host_x86_64 package, =
as<br>
&gt; wiki mentions.<br>
&gt; <br>
&gt; Don&#39;t hesitate to ask more questions on this. I imagine this topic=
 might<br>
&gt; interest some people who try to do the same thing.<br>
&gt; <br>
&gt; Pierrick<br>
&gt; <br>
&gt;&gt; |<br>
&gt;&gt; |<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Mon, Sep 2, 2024 at 8:47=E2=80=AFPM Pierrick Bouvier<br>
&gt;&gt; &lt;<a href=3D"mailto:pierrick.bouvier@linaro.org" target=3D"_blan=
k">pierrick.bouvier@linaro.org</a> &lt;mailto:<a href=3D"mailto:pierrick.bo=
uvier@linaro.org" target=3D"_blank">pierrick.bouvier@linaro.org</a>&gt;&gt;=
 wrote:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Hello Mario,<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 very recently, I had to investigate booting ti=
me of Android when using<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 QEMU. You can probably manage to boot this wit=
h only QEMU alone, but in<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 my experience, using Cuttlefish tooling is an =
easier approach.<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 If you really want to use only QEMU, you can u=
se Cuttlefish to get<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 exact<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 command line used (which disk goes where), and=
 iterate from that.<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Instructions:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 <a href=3D"https://linaro.atlassian.net/wiki/s=
paces/QEMU/pages/29464068097/Run+Android+using+QEMU" rel=3D"noreferrer" tar=
get=3D"_blank">https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068=
097/Run+Android+using+QEMU</a> &lt;<a href=3D"https://linaro.atlassian.net/=
wiki/spaces/QEMU/pages/29464068097/Run+Android+using+QEMU" rel=3D"noreferre=
r" target=3D"_blank">https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29=
464068097/Run+Android+using+QEMU</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 As you&#39;ll see, I could not get a direct gr=
aphic output, but using<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 scrcpy, it worked well for me. Hope it can fit=
 your use case.<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Regards,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Pierrick<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 On 9/2/24 06:49, Mario Marietto wrote:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Hello.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I would like to emulate Android 14 =
on my Ubuntu 24.04 OS X64 bit<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 using<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; qemu-system-aarch64. I tried using =
the following parameters :<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; qemu-system-aarch64 \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
smp 4 \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
m 2048 \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
cpu cortex-a72 \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
M virt \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
device virtio-gpu-pci,xres=3D1024,yres=3D768 \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
display sdl,gl=3Don \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
device usb-ehci \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
device usb-kbd \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
device virtio-tablet-pci \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
usb \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
serial stdio \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
kernel /mnt/zroot-133/_OS/Android/rpi4/Image \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
initrd /mnt/zroot-133/_OS/Android/rpi4/ramdisk.img \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=
=A0 -drive<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 index=3D0,if=3Dnone,id=3Dsystem,file=3D/mnt/zr=
oot-133/_OS/Android/rpi4/boot.img \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
device virtio-blk-pci,drive=3Dboot \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -drive<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 index=3D1,if=3Dnone,id=3Dsystem,file=3D/mnt/zr=
oot-133/_OS/Android/rpi4/system.img \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
device virtio-blk-pci,drive=3Dsystem \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
drive<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 index=3D2,if=3Dnone,id=3Dvendor,file=3D/mnt/zr=
oot-133/_OS/Android/rpi4/vendor.img \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
device virtio-blk-pci,drive=3Dvendor \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; -append &quot;console=3DttyAMA0,384=
00 drm.debug=3D0x0 rootwait rootdelay=3D5<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; root=3D/dev/mmcblk0p2 androidboot.h=
ardware=3Drpi4<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; androidboot.selinux=3Dpermissive se=
curity=3Dselinux selinux=3D1<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; androidboot.qemu.hw.mainkeys=3D0 an=
droidboot.lcd.density=3D160&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; The error I get in short is :<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ 1.993668] init: bool<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 android::init::BlockDevInitializer::InitDevice=
s(std::set&lt;std::string&gt;):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; partition(s) not found in /sys, wai=
ting for their uevent(s):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 mmcblk0p2,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; mmcblk0p3<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; One user suggested to :<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Hi!!! The &quot;/sys&quot; is a &qu=
ot;dynamic fs&quot; created at ram from the<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 kernel, to<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; export a lot of things...so most of=
 the files only exist at runtime.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Normally, the partitions from the b=
lock device have a symlink at<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; /sys/&lt;something&gt;/&lt;...&gt; =
that points to /dev/ block node. It seems<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 that<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; there are no such files under /sys =
according to what init is looking<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; for. You can double check this at i=
nit source code to check the<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 exact<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; path but I&#39;m guessing that you&=
#39;ll have to change the qemu arguments<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; regarding the block device.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; About userdata.img I think it&#39;s=
 normal since in the old days, the<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 image<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; was a &quot;empty sparse image&quot=
;, that means, at the first flashing<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 process,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; there isn&#39;t userdata informatio=
n, we&#39;re just &quot;flashing the<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 partition&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; with empty data.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Tks!!!<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; So,in short I should change the qem=
u arguments regarding the block<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; device. I tried in this way :<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; qemu-system-aarch64 \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
smp 4 \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
m 2048 \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
cpu cortex-a72 \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
M virt \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
device virtio-gpu-pci,xres=3D1024,yres=3D768 \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
display sdl,gl=3Don \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
device usb-ehci \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
device usb-kbd \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
device virtio-tablet-pci \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
usb \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
serial stdio \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
kernel /mnt/zroot-133/_OS/Android/rpi4/Image \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
initrd /mnt/zroot-133/_OS/Android/rpi4/ramdisk.img \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -hda /mnt/zroot-133/_OS/Android/rpi4/boot.img \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
hdb /mnt/zroot-133/_OS/Android/rpi4/system.img \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
hdc /mnt/zroot-133/_OS/Android/rpi4/vendor.img \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 -append =
&quot;console=3DttyAMA0,38400 drm.debug=3D0x0 rootwait<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 rootdelay=3D5<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; root=3D/dev/mmcblk0p2 androidboot.h=
ardware=3Drpi4<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; androidboot.selinux=3Dpermissive se=
curity=3Dselinux selinux=3D1<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; androidboot.qemu.hw.mainkeys=3D0 an=
droidboot.lcd.density=3D160&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; but the error is still there. Do yo=
u know some different alternative<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; block devices to try ? thanks.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; --<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Mario.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -- <br>
&gt;&gt; Mario.<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<br></d=
iv>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<br></d=
iv>

--000000000000b3773e062129a902--
