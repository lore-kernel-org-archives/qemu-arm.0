Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1355226njf;
        Tue, 3 Sep 2024 01:35:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXS1AaKwgyfbHbYomhBHjucJNiHn+5PMy1vUbJuDIaiBdQAmKp36SIdEQWi/gF7h7O7rGGmve9+c9A+vg==@linaro.org
X-Google-Smtp-Source: AGHT+IGh06DJNcRmZ+G3Qzd7HD7a9J/+9TT/KgRQ7g/zdmaRv12aIhfrbZe0H2QbZyhjeJOEuXTE
X-Received: by 2002:a05:620a:d95:b0:79e:f850:e4de with SMTP id af79cd13be357-7a803f34643mr1789775685a.0.1725352531102;
        Tue, 03 Sep 2024 01:35:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725352531; cv=none;
        d=google.com; s=arc-20160816;
        b=DjTauyhXaEiMmH1wOZGLGQf7NDA9EhZ+mEfNK0fHtxiIAXfJEhK892hy6S5M0dxnTD
         oXrxLnCK899v/C1rnW2fJeIFY4G4VV9a4HfBe2bS7YglXj1XnWphujUYJY9stoUY5F+N
         MCEU8q7D30Ola1g4zq9frMjFTJbu+lFmDXH+H1yDoF2pnnxFv5b1kR64MHHa1ANrrlwB
         UqlagOrQyIIDNa0CBhAXqD/w8GEcEvqYjwZ8MYAlmVV60uKWxYeB/WysRpuQNn5uPj4k
         OJOrxjdhbm8TPzlNFG4bAjdixzTQhugNmqcnuJ7Ij6vrxjHmijJ9DhEVnQDzHRABXg0b
         AWsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=DBoTxs10trrQjGw5l52RV8PDKBucKqWJra3x3p+jYz0=;
        fh=e6q00VQtVz17eEH5uPcFzokyy/BWBBIUAAz4Jelk5u0=;
        b=Maphl/+YqfvhMxyWVeiU8iIffMfqXIvCjP06iueqMU0MdDzL7pU4dmVKmOhHxaQ9nL
         i1NzSg9vK9g6cLSQOaKwaktF/iwTVvT6qwCNibOWWcbaYTunmP/x7eIB3ryt7Neia1fp
         zoI4eE1PJk2u4GIGhNQWsRu+lLpA9O74CIrVpxnnsNFLwwQ+yi9qI1ljiYDk8P9nG5vw
         Erc1a19ZwvwbBIWh21NEOEGH3Oz3QWinBuinjYrosVc1AVmyfA71W685nhvsjpM7tfHM
         FGbivJRxCksehFeuAUseCXAmmpb9XszzoiwsVhfL2npObwLbJK3CpWF7gSeekHKOFQDM
         OrMg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=hIBVbN++;
       spf=pass (google.com: domain of qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a806db11d2si1221131185a.541.2024.09.03.01.35.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 01:35:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=hIBVbN++;
       spf=pass (google.com: domain of qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-discuss-bounces@nongnu.org>)
	id 1slOzw-0001cp-RO; Tue, 03 Sep 2024 04:34:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marietto2008@gmail.com>)
 id 1slOzv-0001b2-17; Tue, 03 Sep 2024 04:34:47 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marietto2008@gmail.com>)
 id 1slOzn-0007nJ-Av; Tue, 03 Sep 2024 04:34:46 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-2da4e84c198so741237a91.0; 
 Tue, 03 Sep 2024 01:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725352477; x=1725957277; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DBoTxs10trrQjGw5l52RV8PDKBucKqWJra3x3p+jYz0=;
 b=hIBVbN++bV+q6XV0MnwpA/gOGRQLhIHAhI0iD2WCyeCFLu55yyAJaor0qHoSIWyL7g
 yYGXCsMI/0ckO88HW6886pQeaA0f2cA3NJia28aZZTZ1W0HQex82v9Z3M7GsAHdPb8VD
 ycAtkIO6MgEXXfNqsKnK5noM/lrOzXUQIPaMZ03e3QG2qc/RMWLotR8GhK4XjeW7ihEb
 Rr/vl2i0EW9OH0U4jere0GdYEM0VshCtk8qw6bGXNu/PyrVGc4rPpOr97M803DsoDK2+
 pAitHLTwaVF227YXUONdI0hJjSC6JuuhMLqH1jDyDaZ9Gh02FAM0ctJbUE2g5dAOC3dh
 L0hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725352477; x=1725957277;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DBoTxs10trrQjGw5l52RV8PDKBucKqWJra3x3p+jYz0=;
 b=dALAFdlHbwhqFk+bCBg5wgVQ5Zo0irtbG0i+uOT4Mma5cYatGEfjdEWTo/fLNbPzmx
 Do36JS78pks8lVezWEPJr+TLZcnj+7bIxkgAqyZuZWQalxPi6Q1OWA909U90dWO2dqWE
 nkZ54AqL/Afn98sCQuhY1ECEa0+sR6W+9AhcbyTjW16ZNs5IA5S0VjtNEfSnIGbZx85y
 J02Hg4BsSmLlirIpDJB9g6AsjSkBJBmoF/Y2tLGyoU47lOslQVRulqkeOaKSGvnFC0lL
 i1l7ZiWNjkSFjYSKK9WRn24XtrZ66z2d383gyDqULte/RL/ro3xYGOGFRBcDzOAnn/u8
 nV5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDt1P3FhC31WWPCdpSBEpPbeO0u9ex4+7qtOc8Ef60bMYjPghj8ISVvcWPgoCqXcO+Dr34vOkimw==@nongnu.org
X-Gm-Message-State: AOJu0Yy8uqQVvJ24bGuC5Vo1vnvvShQzosAu5HhKt4jCQTg7+gRQ06XO
 YHM7U/gdd4NWIloILB+PT/52xcYbeWkiTG4iIIomqAReOPgFATEBGJPe9IrqAzp69gmwpccr0aa
 4bodLIfi/jYxrO7iwUCBjupwF9Rs=
X-Received: by 2002:a17:90a:be10:b0:2d8:e3f3:fd66 with SMTP id
 98e67ed59e1d1-2d8e3f3ff0fmr6163188a91.34.1725352476724; Tue, 03 Sep 2024
 01:34:36 -0700 (PDT)
MIME-Version: 1.0
References: <CA+1FSiirzpq4wjcKTLSexiOWtv26sgD37h=wA2qxv8Qh5MW_-w@mail.gmail.com>
 <23d60255-614a-4a06-b449-644f215555d0@linaro.org>
 <CA+1FSiitcSBa3JZaAZMGkdB356d2M0rPqscwFnNXGML5HghVCQ@mail.gmail.com>
 <c80e855a-ac1c-40b6-8a76-966e53c0b7d7@linaro.org>
 <4cbc21b0-0634-445d-8a67-7705a4e186d8@linaro.org>
 <CA+1FSigiu8xXF1OPs1oSPS7LiGe23gsN73RwPpJUYH=X5EkTRQ@mail.gmail.com>
 <CA+1FSiiH9LP-7UupNLjDyZJGqJAHAjN2nSLFm9fCx=ZNphxGoQ@mail.gmail.com>
 <CA+1FSih6t-Ccnxh1GvOFMf9pMjcfV1V+yyJHV=ZH0c2RY0Kjng@mail.gmail.com>
 <268989a3-cd5c-41fc-ba0d-5eb71bc6e9dc@linaro.org>
In-Reply-To: <268989a3-cd5c-41fc-ba0d-5eb71bc6e9dc@linaro.org>
From: Mario Marietto <marietto2008@gmail.com>
Date: Tue, 3 Sep 2024 10:33:59 +0200
Message-ID: <CA+1FSijygoVZmTkYR8Xoob4yQQdf9o3CZ2-LmzDrBh2e0VaerQ@mail.gmail.com>
Subject: Re: Error : init: partition(s) not found in /sys, waiting for their
 uevent(s): mmcblk0p2, mmcblk0p3 while trying to emulate Android 14 on Ubuntu
 24.04 X64 bit using qemu-system-aarch64.
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-discuss@nongnu.org, qemu-arm <qemu-arm@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000007cd887062132ede6"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=marietto2008@gmail.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 HTML_FONT_LOW_CONTRAST=0.001, HTML_MESSAGE=0.001, NORMAL_HTTP_TO_IP=0.001,
 NUMERIC_HTTP_ADDR=1.242, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-discuss@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-discuss.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-discuss>,
 <mailto:qemu-discuss-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-discuss>
List-Post: <mailto:qemu-discuss@nongnu.org>
List-Help: <mailto:qemu-discuss-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-discuss>,
 <mailto:qemu-discuss-request@nongnu.org?subject=subscribe>
Errors-To: qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6csWWAk2a58g

--0000000000007cd887062132ede6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ziomario@Z390-AORUS-PRO-DEST:
/mnt/zroot-133/_OS/Android/aosp_14/android-image$ HOME=3D$(pwd)
./bin/launch_cvd -vm_manager qemu_cli -report_anonymous_usage_stats=3Dn
--start_webrtc=3Dfalse

09-03 10:04:44.206 2786386 2786386 I launch_cvd: main.cc:235 Using
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
GPU auto mode: detected prerequisites for accelerated rendering support.
Enabling --gpu_mode=3Dgfxstream.
GPU vhost user auto mode: not yet supported with qemu_cli. Not enabling
vhost user gpu.
Requested resuming a previous session (the default behavior) but the base
images have changed under the overlay, making the overlay incompatible.
Wiping the overlay files.
Path for instance UDS: /tmp/cf_avd_1000

The following lines contain useful debugging information:
 Serial console is disabled; use -console=3Dtrue to enable it.
 Logcat output:
/mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/instances/cvd-1=
/logs/logcat

 Kernel log:
/mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/instances/cvd-1=
/kernel.log
 Launcher log:
/mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/instances/cvd-1=
/logs/launcher.log

 Instance configuration:
/mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/instances/cvd-1=
/cuttlefish_config.json

 Launcher Build ID: 12309296

/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/modem_simulator
/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/tombstone_receiver
/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/log_tee
/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/wmediumd
/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/casimir_control_server
/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/screen_recording_serve=
r

/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/adb_connector
/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/socket_vsock_proxy
/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/socket_vsock_proxy
/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/tcp_connector
/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/control_env_proxy_serv=
er

/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/echo_server
Start modem simulator, server_fds: 58, Sim type: normal
/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/gnss_grpc_proxy
/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/logcat_receiver
/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/kernel_log_monitor
/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/openwrt_control_server
/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/log_tee
/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/process_restarter
/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/netsimd
/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/socket_vsock_proxy

Failed to open socket: Connection refused


/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/socket_vsock_proxy
/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/secure_env
/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/x86_64-linux-gnu/qemu/=
qemu-system-aarch64

Server listening on
unix:/tmp/cf_avd_1000/cvd-1/grpc_socket/CasimirControlServer.sock
Server listening on unix:/tmp/cf_avd_1000/cvd-1/grpc_socket/EchoServer.sock
Server listening on
unix:/tmp/cf_avd_1000/cvd-1/grpc_socket/OpenwrtControlServer.sock
root-canal I 09-03 10:06:13.219 device_boutique.cc:37
  Registering
beacon
root-canal I 09-03 10:06:13.219 device_boutique.cc:37
  Registering
beacon_swarm
root-canal I 09-03 10:06:13.219 device_boutique.cc:37
  Registering
scripted_beacon
root-canal I 09-03 10:06:13.219 device_boutique.cc:37
  Registering
sniffer
Server listening on
unix:/tmp/cf_avd_1000/cvd-1/grpc_socket/ControlEnvProxyServer.sock
netsimd I 09-03 08:06:13.221 rust_main.rs:98 - netsim artifacts path:
"/tmp/android-ziomario/netsimd"
netsimd I 09-03 08:06:13.221 rust_main.rs:101 - NetsimdArgs {
   fd_startup_str: Some(
       "{\"devices\":[{\"name\":\"0.0.0.0:6520
\",\"chips\":[{\"kind\":\"BLUETOOTH\",\"fdIn\":81,\"fdOut\":82},{\"kind\":\=
"UWB\",\"fdIn
\":83,\"fdOut\":84}]}]}",
   ),
   no_cli_ui: false,
   no_web_ui: false,
   pcap: false,
   disable_address_reuse: false,
   hci_port: Some(
       7300,
   ),
   connector_instance: None,
   instance: Some(
       1,
   ),
   logtostderr: false,
   dev: false,
   rust_grpc: false,
   rust_hostapd: false,
   rust_slirp: true,
   vsock: None,
   config: None,
   host_dns: None,
   http_proxy: None,
   wifi_tap: None,
   test_beacons: false,
   no_test_beacons: false,
   no_shutdown: false,
   verbose: false,
   version: false,
}
Size of OBJECT =3D 1204
Size of components in TPMT_SENSITIVE =3D 744
   TPMI_ALG_PUBLIC                 2
   TPM2B_AUTH                      50
   TPM2B_DIGEST                    50
   TPMU_SENSITIVE_COMPOSITE        642
MAX_CONTEXT_SIZE can be reduced to 1264 (1344)
size : 360
starting Rust KeyMint TA implementation in a thread
starting C++ KeyMint implementation in a thread with FDs in=3D31, out=3D30
KeyMint Rust TA running with infile=3D37, outfile=3D36, security_level=3DSo=
ftware
No secure deletion data file found. Creating one.
I0903 10:06:13.249418 2786724 SharedLibrary.cpp:64] SharedLibrary::open for
[libvulkan.so]

I0903 10:06:13.249507 2786724 SharedLibrary.cpp:76] SharedLibrary::open for
[libvulkan.so]: not found in map, open for the first time

I0903 10:06:13.249511 2786724 SharedLibrary.cpp:186] SharedLibrary::open
for [libvulkan.so] (posix): begin

I0903 10:06:13.249514 2786724 SharedLibrary.cpp:244] SharedLibrary::open
for [libvulkan.so] (posix,linux): call dlopen on [libvulkan.so
]

added library libvulkan.so
I0903 10:06:13.250535 2786724 HealthMonitor.cpp:280] HealthMonitor
disabled.
createGlobalVkEmulation:964 Selecting Vulkan device: NVIDIA GeForce GTX
1060 3GB
initialize: Supports id properties, got a vulkan device UUID
I0903 10:06:13.354756 2786724 SharedLibrary.cpp:76] SharedLibrary::open for
[libGLESv2.so]: not found in map, open for the first time

I0903 10:06:13.354764 2786724 SharedLibrary.cpp:186] SharedLibrary::open
for [libGLESv2.so] (posix): begin

I0903 10:06:13.354768 2786724 SharedLibrary.cpp:244] SharedLibrary::open
for [libGLESv2.so] (posix,linux): call dlopen on [libGLESv2.so
]

I0903 10:06:13.355076 2786724 SharedLibrary.cpp:76] SharedLibrary::open for
[libEGL.so]: not found in map, open for the first time

I0903 10:06:13.355081 2786724 SharedLibrary.cpp:186] SharedLibrary::open
for [libEGL.so] (posix): begin

I0903 10:06:13.355084 2786724 SharedLibrary.cpp:244] SharedLibrary::open
for [libEGL.so] (posix,linux): call dlopen on [libEGL.so]

I0903 10:06:13.448821 2786724 VkCommonOperations.cpp:1226] Initializing
VkEmulation features:
I0903 10:06:13.448837 2786724 VkCommonOperations.cpp:1227]
    glInteropSupported: true
I0903 10:06:13.448840 2786724 VkCommonOperations.cpp:1228]
    useDeferredCommands: true
I0903 10:06:13.448842 2786724 VkCommonOperations.cpp:1230]
    createResourceWithRequirements: true
I0903 10:06:13.448844 2786724 VkCommonOperations.cpp:1231]
    useVulkanComposition: false
I0903 10:06:13.448846 2786724 VkCommonOperations.cpp:1232]
    useVulkanNativeSwapchain: false
I0903 10:06:13.448848 2786724 VkCommonOperations.cpp:1233]     enable
guestRenderDoc: false
I0903 10:06:13.448850 2786724 VkCommonOperations.cpp:1234]     ASTC LDR
emulation mode: 2
I0903 10:06:13.448852 2786724 VkCommonOperations.cpp:1235]     enable ETC2
emulation: true
I0903 10:06:13.448854 2786724 VkCommonOperations.cpp:1236]     enable Ycbcr
emulation: false
I0903 10:06:13.448856 2786724 VkCommonOperations.cpp:1237]
    guestUsesAngle: false
I0903 10:06:13.448858 2786724 VkCommonOperations.cpp:1238]
    useDedicatedAllocations: false
I0903 10:06:13.449542 2786724 FrameBuffer.cpp:486] Graphics Adapter Vendor
Google (NVIDIA Corporation)
I0903 10:06:13.449548 2786724 FrameBuffer.cpp:487] Graphics Adapter Android
Emulator OpenGL ES Translator (NVIDIA GeForce GTX 1060 3GB/
PCIe/SSE2)
I0903 10:06:13.449551 2786724 FrameBuffer.cpp:488] Graphics API Version
OpenGL ES 3.0 (OpenGL ES 3.2 NVIDIA 535.183.01)
I0903 10:06:13.449553 2786724 FrameBuffer.cpp:489] Graphics API Extensions
GL_OES_EGL_sync GL_OES_EGL_image GL_OES_EGL_image_external G
L_OES_depth24 GL_OES_depth32 GL_OES_element_index_uint GL_OES_texture_float
GL_OES_texture_float_linear GL_OES_compressed_paletted_text
ure GL_OES_compressed_ETC1_RGB8_texture GL_OES_depth_texture
GL_OES_texture_half_float GL_OES_texture_half_float_linear GL_OES_packed_d
epth_stencil GL_OES_vertex_half_float GL_OES_standard_derivatives
GL_OES_texture_npot GL_OES_rgb8_rgba8 GL_OVR_multiview2 GL_EXT_multiv
iew_texture_multisample GL_EXT_color_buffer_float
GL_EXT_color_buffer_half_float GL_EXT_texture_format_BGRA8888
GL_APPLE_texture_format
_BGRA8888 GL_EXT_texture_buffer GL_OES_texture_buffer
GL_EXT_draw_buffers_indexed
I0903 10:06:13.449559 2786724 FrameBuffer.cpp:490] Graphics Device
Extensions N/A
GUEST_UBOOT_VERSION: 2024.01-g1ed8f8bde33e-ab12091206 (Jul 10 2024 -
23:47:38 +0000)
U-Boot 20
starting Rust KeyMint TA implementation in a thread
starting C++ KeyMint implementation in a thread with FDs in=3D31, out=3D30
KeyMint Rust TA running with infile=3D37, outfile=3D36, security_level=3DSo=
ftware
Secure deletion data file found. Parsing.
2024-09-03T08:06:13.626075Z qemu-system-aarch64: virtio-serial-bus:
Unexpected port id 16 for device virtio-serial.0
2024-09-03T08:06:13.626410Z qemu-system-aarch64: virtio-serial-bus:
Unexpected port id 17 for device virtio-serial.0
2024-09-03T08:06:13.626599Z qemu-system-aarch64: virtio-serial-bus:
Unexpected port id 18 for device virtio-serial.0
2024-09-03T08:06:13.626788Z qemu-system-aarch64: virtio-serial-bus:
Unexpected port id 19 for device virtio-serial.0
2024-09-03T08:06:13.626980Z qemu-system-aarch64: virtio-serial-bus:
Unexpected port id 20 for device virtio-serial.0
2024-09-03T08:06:13.627171Z qemu-system-aarch64: virtio-serial-bus:
Unexpected port id 21 for device virtio-serial.0
2024-09-03T08:06:13.627360Z qemu-system-aarch64: virtio-serial-bus:
Unexpected port id 22 for device virtio-serial.0
2024-09-03T08:06:13.627549Z qemu-system-aarch64: virtio-serial-bus:
Unexpected port id 23 for device virtio-serial.0
2024-09-03T08:06:13.627738Z qemu-system-aarch64: virtio-serial-bus:
Unexpected port id 24 for device virtio-serial.0
2024-09-03T08:06:13.627930Z qemu-system-aarch64: virtio-serial-bus:
Unexpected port id 25 for device virtio-serial.0
2024-09-03T08:06:13.628119Z qemu-system-aarch64: virtio-serial-bus:
Unexpected port id 26 for device virtio-serial.0
2024-09-03T08:06:13.628307Z qemu-system-aarch64: virtio-serial-bus:
Unexpected port id 27 for device virtio-serial.0
2024-09-03T08:06:13.628496Z qemu-system-aarch64: virtio-serial-bus:
Unexpected port id 28 for device virtio-serial.0
2024-09-03T08:06:13.628683Z qemu-system-aarch64: virtio-serial-bus:
Unexpected port id 29 for device virtio-serial.0
2024-09-03T08:06:13.628874Z qemu-system-aarch64: virtio-serial-bus:
Unexpected port id 30 for device virtio-serial.0

GUEST_KERNEL_VERSION: 6.6.46-android15-8-g3569b053517c-ab12290856-4k
(kleaf@build-host) (Android (11368308, +pgo, +bolt, +lto, +mlgo, based on
r510928) clang version 18.0.0 (
https://android.googlesource.com/toolchain/llvm-project
477610d4d0d988e69dbc3fae4fe86bff3f07f2b5), LLD 18.0.0) #1 SMP PREEMPT Wed
Aug 28 21:43:33 UTC 2024
] Linux version
transport message failed, response body: device '0.0.0.0:6520' not found
transport message failed, response body: device '0.0.0.0:6520' not found
transport message failed, response body: device '0.0.0.0:6520' not found
transport message failed, response body: device '0.0.0.0:6520' not found
GUEST_BUILD_FINGERPRINT:
generic/aosp_cf_arm64_only_phone/vsoc_arm64_only:VanillaIceCream/MAIN.1c019=
b0c/12309296:userdebug/test-keys

transport message failed, response body: device '0.0.0.0:6520' not found
transport message failed, response body: device '0.0.0.0:6520' not found
transport message failed, response body: device '0.0.0.0:6520' not found
transport message failed, response body: device '0.0.0.0:6520' not found
transport message failed, response body: device '0.0.0.0:6520' not found
transport message failed, response body: device '0.0.0.0:6520' not found
transport message failed, response body: device '0.0.0.0:6520' not found
transport message failed, response body: device '0.0.0.0:6520' not found
init: starting service 'adbd'...
proxy_fastboot] Stop event (11) received. Stopping proxy
proxy_adb] Start event (5) received. Starting proxy
proxy_adb] From: tcp: 6520
proxy_adb] To: vsock: 3:5555 vhost_user: false
transport message failed, response body: device '0.0.0.0:6520' not found
I0903 10:09:30.816108 2787314 IntelDrmDecoder.cpp:38] IntelDrmDecoder
created for context 2
I0903 10:09:32.764820 2787316 IntelDrmDecoder.cpp:38] IntelDrmDecoder
created for context 7
VIRTUAL_DEVICE_DISPLAY_POWER_MODE_CHANGED
VIRTUAL_DEVICE_DISPLAY_POWER_MODE_CHANGED
I0903 10:10:20.918014 2787359 IntelDrmDecoder.cpp:38] IntelDrmDecoder
created for context 11

I see a lot of errors,but it seems connected :

ziomario@Z390-AORUS-PRO-DEST:~/Scrivania$ adb devices
List of devices attached
0.0.0.0:6520    device

but scrcpy didn't work :

ziomario@Z390-AORUS-PRO-DEST:~/Scrivania$ scrcpy

scrcpy 2.6.1 <https://github.com/Genymobile/scrcpy>
INFO: ADB device found:
INFO:     --> (tcpip)  0.0.0.0:6520                    device
 Cuttlefish_arm64_phone_64_bit_only

/usr/local/share/scrcpy/scrcpy-server: 1 file pushed, 0 skipped. 90.0 MB/s
(71112 bytes in 0.001s)
[server] INFO: Device: [Google] generic Cuttlefish arm64 phone 64-bit only
(Android 14)
[server] ERROR: Could not register rotation watcher
java.lang.NullPointerException: Attempt to invoke virtual method
'java.lang.Class java.lang.Object.getClass()' on a null object reference

       at
com.genymobile.scrcpy.wrappers.WindowManager.registerRotationWatcher(Window=
Manager.java:185)

       at com.genymobile.scrcpy.device.Device.<init>(Device.java:93)
       at com.genymobile.scrcpy.Server.scrcpy(Server.java:145)
       at com.genymobile.scrcpy.Server.internalMain(Server.java:290)
       at com.genymobile.scrcpy.Server.main(Server.java:245)
       at com.android.internal.os.RuntimeInit.nativeFinishInit(Native
Method)
       at com.android.internal.os.RuntimeInit.main(RuntimeInit.java:369)

[server] ERROR: Could not register display fold listener

java.lang.NullPointerException: Attempt to invoke virtual method
'java.lang.Class java.lang.Object.getClass()' on a null object reference

       at
com.genymobile.scrcpy.wrappers.WindowManager.registerDisplayFoldListener(Wi=
ndowManager.java:206)

       at com.genymobile.scrcpy.device.Device.<init>(Device.java:108)
       at com.genymobile.scrcpy.Server.scrcpy(Server.java:145)
       at com.genymobile.scrcpy.Server.internalMain(Server.java:290)
       at com.genymobile.scrcpy.Server.main(Server.java:245)
       at com.android.internal.os.RuntimeInit.nativeFinishInit(Native
Method)
       at com.android.internal.os.RuntimeInit.main(RuntimeInit.java:369)

[server] WARN: No clipboard manager, copy-paste between device and computer
will not work
[server] ERROR: Attempt to invoke virtual method 'android.view.InputDevice
android.hardware.input.InputManagerGlobal.getInputDevice(int)' on a null
object reference
java.lang.NullPointerException: Attempt to invoke virtual method
'android.view.InputDevice
android.hardware.input.InputManagerGlobal.getInputDevice(int)' on a null
object reference
       at android.view.KeyCharacterMap.load(KeyCharacterMap.java:364)
       at
com.genymobile.scrcpy.control.Controller.<init>(Controller.java:45)
       at com.genymobile.scrcpy.Server.scrcpy(Server.java:159)
       at com.genymobile.scrcpy.Server.internalMain(Server.java:290)
       at com.genymobile.scrcpy.Server.main(Server.java:245)
       at com.android.internal.os.RuntimeInit.nativeFinishInit(Native
Method)
       at com.android.internal.os.RuntimeInit.main(RuntimeInit.java:369)

INFO: Renderer: opengl
INFO: OpenGL version: 4.6.0 NVIDIA 535.183.01
INFO: Trilinear filtering enabled
WARN: Device disconnected
ERROR: Demuxer 'video': stream disabled due to connection error
ERROR: Demuxer 'audio': stream disabled due to connection error

Even if the phone is still up :

ziomario@Z390-AORUS-PRO-DEST:~/Scrivania$ adb devices
List of devices attached
0.0.0.0:6520    device

On Tue, Sep 3, 2024 at 1:03=E2=80=AFAM Pierrick Bouvier <pierrick.bouvier@l=
inaro.org>
wrote:

> The cvd-host package in this case are binaries/libraries compiled for
> aarch64, so it can be used on linux aarch64 and benefit from kvm
> acceleration.
>
> In your case, running emulation from a x64 host, you need
> cvd-host_package-x86_64.tar.gz instead.
>
> On 9/2/24 15:38, Mario Marietto wrote:
> > Update :
> >
> > ziomario@Z390-AORUS-PRO-DEST:/mnt/zroot-133/_OS/Android/aosp_14/android=
-image/bin$
> mkdir x86_64-linux-musl
> >
> > ziomario@Z390-AORUS-PRO-DEST:/mnt/zroot-133/_OS/Android/aosp_14/android=
-image/bin$
> cp
> /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/aarch64-linux-musl/c=
rosvm
> /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/x86_64-linux-musl
> >
> > ziomario@Z390-AORUS-PRO-DEST:/mnt/zroot-133/_OS/Android/aosp_14/android=
-image$
> HOME=3D$(pwd) ./bin/launch_cvd -vm_manager qemu_cli
> -report_anonymous_usage_stats=3Dn --start_webrtc=3Dfalse
> >
> >
> > Unfortunately it does not work :
> >
> >
> > 09-03 00:03:28.916 2737211 2737211 I launch_cvd: main.cc:235 Using
> > system_image_dir of:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > NOTICE:
> >
> > By using this Android Virtual Device, you agree to
> > Google Terms of Service (https://policies.google.com/terms
> > <https://policies.google.com/terms>).
> > The Google Privacy Policy (https://policies.google.com/privacy
> > <https://policies.google.com/privacy>)
> > describes how Google handles information generated as you use
> > Google Services.
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > Reading --config option from:
> > /mnt/zroot-133/_OS/Android/aosp_14/android-image/android-info.txt
> > Launching CVD using --config=3D'phone'.
> >
> /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/aarch64-linux-gnu/gf=
xstream_graphics_detector:
> error while loading shared
> >
> > libraries: libc.so.6: cannot open shared object file: No such file or
> > directory
> >
> > Failed to run graphics detector, bad return value: 127. Assuming no
> > availability.
> > GPU auto mode: did not detect prerequisites for accelerated rendering
> > support, enabling --gpu_mode=3Dguest_swiftshader.
> > GPU vhost user auto mode: not needed for --gpu_mode=3Dguest_swiftshader=
.
> > Not enabling vhost user gpu.
> > Requested resuming a previous session (the default behavior) but the
> > base images have changed under the overlay, making the overlay
> > incompatible. Wiping the overlay files.
> >
> > Path for instance UDS: /tmp/cf_avd_1000
> >
> > The following lines contain useful debugging information:
> >   Serial console is disabled; use -console=3Dtrue to enable it.
> >   Logcat output:
> >
> /mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/instances/cvd=
-1/logs/logcat
> >   Kernel log:
> >
> /mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/instances/cvd=
-1/kernel.log
> >   Launcher log:
> >
> /mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/instances/cvd=
-1/logs/launcher.log
> >   Instance configuration:
> >
> /mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/instances/cvd=
-1/cuttlefish_config.json
> >   Launcher Build ID: 12309296
> > 4. main.cc:232| RunCvdMain|
> > 3. main.cc:104| Run|
> > 2. server_loop_impl.cpp:89| Run|
> > 1. qemu_manager.cpp:247| StartCommands|
> > | device/google/cuttlefish/host/libs/vm_manager/qemu_manager.cpp:97
> > | Result<std::pair<int, int>> cuttlefish::vm_manager::(anonymous
> > namespace)::GetQemuVersion(const std::string &)
> > v CF_EXPECT(qemu_version_ret =3D=3D 0)
> >
> /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/aarch64-linux-gnu/qe=
mu/qemu-system-aarch64
> -version returned unexpected response .
> > Stderr was
> >
> /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/aarch64-linux-gnu/qe=
mu/qemu-system-aarch64:
> error while loading shared
> >
> > libraries: libncursesw.so.6: cannot open shared object file: No such
> > file or directory
> >
> > On Mon, Sep 2, 2024 at 11:30=E2=80=AFPM Mario Marietto <marietto2008@gm=
ail.com
> > <mailto:marietto2008@gmail.com>> wrote:
> >
> >     Something is not right :
> >
> >     ziomario@Z390-AORUS-PRO-DEST:/mnt/zroot-133/_OS/Android/aosp_14/and=
roid-image$
> unzip ../aosp_cf_*.zip
> >
> >     Archive:  ../aosp_cf_arm64_only_phone-img-12309296.zip
> >       inflating: android-info.txt
> >       inflating: fastboot-info.txt
> >       inflating: kernel_16k
> >       inflating: ramdisk_16k.img
> >       inflating: boot.img
> >       inflating: boot_16k.img
> >       inflating: bootloader
> >       inflating: init_boot.img
> >       inflating: userdata.img
> >       inflating: vbmeta.img
> >       inflating: vbmeta_system.img
> >       inflating: vbmeta_system_dlkm.img
> >       inflating: vbmeta_vendor_dlkm.img
> >       inflating: vendor_boot.img
> >       inflating: super.img
> >
> >     ziomario@Z390-AORUS-PRO-DEST:/mnt/zroot-133/_OS/Android/aosp_14/and=
roid-image$
> tar xzvf ../cvd-host_package.tar.gz
> >
> >
> >     ./
> >     ./lib64/
> >     ./lib64/android.hardware.keymaster@3.0.so
> >     <mailto:android.hardware.keymaster@3.0.so>
> >     ./lib64/libciborium_io.dylib.so <http://libciborium_io.dylib.so>
> >     ./lib64/libjpeg.so
> >     ./lib64/cuttlefish_net.so
> >     ./lib64/libbase.so
> >     ./lib64/vulkan.pastel.so <http://vulkan.pastel.so>
> >     ./lib64/libcuttlefish_host_config.so
> >     ./lib64/libflagset.dylib.so <http://libflagset.dylib.so>
> >     ./lib64/libkmr_common.dylib.so <http://libkmr_common.dylib.so>
> >     ./lib64/libpkcs1.dylib.so <http://libpkcs1.dylib.so>
> >     ./lib64/libicui18n-host.so
> >     ./lib64/libwayland_client.so
> >     ./lib64/libunwindstack.so
> >     ./lib64/libkmr_ta.dylib.so <http://libkmr_ta.dylib.so>
> >     ./lib64/libcoset.dylib.so <http://libcoset.dylib.so>
> >     ./lib64/libcppbor.so
> >     ./lib64/libgatekeeper.so
> >     ./lib64/libyuv.so
> >     ./lib64/libgrpc++.so
> >     ./lib64/libkmr_cf_ffi.so
> >     ./lib64/libcppcose_rkp.so
> >     ./lib64/libcuttlefish_transport.so
> >     ./lib64/liblzma.so
> >     ./lib64/libciborium_ll.dylib.so <http://libciborium_ll.dylib.so>
> >     ./lib64/libcuttlefish_allocd_utils.so
> >     ./lib64/libgflags.so
> >     ./lib64/android.hardware.keymaster@4.0.so
> >     <mailto:android.hardware.keymaster@4.0.so>
> >     ./lib64/libcfg_if.dylib.so <http://libcfg_if.dylib.so>
> >     ./lib64/libspki.dylib.so <http://libspki.dylib.so>
> >     ./lib64/libzeroize.dylib.so <http://libzeroize.dylib.so>
> >     ./lib64/libcgrouprc.so
> >     ./lib64/libprotobuf-cpp-full.so
> >     ./lib64/libcutils.so
> >     ./lib64/libsqlite.so
> >     ./lib64/libcuttlefish_utils_result.so
> >     ./lib64/libbinder_ndk.so
> >     ./lib64/libext2_uuid-host.so
> >     ./lib64/libhex.dylib.so <http://libhex.dylib.so>
> >     ./lib64/libc_musl.so
> >     ./lib64/libconst_oid.dylib.so <http://libconst_oid.dylib.so>
> >     ./lib64/libprotobuf_support.dylib.so
> >     <http://libprotobuf_support.dylib.so>
> >     ./lib64/tpm2-tss2-tcti.so
> >     ./lib64/libserde.dylib.so <http://libserde.dylib.so>
> >     ./lib64/libartpalette.so
> >     ./lib64/liblog.so
> >     ./lib64/libonce_cell.dylib.so <http://libonce_cell.dylib.so>
> >     ./lib64/libthiserror.dylib.so <http://libthiserror.dylib.so>
> >     ./lib64/libssl-host.so
> >     ./lib64/libc++.so
> >     ./lib64/libext4_utils.so
> >     ./lib64/libpkcs8.dylib.so <http://libpkcs8.dylib.so>
> >     ./lib64/libsparse-host.so
> >     ./lib64/sandboxed_api_sandbox2.so
> >     ./lib64/libcuttlefish_command_util.so
> >     ./lib64/libbssl_sys.dylib.so <http://libbssl_sys.dylib.so>
> >     ./lib64/libkeymaster_messages.so
> >     ./lib64/libcuttlefish_web.so
> >     ./lib64/libvpx.so
> >     ./lib64/libopus.so
> >     ./lib64/libminijail.so
> >     ./lib64/libcurl-host.so
> >     ./lib64/libcuttlefish_kernel_log_monitor_utils.so
> >     ./lib64/tpm2-tss2-util.so
> >     ./lib64/liblibc.dylib.so <http://liblibc.dylib.so>
> >     ./lib64/libprotobuf.dylib.so <http://libprotobuf.dylib.so>
> >     ./lib64/libbitflags.dylib.so <http://libbitflags.dylib.so>
> >     ./lib64/libutils.so
> >     ./lib64/libjsoncpp.so
> >     ./lib64/libext2_blkid-host.so
> >     ./lib64/libnl.so
> >     ./lib64/tpm2-tss2-sys.so
> >     ./lib64/libartbase.so
> >     ./lib64/libxml2.so
> >     ./lib64/libkmr_proto_rust.dylib.so <
> http://libkmr_proto_rust.dylib.so>
> >     ./lib64/libcuttlefish_security.so
> >     ./lib64/libsecure_env_tpm.dylib.so <
> http://libsecure_env_tpm.dylib.so>
> >     ./lib64/libz-host.so
> >     ./lib64/libprocessgroup.so
> >     ./lib64/libcrypto_utils.so
> >     ./lib64/libder.dylib.so <http://libder.dylib.so>
> >     ./lib64/libdexfile.so
> >     ./lib64/cf_metrics_proto.so
> >     ./lib64/tpm2-tss2-esys.so
> >     ./lib64/libcuttlefish_utils.so
> >     ./lib64/libkeymaster_portable.so
> >     ./lib64/libfruit.so
> >     ./lib64/tpm2-tss2-rc.so
> >     ./lib64/libcap.so
> >     ./lib64/libnix.dylib.so <http://libnix.dylib.so>
> >     ./lib64/libicuuc-host.so
> >     ./lib64/libziparchive.so
> >     ./lib64/libkmr_ta_nonsecure.dylib.so
> >     <http://libkmr_ta_nonsecure.dylib.so>
> >     ./lib64/libstd.dylib.so <http://libstd.dylib.so>
> >     ./lib64/libhalf.dylib.so <http://libhalf.dylib.so>
> >     ./lib64/tpm2-tss2-mu.so
> >     ./lib64/libmemoffset.dylib.so <http://libmemoffset.dylib.so>
> >     ./lib64/liblp.so
> >     ./lib64/libcuttlefish_fs.so
> >     ./lib64/libProxyConfig.so
> >     ./lib64/libopenssl.dylib.so <http://libopenssl.dylib.so>
> >     ./lib64/libkmr_wire.dylib.so <http://libkmr_wire.dylib.so>
> >     ./lib64/libkmr_crypto_boring.dylib.so
> >     <http://libkmr_crypto_boring.dylib.so>
> >     ./lib64/liblog_rust.dylib.so <http://liblog_rust.dylib.so>
> >     ./lib64/libhidlbase.so
> >     ./lib64/libgrpc_wrap.so
> >     ./lib64/libgrpc++_unsecure.so
> >     ./lib64/libbytes.dylib.so <http://libbytes.dylib.so>
> >     ./lib64/libsoft_attestation_cert.so
> >     ./lib64/libcuttlefish_run_cvd_proto.so
> >     ./lib64/libbinder.so
> >     ./lib64/libcrypto-host.so
> >     ./lib64/libwebm_mkvmuxer.so
> >     ./lib64/libkmr_cf.dylib.so <http://libkmr_cf.dylib.so>
> >     ./lib64/libciborium.dylib.so <http://libciborium.dylib.so>
> >     ./lib64/libpuresoftkeymasterdevice_host.so
> >     ./lib64/libx509_cert.dylib.so <http://libx509_cert.dylib.so>
> >     ./lib64/libsec1.dylib.so <http://libsec1.dylib.so>
> >     ./nativetest64/
> >     ./nativetest64/modem_simulator_test/
> >     ./nativetest64/modem_simulator_test/modem_simulator_test
> >     ./nativetest64/cuttlefish_net_tests/
> >     ./nativetest64/cuttlefish_net_tests/cuttlefish_net_tests
> >     ./etc/
> >     ./etc/modem_simulator/
> >     ./etc/modem_simulator/files/
> >
>  ./etc/modem_simulator/files/iccprofile_for_sim0_for_CtsCarrierApiTestCas=
es.xml
> >     ./etc/modem_simulator/files/iccprofile_for_sim0.xml
> >     ./etc/modem_simulator/files/numeric_operator.xml
> >     ./etc/cvd_rsa4096.avbpubkey
> >     ./etc/bootloader_aarch64/
> >     ./etc/bootloader_aarch64/bootloader.qemu
> >     ./etc/bootloader_aarch64/bootloader.crosvm
> >     ./etc/bootloader_riscv64/
> >     ./etc/bootloader_riscv64/bootloader.qemu
> >     ./etc/automotive/
> >     ./etc/automotive/vhalconfig/
> >     ./etc/automotive/vhalconfig/VendorClusterTestProperties.json
> >     ./etc/automotive/vhalconfig/DefaultProperties.json
> >     ./etc/automotive/vhalconfig/TestProperties.json
> >     ./etc/automotive/proxy_config.json
> >     ./etc/cvd_rsa2048.avbpubkey
> >     ./etc/cvd_avb_testkey_rsa4096.pem
> >     ./etc/bootloader_arm/
> >     ./etc/bootloader_arm/bootloader.qemu
> >     ./etc/bootloader_x86_64/
> >     ./etc/bootloader_x86_64/bootloader.qemu
> >     ./etc/bootloader_x86_64/bootloader.crosvm
> >     ./etc/cvd_avb_testkey_rsa2048.pem
> >     ./etc/openwrt/
> >     ./etc/openwrt/images/
> >     ./etc/openwrt/images/openwrt_kernel_aarch64
> >     ./etc/openwrt/images/openwrt_rootfs_x86_64
> >     ./etc/openwrt/images/openwrt_rootfs_aarch64
> >     ./etc/openwrt/images/openwrt_kernel_x86_64
> >     ./etc/cvd_config/
> >     ./etc/cvd_config/cvd_config_tv.json
> >     ./etc/cvd_config/cvd_config_tablet.json
> >     ./etc/cvd_config/cvd_config_wear.json
> >     ./etc/cvd_config/cvd_config_auto_portrait.json
> >     ./etc/cvd_config/cvd_config_slim.json
> >     ./etc/cvd_config/cvd_config_go.json
> >     ./etc/cvd_config/cvd_config_foldable.json
> >     ./etc/cvd_config/cvd_config_auto.json
> >     ./etc/cvd_config/cvd_config_auto_md.json
> >     ./etc/cvd_config/cvd_config_phone.json
> >     ./usr/
> >     ./usr/share/
> >     ./usr/share/vulkan/
> >     ./usr/share/vulkan/icd.d/
> >     ./usr/share/vulkan/icd.d/vk_swiftshader_icd.json
> >     ./usr/share/qemu/
> >     ./usr/share/qemu/aarch64-linux-gnu/
> >
>  ./usr/share/qemu/aarch64-linux-gnu/opensbi-riscv64-generic-fw_dynamic.bi=
n
> >     ./usr/share/qemu/aarch64-linux-gnu/efi-virtio.rom
> >     ./usr/share/qemu/aarch64-linux-gnu/keymaps/
> >     ./usr/share/qemu/aarch64-linux-gnu/keymaps/en-us
> >     ./usr/share/webrtc/
> >     ./usr/share/webrtc/assets/
> >     ./usr/share/webrtc/assets/style.css
> >     ./usr/share/webrtc/assets/index.css
> >     ./usr/share/webrtc/assets/index.html
> >     ./usr/share/webrtc/assets/js/
> >     ./usr/share/webrtc/assets/js/location.js
> >     ./usr/share/webrtc/assets/js/rootcanal.js
> >     ./usr/share/webrtc/assets/js/app.js
> >     ./usr/share/webrtc/assets/js/touch.js
> >     ./usr/share/webrtc/assets/js/adb.js
> >     ./usr/share/webrtc/assets/js/index.js
> >     ./usr/share/webrtc/assets/js/cf_webrtc.js
> >     ./usr/share/webrtc/assets/js/server_connector.js
> >     ./usr/share/webrtc/assets/js/controls.js
> >     ./usr/share/webrtc/assets/controls.css
> >     ./usr/share/webrtc/assets/custom.css
> >     ./usr/share/webrtc/assets/client.html
> >     ./usr/share/webrtc/certs/
> >     ./usr/share/webrtc/certs/server.p12
> >     ./usr/share/webrtc/certs/server.key
> >     ./usr/share/webrtc/certs/trusted.pem
> >     ./usr/share/webrtc/certs/server.crt
> >     ./usr/share/zoneinfo/
> >     ./usr/share/zoneinfo/tzdata
> >     ./usr/share/crosvm/
> >     ./usr/share/crosvm/aarch64-linux-gnu/
> >     ./usr/share/crosvm/aarch64-linux-gnu/seccomp/
> >     ./usr/share/crosvm/aarch64-linux-gnu/seccomp/snd_null_device.policy
> >     ./usr/share/crosvm/aarch64-linux-gnu/seccomp/gpu_render_server.poli=
cy
> >     ./usr/share/crosvm/aarch64-linux-gnu/seccomp/battery.policy
> >     ./usr/share/crosvm/aarch64-linux-gnu/seccomp/block_device.policy
> >     ./usr/share/crosvm/aarch64-linux-gnu/seccomp/pmem_device.policy
> >     ./usr/share/crosvm/aarch64-linux-gnu/seccomp/wl_device.policy
> >     ./usr/share/crosvm/aarch64-linux-gnu/seccomp/9p_device.policy
> >     ./usr/share/crosvm/aarch64-linux-gnu/seccomp/input_device.policy
> >     ./usr/share/crosvm/aarch64-linux-gnu/seccomp/net_device.policy
> >     ./usr/share/crosvm/aarch64-linux-gnu/seccomp/rng_device.policy
> >     ./usr/share/crosvm/aarch64-linux-gnu/seccomp/coiommu_device.policy
> >     ./usr/share/crosvm/aarch64-linux-gnu/seccomp/gpu_device.policy
> >     ./usr/share/crosvm/aarch64-linux-gnu/seccomp/serial_device.policy
> >     ./usr/share/crosvm/aarch64-linux-gnu/seccomp/cras_audio_device.poli=
cy
> >     ./usr/share/crosvm/aarch64-linux-gnu/seccomp/null_audio_device.poli=
cy
> >     ./usr/share/crosvm/aarch64-linux-gnu/seccomp/snd_cras_device.policy
> >     ./usr/share/crosvm/aarch64-linux-gnu/seccomp/vhost_scmi_device.poli=
cy
> >     ./usr/share/crosvm/aarch64-linux-gnu/seccomp/balloon_device.policy
> >     ./usr/share/crosvm/aarch64-linux-gnu/seccomp/vhost_net_device.polic=
y
> >
>  ./usr/share/crosvm/aarch64-linux-gnu/seccomp/vhost_vsock_device.policy
> >     ./usr/share/crosvm/aarch64-linux-gnu/seccomp/fs_device.policy
> >     ./usr/share/crosvm/aarch64-linux-gnu/seccomp/video_device.policy
> >     ./usr/share/crosvm/aarch64-linux-gnu/seccomp/xhci_device.policy
> >     ./usr/share/crosvm/aarch64-linux-gnu/seccomp/vios_audio_device.poli=
cy
> >     ./bin/
> >     ./bin/modem_simulator
> >     ./bin/ms-tpm-20-ref
> >     ./bin/mkenvimage_slim
> >     ./bin/metrics
> >     ./bin/socket_vsock_proxy
> >     ./bin/resize.f2fs
> >     ./bin/metrics_launcher
> >     ./bin/automotive_vsock_proxy
> >     ./bin/newfs_msdos
> >     ./bin/netsim-ui/
> >     ./bin/netsim-ui/assets/
> >     ./bin/netsim-ui/assets/grid-background.svg
> >     ./bin/netsim-ui/assets/netsim-logo.svg
> >     ./bin/netsim-ui/assets/polar-background.svg
> >     ./bin/netsim-ui/assets/hexagonal-background.png
> >     ./bin/netsim-ui/assets/netsim-logo-b.svg
> >     ./bin/netsim-ui/node_modules/
> >     ./bin/netsim-ui/node_modules/tslib/
> >     ./bin/netsim-ui/node_modules/tslib/tslib.es6.js
> >     ./bin/netsim-ui/index.html
> >     ./bin/netsim-ui/js/
> >     ./bin/netsim-ui/js/device-info.js
> >     ./bin/netsim-ui/js/device-list.js
> >     ./bin/netsim-ui/js/packet-info.js
> >     ./bin/netsim-ui/js/device-dropzone.js
> >     ./bin/netsim-ui/js/navigation-bar.js
> >     ./bin/netsim-ui/js/device-map.js
> >     ./bin/netsim-ui/js/device-dragzone.js
> >     ./bin/netsim-ui/js/netsim-app.js
> >     ./bin/netsim-ui/js/customize-map-button.js
> >     ./bin/netsim-ui/js/device-observer.js
> >     ./bin/netsim-ui/js/license-info.js
> >     ./bin/netsim-ui/js/cube-sprite.js
> >     ./bin/netsim-ui/js/pyramid-sprite.js
> >     ./bin/unpack_bootimg
> >     ./bin/adb
> >     ./bin/extract-vmlinux
> >     ./bin/health
> >     ./bin/screen_recording_server
> >     ./bin/lz4
> >     ./bin/wmediumd_gen_config
> >     ./bin/gnss_grpc_proxy
> >     ./bin/simg2img
> >     ./bin/secure_env
> >     ./bin/mke2fs
> >     ./bin/snapshot_util_cvd
> >     ./bin/cvd_internal_display
> >     ./bin/acloud_translator
> >     ./bin/defrag.f2fs
> >     ./bin/tombstone_receiver
> >     ./bin/root-canal
> >     ./bin/netsimd
> >     ./bin/console_forwarder
> >     ./bin/powerwash_cvd
> >     ./bin/process_restarter
> >     ./bin/fsck.f2fs
> >     ./bin/cvd_host_bugreport
> >     ./bin/extract-ikconfig
> >     ./bin/cvd_internal_status
> >     ./bin/webRTC
> >     ./bin/acloud
> >     ./bin/tcp_connector
> >     ./bin/process_sandboxer
> >     ./bin/webrtc_operator
> >     ./bin/cvd_update_location
> >     ./bin/e2fsdroid
> >     ./bin/avbtool
> >     ./bin/fastboot
> >     ./bin/build_super_image
> >     ./bin/powerbtn_cvd
> >     ./bin/allocd_client
> >     ./bin/dump.f2fs
> >     ./bin/netsim
> >     ./bin/casimir
> >     ./bin/pica
> >     ./bin/cvd_update_security_algorithm
> >     ./bin/record_cvd
> >     ./bin/vhal_proxy_server
> >     ./bin/cvd_status
> >     ./bin/cvd_import_locations
> >     ./bin/launch_cvd
> >     ./bin/cvd_internal_start
> >     ./bin/restart_cvd
> >     ./bin/cvd_internal_host_bugreport
> >     ./bin/mkuserimg_mke2fs
> >     ./bin/fec
> >     ./bin/cvd_internal_env
> >     ./bin/vhost_device_vsock
> >     ./bin/cvd_internal_stop
> >     ./bin/cvd_send_sms
> >     ./bin/assemble_cvd
> >     ./bin/cvd_send_id_disclosure
> >     ./bin/mcopy
> >     ./bin/operator_proxy
> >     ./bin/mkbootfs
> >     ./bin/run_cvd
> >     ./bin/openwrt_control_server
> >     ./bin/mkbootimg
> >     ./bin/kernel_log_monitor
> >     ./bin/mmd
> >     ./bin/toybox
> >     ./bin/crosvm
> >     ./bin/aarch64-linux-musl/
> >     ./bin/aarch64-linux-musl/crosvm
> >     ./bin/sefcontext_compile
> >     ./bin/wmediumd
> >     ./bin/echo_server
> >     ./bin/log_tee
> >     ./bin/lpmake
> >     ./bin/logcat_receiver
> >     ./bin/lpunpack
> >     ./bin/control_env_proxy_server
> >     ./bin/mtools
> >     ./bin/adb_connector
> >     ./bin/aarch64-linux-gnu/
> >     ./bin/aarch64-linux-gnu/libepoxy.so.0
> >     ./bin/aarch64-linux-gnu/libffi.so.7
> >     ./bin/aarch64-linux-gnu/qemu/
> >     ./bin/aarch64-linux-gnu/qemu/qemu-system-x86_64
> >     ./bin/aarch64-linux-gnu/qemu/libepoxy.so.0
> >     ./bin/aarch64-linux-gnu/qemu/libvirglrenderer.so.1
> >     ./bin/aarch64-linux-gnu/qemu/libgbm.so.1
> >     ./bin/aarch64-linux-gnu/qemu/libgfxstream_backend.so.0
> >     ./bin/aarch64-linux-gnu/qemu/librutabaga_gfx_ffi.so.0
> >     ./bin/aarch64-linux-gnu/qemu/qemu-system-riscv64
> >     ./bin/aarch64-linux-gnu/qemu/qemu-system-aarch64
> >     ./bin/aarch64-linux-gnu/qemu/libc++.so.1
> >     ./bin/aarch64-linux-gnu/qemu/libunwind.so.1
> >     ./bin/aarch64-linux-gnu/qemu/libz.so.1
> >     ./bin/aarch64-linux-gnu/qemu/libc++abi.so.1
> >     ./bin/aarch64-linux-gnu/libvirglrenderer.so.1
> >     ./bin/aarch64-linux-gnu/libdrm.so.2
> >     ./bin/aarch64-linux-gnu/libgbm.so.1
> >     ./bin/aarch64-linux-gnu/libgfxstream_backend.so
> >     ./bin/aarch64-linux-gnu/libwayland-client.so.0
> >     ./bin/aarch64-linux-gnu/libminijail.so
> >     ./bin/aarch64-linux-gnu/gfxstream_graphics_detector
> >     ./bin/aarch64-linux-gnu/crosvm
> >     ./bin/lpadd
> >     ./bin/make_f2fs
> >     ./bin/sandboxer_proxy
> >     ./bin/stop_cvd
> >     ./bin/casimir_control_server
> >
> >
> >     ziomario@Z390-AORUS-PRO-DEST:/mnt/zroot-133/_OS/Android/aosp_14/and=
roid-image$
> HOME=3D$(pwd) ./bin/launch_cvd -vm_manager qemu_cli
> -report_anonymous_usage_stats=3Dn --start_webrtc=3Dfalse
> >
> >
> >     09-02 23:27:10.473 2729990 2729990 I launch_cvd: main.cc:235 Using
> >     system_image_dir of:
> >     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >     NOTICE:
> >
> >     By using this Android Virtual Device, you agree to
> >     Google Terms of Service (https://policies.google.com/terms
> >     <https://policies.google.com/terms>).
> >     The Google Privacy Policy (https://policies.google.com/privacy
> >     <https://policies.google.com/privacy>)
> >     describes how Google handles information generated as you use
> >     Google Services.
> >     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> >     Reading --config option from:
> >     /mnt/zroot-133/_OS/Android/aosp_14/android-image/android-info.txt
> >     Launching CVD using --config=3D'phone'.
> >     aarch64-binfmt-P: Could not open '/lib/ld-linux-aarch64.so.1': No
> >     such file or directory
> >     Failed to run graphics detector, bad return value: 255. Assuming no
> >     availability.
> >     GPU auto mode: did not detect prerequisites for accelerated
> >     rendering support, enabling --gpu_mode=3Dguest_swiftshader.
> >     GPU vhost user auto mode: not needed for
> >     --gpu_mode=3Dguest_swiftshader. Not enabling vhost user gpu.
> >     Requested resuming a previous session (the default behavior) but th=
e
> >     base images have changed under the overlay, making the overlay inc
> >     ompatible. Wiping the overlay files.
> >     Path for instance UDS: /tmp/cf_avd_1000
> >     Failed to run
> >     `/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/crosvm
> >     create_qcow2 --backing-file /mnt/zroot-133/_OS/Android/aosp_
> >     14/android-image/cuttlefish/instances/cvd-1/persistent_composite.im=
g
> >     /mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/instan
> >     ces/cvd-1/persistent_composite_overlay.img`
> >     stdout:
> >     ###
> >
> >     ###
> >     stderr:
> >     ###
> >     /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/crosvm: riga 3=
:
> >     /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/x86_64-linux-
> >     musl/crosvm: File o directory non esistente
> >
> >     ###
> >     Return code: "127"
> >     qemu: uncaught target signal 6 (Aborted) - core dumped
> >     09-02 23:27:31.223 2729990 2729990 E launch_cvd: subprocess.cpp:207
> >     Subprocess 2730018 was interrupted by a signal 'Aborted' (6)
> >     09-02 23:27:31.224 2729990 2729990 E launch_cvd: main.cc:323
> >     assemble_cvd returned -1
> >
> >     On Mon, Sep 2, 2024 at 11:20=E2=80=AFPM Mario Marietto
> >     <marietto2008@gmail.com <mailto:marietto2008@gmail.com>> wrote:
> >
> >         Hello.
> >
> >         I've downloaded this file :
> >         aosp_cf_arm64_only_phone-img-12309296.zip and this file :
> >         cvd-host_package.tar.gz
> >
> >         from here :
> >
> https://ci.android.com/builds/submitted/12309296/aosp_cf_arm64_only_phone=
-trunk_staging-userdebug/latest
> <
> https://ci.android.com/builds/submitted/12309296/aosp_cf_arm64_only_phone=
-trunk_staging-userdebug/latest
> >
> >
> >         But let's say that I don't want to use the *.img files that are
> >         stored inside "aosp_cf_arm64_only_phone-img-12309296.zip",but
> >         the same files that have been produced when I have compiled thi=
s
> >         version of Android :
> >
> >
> https://github.com/raspberry-vanilla/android_local_manifest?tab=3Dreadme-=
ov-file
> <
> https://github.com/raspberry-vanilla/android_local_manifest?tab=3Dreadme-=
ov-file
> >
> >
> >         Can I do it ? Is it supposed to work the same ?
> >
> >         Thanks.
> >
> >         On Mon, Sep 2, 2024 at 10:23=E2=80=AFPM Pierrick Bouvier
> >         <pierrick.bouvier@linaro.org
> >         <mailto:pierrick.bouvier@linaro.org>> wrote:
> >
> >
> >
> >             On 9/2/24 13:20, Pierrick Bouvier wrote:
> >              > On 9/2/24 12:53, Mario Marietto wrote:
> >              >> Hello Pierrick.
> >              >>
> >              >> With Cuttlefish can I emulate Android 14 for arm64 ? I
> >             ask because in
> >              >> your script I read :
> >              >>
> >              >> "|/home/user/.work/qemu/build/qemu-system-x86_64", so,I
> >             suspect that you
> >              >> have emulated Android x64 bit,but I need arm64. |
> >              >>
> >              >
> >              > Yes, it works for both architecture. The only thing I
> >             didn't try is an
> >              > arm64 vm accelerated with kvm (I don't have this a
> >             linux-aarch64
> >              > machine), but it should work.
> >
> >             And of course, if you want to write a custom wrapper for
> >             qemu, name it
> >             qemu-system-aarch64, and call the same binary instead of
> >             x86_64 variants.
> >
> >              >
> >              >> I also read "for aarch64 images: select
> >              >> |aosp_cf_arm64_only_phone-trunk_staging-userdebug" : I'=
m
> >             not able to
> >              >> download this kind of images. I don't understand how th=
e
> >             Branch Grid
> >              >> works. Can you explain to me a little bit more ?
> >              >> |
> >              >
> >              > You have a link just next to it ("Branch grid") on the
> >             wiki page.
> >              > Once on ci android page, click on filter button (three
> >             bars, inverted
> >              > pyramid), and select
> >             aosp_cf_arm64_only_phone-trunk_staging-userdebug.
> >              > Then go to artifacts, and download image and
> >             cvd_host_x86_64 package, as
> >              > wiki mentions.
> >              >
> >              > Don't hesitate to ask more questions on this. I imagine
> >             this topic might
> >              > interest some people who try to do the same thing.
> >              >
> >              > Pierrick
> >              >
> >              >> |
> >              >> |
> >              >>
> >              >>
> >              >> On Mon, Sep 2, 2024 at 8:47=E2=80=AFPM Pierrick Bouvier
> >              >> <pierrick.bouvier@linaro.org
> >             <mailto:pierrick.bouvier@linaro.org>
> >             <mailto:pierrick.bouvier@linaro.org
> >             <mailto:pierrick.bouvier@linaro.org>>> wrote:
> >              >>
> >              >>      Hello Mario,
> >              >>
> >              >>      very recently, I had to investigate booting time o=
f
> >             Android when using
> >              >>      QEMU. You can probably manage to boot this with
> >             only QEMU alone, but in
> >              >>      my experience, using Cuttlefish tooling is an
> >             easier approach.
> >              >>
> >              >>      If you really want to use only QEMU, you can use
> >             Cuttlefish to get
> >              >>      exact
> >              >>      command line used (which disk goes where), and
> >             iterate from that.
> >              >>
> >              >>      Instructions:
> >              >>
> >
> https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+Andro=
id+using+QEMU
> <
> https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+Andro=
id+using+QEMU>
> <
> https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+Andro=
id+using+QEMU
> <
> https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+Andro=
id+using+QEMU
> >>
> >              >>
> >              >>      As you'll see, I could not get a direct graphic
> >             output, but using
> >              >>      scrcpy, it worked well for me. Hope it can fit you=
r
> >             use case.
> >              >>
> >              >>      Regards,
> >              >>      Pierrick
> >              >>
> >              >>      On 9/2/24 06:49, Mario Marietto wrote:
> >              >>       > Hello.
> >              >>       >
> >              >>       > I would like to emulate Android 14 on my Ubuntu
> >             24.04 OS X64 bit
> >              >>      using
> >              >>       > qemu-system-aarch64. I tried using the followin=
g
> >             parameters :
> >              >>       >
> >              >>       > qemu-system-aarch64 \
> >              >>       >          -smp 4 \
> >              >>       >          -m 2048 \
> >              >>       >          -cpu cortex-a72 \
> >              >>       >          -M virt \
> >              >>       >          -device
> virtio-gpu-pci,xres=3D1024,yres=3D768 \
> >              >>       >          -display sdl,gl=3Don \
> >              >>       >          -device usb-ehci \
> >              >>       >          -device usb-kbd \
> >              >>       >          -device virtio-tablet-pci \
> >              >>       >          -usb \
> >              >>       >          -serial stdio \
> >              >>       >          -kernel
> >             /mnt/zroot-133/_OS/Android/rpi4/Image \
> >              >>       >          -initrd
> >             /mnt/zroot-133/_OS/Android/rpi4/ramdisk.img \
> >              >>       >          -drive
> >              >>       >
> >              >>
> >
>  index=3D0,if=3Dnone,id=3Dsystem,file=3D/mnt/zroot-133/_OS/Android/rpi4/b=
oot.img \
> >              >>       >          -device virtio-blk-pci,drive=3Dboot \
> >              >>       >          -drive
> >              >>       >
> >              >>
> >
>  index=3D1,if=3Dnone,id=3Dsystem,file=3D/mnt/zroot-133/_OS/Android/rpi4/s=
ystem.img \
> >              >>       >          -device virtio-blk-pci,drive=3Dsystem =
\
> >              >>       >          -drive
> >              >>       >
> >              >>
> >
>  index=3D2,if=3Dnone,id=3Dvendor,file=3D/mnt/zroot-133/_OS/Android/rpi4/v=
endor.img \
> >              >>       >          -device virtio-blk-pci,drive=3Dvendor =
\
> >              >>       > -append "console=3DttyAMA0,38400 drm.debug=3D0x=
0
> >             rootwait rootdelay=3D5
> >              >>       > root=3D/dev/mmcblk0p2 androidboot.hardware=3Drp=
i4
> >              >>       > androidboot.selinux=3Dpermissive security=3Dsel=
inux
> >             selinux=3D1
> >              >>       > androidboot.qemu.hw.mainkeys=3D0
> >             androidboot.lcd.density=3D160"
> >              >>       >
> >              >>       > The error I get in short is :
> >              >>       >
> >              >>       > [ 1.993668] init: bool
> >              >>       >
> >              >>
> >
>  android::init::BlockDevInitializer::InitDevices(std::set<std::string>):
> >              >>       > partition(s) not found in /sys, waiting for
> >             their uevent(s):
> >              >>      mmcblk0p2,
> >              >>       > mmcblk0p3
> >              >>       >
> >              >>       >
> >              >>       > One user suggested to :
> >              >>       >
> >              >>       >
> >              >>       >
> >              >>       >
> >              >>       >
> >              >>       > Hi!!! The "/sys" is a "dynamic fs" created at
> >             ram from the
> >              >>      kernel, to
> >              >>       > export a lot of things...so most of the files
> >             only exist at runtime.
> >              >>       > Normally, the partitions from the block device
> >             have a symlink at
> >              >>       > /sys/<something>/<...> that points to /dev/
> >             block node. It seems
> >              >>      that
> >              >>       > there are no such files under /sys according to
> >             what init is looking
> >              >>       > for. You can double check this at init source
> >             code to check the
> >              >>      exact
> >              >>       > path but I'm guessing that you'll have to chang=
e
> >             the qemu arguments
> >              >>       > regarding the block device.
> >              >>       >
> >              >>       > About userdata.img I think it's normal since in
> >             the old days, the
> >              >>      image
> >              >>       > was a "empty sparse image", that means, at the
> >             first flashing
> >              >>      process,
> >              >>       > there isn't userdata information, we're just
> >             "flashing the
> >              >>      partition"
> >              >>       > with empty data.
> >              >>       > Tks!!!
> >              >>       >
> >              >>       >
> >              >>       >
> >              >>       > So,in short I should change the qemu arguments
> >             regarding the block
> >              >>       > device. I tried in this way :
> >              >>       >
> >              >>       >
> >              >>       > qemu-system-aarch64 \
> >              >>       >          -smp 4 \
> >              >>       >          -m 2048 \
> >              >>       >          -cpu cortex-a72 \
> >              >>       >          -M virt \
> >              >>       >          -device
> virtio-gpu-pci,xres=3D1024,yres=3D768 \
> >              >>       >          -display sdl,gl=3Don \
> >              >>       >          -device usb-ehci \
> >              >>       >          -device usb-kbd \
> >              >>       >          -device virtio-tablet-pci \
> >              >>       >          -usb \
> >              >>       >          -serial stdio \
> >              >>       >          -kernel
> >             /mnt/zroot-133/_OS/Android/rpi4/Image \
> >              >>       >          -initrd
> >             /mnt/zroot-133/_OS/Android/rpi4/ramdisk.img \
> >              >>       >          -hda
> >             /mnt/zroot-133/_OS/Android/rpi4/boot.img \
> >              >>       >          -hdb
> >             /mnt/zroot-133/_OS/Android/rpi4/system.img \
> >              >>       >          -hdc
> >             /mnt/zroot-133/_OS/Android/rpi4/vendor.img \
> >              >>       >        -append "console=3DttyAMA0,38400
> >             drm.debug=3D0x0 rootwait
> >              >>      rootdelay=3D5
> >              >>       > root=3D/dev/mmcblk0p2 androidboot.hardware=3Drp=
i4
> >              >>       > androidboot.selinux=3Dpermissive security=3Dsel=
inux
> >             selinux=3D1
> >              >>       > androidboot.qemu.hw.mainkeys=3D0
> >             androidboot.lcd.density=3D160"
> >              >>       >
> >              >>       >
> >              >>       > but the error is still there. Do you know some
> >             different alternative
> >              >>       > block devices to try ? thanks.
> >              >>       >
> >              >>       >
> >              >>       > --
> >              >>       > Mario.
> >              >>
> >              >>
> >              >>
> >              >> --
> >              >> Mario.
> >
> >
> >
> >         --
> >         Mario.
> >
> >
> >
> >     --
> >     Mario.
> >
> >
> >
> > --
> > Mario.
>


--=20
Mario.

--0000000000007cd887062132ede6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-family:monospace"><span style=3D"font-=
weight:bold;color:rgb(84,255,84);background-color:rgb(255,255,255)">ziomari=
o@Z390-AORUS-PRO-DEST</span><span style=3D"color:rgb(0,0,0);background-colo=
r:rgb(255,255,255)">:</span><span style=3D"font-weight:bold;color:rgb(84,84=
,255);background-color:rgb(255,255,255)">/mnt/zroot-133/_OS/Android/aosp_14=
/android-image</span><span style=3D"color:rgb(0,0,0);background-color:rgb(2=
55,255,255)">$ HOME=3D$(pwd) ./bin/launch_cvd -vm_manager qemu_cli -repor</=
span>t_anonymous_usage_stats=3Dn --start_webrtc=3Dfalse
<br></span><div><span style=3D"font-family:monospace"><br></span></div><div=
><span style=3D"font-family:monospace">09-03 10:04:44.206 2786386 2786386 I=
 launch_cvd: main.cc:235 Using system_image_dir of: =C2=A0</span></div><div=
><span style=3D"font-family:monospace"></span></div><span style=3D"font-fam=
ily:monospace">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
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
<br>GPU auto mode: detected prerequisites for accelerated rendering support=
.
<br>Enabling --gpu_mode=3Dgfxstream.
<br>GPU vhost user auto mode: not yet supported with qemu_cli. Not enabling=
 vhost user gpu.
<br>Requested resuming a previous session (the default behavior) but the ba=
se images have changed under the overlay, making the overlay incompatible. =
Wiping the overlay files.
<br>Path for instance UDS: /tmp/cf_avd_1000
<br></span><div><span style=3D"font-family:monospace"><span style=3D"font-w=
eight:bold;color:rgb(84,255,84);background-color:rgb(255,255,255)"><br></sp=
an></span></div><div><span style=3D"font-family:monospace"><span style=3D"f=
ont-weight:bold;color:rgb(84,255,84);background-color:rgb(255,255,255)">The=
 following lines contain useful debugging information:</span><span style=3D=
"color:rgb(0,0,0);background-color:rgb(255,255,255)">
</span></span></div><div><span style=3D"font-family:monospace"></span></div=
><span style=3D"font-family:monospace"><span style=3D"font-weight:bold;colo=
r:rgb(84,255,84);background-color:rgb(255,255,255)"> =C2=A0Serial console i=
s disabled; use -console=3Dtrue to enable it.</span><span style=3D"color:rg=
b(0,0,0);background-color:rgb(255,255,255)">
</span><br><span style=3D"font-weight:bold;color:rgb(84,255,84);background-=
color:rgb(255,255,255)"> =C2=A0Logcat output: /mnt/zroot-133/_OS/Android/ao=
sp_14/android-image/cuttlefish/instances/cvd-1/logs/logcat</span><br><span =
style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">
</span><br><span style=3D"font-weight:bold;color:rgb(84,255,84);background-=
color:rgb(255,255,255)"> =C2=A0Kernel log: /mnt/zroot-133/_OS/Android/aosp_=
14/android-image/cuttlefish/instances/cvd-1/kernel.log</span><span style=3D=
"color:rgb(0,0,0);background-color:rgb(255,255,255)">
</span><br><span style=3D"font-weight:bold;color:rgb(84,255,84);background-=
color:rgb(255,255,255)"> =C2=A0Launcher log: /mnt/zroot-133/_OS/Android/aos=
p_14/android-image/cuttlefish/instances/cvd-1/logs/launcher.log</span><br><=
span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">
</span><br><span style=3D"font-weight:bold;color:rgb(84,255,84);background-=
color:rgb(255,255,255)"> =C2=A0Instance configuration: /mnt/zroot-133/_OS/A=
ndroid/aosp_14/android-image/cuttlefish/instances/cvd-1/cuttlefish_config.j=
son</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,=
255)">
</span><br><span style=3D"font-weight:bold;color:rgb(84,255,84);background-=
color:rgb(255,255,255)"> =C2=A0Launcher Build ID: 12309296</span><span styl=
e=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">
</span><br></span><div><span style=3D"font-family:monospace"><br></span></d=
iv><div><span style=3D"font-family:monospace">/mnt/zroot-133/_OS/Android/ao=
sp_14/android-image/bin/modem_simulator
</span></div><div><span style=3D"font-family:monospace"></span></div><span =
style=3D"font-family:monospace">/mnt/zroot-133/_OS/Android/aosp_14/android-=
image/bin/tombstone_receiver
<br>/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/log_tee
<br>/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/wmediumd
<br>/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/casimir_control_se=
rver
<br>/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/screen_recording_s=
erver
<br>/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/adb_connector
<br>/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/socket_vsock_proxy
<br>/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/socket_vsock_proxy
<br>/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/tcp_connector
<br>/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/control_env_proxy_=
server
<br>/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/echo_server
<br>Start modem simulator, server_fds: 58, Sim type: normal
<br>/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/gnss_grpc_proxy
<br>/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/logcat_receiver
<br>/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/kernel_log_monitor
<br>/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/openwrt_control_se=
rver
<br>/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/log_tee
<br>/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/process_restarter
<br>/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/netsimd
<br>/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/socket_vsock_proxy
<br></span><div><span style=3D"font-family:monospace"><br></span></div><div=
><span style=3D"font-family:monospace">Failed to open socket: Connection re=
fused
</span></div><br><div><br><span style=3D"font-family:monospace"></span></di=
v><span style=3D"font-family:monospace">/mnt/zroot-133/_OS/Android/aosp_14/=
android-image/bin/socket_vsock_proxy
<br>/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/secure_env
<br>/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/x86_64-linux-gnu/q=
emu/qemu-system-aarch64
<br>Server listening on unix:/tmp/cf_avd_1000/cvd-1/grpc_socket/CasimirCont=
rolServer.sock
<br>Server listening on unix:/tmp/cf_avd_1000/cvd-1/grpc_socket/EchoServer.=
sock
<br>Server listening on unix:/tmp/cf_avd_1000/cvd-1/grpc_socket/OpenwrtCont=
rolServer.sock
<br>root-canal I 09-03 10:06:13.219 device_boutique.cc:37 =C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0<span style=3D"color:rgb(255,250,240);background-co=
lor:rgb(255,255,255)">Registering beacon</span><span style=3D"color:rgb(0,0=
,0);background-color:rgb(255,255,255)">
</span><br>root-canal I 09-03 10:06:13.219 device_boutique.cc:37 =C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<span style=3D"color:rgb(255,250,240);backgro=
und-color:rgb(255,255,255)">Registering beacon_swarm</span><span style=3D"c=
olor:rgb(0,0,0);background-color:rgb(255,255,255)">
</span><br>root-canal I 09-03 10:06:13.219 device_boutique.cc:37 =C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<span style=3D"color:rgb(255,250,240);backgro=
und-color:rgb(255,255,255)">Registering scripted_beacon</span><span style=
=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">
</span><br>root-canal I 09-03 10:06:13.219 device_boutique.cc:37 =C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<span style=3D"color:rgb(255,250,240);backgro=
und-color:rgb(255,255,255)">Registering sniffer</span><span style=3D"color:=
rgb(0,0,0);background-color:rgb(255,255,255)">
</span><br>Server listening on unix:/tmp/cf_avd_1000/cvd-1/grpc_socket/Cont=
rolEnvProxyServer.sock
<br>netsimd I 09-03 08:06:13.221 <a href=3D"http://rust_main.rs:98">rust_ma=
in.rs:98</a> - netsim artifacts path: &quot;/tmp/android-ziomario/netsimd&q=
uot;
<br>netsimd I 09-03 08:06:13.221 <a href=3D"http://rust_main.rs:101">rust_m=
ain.rs:101</a> - NetsimdArgs {
<br> =C2=A0=C2=A0=C2=A0fd_startup_str: Some(
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&quot;{\&quot;devices\&quot;=
:[{\&quot;name\&quot;:\&quot;<a href=3D"http://0.0.0.0:6520">0.0.0.0:6520</=
a>\&quot;,\&quot;chips\&quot;:[{\&quot;kind\&quot;:\&quot;BLUETOOTH\&quot;,=
\&quot;fdIn\&quot;:81,\&quot;fdOut\&quot;:82},{\&quot;kind\&quot;:\&quot;UW=
B\&quot;,\&quot;fdIn<br>\&quot;:83,\&quot;fdOut\&quot;:84}]}]}&quot;,
<br> =C2=A0=C2=A0=C2=A0),
<br> =C2=A0=C2=A0=C2=A0no_cli_ui: false,
<br> =C2=A0=C2=A0=C2=A0no_web_ui: false,
<br> =C2=A0=C2=A0=C2=A0pcap: false,
<br> =C2=A0=C2=A0=C2=A0disable_address_reuse: false,
<br> =C2=A0=C2=A0=C2=A0hci_port: Some(
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A07300,
<br> =C2=A0=C2=A0=C2=A0),
<br> =C2=A0=C2=A0=C2=A0connector_instance: None,
<br> =C2=A0=C2=A0=C2=A0instance: Some(
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A01,
<br> =C2=A0=C2=A0=C2=A0),
<br> =C2=A0=C2=A0=C2=A0logtostderr: false,
<br> =C2=A0=C2=A0=C2=A0dev: false,
<br> =C2=A0=C2=A0=C2=A0rust_grpc: false,
<br> =C2=A0=C2=A0=C2=A0rust_hostapd: false,
<br> =C2=A0=C2=A0=C2=A0rust_slirp: true,
<br> =C2=A0=C2=A0=C2=A0vsock: None,
<br> =C2=A0=C2=A0=C2=A0config: None,
<br> =C2=A0=C2=A0=C2=A0host_dns: None,
<br> =C2=A0=C2=A0=C2=A0http_proxy: None,
<br> =C2=A0=C2=A0=C2=A0wifi_tap: None,
<br> =C2=A0=C2=A0=C2=A0test_beacons: false,
<br> =C2=A0=C2=A0=C2=A0no_test_beacons: false,
<br> =C2=A0=C2=A0=C2=A0no_shutdown: false,
<br> =C2=A0=C2=A0=C2=A0verbose: false,
<br> =C2=A0=C2=A0=C2=A0version: false,
<br>}
<br>Size of OBJECT =3D 1204
<br>Size of components in TPMT_SENSITIVE =3D 744
<br> =C2=A0=C2=A0=C2=A0TPMI_ALG_PUBLIC =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02
<br> =C2=A0=C2=A0=C2=A0TPM2B_AUTH =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A050
<br> =C2=A0=C2=A0=C2=A0TPM2B_DIGEST =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
50
<br> =C2=A0=C2=A0=C2=A0TPMU_SENSITIVE_COMPOSITE =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0642
<br>MAX_CONTEXT_SIZE can be reduced to 1264 (1344)
<br>size : 360
<br>starting Rust KeyMint TA implementation in a thread
<br>starting C++ KeyMint implementation in a thread with FDs in=3D31, out=
=3D30
<br>KeyMint Rust TA running with infile=3D37, outfile=3D36, security_level=
=3DSoftware
<br>No secure deletion data file found. Creating one.
<br>I0903 10:06:13.249418 2786724 SharedLibrary.cpp:64] SharedLibrary::open=
 for [libvulkan.so]
<br>
<br>I0903 10:06:13.249507 2786724 SharedLibrary.cpp:76] SharedLibrary::open=
 for [libvulkan.so]: not found in map, open for the first time
<br>
<br>I0903 10:06:13.249511 2786724 SharedLibrary.cpp:186] SharedLibrary::ope=
n for [libvulkan.so] (posix): begin
<br>
<br>I0903 10:06:13.249514 2786724 SharedLibrary.cpp:244] SharedLibrary::ope=
n for [libvulkan.so] (posix,linux): call dlopen on [libvulkan.so<br>]
<br>
<br>added library libvulkan.so
<br>I0903 10:06:13.250535 2786724 HealthMonitor.cpp:280] HealthMonitor disa=
bled.
<br>createGlobalVkEmulation:964 Selecting Vulkan device: NVIDIA GeForce GTX=
 1060 3GB
<br>initialize: Supports id properties, got a vulkan device UUID
<br>I0903 10:06:13.354756 2786724 SharedLibrary.cpp:76] SharedLibrary::open=
 for [libGLESv2.so]: not found in map, open for the first time
<br>
<br>I0903 10:06:13.354764 2786724 SharedLibrary.cpp:186] SharedLibrary::ope=
n for [libGLESv2.so] (posix): begin
<br>
<br>I0903 10:06:13.354768 2786724 SharedLibrary.cpp:244] SharedLibrary::ope=
n for [libGLESv2.so] (posix,linux): call dlopen on [libGLESv2.so<br>]
<br>
<br>I0903 10:06:13.355076 2786724 SharedLibrary.cpp:76] SharedLibrary::open=
 for [libEGL.so]: not found in map, open for the first time
<br>
<br>I0903 10:06:13.355081 2786724 SharedLibrary.cpp:186] SharedLibrary::ope=
n for [libEGL.so] (posix): begin
<br>
<br>I0903 10:06:13.355084 2786724 SharedLibrary.cpp:244] SharedLibrary::ope=
n for [libEGL.so] (posix,linux): call dlopen on [libEGL.so]
<br>
<br>I0903 10:06:13.448821 2786724 VkCommonOperations.cpp:1226] Initializing=
 VkEmulation features:
<br>I0903 10:06:13.448837 2786724 VkCommonOperations.cpp:1227] =C2=A0=C2=A0=
=C2=A0=C2=A0glInteropSupported: true
<br>I0903 10:06:13.448840 2786724 VkCommonOperations.cpp:1228] =C2=A0=C2=A0=
=C2=A0=C2=A0useDeferredCommands: true
<br>I0903 10:06:13.448842 2786724 VkCommonOperations.cpp:1230] =C2=A0=C2=A0=
=C2=A0=C2=A0createResourceWithRequirements: true
<br>I0903 10:06:13.448844 2786724 VkCommonOperations.cpp:1231] =C2=A0=C2=A0=
=C2=A0=C2=A0useVulkanComposition: false
<br>I0903 10:06:13.448846 2786724 VkCommonOperations.cpp:1232] =C2=A0=C2=A0=
=C2=A0=C2=A0useVulkanNativeSwapchain: false
<br>I0903 10:06:13.448848 2786724 VkCommonOperations.cpp:1233] =C2=A0=C2=A0=
=C2=A0=C2=A0enable guestRenderDoc: false
<br>I0903 10:06:13.448850 2786724 VkCommonOperations.cpp:1234] =C2=A0=C2=A0=
=C2=A0=C2=A0ASTC LDR emulation mode: 2
<br>I0903 10:06:13.448852 2786724 VkCommonOperations.cpp:1235] =C2=A0=C2=A0=
=C2=A0=C2=A0enable ETC2 emulation: true
<br>I0903 10:06:13.448854 2786724 VkCommonOperations.cpp:1236] =C2=A0=C2=A0=
=C2=A0=C2=A0enable Ycbcr emulation: false
<br>I0903 10:06:13.448856 2786724 VkCommonOperations.cpp:1237] =C2=A0=C2=A0=
=C2=A0=C2=A0guestUsesAngle: false
<br>I0903 10:06:13.448858 2786724 VkCommonOperations.cpp:1238] =C2=A0=C2=A0=
=C2=A0=C2=A0useDedicatedAllocations: false
<br>I0903 10:06:13.449542 2786724 FrameBuffer.cpp:486] Graphics Adapter Ven=
dor Google (NVIDIA Corporation)
<br>I0903 10:06:13.449548 2786724 FrameBuffer.cpp:487] Graphics Adapter And=
roid Emulator OpenGL ES Translator (NVIDIA GeForce GTX 1060 3GB/<br>PCIe/SS=
E2)
<br>I0903 10:06:13.449551 2786724 FrameBuffer.cpp:488] Graphics API Version=
 OpenGL ES 3.0 (OpenGL ES 3.2 NVIDIA 535.183.01)
<br>I0903 10:06:13.449553 2786724 FrameBuffer.cpp:489] Graphics API Extensi=
ons GL_OES_EGL_sync GL_OES_EGL_image GL_OES_EGL_image_external G<br>L_OES_d=
epth24 GL_OES_depth32 GL_OES_element_index_uint GL_OES_texture_float GL_OES=
_texture_float_linear GL_OES_compressed_paletted_text<br>ure GL_OES_compres=
sed_ETC1_RGB8_texture GL_OES_depth_texture GL_OES_texture_half_float GL_OES=
_texture_half_float_linear GL_OES_packed_d<br>epth_stencil GL_OES_vertex_ha=
lf_float GL_OES_standard_derivatives GL_OES_texture_npot GL_OES_rgb8_rgba8 =
GL_OVR_multiview2 GL_EXT_multiv<br>iew_texture_multisample GL_EXT_color_buf=
fer_float GL_EXT_color_buffer_half_float GL_EXT_texture_format_BGRA8888 GL_=
APPLE_texture_format<br>_BGRA8888 GL_EXT_texture_buffer GL_OES_texture_buff=
er GL_EXT_draw_buffers_indexed =C2=A0<br>I0903 10:06:13.449559 2786724 Fram=
eBuffer.cpp:490] Graphics Device Extensions N/A
<br>GUEST_UBOOT_VERSION: 2024.01-g1ed8f8bde33e-ab12091206 (Jul 10 2024 - 23=
:47:38 +0000)
<br>U-Boot 20
<br>starting Rust KeyMint TA implementation in a thread
<br>starting C++ KeyMint implementation in a thread with FDs in=3D31, out=
=3D30
<br>KeyMint Rust TA running with infile=3D37, outfile=3D36, security_level=
=3DSoftware
<br>Secure deletion data file found. Parsing.
<br>2024-09-03T08:06:13.626075Z qemu-system-aarch64: virtio-serial-bus: Une=
xpected port id 16 for device virtio-serial.0
<br>2024-09-03T08:06:13.626410Z qemu-system-aarch64: virtio-serial-bus: Une=
xpected port id 17 for device virtio-serial.0
<br>2024-09-03T08:06:13.626599Z qemu-system-aarch64: virtio-serial-bus: Une=
xpected port id 18 for device virtio-serial.0
<br>2024-09-03T08:06:13.626788Z qemu-system-aarch64: virtio-serial-bus: Une=
xpected port id 19 for device virtio-serial.0
<br>2024-09-03T08:06:13.626980Z qemu-system-aarch64: virtio-serial-bus: Une=
xpected port id 20 for device virtio-serial.0
<br>2024-09-03T08:06:13.627171Z qemu-system-aarch64: virtio-serial-bus: Une=
xpected port id 21 for device virtio-serial.0
<br>2024-09-03T08:06:13.627360Z qemu-system-aarch64: virtio-serial-bus: Une=
xpected port id 22 for device virtio-serial.0
<br>2024-09-03T08:06:13.627549Z qemu-system-aarch64: virtio-serial-bus: Une=
xpected port id 23 for device virtio-serial.0
<br>2024-09-03T08:06:13.627738Z qemu-system-aarch64: virtio-serial-bus: Une=
xpected port id 24 for device virtio-serial.0
<br>2024-09-03T08:06:13.627930Z qemu-system-aarch64: virtio-serial-bus: Une=
xpected port id 25 for device virtio-serial.0
<br>2024-09-03T08:06:13.628119Z qemu-system-aarch64: virtio-serial-bus: Une=
xpected port id 26 for device virtio-serial.0
<br>2024-09-03T08:06:13.628307Z qemu-system-aarch64: virtio-serial-bus: Une=
xpected port id 27 for device virtio-serial.0
<br>2024-09-03T08:06:13.628496Z qemu-system-aarch64: virtio-serial-bus: Une=
xpected port id 28 for device virtio-serial.0
<br>2024-09-03T08:06:13.628683Z qemu-system-aarch64: virtio-serial-bus: Une=
xpected port id 29 for device virtio-serial.0
<br>2024-09-03T08:06:13.628874Z qemu-system-aarch64: virtio-serial-bus: Une=
xpected port id 30 for device virtio-serial.0
<br></span><div><span style=3D"font-family:monospace"><br></span></div><div=
><span style=3D"font-family:monospace">GUEST_KERNEL_VERSION: 6.6.46-android=
15-8-g3569b053517c-ab12290856-4k (kleaf@build-host) (Android (11368308, +pg=
o, +bolt, +lto, +mlgo, based on r510928) clang version 18.0.0 (<a href=3D"h=
ttps://android.googlesource.com/toolchain/llvm-project">https://android.goo=
glesource.com/toolchain/llvm-project</a> 477610d4d0d988e69dbc3fae4fe86bff3f=
07f2b5</span><span style=3D"font-family:monospace">), LLD 18.0.0) #1 SMP PR=
EEMPT Wed Aug 28 21:43:33 UTC 2024
</span></div><div><span style=3D"font-family:monospace"></span></div><div><=
span style=3D"font-family:monospace">] Linux version
</span></div><div><span style=3D"font-family:monospace"></span></div><span =
style=3D"font-family:monospace">transport message failed, response body: de=
vice &#39;<a href=3D"http://0.0.0.0:6520">0.0.0.0:6520</a>&#39; not found
<br>transport message failed, response body: device &#39;<a href=3D"http://=
0.0.0.0:6520">0.0.0.0:6520</a>&#39; not found
<br>transport message failed, response body: device &#39;<a href=3D"http://=
0.0.0.0:6520">0.0.0.0:6520</a>&#39; not found
<br>transport message failed, response body: device &#39;<a href=3D"http://=
0.0.0.0:6520">0.0.0.0:6520</a>&#39; not found
<br>GUEST_BUILD_FINGERPRINT: generic/aosp_cf_arm64_only_phone/vsoc_arm64_on=
ly:VanillaIceCream/MAIN.1c019b0c/12309296:userdebug/test-keys
<br>transport message failed, response body: device &#39;<a href=3D"http://=
0.0.0.0:6520">0.0.0.0:6520</a>&#39; not found
<br>transport message failed, response body: device &#39;<a href=3D"http://=
0.0.0.0:6520">0.0.0.0:6520</a>&#39; not found
<br></span><div><span style=3D"font-family:monospace">transport message fai=
led, response body: device &#39;<a href=3D"http://0.0.0.0:6520">0.0.0.0:652=
0</a>&#39; not found</span></div><div><span style=3D"font-family:monospace"=
><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">transpo=
rt message failed, response body: device &#39;<a href=3D"http://0.0.0.0:652=
0">0.0.0.0:6520</a>&#39; not found
</span><br>transport message failed, response body: device &#39;<a href=3D"=
http://0.0.0.0:6520">0.0.0.0:6520</a>&#39; not found
<br>transport message failed, response body: device &#39;<a href=3D"http://=
0.0.0.0:6520">0.0.0.0:6520</a>&#39; not found
<br>transport message failed, response body: device &#39;<a href=3D"http://=
0.0.0.0:6520">0.0.0.0:6520</a>&#39; not found
<br>transport message failed, response body: device &#39;<a href=3D"http://=
0.0.0.0:6520">0.0.0.0:6520</a>&#39; not found
<br>init: starting service &#39;adbd&#39;...
<br>proxy_fastboot] Stop event (11) received. Stopping proxy
<br>proxy_adb] Start event (5) received. Starting proxy
<br>proxy_adb] From: tcp: 6520
<br>proxy_adb] To: vsock: 3:5555 vhost_user: false
<br>transport message failed, response body: device &#39;<a href=3D"http://=
0.0.0.0:6520">0.0.0.0:6520</a>&#39; not found
<br>I0903 10:09:30.816108 2787314 IntelDrmDecoder.cpp:38] IntelDrmDecoder c=
reated for context 2
<br>I0903 10:09:32.764820 2787316 IntelDrmDecoder.cpp:38] IntelDrmDecoder c=
reated for context 7
<br>VIRTUAL_DEVICE_DISPLAY_POWER_MODE_CHANGED
<br>VIRTUAL_DEVICE_DISPLAY_POWER_MODE_CHANGED
<br>I0903 10:10:20.918014 2787359 IntelDrmDecoder.cpp:38] IntelDrmDecoder c=
reated for context 11<br></span></div><div><span style=3D"font-family:monos=
pace"><span style=3D"font-weight:bold;color:rgb(84,255,84);background-color=
:rgb(255,255,255)"><br></span></span></div><div><span style=3D"font-family:=
monospace"><span style=3D"font-weight:bold;color:rgb(84,255,84);background-=
color:rgb(255,255,255)">I see a lot of errors,but it seems connected :</spa=
n></span></div><div><span style=3D"font-family:monospace"><span style=3D"fo=
nt-weight:bold;color:rgb(84,255,84);background-color:rgb(255,255,255)"><br>=
</span></span></div><div><span style=3D"font-family:monospace"><span style=
=3D"font-weight:bold;color:rgb(84,255,84);background-color:rgb(255,255,255)=
">ziomario@Z390-AORUS-PRO-DEST</span><span style=3D"color:rgb(0,0,0);backgr=
ound-color:rgb(255,255,255)">:</span><span style=3D"font-weight:bold;color:=
rgb(84,84,255);background-color:rgb(255,255,255)">~/Scrivania</span><span s=
tyle=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">$ adb devices
</span><br>List of devices attached
<br><a href=3D"http://0.0.0.0:6520">0.0.0.0:6520</a> =C2=A0=C2=A0=C2=A0devi=
ce<br></span></div><div><span style=3D"font-family:monospace"><br></span></=
div><div><span style=3D"font-family:monospace">but scrcpy didn&#39;t work :=
</span></div><div><span style=3D"font-family:monospace"><br></span></div><d=
iv><span style=3D"font-family:monospace"><span style=3D"font-weight:bold;co=
lor:rgb(84,255,84);background-color:rgb(255,255,255)">ziomario@Z390-AORUS-P=
RO-DEST</span><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,=
255)">:</span><span style=3D"font-weight:bold;color:rgb(84,84,255);backgrou=
nd-color:rgb(255,255,255)">~/Scrivania</span><span style=3D"color:rgb(0,0,0=
);background-color:rgb(255,255,255)">$ scrcpy
</span><br><br></span></div><div><span style=3D"font-family:monospace">scrc=
py 2.6.1 &lt;<a href=3D"https://github.com/Genymobile/scrcpy">https://githu=
b.com/Genymobile/scrcpy</a>&gt;
<br>INFO: ADB device found:
<br>INFO: =C2=A0=C2=A0=C2=A0=C2=A0--&gt; (tcpip) =C2=A0<a href=3D"http://0.=
0.0.0:6520">0.0.0.0:6520</a> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0device=
 =C2=A0Cuttlefish_arm64_phone_64_bit_only
<br></span></div><div><span style=3D"font-family:monospace"><br></span></di=
v><div><span style=3D"font-family:monospace">/usr/local/share/scrcpy/scrcpy=
-server: 1 file pushed, 0 skipped. 90.0 MB/s (71112 bytes in 0.001s)
<br>[server] INFO: Device: [Google] generic Cuttlefish arm64 phone 64-bit o=
nly (Android 14)
<br>[server] ERROR: Could not register rotation watcher
<br>java.lang.NullPointerException: Attempt to invoke virtual method &#39;j=
ava.lang.Class java.lang.Object.getClass()&#39; on a null object reference
<br> </span></div><div><span style=3D"font-family:monospace"><br></span></d=
iv><div><span style=3D"font-family:monospace">=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 at com.genymobile.scrcpy.wrappers.WindowManager.registerRotationW=
atcher(WindowManager.java:185)
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0at com.genymobile.scrcpy.dev=
ice.Device.&lt;init&gt;(Device.java:93)
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0at com.genymobile.scrcpy.Ser=
ver.scrcpy(Server.java:145)
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0at com.genymobile.scrcpy.Ser=
ver.internalMain(Server.java:290)
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0at com.genymobile.scrcpy.Ser=
ver.main(Server.java:245)
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0at com.android.internal.os.R=
untimeInit.nativeFinishInit(Native Method)
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0at com.android.internal.os.R=
untimeInit.main(RuntimeInit.java:369)
<br></span></div><div><span style=3D"font-family:monospace"><br></span></di=
v><div><span style=3D"font-family:monospace">[server] ERROR: Could not regi=
ster display fold listener</span></div><div><span style=3D"font-family:mono=
space">=C2=A0<br>java.lang.NullPointerException: Attempt to invoke virtual =
method &#39;java.lang.Class java.lang.Object.getClass()&#39; on a null obje=
ct reference=C2=A0</span></div><div><span style=3D"font-family:monospace"><=
br></span></div><div><span style=3D"font-family:monospace"> =C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 at com.genymobile.scrcpy.wrappers.WindowManager.regis=
terDisplayFoldListener(WindowManager.java:206)
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0at com.genymobile.scrcpy.dev=
ice.Device.&lt;init&gt;(Device.java:108)
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0at com.genymobile.scrcpy.Ser=
ver.scrcpy(Server.java:145)
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0at com.genymobile.scrcpy.Ser=
ver.internalMain(Server.java:290)
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0at com.genymobile.scrcpy.Ser=
ver.main(Server.java:245)
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0at com.android.internal.os.R=
untimeInit.nativeFinishInit(Native Method)
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0at com.android.internal.os.R=
untimeInit.main(RuntimeInit.java:369)=C2=A0</span></div><div><span style=3D=
"font-family:monospace"><br></span></div><div><span style=3D"font-family:mo=
nospace">[server] WARN: No clipboard manager, copy-paste between device and=
 computer will not work
<br>[server] ERROR: Attempt to invoke virtual method &#39;android.view.Inpu=
tDevice android.hardware.input.InputManagerGlobal.getInputDevice(int)&#39; =
on a null object reference
<br>java.lang.NullPointerException: Attempt to invoke virtual method &#39;a=
ndroid.view.InputDevice android.hardware.input.InputManagerGlobal.getInputD=
evice(int)&#39; on a null object reference
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0at android.view.KeyCharacter=
Map.load(KeyCharacterMap.java:364)
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0at com.genymobile.scrcpy.con=
trol.Controller.&lt;init&gt;(Controller.java:45)
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0at com.genymobile.scrcpy.Ser=
ver.scrcpy(Server.java:159)
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0at com.genymobile.scrcpy.Ser=
ver.internalMain(Server.java:290)
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0at com.genymobile.scrcpy.Ser=
ver.main(Server.java:245)
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0at com.android.internal.os.R=
untimeInit.nativeFinishInit(Native Method)
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0at com.android.internal.os.R=
untimeInit.main(RuntimeInit.java:369)
<br></span></div><div><span style=3D"font-family:monospace"><br></span></di=
v><div><span style=3D"font-family:monospace">INFO: Renderer: opengl
<br>INFO: OpenGL version: 4.6.0 NVIDIA 535.183.01
<br>INFO: Trilinear filtering enabled
<br>WARN: Device disconnected
<br>ERROR: Demuxer &#39;video&#39;: stream disabled due to connection error
<br>ERROR: Demuxer &#39;audio&#39;: stream disabled due to connection error=
<br></span></div><div><br><span style=3D"font-family:monospace">
</span></div><div><span style=3D"font-family:monospace">Even if the phone i=
s still up :<br></span></div><div><span style=3D"font-family:monospace"><br=
></span></div><div><span style=3D"font-family:monospace"><span style=3D"fon=
t-weight:bold;color:rgb(84,255,84);background-color:rgb(255,255,255)">zioma=
rio@Z390-AORUS-PRO-DEST</span><span style=3D"color:rgb(0,0,0);background-co=
lor:rgb(255,255,255)">:</span><span style=3D"font-weight:bold;color:rgb(84,=
84,255);background-color:rgb(255,255,255)">~/Scrivania</span><span style=3D=
"color:rgb(0,0,0);background-color:rgb(255,255,255)">$ adb devices
</span><br>List of devices attached
<br><a href=3D"http://0.0.0.0:6520">0.0.0.0:6520</a> =C2=A0=C2=A0=C2=A0devi=
ce<br></span></div><div><span style=3D"font-family:monospace"></span></div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Tue, Sep 3, 2024 at 1:03=E2=80=AFAM Pierrick Bouvier &lt;<a href=3D"mail=
to:pierrick.bouvier@linaro.org">pierrick.bouvier@linaro.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">The cvd-host pac=
kage in this case are binaries/libraries compiled for <br>
aarch64, so it can be used on linux aarch64 and benefit from kvm <br>
acceleration.<br>
<br>
In your case, running emulation from a x64 host, you need <br>
cvd-host_package-x86_64.tar.gz instead.<br>
<br>
On 9/2/24 15:38, Mario Marietto wrote:<br>
&gt; Update :<br>
&gt; <br>
&gt; ziomario@Z390-AORUS-PRO-DEST:/mnt/zroot-133/_OS/Android/aosp_14/androi=
d-image/bin$ mkdir x86_64-linux-musl<br>
&gt; <br>
&gt; ziomario@Z390-AORUS-PRO-DEST:/mnt/zroot-133/_OS/Android/aosp_14/androi=
d-image/bin$ cp /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/aarch6=
4-linux-musl/crosvm /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/x8=
6_64-linux-musl<br>
&gt; <br>
&gt; ziomario@Z390-AORUS-PRO-DEST:/mnt/zroot-133/_OS/Android/aosp_14/androi=
d-image$ HOME=3D$(pwd) ./bin/launch_cvd -vm_manager qemu_cli -report_anonym=
ous_usage_stats=3Dn --start_webrtc=3Dfalse<br>
&gt; <br>
&gt; <br>
&gt; Unfortunately it does not work :<br>
&gt; <br>
&gt; <br>
&gt; 09-03 00:03:28.916 2737211 2737211 I launch_cvd: main.cc:235 Using <br=
>
&gt; system_image_dir of:<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; NOTICE:<br>
&gt; <br>
&gt; By using this Android Virtual Device, you agree to<br>
&gt; Google Terms of Service (<a href=3D"https://policies.google.com/terms"=
 rel=3D"noreferrer" target=3D"_blank">https://policies.google.com/terms</a>=
 <br>
&gt; &lt;<a href=3D"https://policies.google.com/terms" rel=3D"noreferrer" t=
arget=3D"_blank">https://policies.google.com/terms</a>&gt;).<br>
&gt; The Google Privacy Policy (<a href=3D"https://policies.google.com/priv=
acy" rel=3D"noreferrer" target=3D"_blank">https://policies.google.com/priva=
cy</a> <br>
&gt; &lt;<a href=3D"https://policies.google.com/privacy" rel=3D"noreferrer"=
 target=3D"_blank">https://policies.google.com/privacy</a>&gt;)<br>
&gt; describes how Google handles information generated as you use<br>
&gt; Google Services.<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; <br>
&gt; Reading --config option from: <br>
&gt; /mnt/zroot-133/_OS/Android/aosp_14/android-image/android-info.txt<br>
&gt; Launching CVD using --config=3D&#39;phone&#39;.<br>
&gt; /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/aarch64-linux-gnu=
/gfxstream_graphics_detector: error while loading shared<br>
&gt; <br>
&gt; libraries: libc.so.6: cannot open shared object file: No such file or =
<br>
&gt; directory<br>
&gt; <br>
&gt; Failed to run graphics detector, bad return value: 127. Assuming no <b=
r>
&gt; availability.<br>
&gt; GPU auto mode: did not detect prerequisites for accelerated rendering =
<br>
&gt; support, enabling --gpu_mode=3Dguest_swiftshader.<br>
&gt; GPU vhost user auto mode: not needed for --gpu_mode=3Dguest_swiftshade=
r. <br>
&gt; Not enabling vhost user gpu.<br>
&gt; Requested resuming a previous session (the default behavior) but the <=
br>
&gt; base images have changed under the overlay, making the overlay <br>
&gt; incompatible. Wiping the overlay files.<br>
&gt; <br>
&gt; Path for instance UDS: /tmp/cf_avd_1000<br>
&gt; <br>
&gt; The following lines contain useful debugging information:<br>
&gt;=C2=A0 =C2=A0Serial console is disabled; use -console=3Dtrue to enable =
it.<br>
&gt;=C2=A0 =C2=A0Logcat output: <br>
&gt; /mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/instances/=
cvd-1/logs/logcat<br>
&gt;=C2=A0 =C2=A0Kernel log: <br>
&gt; /mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/instances/=
cvd-1/kernel.log<br>
&gt;=C2=A0 =C2=A0Launcher log: <br>
&gt; /mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/instances/=
cvd-1/logs/launcher.log<br>
&gt;=C2=A0 =C2=A0Instance configuration: <br>
&gt; /mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/instances/=
cvd-1/cuttlefish_config.json<br>
&gt;=C2=A0 =C2=A0Launcher Build ID: 12309296<br>
&gt; 4. main.cc:232| RunCvdMain|<br>
&gt; 3. main.cc:104| Run|<br>
&gt; 2. server_loop_impl.cpp:89| Run|<br>
&gt; 1. qemu_manager.cpp:247| StartCommands|<br>
&gt; | device/google/cuttlefish/host/libs/vm_manager/qemu_manager.cpp:97<br=
>
&gt; | Result&lt;std::pair&lt;int, int&gt;&gt; cuttlefish::vm_manager::(ano=
nymous <br>
&gt; namespace)::GetQemuVersion(const std::string &amp;)<br>
&gt; v CF_EXPECT(qemu_version_ret =3D=3D 0)<br>
&gt; /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/aarch64-linux-gnu=
/qemu/qemu-system-aarch64 -version returned unexpected response .<br>
&gt; Stderr was <br>
&gt; /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/aarch64-linux-gnu=
/qemu/qemu-system-aarch64: error while loading shared<br>
&gt; <br>
&gt; libraries: libncursesw.so.6: cannot open shared object file: No such <=
br>
&gt; file or directory<br>
&gt; <br>
&gt; On Mon, Sep 2, 2024 at 11:30=E2=80=AFPM Mario Marietto &lt;<a href=3D"=
mailto:marietto2008@gmail.com" target=3D"_blank">marietto2008@gmail.com</a>=
 <br>
&gt; &lt;mailto:<a href=3D"mailto:marietto2008@gmail.com" target=3D"_blank"=
>marietto2008@gmail.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Something is not right :<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0ziomario@Z390-AORUS-PRO-DEST:/mnt/zroot-133/_OS/And=
roid/aosp_14/android-image$ unzip ../aosp_cf_*.zip<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Archive: =C2=A0../aosp_cf_arm64_only_phone-img-1230=
9296.zip<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0inflating: android-info.txt<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0inflating: fastboot-info.txt<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0inflating: kernel_16k<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0inflating: ramdisk_16k.img<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0inflating: boot.img<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0inflating: boot_16k.img<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0inflating: bootloader<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0inflating: init_boot.img<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0inflating: userdata.img<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0inflating: vbmeta.img<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0inflating: vbmeta_system.img<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0inflating: vbmeta_system_dlkm.img<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0inflating: vbmeta_vendor_dlkm.img<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0inflating: vendor_boot.img<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0inflating: super.img<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0ziomario@Z390-AORUS-PRO-DEST:/mnt/zroot-133/_OS/And=
roid/aosp_14/android-image$ tar xzvf ../cvd-host_package.tar.gz<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0./<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/<a href=3D"mailto:android.hardware.keymaste=
r@3.0.so" target=3D"_blank">android.hardware.keymaster@3.0.so</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:android.hardware.keyma=
ster@3.0.so" target=3D"_blank">android.hardware.keymaster@3.0.so</a>&gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/<a href=3D"http://libciborium_io.dylib.so" =
rel=3D"noreferrer" target=3D"_blank">libciborium_io.dylib.so</a> &lt;<a hre=
f=3D"http://libciborium_io.dylib.so" rel=3D"noreferrer" target=3D"_blank">h=
ttp://libciborium_io.dylib.so</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libjpeg.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/cuttlefish_net.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libbase.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/<a href=3D"http://vulkan.pastel.so" rel=3D"=
noreferrer" target=3D"_blank">vulkan.pastel.so</a> &lt;<a href=3D"http://vu=
lkan.pastel.so" rel=3D"noreferrer" target=3D"_blank">http://vulkan.pastel.s=
o</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libcuttlefish_host_config.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/<a href=3D"http://libflagset.dylib.so" rel=
=3D"noreferrer" target=3D"_blank">libflagset.dylib.so</a> &lt;<a href=3D"ht=
tp://libflagset.dylib.so" rel=3D"noreferrer" target=3D"_blank">http://libfl=
agset.dylib.so</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/<a href=3D"http://libkmr_common.dylib.so" r=
el=3D"noreferrer" target=3D"_blank">libkmr_common.dylib.so</a> &lt;<a href=
=3D"http://libkmr_common.dylib.so" rel=3D"noreferrer" target=3D"_blank">htt=
p://libkmr_common.dylib.so</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/<a href=3D"http://libpkcs1.dylib.so" rel=3D=
"noreferrer" target=3D"_blank">libpkcs1.dylib.so</a> &lt;<a href=3D"http://=
libpkcs1.dylib.so" rel=3D"noreferrer" target=3D"_blank">http://libpkcs1.dyl=
ib.so</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libicui18n-host.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libwayland_client.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libunwindstack.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/<a href=3D"http://libkmr_ta.dylib.so" rel=
=3D"noreferrer" target=3D"_blank">libkmr_ta.dylib.so</a> &lt;<a href=3D"htt=
p://libkmr_ta.dylib.so" rel=3D"noreferrer" target=3D"_blank">http://libkmr_=
ta.dylib.so</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/<a href=3D"http://libcoset.dylib.so" rel=3D=
"noreferrer" target=3D"_blank">libcoset.dylib.so</a> &lt;<a href=3D"http://=
libcoset.dylib.so" rel=3D"noreferrer" target=3D"_blank">http://libcoset.dyl=
ib.so</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libcppbor.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libgatekeeper.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libyuv.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libgrpc++.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libkmr_cf_ffi.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libcppcose_rkp.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libcuttlefish_transport.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/liblzma.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/<a href=3D"http://libciborium_ll.dylib.so" =
rel=3D"noreferrer" target=3D"_blank">libciborium_ll.dylib.so</a> &lt;<a hre=
f=3D"http://libciborium_ll.dylib.so" rel=3D"noreferrer" target=3D"_blank">h=
ttp://libciborium_ll.dylib.so</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libcuttlefish_allocd_utils.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libgflags.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/<a href=3D"mailto:android.hardware.keymaste=
r@4.0.so" target=3D"_blank">android.hardware.keymaster@4.0.so</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:android.hardware.keyma=
ster@4.0.so" target=3D"_blank">android.hardware.keymaster@4.0.so</a>&gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/<a href=3D"http://libcfg_if.dylib.so" rel=
=3D"noreferrer" target=3D"_blank">libcfg_if.dylib.so</a> &lt;<a href=3D"htt=
p://libcfg_if.dylib.so" rel=3D"noreferrer" target=3D"_blank">http://libcfg_=
if.dylib.so</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/<a href=3D"http://libspki.dylib.so" rel=3D"=
noreferrer" target=3D"_blank">libspki.dylib.so</a> &lt;<a href=3D"http://li=
bspki.dylib.so" rel=3D"noreferrer" target=3D"_blank">http://libspki.dylib.s=
o</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/<a href=3D"http://libzeroize.dylib.so" rel=
=3D"noreferrer" target=3D"_blank">libzeroize.dylib.so</a> &lt;<a href=3D"ht=
tp://libzeroize.dylib.so" rel=3D"noreferrer" target=3D"_blank">http://libze=
roize.dylib.so</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libcgrouprc.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libprotobuf-cpp-full.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libcutils.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libsqlite.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libcuttlefish_utils_result.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libbinder_ndk.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libext2_uuid-host.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/<a href=3D"http://libhex.dylib.so" rel=3D"n=
oreferrer" target=3D"_blank">libhex.dylib.so</a> &lt;<a href=3D"http://libh=
ex.dylib.so" rel=3D"noreferrer" target=3D"_blank">http://libhex.dylib.so</a=
>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libc_musl.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/<a href=3D"http://libconst_oid.dylib.so" re=
l=3D"noreferrer" target=3D"_blank">libconst_oid.dylib.so</a> &lt;<a href=3D=
"http://libconst_oid.dylib.so" rel=3D"noreferrer" target=3D"_blank">http://=
libconst_oid.dylib.so</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/<a href=3D"http://libprotobuf_support.dylib=
.so" rel=3D"noreferrer" target=3D"_blank">libprotobuf_support.dylib.so</a><=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://libprotobuf_support.dylib.so"=
 rel=3D"noreferrer" target=3D"_blank">http://libprotobuf_support.dylib.so</=
a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/tpm2-tss2-tcti.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/<a href=3D"http://libserde.dylib.so" rel=3D=
"noreferrer" target=3D"_blank">libserde.dylib.so</a> &lt;<a href=3D"http://=
libserde.dylib.so" rel=3D"noreferrer" target=3D"_blank">http://libserde.dyl=
ib.so</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libartpalette.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/liblog.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/<a href=3D"http://libonce_cell.dylib.so" re=
l=3D"noreferrer" target=3D"_blank">libonce_cell.dylib.so</a> &lt;<a href=3D=
"http://libonce_cell.dylib.so" rel=3D"noreferrer" target=3D"_blank">http://=
libonce_cell.dylib.so</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/<a href=3D"http://libthiserror.dylib.so" re=
l=3D"noreferrer" target=3D"_blank">libthiserror.dylib.so</a> &lt;<a href=3D=
"http://libthiserror.dylib.so" rel=3D"noreferrer" target=3D"_blank">http://=
libthiserror.dylib.so</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libssl-host.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libc++.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libext4_utils.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/<a href=3D"http://libpkcs8.dylib.so" rel=3D=
"noreferrer" target=3D"_blank">libpkcs8.dylib.so</a> &lt;<a href=3D"http://=
libpkcs8.dylib.so" rel=3D"noreferrer" target=3D"_blank">http://libpkcs8.dyl=
ib.so</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libsparse-host.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/sandboxed_api_sandbox2.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libcuttlefish_command_util.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/<a href=3D"http://libbssl_sys.dylib.so" rel=
=3D"noreferrer" target=3D"_blank">libbssl_sys.dylib.so</a> &lt;<a href=3D"h=
ttp://libbssl_sys.dylib.so" rel=3D"noreferrer" target=3D"_blank">http://lib=
bssl_sys.dylib.so</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libkeymaster_messages.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libcuttlefish_web.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libvpx.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libopus.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libminijail.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libcurl-host.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libcuttlefish_kernel_log_monitor_utils.so<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/tpm2-tss2-util.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/<a href=3D"http://liblibc.dylib.so" rel=3D"=
noreferrer" target=3D"_blank">liblibc.dylib.so</a> &lt;<a href=3D"http://li=
blibc.dylib.so" rel=3D"noreferrer" target=3D"_blank">http://liblibc.dylib.s=
o</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/<a href=3D"http://libprotobuf.dylib.so" rel=
=3D"noreferrer" target=3D"_blank">libprotobuf.dylib.so</a> &lt;<a href=3D"h=
ttp://libprotobuf.dylib.so" rel=3D"noreferrer" target=3D"_blank">http://lib=
protobuf.dylib.so</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/<a href=3D"http://libbitflags.dylib.so" rel=
=3D"noreferrer" target=3D"_blank">libbitflags.dylib.so</a> &lt;<a href=3D"h=
ttp://libbitflags.dylib.so" rel=3D"noreferrer" target=3D"_blank">http://lib=
bitflags.dylib.so</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libutils.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libjsoncpp.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libext2_blkid-host.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libnl.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/tpm2-tss2-sys.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libartbase.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libxml2.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/<a href=3D"http://libkmr_proto_rust.dylib.s=
o" rel=3D"noreferrer" target=3D"_blank">libkmr_proto_rust.dylib.so</a> &lt;=
<a href=3D"http://libkmr_proto_rust.dylib.so" rel=3D"noreferrer" target=3D"=
_blank">http://libkmr_proto_rust.dylib.so</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libcuttlefish_security.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/<a href=3D"http://libsecure_env_tpm.dylib.s=
o" rel=3D"noreferrer" target=3D"_blank">libsecure_env_tpm.dylib.so</a> &lt;=
<a href=3D"http://libsecure_env_tpm.dylib.so" rel=3D"noreferrer" target=3D"=
_blank">http://libsecure_env_tpm.dylib.so</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libz-host.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libprocessgroup.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libcrypto_utils.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/<a href=3D"http://libder.dylib.so" rel=3D"n=
oreferrer" target=3D"_blank">libder.dylib.so</a> &lt;<a href=3D"http://libd=
er.dylib.so" rel=3D"noreferrer" target=3D"_blank">http://libder.dylib.so</a=
>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libdexfile.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/cf_metrics_proto.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/tpm2-tss2-esys.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libcuttlefish_utils.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libkeymaster_portable.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libfruit.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/tpm2-tss2-rc.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libcap.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/<a href=3D"http://libnix.dylib.so" rel=3D"n=
oreferrer" target=3D"_blank">libnix.dylib.so</a> &lt;<a href=3D"http://libn=
ix.dylib.so" rel=3D"noreferrer" target=3D"_blank">http://libnix.dylib.so</a=
>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libicuuc-host.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libziparchive.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/<a href=3D"http://libkmr_ta_nonsecure.dylib=
.so" rel=3D"noreferrer" target=3D"_blank">libkmr_ta_nonsecure.dylib.so</a><=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://libkmr_ta_nonsecure.dylib.so"=
 rel=3D"noreferrer" target=3D"_blank">http://libkmr_ta_nonsecure.dylib.so</=
a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/<a href=3D"http://libstd.dylib.so" rel=3D"n=
oreferrer" target=3D"_blank">libstd.dylib.so</a> &lt;<a href=3D"http://libs=
td.dylib.so" rel=3D"noreferrer" target=3D"_blank">http://libstd.dylib.so</a=
>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/<a href=3D"http://libhalf.dylib.so" rel=3D"=
noreferrer" target=3D"_blank">libhalf.dylib.so</a> &lt;<a href=3D"http://li=
bhalf.dylib.so" rel=3D"noreferrer" target=3D"_blank">http://libhalf.dylib.s=
o</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/tpm2-tss2-mu.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/<a href=3D"http://libmemoffset.dylib.so" re=
l=3D"noreferrer" target=3D"_blank">libmemoffset.dylib.so</a> &lt;<a href=3D=
"http://libmemoffset.dylib.so" rel=3D"noreferrer" target=3D"_blank">http://=
libmemoffset.dylib.so</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/liblp.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libcuttlefish_fs.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libProxyConfig.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/<a href=3D"http://libopenssl.dylib.so" rel=
=3D"noreferrer" target=3D"_blank">libopenssl.dylib.so</a> &lt;<a href=3D"ht=
tp://libopenssl.dylib.so" rel=3D"noreferrer" target=3D"_blank">http://libop=
enssl.dylib.so</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/<a href=3D"http://libkmr_wire.dylib.so" rel=
=3D"noreferrer" target=3D"_blank">libkmr_wire.dylib.so</a> &lt;<a href=3D"h=
ttp://libkmr_wire.dylib.so" rel=3D"noreferrer" target=3D"_blank">http://lib=
kmr_wire.dylib.so</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/<a href=3D"http://libkmr_crypto_boring.dyli=
b.so" rel=3D"noreferrer" target=3D"_blank">libkmr_crypto_boring.dylib.so</a=
><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://libkmr_crypto_boring.dylib.so=
" rel=3D"noreferrer" target=3D"_blank">http://libkmr_crypto_boring.dylib.so=
</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/<a href=3D"http://liblog_rust.dylib.so" rel=
=3D"noreferrer" target=3D"_blank">liblog_rust.dylib.so</a> &lt;<a href=3D"h=
ttp://liblog_rust.dylib.so" rel=3D"noreferrer" target=3D"_blank">http://lib=
log_rust.dylib.so</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libhidlbase.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libgrpc_wrap.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libgrpc++_unsecure.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/<a href=3D"http://libbytes.dylib.so" rel=3D=
"noreferrer" target=3D"_blank">libbytes.dylib.so</a> &lt;<a href=3D"http://=
libbytes.dylib.so" rel=3D"noreferrer" target=3D"_blank">http://libbytes.dyl=
ib.so</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libsoft_attestation_cert.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libcuttlefish_run_cvd_proto.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libbinder.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libcrypto-host.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libwebm_mkvmuxer.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/<a href=3D"http://libkmr_cf.dylib.so" rel=
=3D"noreferrer" target=3D"_blank">libkmr_cf.dylib.so</a> &lt;<a href=3D"htt=
p://libkmr_cf.dylib.so" rel=3D"noreferrer" target=3D"_blank">http://libkmr_=
cf.dylib.so</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/<a href=3D"http://libciborium.dylib.so" rel=
=3D"noreferrer" target=3D"_blank">libciborium.dylib.so</a> &lt;<a href=3D"h=
ttp://libciborium.dylib.so" rel=3D"noreferrer" target=3D"_blank">http://lib=
ciborium.dylib.so</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/libpuresoftkeymasterdevice_host.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/<a href=3D"http://libx509_cert.dylib.so" re=
l=3D"noreferrer" target=3D"_blank">libx509_cert.dylib.so</a> &lt;<a href=3D=
"http://libx509_cert.dylib.so" rel=3D"noreferrer" target=3D"_blank">http://=
libx509_cert.dylib.so</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0./lib64/<a href=3D"http://libsec1.dylib.so" rel=3D"=
noreferrer" target=3D"_blank">libsec1.dylib.so</a> &lt;<a href=3D"http://li=
bsec1.dylib.so" rel=3D"noreferrer" target=3D"_blank">http://libsec1.dylib.s=
o</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0./nativetest64/<br>
&gt;=C2=A0 =C2=A0 =C2=A0./nativetest64/modem_simulator_test/<br>
&gt;=C2=A0 =C2=A0 =C2=A0./nativetest64/modem_simulator_test/modem_simulator=
_test<br>
&gt;=C2=A0 =C2=A0 =C2=A0./nativetest64/cuttlefish_net_tests/<br>
&gt;=C2=A0 =C2=A0 =C2=A0./nativetest64/cuttlefish_net_tests/cuttlefish_net_=
tests<br>
&gt;=C2=A0 =C2=A0 =C2=A0./etc/<br>
&gt;=C2=A0 =C2=A0 =C2=A0./etc/modem_simulator/<br>
&gt;=C2=A0 =C2=A0 =C2=A0./etc/modem_simulator/files/<br>
&gt;=C2=A0 =C2=A0 =C2=A0./etc/modem_simulator/files/iccprofile_for_sim0_for=
_CtsCarrierApiTestCases.xml<br>
&gt;=C2=A0 =C2=A0 =C2=A0./etc/modem_simulator/files/iccprofile_for_sim0.xml=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0./etc/modem_simulator/files/numeric_operator.xml<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0./etc/cvd_rsa4096.avbpubkey<br>
&gt;=C2=A0 =C2=A0 =C2=A0./etc/bootloader_aarch64/<br>
&gt;=C2=A0 =C2=A0 =C2=A0./etc/bootloader_aarch64/bootloader.qemu<br>
&gt;=C2=A0 =C2=A0 =C2=A0./etc/bootloader_aarch64/bootloader.crosvm<br>
&gt;=C2=A0 =C2=A0 =C2=A0./etc/bootloader_riscv64/<br>
&gt;=C2=A0 =C2=A0 =C2=A0./etc/bootloader_riscv64/bootloader.qemu<br>
&gt;=C2=A0 =C2=A0 =C2=A0./etc/automotive/<br>
&gt;=C2=A0 =C2=A0 =C2=A0./etc/automotive/vhalconfig/<br>
&gt;=C2=A0 =C2=A0 =C2=A0./etc/automotive/vhalconfig/VendorClusterTestProper=
ties.json<br>
&gt;=C2=A0 =C2=A0 =C2=A0./etc/automotive/vhalconfig/DefaultProperties.json<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0./etc/automotive/vhalconfig/TestProperties.json<br>
&gt;=C2=A0 =C2=A0 =C2=A0./etc/automotive/proxy_config.json<br>
&gt;=C2=A0 =C2=A0 =C2=A0./etc/cvd_rsa2048.avbpubkey<br>
&gt;=C2=A0 =C2=A0 =C2=A0./etc/cvd_avb_testkey_rsa4096.pem<br>
&gt;=C2=A0 =C2=A0 =C2=A0./etc/bootloader_arm/<br>
&gt;=C2=A0 =C2=A0 =C2=A0./etc/bootloader_arm/bootloader.qemu<br>
&gt;=C2=A0 =C2=A0 =C2=A0./etc/bootloader_x86_64/<br>
&gt;=C2=A0 =C2=A0 =C2=A0./etc/bootloader_x86_64/bootloader.qemu<br>
&gt;=C2=A0 =C2=A0 =C2=A0./etc/bootloader_x86_64/bootloader.crosvm<br>
&gt;=C2=A0 =C2=A0 =C2=A0./etc/cvd_avb_testkey_rsa2048.pem<br>
&gt;=C2=A0 =C2=A0 =C2=A0./etc/openwrt/<br>
&gt;=C2=A0 =C2=A0 =C2=A0./etc/openwrt/images/<br>
&gt;=C2=A0 =C2=A0 =C2=A0./etc/openwrt/images/openwrt_kernel_aarch64<br>
&gt;=C2=A0 =C2=A0 =C2=A0./etc/openwrt/images/openwrt_rootfs_x86_64<br>
&gt;=C2=A0 =C2=A0 =C2=A0./etc/openwrt/images/openwrt_rootfs_aarch64<br>
&gt;=C2=A0 =C2=A0 =C2=A0./etc/openwrt/images/openwrt_kernel_x86_64<br>
&gt;=C2=A0 =C2=A0 =C2=A0./etc/cvd_config/<br>
&gt;=C2=A0 =C2=A0 =C2=A0./etc/cvd_config/cvd_config_tv.json<br>
&gt;=C2=A0 =C2=A0 =C2=A0./etc/cvd_config/cvd_config_tablet.json<br>
&gt;=C2=A0 =C2=A0 =C2=A0./etc/cvd_config/cvd_config_wear.json<br>
&gt;=C2=A0 =C2=A0 =C2=A0./etc/cvd_config/cvd_config_auto_portrait.json<br>
&gt;=C2=A0 =C2=A0 =C2=A0./etc/cvd_config/cvd_config_slim.json<br>
&gt;=C2=A0 =C2=A0 =C2=A0./etc/cvd_config/cvd_config_go.json<br>
&gt;=C2=A0 =C2=A0 =C2=A0./etc/cvd_config/cvd_config_foldable.json<br>
&gt;=C2=A0 =C2=A0 =C2=A0./etc/cvd_config/cvd_config_auto.json<br>
&gt;=C2=A0 =C2=A0 =C2=A0./etc/cvd_config/cvd_config_auto_md.json<br>
&gt;=C2=A0 =C2=A0 =C2=A0./etc/cvd_config/cvd_config_phone.json<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/vulkan/<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/vulkan/icd.d/<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/vulkan/icd.d/vk_swiftshader_icd.json<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/qemu/<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/qemu/aarch64-linux-gnu/<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/qemu/aarch64-linux-gnu/opensbi-riscv64-=
generic-fw_dynamic.bin<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/qemu/aarch64-linux-gnu/efi-virtio.rom<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/qemu/aarch64-linux-gnu/keymaps/<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/qemu/aarch64-linux-gnu/keymaps/en-us<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/webrtc/<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/webrtc/assets/<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/webrtc/assets/style.css<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/webrtc/assets/index.css<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/webrtc/assets/index.html<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/webrtc/assets/js/<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/webrtc/assets/js/location.js<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/webrtc/assets/js/rootcanal.js<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/webrtc/assets/js/app.js<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/webrtc/assets/js/touch.js<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/webrtc/assets/js/adb.js<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/webrtc/assets/js/index.js<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/webrtc/assets/js/cf_webrtc.js<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/webrtc/assets/js/server_connector.js<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/webrtc/assets/js/controls.js<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/webrtc/assets/controls.css<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/webrtc/assets/custom.css<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/webrtc/assets/client.html<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/webrtc/certs/<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/webrtc/certs/server.p12<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/webrtc/certs/server.key<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/webrtc/certs/trusted.pem<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/webrtc/certs/server.crt<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/zoneinfo/<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/zoneinfo/tzdata<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/crosvm/<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/crosvm/aarch64-linux-gnu/<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/crosvm/aarch64-linux-gnu/seccomp/<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/crosvm/aarch64-linux-gnu/seccomp/snd_nu=
ll_device.policy<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/crosvm/aarch64-linux-gnu/seccomp/gpu_re=
nder_server.policy<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/crosvm/aarch64-linux-gnu/seccomp/batter=
y.policy<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/crosvm/aarch64-linux-gnu/seccomp/block_=
device.policy<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/crosvm/aarch64-linux-gnu/seccomp/pmem_d=
evice.policy<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/crosvm/aarch64-linux-gnu/seccomp/wl_dev=
ice.policy<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/crosvm/aarch64-linux-gnu/seccomp/9p_dev=
ice.policy<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/crosvm/aarch64-linux-gnu/seccomp/input_=
device.policy<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/crosvm/aarch64-linux-gnu/seccomp/net_de=
vice.policy<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/crosvm/aarch64-linux-gnu/seccomp/rng_de=
vice.policy<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/crosvm/aarch64-linux-gnu/seccomp/coiomm=
u_device.policy<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/crosvm/aarch64-linux-gnu/seccomp/gpu_de=
vice.policy<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/crosvm/aarch64-linux-gnu/seccomp/serial=
_device.policy<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/crosvm/aarch64-linux-gnu/seccomp/cras_a=
udio_device.policy<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/crosvm/aarch64-linux-gnu/seccomp/null_a=
udio_device.policy<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/crosvm/aarch64-linux-gnu/seccomp/snd_cr=
as_device.policy<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/crosvm/aarch64-linux-gnu/seccomp/vhost_=
scmi_device.policy<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/crosvm/aarch64-linux-gnu/seccomp/balloo=
n_device.policy<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/crosvm/aarch64-linux-gnu/seccomp/vhost_=
net_device.policy<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/crosvm/aarch64-linux-gnu/seccomp/vhost_=
vsock_device.policy<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/crosvm/aarch64-linux-gnu/seccomp/fs_dev=
ice.policy<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/crosvm/aarch64-linux-gnu/seccomp/video_=
device.policy<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/crosvm/aarch64-linux-gnu/seccomp/xhci_d=
evice.policy<br>
&gt;=C2=A0 =C2=A0 =C2=A0./usr/share/crosvm/aarch64-linux-gnu/seccomp/vios_a=
udio_device.policy<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/modem_simulator<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/ms-tpm-20-ref<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/mkenvimage_slim<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/metrics<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/socket_vsock_proxy<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/resize.f2fs<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/metrics_launcher<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/automotive_vsock_proxy<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/newfs_msdos<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/netsim-ui/<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/netsim-ui/assets/<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/netsim-ui/assets/grid-background.svg<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/netsim-ui/assets/netsim-logo.svg<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/netsim-ui/assets/polar-background.svg<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/netsim-ui/assets/hexagonal-background.png<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/netsim-ui/assets/netsim-logo-b.svg<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/netsim-ui/node_modules/<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/netsim-ui/node_modules/tslib/<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/netsim-ui/node_modules/tslib/tslib.es6.js<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/netsim-ui/index.html<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/netsim-ui/js/<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/netsim-ui/js/device-info.js<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/netsim-ui/js/device-list.js<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/netsim-ui/js/packet-info.js<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/netsim-ui/js/device-dropzone.js<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/netsim-ui/js/navigation-bar.js<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/netsim-ui/js/device-map.js<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/netsim-ui/js/device-dragzone.js<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/netsim-ui/js/netsim-app.js<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/netsim-ui/js/customize-map-button.js<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/netsim-ui/js/device-observer.js<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/netsim-ui/js/license-info.js<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/netsim-ui/js/cube-sprite.js<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/netsim-ui/js/pyramid-sprite.js<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/unpack_bootimg<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/adb<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/extract-vmlinux<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/health<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/screen_recording_server<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/lz4<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/wmediumd_gen_config<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/gnss_grpc_proxy<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/simg2img<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/secure_env<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/mke2fs<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/snapshot_util_cvd<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/cvd_internal_display<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/acloud_translator<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/defrag.f2fs<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/tombstone_receiver<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/root-canal<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/netsimd<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/console_forwarder<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/powerwash_cvd<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/process_restarter<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/fsck.f2fs<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/cvd_host_bugreport<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/extract-ikconfig<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/cvd_internal_status<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/webRTC<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/acloud<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/tcp_connector<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/process_sandboxer<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/webrtc_operator<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/cvd_update_location<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/e2fsdroid<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/avbtool<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/fastboot<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/build_super_image<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/powerbtn_cvd<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/allocd_client<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/dump.f2fs<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/netsim<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/casimir<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/pica<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/cvd_update_security_algorithm<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/record_cvd<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/vhal_proxy_server<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/cvd_status<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/cvd_import_locations<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/launch_cvd<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/cvd_internal_start<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/restart_cvd<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/cvd_internal_host_bugreport<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/mkuserimg_mke2fs<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/fec<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/cvd_internal_env<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/vhost_device_vsock<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/cvd_internal_stop<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/cvd_send_sms<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/assemble_cvd<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/cvd_send_id_disclosure<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/mcopy<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/operator_proxy<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/mkbootfs<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/run_cvd<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/openwrt_control_server<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/mkbootimg<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/kernel_log_monitor<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/mmd<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/toybox<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/crosvm<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/aarch64-linux-musl/<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/aarch64-linux-musl/crosvm<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/sefcontext_compile<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/wmediumd<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/echo_server<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/log_tee<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/lpmake<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/logcat_receiver<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/lpunpack<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/control_env_proxy_server<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/mtools<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/adb_connector<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/aarch64-linux-gnu/<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/aarch64-linux-gnu/libepoxy.so.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/aarch64-linux-gnu/libffi.so.7<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/aarch64-linux-gnu/qemu/<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/aarch64-linux-gnu/qemu/qemu-system-x86_64<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/aarch64-linux-gnu/qemu/libepoxy.so.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/aarch64-linux-gnu/qemu/libvirglrenderer.so.1<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/aarch64-linux-gnu/qemu/libgbm.so.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/aarch64-linux-gnu/qemu/libgfxstream_backend.s=
o.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/aarch64-linux-gnu/qemu/librutabaga_gfx_ffi.so=
.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/aarch64-linux-gnu/qemu/qemu-system-riscv64<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/aarch64-linux-gnu/qemu/qemu-system-aarch64<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/aarch64-linux-gnu/qemu/libc++.so.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/aarch64-linux-gnu/qemu/libunwind.so.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/aarch64-linux-gnu/qemu/libz.so.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/aarch64-linux-gnu/qemu/libc++abi.so.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/aarch64-linux-gnu/libvirglrenderer.so.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/aarch64-linux-gnu/libdrm.so.2<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/aarch64-linux-gnu/libgbm.so.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/aarch64-linux-gnu/libgfxstream_backend.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/aarch64-linux-gnu/libwayland-client.so.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/aarch64-linux-gnu/libminijail.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/aarch64-linux-gnu/gfxstream_graphics_detector=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/aarch64-linux-gnu/crosvm<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/lpadd<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/make_f2fs<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/sandboxer_proxy<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/stop_cvd<br>
&gt;=C2=A0 =C2=A0 =C2=A0./bin/casimir_control_server<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0ziomario@Z390-AORUS-PRO-DEST:/mnt/zroot-133/_OS/And=
roid/aosp_14/android-image$ HOME=3D$(pwd) ./bin/launch_cvd -vm_manager qemu=
_cli -report_anonymous_usage_stats=3Dn --start_webrtc=3Dfalse<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A009-02 23:27:10.473 2729990 2729990 I launch_cvd: ma=
in.cc:235 Using<br>
&gt;=C2=A0 =C2=A0 =C2=A0system_image_dir of:<br>
&gt;=C2=A0 =C2=A0 =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0NOTICE:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0By using this Android Virtual Device, you agree to<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0Google Terms of Service (<a href=3D"https://policie=
s.google.com/terms" rel=3D"noreferrer" target=3D"_blank">https://policies.g=
oogle.com/terms</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://policies.google.com/terms" r=
el=3D"noreferrer" target=3D"_blank">https://policies.google.com/terms</a>&g=
t;).<br>
&gt;=C2=A0 =C2=A0 =C2=A0The Google Privacy Policy (<a href=3D"https://polic=
ies.google.com/privacy" rel=3D"noreferrer" target=3D"_blank">https://polici=
es.google.com/privacy</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://policies.google.com/privacy"=
 rel=3D"noreferrer" target=3D"_blank">https://policies.google.com/privacy</=
a>&gt;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0describes how Google handles information generated =
as you use<br>
&gt;=C2=A0 =C2=A0 =C2=A0Google Services.<br>
&gt;=C2=A0 =C2=A0 =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Reading --config option from:<br>
&gt;=C2=A0 =C2=A0 =C2=A0/mnt/zroot-133/_OS/Android/aosp_14/android-image/an=
droid-info.txt<br>
&gt;=C2=A0 =C2=A0 =C2=A0Launching CVD using --config=3D&#39;phone&#39;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0aarch64-binfmt-P: Could not open &#39;/lib/ld-linux=
-aarch64.so.1&#39;: No<br>
&gt;=C2=A0 =C2=A0 =C2=A0such file or directory<br>
&gt;=C2=A0 =C2=A0 =C2=A0Failed to run graphics detector, bad return value: =
255. Assuming no<br>
&gt;=C2=A0 =C2=A0 =C2=A0availability.<br>
&gt;=C2=A0 =C2=A0 =C2=A0GPU auto mode: did not detect prerequisites for acc=
elerated<br>
&gt;=C2=A0 =C2=A0 =C2=A0rendering support, enabling --gpu_mode=3Dguest_swif=
tshader.<br>
&gt;=C2=A0 =C2=A0 =C2=A0GPU vhost user auto mode: not needed for<br>
&gt;=C2=A0 =C2=A0 =C2=A0--gpu_mode=3Dguest_swiftshader. Not enabling vhost =
user gpu.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Requested resuming a previous session (the default =
behavior) but the<br>
&gt;=C2=A0 =C2=A0 =C2=A0base images have changed under the overlay, making =
the overlay inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0ompatible. Wiping the overlay files.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Path for instance UDS: /tmp/cf_avd_1000<br>
&gt;=C2=A0 =C2=A0 =C2=A0Failed to run<br>
&gt;=C2=A0 =C2=A0 =C2=A0`/mnt/zroot-133/_OS/Android/aosp_14/android-image/b=
in/crosvm<br>
&gt;=C2=A0 =C2=A0 =C2=A0create_qcow2 --backing-file /mnt/zroot-133/_OS/Andr=
oid/aosp_<br>
&gt;=C2=A0 =C2=A0 =C2=A014/android-image/cuttlefish/instances/cvd-1/persist=
ent_composite.img<br>
&gt;=C2=A0 =C2=A0 =C2=A0/mnt/zroot-133/_OS/Android/aosp_14/android-image/cu=
ttlefish/instan<br>
&gt;=C2=A0 =C2=A0 =C2=A0ces/cvd-1/persistent_composite_overlay.img`<br>
&gt;=C2=A0 =C2=A0 =C2=A0stdout:<br>
&gt;=C2=A0 =C2=A0 =C2=A0###<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0###<br>
&gt;=C2=A0 =C2=A0 =C2=A0stderr:<br>
&gt;=C2=A0 =C2=A0 =C2=A0###<br>
&gt;=C2=A0 =C2=A0 =C2=A0/mnt/zroot-133/_OS/Android/aosp_14/android-image/bi=
n/crosvm: riga 3:<br>
&gt;=C2=A0 =C2=A0 =C2=A0/mnt/zroot-133/_OS/Android/aosp_14/android-image/bi=
n/x86_64-linux-<br>
&gt;=C2=A0 =C2=A0 =C2=A0musl/crosvm: File o directory non esistente<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0###<br>
&gt;=C2=A0 =C2=A0 =C2=A0Return code: &quot;127&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0qemu: uncaught target signal 6 (Aborted) - core dum=
ped<br>
&gt;=C2=A0 =C2=A0 =C2=A009-02 23:27:31.223 2729990 2729990 E launch_cvd: su=
bprocess.cpp:207<br>
&gt;=C2=A0 =C2=A0 =C2=A0Subprocess 2730018 was interrupted by a signal &#39=
;Aborted&#39; (6)<br>
&gt;=C2=A0 =C2=A0 =C2=A009-02 23:27:31.224 2729990 2729990 E launch_cvd: ma=
in.cc:323<br>
&gt;=C2=A0 =C2=A0 =C2=A0assemble_cvd returned -1<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Mon, Sep 2, 2024 at 11:20=E2=80=AFPM Mario Marie=
tto<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:marietto2008@gmail.com" targe=
t=3D"_blank">marietto2008@gmail.com</a> &lt;mailto:<a href=3D"mailto:mariet=
to2008@gmail.com" target=3D"_blank">marietto2008@gmail.com</a>&gt;&gt; wrot=
e:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Hello.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I&#39;ve downloaded this file :<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aosp_cf_arm64_only_phone-img-12309296=
.zip and this file :<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cvd-host_package.tar.gz<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from here :<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://ci.android.com/bui=
lds/submitted/12309296/aosp_cf_arm64_only_phone-trunk_staging-userdebug/lat=
est" rel=3D"noreferrer" target=3D"_blank">https://ci.android.com/builds/sub=
mitted/12309296/aosp_cf_arm64_only_phone-trunk_staging-userdebug/latest</a>=
 &lt;<a href=3D"https://ci.android.com/builds/submitted/12309296/aosp_cf_ar=
m64_only_phone-trunk_staging-userdebug/latest" rel=3D"noreferrer" target=3D=
"_blank">https://ci.android.com/builds/submitted/12309296/aosp_cf_arm64_onl=
y_phone-trunk_staging-userdebug/latest</a>&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0But let&#39;s say that I don&#39;t wa=
nt to use the *.img files that are<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stored inside &quot;aosp_cf_arm64_onl=
y_phone-img-12309296.zip&quot;,but<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the same files that have been produce=
d when I have compiled this<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0version of Android :<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/raspber=
ry-vanilla/android_local_manifest?tab=3Dreadme-ov-file" rel=3D"noreferrer" =
target=3D"_blank">https://github.com/raspberry-vanilla/android_local_manife=
st?tab=3Dreadme-ov-file</a> &lt;<a href=3D"https://github.com/raspberry-van=
illa/android_local_manifest?tab=3Dreadme-ov-file" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/raspberry-vanilla/android_local_manifest?tab=
=3Dreadme-ov-file</a>&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Can I do it ? Is it supposed to work =
the same ?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Thanks.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On Mon, Sep 2, 2024 at 10:23=E2=80=AF=
PM Pierrick Bouvier<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:pierrick.bouvie=
r@linaro.org" target=3D"_blank">pierrick.bouvier@linaro.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:pierrick=
.bouvier@linaro.org" target=3D"_blank">pierrick.bouvier@linaro.org</a>&gt;&=
gt; wrote:<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On 9/2/24 13:20, Pierri=
ck Bouvier wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; On 9/2/24 12:53, =
Mario Marietto wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; Hello Pierric=
k.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; With Cuttlefi=
sh can I emulate Android 14 for arm64 ? I<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ask because in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; your script I=
 read :<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; &quot;|/home/=
user/.work/qemu/build/qemu-system-x86_64&quot;, so,I<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0suspect that you<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; have emulated=
 Android x64 bit,but I need arm64. |<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; Yes, it works for=
 both architecture. The only thing I<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0didn&#39;t try is an<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; arm64 vm accelera=
ted with kvm (I don&#39;t have this a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linux-aarch64<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; machine), but it =
should work.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0And of course, if you w=
ant to write a custom wrapper for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu, name it<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu-system-aarch64, an=
d call the same binary instead of<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0x86_64 variants.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; I also read &=
quot;for aarch64 images: select<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; |aosp_cf_arm6=
4_only_phone-trunk_staging-userdebug&quot; : I&#39;m<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0not able to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; download this=
 kind of images. I don&#39;t understand how the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Branch Grid<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; works. Can yo=
u explain to me a little bit more ?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; |<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; You have a link j=
ust next to it (&quot;Branch grid&quot;) on the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wiki page.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; Once on ci androi=
d page, click on filter button (three<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bars, inverted<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; pyramid), and sel=
ect<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aosp_cf_arm64_only_phon=
e-trunk_staging-userdebug.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; Then go to artifa=
cts, and download image and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cvd_host_x86_64 package=
, as<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; wiki mentions.<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; Don&#39;t hesitat=
e to ask more questions on this. I imagine<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0this topic might<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; interest some peo=
ple who try to do the same thing.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; Pierrick<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; |<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; |<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; On Mon, Sep 2=
, 2024 at 8:47=E2=80=AFPM Pierrick Bouvier<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; &lt;<a href=
=3D"mailto:pierrick.bouvier@linaro.org" target=3D"_blank">pierrick.bouvier@=
linaro.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"m=
ailto:pierrick.bouvier@linaro.org" target=3D"_blank">pierrick.bouvier@linar=
o.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"m=
ailto:pierrick.bouvier@linaro.org" target=3D"_blank">pierrick.bouvier@linar=
o.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"m=
ailto:pierrick.bouvier@linaro.org" target=3D"_blank">pierrick.bouvier@linar=
o.org</a>&gt;&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 Hello Mario,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 very recently, I had to investigate booting time of<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Android when using<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 QEMU. You can probably manage to boot this with<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0only QEMU alone, but in=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 my experience, using Cuttlefish tooling is an<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0easier approach.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 If you really want to use only QEMU, you can use<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Cuttlefish to get<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 exact<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 command line used (which disk goes where), and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iterate from that.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 Instructions:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://lina=
ro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+Android+using+QEMU"=
 rel=3D"noreferrer" target=3D"_blank">https://linaro.atlassian.net/wiki/spa=
ces/QEMU/pages/29464068097/Run+Android+using+QEMU</a> &lt;<a href=3D"https:=
//linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+Android+using=
+QEMU" rel=3D"noreferrer" target=3D"_blank">https://linaro.atlassian.net/wi=
ki/spaces/QEMU/pages/29464068097/Run+Android+using+QEMU</a>&gt; &lt;<a href=
=3D"https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+And=
roid+using+QEMU" rel=3D"noreferrer" target=3D"_blank">https://linaro.atlass=
ian.net/wiki/spaces/QEMU/pages/29464068097/Run+Android+using+QEMU</a> &lt;<=
a href=3D"https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/R=
un+Android+using+QEMU" rel=3D"noreferrer" target=3D"_blank">https://linaro.=
atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+Android+using+QEMU</a>=
&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 As you&#39;ll see, I could not get a direct graphic<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0output, but using<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 scrcpy, it worked well for me. Hope it can fit your<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0use case.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 Pierrick<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 On 9/2/24 06:49, Mario Marietto wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt; Hello.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt; I would like to emulate Android 14 on my Ubuntu<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A024.04 OS X64 bit<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 using<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt; qemu-system-aarch64. I tried using the following<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0parameters :<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt; qemu-system-aarch64 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -smp 4 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -m 2048 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -cpu cortex-a72 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -M virt \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -device virtio-gpu-pci,=
xres=3D1024,yres=3D768 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -display sdl,gl=3Don \<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -device usb-ehci \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -device usb-kbd \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -device virtio-tablet-p=
ci \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -usb \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -serial stdio \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -kernel<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/mnt/zroot-133/_OS/Andr=
oid/rpi4/Image \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -initrd<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/mnt/zroot-133/_OS/Andr=
oid/rpi4/ramdisk.img \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0 -drive<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0index=3D0,if=3Dnone,id=
=3Dsystem,file=3D/mnt/zroot-133/_OS/Android/rpi4/boot.img \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -device virtio-blk-pci,=
drive=3Dboot \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -drive<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0index=3D1,if=3Dnone,id=
=3Dsystem,file=3D/mnt/zroot-133/_OS/Android/rpi4/system.img \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -device virtio-blk-pci,=
drive=3Dsystem \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -drive<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0index=3D2,if=3Dnone,id=
=3Dvendor,file=3D/mnt/zroot-133/_OS/Android/rpi4/vendor.img \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -device virtio-blk-pci,=
drive=3Dvendor \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt; -append &quot;console=3DttyAMA0,38400 drm.debug=3D0x0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rootwait rootdelay=3D5<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt; root=3D/dev/mmcblk0p2 androidboot.hardware=3Drpi4<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt; androidboot.selinux=3Dpermissive security=3Dselinux<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0selinux=3D1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt; androidboot.qemu.hw.mainkeys=3D0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0androidboot.lcd.density=
=3D160&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt; The error I get in short is :<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt; [ 1.993668] init: bool<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0android::init::BlockDev=
Initializer::InitDevices(std::set&lt;std::string&gt;):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt; partition(s) not found in /sys, waiting for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0their uevent(s):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 mmcblk0p2,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt; mmcblk0p3<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt; One user suggested to :<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt; Hi!!! The &quot;/sys&quot; is a &quot;dynamic fs&quot; cr=
eated at<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ram from the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 kernel, to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt; export a lot of things...so most of the files<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0only exist at runtime.<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt; Normally, the partitions from the block device<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0have a symlink at<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt; /sys/&lt;something&gt;/&lt;...&gt; that points to /dev/<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0block node. It seems<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 that<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt; there are no such files under /sys according to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0what init is looking<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt; for. You can double check this at init source<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0code to check the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 exact<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt; path but I&#39;m guessing that you&#39;ll have to change<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the qemu arguments<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt; regarding the block device.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt; About userdata.img I think it&#39;s normal since in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the old days, the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 image<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt; was a &quot;empty sparse image&quot;, that means, at the<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0first flashing<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 process,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt; there isn&#39;t userdata information, we&#39;re just<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;flashing the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 partition&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt; with empty data.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt; Tks!!!<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt; So,in short I should change the qemu arguments<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regarding the block<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt; device. I tried in this way :<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt; qemu-system-aarch64 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -smp 4 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -m 2048 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -cpu cortex-a72 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -M virt \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -device virtio-gpu-pci,=
xres=3D1024,yres=3D768 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -display sdl,gl=3Don \<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -device usb-ehci \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -device usb-kbd \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -device virtio-tablet-p=
ci \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -usb \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -serial stdio \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -kernel<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/mnt/zroot-133/_OS/Andr=
oid/rpi4/Image \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -initrd<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/mnt/zroot-133/_OS/Andr=
oid/rpi4/ramdisk.img \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -hda<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/mnt/zroot-133/_OS/Andr=
oid/rpi4/boot.img \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -hdb<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/mnt/zroot-133/_OS/Andr=
oid/rpi4/system.img \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -hdc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/mnt/zroot-133/_OS/Andr=
oid/rpi4/vendor.img \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 -append &quot;console=3DttyAMA=
0,38400<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm.debug=3D0x0 rootwai=
t<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 rootdelay=3D5<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt; root=3D/dev/mmcblk0p2 androidboot.hardware=3Drpi4<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt; androidboot.selinux=3Dpermissive security=3Dselinux<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0selinux=3D1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt; androidboot.qemu.hw.mainkeys=3D0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0androidboot.lcd.density=
=3D160&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt; but the error is still there. Do you know some<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0different alternative<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt; block devices to try ? thanks.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt; --<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt; Mario.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; --<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; Mario.<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mario.<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A0Mario.<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -- <br>
&gt; Mario.<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<br></d=
iv>

--0000000000007cd887062132ede6--
