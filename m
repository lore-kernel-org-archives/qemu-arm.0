Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1483600njf;
        Tue, 3 Sep 2024 08:25:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWEbGM2xCjmuQcsWsut741DjJyuVOREIqwbdOVTOK9DVEnwvNwKkhVs+vciXIm+UkfexZ09yiEAzNp2OA==@linaro.org
X-Google-Smtp-Source: AGHT+IF2ni/t52ydQ7oX5iiTichMZ/DWmzxYrSVJXdLwT7dyZ/nEcaXhuBj08dOKMOg96LCN58Oz
X-Received: by 2002:a05:622a:229e:b0:454:f41a:7211 with SMTP id d75a77b69052e-45705454364mr155328311cf.4.1725377144467;
        Tue, 03 Sep 2024 08:25:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725377144; cv=none;
        d=google.com; s=arc-20160816;
        b=eiVbFKoA05WlKBousX6m9WEQIQoJWMKI5Y2SxoyWrrwuxsgvwm8SICI1NQWVCQqi/y
         Uh8BTbvAFZ+y1YJjFYqPjGANzazZH44aQrfGMNIysWDcb9GeBvr3mPxFHkz9L1NToz2A
         Aeehl0NX79yUY370fNXr0rnAC9JM/zxVTscfbbN5Or+UkCWyzmH4OcX8EA7nPsqGLHgV
         EkCD4fNB4E6k+78EYnulHK3AJ97KkMGmWfCk5exrHmDgBR+cGFn02+saWNHmr0XGXIMQ
         ATS6npcSitog6ezO/BYCrzuoQkovyRocBinSMwahncOjqsrGmivezhTv7yiFS0yyoxZi
         bsRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=UHDqg4Zk6c22u5VpMkT1JE9zHh1Aa5F0Z+DFoutKRTs=;
        fh=NhMb5A3r/6EI1rkHYukPBhektSJbDeSxlxkRVYvVTmY=;
        b=zqhFXm6u21jUPbKwyUPXAOz71FTKiP5XVwNbPy2L+c7CN8rzaAb6Adi7VWRdoEfcJQ
         i3LaeTF5K1yxcGaBgO0bfwIIaYh0Ye0mp2sk5T2p9WwuI+d0yntqEVkOZU4kGniIVEAv
         PCi1SPcV6v6J1fx9O7fKY1jAQobEY4sD2QwddToSklP2tZa+eaf2xQt+gdGqZy0h0G8O
         20OeRigoqOCJIKomFjKuyb1lAmQmErvJnxzYUTEvE8MCUcuYlf3ovYsg6x4FZDyDv9vh
         rMKR0p9WApd2jvuHJluySgJ8e1Cyw97tQvIwo26TYiabi6GCFkFTac0j2ZyocvjlLw3Q
         /DAg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20230601 header.b=j9AoZFBG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=fail header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45682de190esi131510451cf.620.2024.09.03.08.25.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 08:25:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20230601 header.b=j9AoZFBG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=fail header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slVPR-000614-1d; Tue, 03 Sep 2024 11:25:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marietto2008@gmail.com>)
 id 1slVPL-0005uw-Ke; Tue, 03 Sep 2024 11:25:28 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marietto2008@gmail.com>)
 id 1slVPB-0003tI-45; Tue, 03 Sep 2024 11:25:26 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-7cd9d408040so4018596a12.0; 
 Tue, 03 Sep 2024 08:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725377114; x=1725981914; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Px6AC3rRWDEqwo3Y+FXn/0BVXxlBfAGPe1A6VXCMbvg=;
 b=j9AoZFBGLi8R9ZI4Xj31NErxLSYjEmO0990jHR1w52DWM0hnBwMY+xE4xKQxWjluQR
 tiCi9WVElrjtXR2GtFJdCVfdIAaP/xCCQOtfd0SxFU4Ad9lVhHWXkk0gh3A6xRkmKIDv
 X293qDPHtCB98AtQN/vx+z16hj1zD2Ho5IYGiAGH2yGkxLSX9pf65TqL7l07FBZ81ii8
 6WDvodALaYJJ8QhVrV1dz1vXxt7lpIAaArJuDiG6y9+XOjjmOOQjXjLAX6FWd/K3aI1T
 75Iooszf6Ma0KgCHrHSdgb81WjDsnN+NVYepr9+wujhQcAooYggZacvSf0x+ZykEiaaE
 vQRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725377114; x=1725981914;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Px6AC3rRWDEqwo3Y+FXn/0BVXxlBfAGPe1A6VXCMbvg=;
 b=dGn7AH7YpXIRoDr6WlaU+g9XT99c9693AmD9wVOT5MLiTPa4BJQrMbLsE4Mlatp1WN
 hvCVgj66AR1Z5Fh+vj/CKEN2/PDQhbuJk3vk2LJvam+14blEnvDZrcIv440QhOveZG21
 +af6Mcf4A2VeO/DZ+FYGoZviQAaKdxFxshdEYsmRotLBozjdsmsb3w89qN8oTIv2phZF
 WaNLPtpyIEnNJ8f9kbGfL5DjP2l0NquHGFYLTVHS3Sfa8cPt6+UW3j6V2vi7ol/L0SrH
 +5kTtkav4N41VXULdbsQCvcz8gMZK9kutpu6Y00HSIf1rV+fnDAdyNMXuIIqPOSvpa7s
 kRgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzgaTawVaWJRX0qGxiye9WihUUxgTwt4UXdh0rz1IYfFYcr2snkX4c94mmyzX4kGrAJlyV+wgKIQ==@nongnu.org
X-Gm-Message-State: AOJu0YyD0gj/6mIXDX55JStBSjfcPoZOK+CDycGRAWAtH6Sbr8M5zTdt
 VsnXrjJfZcI8zZiQ0Bw8eOHLoFNqhua7h6kiIBTcm2KaUycSw/weDfat+qpQzLfXvEK5MlG4BgI
 pvz6/g2UUZ105whjBd/dhWHhWBTnD/2I2K24=
X-Received: by 2002:a17:90b:3512:b0:2da:5156:1253 with SMTP id
 98e67ed59e1d1-2da7488558amr1396032a91.21.1725377112854; Tue, 03 Sep 2024
 08:25:12 -0700 (PDT)
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
 <CA+1FSijygoVZmTkYR8Xoob4yQQdf9o3CZ2-LmzDrBh2e0VaerQ@mail.gmail.com>
 <CA+1FSigOmKen0QPKSEQqt15Zzrx4UFSCpj+5DJMCJtGnFcE+Hw@mail.gmail.com>
In-Reply-To: <CA+1FSigOmKen0QPKSEQqt15Zzrx4UFSCpj+5DJMCJtGnFcE+Hw@mail.gmail.com>
From: Mario Marietto <marietto2008@gmail.com>
Date: Tue, 3 Sep 2024 17:24:35 +0200
Message-ID: <CA+1FSijfe+5V4RHs-1ow2JwAeiKcmW31V2Ddx9a9zxb_kybDFg@mail.gmail.com>
Subject: Re: Error : init: partition(s) not found in /sys, waiting for their
 uevent(s): mmcblk0p2, mmcblk0p3 while trying to emulate Android 14 on Ubuntu
 24.04 X64 bit using qemu-system-aarch64.
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-discuss@nongnu.org, qemu-arm <qemu-arm@nongnu.org>
Content-Type: multipart/related; boundary="000000000000ea7a9e062138a972"
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=marietto2008@gmail.com; helo=mail-pg1-x533.google.com
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
X-TUID: pPVPBTg9xqgu

--000000000000ea7a9e062138a972
Content-Type: multipart/alternative; boundary="000000000000ea7a9c062138a971"

--000000000000ea7a9c062138a971
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello.

Actually I'm using my Jetson Nano and I'm trying to emulate Android 10 by
antmicro. I'm trying to use the same parameters used several years ago,when
it worked. What I want to try now is to enable virtio-blk-pci on qemu.
Probably in addition to using qemu 5.0,I had configured qemu with
virtio-blk-pci enabled,because I used these parameters and they worked
great :

-drive
index=3D0,if=3Dnone,id=3Dsystem,file=3D/home/aresuser/Desktop/antmicro/aosp=
-img/system-rw.img
\
        -device virtio-blk-pci,drive=3Dsystem \
        -drive
index=3D1,if=3Dnone,id=3Dvendor,file=3D/home/aresuser/Desktop/antmicro/aosp=
-img/vendor-rw.img
\
        -device virtio-blk-pci,drive=3Dvendor \
        -drive
index=3D2,if=3Dnone,id=3Duserdata,file=3D/home/aresuser/Desktop/antmicro/ao=
sp-img/userdata.img
\
        -device virtio-blk-pci,drive=3Duserdata \

Can someone tell me how to enable the "VirtFS support" in qemu 5.0 ?
because at the moment it is configured to "no" :

root@jetson:/home/aresuser/Desktop/antmicro/qemu-5.0.0# ./configure
Install prefix    /usr/local
BIOS directory    /usr/local/share/qemu
firmware path     /usr/local/share/qemu-firmware
binary directory  /usr/local/bin
library directory /usr/local/lib
module directory  /usr/local/lib/qemu
libexec directory /usr/local/libexec
include directory /usr/local/include
config directory  /usr/local/etc
local state directory   /usr/local/var
Manual directory  /usr/local/share/man
ELF interp prefix /usr/gnemul/qemu-%M
Build directory   /home/aresuser/Desktop/antmicro/qemu-5.0.0
Source path       /home/aresuser/Desktop/antmicro/qemu-5.0.0
GIT binary        git
GIT submodules
C compiler        cc
Host C compiler   cc
C++ compiler      c++
Objective-C compiler clang
ARFLAGS           rv
CFLAGS            -O2 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 -g
QEMU_CFLAGS       -I/usr/include/pixman-1 -I$(SRC_PATH)/dtc/libfdt
 -pthread -I/usr/include/glib-2.0
-I/usr/lib/aarch64-linux-gnu/glib-2.0/include -fPIE -DPIE  -D_GNU_SOURCE
-D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -Wstrict-prototypes
-Wredundant-decls -Wall -Wundef -Wwrite-strings -Wmissing-prototypes
-fno-strict-aliasing -fno-common -fwrapv -std=3Dgnu99  -Wexpansion-to-defin=
ed
-Wendif-labels -Wno-shift-negative-value -Wno-missing-include-dirs
-Wempty-body -Wnested-externs -Wformat-security -Wformat-y2k -Winit-self
-Wignored-qualifiers -Wold-style-declaration -Wold-style-definition
-Wtype-limits -fstack-protector-strong  -I/usr/include/libpng16
 -I$(SRC_PATH)/capstone/include
QEMU_LDFLAGS      -L$(BUILD_DIR)/dtc/libfdt -Wl,-z,relro -Wl,-z,now -pie
 -fstack-protector-strong
make              make
install           install
python            /usr/bin/python3 -B (3.10.12)
genisoimage       /usr/bin/genisoimage
slirp support     internal
smbd              /usr/sbin/smbd
module support    no
alt path mod load no
host CPU          aarch64
host big endian   no
target list       aarch64-softmmu alpha-softmmu arm-softmmu cris-softmmu
hppa-softmmu i386-softmmu lm32-softmmu m68k-softmmu microblaze-softmmu
microblazeel-softmmu mips-softmmu mips64-softmmu mips64el-softmmu
mipsel-softmmu moxie-softmmu nios2-softmmu or1k-softmmu ppc-softmmu
ppc64-softmmu riscv32-softmmu riscv64-softmmu rx-softmmu s390x-softmmu
sh4-softmmu sh4eb-softmmu sparc-softmmu sparc64-softmmu tricore-softmmu
unicore32-softmmu x86_64-softmmu xtensa-softmmu xtensaeb-softmmu
aarch64-linux-user aarch64_be-linux-user alpha-linux-user arm-linux-user
armeb-linux-user cris-linux-user hppa-linux-user i386-linux-user
m68k-linux-user microblaze-linux-user microblazeel-linux-user
mips-linux-user mips64-linux-user mips64el-linux-user mipsel-linux-user
mipsn32-linux-user mipsn32el-linux-user nios2-linux-user or1k-linux-user
ppc-linux-user ppc64-linux-user ppc64abi32-linux-user ppc64le-linux-user
riscv32-linux-user riscv64-linux-user s390x-linux-user sh4-linux-user
sh4eb-linux-user sparc-linux-user sparc32plus-linux-user sparc64-linux-user
tilegx-linux-user x86_64-linux-user xtensa-linux-user xtensaeb-linux-user
gprof enabled     no
sparse enabled    no
strip binaries    yes
profiler          no
static build      no
SDL support       yes (2.26.1)
SDL image support no
GTK support       yes (3.24.33)
GTK GL support    yes
VTE support       no
TLS priority      NORMAL
GNUTLS support    no
libgcrypt         no
nettle            no
libtasn1          no
PAM               no
iconv support     yes
curses support    yes
virgl support     no
curl support      no
mingw32 support   no
Audio drivers     pa oss
Block whitelist (rw)
Block whitelist (ro)

*VirtFS support    no*

Multipath support no
VNC support       yes
VNC SASL support  no
VNC JPEG support  yes
VNC PNG support   yes
xen support       no
brlapi support    no
Documentation     no
PIE               yes
vde support       no
netmap support    no
Linux AIO support no
Linux io_uring support no
ATTR/XATTR support yes
Install blobs     yes
KVM support       yes
HAX support       no
HVF support       no
WHPX support      no
TCG support       yes
TCG debug enabled no
TCG interpreter   no
malloc trim support yes
RDMA support      no
PVRDMA support    no
fdt support       git
membarrier        no
preadv support    yes
fdatasync         yes
madvise           yes
posix_madvise     yes
posix_memalign    yes
libcap-ng support no
vhost-net support yes
vhost-crypto support yes
vhost-scsi support yes
vhost-vsock support yes
vhost-user support yes
vhost-user-fs support yes
Trace backends    log
spice support     no
rbd support       no
xfsctl support    no
smartcard support no
libusb            no
usb net redir     no
OpenGL support    yes
OpenGL dmabufs    yes
libiscsi support  no
libnfs support    no
build guest agent yes
QGA VSS support   no
QGA w32 disk info no
QGA MSI support   no
seccomp support   no
coroutine backend ucontext
coroutine pool    yes
debug stack usage no
mutex debugging   no
crypto afalg      no
GlusterFS support no
gcov              gcov
gcov enabled      no
TPM support       yes
libssh support    no
QOM debugging     yes
Live block migration yes
lzo support       no
snappy support    no
bzip2 support     no
lzfse support     no
zstd support      no
NUMA host support yes
libxml2           yes
tcmalloc support  no
jemalloc support  no
avx2 optimization
avx512f optimization no
replication support yes
VxHS block device no
bochs support     yes
cloop support     yes
dmg support       yes
qcow v1 support   yes
vdi support       yes
vvfat support     yes
qed support       yes
parallels support yes
sheepdog support  yes
capstone          internal
libpmem support   no
libudev           yes
default devices   yes
plugin support    no
fuzzing support   no
gdb               /usr/bin/gdb
cross containers  docker

Thanks.

On Tue, Sep 3, 2024 at 10:55=E2=80=AFAM Mario Marietto <marietto2008@gmail.=
com>
wrote:

> Finally it worked :
>
> [image: Istantanea_2024-09-03_10-51-35.jpg]
> Very thanks man. In any case it is VERY slow and not usable at all. Is
> there something that I can do to improve its speed ?
>
>
> On Tue, Sep 3, 2024 at 10:33=E2=80=AFAM Mario Marietto <marietto2008@gmai=
l.com>
> wrote:
>
>> ziomario@Z390-AORUS-PRO-DEST:
>> /mnt/zroot-133/_OS/Android/aosp_14/android-image$ HOME=3D$(pwd)
>> ./bin/launch_cvd -vm_manager qemu_cli -report_anonymous_usage_stats=3Dn
>> --start_webrtc=3Dfalse
>>
>> 09-03 10:04:44.206 2786386 2786386 I launch_cvd: main.cc:235 Using
>> system_image_dir of:
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> NOTICE:
>>
>> By using this Android Virtual Device, you agree to
>> Google Terms of Service (https://policies.google.com/terms).
>> The Google Privacy Policy (https://policies.google.com/privacy)
>> describes how Google handles information generated as you use
>> Google Services.
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> Reading --config option from:
>> /mnt/zroot-133/_OS/Android/aosp_14/android-image/android-info.txt
>> Launching CVD using --config=3D'phone'.
>> GPU auto mode: detected prerequisites for accelerated rendering support.
>> Enabling --gpu_mode=3Dgfxstream.
>> GPU vhost user auto mode: not yet supported with qemu_cli. Not enabling
>> vhost user gpu.
>> Requested resuming a previous session (the default behavior) but the bas=
e
>> images have changed under the overlay, making the overlay incompatible.
>> Wiping the overlay files.
>> Path for instance UDS: /tmp/cf_avd_1000
>>
>> The following lines contain useful debugging information:
>>  Serial console is disabled; use -console=3Dtrue to enable it.
>>  Logcat output:
>> /mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/instances/cv=
d-1/logs/logcat
>>
>>  Kernel log:
>> /mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/instances/cv=
d-1/kernel.log
>>  Launcher log:
>> /mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/instances/cv=
d-1/logs/launcher.log
>>
>>  Instance configuration:
>> /mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/instances/cv=
d-1/cuttlefish_config.json
>>
>>  Launcher Build ID: 12309296
>>
>> /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/modem_simulator
>> /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/tombstone_receiver
>> /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/log_tee
>> /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/wmediumd
>> /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/casimir_control_ser=
ver
>>
>> /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/screen_recording_se=
rver
>>
>> /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/adb_connector
>> /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/socket_vsock_proxy
>> /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/socket_vsock_proxy
>> /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/tcp_connector
>> /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/control_env_proxy_s=
erver
>>
>> /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/echo_server
>> Start modem simulator, server_fds: 58, Sim type: normal
>> /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/gnss_grpc_proxy
>> /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/logcat_receiver
>> /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/kernel_log_monitor
>> /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/openwrt_control_ser=
ver
>>
>> /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/log_tee
>> /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/process_restarter
>> /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/netsimd
>> /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/socket_vsock_proxy
>>
>> Failed to open socket: Connection refused
>>
>>
>> /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/socket_vsock_proxy
>> /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/secure_env
>> /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/x86_64-linux-gnu/qe=
mu/qemu-system-aarch64
>>
>> Server listening on
>> unix:/tmp/cf_avd_1000/cvd-1/grpc_socket/CasimirControlServer.sock
>> Server listening on
>> unix:/tmp/cf_avd_1000/cvd-1/grpc_socket/EchoServer.sock
>> Server listening on
>> unix:/tmp/cf_avd_1000/cvd-1/grpc_socket/OpenwrtControlServer.sock
>> root-canal I 09-03 10:06:13.219 device_boutique.cc:37                   =
 Registering
>> beacon
>> root-canal I 09-03 10:06:13.219 device_boutique.cc:37                   =
 Registering
>> beacon_swarm
>> root-canal I 09-03 10:06:13.219 device_boutique.cc:37                   =
 Registering
>> scripted_beacon
>> root-canal I 09-03 10:06:13.219 device_boutique.cc:37                   =
 Registering
>> sniffer
>> Server listening on
>> unix:/tmp/cf_avd_1000/cvd-1/grpc_socket/ControlEnvProxyServer.sock
>> netsimd I 09-03 08:06:13.221 rust_main.rs:98 - netsim artifacts path:
>> "/tmp/android-ziomario/netsimd"
>> netsimd I 09-03 08:06:13.221 rust_main.rs:101 - NetsimdArgs {
>>    fd_startup_str: Some(
>>        "{\"devices\":[{\"name\":\"0.0.0.0:6520
>> \",\"chips\":[{\"kind\":\"BLUETOOTH\",\"fdIn\":81,\"fdOut\":82},{\"kind\=
":\"UWB\",\"fdIn
>> \":83,\"fdOut\":84}]}]}",
>>    ),
>>    no_cli_ui: false,
>>    no_web_ui: false,
>>    pcap: false,
>>    disable_address_reuse: false,
>>    hci_port: Some(
>>        7300,
>>    ),
>>    connector_instance: None,
>>    instance: Some(
>>        1,
>>    ),
>>    logtostderr: false,
>>    dev: false,
>>    rust_grpc: false,
>>    rust_hostapd: false,
>>    rust_slirp: true,
>>    vsock: None,
>>    config: None,
>>    host_dns: None,
>>    http_proxy: None,
>>    wifi_tap: None,
>>    test_beacons: false,
>>    no_test_beacons: false,
>>    no_shutdown: false,
>>    verbose: false,
>>    version: false,
>> }
>> Size of OBJECT =3D 1204
>> Size of components in TPMT_SENSITIVE =3D 744
>>    TPMI_ALG_PUBLIC                 2
>>    TPM2B_AUTH                      50
>>    TPM2B_DIGEST                    50
>>    TPMU_SENSITIVE_COMPOSITE        642
>> MAX_CONTEXT_SIZE can be reduced to 1264 (1344)
>> size : 360
>> starting Rust KeyMint TA implementation in a thread
>> starting C++ KeyMint implementation in a thread with FDs in=3D31, out=3D=
30
>> KeyMint Rust TA running with infile=3D37, outfile=3D36,
>> security_level=3DSoftware
>> No secure deletion data file found. Creating one.
>> I0903 10:06:13.249418 2786724 SharedLibrary.cpp:64] SharedLibrary::open
>> for [libvulkan.so]
>>
>> I0903 10:06:13.249507 2786724 SharedLibrary.cpp:76] SharedLibrary::open
>> for [libvulkan.so]: not found in map, open for the first time
>>
>> I0903 10:06:13.249511 2786724 SharedLibrary.cpp:186] SharedLibrary::open
>> for [libvulkan.so] (posix): begin
>>
>> I0903 10:06:13.249514 2786724 SharedLibrary.cpp:244] SharedLibrary::open
>> for [libvulkan.so] (posix,linux): call dlopen on [libvulkan.so
>> ]
>>
>> added library libvulkan.so
>> I0903 10:06:13.250535 2786724 HealthMonitor.cpp:280] HealthMonitor
>> disabled.
>> createGlobalVkEmulation:964 Selecting Vulkan device: NVIDIA GeForce GTX
>> 1060 3GB
>> initialize: Supports id properties, got a vulkan device UUID
>> I0903 10:06:13.354756 2786724 SharedLibrary.cpp:76] SharedLibrary::open
>> for [libGLESv2.so]: not found in map, open for the first time
>>
>> I0903 10:06:13.354764 2786724 SharedLibrary.cpp:186] SharedLibrary::open
>> for [libGLESv2.so] (posix): begin
>>
>> I0903 10:06:13.354768 2786724 SharedLibrary.cpp:244] SharedLibrary::open
>> for [libGLESv2.so] (posix,linux): call dlopen on [libGLESv2.so
>> ]
>>
>> I0903 10:06:13.355076 2786724 SharedLibrary.cpp:76] SharedLibrary::open
>> for [libEGL.so]: not found in map, open for the first time
>>
>> I0903 10:06:13.355081 2786724 SharedLibrary.cpp:186] SharedLibrary::open
>> for [libEGL.so] (posix): begin
>>
>> I0903 10:06:13.355084 2786724 SharedLibrary.cpp:244] SharedLibrary::open
>> for [libEGL.so] (posix,linux): call dlopen on [libEGL.so]
>>
>> I0903 10:06:13.448821 2786724 VkCommonOperations.cpp:1226] Initializing
>> VkEmulation features:
>> I0903 10:06:13.448837 2786724 VkCommonOperations.cpp:1227]
>>     glInteropSupported: true
>> I0903 10:06:13.448840 2786724 VkCommonOperations.cpp:1228]
>>     useDeferredCommands: true
>> I0903 10:06:13.448842 2786724 VkCommonOperations.cpp:1230]
>>     createResourceWithRequirements: true
>> I0903 10:06:13.448844 2786724 VkCommonOperations.cpp:1231]
>>     useVulkanComposition: false
>> I0903 10:06:13.448846 2786724 VkCommonOperations.cpp:1232]
>>     useVulkanNativeSwapchain: false
>> I0903 10:06:13.448848 2786724 VkCommonOperations.cpp:1233]     enable
>> guestRenderDoc: false
>> I0903 10:06:13.448850 2786724 VkCommonOperations.cpp:1234]     ASTC LDR
>> emulation mode: 2
>> I0903 10:06:13.448852 2786724 VkCommonOperations.cpp:1235]     enable
>> ETC2 emulation: true
>> I0903 10:06:13.448854 2786724 VkCommonOperations.cpp:1236]     enable
>> Ycbcr emulation: false
>> I0903 10:06:13.448856 2786724 VkCommonOperations.cpp:1237]
>>     guestUsesAngle: false
>> I0903 10:06:13.448858 2786724 VkCommonOperations.cpp:1238]
>>     useDedicatedAllocations: false
>> I0903 10:06:13.449542 2786724 FrameBuffer.cpp:486] Graphics Adapter
>> Vendor Google (NVIDIA Corporation)
>> I0903 10:06:13.449548 2786724 FrameBuffer.cpp:487] Graphics Adapter
>> Android Emulator OpenGL ES Translator (NVIDIA GeForce GTX 1060 3GB/
>> PCIe/SSE2)
>> I0903 10:06:13.449551 2786724 FrameBuffer.cpp:488] Graphics API Version
>> OpenGL ES 3.0 (OpenGL ES 3.2 NVIDIA 535.183.01)
>> I0903 10:06:13.449553 2786724 FrameBuffer.cpp:489] Graphics API
>> Extensions GL_OES_EGL_sync GL_OES_EGL_image GL_OES_EGL_image_external G
>> L_OES_depth24 GL_OES_depth32 GL_OES_element_index_uint
>> GL_OES_texture_float GL_OES_texture_float_linear
>> GL_OES_compressed_paletted_text
>> ure GL_OES_compressed_ETC1_RGB8_texture GL_OES_depth_texture
>> GL_OES_texture_half_float GL_OES_texture_half_float_linear GL_OES_packed=
_d
>> epth_stencil GL_OES_vertex_half_float GL_OES_standard_derivatives
>> GL_OES_texture_npot GL_OES_rgb8_rgba8 GL_OVR_multiview2 GL_EXT_multiv
>> iew_texture_multisample GL_EXT_color_buffer_float
>> GL_EXT_color_buffer_half_float GL_EXT_texture_format_BGRA8888
>> GL_APPLE_texture_format
>> _BGRA8888 GL_EXT_texture_buffer GL_OES_texture_buffer
>> GL_EXT_draw_buffers_indexed
>> I0903 10:06:13.449559 2786724 FrameBuffer.cpp:490] Graphics Device
>> Extensions N/A
>> GUEST_UBOOT_VERSION: 2024.01-g1ed8f8bde33e-ab12091206 (Jul 10 2024 -
>> 23:47:38 +0000)
>> U-Boot 20
>> starting Rust KeyMint TA implementation in a thread
>> starting C++ KeyMint implementation in a thread with FDs in=3D31, out=3D=
30
>> KeyMint Rust TA running with infile=3D37, outfile=3D36,
>> security_level=3DSoftware
>> Secure deletion data file found. Parsing.
>> 2024-09-03T08:06:13.626075Z qemu-system-aarch64: virtio-serial-bus:
>> Unexpected port id 16 for device virtio-serial.0
>> 2024-09-03T08:06:13.626410Z qemu-system-aarch64: virtio-serial-bus:
>> Unexpected port id 17 for device virtio-serial.0
>> 2024-09-03T08:06:13.626599Z qemu-system-aarch64: virtio-serial-bus:
>> Unexpected port id 18 for device virtio-serial.0
>> 2024-09-03T08:06:13.626788Z qemu-system-aarch64: virtio-serial-bus:
>> Unexpected port id 19 for device virtio-serial.0
>> 2024-09-03T08:06:13.626980Z qemu-system-aarch64: virtio-serial-bus:
>> Unexpected port id 20 for device virtio-serial.0
>> 2024-09-03T08:06:13.627171Z qemu-system-aarch64: virtio-serial-bus:
>> Unexpected port id 21 for device virtio-serial.0
>> 2024-09-03T08:06:13.627360Z qemu-system-aarch64: virtio-serial-bus:
>> Unexpected port id 22 for device virtio-serial.0
>> 2024-09-03T08:06:13.627549Z qemu-system-aarch64: virtio-serial-bus:
>> Unexpected port id 23 for device virtio-serial.0
>> 2024-09-03T08:06:13.627738Z qemu-system-aarch64: virtio-serial-bus:
>> Unexpected port id 24 for device virtio-serial.0
>> 2024-09-03T08:06:13.627930Z qemu-system-aarch64: virtio-serial-bus:
>> Unexpected port id 25 for device virtio-serial.0
>> 2024-09-03T08:06:13.628119Z qemu-system-aarch64: virtio-serial-bus:
>> Unexpected port id 26 for device virtio-serial.0
>> 2024-09-03T08:06:13.628307Z qemu-system-aarch64: virtio-serial-bus:
>> Unexpected port id 27 for device virtio-serial.0
>> 2024-09-03T08:06:13.628496Z qemu-system-aarch64: virtio-serial-bus:
>> Unexpected port id 28 for device virtio-serial.0
>> 2024-09-03T08:06:13.628683Z qemu-system-aarch64: virtio-serial-bus:
>> Unexpected port id 29 for device virtio-serial.0
>> 2024-09-03T08:06:13.628874Z qemu-system-aarch64: virtio-serial-bus:
>> Unexpected port id 30 for device virtio-serial.0
>>
>> GUEST_KERNEL_VERSION: 6.6.46-android15-8-g3569b053517c-ab12290856-4k
>> (kleaf@build-host) (Android (11368308, +pgo, +bolt, +lto, +mlgo, based
>> on r510928) clang version 18.0.0 (
>> https://android.googlesource.com/toolchain/llvm-project
>> 477610d4d0d988e69dbc3fae4fe86bff3f07f2b5), LLD 18.0.0) #1 SMP PREEMPT
>> Wed Aug 28 21:43:33 UTC 2024
>> ] Linux version
>> transport message failed, response body: device '0.0.0.0:6520' not found
>> transport message failed, response body: device '0.0.0.0:6520' not found
>> transport message failed, response body: device '0.0.0.0:6520' not found
>> transport message failed, response body: device '0.0.0.0:6520' not found
>> GUEST_BUILD_FINGERPRINT:
>> generic/aosp_cf_arm64_only_phone/vsoc_arm64_only:VanillaIceCream/MAIN.1c=
019b0c/12309296:userdebug/test-keys
>>
>> transport message failed, response body: device '0.0.0.0:6520' not found
>> transport message failed, response body: device '0.0.0.0:6520' not found
>> transport message failed, response body: device '0.0.0.0:6520' not found
>> transport message failed, response body: device '0.0.0.0:6520' not found
>> transport message failed, response body: device '0.0.0.0:6520' not found
>> transport message failed, response body: device '0.0.0.0:6520' not found
>> transport message failed, response body: device '0.0.0.0:6520' not found
>> transport message failed, response body: device '0.0.0.0:6520' not found
>> init: starting service 'adbd'...
>> proxy_fastboot] Stop event (11) received. Stopping proxy
>> proxy_adb] Start event (5) received. Starting proxy
>> proxy_adb] From: tcp: 6520
>> proxy_adb] To: vsock: 3:5555 vhost_user: false
>> transport message failed, response body: device '0.0.0.0:6520' not found
>> I0903 10:09:30.816108 2787314 IntelDrmDecoder.cpp:38] IntelDrmDecoder
>> created for context 2
>> I0903 10:09:32.764820 2787316 IntelDrmDecoder.cpp:38] IntelDrmDecoder
>> created for context 7
>> VIRTUAL_DEVICE_DISPLAY_POWER_MODE_CHANGED
>> VIRTUAL_DEVICE_DISPLAY_POWER_MODE_CHANGED
>> I0903 10:10:20.918014 2787359 IntelDrmDecoder.cpp:38] IntelDrmDecoder
>> created for context 11
>>
>> I see a lot of errors,but it seems connected :
>>
>> ziomario@Z390-AORUS-PRO-DEST:~/Scrivania$ adb devices
>> List of devices attached
>> 0.0.0.0:6520    device
>>
>> but scrcpy didn't work :
>>
>> ziomario@Z390-AORUS-PRO-DEST:~/Scrivania$ scrcpy
>>
>> scrcpy 2.6.1 <https://github.com/Genymobile/scrcpy>
>> INFO: ADB device found:
>> INFO:     --> (tcpip)  0.0.0.0:6520                    device
>>  Cuttlefish_arm64_phone_64_bit_only
>>
>> /usr/local/share/scrcpy/scrcpy-server: 1 file pushed, 0 skipped. 90.0
>> MB/s (71112 bytes in 0.001s)
>> [server] INFO: Device: [Google] generic Cuttlefish arm64 phone 64-bit
>> only (Android 14)
>> [server] ERROR: Could not register rotation watcher
>> java.lang.NullPointerException: Attempt to invoke virtual method
>> 'java.lang.Class java.lang.Object.getClass()' on a null object reference
>>
>>        at
>> com.genymobile.scrcpy.wrappers.WindowManager.registerRotationWatcher(Win=
dowManager.java:185)
>>
>>        at com.genymobile.scrcpy.device.Device.<init>(Device.java:93)
>>        at com.genymobile.scrcpy.Server.scrcpy(Server.java:145)
>>        at com.genymobile.scrcpy.Server.internalMain(Server.java:290)
>>        at com.genymobile.scrcpy.Server.main(Server.java:245)
>>        at com.android.internal.os.RuntimeInit.nativeFinishInit(Native
>> Method)
>>        at com.android.internal.os.RuntimeInit.main(RuntimeInit.java:369)
>>
>> [server] ERROR: Could not register display fold listener
>>
>> java.lang.NullPointerException: Attempt to invoke virtual method
>> 'java.lang.Class java.lang.Object.getClass()' on a null object reference
>>
>>        at
>> com.genymobile.scrcpy.wrappers.WindowManager.registerDisplayFoldListener=
(WindowManager.java:206)
>>
>>        at com.genymobile.scrcpy.device.Device.<init>(Device.java:108)
>>        at com.genymobile.scrcpy.Server.scrcpy(Server.java:145)
>>        at com.genymobile.scrcpy.Server.internalMain(Server.java:290)
>>        at com.genymobile.scrcpy.Server.main(Server.java:245)
>>        at com.android.internal.os.RuntimeInit.nativeFinishInit(Native
>> Method)
>>        at com.android.internal.os.RuntimeInit.main(RuntimeInit.java:369)
>>
>> [server] WARN: No clipboard manager, copy-paste between device and
>> computer will not work
>> [server] ERROR: Attempt to invoke virtual method
>> 'android.view.InputDevice
>> android.hardware.input.InputManagerGlobal.getInputDevice(int)' on a null
>> object reference
>> java.lang.NullPointerException: Attempt to invoke virtual method
>> 'android.view.InputDevice
>> android.hardware.input.InputManagerGlobal.getInputDevice(int)' on a null
>> object reference
>>        at android.view.KeyCharacterMap.load(KeyCharacterMap.java:364)
>>        at
>> com.genymobile.scrcpy.control.Controller.<init>(Controller.java:45)
>>        at com.genymobile.scrcpy.Server.scrcpy(Server.java:159)
>>        at com.genymobile.scrcpy.Server.internalMain(Server.java:290)
>>        at com.genymobile.scrcpy.Server.main(Server.java:245)
>>        at com.android.internal.os.RuntimeInit.nativeFinishInit(Native
>> Method)
>>        at com.android.internal.os.RuntimeInit.main(RuntimeInit.java:369)
>>
>> INFO: Renderer: opengl
>> INFO: OpenGL version: 4.6.0 NVIDIA 535.183.01
>> INFO: Trilinear filtering enabled
>> WARN: Device disconnected
>> ERROR: Demuxer 'video': stream disabled due to connection error
>> ERROR: Demuxer 'audio': stream disabled due to connection error
>>
>> Even if the phone is still up :
>>
>> ziomario@Z390-AORUS-PRO-DEST:~/Scrivania$ adb devices
>> List of devices attached
>> 0.0.0.0:6520    device
>>
>> On Tue, Sep 3, 2024 at 1:03=E2=80=AFAM Pierrick Bouvier <
>> pierrick.bouvier@linaro.org> wrote:
>>
>>> The cvd-host package in this case are binaries/libraries compiled for
>>> aarch64, so it can be used on linux aarch64 and benefit from kvm
>>> acceleration.
>>>
>>> In your case, running emulation from a x64 host, you need
>>> cvd-host_package-x86_64.tar.gz instead.
>>>
>>> On 9/2/24 15:38, Mario Marietto wrote:
>>> > Update :
>>> >
>>> > ziomario@Z390-AORUS-PRO-DEST:/mnt/zroot-133/_OS/Android/aosp_14/andro=
id-image/bin$
>>> mkdir x86_64-linux-musl
>>> >
>>> > ziomario@Z390-AORUS-PRO-DEST:/mnt/zroot-133/_OS/Android/aosp_14/andro=
id-image/bin$
>>> cp
>>> /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/aarch64-linux-musl=
/crosvm
>>> /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/x86_64-linux-musl
>>> >
>>> > ziomario@Z390-AORUS-PRO-DEST:/mnt/zroot-133/_OS/Android/aosp_14/andro=
id-image$
>>> HOME=3D$(pwd) ./bin/launch_cvd -vm_manager qemu_cli
>>> -report_anonymous_usage_stats=3Dn --start_webrtc=3Dfalse
>>> >
>>> >
>>> > Unfortunately it does not work :
>>> >
>>> >
>>> > 09-03 00:03:28.916 2737211 2737211 I launch_cvd: main.cc:235 Using
>>> > system_image_dir of:
>>> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> > NOTICE:
>>> >
>>> > By using this Android Virtual Device, you agree to
>>> > Google Terms of Service (https://policies.google.com/terms
>>> > <https://policies.google.com/terms>).
>>> > The Google Privacy Policy (https://policies.google.com/privacy
>>> > <https://policies.google.com/privacy>)
>>> > describes how Google handles information generated as you use
>>> > Google Services.
>>> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> >
>>> > Reading --config option from:
>>> > /mnt/zroot-133/_OS/Android/aosp_14/android-image/android-info.txt
>>> > Launching CVD using --config=3D'phone'.
>>> >
>>> /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/aarch64-linux-gnu/=
gfxstream_graphics_detector:
>>> error while loading shared
>>> >
>>> > libraries: libc.so.6: cannot open shared object file: No such file or
>>> > directory
>>> >
>>> > Failed to run graphics detector, bad return value: 127. Assuming no
>>> > availability.
>>> > GPU auto mode: did not detect prerequisites for accelerated rendering
>>> > support, enabling --gpu_mode=3Dguest_swiftshader.
>>> > GPU vhost user auto mode: not needed for --gpu_mode=3Dguest_swiftshad=
er.
>>> > Not enabling vhost user gpu.
>>> > Requested resuming a previous session (the default behavior) but the
>>> > base images have changed under the overlay, making the overlay
>>> > incompatible. Wiping the overlay files.
>>> >
>>> > Path for instance UDS: /tmp/cf_avd_1000
>>> >
>>> > The following lines contain useful debugging information:
>>> >   Serial console is disabled; use -console=3Dtrue to enable it.
>>> >   Logcat output:
>>> >
>>> /mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/instances/c=
vd-1/logs/logcat
>>> >   Kernel log:
>>> >
>>> /mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/instances/c=
vd-1/kernel.log
>>> >   Launcher log:
>>> >
>>> /mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/instances/c=
vd-1/logs/launcher.log
>>> >   Instance configuration:
>>> >
>>> /mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/instances/c=
vd-1/cuttlefish_config.json
>>> >   Launcher Build ID: 12309296
>>> > 4. main.cc:232| RunCvdMain|
>>> > 3. main.cc:104| Run|
>>> > 2. server_loop_impl.cpp:89| Run|
>>> > 1. qemu_manager.cpp:247| StartCommands|
>>> > | device/google/cuttlefish/host/libs/vm_manager/qemu_manager.cpp:97
>>> > | Result<std::pair<int, int>> cuttlefish::vm_manager::(anonymous
>>> > namespace)::GetQemuVersion(const std::string &)
>>> > v CF_EXPECT(qemu_version_ret =3D=3D 0)
>>> >
>>> /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/aarch64-linux-gnu/=
qemu/qemu-system-aarch64
>>> -version returned unexpected response .
>>> > Stderr was
>>> >
>>> /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/aarch64-linux-gnu/=
qemu/qemu-system-aarch64:
>>> error while loading shared
>>> >
>>> > libraries: libncursesw.so.6: cannot open shared object file: No such
>>> > file or directory
>>> >
>>> > On Mon, Sep 2, 2024 at 11:30=E2=80=AFPM Mario Marietto <marietto2008@=
gmail.com
>>> > <mailto:marietto2008@gmail.com>> wrote:
>>> >
>>> >     Something is not right :
>>> >
>>> >     ziomario@Z390-AORUS-PRO-DEST:/mnt/zroot-133/_OS/Android/aosp_14/a=
ndroid-image$
>>> unzip ../aosp_cf_*.zip
>>> >
>>> >     Archive:  ../aosp_cf_arm64_only_phone-img-12309296.zip
>>> >       inflating: android-info.txt
>>> >       inflating: fastboot-info.txt
>>> >       inflating: kernel_16k
>>> >       inflating: ramdisk_16k.img
>>> >       inflating: boot.img
>>> >       inflating: boot_16k.img
>>> >       inflating: bootloader
>>> >       inflating: init_boot.img
>>> >       inflating: userdata.img
>>> >       inflating: vbmeta.img
>>> >       inflating: vbmeta_system.img
>>> >       inflating: vbmeta_system_dlkm.img
>>> >       inflating: vbmeta_vendor_dlkm.img
>>> >       inflating: vendor_boot.img
>>> >       inflating: super.img
>>> >
>>> >     ziomario@Z390-AORUS-PRO-DEST:/mnt/zroot-133/_OS/Android/aosp_14/a=
ndroid-image$
>>> tar xzvf ../cvd-host_package.tar.gz
>>> >
>>> >
>>> >     ./
>>> >     ./lib64/
>>> >     ./lib64/android.hardware.keymaster@3.0.so
>>> >     <mailto:android.hardware.keymaster@3.0.so>
>>> >     ./lib64/libciborium_io.dylib.so <http://libciborium_io.dylib.so>
>>> >     ./lib64/libjpeg.so
>>> >     ./lib64/cuttlefish_net.so
>>> >     ./lib64/libbase.so
>>> >     ./lib64/vulkan.pastel.so <http://vulkan.pastel.so>
>>> >     ./lib64/libcuttlefish_host_config.so
>>> >     ./lib64/libflagset.dylib.so <http://libflagset.dylib.so>
>>> >     ./lib64/libkmr_common.dylib.so <http://libkmr_common.dylib.so>
>>> >     ./lib64/libpkcs1.dylib.so <http://libpkcs1.dylib.so>
>>> >     ./lib64/libicui18n-host.so
>>> >     ./lib64/libwayland_client.so
>>> >     ./lib64/libunwindstack.so
>>> >     ./lib64/libkmr_ta.dylib.so <http://libkmr_ta.dylib.so>
>>> >     ./lib64/libcoset.dylib.so <http://libcoset.dylib.so>
>>> >     ./lib64/libcppbor.so
>>> >     ./lib64/libgatekeeper.so
>>> >     ./lib64/libyuv.so
>>> >     ./lib64/libgrpc++.so
>>> >     ./lib64/libkmr_cf_ffi.so
>>> >     ./lib64/libcppcose_rkp.so
>>> >     ./lib64/libcuttlefish_transport.so
>>> >     ./lib64/liblzma.so
>>> >     ./lib64/libciborium_ll.dylib.so <http://libciborium_ll.dylib.so>
>>> >     ./lib64/libcuttlefish_allocd_utils.so
>>> >     ./lib64/libgflags.so
>>> >     ./lib64/android.hardware.keymaster@4.0.so
>>> >     <mailto:android.hardware.keymaster@4.0.so>
>>> >     ./lib64/libcfg_if.dylib.so <http://libcfg_if.dylib.so>
>>> >     ./lib64/libspki.dylib.so <http://libspki.dylib.so>
>>> >     ./lib64/libzeroize.dylib.so <http://libzeroize.dylib.so>
>>> >     ./lib64/libcgrouprc.so
>>> >     ./lib64/libprotobuf-cpp-full.so
>>> >     ./lib64/libcutils.so
>>> >     ./lib64/libsqlite.so
>>> >     ./lib64/libcuttlefish_utils_result.so
>>> >     ./lib64/libbinder_ndk.so
>>> >     ./lib64/libext2_uuid-host.so
>>> >     ./lib64/libhex.dylib.so <http://libhex.dylib.so>
>>> >     ./lib64/libc_musl.so
>>> >     ./lib64/libconst_oid.dylib.so <http://libconst_oid.dylib.so>
>>> >     ./lib64/libprotobuf_support.dylib.so
>>> >     <http://libprotobuf_support.dylib.so>
>>> >     ./lib64/tpm2-tss2-tcti.so
>>> >     ./lib64/libserde.dylib.so <http://libserde.dylib.so>
>>> >     ./lib64/libartpalette.so
>>> >     ./lib64/liblog.so
>>> >     ./lib64/libonce_cell.dylib.so <http://libonce_cell.dylib.so>
>>> >     ./lib64/libthiserror.dylib.so <http://libthiserror.dylib.so>
>>> >     ./lib64/libssl-host.so
>>> >     ./lib64/libc++.so
>>> >     ./lib64/libext4_utils.so
>>> >     ./lib64/libpkcs8.dylib.so <http://libpkcs8.dylib.so>
>>> >     ./lib64/libsparse-host.so
>>> >     ./lib64/sandboxed_api_sandbox2.so
>>> >     ./lib64/libcuttlefish_command_util.so
>>> >     ./lib64/libbssl_sys.dylib.so <http://libbssl_sys.dylib.so>
>>> >     ./lib64/libkeymaster_messages.so
>>> >     ./lib64/libcuttlefish_web.so
>>> >     ./lib64/libvpx.so
>>> >     ./lib64/libopus.so
>>> >     ./lib64/libminijail.so
>>> >     ./lib64/libcurl-host.so
>>> >     ./lib64/libcuttlefish_kernel_log_monitor_utils.so
>>> >     ./lib64/tpm2-tss2-util.so
>>> >     ./lib64/liblibc.dylib.so <http://liblibc.dylib.so>
>>> >     ./lib64/libprotobuf.dylib.so <http://libprotobuf.dylib.so>
>>> >     ./lib64/libbitflags.dylib.so <http://libbitflags.dylib.so>
>>> >     ./lib64/libutils.so
>>> >     ./lib64/libjsoncpp.so
>>> >     ./lib64/libext2_blkid-host.so
>>> >     ./lib64/libnl.so
>>> >     ./lib64/tpm2-tss2-sys.so
>>> >     ./lib64/libartbase.so
>>> >     ./lib64/libxml2.so
>>> >     ./lib64/libkmr_proto_rust.dylib.so <
>>> http://libkmr_proto_rust.dylib.so>
>>> >     ./lib64/libcuttlefish_security.so
>>> >     ./lib64/libsecure_env_tpm.dylib.so <
>>> http://libsecure_env_tpm.dylib.so>
>>> >     ./lib64/libz-host.so
>>> >     ./lib64/libprocessgroup.so
>>> >     ./lib64/libcrypto_utils.so
>>> >     ./lib64/libder.dylib.so <http://libder.dylib.so>
>>> >     ./lib64/libdexfile.so
>>> >     ./lib64/cf_metrics_proto.so
>>> >     ./lib64/tpm2-tss2-esys.so
>>> >     ./lib64/libcuttlefish_utils.so
>>> >     ./lib64/libkeymaster_portable.so
>>> >     ./lib64/libfruit.so
>>> >     ./lib64/tpm2-tss2-rc.so
>>> >     ./lib64/libcap.so
>>> >     ./lib64/libnix.dylib.so <http://libnix.dylib.so>
>>> >     ./lib64/libicuuc-host.so
>>> >     ./lib64/libziparchive.so
>>> >     ./lib64/libkmr_ta_nonsecure.dylib.so
>>> >     <http://libkmr_ta_nonsecure.dylib.so>
>>> >     ./lib64/libstd.dylib.so <http://libstd.dylib.so>
>>> >     ./lib64/libhalf.dylib.so <http://libhalf.dylib.so>
>>> >     ./lib64/tpm2-tss2-mu.so
>>> >     ./lib64/libmemoffset.dylib.so <http://libmemoffset.dylib.so>
>>> >     ./lib64/liblp.so
>>> >     ./lib64/libcuttlefish_fs.so
>>> >     ./lib64/libProxyConfig.so
>>> >     ./lib64/libopenssl.dylib.so <http://libopenssl.dylib.so>
>>> >     ./lib64/libkmr_wire.dylib.so <http://libkmr_wire.dylib.so>
>>> >     ./lib64/libkmr_crypto_boring.dylib.so
>>> >     <http://libkmr_crypto_boring.dylib.so>
>>> >     ./lib64/liblog_rust.dylib.so <http://liblog_rust.dylib.so>
>>> >     ./lib64/libhidlbase.so
>>> >     ./lib64/libgrpc_wrap.so
>>> >     ./lib64/libgrpc++_unsecure.so
>>> >     ./lib64/libbytes.dylib.so <http://libbytes.dylib.so>
>>> >     ./lib64/libsoft_attestation_cert.so
>>> >     ./lib64/libcuttlefish_run_cvd_proto.so
>>> >     ./lib64/libbinder.so
>>> >     ./lib64/libcrypto-host.so
>>> >     ./lib64/libwebm_mkvmuxer.so
>>> >     ./lib64/libkmr_cf.dylib.so <http://libkmr_cf.dylib.so>
>>> >     ./lib64/libciborium.dylib.so <http://libciborium.dylib.so>
>>> >     ./lib64/libpuresoftkeymasterdevice_host.so
>>> >     ./lib64/libx509_cert.dylib.so <http://libx509_cert.dylib.so>
>>> >     ./lib64/libsec1.dylib.so <http://libsec1.dylib.so>
>>> >     ./nativetest64/
>>> >     ./nativetest64/modem_simulator_test/
>>> >     ./nativetest64/modem_simulator_test/modem_simulator_test
>>> >     ./nativetest64/cuttlefish_net_tests/
>>> >     ./nativetest64/cuttlefish_net_tests/cuttlefish_net_tests
>>> >     ./etc/
>>> >     ./etc/modem_simulator/
>>> >     ./etc/modem_simulator/files/
>>> >
>>>  ./etc/modem_simulator/files/iccprofile_for_sim0_for_CtsCarrierApiTestC=
ases.xml
>>> >     ./etc/modem_simulator/files/iccprofile_for_sim0.xml
>>> >     ./etc/modem_simulator/files/numeric_operator.xml
>>> >     ./etc/cvd_rsa4096.avbpubkey
>>> >     ./etc/bootloader_aarch64/
>>> >     ./etc/bootloader_aarch64/bootloader.qemu
>>> >     ./etc/bootloader_aarch64/bootloader.crosvm
>>> >     ./etc/bootloader_riscv64/
>>> >     ./etc/bootloader_riscv64/bootloader.qemu
>>> >     ./etc/automotive/
>>> >     ./etc/automotive/vhalconfig/
>>> >     ./etc/automotive/vhalconfig/VendorClusterTestProperties.json
>>> >     ./etc/automotive/vhalconfig/DefaultProperties.json
>>> >     ./etc/automotive/vhalconfig/TestProperties.json
>>> >     ./etc/automotive/proxy_config.json
>>> >     ./etc/cvd_rsa2048.avbpubkey
>>> >     ./etc/cvd_avb_testkey_rsa4096.pem
>>> >     ./etc/bootloader_arm/
>>> >     ./etc/bootloader_arm/bootloader.qemu
>>> >     ./etc/bootloader_x86_64/
>>> >     ./etc/bootloader_x86_64/bootloader.qemu
>>> >     ./etc/bootloader_x86_64/bootloader.crosvm
>>> >     ./etc/cvd_avb_testkey_rsa2048.pem
>>> >     ./etc/openwrt/
>>> >     ./etc/openwrt/images/
>>> >     ./etc/openwrt/images/openwrt_kernel_aarch64
>>> >     ./etc/openwrt/images/openwrt_rootfs_x86_64
>>> >     ./etc/openwrt/images/openwrt_rootfs_aarch64
>>> >     ./etc/openwrt/images/openwrt_kernel_x86_64
>>> >     ./etc/cvd_config/
>>> >     ./etc/cvd_config/cvd_config_tv.json
>>> >     ./etc/cvd_config/cvd_config_tablet.json
>>> >     ./etc/cvd_config/cvd_config_wear.json
>>> >     ./etc/cvd_config/cvd_config_auto_portrait.json
>>> >     ./etc/cvd_config/cvd_config_slim.json
>>> >     ./etc/cvd_config/cvd_config_go.json
>>> >     ./etc/cvd_config/cvd_config_foldable.json
>>> >     ./etc/cvd_config/cvd_config_auto.json
>>> >     ./etc/cvd_config/cvd_config_auto_md.json
>>> >     ./etc/cvd_config/cvd_config_phone.json
>>> >     ./usr/
>>> >     ./usr/share/
>>> >     ./usr/share/vulkan/
>>> >     ./usr/share/vulkan/icd.d/
>>> >     ./usr/share/vulkan/icd.d/vk_swiftshader_icd.json
>>> >     ./usr/share/qemu/
>>> >     ./usr/share/qemu/aarch64-linux-gnu/
>>> >
>>>  ./usr/share/qemu/aarch64-linux-gnu/opensbi-riscv64-generic-fw_dynamic.=
bin
>>> >     ./usr/share/qemu/aarch64-linux-gnu/efi-virtio.rom
>>> >     ./usr/share/qemu/aarch64-linux-gnu/keymaps/
>>> >     ./usr/share/qemu/aarch64-linux-gnu/keymaps/en-us
>>> >     ./usr/share/webrtc/
>>> >     ./usr/share/webrtc/assets/
>>> >     ./usr/share/webrtc/assets/style.css
>>> >     ./usr/share/webrtc/assets/index.css
>>> >     ./usr/share/webrtc/assets/index.html
>>> >     ./usr/share/webrtc/assets/js/
>>> >     ./usr/share/webrtc/assets/js/location.js
>>> >     ./usr/share/webrtc/assets/js/rootcanal.js
>>> >     ./usr/share/webrtc/assets/js/app.js
>>> >     ./usr/share/webrtc/assets/js/touch.js
>>> >     ./usr/share/webrtc/assets/js/adb.js
>>> >     ./usr/share/webrtc/assets/js/index.js
>>> >     ./usr/share/webrtc/assets/js/cf_webrtc.js
>>> >     ./usr/share/webrtc/assets/js/server_connector.js
>>> >     ./usr/share/webrtc/assets/js/controls.js
>>> >     ./usr/share/webrtc/assets/controls.css
>>> >     ./usr/share/webrtc/assets/custom.css
>>> >     ./usr/share/webrtc/assets/client.html
>>> >     ./usr/share/webrtc/certs/
>>> >     ./usr/share/webrtc/certs/server.p12
>>> >     ./usr/share/webrtc/certs/server.key
>>> >     ./usr/share/webrtc/certs/trusted.pem
>>> >     ./usr/share/webrtc/certs/server.crt
>>> >     ./usr/share/zoneinfo/
>>> >     ./usr/share/zoneinfo/tzdata
>>> >     ./usr/share/crosvm/
>>> >     ./usr/share/crosvm/aarch64-linux-gnu/
>>> >     ./usr/share/crosvm/aarch64-linux-gnu/seccomp/
>>> >     ./usr/share/crosvm/aarch64-linux-gnu/seccomp/snd_null_device.poli=
cy
>>> >
>>>  ./usr/share/crosvm/aarch64-linux-gnu/seccomp/gpu_render_server.policy
>>> >     ./usr/share/crosvm/aarch64-linux-gnu/seccomp/battery.policy
>>> >     ./usr/share/crosvm/aarch64-linux-gnu/seccomp/block_device.policy
>>> >     ./usr/share/crosvm/aarch64-linux-gnu/seccomp/pmem_device.policy
>>> >     ./usr/share/crosvm/aarch64-linux-gnu/seccomp/wl_device.policy
>>> >     ./usr/share/crosvm/aarch64-linux-gnu/seccomp/9p_device.policy
>>> >     ./usr/share/crosvm/aarch64-linux-gnu/seccomp/input_device.policy
>>> >     ./usr/share/crosvm/aarch64-linux-gnu/seccomp/net_device.policy
>>> >     ./usr/share/crosvm/aarch64-linux-gnu/seccomp/rng_device.policy
>>> >     ./usr/share/crosvm/aarch64-linux-gnu/seccomp/coiommu_device.polic=
y
>>> >     ./usr/share/crosvm/aarch64-linux-gnu/seccomp/gpu_device.policy
>>> >     ./usr/share/crosvm/aarch64-linux-gnu/seccomp/serial_device.policy
>>> >
>>>  ./usr/share/crosvm/aarch64-linux-gnu/seccomp/cras_audio_device.policy
>>> >
>>>  ./usr/share/crosvm/aarch64-linux-gnu/seccomp/null_audio_device.policy
>>> >     ./usr/share/crosvm/aarch64-linux-gnu/seccomp/snd_cras_device.poli=
cy
>>> >
>>>  ./usr/share/crosvm/aarch64-linux-gnu/seccomp/vhost_scmi_device.policy
>>> >     ./usr/share/crosvm/aarch64-linux-gnu/seccomp/balloon_device.polic=
y
>>> >
>>>  ./usr/share/crosvm/aarch64-linux-gnu/seccomp/vhost_net_device.policy
>>> >
>>>  ./usr/share/crosvm/aarch64-linux-gnu/seccomp/vhost_vsock_device.policy
>>> >     ./usr/share/crosvm/aarch64-linux-gnu/seccomp/fs_device.policy
>>> >     ./usr/share/crosvm/aarch64-linux-gnu/seccomp/video_device.policy
>>> >     ./usr/share/crosvm/aarch64-linux-gnu/seccomp/xhci_device.policy
>>> >
>>>  ./usr/share/crosvm/aarch64-linux-gnu/seccomp/vios_audio_device.policy
>>> >     ./bin/
>>> >     ./bin/modem_simulator
>>> >     ./bin/ms-tpm-20-ref
>>> >     ./bin/mkenvimage_slim
>>> >     ./bin/metrics
>>> >     ./bin/socket_vsock_proxy
>>> >     ./bin/resize.f2fs
>>> >     ./bin/metrics_launcher
>>> >     ./bin/automotive_vsock_proxy
>>> >     ./bin/newfs_msdos
>>> >     ./bin/netsim-ui/
>>> >     ./bin/netsim-ui/assets/
>>> >     ./bin/netsim-ui/assets/grid-background.svg
>>> >     ./bin/netsim-ui/assets/netsim-logo.svg
>>> >     ./bin/netsim-ui/assets/polar-background.svg
>>> >     ./bin/netsim-ui/assets/hexagonal-background.png
>>> >     ./bin/netsim-ui/assets/netsim-logo-b.svg
>>> >     ./bin/netsim-ui/node_modules/
>>> >     ./bin/netsim-ui/node_modules/tslib/
>>> >     ./bin/netsim-ui/node_modules/tslib/tslib.es6.js
>>> >     ./bin/netsim-ui/index.html
>>> >     ./bin/netsim-ui/js/
>>> >     ./bin/netsim-ui/js/device-info.js
>>> >     ./bin/netsim-ui/js/device-list.js
>>> >     ./bin/netsim-ui/js/packet-info.js
>>> >     ./bin/netsim-ui/js/device-dropzone.js
>>> >     ./bin/netsim-ui/js/navigation-bar.js
>>> >     ./bin/netsim-ui/js/device-map.js
>>> >     ./bin/netsim-ui/js/device-dragzone.js
>>> >     ./bin/netsim-ui/js/netsim-app.js
>>> >     ./bin/netsim-ui/js/customize-map-button.js
>>> >     ./bin/netsim-ui/js/device-observer.js
>>> >     ./bin/netsim-ui/js/license-info.js
>>> >     ./bin/netsim-ui/js/cube-sprite.js
>>> >     ./bin/netsim-ui/js/pyramid-sprite.js
>>> >     ./bin/unpack_bootimg
>>> >     ./bin/adb
>>> >     ./bin/extract-vmlinux
>>> >     ./bin/health
>>> >     ./bin/screen_recording_server
>>> >     ./bin/lz4
>>> >     ./bin/wmediumd_gen_config
>>> >     ./bin/gnss_grpc_proxy
>>> >     ./bin/simg2img
>>> >     ./bin/secure_env
>>> >     ./bin/mke2fs
>>> >     ./bin/snapshot_util_cvd
>>> >     ./bin/cvd_internal_display
>>> >     ./bin/acloud_translator
>>> >     ./bin/defrag.f2fs
>>> >     ./bin/tombstone_receiver
>>> >     ./bin/root-canal
>>> >     ./bin/netsimd
>>> >     ./bin/console_forwarder
>>> >     ./bin/powerwash_cvd
>>> >     ./bin/process_restarter
>>> >     ./bin/fsck.f2fs
>>> >     ./bin/cvd_host_bugreport
>>> >     ./bin/extract-ikconfig
>>> >     ./bin/cvd_internal_status
>>> >     ./bin/webRTC
>>> >     ./bin/acloud
>>> >     ./bin/tcp_connector
>>> >     ./bin/process_sandboxer
>>> >     ./bin/webrtc_operator
>>> >     ./bin/cvd_update_location
>>> >     ./bin/e2fsdroid
>>> >     ./bin/avbtool
>>> >     ./bin/fastboot
>>> >     ./bin/build_super_image
>>> >     ./bin/powerbtn_cvd
>>> >     ./bin/allocd_client
>>> >     ./bin/dump.f2fs
>>> >     ./bin/netsim
>>> >     ./bin/casimir
>>> >     ./bin/pica
>>> >     ./bin/cvd_update_security_algorithm
>>> >     ./bin/record_cvd
>>> >     ./bin/vhal_proxy_server
>>> >     ./bin/cvd_status
>>> >     ./bin/cvd_import_locations
>>> >     ./bin/launch_cvd
>>> >     ./bin/cvd_internal_start
>>> >     ./bin/restart_cvd
>>> >     ./bin/cvd_internal_host_bugreport
>>> >     ./bin/mkuserimg_mke2fs
>>> >     ./bin/fec
>>> >     ./bin/cvd_internal_env
>>> >     ./bin/vhost_device_vsock
>>> >     ./bin/cvd_internal_stop
>>> >     ./bin/cvd_send_sms
>>> >     ./bin/assemble_cvd
>>> >     ./bin/cvd_send_id_disclosure
>>> >     ./bin/mcopy
>>> >     ./bin/operator_proxy
>>> >     ./bin/mkbootfs
>>> >     ./bin/run_cvd
>>> >     ./bin/openwrt_control_server
>>> >     ./bin/mkbootimg
>>> >     ./bin/kernel_log_monitor
>>> >     ./bin/mmd
>>> >     ./bin/toybox
>>> >     ./bin/crosvm
>>> >     ./bin/aarch64-linux-musl/
>>> >     ./bin/aarch64-linux-musl/crosvm
>>> >     ./bin/sefcontext_compile
>>> >     ./bin/wmediumd
>>> >     ./bin/echo_server
>>> >     ./bin/log_tee
>>> >     ./bin/lpmake
>>> >     ./bin/logcat_receiver
>>> >     ./bin/lpunpack
>>> >     ./bin/control_env_proxy_server
>>> >     ./bin/mtools
>>> >     ./bin/adb_connector
>>> >     ./bin/aarch64-linux-gnu/
>>> >     ./bin/aarch64-linux-gnu/libepoxy.so.0
>>> >     ./bin/aarch64-linux-gnu/libffi.so.7
>>> >     ./bin/aarch64-linux-gnu/qemu/
>>> >     ./bin/aarch64-linux-gnu/qemu/qemu-system-x86_64
>>> >     ./bin/aarch64-linux-gnu/qemu/libepoxy.so.0
>>> >     ./bin/aarch64-linux-gnu/qemu/libvirglrenderer.so.1
>>> >     ./bin/aarch64-linux-gnu/qemu/libgbm.so.1
>>> >     ./bin/aarch64-linux-gnu/qemu/libgfxstream_backend.so.0
>>> >     ./bin/aarch64-linux-gnu/qemu/librutabaga_gfx_ffi.so.0
>>> >     ./bin/aarch64-linux-gnu/qemu/qemu-system-riscv64
>>> >     ./bin/aarch64-linux-gnu/qemu/qemu-system-aarch64
>>> >     ./bin/aarch64-linux-gnu/qemu/libc++.so.1
>>> >     ./bin/aarch64-linux-gnu/qemu/libunwind.so.1
>>> >     ./bin/aarch64-linux-gnu/qemu/libz.so.1
>>> >     ./bin/aarch64-linux-gnu/qemu/libc++abi.so.1
>>> >     ./bin/aarch64-linux-gnu/libvirglrenderer.so.1
>>> >     ./bin/aarch64-linux-gnu/libdrm.so.2
>>> >     ./bin/aarch64-linux-gnu/libgbm.so.1
>>> >     ./bin/aarch64-linux-gnu/libgfxstream_backend.so
>>> >     ./bin/aarch64-linux-gnu/libwayland-client.so.0
>>> >     ./bin/aarch64-linux-gnu/libminijail.so
>>> >     ./bin/aarch64-linux-gnu/gfxstream_graphics_detector
>>> >     ./bin/aarch64-linux-gnu/crosvm
>>> >     ./bin/lpadd
>>> >     ./bin/make_f2fs
>>> >     ./bin/sandboxer_proxy
>>> >     ./bin/stop_cvd
>>> >     ./bin/casimir_control_server
>>> >
>>> >
>>> >     ziomario@Z390-AORUS-PRO-DEST:/mnt/zroot-133/_OS/Android/aosp_14/a=
ndroid-image$
>>> HOME=3D$(pwd) ./bin/launch_cvd -vm_manager qemu_cli
>>> -report_anonymous_usage_stats=3Dn --start_webrtc=3Dfalse
>>> >
>>> >
>>> >     09-02 23:27:10.473 2729990 2729990 I launch_cvd: main.cc:235 Usin=
g
>>> >     system_image_dir of:
>>> >     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> >     NOTICE:
>>> >
>>> >     By using this Android Virtual Device, you agree to
>>> >     Google Terms of Service (https://policies.google.com/terms
>>> >     <https://policies.google.com/terms>).
>>> >     The Google Privacy Policy (https://policies.google.com/privacy
>>> >     <https://policies.google.com/privacy>)
>>> >     describes how Google handles information generated as you use
>>> >     Google Services.
>>> >     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> >
>>> >     Reading --config option from:
>>> >     /mnt/zroot-133/_OS/Android/aosp_14/android-image/android-info.txt
>>> >     Launching CVD using --config=3D'phone'.
>>> >     aarch64-binfmt-P: Could not open '/lib/ld-linux-aarch64.so.1': No
>>> >     such file or directory
>>> >     Failed to run graphics detector, bad return value: 255. Assuming =
no
>>> >     availability.
>>> >     GPU auto mode: did not detect prerequisites for accelerated
>>> >     rendering support, enabling --gpu_mode=3Dguest_swiftshader.
>>> >     GPU vhost user auto mode: not needed for
>>> >     --gpu_mode=3Dguest_swiftshader. Not enabling vhost user gpu.
>>> >     Requested resuming a previous session (the default behavior) but
>>> the
>>> >     base images have changed under the overlay, making the overlay in=
c
>>> >     ompatible. Wiping the overlay files.
>>> >     Path for instance UDS: /tmp/cf_avd_1000
>>> >     Failed to run
>>> >     `/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/crosvm
>>> >     create_qcow2 --backing-file /mnt/zroot-133/_OS/Android/aosp_
>>> >
>>>  14/android-image/cuttlefish/instances/cvd-1/persistent_composite.img
>>> >     /mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/insta=
n
>>> >     ces/cvd-1/persistent_composite_overlay.img`
>>> >     stdout:
>>> >     ###
>>> >
>>> >     ###
>>> >     stderr:
>>> >     ###
>>> >     /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/crosvm: riga
>>> 3:
>>> >     /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/x86_64-linux=
-
>>> >     musl/crosvm: File o directory non esistente
>>> >
>>> >     ###
>>> >     Return code: "127"
>>> >     qemu: uncaught target signal 6 (Aborted) - core dumped
>>> >     09-02 23:27:31.223 2729990 2729990 E launch_cvd: subprocess.cpp:2=
07
>>> >     Subprocess 2730018 was interrupted by a signal 'Aborted' (6)
>>> >     09-02 23:27:31.224 2729990 2729990 E launch_cvd: main.cc:323
>>> >     assemble_cvd returned -1
>>> >
>>> >     On Mon, Sep 2, 2024 at 11:20=E2=80=AFPM Mario Marietto
>>> >     <marietto2008@gmail.com <mailto:marietto2008@gmail.com>> wrote:
>>> >
>>> >         Hello.
>>> >
>>> >         I've downloaded this file :
>>> >         aosp_cf_arm64_only_phone-img-12309296.zip and this file :
>>> >         cvd-host_package.tar.gz
>>> >
>>> >         from here :
>>> >
>>> https://ci.android.com/builds/submitted/12309296/aosp_cf_arm64_only_pho=
ne-trunk_staging-userdebug/latest
>>> <
>>> https://ci.android.com/builds/submitted/12309296/aosp_cf_arm64_only_pho=
ne-trunk_staging-userdebug/latest
>>> >
>>> >
>>> >         But let's say that I don't want to use the *.img files that a=
re
>>> >         stored inside "aosp_cf_arm64_only_phone-img-12309296.zip",but
>>> >         the same files that have been produced when I have compiled
>>> this
>>> >         version of Android :
>>> >
>>> >
>>> https://github.com/raspberry-vanilla/android_local_manifest?tab=3Dreadm=
e-ov-file
>>> <
>>> https://github.com/raspberry-vanilla/android_local_manifest?tab=3Dreadm=
e-ov-file
>>> >
>>> >
>>> >         Can I do it ? Is it supposed to work the same ?
>>> >
>>> >         Thanks.
>>> >
>>> >         On Mon, Sep 2, 2024 at 10:23=E2=80=AFPM Pierrick Bouvier
>>> >         <pierrick.bouvier@linaro.org
>>> >         <mailto:pierrick.bouvier@linaro.org>> wrote:
>>> >
>>> >
>>> >
>>> >             On 9/2/24 13:20, Pierrick Bouvier wrote:
>>> >              > On 9/2/24 12:53, Mario Marietto wrote:
>>> >              >> Hello Pierrick.
>>> >              >>
>>> >              >> With Cuttlefish can I emulate Android 14 for arm64 ? =
I
>>> >             ask because in
>>> >              >> your script I read :
>>> >              >>
>>> >              >> "|/home/user/.work/qemu/build/qemu-system-x86_64", so=
,I
>>> >             suspect that you
>>> >              >> have emulated Android x64 bit,but I need arm64. |
>>> >              >>
>>> >              >
>>> >              > Yes, it works for both architecture. The only thing I
>>> >             didn't try is an
>>> >              > arm64 vm accelerated with kvm (I don't have this a
>>> >             linux-aarch64
>>> >              > machine), but it should work.
>>> >
>>> >             And of course, if you want to write a custom wrapper for
>>> >             qemu, name it
>>> >             qemu-system-aarch64, and call the same binary instead of
>>> >             x86_64 variants.
>>> >
>>> >              >
>>> >              >> I also read "for aarch64 images: select
>>> >              >> |aosp_cf_arm64_only_phone-trunk_staging-userdebug" :
>>> I'm
>>> >             not able to
>>> >              >> download this kind of images. I don't understand how
>>> the
>>> >             Branch Grid
>>> >              >> works. Can you explain to me a little bit more ?
>>> >              >> |
>>> >              >
>>> >              > You have a link just next to it ("Branch grid") on the
>>> >             wiki page.
>>> >              > Once on ci android page, click on filter button (three
>>> >             bars, inverted
>>> >              > pyramid), and select
>>> >             aosp_cf_arm64_only_phone-trunk_staging-userdebug.
>>> >              > Then go to artifacts, and download image and
>>> >             cvd_host_x86_64 package, as
>>> >              > wiki mentions.
>>> >              >
>>> >              > Don't hesitate to ask more questions on this. I imagin=
e
>>> >             this topic might
>>> >              > interest some people who try to do the same thing.
>>> >              >
>>> >              > Pierrick
>>> >              >
>>> >              >> |
>>> >              >> |
>>> >              >>
>>> >              >>
>>> >              >> On Mon, Sep 2, 2024 at 8:47=E2=80=AFPM Pierrick Bouvi=
er
>>> >              >> <pierrick.bouvier@linaro.org
>>> >             <mailto:pierrick.bouvier@linaro.org>
>>> >             <mailto:pierrick.bouvier@linaro.org
>>> >             <mailto:pierrick.bouvier@linaro.org>>> wrote:
>>> >              >>
>>> >              >>      Hello Mario,
>>> >              >>
>>> >              >>      very recently, I had to investigate booting time
>>> of
>>> >             Android when using
>>> >              >>      QEMU. You can probably manage to boot this with
>>> >             only QEMU alone, but in
>>> >              >>      my experience, using Cuttlefish tooling is an
>>> >             easier approach.
>>> >              >>
>>> >              >>      If you really want to use only QEMU, you can use
>>> >             Cuttlefish to get
>>> >              >>      exact
>>> >              >>      command line used (which disk goes where), and
>>> >             iterate from that.
>>> >              >>
>>> >              >>      Instructions:
>>> >              >>
>>> >
>>> https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+And=
roid+using+QEMU
>>> <
>>> https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+And=
roid+using+QEMU>
>>> <
>>> https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+And=
roid+using+QEMU
>>> <
>>> https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+And=
roid+using+QEMU
>>> >>
>>> >              >>
>>> >              >>      As you'll see, I could not get a direct graphic
>>> >             output, but using
>>> >              >>      scrcpy, it worked well for me. Hope it can fit
>>> your
>>> >             use case.
>>> >              >>
>>> >              >>      Regards,
>>> >              >>      Pierrick
>>> >              >>
>>> >              >>      On 9/2/24 06:49, Mario Marietto wrote:
>>> >              >>       > Hello.
>>> >              >>       >
>>> >              >>       > I would like to emulate Android 14 on my Ubun=
tu
>>> >             24.04 OS X64 bit
>>> >              >>      using
>>> >              >>       > qemu-system-aarch64. I tried using the
>>> following
>>> >             parameters :
>>> >              >>       >
>>> >              >>       > qemu-system-aarch64 \
>>> >              >>       >          -smp 4 \
>>> >              >>       >          -m 2048 \
>>> >              >>       >          -cpu cortex-a72 \
>>> >              >>       >          -M virt \
>>> >              >>       >          -device
>>> virtio-gpu-pci,xres=3D1024,yres=3D768 \
>>> >              >>       >          -display sdl,gl=3Don \
>>> >              >>       >          -device usb-ehci \
>>> >              >>       >          -device usb-kbd \
>>> >              >>       >          -device virtio-tablet-pci \
>>> >              >>       >          -usb \
>>> >              >>       >          -serial stdio \
>>> >              >>       >          -kernel
>>> >             /mnt/zroot-133/_OS/Android/rpi4/Image \
>>> >              >>       >          -initrd
>>> >             /mnt/zroot-133/_OS/Android/rpi4/ramdisk.img \
>>> >              >>       >          -drive
>>> >              >>       >
>>> >              >>
>>> >
>>>  index=3D0,if=3Dnone,id=3Dsystem,file=3D/mnt/zroot-133/_OS/Android/rpi4=
/boot.img \
>>> >              >>       >          -device virtio-blk-pci,drive=3Dboot =
\
>>> >              >>       >          -drive
>>> >              >>       >
>>> >              >>
>>> >
>>>  index=3D1,if=3Dnone,id=3Dsystem,file=3D/mnt/zroot-133/_OS/Android/rpi4=
/system.img \
>>> >              >>       >          -device virtio-blk-pci,drive=3Dsyste=
m \
>>> >              >>       >          -drive
>>> >              >>       >
>>> >              >>
>>> >
>>>  index=3D2,if=3Dnone,id=3Dvendor,file=3D/mnt/zroot-133/_OS/Android/rpi4=
/vendor.img \
>>> >              >>       >          -device virtio-blk-pci,drive=3Dvendo=
r \
>>> >              >>       > -append "console=3DttyAMA0,38400 drm.debug=3D=
0x0
>>> >             rootwait rootdelay=3D5
>>> >              >>       > root=3D/dev/mmcblk0p2 androidboot.hardware=3D=
rpi4
>>> >              >>       > androidboot.selinux=3Dpermissive security=3Ds=
elinux
>>> >             selinux=3D1
>>> >              >>       > androidboot.qemu.hw.mainkeys=3D0
>>> >             androidboot.lcd.density=3D160"
>>> >              >>       >
>>> >              >>       > The error I get in short is :
>>> >              >>       >
>>> >              >>       > [ 1.993668] init: bool
>>> >              >>       >
>>> >              >>
>>> >
>>>  android::init::BlockDevInitializer::InitDevices(std::set<std::string>)=
:
>>> >              >>       > partition(s) not found in /sys, waiting for
>>> >             their uevent(s):
>>> >              >>      mmcblk0p2,
>>> >              >>       > mmcblk0p3
>>> >              >>       >
>>> >              >>       >
>>> >              >>       > One user suggested to :
>>> >              >>       >
>>> >              >>       >
>>> >              >>       >
>>> >              >>       >
>>> >              >>       >
>>> >              >>       > Hi!!! The "/sys" is a "dynamic fs" created at
>>> >             ram from the
>>> >              >>      kernel, to
>>> >              >>       > export a lot of things...so most of the files
>>> >             only exist at runtime.
>>> >              >>       > Normally, the partitions from the block devic=
e
>>> >             have a symlink at
>>> >              >>       > /sys/<something>/<...> that points to /dev/
>>> >             block node. It seems
>>> >              >>      that
>>> >              >>       > there are no such files under /sys according =
to
>>> >             what init is looking
>>> >              >>       > for. You can double check this at init source
>>> >             code to check the
>>> >              >>      exact
>>> >              >>       > path but I'm guessing that you'll have to
>>> change
>>> >             the qemu arguments
>>> >              >>       > regarding the block device.
>>> >              >>       >
>>> >              >>       > About userdata.img I think it's normal since =
in
>>> >             the old days, the
>>> >              >>      image
>>> >              >>       > was a "empty sparse image", that means, at th=
e
>>> >             first flashing
>>> >              >>      process,
>>> >              >>       > there isn't userdata information, we're just
>>> >             "flashing the
>>> >              >>      partition"
>>> >              >>       > with empty data.
>>> >              >>       > Tks!!!
>>> >              >>       >
>>> >              >>       >
>>> >              >>       >
>>> >              >>       > So,in short I should change the qemu argument=
s
>>> >             regarding the block
>>> >              >>       > device. I tried in this way :
>>> >              >>       >
>>> >              >>       >
>>> >              >>       > qemu-system-aarch64 \
>>> >              >>       >          -smp 4 \
>>> >              >>       >          -m 2048 \
>>> >              >>       >          -cpu cortex-a72 \
>>> >              >>       >          -M virt \
>>> >              >>       >          -device
>>> virtio-gpu-pci,xres=3D1024,yres=3D768 \
>>> >              >>       >          -display sdl,gl=3Don \
>>> >              >>       >          -device usb-ehci \
>>> >              >>       >          -device usb-kbd \
>>> >              >>       >          -device virtio-tablet-pci \
>>> >              >>       >          -usb \
>>> >              >>       >          -serial stdio \
>>> >              >>       >          -kernel
>>> >             /mnt/zroot-133/_OS/Android/rpi4/Image \
>>> >              >>       >          -initrd
>>> >             /mnt/zroot-133/_OS/Android/rpi4/ramdisk.img \
>>> >              >>       >          -hda
>>> >             /mnt/zroot-133/_OS/Android/rpi4/boot.img \
>>> >              >>       >          -hdb
>>> >             /mnt/zroot-133/_OS/Android/rpi4/system.img \
>>> >              >>       >          -hdc
>>> >             /mnt/zroot-133/_OS/Android/rpi4/vendor.img \
>>> >              >>       >        -append "console=3DttyAMA0,38400
>>> >             drm.debug=3D0x0 rootwait
>>> >              >>      rootdelay=3D5
>>> >              >>       > root=3D/dev/mmcblk0p2 androidboot.hardware=3D=
rpi4
>>> >              >>       > androidboot.selinux=3Dpermissive security=3Ds=
elinux
>>> >             selinux=3D1
>>> >              >>       > androidboot.qemu.hw.mainkeys=3D0
>>> >             androidboot.lcd.density=3D160"
>>> >              >>       >
>>> >              >>       >
>>> >              >>       > but the error is still there. Do you know som=
e
>>> >             different alternative
>>> >              >>       > block devices to try ? thanks.
>>> >              >>       >
>>> >              >>       >
>>> >              >>       > --
>>> >              >>       > Mario.
>>> >              >>
>>> >              >>
>>> >              >>
>>> >              >> --
>>> >              >> Mario.
>>> >
>>> >
>>> >
>>> >         --
>>> >         Mario.
>>> >
>>> >
>>> >
>>> >     --
>>> >     Mario.
>>> >
>>> >
>>> >
>>> > --
>>> > Mario.
>>>
>>
>>
>> --
>> Mario.
>>
>
>
> --
> Mario.
>


--=20
Mario.

--000000000000ea7a9c062138a971
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello.</div><div><br></div><div>Actually I&#39;m usin=
g my Jetson Nano and I&#39;m trying to emulate Android 10 by antmicro. I&#3=
9;m trying to use the same parameters used several years ago,when it worked=
. What I want to try now is to enable virtio-blk-pci on qemu. Probably in a=
ddition to using qemu 5.0,I had configured qemu with virtio-blk-pci enabled=
,because I used these parameters and they worked great :</div><div><br></di=
v><div>-drive index=3D0,if=3Dnone,id=3Dsystem,file=3D/home/aresuser/Desktop=
/antmicro/aosp-img/system-rw.img \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device v=
irtio-blk-pci,drive=3Dsystem \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -drive index=
=3D1,if=3Dnone,id=3Dvendor,file=3D/home/aresuser/Desktop/antmicro/aosp-img/=
vendor-rw.img \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device virtio-blk-pci,drive=
=3Dvendor \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -drive index=3D2,if=3Dnone,id=3D=
userdata,file=3D/home/aresuser/Desktop/antmicro/aosp-img/userdata.img \<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device virtio-blk-pci,drive=3Duserdata \<br></=
div><div><br></div><div>Can someone tell me how to enable the &quot;VirtFS =
support&quot; in qemu 5.0 ? because at the moment it is configured to &quot=
;no&quot; :</div><div><br></div><div>root@jetson:/home/aresuser/Desktop/ant=
micro/qemu-5.0.0# ./configure<br>Install prefix =C2=A0 =C2=A0/usr/local<br>=
BIOS directory =C2=A0 =C2=A0/usr/local/share/qemu<br>firmware path =C2=A0 =
=C2=A0 /usr/local/share/qemu-firmware<br>binary directory =C2=A0/usr/local/=
bin<br>library directory /usr/local/lib<br>module directory =C2=A0/usr/loca=
l/lib/qemu<br>libexec directory /usr/local/libexec<br>include directory /us=
r/local/include<br>config directory =C2=A0/usr/local/etc<br>local state dir=
ectory =C2=A0 /usr/local/var<br>Manual directory =C2=A0/usr/local/share/man=
<br>ELF interp prefix /usr/gnemul/qemu-%M<br>Build directory =C2=A0 /home/a=
resuser/Desktop/antmicro/qemu-5.0.0<br>Source path =C2=A0 =C2=A0 =C2=A0 /ho=
me/aresuser/Desktop/antmicro/qemu-5.0.0<br>GIT binary =C2=A0 =C2=A0 =C2=A0 =
=C2=A0git<br>GIT submodules =C2=A0 =C2=A0<br>C compiler =C2=A0 =C2=A0 =C2=
=A0 =C2=A0cc<br>Host C compiler =C2=A0 cc<br>C++ compiler =C2=A0 =C2=A0 =C2=
=A0c++<br>Objective-C compiler clang<br>ARFLAGS =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 rv<br>CFLAGS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-O2 -U_FORTIF=
Y_SOURCE -D_FORTIFY_SOURCE=3D2 -g <br>QEMU_CFLAGS =C2=A0 =C2=A0 =C2=A0 -I/u=
sr/include/pixman-1 -I$(SRC_PATH)/dtc/libfdt =C2=A0-pthread -I/usr/include/=
glib-2.0 -I/usr/lib/aarch64-linux-gnu/glib-2.0/include -fPIE -DPIE =C2=A0-D=
_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -Wstrict-prototype=
s -Wredundant-decls -Wall -Wundef -Wwrite-strings -Wmissing-prototypes -fno=
-strict-aliasing -fno-common -fwrapv -std=3Dgnu99 =C2=A0-Wexpansion-to-defi=
ned -Wendif-labels -Wno-shift-negative-value -Wno-missing-include-dirs -Wem=
pty-body -Wnested-externs -Wformat-security -Wformat-y2k -Winit-self -Wigno=
red-qualifiers -Wold-style-declaration -Wold-style-definition -Wtype-limits=
 -fstack-protector-strong =C2=A0-I/usr/include/libpng16 =C2=A0-I$(SRC_PATH)=
/capstone/include<br>QEMU_LDFLAGS =C2=A0 =C2=A0 =C2=A0-L$(BUILD_DIR)/dtc/li=
bfdt -Wl,-z,relro -Wl,-z,now -pie =C2=A0-fstack-protector-strong<br>make =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0make<br>install =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 install<br>python =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/usr/bin/python3 -B (3.10.12)<br>genisoimage =C2=A0 =C2=A0 =C2=A0=
 /usr/bin/genisoimage<br>slirp support =C2=A0 =C2=A0 internal <br>smbd =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/usr/sbin/smbd<br>module suppo=
rt =C2=A0 =C2=A0no<br>alt path mod load no<br>host CPU =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0aarch64<br>host big endian =C2=A0 no<br>target list =C2=A0 =
=C2=A0 =C2=A0 aarch64-softmmu alpha-softmmu arm-softmmu cris-softmmu hppa-s=
oftmmu i386-softmmu lm32-softmmu m68k-softmmu microblaze-softmmu microblaze=
el-softmmu mips-softmmu mips64-softmmu mips64el-softmmu mipsel-softmmu moxi=
e-softmmu nios2-softmmu or1k-softmmu ppc-softmmu ppc64-softmmu riscv32-soft=
mmu riscv64-softmmu rx-softmmu s390x-softmmu sh4-softmmu sh4eb-softmmu spar=
c-softmmu sparc64-softmmu tricore-softmmu unicore32-softmmu x86_64-softmmu =
xtensa-softmmu xtensaeb-softmmu aarch64-linux-user aarch64_be-linux-user al=
pha-linux-user arm-linux-user armeb-linux-user cris-linux-user hppa-linux-u=
ser i386-linux-user m68k-linux-user microblaze-linux-user microblazeel-linu=
x-user mips-linux-user mips64-linux-user mips64el-linux-user mipsel-linux-u=
ser mipsn32-linux-user mipsn32el-linux-user nios2-linux-user or1k-linux-use=
r ppc-linux-user ppc64-linux-user ppc64abi32-linux-user ppc64le-linux-user =
riscv32-linux-user riscv64-linux-user s390x-linux-user sh4-linux-user sh4eb=
-linux-user sparc-linux-user sparc32plus-linux-user sparc64-linux-user tile=
gx-linux-user x86_64-linux-user xtensa-linux-user xtensaeb-linux-user<br>gp=
rof enabled =C2=A0 =C2=A0 no<br>sparse enabled =C2=A0 =C2=A0no<br>strip bin=
aries =C2=A0 =C2=A0yes<br>profiler =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0no<br>=
static build =C2=A0 =C2=A0 =C2=A0no<br>SDL support =C2=A0 =C2=A0 =C2=A0 yes=
 (2.26.1)<br>SDL image support no<br>GTK support =C2=A0 =C2=A0 =C2=A0 yes (=
3.24.33)<br>GTK GL support =C2=A0 =C2=A0yes<br>VTE support =C2=A0 =C2=A0 =
=C2=A0 no <br>TLS priority =C2=A0 =C2=A0 =C2=A0NORMAL<br>GNUTLS support =C2=
=A0 =C2=A0no<br>libgcrypt =C2=A0 =C2=A0 =C2=A0 =C2=A0 no<br>nettle =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0no <br>libtasn1 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0no<br>PAM =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 no<br>=
iconv support =C2=A0 =C2=A0 yes<br>curses support =C2=A0 =C2=A0yes<br>virgl=
 support =C2=A0 =C2=A0 no <br>curl support =C2=A0 =C2=A0 =C2=A0no<br>mingw3=
2 support =C2=A0 no<br>Audio drivers =C2=A0 =C2=A0 pa oss<br>Block whitelis=
t (rw) <br>Block whitelist (ro) <br></div><div><br></div><div><b>VirtFS sup=
port =C2=A0 =C2=A0no</b></div><div><br></div><div>Multipath support no<br>V=
NC support =C2=A0 =C2=A0 =C2=A0 yes<br>VNC SASL support =C2=A0no<br>VNC JPE=
G support =C2=A0yes<br>VNC PNG support =C2=A0 yes<br>xen support =C2=A0 =C2=
=A0 =C2=A0 no<br>brlapi support =C2=A0 =C2=A0no<br>Documentation =C2=A0 =C2=
=A0 no<br>PIE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yes<br>vde s=
upport =C2=A0 =C2=A0 =C2=A0 no<br>netmap support =C2=A0 =C2=A0no<br>Linux A=
IO support no<br>Linux io_uring support no<br>ATTR/XATTR support yes<br>Ins=
tall blobs =C2=A0 =C2=A0 yes<br>KVM support =C2=A0 =C2=A0 =C2=A0 yes<br>HAX=
 support =C2=A0 =C2=A0 =C2=A0 no<br>HVF support =C2=A0 =C2=A0 =C2=A0 no<br>=
WHPX support =C2=A0 =C2=A0 =C2=A0no<br>TCG support =C2=A0 =C2=A0 =C2=A0 yes=
<br>TCG debug enabled no<br>TCG interpreter =C2=A0 no<br>malloc trim suppor=
t yes<br>RDMA support =C2=A0 =C2=A0 =C2=A0no<br>PVRDMA support =C2=A0 =C2=
=A0no<br>fdt support =C2=A0 =C2=A0 =C2=A0 git<br>membarrier =C2=A0 =C2=A0 =
=C2=A0 =C2=A0no<br>preadv support =C2=A0 =C2=A0yes<br>fdatasync =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 yes<br>madvise =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yes<br>=
posix_madvise =C2=A0 =C2=A0 yes<br>posix_memalign =C2=A0 =C2=A0yes<br>libca=
p-ng support no<br>vhost-net support yes<br>vhost-crypto support yes<br>vho=
st-scsi support yes<br>vhost-vsock support yes<br>vhost-user support yes<br=
>vhost-user-fs support yes<br>Trace backends =C2=A0 =C2=A0log<br>spice supp=
ort =C2=A0 =C2=A0 no <br>rbd support =C2=A0 =C2=A0 =C2=A0 no<br>xfsctl supp=
ort =C2=A0 =C2=A0no<br>smartcard support no<br>libusb =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0no<br>usb net redir =C2=A0 =C2=A0 no<br>OpenGL support =
=C2=A0 =C2=A0yes<br>OpenGL dmabufs =C2=A0 =C2=A0yes<br>libiscsi support =C2=
=A0no<br>libnfs support =C2=A0 =C2=A0no<br>build guest agent yes<br>QGA VSS=
 support =C2=A0 no<br>QGA w32 disk info no<br>QGA MSI support =C2=A0 no<br>=
seccomp support =C2=A0 no<br>coroutine backend ucontext<br>coroutine pool =
=C2=A0 =C2=A0yes<br>debug stack usage no<br>mutex debugging =C2=A0 no<br>cr=
ypto afalg =C2=A0 =C2=A0 =C2=A0no<br>GlusterFS support no<br>gcov =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcov<br>gcov enabled =C2=A0 =C2=A0=
 =C2=A0no<br>TPM support =C2=A0 =C2=A0 =C2=A0 yes<br>libssh support =C2=A0 =
=C2=A0no<br>QOM debugging =C2=A0 =C2=A0 yes<br>Live block migration yes<br>=
lzo support =C2=A0 =C2=A0 =C2=A0 no<br>snappy support =C2=A0 =C2=A0no<br>bz=
ip2 support =C2=A0 =C2=A0 no<br>lzfse support =C2=A0 =C2=A0 no<br>zstd supp=
ort =C2=A0 =C2=A0 =C2=A0no<br>NUMA host support yes<br>libxml2 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 yes<br>tcmalloc support =C2=A0no<br>jemalloc suppo=
rt =C2=A0no<br>avx2 optimization <br>avx512f optimization no<br>replication=
 support yes<br>VxHS block device no<br>bochs support =C2=A0 =C2=A0 yes<br>=
cloop support =C2=A0 =C2=A0 yes<br>dmg support =C2=A0 =C2=A0 =C2=A0 yes<br>=
qcow v1 support =C2=A0 yes<br>vdi support =C2=A0 =C2=A0 =C2=A0 yes<br>vvfat=
 support =C2=A0 =C2=A0 yes<br>qed support =C2=A0 =C2=A0 =C2=A0 yes<br>paral=
lels support yes<br>sheepdog support =C2=A0yes<br>capstone =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0internal<br>libpmem support =C2=A0 no<br>libudev =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yes<br>default devices =C2=A0 yes<br>plugin su=
pport =C2=A0 =C2=A0no<br>fuzzing support =C2=A0 no<br>gdb =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/bin/gdb<br>cross containers =C2=A0dock=
er<br><br>Thanks.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Tue, Sep 3, 2024 at 10:55=E2=80=AFAM Mario Mariet=
to &lt;<a href=3D"mailto:marietto2008@gmail.com" target=3D"_blank">marietto=
2008@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div dir=3D"ltr"><div>Finally it worked :</div><div><br></div=
><div><img src=3D"cid:ii_m0m6y09i0" alt=3D"Istantanea_2024-09-03_10-51-35.j=
pg" width=3D"488" height=3D"275"><br></div><div>Very thanks man. In any cas=
e it is VERY slow and not usable at all. Is there something that I can do t=
o improve its speed ?</div><div></div><div><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 3, 2024 =
at 10:33=E2=80=AFAM Mario Marietto &lt;<a href=3D"mailto:marietto2008@gmail=
.com" target=3D"_blank">marietto2008@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><span style=
=3D"font-family:monospace"><span style=3D"font-weight:bold;color:rgb(84,255=
,84);background-color:rgb(255,255,255)">ziomario@Z390-AORUS-PRO-DEST</span>=
<span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">:</span>=
<span style=3D"font-weight:bold;color:rgb(84,84,255);background-color:rgb(2=
55,255,255)">/mnt/zroot-133/_OS/Android/aosp_14/android-image</span><span s=
tyle=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">$ HOME=3D$(pwd)=
 ./bin/launch_cvd -vm_manager qemu_cli -repor</span>t_anonymous_usage_stats=
=3Dn --start_webrtc=3Dfalse
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
<br>Google Terms of Service (<a href=3D"https://policies.google.com/terms" =
target=3D"_blank">https://policies.google.com/terms</a>).
<br>The Google Privacy Policy (<a href=3D"https://policies.google.com/priva=
cy" target=3D"_blank">https://policies.google.com/privacy</a>)
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
<br>netsimd I 09-03 08:06:13.221 <a href=3D"http://rust_main.rs:98" target=
=3D"_blank">rust_main.rs:98</a> - netsim artifacts path: &quot;/tmp/android=
-ziomario/netsimd&quot;
<br>netsimd I 09-03 08:06:13.221 <a href=3D"http://rust_main.rs:101" target=
=3D"_blank">rust_main.rs:101</a> - NetsimdArgs {
<br> =C2=A0=C2=A0=C2=A0fd_startup_str: Some(
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&quot;{\&quot;devices\&quot;=
:[{\&quot;name\&quot;:\&quot;<a href=3D"http://0.0.0.0:6520" target=3D"_bla=
nk">0.0.0.0:6520</a>\&quot;,\&quot;chips\&quot;:[{\&quot;kind\&quot;:\&quot=
;BLUETOOTH\&quot;,\&quot;fdIn\&quot;:81,\&quot;fdOut\&quot;:82},{\&quot;kin=
d\&quot;:\&quot;UWB\&quot;,\&quot;fdIn<br>\&quot;:83,\&quot;fdOut\&quot;:84=
}]}]}&quot;,
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
ttps://android.googlesource.com/toolchain/llvm-project" target=3D"_blank">h=
ttps://android.googlesource.com/toolchain/llvm-project</a> 477610d4d0d988e6=
9dbc3fae4fe86bff3f07f2b5</span><span style=3D"font-family:monospace">), LLD=
 18.0.0) #1 SMP PREEMPT Wed Aug 28 21:43:33 UTC 2024
</span></div><div><span style=3D"font-family:monospace"></span></div><div><=
span style=3D"font-family:monospace">] Linux version
</span></div><div><span style=3D"font-family:monospace"></span></div><span =
style=3D"font-family:monospace">transport message failed, response body: de=
vice &#39;<a href=3D"http://0.0.0.0:6520" target=3D"_blank">0.0.0.0:6520</a=
>&#39; not found
<br>transport message failed, response body: device &#39;<a href=3D"http://=
0.0.0.0:6520" target=3D"_blank">0.0.0.0:6520</a>&#39; not found
<br>transport message failed, response body: device &#39;<a href=3D"http://=
0.0.0.0:6520" target=3D"_blank">0.0.0.0:6520</a>&#39; not found
<br>transport message failed, response body: device &#39;<a href=3D"http://=
0.0.0.0:6520" target=3D"_blank">0.0.0.0:6520</a>&#39; not found
<br>GUEST_BUILD_FINGERPRINT: generic/aosp_cf_arm64_only_phone/vsoc_arm64_on=
ly:VanillaIceCream/MAIN.1c019b0c/12309296:userdebug/test-keys
<br>transport message failed, response body: device &#39;<a href=3D"http://=
0.0.0.0:6520" target=3D"_blank">0.0.0.0:6520</a>&#39; not found
<br>transport message failed, response body: device &#39;<a href=3D"http://=
0.0.0.0:6520" target=3D"_blank">0.0.0.0:6520</a>&#39; not found
<br></span><div><span style=3D"font-family:monospace">transport message fai=
led, response body: device &#39;<a href=3D"http://0.0.0.0:6520" target=3D"_=
blank">0.0.0.0:6520</a>&#39; not found</span></div><div><span style=3D"font=
-family:monospace"><span style=3D"color:rgb(0,0,0);background-color:rgb(255=
,255,255)">transport message failed, response body: device &#39;<a href=3D"=
http://0.0.0.0:6520" target=3D"_blank">0.0.0.0:6520</a>&#39; not found
</span><br>transport message failed, response body: device &#39;<a href=3D"=
http://0.0.0.0:6520" target=3D"_blank">0.0.0.0:6520</a>&#39; not found
<br>transport message failed, response body: device &#39;<a href=3D"http://=
0.0.0.0:6520" target=3D"_blank">0.0.0.0:6520</a>&#39; not found
<br>transport message failed, response body: device &#39;<a href=3D"http://=
0.0.0.0:6520" target=3D"_blank">0.0.0.0:6520</a>&#39; not found
<br>transport message failed, response body: device &#39;<a href=3D"http://=
0.0.0.0:6520" target=3D"_blank">0.0.0.0:6520</a>&#39; not found
<br>init: starting service &#39;adbd&#39;...
<br>proxy_fastboot] Stop event (11) received. Stopping proxy
<br>proxy_adb] Start event (5) received. Starting proxy
<br>proxy_adb] From: tcp: 6520
<br>proxy_adb] To: vsock: 3:5555 vhost_user: false
<br>transport message failed, response body: device &#39;<a href=3D"http://=
0.0.0.0:6520" target=3D"_blank">0.0.0.0:6520</a>&#39; not found
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
<br><a href=3D"http://0.0.0.0:6520" target=3D"_blank">0.0.0.0:6520</a> =C2=
=A0=C2=A0=C2=A0device<br></span></div><div><span style=3D"font-family:monos=
pace"><br></span></div><div><span style=3D"font-family:monospace">but scrcp=
y didn&#39;t work :</span></div><div><span style=3D"font-family:monospace">=
<br></span></div><div><span style=3D"font-family:monospace"><span style=3D"=
font-weight:bold;color:rgb(84,255,84);background-color:rgb(255,255,255)">zi=
omario@Z390-AORUS-PRO-DEST</span><span style=3D"color:rgb(0,0,0);background=
-color:rgb(255,255,255)">:</span><span style=3D"font-weight:bold;color:rgb(=
84,84,255);background-color:rgb(255,255,255)">~/Scrivania</span><span style=
=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">$ scrcpy
</span><br><br></span></div><div><span style=3D"font-family:monospace">scrc=
py 2.6.1 &lt;<a href=3D"https://github.com/Genymobile/scrcpy" target=3D"_bl=
ank">https://github.com/Genymobile/scrcpy</a>&gt;
<br>INFO: ADB device found:
<br>INFO: =C2=A0=C2=A0=C2=A0=C2=A0--&gt; (tcpip) =C2=A0<a href=3D"http://0.=
0.0.0:6520" target=3D"_blank">0.0.0.0:6520</a> =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0device =C2=A0Cuttlefish_arm64_phone_64_bit_only
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
<br><a href=3D"http://0.0.0.0:6520" target=3D"_blank">0.0.0.0:6520</a> =C2=
=A0=C2=A0=C2=A0device<br></span></div><div><span style=3D"font-family:monos=
pace"></span></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Tue, Sep 3, 2024 at 1:03=E2=80=AFAM Pierrick Bouvier =
&lt;<a href=3D"mailto:pierrick.bouvier@linaro.org" target=3D"_blank">pierri=
ck.bouvier@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">The cvd-host package in this case are binaries/librari=
es compiled for <br>
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
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<br></d=
iv>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<br></d=
iv>

--000000000000ea7a9c062138a971--

--000000000000ea7a9e062138a972
Content-Type: image/jpeg; name="Istantanea_2024-09-03_10-51-35.jpg"
Content-Disposition: inline; filename="Istantanea_2024-09-03_10-51-35.jpg"
Content-Transfer-Encoding: base64
Content-ID: <ii_m0m6y09i0>
X-Attachment-Id: ii_m0m6y09i0

/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0a
HBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRwhMjIyMjIy
MjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCAQ4B4ADASIA
AhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA
AAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3
ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm
p6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA
AwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx
BhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK
U1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3
uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwDIvrCf
Uta114rizRrVppjHLbJLLL+/lX5cozEAKM9hx2rmftsmOlt/4BQf/EVoeINSvLHxHqkdrdzQJPJM
sojcjePtE3X9fzPqayJb5JbWOFbC0hZMZniMu98DHO5yvPXgD2wOKAO9+GM7y69LuEY/cTA+XEkY
YAwEZCgA43N+derV5D8KTnXZv+uM/wDO3r12gBaKSigBaKSigBaKSigBaKSigBaKSigBaKSigBaK
SigBaKSigBaKSigBaKSigBaKSigBaKSigBaKSigBaKSigBaKSigBaKSigBaKSigBaKSigBaKSigB
aKSigBaKSigBaKSigBaKSigBaKSigBaKSigBaKSigBaKSigBaKSigBaKSigBaKSigBaKSigBaKSi
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
j39tOdVW4SwS7i8jZtd1AB3E55/zzQBrxyRyoHjdXQ9GU5Bp1UNIt5bXS4YZl2yLuyMg4+YntV6g
CGO9tpfO2TL+5JEmeNuPXP8AOnW9xFdQLNC26Ns4OCO+O9YN/Y3Oo3lxNDbCJYxs+fKm4II/Tjg/
T8Nuyk82zifyGg+XHlMMbccYoA4bVPhjHqWp3F4dRjHmyO4V4HJXcxcjKyqDyx7VU/4VFF/0EYf/
AAHl/wDj1e20UAeYeFfBCeGb+S5W8WYNGyBEiZANxUkks7E/cX0rra6KigDnaK6KigDnaK6KigDn
aK6KigDnaK6KigDnaK6KigDnaK6KigDnaK6KigDnaK6KigDnaK6KigDnaK6KigDnaK6KigDnaK6K
igDnaK6KigDnaK6KigDnaK6KigDnaK6KigDnaK6KigDnaK6KigDnaK6KigDnaK6KigDnaK6KigDn
aK6KigDnaK6KigDnaK6KigDnaK6KigDnaK6KigDnaK6KigDnaK6KigDnaK6KigDnaK6KigDnaK6K
igDnaK6KigDnaK6KigDnaK6KigDnaK6KigDnaK6KigDnaK6KigDnaK6KigDnaK6KigDnaK6KigDn
aK6KigDnaK6KigDnaK6KigDnaK6KigDnaZJDHMu2WNHXrhlBFdLRQBzIt4QciKMHbsyFH3fT6Un2
aAQ+T5Mflf3No2/lXT0UAcy9vDJGsbwxsi9FZQQPwoEEKszCJAWGGIUcj0NdNRQBzUcUcKBIkVEH
RVGBTRbQCXzRDH5n9/YM/nXT0UAc00MTyLI0aGRfusVGR9DSNBC0olaJDIvRyoyPxrpqKAOajijh
TZEiov8AdUYFDQxPIsjRoZF+6xUZH0NdLRQBzSwxI7usSKz/AHmCgFvr600W1uITCIIhEeqBBtP4
V09FAHMPbQSKivBGypwoKAhfpTZozHDM9rFF57DuMBiPWupooA8+FheXdzbiWzgtIYn8xvLI+Y/h
W3LBFOAJYkkA6B1BrpqKAObSNIkCRoqKOgUYFIIoxKZRGokIwXxyR9a6WigDmpIYpSpkjRypyu5Q
cH1FI8EMkiyPFGzr0ZlBI/GumooA5pYYlVlWJArklgFGCT1zTFtLZAoW3iG07lwg4PqPeuoooA5p
IYkdnSNFd/vMFALfWkSCGKMxxxRoh6qqgA/hXTUUAcxHbQRBhHBGgbhgqAZ+tH2aAQ+T5Mflf3No
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
gAooooAZ50X/AD0T/voUedF/z0T/AL6FXM0ZoAp+dF/z0T/voUedF/z0T/voVczRmgCn50X/AD0T
/voUedF/z0T/AL6FXM0ZoAp+dF/z0T/voUedF/z0T/voVczRmgCn50X/AD0T/voUedF/z0T/AL6F
XM0ZoAp+dF/z0T/voUedF/z0T/voVczRmgCn50X/AD0T/voUedF/z0T/AL6FXM0ZoAp+dF/z0T/v
oUedF/z0T/voVczRmgCn50X/AD0T/voUedF/z0T/AL6FXM0ZoAp+dF/z0T/voUedF/z0T/voVczR
mgCn50X/AD0T/voUedF/z0T/AL6FXM0ZoAp+dF/z0T/voUedF/z0T/voVczRmgCn50X/AD0T/voU
edF/z0T/AL6FXM0ZoAp+dF/z0T/voUedF/z0T/voVczRmgCn50X/AD0T/voUedF/z0T/AL6FXM0Z
oAp+dF/z0T/voUedF/z0T/voVczRmgCn50X/AD0T/voUedF/z0T/AL6FXM0ZoAp+dF/z0T/voUed
F/z0T/voVczRmgCn50X/AD0T/voUedF/z0T/AL6FXM0ZoA4a88NapqkDWOpeK/P02Rh5sKWiRySL
nO0uD09cCusR4URUV0CqMABhwKu5ozQBT86L/non/fQo86L/AJ6J/wB9CrmaM0AU/Oi/56J/30KP
Oi/56J/30KuZozQBT86L/non/fQo86L/AJ6J/wB9CrmaM0AU/Oi/56J/30KPOi/56J/30KuZozQB
T86L/non/fQo86L/AJ6J/wB9CrmaM0AUXkjaNlWZVJBAYEce9crP4a1LU1ittY8UC809ZFkeBLRI
ml2nIDMGPGQM4AruM0Zo63Ap+dF/z0T/AL6FHnRf89E/76FXM0ZoAp+dF/z0T/voUedF/wA9E/76
FXM0ZoAp+dF/z0T/AL6FHnRf89E/76FXM0ZoAp+dF/z0T/voVleH9Li0KwltftiT+Zcyz7sBcb2L
Yxk9M4zXQ5ozQBT86L/non/fQo86L/non/fQq5mjNAFPzov+eif99Cjzov8Anon/AH0KuZozQBT8
6L/non/fQo86L/non/fQq5mjNAFPzov+eif99Cjzov8Anon/AH0KuZozQBT86L/non/fQo86L/no
n/fQq5mjNAFPzov+eif99Cjzov8Anon/AH0KuZozQBT86L/non/fQo86L/non/fQq5mjNAFPzov+
eif99Cjzov8Anon/AH0KuZozQBT86L/non/fQo86L/non/fQq5mjNAFPzov+eif99Cjzov8Anon/
AH0KuZozQBT86L/non/fQo86L/non/fQq5mjNAFPzov+eif99Cjzov8Anon/AH0KuZozQBT86L/n
on/fQo86L/non/fQq5mjNAFPzov+eif99Cjzov8Anon/AH0KuZozQBT86L/non/fQo86L/non/fQ
q5mjNAFPzov+eif99Cjzov8Anon/AH0KuZozQBT86L/non/fQo86L/non/fQq5mjNAFPzov+eif9
9Cjzov8Anon/AH0KuZozQBT86L/non/fQo86L/non/fQq5mjNAFPzov+eif99Cjzov8Anon/AH0K
uZozQBT86L/non/fQo86L/non/fQq5mjNAFPzov+eif99Cjzov8Anon/AH0KuZozQBT86L/non/f
Qo86L/non/fQq5mjNAFPzov+eif99Cjzov8Anon/AH0KuZozQBT86L/non/fQo86L/non/fQq5mj
NAFPzov+eif99Cjzov8Anon/AH0KuZozQBT86L/non/fQo86L/non/fQq5mjNAFPzov+eif99Cjz
ov8Anon/AH0KuZozQBT86L/non/fQo86L/non/fQq5mjNAFPzov+eif99Cjzov8Anon/AH0KuZoz
QBT86L/non/fQo86L/non/fQq5mjNAFPzov+eif99Cjzov8Anon/AH0KuZozQBT86L/non/fQo86
L/non/fQq5mjNAFPzov+eif99Cjzov8Anon/AH0KuZozQBT86L/non/fQo86L/non/fQq5mjNAFP
zov+eif99Co5Jov+eif99CtDNRyHigDktSKya7ZbXBxbT9Dn+KKvJ9Y+NP8AZOt3+nf8I/5v2S5k
g8z7Zt37GK5xsOM46Zr1/Vz/AMT2x/69p/8A0KKvkrxh/wAjtr3/AGEbj/0Y1IZ6T/wvj/qW/wDy
e/8AtdH/AAvj/qW//J7/AO1146qlmCqCSTgAd62bjwlr9poba1c6VcwacrKnnzLsBLdMA8n8BQB6
T/wvj/qW/wDye/8AtdH/AAvj/qW//J7/AO115x4b8Ia74tuJYtFsGuPJAMrl1RIwfVmIAqLxD4X1
rwrfLZ61Yvaysu5MkMrj1VlJB/OgD0z/AIXx/wBS3/5Pf/a6P+F8f9S3/wCT3/2uvLtC0HU/EuqJ
pmkWpubx1LLGHVcgDJ5YgfrW7q/wu8ZaDpU+p6lo3kWduAZZPtMLbQSAOFck8kdqAO0/4Xx/1Lf/
AJPf/a6P+F8f9S3/AOT3/wBrrzbR/CPiDX1Z9L0m6uI1Us0oTCAAZ5Y4H61i0Aex/wDC+P8AqW//
ACe/+10f8L4/6lv/AMnv/tdeOVtz+EPENvqcGnSaRdi7nCNFGqbtwcZXBHFAHpH/AAvj/qW//J7/
AO10f8L4/wCpb/8AJ7/7XXkd7ZXGnX09ldxmO4gcxyISDtYHBHFQUAex/wDC+P8AqW//ACe/+10f
8L4/6lv/AMnv/tdeOV2fhr4c3/iDSxqdxqFhpNnI5S3lv5NnnkAltnqAByaAOw/4Xx/1Lf8A5Pf/
AGuj/hfH/Ut/+T3/ANrrltb+Gc+k6Ddavba/o2pw2ixyTR2c+51R2Cq2MdCSK4WgD2P/AIXx/wBS
3/5Pf/a6P+F8f9S3/wCT3/2uvHK6Cz8DeK9Qs4ruz8O6lPbyrujljtmKsPUHHNAHof8Awvj/AKlv
/wAnv/tdH/C+P+pb/wDJ7/7XXn1x4B8XWltLcXHhvVIoYlLyO9swCqOSScdK52gD2P8A4Xx/1Lf/
AJPf/a6P+F8f9S3/AOT3/wBrrxyigD2P/hfH/Ut/+T3/ANro/wCF8f8AUt/+T3/2uvHKKAPY/wDh
fH/Ut/8Ak9/9ro/4Xx/1Lf8A5Pf/AGuvHKKAPY/+F8f9S3/5Pf8A2uj/AIXx/wBS3/5Pf/a68coo
A9j/AOF8f9S3/wCT3/2uqY+MlkuqtqY8K/6Y0flmT+0T930xsx29K8oooA9j/wCF8f8AUt/+T3/2
uj/hfH/Ut/8Ak9/9rrxyigD2P/hfH/Ut/wDk9/8Aa6P+F8f9S3/5Pf8A2uvHKKAPY/8AhfH/AFLf
/k9/9ro/4Xx/1Lf/AJPf/a68cooA9j/4Xx/1Lf8A5Pf/AGuj/hfH/Ut/+T3/ANrrxyigD2P/AIXx
/wBS3/5Pf/a6P+F8f9S3/wCT3/2uvHKKAPY/+F8f9S3/AOT3/wBro/4Xx/1Lf/k9/wDa68cooA9j
/wCF8f8AUt/+T3/2uj/hfH/Ut/8Ak9/9rrxyigD2P/hfH/Ut/wDk9/8Aa6P+F8f9S3/5Pf8A2uvH
KKAPY/8AhfH/AFLf/k9/9ro/4Xx/1Lf/AJPf/a68cooA9Tn+LemXWppqM/hBJLtAArtfk4x042Y/
StD/AIXx/wBS3/5Pf/a68cooA9j/AOF8f9S3/wCT3/2uj/hfH/Ut/wDk9/8Aa68cooA9j/4Xx/1L
f/k9/wDa6P8AhfH/AFLf/k9/9rrye20u/vLO6vLaznmtrQKbiWNCViDZC7j2zg9fSl03StQ1m8Fp
pllPeXJUsIoIy7YHU4FAHq//AAvj/qW//J7/AO10f8L4/wCpb/8AJ7/7XXA/8K88Z/8AQrax/wCA
b/4VUtPCPiO/ubq3s9D1Cea0YJcRx27M0THoGAHB4PWgD0n/AIXx/wBS3/5Pf/a6P+F8f9S3/wCT
3/2uvNdS8I+I9Gszd6noeoWdsGCmWe3ZFBPQZIrGoA9j/wCF8f8AUt/+T3/2uj/hfH/Ut/8Ak9/9
rrxytTQvD+o+I79rTTYDI6RtLI38MaKMlmPYUAen/wDC+P8AqW//ACe/+10f8L4/6lv/AMnv/tde
OV1Xg34f6541u4xYWzrZGXypbwrlIjjPPc9unrQB3P8Awvj/AKlv/wAnv/tdH/C+P+pb/wDJ7/7X
XP8AjX4P+IfB8X2lVOpWKRGWa5t4yFi5xhgTn3zXnlAHsf8Awvj/AKlv/wAnv/tdH/C+P+pb/wDJ
7/7XXjlFAHsf/C+P+pb/APJ7/wC10f8AC+P+pb/8nv8A7XXjlFAH1NoeuDxN4T03Wjb/AGUXF1F+
6379u25C/ewM/dz07138U0WB+8T/AL6FeV/Db/kl2g/9fa/+lhr1+I8UAM86L/non/fQo86L/non
/fQq5mjNMRT86L/non/fQo86L/non/fQq5mjNAFPzov+eif99Cjzov8Anon/AH0KuZozQBT86L/n
on/fQo86L/non/fQq5mjNAFPzov+eif99Cjzov8Anon/AH0KuZozQBT86L/non/fQo86L/non/fQ
q5mjNAFPzov+eif99Cjzov8Anon/AH0KuZozQBT86L/non/fQo86L/non/fQq5mjNAFPzov+eif9
9Cjzov8Anon/AH0KuZozQBT86L/non/fQo86L/non/fQq5mjNAFPzov+eif99Cjzov8Anon/AH0K
uZozQBT86L/non/fQo86L/non/fQq5mjNAFPzov+eif99Cjzov8Anon/AH0KuZozQBT86L/non/f
Qo86L/non/fQq5mjNAFPzov+eif99Cjzov8Anon/AH0KuZozQBT86L/non/fQo86L/non/fQq5mj
NAFPzov+eif99Cjzov8Anon/AH0KuZozQBT86L/non/fQo86L/non/fQq5mjNADc1lS67DHM8a29
xKEYqWXYASDg43MD1BFaE0yQQyTSttjjUszegAyawbe1M0TSGN13yysA6lTgyMRweRwRSAt/8JDH
/wA+N1/31F/8XV+yvo76JnRHQo2xkfGQcA9iR0IPXvWFdRLaiPMTuZH2KqlRzgnuQOgNWPD93HJJ
dxbJI3eUuquvUKqIxBGQcMMcGlzrm5b6hdXsa1tfWl6ZRa3UM5hcxy+VIG2OOqnHQ+xp8d1bzTzQ
RTxvNCQJY1cFo8jI3Dtkc815ZobyeHNQvPESFv7PuNUuLXUl7IPNPlzfgTg+xrZOsLoeq+O9V2iQ
W620irnhj5IwPzxTvpfyv+X+Y7e9y+Z3+aM15lYeKtXTUNMb+0bzUhdTJFdWraPJAkKt/EjlRwpx
94nIqeXxLrf/AAis1nDdA+IP7VfTY5jEvUMW3bcY/wBX7U3p/Xp/mJa/16/5Ho2ao3+taVpTIuo6
nZ2ZkBKC4nWPdjrjcRmuXsfE15q914UitZtn2yCS6vgEB+VFCleRx+8PbHSupvbGzvIybq1gnKKd
pljDY+maJe6rgtSC08S6FqFyttZa1p1zO+dsUN0jsccnABzWpmuC8C2NvH8ObG7gWztL3yJCt5JC
p8s7mG4njI/Gk0nxBcxeMLHSx4otNet7yGUv5SxBrd0AI/1fYjPB9OtNr3uUXS52dhqdpqkcz2c3
mrDM8Eh2lcOpww5A6evSrea808NWXiC7g119N1lNPjj1W68qP7Msnmtuyd5boOg4wevNdj4W1l9f
8NWWpSxiOaVCJEXoHUlWx7ZBpLVJ+n4jejt6m1mjNNzRmgDkPFnxK0fwdqkWn6hbX8s0kAnDW8aM
u0sy92HOVNZd18Z/Dtpb2M8llqpW8gM8YWKPIUSPHz8/XMZ/DFbk2j6Xq3jbUP7S06zvPK0608v7
TAsmzMlznG4HGcD8qwvC2g6Pe6zqkF3pNjcQ2yskEctsjrEv26+GFBHyjAHA9BQB1HhPxbYeMdLl
1DT4rmKGOcwFbhVVtwVW7E8YYVfvdb0rTplivtTs7WVuVSe4VCfoCay/DNna6fe+IbWytoba3TUV
2RQoERc2sBOAOBySa52W1tvD2t6zd6/oX9oWF9ceeuorALjykwBskXllVcdQCOaOo+h6GkiSxrJG
4dGGVZTkEexokkWKNpHOFUFifQCuK1TUr3+2PDml+Gr22trC+tpiHSFXRUVVKso9hkAdOeQcU+01
DVbPWdT8Parerf5083dvdeUsbbclWVgvHBxgilJ2Ta8/w/4YI6tfL8ToIfEWlXEemyRXYZdTz9kO
xh5uBuPUcceuK0lkRmZVYFlOGAPI+ted+HtSu7TRvAFpBLshu0dJl2A7gIiRyRkc+mKseELPUj4n
8QzS65cSRw6htkhMMeJv3a4JO3IwMDgjpVte849r/p/mSn7qf9df8juHu7aO6jtXuIluJVLRxFwH
cDqQOpAonvLa1MQuLiKEyuI4/McLvc9FGep9q5fx0psrfTfEMYO/SbpZJMdTC/ySD8iD+FMumXXP
iLYwKd9ro9sbpyOQZpPlQfgu4/jUrX+vn/XmN6f18jptP1Oz1WB57KYSxpI0TMARhlOGHPoat5rz
hvGV/Z+EjcyTBry41eWxil+z7/KUSN82xBliFU8dSetMtPEOuzXN3p9nqN5fCWylkgvJ9LNu1vMo
yo5QKwP0pX0v/W1x21t/W9j0rNGa811bxvqR0rQLzTZQM2o1DURsU5hUorryOOWbp/drprDVbrUP
Guo20U+dNsrWIFAow0z5bOcZ4XHGcc1Vtbev4f1Ym+lzpM0ZpuaM0hjs0ZpuaM0AOzRmm5ozQA7N
GabmjNADs0ZpuaM0AOzRmm5ozQA7NGabmjNADs0ZpuaM0AOzRmm5ozQA7NGabmjNADs0ZpuaM0AO
zRmm5ozQA7NGabmjNADs0ZpuaM0AOzRmm5ozQA7NGabmjNADs0ZpuaM0AOzRmm5ozQA7NGabmjNA
Ds0ZpuaM0AOzRmm5ozQA7NGabmjNADs0ZpuaM0AOzRmm5ozQA7NGabmjNADs0ZpuaM0AOzRmm5oz
QA7NGabmjNADs0ZpuaM0AOzRmm5ozQA7NGabmjNADs0ZpuaM0AOzRmm5ozQA7NGabmjNADs0Zpua
M0AOzRmm5ozQA7NGabmjNADs0ZpuaM0AOzRmm5ozQA7NGabmjNADs0ZpuaM0AOzRmm5ozQA7NGab
mjNADs0ZpuaM0AOzRmm5ozQA7NGabmjNADs0ZpuaM0AOzRmm5ozQA7NGabmjNADs0ZpuaM0AOzUc
h4p2ajkPFAHOat/yHbH/AK9p/wD0KKvkvxh/yO2vf9hG4/8ARjV9aar/AMh2x/69p/8A0KKvkvxh
/wAjtr3/AGEbj/0Y1IZm2N5Np2oW97bELPbyLLGSMgMpyOO/Ir1/U9f1XxJ+z5fahrF5Jd3R1hV3
vgYAAwABwB7CvGK7mHxZpsfwcufCzed/aMmoi5X5Pk2ADvnrx6UAb8LNY/s2O9sxie71jEzLwXAA
wCfT5RTvEVwtx8EPA2pahH9seC+miIdiC8Qd/kJ64wgFZHhLxXoMngm98G+Kjdw2EtwLq2u7VQzw
vxkEHqOP1NHi/wAV+HdQ0zw74X0Zb3+wNKctLNKAJZizZZgOmeW/OgDS8B+LfC9n8ULrXHtk0DTW
tHSCEFpQjkAdh35NQar4M0bU/Bmo6/4T8R3+orpxU3tteJsbaf4h/P8AA+lZ+m6x4F0fxregabc6
h4ZuYDCPtKgzxEgZdfcHP51pXXinwh4Y8EaxoXhKXUb661jak9xeRhBFGP4QB1OMj8fwoA3Pg54u
1zV9VutGvL5m02y0OZYLZVCou0oATgcnBPJ9a8Trtvhj4q07wj4g1C91PzvKn06W2Tyk3HexUjPI
4+U1xNAHY/DPw7Z+J/Fg06/069vrdodzC0lCGL50HmMT1UZIIHPIr6oN/No2r6foOn+F7p9MWNI1
vYigigXpggnPGP1r5L8C+ItP8L+I11TULG4vEjT91HBcGIiTcpBJH3hgHg8HPtX0fH4k+HGvXFr4
wm16KC6t0VhFLftEyFc8NDu+Y8nsc+9AHkXxu8JaZ4a1mOXTdKu7ZbuVpHuHkBhkJGSqL1GCf1ry
ivQ/it440fxtqy3Om2N1E8TlTPLOSsqAYUiPov8AOvPKANnwjY2+qeM9E0+7TfbXN/BDKucblZwC
PyNfYuueC9H8QWdjaXUUkUFju8iO3YIFDIUIxjpg18g+BJEi+IHhySR1RF1O3LMxwAPMXkmvtoXE
GP8AXR/99CgDyH4geBNG8I/CzxFPpn2jfJa2tu3mybhtSdMduvJr5jr69+NFzb/8Kn1tPPi3OIQq
7xlj5yHA9eAa+QqACvrG28Tr4R+A2maorotyLCKK2D9DKwwv4DqfYGvk6vpHw946+G1x4J8NWGv6
mpudLSOQQvBMQkqgjnauG6+4oA6Xw54tl8X/AAh1i6vJIX1C2tbq3ujDjazKjYYexXB/Ovkmvo27
+JXgm30zxF/Z0llDcapE6SLCZ/nOyRFIUxBQcCP0+8cn5efnKgAooooAKKKKACiiigAooooAKKKK
ACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooA9K8A/wDJKviR/wBc
LL/0OSvPbK/vNNuBcWN3PazgECSCQo2D1GRzXffDjVvDsHhXxdomv61/ZQ1ZLZIZvs0k/wBxnLHC
D3XqR1rI8QeH/Bun6TJcaN43Oq3oZQtr/ZcsG4E8nexwMDmgDrtW8T+ILb4JeG72DXNTiu5dQuEk
nS7kWR1GcAsDkipvhs+rar4A8byW+u/YNTmntG/tG6vWh2neclpeoJGR75xXJ6tr2mXPwi0DQ4bn
dqVrfTSzQ7GG1Gzg7sYPXsaveA9S8NnwR4n8Pa/rv9kHUpLZopvssk/EbFjwo+g5I60AVfGdr4ns
NJjGreObbW7aWUL9mt9Ze6wQCQzIeAOOtcJXXeIdA8H6dpTXGi+NTq14HUC1/suWDKnqdzHHHpWT
4Z8Nah4r1uHS9ORTLJyzucJGvdmPpQA7wt4W1TxfrUWl6VAXlbl3P3Yl7sx7CvrDQvA+meBfAt/Y
WC75ntZGuLlh80rbDz7D0HarPgfwfovgbREsbF4nncA3NyxG6ZvX2HoK2dbuIToOogTR/wDHrL/E
P7poA+E699+FmmaNe/CC9u9dluI7LT9QkumMExjJ2xrwcdQc4xXgVfTv7PSRz/Du+hcI4N64ZGwe
Ci9RQAn9rWXjH4T674o85m1IaVc208SMfLhBLOqYwASAV59PrXzHX1zqfhm38G/AvVtGhcOYdMmM
smMeZIVJY/n09sV8jUAFFFFABRRRQB9IfDb/AJJdoP8A19r/AOlhr16I15D8Nv8Aklug/wDX0v8A
6WGvXYjQBazRmm5ozTENmkKR5XGdwHIz1IFQyXHlY8y4iXPTcmP/AGaluziDP+2n/oQrFuL+W21R
mByQm1FJwMEqS36H8qANqG8hkj3NNFnJHDAdCR61ZzWVHqSXtnOULBlUhlPY4p+sSOLNI0Yr50qx
lh1AJ5oAti9tjJ5YuYvM6bd4z+VT5qpHYWcaKq20QCYI+QZB9c1VWS7vp7jybkQRQv5agIGLEdSc
9qANXNGaxH1G6ktLUxlUma48mTjIyMg/41MZLy3u0tpLnzROjbH2AFGA/IigDVzRmsc6hM+kxMjY
u3cQ9Bw+cE4/AmtUcAAnJ9aAH5ozTc0ZoA5C98WyCSNtsttbFN4kiG9mJIwDlCF4z+Yp2l+Mo5bg
wzMHiMqKk0jbH+bA+7tAOD344Nc9HceXLpzGQqsbRSYBxvKlTtB9SM/lXYaZ4j+2SJbT/u7pl3YR
iVPr9Mf/AKia8+hiXU92Ukma1XThPkN1ZUePzEdWT+8DkfnWdbeJtBvLhYLXW9NnmY4WOK7RmJ9g
DmpYG3afMc/xzf8AobV5HYXGian8NrfR7TSpLzXXiKRmKxYGOTccOZSoAA4Oc13rqZ2Pa80ZrlNZ
kurO2sUn8XWui7YQsjSpEWlcAcgyHGPw/GsWPxXrNz4Ei1CGZHmS+a1ub62g80LCrEGZUHB4A9Rz
mn/X6CXQ9EZgqlmICgZJJ6UKwZQykEEZBHevPdTlu7v4ea5dW/i0apEbdmSaK3iVlAU7kO3jnjsC
KlutU1Dwn4ItJ31KS9uLtoILdpbdSINwH8MagvgAnHJNHf5fiHb5/gd9mjNcD4f8Rai/iW309768
1SzuYnLzXGltam3dRkc7QCp598jrXeZosA7NV728SytmmcM3IVVXqzHgAVNmsnxDbyT6crRhm8p9
7BRk7SrKSB3xuz+FXTSckmTNtRbRU/tvUvK+1eRF9m658ttuP9/PT324rbsrxL22WZAy8lWVuqsO
CDWG3iS2XRCDERIIth6eV0xnd02/r7VN4XkRtPkIZtzvvCsMMF2hQce4XP41pVSS95WfTzM6cm3o
7o17u9tdPtmub25htoExulmkCKM8DJPFUIfFGgXJcW2tafcMiNIyQXKSMFUZJwpJ4FYnxMZV8DXR
ZS6iaAlQMkjzV4x3pLbV9Okgvn0/w9fabcw2kkiT3GlmBQQOm4jBPt7Vz30b7f5G6WqR1dle2+oW
UF5ayeZbzoJI3wRuUjIODzU+a89k13XpdL8FrZXkSXOqx4uJJIVZf9VuLbRjkckAYH4VftNU1XRP
Etzpmral/aVt/ZzX0cxgWJ02NhlwvBHOaqWja9fw1JWqXy/HQ6q/v7bTLCe+vJPLtoEMkj7Sdqjq
cDk1NFKk0SSxnKOoZT6g9K8v1eTxNqnw3vtduNVi8m7s2lOnC2XYkTDjD/e3BecnjtivR9MP/Eqs
/wDrgn/oIotvfpb9R32t1v8AoXM0ZpuaM0gILmFLq1mt3JCSoyNjrgjFUvsF7/0GLj/vzF/8TWhm
jNAHGaxaXOk3L31xLDOk8oVZ3CrIv7vpwoAHynoe9XPDVpLNdLq+y3SF4pYl2ffcl15OFH9w9z1r
p80ZrkWEiq3trmapLm5jC0XQDaaTqVhqIhmivLu4lKqSQY5GJwcgc4NYujeBbm30/wAQabql4lxa
6gqQwSISZFjRSq7sjG4Db0z0rt80Zrqtpbysa31v8zm9Kt/GFo1raXk+jzWcOFe4USedIg/2fuhj
65NQReE7hPiDLrpmhOnlTKkIJ3i4KCMtjGMbR69TXV5ozVX1uK2ljk/DXhO40TxHql/PPC9tLlLG
NCcxRs7SMDkYHzHtnpXWONyMo6kYozRmpa0sHW5xf/CG3rfDqz8PvcW32u3dZDnc0Mu2QvtbgHae
h4qxb6BrE3ibStWvBpltFZJLH9mtNx4dcZ3FRnkDjAwPWuszRmqvrcDirLQfFejJqUem3elPHfXc
1wPtHmZg3twVwPm4wcHHPc10vh/SI9A0G00uKQyCBMGQjBdicsfxJNaGaM0lorf1oD1dxstxDAAZ
ZUjz03sBmnJIkiB0dWU9CpyDVXUNOtNUtTb3kKyxZBweMEdwe1WI0SGNY40VEQYVVGAB6UAY11ba
xb+IrnUNPtbG5iuLSGAi4u3hZWjeVu0b5BEg9OlZmk6T4i0e9ubuO00udrtSZEa+kQRsbm4lwD5J
3DE4GcDlTxXXZozQBlaHaX1vJqdzqEdtFNe3YnEdvM0qqohjj+8VXnMZPTvWffReNZZbmC2k0EWk
hZY5ZBL5iIemV6Ege4FdLmjNJq+472POb7RbvRte8G6ZpN1H9os7W5CPcKdkmAuQwHIByenTjrW/
p2gapJqmoaxrM1ob6e1+yQRWu4xxR8n7zAEkk+lbs2nWlxqNtqEsW66tVdYZNxG0NjdxnBzgdatZ
pvVa+f43EtNvL8DkLDwpfWtv4Rjea2J0YP8AaNrN82Yyo2cc8nvirmn6Rq+l+J9QuLeSyk0vUJxP
KJC4mjbYFIUAbSOB1Iro80Zp31uK2liG/s4tR0+5spxmK4iaJx7EYrn/AAR4bu/DmmzrqVxFc388
gMksZJBRFCIOQDwB+ZNdNmjNJaX8xvU4xfBd23hs2ZvIodQg1KTULSdAXVGLllDAgZ4OD/WtvST4
ma6J1n+yVtwhAWzMjMzccksAAOvHP1rYzRmhaaf12B66nGeH/BEmm/23FfywzW92r21qqEkx25Z2
2nIHOXPTPQVf8EeHr3w7pM0WpXEVxfTy75JYiSCoVUUZIB6KK6TNGaFoD1FLBVLMQABkk9qjiuoJ
mKxTxyEDJCsDT+owap2Gl2OmGY2dukPnPvfb3P8Ah7UAXs0ZpuaM0AOzRmm5ozQA7NGabmjNADs0
ZpuaM0AOzRmm5ozQA7NGabmjNADs0ZpuaM0AOzRmm5ozQA7NGabmjNADs0ZpuaM0AOzRmm5ozQA7
NGabmjNADs0ZpuaM0AOzRmm5ozQA7NGabmjNADs0ZpuaM0AOzRmm5ozQA7NGabmjNADs0ZpuaM0A
OzRmm5ozQA7NGabmjNADs0ZpuaM0AOzRmm5ozQA7NGabmjNADs0ZpuaM0AOzRmm5ozQA7NGabmjN
ADs0ZpuaM0AOzRmm5ozQA7NGabmjNADs0ZpuaM0AOzRmm5ozQA7NGabmjNADs0ZpuaM0AOzRmm5o
zQA7NGabmjNADs0ZpuaM0AOzRmm5ozQA7NGabmjNADs0ZpuaM0AOzRmm5ozQA7NGabmjNADs0Zpu
aM0AOzRmm5ozQA7NGabmjNADs0ZpuaM0AOzRmm5ozQA7NGabmjNADs0ZpuaM0AOzUch4p2aZIaAO
e1T/AJDtl/17T/8AoUVfJnjD/kdte/7CNx/6MavrLU/+Q7Zf9e0//oUVTD4e+EL0C7ufDmny3E/7
yWR4QS7NySfck0hnxbRX2n/wrTwT/wBCxpn/AH4FH/CtPBP/AELGmf8AfgUAfFlFfaf/AArTwT/0
LGmf9+BR/wAK08E/9Cxpn/fgUAfFlFfaf/CtPBP/AELGmf8AfgUf8K08E/8AQsaZ/wB+BQB8WUV9
p/8ACtPBP/QsaZ/34FH/AArTwT/0LGmf9+BQB8WUV9p/8K08E/8AQsaZ/wB+BR/wrTwT/wBCxpn/
AH4FAHxZRX2n/wAK08E/9Cxpn/fgUf8ACtPBP/QsaZ/34FAHxZU32y6AwLmb/vs19m/8K08E/wDQ
saZ/34FH/CtPBP8A0LGmf9+BQB8YSXE0oxJLI4HZmJqOvtP/AIVp4J/6FjTP+/Ao/wCFaeCf+hY0
z/vwKAPiyivtP/hWngn/AKFjTP8AvwKP+FaeCf8AoWNM/wC/AoA+LKK+0/8AhWngn/oWNM/78Cj/
AIVp4J/6FjTP+/AoA+LKK+0/+FaeCf8AoWNM/wC/Ao/4Vp4J/wChY0z/AL8CgD4sor7T/wCFaeCf
+hY0z/vwKP8AhWngn/oWNM/78CgD4sor7T/4Vp4J/wChY0z/AL8Cj/hWngn/AKFjTP8AvwKAPiyi
vtP/AIVp4J/6FjTP+/Ao/wCFaeCf+hY0z/vwKAPiyivtP/hWngn/AKFjTP8AvwKP+FaeCf8AoWNM
/wC/AoA+LKK+0/8AhWngn/oWNM/78Cj/AIVp4J/6FjTP+/AoA+LKK+0/+FaeCf8AoWNM/wC/Ao/4
Vp4J/wChY0z/AL8CgD4sor7T/wCFaeCf+hY0z/vwKP8AhWngn/oWNM/78CgD4sor7T/4Vp4J/wCh
Y0z/AL8Cj/hWngn/AKFjTP8AvwKAPiyivtP/AIVp4J/6FjTP+/Ao/wCFaeCf+hY0z/vwKAPiyivt
P/hWngn/AKFjTP8AvwKP+FaeCf8AoWNM/wC/AoA+LKK+0/8AhWngn/oWNM/78Cj/AIVp4J/6FjTP
+/AoA+LKK+0/+FaeCf8AoWNM/wC/Ao/4Vp4J/wChY0z/AL8CgD4sor7T/wCFaeCf+hY0z/vwKP8A
hWngn/oWNM/78CgD4sor7T/4Vp4J/wChY0z/AL8Cj/hWngn/AKFjTP8AvwKAPiyivtP/AIVp4J/6
FjTP+/Ao/wCFaeCf+hY0z/vwKAPiyivtP/hWngn/AKFjTP8AvwKP+FaeCf8AoWNM/wC/AoA+LKK+
0/8AhWngn/oWNM/78Cj/AIVp4J/6FjTP+/AoA+LKfHLJESY5HQnqVYivtD/hWngn/oWNM/78Cj/h
Wngn/oWNM/78CgD4z+23X/PzN/38NIby6IwbmYg/7Zr7N/4Vp4J/6FjTP+/Ao/4Vp4J/6FjTP+/A
oA+LKsW99eWilba6nhB5IjkK5/Kvsv8A4Vp4J/6FjTP+/Ao/4Vp4J/6FjTP+/AoA+N5dT1CeMxzX
1zJGeqvMxB/Amqlfaf8AwrTwT/0LGmf9+BR/wrTwT/0LGmf9+BQB8WUV9p/8K08E/wDQsaZ/34FH
/CtPBP8A0LGmf9+BQB8WUV9p/wDCtPBP/QsaZ/34FH/CtPBP/QsaZ/34FAHnnw3/AOSW6D/19L/6
WGvW4jXM6lpljo8UNhp1rFa2kV1b+XDEuFXMqE4H1JP410kRpgWs0ZpuaM0CGzRiaIoWK8g5HYg5
rJv9OjeWMzvJIpUjITlTlTwVGR0NbGaM0AZWYo7VoYUZRsIVRG3XH0rQvLZby2aFmK5wQw6qR0NS
5ozQBTiGqKyLK1qyA/M43biPp0zTTbXdvPM1o0JSZt5WXPyt3Ix1q9mjNAGPdWjW1tYwpL+9+0hi
5HVjk5xVuO2uZb1Lm7aIeUpEaRZIyepOasywxzGMyLkxtvXnoae6iRGRvusMHBxQBlw2+7XpSrZi
i/eY9JGGP5DP41r5qC3t4bVCkKBQTk8kkn3JqXNADs0ZpuaM0AcLceGL2HyWljhmtoZoi3JYsgcZ
+Xae3atXTodP0qDyrZJhwAztDIWbHTJ210uaM1jToQp/Cipzc2nIp2AaTTGGCpdpSNwI4Ltjg896
qeFNKn0LwvYaZdPG81uhV2iJKk5J4yAe/pWvmjNbEnK3mgapF4ru9ZsE0y6F1DHFi+LBrfbn7mFO
Qc5I4570aRomv6BoElrZT6dPeteyzlpw6xujkn+HlTyPUfWuqzRmhaf18wev9fI4638IXtzH4gl1
GSytrjWLcQGOxVjGmAw3ktgsx3c8DpUknhzWdV8MRadqdxZW97ZvFJZXNpuYB4+jMGA69wPWutzR
mj+vuAxdKPig3Y/tj+yFtlQg/ZDIzu3Y/MAFHtzW5mm5ozQA7NBPHFNzRmgCo1pbef5/2KDzuvme
UN354rGvLabTLhbi3VxbluAgyYmPoO6n0/8ArV0maM1lWpKqrN6rZlwnyPQwfEelXviHwt9iTyob
qR4pCJGIUbXVj0B7CtfUYHu9MuraMqHmheNS3QEgjmp80Zq+X3eVk31ucpbeGL2GPwirS25OjIVu
MM3zfutnycc8+uOKv3ehS3fi5dTkaI2Z02SzdMneSzg9MYxgHvW5mjNU9Xd/1fQS0Vl/VtTgpvCv
ik+FZ/DEd/pn9niFoYblg/nFP4VYY2jsCwzx2zXc2cTW9lBC5BaONUJHTIGKkzRmi4WHZozTc0Zo
A+X/APhZfiz/AKCMH/gDb/8AxFH/AAsvxZ/0EYP/AABt/wD4isHSLbT7u/WLU9RbT7YqSZ1gMxB7
DaCDzXpXjHQvCZsvDvn+JDZAaZH5bJpbP9oXtIcMNpPocmh6K4lqzk/+Fl+LP+gjB/4A2/8A8RR/
wsvxZ/0EYP8AwBt//iKy/DWhjxF4ms9HW68hbmQoJvL3YwCc7cj09a6GfwJpOnma11PxfZWmppuK
2hgZ8egdwdqMeOOcZoeiuPrYpf8ACy/Fn/QRg/8AAG3/APiKP+Fl+LP+gjB/4A2//wARVbRtA0S8
04XmreKbbTNzlVgW2eeTjuVXoKZ4k8LHQorK8tr+HUdMvgxtruFSoYqcMGU8qR6UPQFqXP8AhZfi
z/oIwf8AgDb/APxFH/Cy/Fn/AEEYP/AG3/8AiK1734b6ZpN9b2+reLrayF1Ej2+61ZmcsOchWwqg
8biecHiua1DwlqNh4w/4Ro7JLxplijZThX3Y2t9MEGi2thX0uXv+Fl+LP+gjB/4A2/8A8RR/wsvx
Z/0EYP8AwBt//iKs33g3w/YyXFm/jW0OpwBg8Bs5BHvHVRL068dKpeEPBr+LYNUdNQitDYRLKTKv
yMCTkls/KAATnBpLUb0JP+Fl+LP+gjB/4A2//wARR/wsvxZ/0EYP/AG3/wDiKk1DwVaf2Dc6voOv
waxDZEC7jW3eF4gejAN95feotF8Gw3mhHXNa1mHR9MaUwwyPC0zzOOu1F5IHrTAX/hZfiz/oIwf+
ANv/APEUf8LL8Wf9BGD/AMAbf/4iqvibwpJ4fis7yC+h1HS75S1teQqVDY6gqeVI9K0tL8ALf+Fr
PxBca1BZWUskiTvPGcQhTgYwcuxPRQBQBX/4WX4s/wCgjB/4A2//AMRR/wALL8Wf9BGD/wAAbf8A
+Ipl34e8OWup2sS+Lo59PmRma6isnLRMOimPdnn1zXX+MdC8Jmy8O+f4kNkBpkflsmls/wBoXtIc
MNpPocmk9r/11/yDrb+uhyf/AAsvxZ/0EYP/AABt/wD4ij/hZfiz/oIwf+ANv/8AEVyjAByFO5Qe
DjGaSmB1n/Cy/Fn/AEEYP/AG3/8AiKP+Fl+LP+gjB/4A2/8A8RWrp/wzt7630kHxHBBfarame1tX
tmJZhklSwOAOOp6+lZOu+DYtK0EapZazDqKR3P2O7SOFk8mXGcAn7w4PPFD03/roC12F/wCFl+LP
+gjB/wCANv8A/EUf8LL8Wf8AQRg/8Abf/wCIq0vgXT7CC3HiPxPbaRfXCCSO0+zPMyqenmFeEz71
kX/hDU7DxVD4fIilubhkFvIjZjlV/usD6UW1sK+ly7/wsvxZ/wBBGD/wBt//AIij/hZfiz/oIwf+
ANv/APEVZvvBvh+xkuLN/GtodTgDB4DZyCPeOqiXp146VjeGPDU3iW+niF1FaW1rC1xc3MuSsUY6
nA6n2pLUb0ND/hZfiz/oIwf+ANv/APEUf8LL8Wf9BGD/AMAbf/4iq2s6FoNnpzXWk+KodSdGCtA1
o8D4Pcbuoo0bQNEvNOF5q3im20zc5VYFtnnk47lV6CmgLP8AwsvxZ/0EYP8AwBt//iKP+Fl+LP8A
oIwf+ANv/wDEVT8SeFm0KKyvLa/h1HTL4Mba7hUruKnBUqeVI9K2n+HlraR2trqniW0sdbukV4dP
eF2A3fdDyDhCfcUAUf8AhZfiz/oIwf8AgDb/APxFH/Cy/Fn/AEEYP/AG3/8AiKZrngi80zxqnhiz
l+3XUgTY2zy8llycjJwB657Vpp8P9LubttKsvGFjca4MqLQW7rGzjqqyngn8KXS4Gf8A8LL8Wf8A
QRg/8Abf/wCIo/4WX4s/6CMH/gDb/wDxFcvPDJbTyQTIUljYo6nqpBwRUdAHXJ8SPF0jqiX0TOxw
FWwgJJ/791dvvGHxB0uKOXUEmtI5DhHuNJijDH2JjGav/CXTdEl8T6ddy6uf7TQystgbNiOFbDeZ
nHTnp2rB8X3VvcrG0XjG+11zKxaG5t5I1i9xuYj24Apy0sgjrcP+Fl+LP+gjB/4A2/8A8RR/wsvx
Z/0EYP8AwBt//iKlt/Cfhpo4Uu/HNnDeSqp8qOzkkRSR0aQcD39KxdU0CXQfEjaPq0ywiORRJPGp
kUIcHeo4LDBzijrYXS5ut498bJZR3rz7bWRiiTnTYQjMOoDeXgn2qbT/ABl8QNW8z+zVlvfLxv8A
s2kxSbc9M7YzjoaTxLpQsfAmlzWHiN9U0h7yRYoWsfI2Pj5mySSa5/wxqF7Za9Ypa3lxAkt1EJFi
lZQ43Dg4PPU04q8uUJO0bmzc/EHxnZXL211crBPGcPFLp0Csp9CDHkVD/wALL8Wf9BGD/wAAbf8A
+IpvxJ/5KLrf/Xx/7KKbovhCK80f+2tZ1eHR9LaQxRSyRNK8zDrsReSB3NTF3jcqStKxJ/wsvxZ/
0EYP/AG3/wDiKX/hZXiz/oIQf+ANv/8AEVV8ReFP7Hs7TUrHUYdU0q7YpFdRIUIcdVZDyp9q2D8P
bWzFra6p4ls7HW7pFeLT3hdgN33Q8g4Qn3FNakle78feNtPuDb3s/wBmmABMc2mwowB5BwY81B/w
svxZ/wBBGD/wBt//AIir3xdUp8QLhG6rbwg/98CuFpJ3G9DrP+Fl+LP+gjB/4A2//wARR/wsvxZ/
0EYP/AG3/wDiK5OimI6z/hZfiz/oIwf+ANv/APEUf8LL8Wf9BGD/AMAbf/4iovCXg2bxbb6o1vdr
DLZRpIqOvyvuOOWyNoGMk80us+GtD0/S3uLDxZa6jdxMqyWsduydTglGJwwHsKHoNakn/Cy/Fn/Q
Rg/8Abf/AOIo/wCFl+LP+gjB/wCANv8A/EVaXwLp9hBbjxH4nttIvrhBJHafZnmZVPTzCvCZ96yL
/wAIanYeKofD5EUtzcMgt5EbMcqv91gfSi2thX0uXf8AhZfiz/oIwf8AgDb/APxFH/Cy/Fn/AEEY
P/AG3/8AiKs33g3w/YyXFm/jW0OpwBg8Bs5BHvHVRL068dKpeEPBr+LYNUdNQitDYRLKTKvyMCTk
ls/KAATnBpLUb0JP+Fl+LP8AoIwf+ANv/wDEUf8ACy/Fn/QRg/8AAG3/APiKk1DwVaf2Dc6voOvw
axDZEC7jW3eF4gejAN95feotF8Gw3mhHXNa1mHR9MaUwwyPC0zzOOu1F5IHrTAX/AIWX4s/6CMH/
AIA2/wD8RR/wsvxZ/wBBGD/wBt//AIiqvibwpJ4fis7yC+h1HS75S1teQqVDY6gqeVI9K6G9+G+m
aTfW9vq3i62shdRI9vutWZnLDnIVsKoPG4nnB4oWojI/4WX4s/6CMH/gDb//ABFH/Cy/Fn/QRg/8
Abf/AOIqjqHhLUbDxh/wjR2SXjTLFGynCvuxtb6YINa994N8P2MlxZv41tDqcAYPAbOQR7x1US9O
vHSldWuOzvYrf8LL8Wf9BGD/AMAbf/4ij/hZfiz/AKCMH/gDb/8AxFZ3hvwzceI7i42zw2lnax+b
dXc5wkKe/qT2HetS+8F2L6Pd6l4e8Qw6wlkA11ELZ4JI16bgrfeHvTegLUZ/wsvxZ/0EYP8AwBt/
/iKP+Fl+LP8AoIQf+ANv/wDEVydA60CO0u/HvjawmEN5P9mlKhgk2mwo2D0ODH0NV/8AhZfiz/oI
wf8AgDb/APxFdp488M6XfeIbS61fxJbaT9os4Et42gaVnwuCW28IueMn0NcBeeDNWtPF6eGtiS3s
jqImQ/JIp5Dg+mOfwNFtbB0v5Fv/AIWX4s/6CMH/AIA2/wD8RR/wsvxZ/wBBGD/wBt//AIitL/hX
NhdXU+l6X4ss73XIVbdZC3dFZl+8qSHhj1rC8NeE5/EFxeedcx6fZWCeZeXU4JEQ6YwOp4PHtSHq
acPj3xtcW89xBP5sNuAZpE02FljB6FiI8DPvVf8A4WX4s/6CMH/gDb//ABFdVpuh2WmfDvxfdaXr
MOq2U8MKCVImidWV+QyNyOowe9cPqPhv7H4U0rX4Lv7RBeu8UqeXtMEi/wAJOTnIyc8UPR/d+ILY
vf8ACy/Fn/QRg/8AAG3/APiKP+Fl+LP+gjB/4A2//wARVGbw39m8FW/iGe72PdXLQW9r5eTIqj5n
3Z4APGMUaN4Tv9c0TVtVtprZINMjEkyyswZhgn5QAQeh6kU3pfyDt5l7/hZfiz/oIwf+ANv/APEU
f8LL8Wf9BGD/AMAbf/4iuTooEdZ/wsvxZ/0EYP8AwBt//iKsQ+PfG1xbz3EE/mw24BmkTTYWWMHo
WIjwM+9ZXhfwtL4klupHu4rHT7KPzbq7mBKxr24HUnsK7fTdDstM+Hfi+60vWYdVsp4YUEqRNE6s
r8hkbkdRg96HomxrVpHK/wDCy/Fn/QRg/wDAG3/+Io/4WX4s/wCgjB/4A2//AMRUei+EIrzR/wC2
tZ1eHR9LaQxRSyRNK8zDrsReSB3NN13wnHpMNjqFtqsWoaLeSeWl7DGVKkfeDIeQQOcZ5otrYRN/
wsvxZ/0EYP8AwBt//iKP+Fl+LP8AoIwf+ANv/wDEVneKvDknhjxBLphn+0oFR4pwm0SowBBAyfp1
7VY8QeGIPDmt2OmXepZaWGKW7cQf8exfkrjd82Bz2zQtRmi3j3xsllHevPttZGKJOdNhCMw6gN5e
Cfaq/wDwsvxZ/wBBGD/wBt//AIirviXShY+BNLmsPEb6ppD3kixQtY+RsfHzNkkk1znhzw7e+J9W
XT7HYrbTJJLKcJEg6sx9KN21/WwbK5rf8LL8Wf8AQRg/8Abf/wCIo/4WX4s/6CMH/gDb/wDxFGpe
F/D9vY3Mmn+MrS9u7dSzW5tZIg+OoRzwx/nUei+EIrzR/wC2tZ1eHR9LaQxRSyRNK8zDrsReSB3N
AEn/AAsvxZ/0EYP/AABt/wD4ij/hZfiz/oIwf+ANv/8AEVW8ReFf7GsrXU7HUYdT0m7JSK7iQphx
1VlPKn2rnKQHWf8ACy/Fn/QRg/8AAG3/APiKP+Fl+LP+gjB/4A2//wARXJ11+r39pN8M/DtlHcxP
dQXNw0sIYFkBIwSO2ab2uJb2Gf8ACy/Fn/QRg/8AAG3/APiKP+Fl+LP+gjB/4A2//wARWj8Pra3s
dI8QeKZ7aO5m0uFFtI5V3KJnOAxHfHH51tTS6r4v8Ka/a+KbLZrOlwLfWs8lsIZPL53KQAMrgf5x
RLT+v66ajjr+Ryn/AAsvxZ/0EYP/AABt/wD4ij/hZfiz/oIwf+ANv/8AEVydPijaWVI1+87BR9TQ
ld2Qr2Op/wCFl+LP+gjB/wCANv8A/EUf8LL8Wf8AQRg/8Abf/wCIrtte1nV/BeoDQ/DWnI2laVbx
NqRFqJBMzDJMjYOAR9O9cZ8StGtNH8WsdPjEVnewR3cUajhA45A9sg0m+2w0hn/Cy/Fn/QRg/wDA
G3/+Io/4WX4s/wCgjB/4A2//AMRXJ13vw+trex0jxB4pnto7mbS4UW0jlXcomc4DEd8cfnT6Ni62
M7/hZfiz/oIwf+ANv/8AEUf8LL8Wf9BGD/wBt/8A4iurml1Xxf4U1+18U2WzWdLgW+tZ5LYQyeXz
uUgAZXA/zivKKXWw+lzrP+Fl+LP+gjB/4A2//wARR/wsvxZ/0EYP/AG3/wDiK5aKNpZUjX7zsFH1
Nev69rOr+C9QGh+GtORtK0q3ibUiLUSCZmGSZGwcAj6d6dhdTif+Fl+LP+gjB/4A2/8A8RR/wsvx
Z/0EYP8AwBt//iKf8StGtNH8WsdPjEVnewR3cUajhA45A9sg1nX3hO/0/wAKaf4ilmtms76QxxIj
MZARn7wxj+E9CaXS7H1si9/wsvxZ/wBBGD/wBt//AIij/hZfiz/oIwf+ANv/APEVpfDnSY2t9W15
tOGpT2Cxx2doyblknkOFJHfHX/8AVVnxtefEH+xGi8UadGtjI67JFgiPlEHIAZPu+mDTloC1MT/h
Zfiz/oIwf+ANv/8AEUf8LL8Wf9BGD/wBt/8A4iu78JN4uHwr08eDxm7N9N52fK+5j/ppx1x0rz/x
rf8Aim61mJPFiuL2BNqK8SJ8mc8bQARnPPND0lb+tgWquS/8LL8Wf9BGD/wBt/8A4ij/AIWX4s/6
CMH/AIA2/wD8RWtZfFPxC+oW1pa2enR2DyLH/Z0NovluCcbemcn61oXXhHSbr44jRbeJV07eJ5oE
+6uE3sg9BnjHbNFtV5/oK+j8jmf+Fl+LP+gjB/4A2/8A8RR/wsvxZ/0EYP8AwBt//iK7jSPEmpeI
vEUWk6vpUf8AwiepySWtnH9kVEjwDtKOB94Y9fXHSvJtSsjpurXdixybad4ifXaxH9KS1a8ymrX8
jof+Fl+LP+gjB/4A2/8A8RR/wsvxZ/0EYP8AwBt//iKd8Sb+01Lxe1xZXMVxD9mhXzImDDIQAjI9
65GgR1n/AAsvxZ/0EYP/AABt/wD4ij/hZfiz/oIwf+ANv/8AEVydeh3vw30zSb63t9W8XW1kLqJH
t91qzM5Yc5CthVB43E84PFOwrmR/wsvxZ/0EYP8AwBt//iKP+Fl+LP8AoIwf+ANv/wDEVTvPB2qW
vjI+GFVJr4yhEZT8rAjIb2GOfat7/hXNhdXU+l6X4ss73XIVbdZC3dFZl+8qSHhj1pdLj62M3/hZ
fiz/AKCMH/gDb/8AxFH/AAsvxZ/0EYP/AABt/wD4ijwPpmkXPiG0Gq6q1ncxXsSx2ps2lEx3D5S2
QF545B61o+P9I8OW+ua1Pba+xv1uGI09dPZVU7uVEm7HHPOO1D0t/XYFrczv+Fl+LP8AoIwf+ANv
/wDEUf8ACy/Fn/QRg/8AAG3/APiK5OimI7Sz8e+N9RuBb2U32mYjIjh02F2P4CPNLe+O/HGm3Bt7
+U2s4Aby59MhRsHocGPNdV4RstC0zwV4jutP8WTxO6W6TXsdg6Pa5boo3ZbJ4yCK4O90+XX/ABXB
p+l6xca7NcbUS6uUaNie4IYkgD1zQ173KgW12Wf+Fl+LP+gjB/4A2/8A8RR/wsvxZ/0EYP8AwBt/
/iK0v+Fc2F1dT6XpfiyzvdchVt1kLd0VmX7ypIeGPWsDRvDLarpeu3j3Jt30mASmIxbjIc425yNv
60rr9R2Zd/4WX4s/6CMH/gDb/wDxFH/Cy/Fn/QRg/wDAG3/+Iqhovhz+19D1vUvtflf2XCkvl+Xu
83c2MZyMfka1tO8C2914UtPEV7rsNhZSzPFKZYCxjwcDaFOXJ9ABjB5piIP+Fl+LP+gjB/4A2/8A
8RS/8LK8Wf8AQQg/8Abf/wCIqt4p8Jjw/FYXlnqMWp6bfozW91HGU3FTggqckEZrXPw9tbMWtrqn
iWzsdbukV4tPeF2A3fdDyDhCfcULUCvd+PvG2n3Bt72f7NMACY5tNhRgDyDgx5qD/hZfiz/oIwf+
ANv/APEVe+LqlPiBcI3VbeEH/vgVwtJO43odZ/wsvxZ/0EYP/AG3/wDiKP8AhZfiz/oIwf8AgDb/
APxFcnRTEdZ/wsvxZ/0EYP8AwBt//iKQ/ErxWeuoQf8AgDb/APxFcpSGgD1z4beI9V8Qa5d/2ncJ
N5FsfL2wRx43MufuKM9B1r2K41y3021gjbLymNfkHbivCPg5/wAhvUf+vYf+hCvT9NX7brF20vze
U21c+mSP6Vy4mrKDjCG8nY6sPSjJSnLaKNz/AISzP/Lm3/fVL/wlf/Tm3/fVL9nT+6Pyo8hf7oo9
lW/n/APaUv5PxE/4Sv8A6c2/76o/4Sv/AKc2/wC+qXyF/uijyF/uij2Vb+f8A9pS/k/ET/hK/wDp
zb/vqj/hK/8Apzb/AL6pfIX+6KPIX+6KPZVv5/wD2lL+T8RP+Er/AOnNv++qP+Er/wCnNv8Avql8
hf7oo8hf7oo9lW/n/APaUv5PxE/4Sv8A6c2/76o/4Sv/AKc2/wC+qXyF/uijyF/uij2Vb+f8A9pS
/k/ET/hK/wDpzb/vqj/hK/8Apzb/AL6pfIX+6KPIX+6KPZVv5/wD2lL+T8RP+Er/AOnNv++qP+Er
/wCnNv8Avql8hf7oo8hf7oo9lW/n/APaUv5PxE/4Sv8A6c2/76o/4Sv/AKc2/wC+qXyF/uijyF/u
ij2Vb+f8A9pS/k/ET/hK/wDpzb/vqj/hK/8Apzb/AL6pfIX+6KPIX+6KPZVv5/wD2lL+T8RP+Er/
AOnNv++qP+Er/wCnNv8Avql8hf7oo8hf7oo9lW/n/APaUv5PxE/4Sv8A6c2/76o/4Sv/AKc2/wC+
qXyF/uijyF/uij2Vb+f8A9pS/k/ET/hK/wDpzb/vqj/hK/8Apzb/AL6pfIX+6KPIX+6KPZVv5/wD
2lL+T8RP+Er/AOnNv++qP+Er/wCnNv8Avql8hf7oo8hf7oo9lW/n/APaUv5PxE/4Sv8A6c2/76o/
4Sv/AKc2/wC+qXyF/uijyF/uij2Vb+f8A9pS/k/ET/hK/wDpzb/vqj/hK/8Apzb/AL6pfIX+6KPI
X+6KPZVv5/wD2lL+T8RP+Er/AOnNv++qP+Er/wCnNv8Avql8hf7oo8hf7oo9lW/n/APaUv5PxE/4
Sv8A6c2/76o/4Sv/AKc2/wC+qXyF/uijyF/uij2Vb+f8A9pS/k/ET/hK/wDpzb/vqj/hK/8Apzb/
AL6pfIX+6KPIX+6KPZVv5/wD2lL+T8RP+Er/AOnNv++qP+Er/wCnNv8Avql8hf7oo8hf7oo9lW/n
/APaUv5PxE/4Sv8A6c2/76o/4Sv/AKc2/wC+qXyF/uijyF/uij2Vb+f8A9pS/k/ET/hK/wDpzb/v
qj/hK/8Apzb/AL6pfIX+6KPIX+6KPZVv5/wD2lL+T8RP+Er/AOnNv++qP+Er/wCnNv8Avql8hf7o
o8hf7oo9lW/n/APaUv5PxE/4Sv8A6c2/76o/4Sv/AKc2/wC+qXyF/uijyF/uij2Vb+f8A9pS/k/E
T/hK/wDpzb/vqj/hK/8Apzb/AL6pfIX+6KPIX+6KPZVv5/wD2lL+T8RP+Er/AOnNv++qP+Er/wCn
Nv8Avql8hf7oo8hf7oo9lW/n/APaUv5PxE/4Sv8A6c2/76o/4Sv/AKc2/wC+qXyF/uijyF/uij2V
b+f8A9pS/k/ET/hK/wDpzb/vqj/hK/8Apzb/AL6pfIX+6KPIX+6KPZVv5/wD2lL+T8RP+Er/AOnN
v++qP+Er/wCnNv8Avql8hf7oo8hf7oo9lW/n/APaUv5PxE/4Sv8A6c2/76o/4Sv/AKc2/wC+qXyF
/uijyF/uij2Vb+f8A9pS/k/EafFoUZNowH+9WtZ3097apcRxRhX6BnOf5VzetxrHpUrAAEY/nW14
cbOg2p/2azpzqRxHspO+l/xLnGEqHtIq2tvwNHfdf884f++z/hR5l1/zzh/77P8AhUm4UbhXachH
5l1/zzh/77P+FHmXX/POH/vs/wCFSbhRuFAEfmXX/POH/vs/4UeZdf8APOH/AL7P+FSbhRuFAERm
uUG5oUYDqEfJ/UVNHKsqB1PBpN1V7Vv9aOwkNAHGfEW5ls9C1S6gYLNCqSIxUNhgVIODweR3rxJf
iR4qHTUIP/AGD/4ivZ/ibz4W1r/riv8A7LXzaKBM63/hZfiv/oIQf+ANv/8AEUf8LL8Wf9BGD/wB
t/8A4iuTopiOs/4WX4s/6CMH/gDb/wDxFH/Cy/Fn/QRg/wDAG3/+Irk6KAOs/wCFl+LP+gjB/wCA
Nv8A/EUf8LL8Wf8AQRg/8Abf/wCIrk6KAOs/4WX4s/6CMH/gDb//ABFH/Cy/Fn/QRg/8Abf/AOIr
k6KAOs/4WX4s/wCgjB/4A2//AMRR/wALL8Wf9BGD/wAAbf8A+Irk6KAOs/4WX4s/6CMH/gDb/wDx
FH/Cy/Fn/QRg/wDAG3/+Irk6KAOs/wCFl+LP+gjB/wCANv8A/EUf8LL8Wf8AQRg/8Abf/wCIrk6K
AOs/4WX4s/6CMH/gDb//ABFH/Cy/Fn/QRg/8Abf/AOIrk6KAOs/4WX4s/wCgjB/4A2//AMRR/wAL
L8Wf9BGD/wAAbf8A+Irk6KAOs/4WX4s/6CMH/gDb/wDxFH/Cy/Fn/QRg/wDAG3/+Irk6KAOs/wCF
l+LP+gjB/wCANv8A/EUf8LL8Wf8AQRg/8Abf/wCIrk6KAOs/4WX4s/6CMH/gDb//ABFH/Cy/Fn/Q
Rg/8Abf/AOIrk6KAOs/4WX4s/wCgjB/4A2//AMRR/wALL8Wf9BGD/wAAbf8A+Irk6KAOs/4WX4s/
6CMH/gDb/wDxFH/Cy/Fn/QRg/wDAG3/+Irk6KAOs/wCFl+LP+gjB/wCANv8A/EUf8LL8Wf8AQRg/
8Abf/wCIrk6KAOs/4WX4s/6CMH/gDb//ABFH/Cy/Fn/QRg/8Abf/AOIrk6KAOs/4WX4s/wCgjB/4
A2//AMRR/wALL8Wf9BGD/wAAbf8A+Irk6KAPqD4a3R17wLbanqy281yzyh5TCiDCsQOFAA4FdRZx
aRqFsLi0itZoiSAyICMiuF+FcVhefC20s76RfLeWXchmKEjefQg4rtNLsND0bzP7PeKESfeH2ksD
+BYjNIo+Pa7v4hqW0jwdKATGdHjUN2JB5H61wldHpXjzxNounrYWGqMlqhJWKSKOULn03qcfhTeq
t/XX/MlaP+vItfDH/ko+i/8AXY/+gtWDrkjy+INRkdiztdSEk9zuNM07Vb3SdUi1Oxm8q8iYukmx
WwT7EEd/Sq00z3E8k0rbpJGLscYyScmh62+f6D2v8v1PQQLLwn4D0TVbfQrDU7zVDIZbm/h86OLa
2AirnAP+B/C949N1J8M/DU15p1rp80txK/2e1gEKKpHHy9iRg/jXGaJ418ReHbV7XStUkgt3O4xl
FdQfUBgcH6VW1LxNrOsWUdpqN/JcwxytMokAJ3t1O7GT9CcUS1uEdLHS/FdifF9sCTgafbge3y1b
+IVxfWnxPtrnTVdr2KC2khCJuJYID071xGrazf65eLd6jcedOsaxBtir8qjAGFAFTXfiTV73WYtY
nvXOoRBQk6KqFdowuNoA6Udfm3+Yunyt+X+R3ujPoXxF1q4sNR8NHT9VljeR9QspWCq4BJLxngAn
v6mqXw8s7i78OeNrS0BknawUIE5LYLcD6gVhX/xG8XalYvZXWtTNBIu1wiIhYehZVBP51f8AA+rR
aV4b8VsL+O1vHtY/s2ZQjs4fPyc5JHtSto/RjvqvVFn4fxSWvh7xjf3CMlmNMe3LMMAyscKv1/xo
8SRvefCbwndWql7e0e4huNoyEkLZGfTIH61zuteNPEXiK1S11XVJbiBDkR7VRSfUhQMn61FoXizX
fDRk/sjUZbZZOXQBXVj67WBGffFN67+X4X/zBabef4/8MdPrUb2PwZ0K2u1KXFxqElxCjjDeVgjO
PQkg/jUeryOPgx4ejDEI2oTkj1Izj+Zrk9Y1zU/EF79s1W9lup8bQznhR6ADgD6U2bWb+40a20mW
fdY20jSRRbFG1m6nOMn8TSet/O34W/yBaW8r/jf/ADKNd38Q1LaR4OlAJjOjxqG7Eg8j9a4Suj0r
x54m0XT1sLDVGS1QkrFJFHKFz6b1OPwpvVW/rr/mJaP+vI5yilZi7lmOSxyaSgD2DTSf+Er+Gv8A
2Dx/7PWLayRxeANZlmG6NPEMTMPUDOa5GPxTrMN3pl0l5ibTI/KtG8pP3a88Yxg9T1zVc63qB0y4
003H+iXM4uJY9i/NIOhzjI69AcU763Xdv/yZP9A6WfZfk1+p6d8RfEUul+KZJG8LaBfWl0iSW17c
2ju0ylR/EHAOOn0xXIax4j8Q6j4m0m+bS47HULSKMWcFtbOuUUkrhGJJHX8Kp6T498UaHZCz0/WJ
orZfuxsqyBf93cDj8Kz7jxFrF3rKaxPqE76ghBS4LfMuOmPT6VKVmrDbumd/oz6F8RdauLDUfDR0
/VZY3kfULKVgquASS8Z4AJ7+prjvC+taj4dvry5srNL62aEw3kMkReN4if4sdPrU9/8AEbxdqVi9
lda1M0Ei7XCIiFh6FlUE/nWToviDVfDt01zpN7Jayuu1imCGHoQQQaa3B7HX3um+HvEPgbUvEOm6
NLo11p8sasonaSGfccELu5BHXA6fjTwLLwn4D0TVbfQrDU7zVDIZbm/h86OLa2AirnAP+B/DmNc8
ZeIPEkSQ6tqctxCh3LGFVEz67VABNO0Txr4i8O2r2ulapJBbudxjKK6g+oDA4P0o7h2O68XyzDwH
4Ru9R061sGa9eVra2gEKKmcj5OxI5/Gsb4l6dfXXxPk8iKSX7eYXtGQZEilVA2/iK5XUvE2s6xZR
2mo30lzDHK0yiQAne3U7sZP0JxXd6NPrSaFa2sfxF0m20lol82GScC4hUj5kUFd2RyAAcU18XN5/
ov8AIV9LeX6/8E6Ka4itP2hEFwyB5LRYo2fp5hiwPz6fjXHN4t1PSvEH2WPwP4fi1SCb5Fj0+TzA
4PBGHz9CKwfHGvw6/wCMrvU7EutuCiQMeGKooAb2zjNWF+JvjJLQWw16fYBtDFEL4/39u79amOyf
9b3G9NPT8rGBrF3cX+tXt3dxLDczTvJLGqkBXJJIAOSOapU6SR5pXlkdnkclmZjkknqTTaErKwN3
dzt/hL/yUWw/65zf+i2rjxGJb4RswUPJtLHtk9an0jV77QtRj1DTZ/IuowQsmxWxkYPDAjoapElm
JPU8mn9pP+txdGj1LxBOnhnxSnhfQ/CGk3O0RrHNe2f2iW4LAHdknpknp6Gsv4xKU8eMrBQwtIQQ
gwM7e3tWMvxC8WJpQ0xdbuBahPLAwu8L6b8bv1qlJ4r1qXXYdakvA+oQoEjlaGMgKBtA27dp4PcU
mr29Rp2+7/I6HVP+SM6F/wBhKf8Aka5PRXWPXtOdyAq3MZJPYbhXRn4p+MigQ6rHsByF+xQYH/jl
cnc3Mt5dy3U7BppnMjsFAyxOScDgfhVJ2nzf10E1ePL/AF1Oo+JsUkXxF1nzEK75g65HUFRgiusu
tYa0+Fvhq8tNC0vVbW3EsFyby3aX7PJuz2Ybc9efauIuvHfia+0RtHutUeaxZAhSSJGYgEEDeV3d
h3qpofijW/DcjvpGoy2vmffVcMrfVWBB/KpStHlG3eXMb974uv8AUNGsbabQNO0/Rkv0n32dq8as
4HIyWIPH8qtfErTb66+KEot4pJTfmF7RkBIkUqoBX8RXMa54r13xIIxq+oy3KxnKIQFVT6hVAGat
WvjzxRZaQNKt9ZuI7MLsVMKSq+gYjcB9DTW6fb/gf5C8jY+MAK/EO6VjlhBCCf8AgArmrjw3qlr4
dtdemgVdOupDHFJ5iklhn+HOR901X1fWL/XdQa+1Kfz7llVS+xVyAMDhQB0rb8R+KYdT8OaFoVgk
0dnp8GZRIAPMnP3m4J45OPqalK0fO4938jlqKKKoR3ngSR4vCHjZkYqf7PQZHoWIP6GuKspI4b+3
llGY0lVnHqARmp7HWb/TbO+tLSfy4L6MR3CbFO9QcgZIyPwxVGmnaSl6fqFrxa/roevfEXxFLpfi
mSRvC2gX1pdIklte3No7tMpUfxBwDjp9MVyGseI/EOo+JtJvm0uOx1C0ijFnBbWzrlFJK4RiSR1/
Cqek+PfFGh2Qs9P1iaK2X7sbKsgX/d3A4/Cs+48Raxd6ymsT6hO+oIQUuC3zLjpj0+lSlZqw27pn
f6M+hfEXWriw1Hw0dP1WWN5H1CylYKrgEkvGeACe/qapfDyzuLvw542tLQGSdrBQgTktgtwPqBWF
f/EbxdqVi9lda1M0Ei7XCIiFh6FlUE/nV/wPq0WleG/FbC/jtbx7WP7NmUI7OHz8nOSR7UW0fowv
qvVFn4fxSWvh7xjf3CMlmNMe3LMMAyscKv1/xo8SRvefCbwndWql7e0e4huNoyEkLZGfTIH61zut
eNPEXiK1S11XVJbiBDkR7VRSfUhQMn61FoXizXfDRk/sjUZbZZOXQBXVj67WBGffFN67+X4X/wAw
Wm3n+P8Awx1GsxvY/BrQra7UpcXGoSXEKOMN5WCM49CSD+NQ/FdifF9sCTgafbge3y1ymsa5qev3
v2zVb2W6nxtDOeFHoAOAPpSatrN/rl4t3qNx506xrEG2KvyqMAYUAUdb+d/wsC008v1udv8AEK4v
rT4n21zpqu17FBbSQhE3EsEB6d6uaM+hfEXWriw1Hw0dP1WWN5H1CylYKrgEkvGeACe/qa4K78Sa
ve6zFrE9651CIKEnRVQrtGFxtAHStO/+I3i7UrF7K61qZoJF2uERELD0LKoJ/Ol0a9fxBdPl+B03
w+uGj8E+K7WzsLTUr6NopvslxGZFmjU8/KCCcdfyrLg8b6m9jqUOm+E9Et1ltnhupbSykVkjIwcn
fgfjXH6dqV7pF6l5p91LbXKfdkjbB+n09q29U+IPirWbF7K+1iWS2kGHjVEjDj0O0DP405agtDmq
B1oooEejfFvT70+JtNmEMjxXFhCkBVSdzAYKj3yenvXWJcQ2nxf8L2dy6i6g0hLaUk/dmMbYB9+R
+decQ/ErxhBI7xa1KpdFQjyo9uFGBgbcA47jmucmvru4vmvprmV7tn8wzM53lvXPrR18rt/ff/MO
nnZL8v8AI7HwLpOpRfFWzt5IJUmtLlnuCwI2KudxJ9D+ua2LV01bwn8QodNHmSverdKicl4RITkD
uAOa5W7+Ini2+01tPuNbne3ZdjAKqsw9CwG4/iaxtJ1jUdCv1vdMu5LW4UYDoeo9CDwR7GlbTlf9
bf5Dvrzef+f+Z23hGzuo/hZ4zu3R1tpUhSNiOGZW5x9MioPA6N4i8N654R4aeVBe2IJ/5ap94D6r
x+dYuoePPE+qwXcF7qsk0N2ixzI0aBSoOQAAPl59MZra8Aw6foEsfi7UNZsFFtHIYbCOfNzJJgqA
U7Kc5zT3bb2t+Qtkkt7kHxJuY4NVsfDtqwNtotqttx0aUjMjfn/KsHStO1670nUrjTFuTYQJm9MU
u1QuD94ZGeAfWs68u5b69nu523TTyNI7epJyau6d4i1XSdNvtPsrryrW/XZcx+WrbxgjGSCR1PTF
JXs77/qN2urbfoZdFFFMR6B4UR734X+LrG1Uvdq0E7IvLNGrc8e2DUnhGzuo/hZ4zu3R1tpUhSNi
OGZW5x9MiuJ0nWNR0K/W90y7ktbhRgOh6j0IPBHsa1dQ8eeJ9Vgu4L3VZJobtFjmRo0ClQcgAAfL
z6YzRLVO3VDjpa/R3O2utYa0+Fvhq8tNC0vVbW3EsFyby3aX7PJuz2Ybc9efauU1zxVqereForI6
Bp2naV9qEqyWdq8atLtIxksQeP5CsjQ/FGt+G5HfSNRltfM++q4ZW+qsCD+VO1zxXrviQRjV9Rlu
VjOUQgKqn1CqAM0S1bfcI6JLsejaPpKeNLLwdq8uGXTXa01Fj2SIeYhP1UY/GvNfEurvr3iTUNUc
n/SJmZQey9FH4ACnaZ4o1nRtNvdO0++aC0vV23EYRTvGMdSCRwe2Kp6bqV3pGoRX9jII7mIko5RX
AyMdGBB4PpQ9ZX6fq9xLSNuv+Wx1+qf8kZ0L/sJT/wAjUvwzU3Vr4p0y3P8Ap95pbrbLnlyOqj3O
RVE/FPxkUCHVY9gOQv2KDA/8crmRqd6uqHU0uXjvTIZfOi+QhyckjGMfhRu35/5WHsl5f53IxZXR
eZBbTb4ATKuw5jA6lvT8a9SutYa0+Fvhq8tNC0vVbW3EsFyby3aX7PJuz2Ybc9efauL1P4geKtY0
57C+1iWW2cYdAiLvHoSoBP41R0PxRrfhuR30jUZbXzPvquGVvqrAg/lR0sLrc19c8Vanq3haKyOg
adp2lfahKslnavGrS7SMZLEHj+Qrka2dc8V674kEY1fUZblYzlEICqp9QqgDNY1IbCiiimI9C8DB
9R8B+L9ItctemOG6iRfvMEbJwO54H51oeH9Y1W+8L+L/ABHrtxJKXsF0+GWRQu9iSAowAOMjP1rz
jTdTvtHvo73TrmS2uY/uyRnBHt7j2rR13xh4g8TJHHq+pSXMcZyse1UUH12qACfeiWt/Nf8AA/Ic
dPvv/XzKGlaTfa3qCWGm27XF1ICVjUgE4GT19qjCy6bqYSdCkttNh0PZlPI/SptH1nUNA1KPUdMu
PIu4wQsmxWxkYPDAjoaq3NzLeXc11O++aZzJI2AMsTknA46007NNCtdNM9P+Id5rsXi26TRppjYe
JLeAqsSBhcDYFwDjr9OxrH+LU0f/AAlltYo4ZrCwhtpCD/EASR+orG0vx74o0XTv7P0/WJobUZCx
lVbb/ulgSv4Yrn5ppbid5ppGklkYs7ucliepJqbdFt/VvuuO/f8Ar+rF640LU7TRrbV57RksLlis
MxIw5GeMZz2Ndj4GD6j4D8X6Ra5a9McN1Ei/eYI2TgdzwPzrkbrxFqt5oVpotxdb9OtGLwQ+Wo2E
553AZPU9TVbTdTvtHvo73TrmS2uY/uyRnBHt7j2p910/r9Rdn1PR/D+sarfeF/F/iPXbiSUvYLp8
Msihd7EkBRgAcZGfrXnWlaTfa3qCWGm27XF1ICVjUgE4GT19qv674w8QeJkjj1fUpLmOM5WPaqKD
67VABPvVLR9Z1DQNSj1HTLjyLuMELJsVsZGDwwI6Ghb3f9f0we1kQhZdN1MJOhSW2mw6HsynkfpX
pfxDvNdi8W3SaNNMbDxJbwFViQMLgbAuAcdfp2NeYXNzLeXc11O++aZzJI2AMsTknA461vaX498U
aLp39n6frE0NqMhYyqtt/wB0sCV/DFG6V/67j2baNn4tTR/8JZbWKOGawsIbaQg/xAEkfqK5u807
XofDlle3a3P9jyuRbF5cx7uc4XPHQ9qypppbid5ppGklkYs7ucliepJrRuvEWq3mhWmi3F1v060Y
vBD5ajYTnncBk9T1NLW3n/Vw0v5HbfDu9uh4I8Y2Oms41E26TRLH98qMh9vfIB/WofAnn/8ACFeM
/tm/+zPsXHmZ2+fn5cZ/izj9K4bTdUvtHvo73TrqS2uY/uyRnB+nuPatTXPGviPxHbrb6tqktxAp
yIwqopPqQoAP405a3fdWCOlvJ3M1odTS1ty8d2tu/wA0GVbYeeq9uvpXeeOPtX/Ct/CY1nf/AGvm
XHnf63yc/Luzz/d61zmkfEHxVoVgljp2ryQ2seQkZiRwuTnjcpxWPqWs6jrGofb9RvJbm64/eSHO
MdAB0A9hQ9dOlxLTU7PTbOL4f6ZFreowCXxDcpu0+zcZFsp/5bSD19B/kV/hnqrJ8TrO61CZmku2
kR5JDyzupwT9Tj86jHxb8cAYGt/+SkH/AMRXOaxr+p6/qf8AaWpXRmvMKvmhFQ4HThQBRfW72/QG
vdt/VzvvCC+IW8e6f4evpZhp+iXUlwY3UBYQNx3E4zg54ye/FcBr94moeItSvIzmOe6kkU+xYkVq
XvxB8V6hpZ0261q4ktWXYy4UMw9CwG4/ia5qlZ6f1/WxTe/n/X6hRRRTJDvXd/FdifF9sCTgafbg
e3y1wlX9W1m/1y8W71G486dY1iDbFX5VGAMKAKO3r/mC3+X+R6+Z4oPj7YGZgpkskRGP98wkD/Cu
K8C6TqUXxVs7eSCVJrS5Z7gsCNirncSfQ/rmuW1PXNS1jUl1G+umku1VVWVVCEBRhcbQOnrWvd/E
Txbfaa2n3GtzvbsuxgFVWYehYDcfxNCdnzLfX87ha65X5flYW3uYJ/ilFcwsPs76wHRu20zZBpnx
BjeP4ga4rqVJu3YAjseQfyrm1YqwZSQQcgjtXRX/AI98TappT6Zfambi1dQrLJDGWIByPn27u3rS
taKS6f8AA/yKbu231/4P+ZzlFFFMk7rwz/yS3xn/AL1p/wCjKi+E88UHxF07zWC71kjQnsxQgf4V
zFtrN/Z6Xe6Zbz7LO92faI9inftOV5IyMH0IqnHI8UiyRuyOpDKynBBHcGn9pvv/AJWFb3bHb+Bd
J1KL4q2dvJBKk1pcs9wWBGxVzuJPof1zWroLpqX/AAsdLEeYbiCSWFEGSyiQnIH0IrmLv4ieLb7T
W0+41ud7dl2MAqqzD0LAbj+JrG0jWdR0HUEvtLu3trlQQHTHIPYg8EexqbaWfZr7ym9b+af3HaeD
rK4T4ceNLx4mWB7eKNHIwGYNk4+mR+dQasx/4U14eXPB1CckfnWNf+O/E2px3cd7qsk0d3GIpkaN
MFQcgAY+Xn0xWXNrN/Po1vpEk+6xtpGlii2KNrN1OcZP4mh63+X4O4LT8fxVjtL6RIvhj4NllGY0
1Cct9A+TTfiVpt9dfFCUW8UkpvzC9oyAkSKVUAr+IrjZ9Zv7nR7XSZp91jauzwxbFG1m6nIGT+Jr
VtfHniiy0gaVb6zcR2YXYqYUlV9AxG4D6Gqv73N5/ov8hLa39bt/qbHxgBX4h3SscsIIQT/wAVwl
XtX1i/13UGvtSn8+5ZVUvsVcgDA4UAdKo1MVZDbCiiimIKQ0tIaAPR/g5/yG9R/69h/6EK9S8N/P
q+qD0kP/AKEa8t+Dn/Ib1H/r2H/oQr1Pwn82tauPSU/+hNXDiv49L1f5Hdhv4NX0X5nTeXR5dWtl
Gyu04zFvHkj1fTYlchJTJvX1wmRWh5dVNQT/AInukf703/oFauygCr5dHl1a2UbKAKvl0eXVrZRs
oAq+XR5dWtlGygCr5dHl1a2UbKAKvl0eXVrZSbKAK3l0eXVnZRsoAreXR5dWdlGygCt5dHl1Z2Ub
KAK3l0eXVnZRsoAreXR5dWdlGygCt5dHl1Z2UbKAK3l0eXVnZRsoAreXR5dWdlGygCt5dHl1Z2Ub
KAK3l0eXVnZRsoAreXR5dWdlGygCt5dHl1Z2UbKAK3l0eXVnZRsoAreXR5dWdlGygCt5dHl1Z2Ub
KAK3l0eXVnZRsoAreXR5dWdlGygCt5dHl1Z2UbKAK3l0eXVnZRsoAreXR5dWdlGygCt5dHl1Z2Ub
KAK3l0eXVnZRsoAwfEi7dDuD6Afzq/4bY/8ACP2n+5VXxUu3w7dH2H8xUvhtv+Kfs/8ArmK4v+Yz
/t39TsX+5v8AxfobOTRk1Fvpd9dpxkmTUZuIxKIjIvmEZ255xSb65LVtPmtbxrxZXLs25Zc/d9vp
QB2WTRk1iaPra3yeTNhLlOq+vuK1t9AEu41BbHmb/roafuqvbt803/XQ0Acd8S/+RU1r/riv81r5
uFfR/wASTnwnrJ/6Yj+a184CmJi0UUUCCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAK
KKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigD6S+EIB+HdlkA/PL/6Mau6Krj7o/KuG+EH/
ACTuy/35f/RjV3TfdNIo+Mq1Z9LtIvDdrqaapFJdzTNG9iAN8Sjo5Oc4P0FZ9rP9lu4bgRRSmJw/
lyruRsHOGHceorvPFE1rqnw10fWBpOmWV3LfSxO1jarCGVQcA45pva/9bolb2/rY8+orvfh5a6TL
o/im61awivIrWzSVVZRuB3HhWxlc8DI5qyJ9M8X+BdduDoGm6bfaSIpYZbCIx70ZsFW5O447mh6f
mNa/kcRotjb6nrFrZXd9HYQTPte5kAKxjHU5I/nVa7iS3vJ4Y5lmjjkZVlXo4BwCPr1rsvhrqMLe
IrDRLrR9JvLe7uPnku7NZZVG3orHoOOnua5fVglt4ivhHFGEiu5Nse35cBzgY9Pah7r+uwls/wCu
45NCvX8Oya6FT7FHcC2Y7vm3kZ6emKza9cg8XO3wputR/sHQAV1RYvs4sF8k/IDuKdN3vXmGq6id
V1CS8NpaWhcAeTaQiKMYGOFHSk92v62Q+l/63KVFdLqT+Fz4K0tbCJx4gEh+2OTJgp82Op2/3egr
mqfVoXS4UUV6V4P0tF8CXGr6X4ftNe1kXnlSQXMfnCCLbkMI88knv/hR0bDrY81rSTQr1/DsmuhU
+xR3AtmO75t5GenpirviPUWuNSgabw7aaRdQD99BFA0aSHOQTG3T09672Dxc7fCm61H+wdABXVFi
+ziwXyT8gO4p03e9H2b/ANbof2rf1seR0Vtx6j/avimC8bRLWYvIo/s6ziMUchAwFCr0z3xXqel+
HNT1m9TTtd8BaHp+nTqR59oY4riA4O1v9YWPOOMUa2uLS54jRXW+BtNt5PiVp+nXkMVzALl43jlQ
Mr4DdQeD0rT1TxToWk6hfaTY+E9KubOOSSJri5jzO7ZILK38Az0AHAxSvomuo7atPocjo2hXuvTX
MViqFra3e5k3tt+ReuPfms2vU/hh4iYjUbH+ydJAtdJnkE4tB5suMcSN/EDnkfSuF1zxC2uLCG0r
SbHyiTmwtBCXzj72OvSm9HZf1qwWqv8A10I9K0u0v7DU7i51SKzktIfMhhcAm5bP3F5HP51lV6N4
cvbbWvBXiO3udE0dX07TlaG5islWYtnG4v1J461z/wAPLW3vfH2kW13BFPBJMQ8UqBlYbT1B4NO1
5cv9dRN2jf8AroczRXrGi33h7V/Gc/hH/hF9NTTp5JoY7oRn7SrAMd+/PAyOgAA4rC8J6Rp2n6Z4
h8RarZx36aSywQW0v+rklZsAsO4HHHvUp6X6WuNrW3U4SivULO80fxJ4B8U6g3h7TLLU7WOIBrWA
KgUtwVU52N1BIPPFeX0dbB0uFFFeuXli+g6Do8vh/wAGadrdlcWaTXF9PaNdO0h+8ODlAKfS4utj
yOiut8M6Lb+M/H8dn9lFhaSu0stvCT+7RRkqufUjHtmvQ7Tw5qF7qi6Ze/DbTrXQpH8vz49ouYl6
BzJvySOp4o1svMO/keH0V2vhXRLe2+LVvot3FFdQQ3skDpMgZXChhyDx2q3qninQtJ1C+0mx8J6V
c2cckkTXFzHmd2yQWVv4BnoAOBilfRNdR21afQ8/ortNRsrTUvhhpmr2trBFd6fcvZ3jRRhTIG+Z
HbHX0yaNfsrTRfh9oFobWD+09QZ76WYxjzFi6Iu7qARzj2pvS/8AX9aaiWtv6/rUwNK0u0v7DU7i
51SKzktIfMhhcAm5bP3F5HP51lV6N4cvbbWvBXiO3udE0dX07TlaG5islWYtnG4v1J461xvhzSG1
/wAR2GlB9n2qZUZh/Cvc/lmna8uVf1qwvaN3/Wxl0V6Fq/irQ9E1e40fTfCGjXGn2shgaW7iLzyl
Thm8zOVyQcUeAfC8OtrrOtrpB1BbIgWmm+ZhZHYnAZiRlVH50lqrrYbVtHuee0V7Fe+FL/WPDerv
rfg6w0O4srZrm1urBFjVivJR1DHOR3rx2lfWwW0uFaum6BdappWqajBJCsOmxrJMrkhmDHA24Bz+
OKyq2tI8QtpOiazpothINTiSMyF8eXtbOcY5p9GLqjFoq9o2P7ZtM6edR/eD/RAT++P93jn8q9g0
vw5qes3qadrvgLQ9P06dSPPtDHFcQHB2t/rCx5xxii2gXPEa3dH8Of2t4f1zVftflf2XHG/leXu8
3cxGM5GMY9DW/wCFdH07TdN8ReINUs479dJdYLe2l/1ckrNtyw7gcce9bem6zY638OPF9xFpFlpt
6kUKzLYoY4pE3/KdmTgjnPrxSb91tdrjS1Sfexwt54c+yeDtO8Qfa932yeSHyPLxs2992ec/QVhV
6nb6pY6P8HtFu7nTLbUbkX0y28V2C0Skk5ZlBG7gYA96y/EGnWHiDwnpXiXTdOt9Ouprw2F1b2w2
xF8ZVlXtx296bXvNLy/G36iWyv5/hf8AQ4EDJArb8W+Hf+EW199L+1fatsaSeZ5ezO5QcYyfX1rs
/EN/4f8ACOuJ4XTw3p15aW6xpeXc6E3MjMAWZHB+XGeKy/i8FHxCuQnKiCHH02Ck3omu40t79v8A
I5m60C6s/DthrckkJtr6SSONVJ3gocHIxj9TWVW1e+IWvPCumaEbYItjLLIJt+S+85xjHGKxafVi
6BRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUA
FFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAU
UUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABSGlpDQB6P8HP8AkN6j
/wBew/8AQhXqng35tb1r2mP/AKE1eV/Bz/kN6j/17D/0IV6n4K/5Duuf9dv/AGZq4sT/ABqXq/yO
7DfwavovzO0KnadoyccZrya7sLNLm5bxr8QZLXVnkZorew1IwpbJ/DhBzn3Ir1i5WR7WZYW2ysjB
G9Gxwa8S8E61p/hPSZ9K1zwrqNx4lFxIZCtj5rXTMxIIc8Yxgenfmuw4zf8Ahtr154g0/Tnvbz7b
LaX93aLdEczIsYKsfqGr1DbXkXwmiu7dXhv7F7G6/tu8ke3K4Cbok4XsRkEZHpXsFADNtG2n0UAM
20bafRQAzbRtp9FADNtG2n0UAM20bafRQAzbRtp9FADNtG2n0UAM20bafRQAzbRtp9FADNtG2n0U
AM20bafRQAzbRtp9FADNtG2n0UAM20bafRQAzbRtp9FADNtG2n0UAM20bafRQAzbRtp9FADNtG2n
0UAM20bafRQAzbRtp9FADNtG2n0UAM20bafRQAzbRtp9FADNtG2n0UAM20bafRQAzbRtp9FAGB4v
GPDN2fYfzFN8ON/xT1l/1zFP8Zf8ivef7o/mKg8On/inrL/rkP5Vx/8AMX/27+p2f8wf/b36Gxur
jL6810X86wzzLEHIUCHIxn6V12T60mfeuw4zi/tviH/n6n/78D/Cmvda46ETXEzR/wAQaAY/lXbZ
riNd1i61C+awgWSOJG2kDhpD/hQBXV5GmjaBmE6n5GXrmu+s3nNpEbkATbfmA9ax9E0ZbGMTTgNc
Ef8AfNbW6gCXdUFu3zTD/poaduqGA/PMc9XNAHJ/EfnwjrP/AFxH81r5xFfRvxF/5E/WP+uI/mK+
chTExaKKKBBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABR
RRQAUUUUAFFFFABRRRQB9J/CD/kndl/vy/8Aoxq7pvumuF+EH/JO7L/fl/8ARjV3TfdNIo+PdNsT
qeoRWYubW2MhI866lEca8Z+Zj06V6Ve+Hre4+HmmaEnifw19rtrySeQnU02bWHGD6/hXlVFN7WJW
9zuPC81rpmgeNbK4vrQSvaCKHEy4mYOf9X/e9eKi8JXtpbeDfGEE91DFNcWsSwxySBWkIc5Cg9fw
rjKKHr91hrT77/l/kd98OtHht9d0rX7rXdEtbaGYs8NxfLHMAMj7hrI8XaCLC7udRTWNHvY7m6cr
HZXiyyAMSQSo6CuYooeolod54aex1n4faj4bl1Wy06++3JdwteyeXHINu0jd2Nchq2mnSdRkszeW
d2UAPnWcwljbIzww61Sooe9wW1jpdS0TRrXwTpeq22qrNqlzIVuLMSoTEvzYO0fMOg6+tc1RRR1b
DoFdX4b0L7ZZrfWPi7TtJvw5Vorq5a2YDsQ4659K5SigDvfiLrFrfWOhaf8A2pFq+pWMLrd38XKu
SQVUN/FjHX/69J4aex1n4faj4bl1Wy06++3JdwteyeXHINu0jd2NcHRR0a7/AOdx328jtfCU1l4N
+Its2o31pPbxqyG7s5POjQuhAYEdcZ59Oa6Lwpo+jeHfHFtq+reL9IvMysYDb3O8szA/PKxwEABz
yeteUUU09UxNaNHZ+EL20tvitbXk91DFareysZ5JAqAHdg7jxiuX1V1k1i9dGDI1xIVZTkEbjyKq
UVKVkl2/4A27tvv/AMH/ADOw+HOp2Ona/dRajcrawX1jNaee/wB2NnAwT7cVk674dOhCE/2vpGoC
UkD7BdCbbjHLccZzWLRTeuoloeqeFtAt9K0LxDa3Pibw35mpWQhhC6mnDZz83pWF4WsoPDHxK0b7
Zq2lywK/mPc210rwoCGGC/AB/wARXEUU07SUgavFxO28H31pa/Fm3vbi6gitReTMZ5JAqAENg7jx
jkVa8Oappl3a+JvDWo38VnFqcvm213If3ayI5I3HsDxzXn9amhajYabeSSalpEWqW7xlDDJK0ZBy
DuDLyDx+tSloo+X9fkNvVv8Ar+tT0LTdHstD+HHjCBNWstRvHihMrWTmSKNd+FG/AyxOeB04rymu
p1bxdbT6HJouh6LFpFhNIJLgCdppJivQF2xwPTFctRvK4dLBXoug6LLpkltfaV8Q9Ks7Y7ZJVa7a
KQdCQYsYb0x3rzqiqTsJq56LL420u0+L8/iG1jZ9LkYxS7VwXUoFZwPc/NVSfwNo0t29xbeNtCXS
2YsjSSn7Qq+hixnI+tcLRUpWSXYbd2zrPAk9lpvxI06WS8iWyhuH/wBJmIjUrhgGOemeOvrXPaq6
yaxeujBka4kKspyCNx5FVKKO3kHfzO4+Hl3p841fw7q97DaWGp24xNM4VY5UO5Tk8Dv+lZ/xA1iH
WfGF09o6tY2wW1tShyvloMAg+hOT+NcvRTerTEtEz1TwtoFvpWheIbW58TeG/M1KyEMIXU04bOfm
9K5C1L+B/F+nXn2yw1D7O6zFrG4EqFckFdw74z+YrmqKd2pKSC2lmehax4V0PW9XuNY03xfo1vp9
1IZ2iu5Sk8RY5ZfLxlsEnFVPCep6QNO13wtqd99nstRKm3vih2pIjfKWHUA8fSuIoqUklboNu7v1
OtvvBthpmn3N1c+LdEndEJggsZTO8rdgeBt+tclRRTAKKKKBHUfDzWLLQvGlle6g/l24DoZcZ8os
pAb8Ca6/wpo+jeHfHFtq+reL9IvMysYDb3O8szA/PKxwEABzyeteUUU76pito0ehaBqml3kPinw1
qF/FZw6nN5treOf3SyI5I3EdAeOavWdno3hvwB4o09vEOmXuqXUcR2Ws4ZCobgKxxvbqSAOOK8vo
qbe7bysXfW/nc9MtYdG1z4VaTo8uu6fY6nHeSyxi5lAUDJyHxkoCDkEjHFUfEGo2Hh/wnpXhrTdR
t9Ruobw391cWx3RB8YVVb+LjvXA0U29bry/D/hiVtb1/H/hz0/xDYeH/ABdraeKV8S6dZ2k6xve2
k7kXMbKAGVEx82cdaxPinfWWo+Ori4sLmG4t2hiCyQyB14QcZHHFcXRStsl0HcKfEqvMiu21SwBP
oKZRTW4mdF400bR9D1tbTRNUXUbUwq5mWVJAGJORleOw/OoPCWl6ZrPiK3stX1BbCydWL3DSKgUh
SRy3HJ4rEooWm4PUs6jBBa6pd29tKJoIpnSOQEHeoJAORwcitzQNE0bUfD2t3uoaqtpe2cYa0tzK
imdsE4APJ5A6etc1RSW1h9bhRRRTEFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUU
AFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQA
UUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFIaWkNA
Ho/wc/5Deo/9ew/9CFep+Cv+Q7rn/Xb/ANmavLPg5/yG9R/69h/6EK9O8IzpD4i1aN22tLKxUHvh
j/jXFiXatSv3f5Hdhv4NX0X5ne5pOM571Hu9xRursOMo30bvrelOqMURpdzAcLlOM+laeai3UbqA
Jc0ZqLdRuoAlzRmot1G6gCXNGai3UbqAJc0ZqLdRuoAlzRmot1G6gCXNGai3UbqAJc0ZqLdRuoAl
zRmot1G6gCXNGai3UbqAJc0ZqLdRuoAlzRmot1G6gCXNGai3UbqAJc0ZqLdRuoAlzRmot1G6gCXN
Gai3UbqAJc0ZqLdRuoAlzRmot1G6gCXNGai3UbqAJc0ZqLdRuoAlzRmot1G6gCXNGai3UbqAJc0Z
qLdRuoAlzRmot1G6gCXNGai3UbqAJc0ZqLdRuoAlzRmot1G6gCXNGai3UbqAMbxl/wAivef7o/mK
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
6GTxImkWjZstHgSyix0JUfOfruz+VVLR27/0/wAfwYo6r0/pfh+RxtFFFAgooooAKKKKACiiigAo
oooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACii
igAooooAKQ0tIaAPR/g5/wAhvUf+vYf+hCvo60/48oP+ua/yr5x+Dn/Ib1H/AK9h/wChCvo60/48
oP8Armv8qRRNRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAB
RRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFF
FFABRRRQAUUUUAFFFFABRRRQAUUU13WNGd2CqoySegFADqK4nXvE2pxXUUmmLEbIYbzD8wm9RnsK
6PRNattbshPAcOvEkZ6ofQ0AadFFFAHnHxR/5FnW/wDriv8A7LXzWK+lPij/AMizrf8A1xX/ANlr
5rFMTFooooEFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAF
FFFABRRRQAUUUUAFFFFAH0n8IP8Akndl/vy/+jGrum+6a4X4Qf8AJO7L/fl/9GNXdN900ij5U8Ca
nZ6N410zUL+bybWCQtJJtLbRtI6AE96p6jruoTyXdrFqd2dOkmdlg85xGQWJHyZx+lZNFN6krQmt
bq4srlLm0uJbeeM5SWJyjKfYjkVG7tI7O7FnYkszHJJ9TTaKALVjqd/pkpl0+9ubSQjBe3laMkfU
EU2W+vJ7z7ZNdTyXW4N5zyEvkdDuPOar0UATXV3c31y9zeXEtxO/LyzOXZvqTyau2051nUbSDWtZ
nhtUXyxcTB5/IQDgBQc47YHrWZRQgOv8Ya5pk2l6T4e0KaSfTdOVma4dCnnyscs208gemfU1h2mg
3l7bLcRTacqNnAm1K3ibg45V3DD8RWZRQM2v+EW1D/n40j/wcWn/AMdqpaarqmkNLFY6ldWu44kF
tcMobHupwaoUUCLM2oXtxbJbT3lxLAjl1ieVmVWPUgE4BPc1JFrGpwWLWMWo3kdm33rdJ2EZ+q5x
VKlAyQKEr6AXG1fU21BdQbUbs3qY23JnbzFwMDDZz04pW1vVns2s31O9a1cktAbhyhJOSSucV2Nz
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
UAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQ
AUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFIaWkN
AHo/wc/5Deo/9ew/9CFfR1p/x5Qf9c1/lXzj8HP+Q3qP/XsP/QhX0daf8eUH/XNf5UiiaiiigAoo
ooAKKKKACiiigAooooA4q7+Fvhy61O5vB9ut0u38y5tbe7eOGdu5ZAcHNSP8MfDT+FZvDYhuF0yW
5+0mNZSCr5zwew9q7GigDmNc8BaH4g8NWWgX6Tmxs9nlBJdrDau0ZPfineJvAmieLdKstO1RJ2t7
Ng0Qjl2kELt5PfiulooA5Hxb8NvDnjS5hutUtpBdxLsWeCQo5XrgnuOT+dVtI+FHhbQtU/tHTbe4
gnNu1uwWclWVl2nIPc9c+tdvRQB5gPgJ4HBOIb8Z9Lo/4V0qfDvw2PB6eFpbNp9MRmdFmcs6sSTu
DdQck11VFAHC+HfhH4S8M6qmpWlpNNdRHMT3Mpfyz6gdM1sQ+CtHt/Gc3itEm/tSaPynYyfJtwB9
36AV0VFAHO2ngrR7LxleeKoUmGqXcflSsZMptwo4Xt9wV0VFFABRRRQAUUUUAFFFFABRRRQAUUUU
AFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQA
VieKtROnaHKyIzyykRoidTnrj8M1t0140cqXRW2nIyM4oA42/wBPi1+0t0sdOnhKqoEsq7AB6H1r
otH0eDSLQRRgFz99+5NaVFABRRRQAUUUUAecfFH/AJFnW/8Ariv/ALLXzWK+lPij/wAizrf/AFxX
/wBlr5rFMTFooooEFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAU
UUUAFFFFABRRRQAUUUUAFFFFAH0n8IP+Sd2X+/L/AOjGrum+6a4X4Qf8k7sv9+X/ANGNXdN900ij
5D0LWbjw9rdrqtokTz2zFkWUEqTgjkAg9/WqdzO11dTXDgB5XLsF6ZJzxVzQtGuPEOt2ulWjxJPc
sVRpSQoOCeSAT29K6RvhfrgSZEudLkv4VLtpyXYNztHfZj05xnPtTfdkrsjiqK0dD0W51/XLbSbV
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
D+o+I782enQh3VS8juwVI0HVmY8AULUNjLorqNW8CajpmlyalDe6ZqdpCQs8mnXQm8knpuGARVPw
/wCFNS8TQX0mmiJ3s0RmiYkNJuOAFwCM59SKFqBh0V1Gs+Bb7RNKe/l1LSLgRMqzQWt2JJYiTj5g
B6+9ZeneHdV1bTb7ULK1821sF33MnmKuwYJzgkE9D0zQOxl0UUUCCitjw/oaa5cvG+q6bp4j2nN9
MY9+T0XCnJr0/wCIkmp6bFqGlaf4j0Sz0aG3SMaQrKJ2G0ZGNmck8/e6UPRXGtXY8Yoro9G8G3Ws
acL9tU0jTrZnKI+oXgi3kdcDBNVtf8M6j4Znt/tZhkinXzLe5tpBJFKB3VhRtuLfYxaK9Nm8Rat4
i+D+sTateNdSRahCiMyqNq4zjgCvOLW1nvbuG1to2lnmcJGi9WYnAFGt7f1tcOlyGiuyufhvqNqs
qPrOgm8iUs9it+PPXAyRtxjPtmsHQvD+o+I782enQh3VS8juwVI0HVmY8AULUNjLorqNW8Cajpml
yalDe6ZqdpCQs8mnXQm8knpuGARXL0DCiiigQUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFF
FFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUU
UAFFFFABSGlpDQB6P8HP+Q3qP/XsP/QhX0daf8eUH/XNf5V84/Bz/kN6j/17D/0IV9HWn/HlB/1z
X+VIomooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAK
KKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoo
ooAKKKKACiiigAooooAKKKKACiiigAooooA84+KP/Is63/1xX/2WvmsV9KfFH/kWdb/64r/7LXzW
KYmLRRRQIKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKK
KACiiigAooooAKKKKAPpP4Qf8k7sv9+X/wBGNXdN901wvwg/5J3Zf78v/oxq7pvumkUfL/wx/wCS
j6L/ANdm/wDQGq94f+3f8Lph3b/tX9qP5vrjcd34YzVH4Y/8lH0X/rs3/oDVoaj8Sdatr6/jhttN
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
0TTkukKTvY2Ijd1PUEkn9K5OjqHQKKKKYgooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKA
CiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAK
KKKACkNLSGgD0f4Of8hvUf8Ar2H/AKEK+i7QyfY4MKuPLX+L2+lfOnwc/wCQ3qP/AF7D/wBCFfR1
p/x5Qf8AXNf5Uih+Zf7if99H/CjMv9xP++j/AIU+igBmZf7if99H/CjMv9xP++j/AIU+igBmZf7i
f99H/CjMv9xP++j/AIU+igBmZf7if99H/CjMv9xP++j/AIU+igBmZf7if99H/CjMv9xP++j/AIU+
igBmZf7if99H/CjMv9xP++j/AIU+igBmZf7if99H/CjMv9xP++j/AIU+igBmZf7if99H/CjMv9xP
++j/AIU+igBmZf7if99H/CjMv9xP++j/AIU+igBmZf7if99H/CjMv9xP++j/AIU+igBmZf7if99H
/CjMv9xP++j/AIU+igBmZf7if99H/CjMv9xP++j/AIU+igBmZf7if99H/CjMv9xP++j/AIU+igBm
Zf7if99H/CjMv9xP++j/AIU+igBmZf7if99H/CjMv9xP++j/AIU+igBmZf7if99H/CjMv9xP++j/
AIU+igBmZf7if99H/CjMv9xP++j/AIU+igBmZf7if99H/CjMv9xP++j/AIU+igBmZf7if99H/CjM
v9xP++j/AIU+igBmZf7if99H/CjMv9xP++j/AIU+igBmZf7if99H/CjMv9xP++j/AIU+igBmZf7i
f99H/CjMv9xP++j/AIU+igBmZf7if99H/CjMv9xP++j/AIU+igBmZf7if99H/CjMv9xP++j/AIU+
igBmZf7if99H/CjMv9xP++j/AIU+igBmZf7if99H/CjMv9xP++j/AIU+igBmZf7if99H/CjMv9xP
++j/AIU+igBmZf7if99H/CjMv9xP++j/AIU+igBmZf7if99H/CjMv9xP++j/AIU+igBmZf7if99H
/CjMv9xP++j/AIU+igBmZf7if99H/CjMv9xP++j/AIU+igBmZf7if99H/CjMv9xP++j/AIU+igBm
Zf7if99H/CjMv9xP++j/AIU+igBmZf7if99H/CjMv9xP++j/AIU+igDzf4oZ/wCEY1vcAD5K9Dn+
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
ksbMQeaQ2Tkj7wHH50m3y36pXKSXN5N2KHw10jw9Ml/NLrPm3b6XP51q9gSLccZcOThiOOAB1riN
c0/RLFYP7H119ULk+YGsmg2dMdWOc8/lXR/C0F9X1qJQWkk0e5VFHVjgcCuLs3SG/t5JhmNJVZx7
A81VrzS8l+bJTtFvz/RHrPw58OXHh7VH+2zw/a7qz81rVTl4F3Lt3+hOTx7V7paf8eUH/XNf5V5n
FNLN8RL5zY2sdrJZrLb3kMZDXKNs+82SG24wMYxn3r0i1Ev2ODDpjy1/gPp9am9yrWLVFR4m/vp/
3wf8aMTf30/74P8AjQBJRUeJv76f98H/ABoxN/fT/vg/40ASUVHib++n/fB/xoxN/fT/AL4P+NAE
lFR4m/vp/wB8H/GjE399P++D/jQBJRUeJv76f98H/GjE399P++D/AI0ASUVHib++n/fB/wAaMTf3
0/74P+NAElFR4m/vp/3wf8aMTf30/wC+D/jQBJRUeJv76f8AfB/xoxN/fT/vg/40ASUVHib++n/f
B/xoxN/fT/vg/wCNAElFR4m/vp/3wf8AGjE399P++D/jQBJRUeJv76f98H/GjE399P8Avg/40ASU
VHib++n/AHwf8aMTf30/74P+NAElFR4m/vp/3wf8aMTf30/74P8AjQBJRUeJv76f98H/ABoxN/fT
/vg/40ASUVHib++n/fB/xoxN/fT/AL4P+NAElFR4m/vp/wB8H/GjE399P++D/jQBJRUeJv76f98H
/GjE399P++D/AI0ASUVHib++n/fB/wAaMTf30/74P+NAElFR4m/vp/3wf8aMTf30/wC+D/jQBJRU
eJv76f8AfB/xoxN/fT/vg/40ASUVHib++n/fB/xoxN/fT/vg/wCNAElFR4m/vp/3wf8AGjE399P+
+D/jQBJRUeJv76f98H/GjE399P8Avg/40ASUVHib++n/AHwf8aMTf30/74P+NAElFR4m/vp/3wf8
aMTf30/74P8AjQBJRUeJv76f98H/ABoxN/fT/vg/40ASUVHib++n/fB/xoxN/fT/AL4P+NAElFR4
m/vp/wB8H/GjE399P++D/jQBJRUeJv76f98H/GjE399P++D/AI0ASUVHib++n/fB/wAaMTf30/74
P+NAElFR4m/vp/3wf8aMTf30/wC+D/jQBJRUeJv76f8AfB/xoxN/fT/vg/40ASUVHib++n/fB/xo
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
0aXSUnxYyzCd4ti8uBgHOM9O2cVSooEbR8W642qSakb7/TJLb7K8nlJzFt27cYx0HXGav6b8R/Fm
kaXDpthqxhtIVKxoLeI7RnPUrnv61y1FAFrUdSvdWvHvNQupbm4f70krbj9Pp7Vs6T498UaHZCz0
/WJorZfuxsqyBf8Ad3A4/Cucoo20Auapq1/rV817qV3Lc3LAAySHJwOgHoPat21+I/i+zsVsodcu
BCq7V3KjMB6BiCw/OuWoo6WDrcvafrOpaVqQ1GxvZoLzJJlVuTnrn1z71f1zxl4h8SQpDq2py3EK
HcI9qoufUhQAT7msKijyA29C8Xa94aSVNI1KS2jlOXTarqT64YEZ96i1bxPrOuWsNtqd+91HDI8i
eYq5DMcsd2Mn8Tx2rJooeu4LQ6PSfHvijQ7IWen6xNFbL92NlWQL/u7gcfhWTqmrX+tXzXupXctz
csADJIcnA6Aeg9qpUUeYeRe1bWb/AFy8F3qM/nziNYw2xV+VRgDCgCqNFFABWlo2v6r4euzdaTfS
2spGGKHhh6EHg/iKzaKANnXfFmu+JfKGr6jJcrESUQqqKp9cKAM1Um1m/uNGttJln3WNtI0kUWxR
tZupzjJ/E1RoosO4qsyOroxVlOQQcEGurX4m+MktBbDXp9gG0MUQvj/f27v1rk6KPIRqaT4k1jQt
Qkv9N1CaC5kz5j5Db8nJ3A5B59avXvjvxNqKXaXmqyTJdxCGZGjTaUBzgDGF5/u4rnaKBlvTdTvd
Hv4r7T7mS3uYjlJEPI/xHtV7XvFeteJRCNXu1uPJJKYgjjwTjP3VGeg61jUho3Fseo/CTUby6v7i
0uLmWW3tbY+RG7ZEe5lyB6DgcV9CWn/HlB/1zX+VfOPwc/5Deo/9ew/9CFfR1p/x5Qf9c1/lSY0T
UUUUDCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAo
oooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACii
igAooooAKKKKACiiigAooooAKKKKAPOPij/yLOt/9cV/9lr5rFfSnxR/5FnW/wDriv8A7LXzWKYm
LRRRQIKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC
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
aDf6rb6XqulOwtZrslYZom5Klv4SOPy/Iat7q6W+67/zQJ/afW/32X/BMbW/BF7onh+HWTqulX1l
LMIR9huDLhypOD8oHAHr3ru/iBonhrUNXsJtW8WDSrn+zoVFudPkmyuDhtynHPPHtXOeIn03Rfhz
a+GotZstSv8A+0DdubFjJEi7CuN+ACelbfjTw/Y+LNSstQs/FvhqCNLGKFkuNQVXDKDngA+tN+Xd
fl/noC037P8AMofDiz06w+K9tBpeqf2nai3lIufIaHJMZyNrc8Vi/DW7ltPiVpvlMQs0zQyL2ZWB
yD+h/CtfwRZWfhH4l2QvNe0eeA20jG6t7sNCpKsApY4APHT3FSaHpuheBtWPiHUvEml6lPbh2tbP
TJTMZHIIG5sAKBmmmlJN7W/V6Cs3GSW9/wBDhfEtrHY+KdWtYQBFDeSogHYByBWXU97dyX99cXkx
zLPI0r/Vjk/zqCoimopMqTvJtBRRRVEhRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFF
FFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUU
UAFFFFABRRRQAUUUUAFFFFABSGlpDQB6P8HP+Q3qP/XsP/QhX0daf8eUH/XNf5V84/Bz/kN6j/17
D/0IV9HWn/HlB/1zX+VIomooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKwtK8YaJrWu6hot
hdmW/wBPJFzEYnXYQ208kYPPoaAN2iiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKA
CiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAK
KKp6nqdtpNk91dOFRRwO7H0FAFtnVSAzAZ4GT1pa8z1S4k8R41O1upk8nGIAcNC3rjv9a6zwrrN1
qdm0d5Cyzw8GQD5ZPf60AdBRRRQB5x8Uf+RZ1v8A64r/AOy181ivpT4o/wDIs63/ANcV/wDZa+ax
TExaKKKBBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRR
QAUUUUAFFFFABRRRQB9J/CD/AJJ3Zf78v/oxq7pvumuF+EH/ACTuy/35f/RjV3TfdNIo+MqK6z4e
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
RUndthRRRVEhRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAB
RRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFF
FFABSGlpDQB6P8HP+Q3qP/XsP/QhX0daf8eUH/XNf5V84/Bz/kN6j/17D/0IV9HWn/HlB/1zX+VI
omooooAKKKKACiiigAooooAKKKKAImt4HlWVoY2kXo5UEj8a4/4oeE77xd4Km0jShbpcvPHJ+9ba
uAcnkA812tFAGR4e0gaXoOmW1xFCbu2tY4XkUA8qoBwcZxxXH+LfA2ra38TvDniG1a2+w6cB54kc
hz8xPAxz1r0eigCOKCGDPlRRx7jk7FAzTljRWLKihj1IHJp1FAEUlrbyyCSSCJ3HRmQEj8aloooA
KKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAo
oooAKKKKACiiigAooooAKKKKACiiigAooooAKxfE8GoXekm101R50rgFm6KvU5raooA599I1DVbd
ItWmt1jXGY4E6ke5rbt7eK1gWGFAqKMACpaKACiiigAooooA84+KP/Is63/1xX/2WvmsV9KfFH/k
Wdb/AOuK/wDstfNYpiYtFFFAgooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo
oAKKKKACiiigAooooAKKKKACiiigAooooA+k/hB/yTuy/wB+X/0Y1d033TXC/CD/AJJ3Zf78v/ox
q7pvumkUfG9ta3F7cpbWsEs88hwkUSFmY+gA5Na3/CHeKP8AoW9Y/wDAGX/4msq1urixuY7m0nkg
njOUliYqyn1BHSvTtb8S67F8J/Dd7HrN+l1NczrLOtw4dwGOATnJxTekbkrex5fHBNNOsEUTvMx2
rGqksT6Y9anvtK1HS3VNQsLq0ZxlRcQtGWHtkCu4+H5fTPDXijxLCA2oW0UdvauRko8rYLDPfpW1
HZ+ILrwt4n8P+Lmmmu7O0TUrR55RK8eM5w2TwcYxnjmiWn9f101Gtfy/r56Hltjpeoao7Jp9hdXb
qMstvC0hH1wDUNxbT2k7wXMMkMyHDRyKVZfqDXo2ralfeHfhd4XXQ7mazW+aaW6ntmKO8gbABYc8
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
+h6o0ardxGzadJWUY3IVPGQO/wD+vjtdj0aHUfL0O4ubi0VADLcIFZ37kAdB0xnmsyilbsO4V2/w
5uPC+n31zqGv36213Ao+wiS2eZA5z85VRzt4wCR1riKKpOwmrna+IdP8MXUd7qa+O5NT1N8yCN9M
ljMrem48CpdJ1jQdb8GQeG/EN9LpsljO0tnepAZlCt95GUc9f88c8LRUpaW6Db1udh4v1/S5tH0r
w3oLyy6bp252uJU2GeVurbew64z61x9FFHmAUUUUxBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRR
RQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFF
ABRRRQAUhpaQ0Aej/Bz/AJDeo/8AXsP/AEIV9HWn/HlB/wBc1/lXzj8HP+Q3qP8A17D/ANCFfR1p
/wAeUH/XNf5UiiaiiigAooooAKKKKACiiigAooooAKK851SfxZPqF5JeeLNO8LwxylbK1KQytMg6
PIXJxn0GMVkTfFq9t/g6fEzwW7ar9pNiu0HymkBPzgZ6YGcZoA7fxx41s/AmiR6pfW09xE8whCQY
3ZIJzyR6VFqHj/SNN1fRNMuI7oXGsIrwbY9yqG6bj/hXh/xKj8ej4eadd+KNTtb6zvZ0mEaQqkls
xQlVyoAIIJ9cEV3XiHxTquk+NPAOk2csS2l5bQ+crQI7HJAOGIJXj0IoA9hrk/Dfj6x8TeJta0K2
tLiKfSnKSySbdr4Yr8uDnt3rh7rxV418Y/EfVNA8Kala6XZaQSJppYBJ5rA4IOQepyMDHQ1jfCCf
VI/Hfjue5tUm1VVZngiYKryiRvlBJwAT60Ae+0V4JrXir4j6Tpd3r+oeI9H0+4t5f+QAFhkYpkD7
wJPf1zx2rb8W/FPVbbwH4a1PTI4LK51vCyXMy747b1OPrnrngUAewUV5h4WvvHtv4ltoLnUrHxRo
E65l1C3EMbW7c9lIJ/I9a9PoAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKK
KACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKytd1610O08yU7p
m4ihHVz/AIVH4g8Q22g2m9/3lw/EUIPLH/CvNJbi4v7x729kMk79PRB6CgDSuTH4nZ7p1ZNQRfng
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
zXM8k7EKFHYYB5PYVsfDfUYbXxSun3Z/0HVYmsZwemHGFP8A31j8619YsJvBHw8uNLnGzUdYvmWT
sfIhOB+Bbn6GiWiv/V9v+CNav+tv6ujE0v4f6rquhW+tR3WnW9hM7q01zP5aw7TjLkjAyemMms/x
F4V1HwzJb/azbzW9yu+3urWTzIpR32tXTar5/wDwpDQdm7yP7Rm8zHTPzbc/rUn7v/hT+h/b/uf2
2fK3f88sHfj2zmna7aXl+Nv8xLZP1/C/+RkWPw71S6sbe6ur/SdM+0rut4tQuxFJMD0Krg9ffFc/
q+kX2hanNp2owGG5iOGUnI9iD3B9a9N+I+reHbTxndRap4TmvJQkZjuBqbxK6bRjaoUgDtx6GuH8
Y+JovFF/Z3MOmmxS3tEtlRpzKWCk4JYqOxx+FTe+qHa25zlb3hzXNM0RbmW80G21W6faIPtTExxd
d2V/izx+VYNaWhaFfeItVi0+wj3SvyzNwsajqzHsBVLyEztpxpHjHwFrGsDRLLSdS0loyHsU8uKZ
WONpXpn/AOtUWmwad4T8CWOuz6PZ6rquqzulvHexmSKKJOCdnck/z/PO8Ua3YWWkx+E/D8m/ToH8
y7u+hvJh/F/uDsPauiuNdvNE8B+B9f0xIZHsWubdhKm5AzHoQCOwPelpZtbaf182PW6T8/8AhjE8
Y6dpt74Z0jxZpdjHYLeM9vd2sP8Aq0lXuo7AgHj6Vw1ejeILmRvg/pT3YVbjUNVmuwoG0bfmBIHp
k/rXnNLq1/WwdE/63CiiimIKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKA
CiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACkNLSGgD0f4O
f8hvUf8Ar2H/AKEK+jrT/jyg/wCua/yr5x+Dn/Ib1H/r2H/oQr6OtP8Ajyg/65r/ACpFE1FFFABR
RRQAUUUUAFFFFABRRRQB4tokMeianrUfiXwTf6xr1zfSSQ3f2H7RHPGcbAJCMIB0PTFYyeBdd1f4
G3elHS57fVLXVpLtLSSIxlwMjCA4yMMcY4OK+gqKAPnLxvq/ivxt4A0/SYvBOtRTWUkf2qRrZzuZ
VKjYuMkdzxxXReLdD1e5+Ifw+uoNKvpbe1t4RcSpbuywkNyHIGF/Gva6KAPDYU134bfFPX9RTw3q
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
v8qRRNRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAU
UUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRR
RQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQB5x8Uf+RZ1v/riv/stfNYr6U+KP/Is63/1xX/2Wvms
UxMWiiigQUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUU
UAFFFFABRRRQAUUUUAfSfwg/5J3Zf78v/oxq7pvumuF+EH/JO7L/AH5f/RjV3TfdNIo+T/Bus/2B
4u03UScRRzBZfeNvlb9Ca7bRvD0Xh34na3ezoPsOhxS3yZ6MCMxD/wAe/SvLK9C1z4g2Wp+BY9Lh
tbhNYmjggvrlguySOLO3BzknJHUDvTb0ut/8/wDIlb2e3+X+ZxQ1fUE1Ge/hvJ4LmdmaSSKQox3H
J5HvXXfFhmfxXaMxLMdNtySTkk7TXN6GPDpab+331RVwPJ+wLGxzzndvI9uldT4v1/wX4kkN7H/b
8d7HarBCrRQiMlRhS3zE/XFJq0Ul0/yY07tt/wBaom+Gd9/Zmg+L74RJI8FlG6LIMruDHaSO+Dg/
hXKX3jDxFqdvLb32sXdxDKwdkkkyAQcggfw8+mKs+HfEFppGgeIrC4jmaXUrZYYTGoKqQ2fmyRgf
TNc3Ter+X6sS2+f6I9Jt9b1Y/By7ujql6bgawqCX7Q+8L5Y4znOPavPpb68nvBeS3U8l0CCJnkJc
EdDu68V03hzxHo8Phm+8O+ILa9exuJ1uY5rIr5kcgGOjcEEVkuPDf/CQqI31X+xO5ZY/tP3fTO37
3v0ofxf12QfZ/rudRr13c33wf0Oa7uJbiU6lMC8rl2xg9zS+BZW0fwZ4r8QWuF1G3jigglxkxCRs
Mw9D0/KprjX/AADceFrPQG/4SUW9rO86yCKDeS3UH58YrD8N+J7DQrrVbGe0nvNB1FTFLEzBZQoJ
2MMcbhn6UP7Vuv8Akh/y36f5s3/DOq3/AIo8HeKtN1q7mvktrP7bbyXLmRopFPZjzz/j615rXb3f
ijw9pXhy/wBI8K2eoq2o4W6u9QZN4QfwKE4x7/5HEUutw6WCvQvBeoXt14P8YW9xd3EsMOmARxyS
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
cXt3q9tfveMgS0ntERmgyDuYbyAG6YOD3qkSy5rEkXgnwfP4XSRZdZ1Jkk1IocrboOViz3bufrWp
d3OkWfgvwDPrNlLeaUq3XnQwtgs2eO47+4rm9Xn8Az2d1LYf8JO+pOC0b3hhKFyerkHPrTtE8UaN
J4Y/4RvxPaXs1jFMZ7WeyZRLCx6jDcEHn8/yWrT76f5D0TXbX/hzU1t4JPg1YPDE0UDazMbaN2yV
jw3Ge+K85rqfFnii01e007SdItJLTR9OVhBHKwaR2Y5Z3xxk/wCNctSW7f8AW1gey/rrcKKKKYgo
oooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACii
igAooooAKKKKACiiigAooooAKKKKACiiigAooooAKQ0tIaAPR/g5/wAhvUf+vYf+hCvo60/48oP+
ua/yr5x+Dn/Ib1H/AK9h/wChCvo60/48oP8Armv8qRRNRRRQAUUUUAFFFFABRRRQAUUUUAFFFcr8
Q/Fk3grwhPrVvax3MkUkaCORioO5sdRQB1VFcLN481KO08LTW/hy5vV1lEad7ckrbZ29ePcnnHSu
6oAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiii
gAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKK5/xJ4mh0aLyIcS30g+
SMfw+7e1AFzUvEOm6Vcw293cBJJTgDrj3PoK01ZXUMpBUjII715akseus8d6iJqZX7w+7MPb0Ndh
4QtdRs7Borxy0AP7kN95R6fSgDo6KKKAPOPij/yLOt/9cV/9lr5rFfSnxR/5FnW/+uK/+y181imJ
i0UUUCCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA
ooooAKKKKACiiigD6T+EH/JO7L/fl/8ARjV3TfdNcL8IP+Sd2X+/L/6Mau6b7ppFHxlRVvTNSu9H
1KDULGXyrqBt0b7Q2D9DkV65q/xC8T23wz0DV4dRC313cTJPJ5EZ3KpIAxtwOnYU3pG5K1djxiiu
+8AwwWml+IfFdzbRXM+mxKLVJV3L50hwGI744/OtmaXVfF/hTX7XxTZbNZ0uBb61nkthDJ5fO5SA
BlcD/OKHp+f9fLUa1/I8oor01tVuPAvw98P3WhLDDqGrebLcXrQq74UgBBuBAHP6VW8YWw8QeDvD
/io2sUOoXcz2l0YkCLMwJ2vgd+Dn/wCtQ1rZd7f18xLa76nndFexa9rOr+C9QGh+GtORtK0q3ibU
iLUSCZmGSZGwcAj6d65nxpDD4Q+IEWoaRbW4gnhS8ghljDRrvUgjb6A5I9OKLr5Dtp5nB0V7V4X1
HxX4lnkg8YaWjeG3tneSa6slgSJduVZGwPbpn1rxiUIsziMlowxCk9x2pPR2DdXGVtDW9PAA/wCE
W0g+/m3f/wAfrFruvhz4rvtK1nTdJtbeyEd1fIJZ2gDTFWIBUMegx/M1SV3Ylu2pzVxq1lPbvFH4
d0y3dhgSxSXJZPcbpiPzBrKrpfHEbS/EPWo1+8986j6lq73XtZ1fwXqA0Pw1pyNpWlW8TakRaiQT
MwyTI2DgEfTvUxd4qXcpq0nHseO0V1/xK0a00fxax0+MRWd7BHdxRqOEDjkD2yDWdfeE7/T/AApp
/iKWa2azvpDHEiMxkBGfvDGP4T0JovpdhbWyM+x1m/06yvrO0n8uC+QR3CbFO9QcgZIyPwxVGt7w
54rvPC63L2FrZtdTbQtzPCJHhAz9zPAznn6V2UmrS+NfhprmpeIIYGvdOki+y3yxLG7FjyhwADx2
96b2v2Baux5fRXS+ENKt57i51nU0zpWloJplP/LZ/wCCIe7H9Aa6H4w3L3utaJdOFV5tIhkYKOAS
WPH50PS39d/8hLW/9dv8zzmrun3tvZmTz9LtL7djH2hpRs+nluvX3z0rR0bwnf65omrarbTWyQaZ
GJJllZgzDBPygAg9D1IrO0nUpdH1OG/gihklhJKrOm9M4I5HfrR1sw6XLv8Aben/APQraR/39u//
AI/Wbe3MV1cGWGygs0wB5UDOV+vzsx/WvYvC+o+K/Es8kHjDS0bw29s7yTXVksCRLtyrI2B7dM+t
ebaH4x1vwo13FoV/5EMz5bMKPuxnB+YHHBo62Y+l0c9RXrl94z1+4+Ed3d61fefNq1x9ltF8pExE
v+sb5QM55FeR0urQdLhRTo5GikWRDhkIYH0Ir0vw18RfHfiDxHYaVHrA/wBIlCsRaQ/KvVj9zsAT
VJX0Jbtqzz/T723szJ5+l2l9uxj7Q0o2fTy3Xr756Vd/tvT/APoVtI/7+3f/AMfrS+IutnxF46v7
iI74o3FtDjuqcZH1OT+Nd94atYPD/hvxD4eCKdR/sWW71CTujsvyRf8AAVPPu1SnePN/Xcu1pcp4
7e3MV1cGWGygs0wB5UDOV+vzsx/Wq9d78Pra3sdI8QeKZ7aO5m0uFFtI5V3KJnOAxHfHH51tTS6r
4v8ACmv2vimy2azpcC31rPJbCGTy+dykADK4H+cU3p+f9fLUS1/I8oorpfCGlW89xc6zqaZ0rS0E
0yn/AJbP/BEPdj+gNdD8YLlr3W9DupAFabSYZGCjgElicfnQ9Lf13/yEtb/1/W55zRXtms3XinR7
rS7PwPpok8PyW0TI9vZrKk5P3jI+Dj3yRXD+O59L0z4iyXOjQWckULRySQhQ0BlGCy4HBXPUD3o6
2Baq5xdFeqa54hvfEnwZkvL1LdGTVliRLeIRoqhM4AH1NeV0urX9bXH0TCiius0j4h6z4f0mCw0e
KytPLyZLhbZWlmJJPzFgfXH4UxHM2k8dvcpLLaw3SLnMMxcK3HfYyt+RFan9t6f/ANCtpH/f27/+
P11Xj1obrw/4Y8SNaw2esXyO1wsKBRJtI2ybff8Ar7VZ8NfEXx34g8R2GlR6wP8ASJQrEWkPyr1Y
/c7AE00rvl67A3ZX6HA3+oW15GiwaRZWJU5LW7zEt7HzJGH5YqhXpt5qmmeKvjfE2ptG2lrcfZ03
kbWCAhc+xf8AnXS2F/4sn8WXWneJ9Lii8Kp5omWezSO3ijAO0pJgZ7Y5NStUn3G1Ztdjw2ivR/h3
b2pufEtxpdvFd6tbwFtJinUMSNxywU9WA21o317q+p+ANbl8d2oiuYyn9mS3NssE7SZ5VQACVxjP
Hr+A3ZX8rglrbzseT0V1mkfEPWfD+kwWGjxWVp5eTJcLbK0sxJJ+YsD64/Ctnx7FDqugeF9ce0ht
dX1NHFwkKbBKAQFfHvnr7+1Nrt6CXmedUV7Fr2s6v4L1AaH4a05G0rSreJtSItRIJmYZJkbBwCPp
3rOv/D2hWXxj0yGeOKLRr8R3SxNwg3qcL9C46dOcULVpL+v66A9Fd+p5dRXuVhf+LJ/Fl1p3ifS4
ovCqeaJlns0jt4owDtKSYGe2OTXid2IReTi2JMAkbyyeu3PH6Uk728ymrXIaKK9M+EnivWofEume
HUuwNLkeRmh8pOTsZvvY3dQO9UlchuyueZ0V0/jPxXrPiLUpLbVLsTxWc8qwKIkXaCcfwgZ6DrW5
e/DfTNJvre31bxdbWQuoke33WrMzlhzkK2FUHjcTzg8VMXdXKkrOx55RXRXnhmHRvFs+ia9qQsoo
et1FAZgQRlSFBB5BH0rtvGOheEzZeHfP8SGyA0yPy2TS2f7QvaQ4YbSfQ5NF9EwtrY8norc8O+GZ
/EV3ciO5htrG0Tzbm8n4SJOxPqT2Fad94LsX0e71Lw94hh1hLIBrqIWzwSRr03BW+8Pem9A62MO3
8Oa5eWYvLbRtRntSCRPFauyEDqdwGOMGsyvQvhVqF6+t3Vk15cG0XTrgrAZW2A7eoXOK4bT/APkJ
Wv8A12T+YppXmo9/82iW7RcitRXsnj34haxonj+80txbXmjx+Vusri3RlZSilhnGe571xPxG0C00
DxW0enrssbuFLqBP7it2+mQalO6T7ltW0ORor0LUPhrYaLcJ/bPiq3sbWWNHhka1Z5JCQCcRqxIU
ZxuzVW08CabPY6hqE/im3h0+zu0tvtK2zSLIGUEMoBznnGPrzxT8v67EnD0V6DqHwwWxOo2o8QW0
2p2ls14lokDfvYBzu39Acfw81tah4t1nwt8NfB39k3KRLcRT+crwo4cK4wDuB9T0ourf15/5DS1s
eSUV3/jO1s9Z8H6P4wtbOGzubmVra9igXajSDOGA7ZwfzFVl8C6fYQW48R+J7bSL64QSR2n2Z5mV
T08wrwmfejXqI4mitrWfDGo6N4gXRnVZ7iQp5DQncs6v90qfQ10Fx4D0fTZhYav4ysrPVsDdbLbS
SpGx7NIOAfXijpcDnNC8Uaz4aadtIvDbNcKFkIjRiQM4wWBx1PSsuaaW5nknnkaSWRizu5yWJ6km
t/w94Sn1/Ub2EXlvb2dgrPdXrnMaIDjI9c44FXdT8FWq6DcazoGvQ6zaWjBboLA0EkWeh2t1X3/+
vSb6saXQ56bWb+40e20mWfdY2ztJDFsUbWbqc4yfxNQSWV3FaQ3clrMltMSIpmjISQjqFboce1dL
o/g23udAXXNb1uHR9PlkMVuzQNM8zDrhV5wPWt3xxpn9kfDfwtaLdQ3UYmuHjnhOVkRiCpHpwena
nLTXroC109Tzaiu2XwLp9hBbjxH4nttIvrhBJHafZnmZVPTzCvCZ9657xDoF34b1d9PuzG7BQ8cs
RykqNyrKfQ0dbCWquZVFehah8NbDRbhP7Z8VW9jayxo8MjWrPJISATiNWJCjON2a4nVrOHT9Untb
a9ivYY2wlxEMLIMZyB2o62Dpcp0UV0nhzwi+t2F1ql5qEGmaRasElu51LZY/wqo5Y+1AHN0Vva7o
mk6fbQ3Ok+IoNVidyjKIHhkQ4zko3b3rpdR+G2l6LdwQ6v4vtrP7TGj2+60ZmfI53BSQig8ZJ5wa
APPKK6uHwLeL49h8K3twkEkr4W4RfMUqVLBgMjIIHrWovw3tJr2fSLfxTZS6/HuxYeQwViOdvm/d
3Y7c4pdLj62OAoqX7PILr7O67JQ+whuMHOOa1vFXha+8I6sum6hLbyzNEsoa3ZmXBJHcA549KfS4
eRiUV2nhXxX4vtLJdL8M2YcxAu5trETSkE9WODxzitL4l2yjTfD97qNpb2fiG5ic38MKhSVBG1mU
dGI/zxQ9LCWp5zRXtms3XinR7rS7PwPpok8PyW0TI9vZrKk5P3jI+Dj3yRXAfEmPSovG14ujiFYd
qGRYCPLWXHzhccdfTvmhuz/roNaq5h3ugazplutxf6Tf2sDEKss9s6KSeQASMVnV6Dc3t1ffBTzL
u5muHXWwoaaQuQPK6ZPavPqOrX9bXF0T/rcKKK9M+EnivWofEumeHUuwNLkeRmh8pOTsZvvY3dQO
9NK4m7K55nRXT+M/Fes+ItSkttUuxPFZzyrAoiRdoJx/CBnoOtbl78N9M0m+t7fVvF1tZC6iR7fd
aszOWHOQrYVQeNxPODxUxd1cqSs7HnlFdFeeGYdG8Wz6Jr2pCyih63UUBmBBGVIUEHkEfSu28Y6F
4TNl4d8/xIbIDTI/LZNLZ/tC9pDhhtJ9Dk0X0TC2tjyeitzw74Zn8RXdyI7mG2sbRPNubyfhIk7E
+pPYVp33guxfR7vUvD3iGHWEsgGuohbPBJGvTcFb7w96b0DrYw7fw5rl5Zi8ttG1Ge1IJE8Vq7IQ
Op3AY4wazK9C+FWoXr63dWTXlwbRdOuCsBlbYDt6hc4rhtP/AOQla/8AXZP5imleaj3/AM2iW7Rc
itRXsnj34haxonj+80txbXmjx+Vusri3RlZSilhnGe571xPxG0C00DxW0enrssbuFLqBP7it2+mQ
alO6T7ltW0ORor0LUPhrYaLcJ/bPiq3sbWWNHhka1Z5JCQCcRqxIUZxuzVW08CabPY6hqE/im3h0
+zu0tvtK2zSLIGUEMoBznnGPrzxT8v67EnD0V6DqHwwWxOo2o8QW02p2ls14lokDfvYBzu39Acfw
81tah4t1nwt8NfB39k3KRLcRT+crwo4cK4wDuB9T0ourf15/5DS1seSUV3/jO1s9Z8H6P4wtbOGz
ubmVra9igXajSDOGA7ZwfzFVl8C6fYQW48R+J7bSL64QSR2n2Z5mVT08wrwmfejXqI4mitrWfDGo
6N4gXRnVZ7iQp5DQncs6v90qfQ10Fx4D0fTZhYav4ysrPVsDdbLbSSpGx7NIOAfXijpcDhaK6Lw9
4Sn1/Ub2EXlvb2dgrPdXrnMaIDjI9c44FXdT8FWq6DcazoGvQ6zaWjBboLA0EkWeh2t1X3/+vSvp
cdtbHIVPJZXcVpDdyWsyW0xIimaMhJCOoVuhx7V0uj+Dbe50Bdc1vW4dH0+WQxW7NA0zzMOuFXnA
9a3fHGmf2R8N/C1ot1DdRia4eOeE5WRGIKkenB6dqb0X3AtWebUV2y+BdPsILceI/E9tpF9cIJI7
T7M8zKp6eYV4TPvXPeIdAu/Dervp92Y3YKHjliOUlRuVZT6GjrYS1VzKor0LUPhrYaLcJ/bPiq3s
bWWNHhka1Z5JCQCcRqxIUZxuzXE6tZw6fqk9rbXsV7DG2EuIhhZBjOQO1HWwdLlOiiuk8OeEX1uw
utUvNQg0zSLVgkt3OpbLH+FVHLH2oA5uit7XtE0nTraG50nxFBqsTuUZRA8EiHGclG7e9a2l+AFv
/C1n4guNagsrKWSRJ3njOIQpwMYOXYnooAoA4uiumvvCttJq+n6f4c1mLW2vSVUpCYSjD+8rEkDH
OfQGtZPh/pdzdtpVl4wsbjXBlRaC3dY2cdVWU8E/hQBwdFbWj6HbXl9dW+ratBo6WuRI06M7FgcF
VVeSa09S8HWa6HcaxoGvw6xa2hUXSi3eCSIMcA7W6jPejpcdtbHJUhr1D4a6R4emS/ml1nzbt9Ln
861ewJFuOMuHJwxHHAA61xGuafolisH9j66+qFyfMDWTQbOmOrHOefyoejsJaq513wc/5Deo/wDX
sP8A0IV9HWn/AB5Qf9c1/lXhfw58OXHh7VH+2zw/a7qz81rVTl4F3Lt3+hOTx7V7paf8eUH/AFzX
+VJjWxNRRRQMKKKKACiiigAooooAKKKKAPItZutNXXdRi8SePb+O+Ep+zWejTSqtrHgbd6xg5b13
VzPiDxDe+Jf2cZ7vUJzcXEV8sBnYYMgWQYYj1wRXX6BYeMvBlxqmmWfhq31Nby9kuYtU+1pGuHOf
3oPzfL7D6VhS/D/xWfgrqPhxtOEmrPqZnRBPHiRN4O8MWwOhOCQfagCn4g1zVdLt/hVbafqV1awX
UcazxwysiyjMQwwB54J6+tReMPHL618Tb/Qb3xZdeG9B04GMy2m4STSjAIyvPUn2wvqa2fEfgPxL
fn4cfZtN8z+x1QX37+MeThoierfN91vu56VJ4l8B+IdE+IV14t8M6TY61b3ykXWn3RUEMcZI3YHU
ZyDnk8YoAo/DjxHqHiO98R+DW8SXeoWyQF9O1dXZJ1GQAd33u46+h7Guag8Z+ONQktPhwL+6h1xN
SaKbUVlPmmJecbs54+Y57gAV6hoaeNrXSdZ1O48K6Ra30kQXTtPszGsit0JeTIXb0OM54rgl+D3i
iy8P2fiS1Yv41S++1ywmZMFSfu7s7cjqecEEj0oA0/HFx4htvir4Y8L6R4k1KzhuLOOJ5DOzluXD
OwJwz4HU98U+zuvEHw7+LulaBd+Ib7WdI1hRt+2yF3RiSoxknBDAdOCDWT48uNdn+Mng+5tLGK31
s2Ubi0uJAUEgaQshZSRg8jI9a6TSPC3jDxZ8TrLxX4t02DSrXS0221rHMshdhkg5BP8AE2cnHQCg
DltCg8aeOvG3i7RrXxjfadYWl65Z/Md2QCVwiINwKjGc4I6CrvjnxrPefEd/C934pufD2iWEQE91
a7vNmk2g9V55Jx6cHrXWfDPwjrnh/wAbeMtR1Sx+z2uo3RktZPNRvMXzJGzhWJHDDrjrVDxh4C1/
T/H7eMvDWnWWsC4TZdadd7Rk4AJUtgdgeuQfWgDG8A+ONWXXPEXhyw1mbxJDBYyXOl3c4Yu7qFwp
3cn72Oe68da57RNbu9bsGuLj4kalpfi77QR9lvp2itQN2NpGNo/x4xXqnhvTvGF/Bqs9/pGkeGpZ
bfy7H7JGjzRSf3mYZBB9PbpXF694Z+IHiLRG0DVvCWm3eoFwB4g8+JTtDZ3YGG6cdOnagC98T9f8
SaUPC1nqOq3GnabcoBqmo6XnJfuFbqBjkfXvitf4cG+fxDcPpPjZPEHhry+YbydpLuFiOCcjIGcj
sMVJqnh3xxoOleH49Dmg1qzsbRbe+0q42KtyQD8wZh7+v8I461n+B/A+uD4kTeLr7RbXw5aeSYl0
+3lVzISMZO3gDv8AUDigD2GiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA
ooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiqupXa2OnzXDEDYvH17UAYnifxVFoyG1
ttsuoOPlTsg/vNXnql5JnmmdpbiU5dz1JrZ13w3caegv2kM0k2DMScncf6VseGPC+Ql7fL7pGf5m
gBfD3hgS+Xe3qn5SGjU/zrtaAABgdKKACiiigDzj4o/8izrf/XFf/Za+axX0p8Uf+RZ1v/riv/st
fNYpiYtFFFAgooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA
ooooAKKKKACiiigAooooA+k/hB/yTuy/35f/AEY1d033TXC/CD/kndl/vy/+jGrum+6aRR8ZAEnA
GTXoOvI3/CmvCo2nP2q44x/tNXEabqV3o+owahYS+TdQNujk2htp+hBBrqz8W/HBGP7c/wDJSD/4
im9Y2JW9y74GEmoeA/F+kWuWvTHDdRIv3mEbZOB68D860PD+sarfeF/F/iPXbiSUvYLp8Msihd7E
kBRgAcZGfrXnOn6rf6VqK6hYXUlvdqSRLGcHnr+HtWhrvjDxB4mSOPV9SkuY4zlY9qooPrtUAE+9
Etfmv+B+Q46fff8Ar5mto3ipofDcWkaz4dTWtLjlZrUs7xNE56hXXtz0966Xxtq01t4G8N2t3Yxa
fO92buKwjXH2eBeFBB5yc5yeSSa4fQ/G3iLw3avbaRqb20DsXaPy0cZ6Z+YHHSsvUtUvtYvnvdRu
pbm5f70kjZP09h7U29bry/AS218/xPSfiHea7F4tuk0aaY2HiS3gKrEgYXA2BcA46/TsazvihDLf
eMrfS7GKS6n0/T4oJFhUucqCzcD0Brn9L8e+KNF07+z9P1iaG1GQsZVW2/7pYEr+GKyrPWdS0/VP
7Ttb2eK+3FjOG+Yk9ck9c+9TZbdP6t91x3e/9dL/AJHdfDq78Qa34ih0XUWu9Q0V0aO6t7stJFEg
U4I3fcIIGMYrgNRihg1O7htn3wRzOsbZ+8oJAP5V0GofEfxfqlk9nda3M0DjayoiRlh6EqASPxrl
qHq7gtFYK3vBSk+N9DIBIF9Dzj/aFYNdBoPjfxF4YtZLbR9Q+zQyv5jr5Mb5bGM5ZSegqouzuTJX
Vix40c2/xH1ecqcJqDN064bNdZ8Q7zXYvFt0mjTTGw8SW8BVYkDC4GwLgHHX6djXGa9448R+JrOO
01jUftMEb+YqeRGmGwRnKqD0Jp2l+PfFGi6d/Z+n6xNDajIWMqrbf90sCV/DFTFWiovp+JbfvOS6
mz8Wpo/+EstrFHDNYWENtIQf4gCSP1Fc3eadr0Phyyvbtbn+x5XIti8uY93OcLnjoe1ZU00txO80
0jSSyMWd3OSxPUk1o3XiLVbzQrTRbi636daMXgh8tRsJzzuAyep6mjW3n/VxaX8ifwx4ZuvEuotD
G6wWkK+ZdXcn3IIx1J9/Qd60fFniGC7toNC0SGSDQbEkxhhhrh+8r+57DsKz/D/jDXfCyzro199l
E5UyfuUfdjOPvKcdT0rQ1L4leLtX06fT77VvNtZ12SJ9miXcPqFBFOXkEfM3F/4Q+/8ABOlaQ3i7
+yzHm4vIv7NmmMk54yWGBhRwMZq38W7HSkh0WeLWfMu49OgiitfsrDzYvmxLv6L/ALp5ryytDVdb
1HW3tn1G485raBbeI7FXbGvQfKBnr1PNEtfvv/X9bAtPuLGladr13pOpXGmLcmwgTN6YpdqhcH7w
yM8A+tZtrZ3N9N5Npbyzy7S2yJCzYHJOB6Ve07xFquk6bfafZXXlWt+uy5j8tW3jBGMkEjqemKra
bqd9o98l7p1zJbXKZ2yRnBGetHUXQ734dXfiDW/EUOi6i13qGiujR3VvdlpIokCnBG77hBAxjFcP
Jp4uPEL6bp5Moe6MEB67gWwv9K2dQ+I/i/VLJ7O61uZoHG1lREjLD0JUAkfjWDpmpXej6jBqFjKI
rqBt0blFfafXDAj9KF8SbD7LSOu+J11DBq9l4dtGzaaLbLbDHRpCAXb65x+VcnpWk32t6glhptu1
xdSAlY1IBOBk9faoLq6nvbua6uZDJPM5kkc9WYnJNWdH1nUNA1KPUdMuPIu4wQsmxWxkYPDAjoaU
f7w5eRUuLeW0uZbedCk0TlHU/wALA4IrvPAi/wBg+GfEHi2QYkhh+xWRP/PaTqR9Bj8zXCXNzLeX
c11O++aZzJI2AMsTknA461bl1zUZtCh0V7j/AIl0MpmSEIo+c5ySQMnr3Jo15Wuv9X/ANOa/Q1/A
Vzotn4rhvdeuRBbwI0kTtE0q+aPuZVQSQDz+FeieEtP8PSv4quofGZ1KW706b7XIdNljMSty0nJ+
bH90V4pWhpmt6jo6XiWFx5K3kDW842K2+M9RyDj6jmm9V8mJaP5o7zwvBDceE/G2haRdm+kVYrm1
lWIxtMsbZJCHkHgce9TeH9Y1W+8L+L/Eeu3EkpewXT4ZZFC72JICjAA4yM/WvONN1O+0e+jvdOuZ
La5j+7JGcEe3uPatHXfGHiDxMkcer6lJcxxnKx7VRQfXaoAJ96UtV8rfpf7hp2++/wCv5nWL/wAI
ff8AgnStIbxd/ZZjzcXkX9mzTGSc8ZLDAwo4GM1ofFPTtHLaBINb3XC2FvClv9lZfMhyf3u88L/u
nmvJ60NV1vUdbe2fUbjzmtoFt4jsVdsa9B8oGevU81T3v53/AK/L0EtreVj0Dxzf694V8WQaR4el
urDTY44/sUNrkJPkDLED/WEtnOc1k/FaxtrPxbF5EMcFxPZxTXUMQwFmOd3A6Z4P41m6f8RfFul2
CWVprUyW6DaiuiOVHoCwJH4GsJtUvn1UanJcySXwlE3nSHcxcHIJz16VNth30+R2saN/wouYbTn+
2hxj/pmK8/6V23/C3PHP/Qc/8lIP/iK4+7upr68nu7l9887tJI+ANzE5JwOOtHW/9bJB0t/W9yGu
v8LeG7U2T+JPEAdNEtmwkQ+/eSdo09vU/wD18chXU6V8RvFmiabDp2nar5NpCCI4/s8TYySTyyk9
Sarp5iM7xLr974k1Zr67URqAI4IEGEhjHRFHoK6jwIv9g+GfEHi2QYkhh+xWRP8Az2k6kfQY/M1z
uv8AjPxB4oghh1nUPtMcLF4x5MaYJGP4VFUZdc1GbQodFe4/4l0MpmSEIo+c5ySQMnr3Jqfstf15
/qPqn/Xkbvw10yx1nx5YWupIksB3v5T9JGVSQD68jp3rpPCeteKdS+Iq6RqT3M9pJI8V5p8ykwRx
YORsPyqBxjGO1eZQTy208c8ErxTRsGR0bDKR0II6V0118SfGF5YtZza5OYWXa21EViPdgA361V9h
dzpfD+l29nZ+N9R0SNZ9R02Xy7BgN7RRlyC6j12jg9sU3w5d6j4k8EeKf+EimmvbO0tvNtrm7Jdo
pxnARzzzxkZ/nXA6TrWpaFei80u8ltZwMb4z1HoR0I9jWhrfjbxH4jtxb6rqss8AOfKCqik+pCgA
/jUtaW8rf8H9fUpPW/nf/gGh4W8N2psn8SeIA6aJbNhIh9+8k7Rp7ep/+vjN1zxJe674hTVLtBGk
bKIIEGEhjU8Io9BVzSviN4s0TTYdO07VfJtIQRHH9nibGSSeWUnqTVTX/GfiDxRBDDrOofaY4WLx
jyY0wSMfwqKq9pJroSlpZ9TtviHea7F4tuk0aaY2HiS3gKrEgYXA2BcA46/Tsa1b+x0zWPjPo+jX
wjnisLBIXjY5V5ERmCn16jj2rznS/HvijRdO/s/T9YmhtRkLGVVtv+6WBK/hisMXt0L77aLmUXe/
zPP3nfvzndnrnPekkk7dP6t91wd2v68vzseleE9a8U6l8RV0jUnuZ7SSR4rzT5lJgjiwcjYflUDj
GMdq891yC2tdf1G3syDbRXMiREHPyhiBz9K27r4k+MLyxazm1ycwsu1tqIrEe7ABv1rlaVtvIpvc
K7T4Uqf+Fk6QcHG6TnH/AEzauLrpdF+IHifw9py6fpWp/Z7VWLCPyIn5PXllJqouzuRJXVjI1lSN
bv8AIIzcydR/tGut+K7E+L7YEnA0+3A9vlrA8QeMNe8UrAus332oW5YxfuUTbnGfuqM9B1qlq2s3
+uXi3eo3HnTrGsQbYq/KowBhQBUxVkl2f6Ft3k33/wA0dV8Wv+R4Y+tpB/6AKd8Q1LaR4OlAJjOj
xqG7Eg8j9a5LVtYv9dvvtupT+fcbFTfsVflUYAwoA6Vq6V488TaLp62FhqjJaoSVikijlC59N6nH
4UW0+d/z/wAxL9Lfl/kdV8PLpl8DeKbez0+01G+Uwz/Y7mMyLLGDz8oIJx1+uKzIPG+pvY6lDpvh
PRLdZbZ4bqW0spFZIyMHJ34H41yNhql9peoLf2N1Lb3SkkSxNtPPX8PatnVPiD4q1mxeyvtYlktp
Bh41RIw49DtAz+NOWoR0NX4T/N4uniHLy6fcIi92bb0H5Vx9krJqlurKVZZ1BBGCDuFMsr25069i
vLOd4LiJt0ciHBU1ra14x17xE1s2q3/2g2rF4T5MabScc/Koz0HWmnaSl2/zuS1eLj/Wx0vxL0y9
1b4sX9nY20k88phVVRSesa/kPeovi1dQyeLrexhkWT+zrKK1dlORvGSR+tUrn4p+NbuBoZNdlCMM
ExQxxt/30qgj865F3aR2d2LOxyWJySfWoSskuxbd22d18WpHfxdbqzEhNPgCj0G3P8zUFl/yR3U/
+wvD/wCgGuY1bWb/AFy8F3qM/nziNYw2xV+VRgDCgCkTVr6PRpdJSfFjLMJ3i2Ly4GAc4z07ZxVd
H5v9biW68l+lj12Y5+KGo5/6Fw/+iBXLeLkeT4beBVRWZjHcgBRkn51rmD4t1xtUk1I33+mSW32V
5PKTmLbt24xjoOuM1f034j+LNI0uHTbDVjDaQqVjQW8R2jOepXPf1oev9ecv8wjpb+uiX6HSawP+
Ed+GfhjStSjMd1Nfm/kgcYZIgSOR2yCP1rR+IviKXS/FMkjeFtAvrS6RJLa9ubR3aZSo/iDgHHT6
YryvUdSvdWvHvNQupbm4f70krbj9Pp7Vs6T498UaHZCz0/WJorZfuxsqyBf93cDj8KHrq/66fogW
n9fM6Gx8S3eofErw1ea9p9vpqW4jhijjhaJBHk7GwxPGT16YFc74x0vULTxtqdtc28puJbuR4xtJ
MgZiVK+uQaydU1a/1q+a91K7lublgAZJDk4HQD0HtW7a/EfxfZ2K2UOuXAhVdq7lRmA9AxBYfnS7
fP8AEP8AgfgbPhCCa5+H3jTTII2/tALDIYgPnKI53DHXim+A4pLXwh4yv7hStk2n/ZwzDAaVj8oH
qf8AGuN0/WdS0rUhqNjezQXmSTKrcnPXPrn3q/rnjLxD4khSHVtTluIUO4R7VRc+pCgAn3ND1v5q
36AtPk7nR+K43u/hj4Pu7ZS1tbrNBMVGQkm4dfTODVvxDBNpnw58DDUI2XbcSysjjkIXDDj6GuP0
Lxdr3hpJU0jUpLaOU5dNqupPrhgRn3qLVvE+s65aw22p373UcMjyJ5irkMxyx3YyfxPHaqb1uu9x
JaJPtY9I+IviKXS/FMkjeFtAvrS6RJLa9ubR3aZSo/iDgHHT6Yrg/F+t6nrl/Zy6ppsGnvDapFDD
DC0a+UCdpwxJxyaXSfHvijQ7IWen6xNFbL92NlWQL/u7gcfhWTqmrX+tXzXupXctzcsADJIcnA6A
eg9qm1rDudf8WpHfxdbqzEhNPgCj0G3P8zXCKpd1VRlmOAPerurazf65eC71Gfz5xGsYbYq/KowB
hQBVJHaN1dThlOQfemt9e/6ieyt2X5F/WNE1LQL0WeqWrW1wUEgRiCdp6Hgn0NdkYZdS+CUCWCNI
1hqbPeIgyVVlO1iPTkDNcfrmv6n4kvxfatc/aLkIIw/lqnyjOBhQB3NGja/qvh67N1pN9LaykYYo
eGHoQeD+Io3TT/rW49mmv60KX2eYQC4MMggL7BJtO0t1xn1r0H4t6fenxTp0ohkeO5sYUgKqTuIG
Co989veuT1zxZrviXyhq+oyXKxHKIVVFU+uFAGa7Xxl4/wBW0vxGV8O66v2R7SAN5LJKgcJg4yCA
fXHND2V+/wCjBb/L9UbdwRH8ZfCFo5BurWwhhuOeQ4Rzg/gRXK6BpOpJ8aY7d4ZRPDqLTSkg8IGL
FifQjv71meBdVH/CyNN1LVb5VzOzzXNzKAMlTyzGl1Px/wCJmW90yLW5jp7SOihdpJTJwA+N2Me/
Si7TUuur/FCsmmumi/MyPEk0d34v1Wa0OY5b2Voip6gucYpPEVhrenaksGvrcC8MYYCeXzG2c45y
eOtZaO0bq6nDKcg+9aGua/qfiS/F9q1z9ouQgjD+WqfKM4GFAHc0krRSRTd22Os5de0QR3ljJqNi
LhfkmgLxiVc9iMbhkfpXaeLrFrrwd4Z1fW4/I1q7maKeRk2STQg8O47kDHPoa5zSPH/inQrJLPTt
Ylitk4SNkRwv03A4rK1fXNT168+16rey3U+MBpD90egHQD6U2yUegeOb/XvCviyDSPD0t1YabHHH
9ihtchJ8gZYgf6wls5zmsj4r2VtZeLYjDDHBPPZxTXcUYAVZjndwOnY1naf8RfFul2CWVprUyW6D
aiuiOVHoCwJH4Guduru4v7uS6vJ5J55W3PJI25mPuTStshpnaD/kh7f9hwf+iq4Wu01fX/Dg8Br4
d0VdVZzfC7eS9SMD7hUgFWPt2ri6b+J/L8kH2V/XVhXafClT/wALJ0g4ON0nOP8Apm1cXXS6L8QP
E/h7Tl0/StT+z2qsWEfkRPyevLKTTi7O5MldWMjWVI1u/wAgjNzJ1H+0a634rsT4vtgScDT7cD2+
WsDxB4w17xSsC6zffahbljF+5RNucZ+6oz0HWqWrazf65eLd6jcedOsaxBtir8qjAGFAFTFWSXZ/
oW3eTff/ADR1Xxa/5Hhj62kH/oAp3xDUtpHg6UAmM6PGobsSDyP1rktW1i/12++26lP59xsVN+xV
+VRgDCgDpWrpXjzxNounrYWGqMlqhJWKSKOULn03qcfhRbT53/P/ADEv0t+X+R1Xw8umXwN4pt7P
T7TUb5TDP9juYzIssYPPyggnHX64rMg8b6m9jqUOm+E9Et1ltnhupbSykVkjIwcnfgfjXI2GqX2l
6gt/Y3UtvdKSRLE2089fw9q2dU+IPirWbF7K+1iWS2kGHjVEjDj0O0DP405ahHQ1fhP83i6eIcvL
p9wiL3ZtvQflXH2SsmqW6spVlnUEEYIO4UyyvbnTr2K8s53guIm3RyIcFTWtrXjHXvETWzarf/aD
asXhPkxptJxz8qjPQdaadpKXb/O5LV4uP9bHS/EvTL3Vvixf2djbSTzymFVVFJ6xr+Q96i+LV1DJ
4ut7GGRZP7OsorV2U5G8ZJH61Sufin41u4Ghk12UIwwTFDHG3/fSqCPzrkXdpHZ3Ys7HJYnJJ9ah
KyS7Ft3bZ3Xxakd/F1urMSE0+AKPQbc/zNQWX/JHdT/7C8P/AKAa5jVtZv8AXLwXeoz+fOI1jDbF
X5VGAMKAKRNWvo9Gl0lJ8WMswneLYvLgYBzjPTtnFV0fm/1uJbryX6WPXZjn4oajn/oXD/6IFct4
uR5Pht4FVFZmMdyAFGSfnWuYPi3XG1STUjff6ZJbfZXk8pOYtu3bjGOg64zV/TfiP4s0jS4dNsNW
MNpCpWNBbxHaM56lc9/Wh6/15y/zCOlv66JfodJrA/4R34Z+GNK1KMx3U1+b+SBxhkiBI5HbII/W
tH4i+IpdL8UySN4W0C+tLpEktr25tHdplKj+IOAcdPpivK9R1K91a8e81C6lubh/vSStuP0+ntWz
pPj3xRodkLPT9Ymitl+7GyrIF/3dwOPwoeur/rp+iBaf18zobHxLd6h8SvDV5r2n2+mpbiOGKOOF
okEeTsbDE8ZPXpgVzvjHS9QtPG2p21zbym4lu5HjG0kyBmJUr65BrJ1TVr/Wr5r3UruW5uWABkkO
TgdAPQe1btr8R/F9nYrZQ65cCFV2ruVGYD0DEFh+dLt8/wAQ/wCB+Bs+EIJrn4feNNMgjb+0AsMh
iA+cojncMdeKb4DiktfCHjK/uFK2Taf9nDMMBpWPygep/wAa43T9Z1LStSGo2N7NBeZJMqtyc9c+
ufer+ueMvEPiSFIdW1OW4hQ7hHtVFz6kKACfc0PW/mrfoC0+TudH4rje7+GPg+7tlLW1us0ExUZC
Sbh19M4NW/EME2mfDnwMNQjZdtxLKyOOQhcMOPoa4/QvF2veGklTSNSkto5Tl02q6k+uGBGfeotW
8T6zrlrDbanfvdRwyPInmKuQzHLHdjJ/E8dqpvW673Elok+1j0j4i+IpdL8UySN4W0C+tLpEktr2
5tHdplKj+IOAcdPpiuD8X63qeuX9nLqmmwae8NqkUMMMLRr5QJ2nDEnHJpdJ8e+KNDshZ6frE0Vs
v3Y2VZAv+7uBx+FZOqatf61fNe6ldy3NywAMkhycDoB6D2qbWsO51/xakd/F1urMSE0+AKPQbc/z
NcHV7VtZv9cvBd6jP584jWMNsVflUYAwoAqjR3+Yui9EFehGGXUvglAlgjSNYamz3iIMlVZTtYj0
5AzXntaWja/qvh67N1pN9LaykYYoeGHoQeD+Ip7pr+t7hs0yibeYWwuDDIIC2wSbTtLdcZ9a7jV5
HHwY8PRhiEbUJyR6kZx/M1zmu+LNd8S+UNX1GS5WIkohVUVT64UAZqpNrN/caNbaTLPusbaRpIot
ijazdTnGT+JpPVNen5j6p/1szqfhLcwW3xCsvOKAyxyRRF+m8qcfn0/GrbeLdT0rxB9lj8D+H4tU
gm+RY9Pk8wODwRh8/QivPlZkdXRirKcgg4INdWvxN8ZJaC2GvT7ANoYohfH+/t3frVN7MS6o2dCi
hvLXxb4t1TSIL7UrSZWFi6t5Ubu53MyZyQPQnsfrWzo+o3es/DbxZey6HpWn232dUiksbMQeaQ2T
kj7wHH515rpPiTWNC1CS/wBN1CaC5kz5j5Db8nJ3A5B59avXvjvxNqKXaXmqyTJdxCGZGjTaUBzg
DGF5/u4qWvdsu1ik9bvvc2fhaC+r61EoLSSaPcqijqxwOBXF2bpDf28kwzGkqs49geak03U73R7+
K+0+5kt7mI5SRDyP8R7Ve17xXrXiUQjV7tbjySSmII48E4z91RnoOtVe0lJf1qybXTT/AK0Pb4pp
ZviJfObG1jtZLNZbe8hjIa5Rtn3myQ23GBjGM+9emWn/AB5Qf9c1/lXz38JNRvLq/uLS4uZZbe1t
j5EbtkR7mXIHoOBxX0Jaf8eUH/XNf5VNraFXuTUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAF
FFFAHMan4G0zVfGmneKZ5LgX1ggSJVYBCBu6jH+0a6eiigAooooAKKKKACiiigAooooAKKKKACii
igAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKK
ACiiigArL13Rl1yxWzkmaOEuGfb1YDt7c1qUUAZVp4esrXYX825dAArXEhfGPTPStXoMCiigAooo
oAKKKKAPOPij/wAizrf/AFxX/wBlr5rFfSnxR/5FnW/+uK/+y181imJi0UUUCCiiigAooooAKKKK
ACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigD6T+EH
/JO7L/fl/wDRjV3TfdNcL8IP+Sd2X+/L/wCjGrum+6aRR8e6ZYnU9Sgshc21qZm2+ddSbI092bsK
7ST4UX0VnFeSeJvDCWspIjma/YI5HUBtmDXAV6Br/wDyRnwr/wBfdx/6E1OWkbkrexymh+HdR8Ra
r/Z2mxpJKAWdy2ERR1Yt2FaOu+B9S0PTV1L7Vp+oWBfy2udPuPORH/utwMGtzwcPs3w18ZXkbbJn
FvbmT+6jNhv0NbGi6TYadpfjPRrLWIdWsW0lbrzoh8qyLkgdSMjiiWl/Jf8AB/L8Rx1+/wD4H5nF
aH4H1LW9MbUzc2GnaeH8tbrULgQxu3opwc1S8Q+GdR8M3ccF+sbLMnmQzwvvjlX1Vu9dnqumX3iT
4XeF20O2lvFsGmiuoLdS7pIWyCVHPI7+9W/Emhz2Xws8L2mpjbew6gYnjJy0SyZbYfQ42nHam1rZ
d0hJ6XfZs5rTfhtrOoWFrdPd6ZYteDdaW97dCOW4HbYuDnP4Vhw+HNSl8Rf2C8SwX4cxskzhFUgZ
OT0xgZzXoXxD06yvvFmvT3Gtw2EukW0C2Nqw5m+QNtXkY5PbPWsf4uKH8TWF5gCW702CaX3bBGfy
Aqb7Pp/Vvy1Hbp/XT/Mqz/DHWFtJprLUNH1OSFC8lvYXgklVR1O3A/SuKr1fwDp2gaVd/wBsaTrU
uta1Das8elxQG3JYr8wy5+fGT930zg15XM7STyO67WZiSMYwc0PSVgWquMrqPDPgPVvFNt9ptJrG
3t/N8kSXU+zc+AdoABJPI7Vy9bvgv/kd9D/6/of/AEMVcVd2Jk7K5n6vpk2javd6bctG01rKYnaM
kqSPTIBx+FdJpvw21nULC1unu9MsWvButLe9uhHLcDtsXBzn8KreMoxN8StWib7r6gyn8Wrr/iHp
1lfeLNenuNbhsJdItoFsbVhzN8gbavIxye2etRF+4m+pbXvuK6f5nmOoWF1pd/PY3sLQ3MDlJI26
g1Wrv/i4ofxNYXmAJbvTYJpfdsEZ/ICsXUn8LnwVpa2ETjxAJD9scmTBT5sdTt/u9BRqlr0dhaN6
epX8OeE9R8TG5a0ktYILYKZ7i6mEccec4yevY9BVrXvAmq6Dpq6kZrG/08tsN1YT+bGrehOAR+Vc
zuYIU3HaTkjPBNehW27wt8KdRi1A7bnX3j+yWrdVjU5MpHYHt+FOWzaBb2Zk6N4AvNZ0KPWDrGi2
FrJK0Sfb7kxEsvX+Ej9ayfEGgHw/cxQHVNM1DzE379PuPNVecYJwMGuo0vXPCM/gOx0PxA+rCSC7
kn/0BE4zwMl+PyrL8X+FLXRLXT9V0i+a+0bUVJglddrow6qw9fy6GiWj8v8AgBHVef8AwTlKK6XQ
H8Lr4e1tdaidtUMY/s5gZMK+D12nHXH3qydF0m513WLXTLNczXDhQT0Ud2PsBk/hRbWwulzV0PwR
q2vaDqOs2zW8VnYozuZmYGTau5ggAOSBjrjqKp+HvDOpeJ7uSDT0jCwp5k08z7I4l9WbtXpmianb
XB8U6VpjZ0rS9Bnt7c/89G/jkPuzc/TFc/4Ghk1XwF4s0XT/AJtUmWGWOIHDSxq3zAev096L7tdr
/i1/wR22T72/L/hjA1zwRqWiaYupi60/UdPL+W11p1wJkRvRjgYrmq9X8JeGtT07wB4wXWLWW0Se
z3wwXClHZo8kvtPOASvNeUUtnYOlxQCSAOpruU+FOtkpDLqOiwXzjK2Ml8BO3sFAIz+NcLW54W0W
+8ReIre3tmZSriaa4Y8QoDlnY9sfzqkr6Et21M+60q/stVfS7i1kS+STyjBjLbuwGOue2OtdXJ8L
tZt4f9J1HRre72b/ALDLegT4xnG3GM/jXUaTqVl4r+PQvrUK9vEreSzD/WGOMgN+YyPwrKXw74U8
Q+IbjSF13U5PEM0j5u5Ik+yyzckqP4sZyMmp1cV3Zel32Rxfh7w5f+Jr57Sw8kNHGZZHmlCKiggZ
JP1FWPFPhK98JXVrBe3FpObmETRvayF1Kk46kD07Vj3dtLZXk9rOu2WGRo3HowODXc/E3/j28Jf9
gWGhvRNf1oxJatP+tUYXh/wbqXiGznvo57KysIGCPeX03lRBj/DnByaq+IfDOo+GbyK3v1iZZk8y
CeF98cq+qt3rvZtNs73wL4H0e71OLTLK8a5uJ7mQfKHB4zkgd8cmqHiGJH+EGlHz1ufsOqzWsE4H
34/mOR7HApy0b8v+G/P8Ajql5/8AB/yKMXwu1WUIn9r6Cl04Gy0a/HmsT2AAxn8a5k+H9VGv/wBh
myk/tLzfK8jvu/ljvnpjmt7wdofhjUpLeXV/E5sLnz8CzFs2XAxg+aTtXPTnpXYWOsl/j49xqlod
Odw1vEkxBKny9qEkcEn2OOadtV8yb+62cndfDHWYLe5aC90m9urVC89laXYknjA65XHb2NcXXqng
Hwh4j0r4kw3WoWVxa29vK4muZQVSTcCoCseG3EjpmvPvEVvHa+JtVt4gBHFdyooHYByBU328y2t/
IzK6vR/AGpatpMWpvf6Vp1nMSIZL+7EfmYODgYJ6jvXKVNBDcXtxDbQpJNK5EcUa5JJJ4AH1NUiT
V17wrqnhvUIbTUUjQTgNDOj7opFP8Qb0rdHw0kJAHjDwkSeg/tP/AOxqfx/cR6foPh7wo8yz32lx
O126nIjdznywfYf0rM+HWjx6t4wt3ucCysVN5csegROefqcClGzflrr5A9Ff8CprPg3U9H8Tx+Hi
0F5qEgTatoxYZboMsBzjn6VrSfC7WR50VvqGjXd/CpaTT7e9DXC46jbjqPrTdD8SX178WIddgs5L
24nu2ZbdT8xRgVwCeBhT344rsdE0Xw/p3jq51HRde/tLWITLLBpLL5ZaQg5QzZKtjJ6elJX5U35j
drtLyPMdA8M6n4kvpbWxjQGFC88sz7I4VHUsT0rR1fwHqWl6TJqsN5pmp2MTBZptOuRMIiem7gEV
u+BLiS7k8VadqcEsFlfQk314mF+xkMTk7iOMkjb1OOlW47Gx0T4e+ID4Z1Ma8LrZHeyiMwfZYwTh
vLbk5yRnp+VDel/IaWtvM5nR/AGpatpMWpvf6Vp1nMSIZL+7EfmYODgYJ6jvWb4i8L6p4XvI7fUo
kAlXfDNE++OVfVW71mQQ3F7cQ20KSTSuRHFGuSSSeAB9TXfeNXitdN8MeD5JlnvdPB+1upyI2kYf
uwfYf0qrXat1dib737GTpfw71fUdLh1Ke70zTLWfmBtRufJMw9VGD+tY0vh7UE8Rf2FFGlzfGQRq
tu4dXJGQQ3TGDnNenfEOy8JxeLRB4h1LU1YQxx20FhGhS1iAAG/d1ycnCjpWd4X0aLwT8X7Sxuru
OSCaFjaXRG0MJEIQ+xzx9aSd35a/16g9F5mDdfDHWYLe5aC90m9urVC89laXYknjA65XHb2NcXXq
ngHwh4j0r4kw3WoWVxa29vK4muZQVSTcCoCseG3EjpmvPvEVvHa+JtVt4gBHFdyooHYByBSvt5lN
b+RmV1vhrwDd+KbaKSz1rRIZpWZVtLi6KznHfYFJx3rkq7P4U/8AJStI/wB6T/0W1XFXdiJOyuZX
iTwtJ4aMKy6vpF+0jMpWwufNMZXH3xgY6/oawau6x/yHL/8A6+ZP/QjXpni7VtC8J6/Z29r4V0i6
aW0hkuTcQAgAjoijAU9y2CST7VENYp9y5K0ml0PJq0tV0K90aGwlu1QLfW63MO1s5Q9M+hrpfFsN
p4N+IVw2nafZz2rRrLFbXkIljUOoONp9CTj0rpfGvi57Cx8NMNC0Gf7TpUcpFxYK4jzn5U/ur7UX
92/n/n/kK2vy/wAv8zyOivQPh54WXWrfVtak0v8AtRrIKLewDBFllY/xHI+VRzjvXRXvhS/1jw3q
7634OsNDuLK2a5tbqwRY1YryUdQxzkd6ctFqC1ehx3hjwfpHiW1ZY/Ebw6mkEk72f2BmACZ/5abg
DkY7d65GGJpp44lIDOwUE9Mk4rt/hT/yNN5/2Dbj/wBBrjtP/wCQla/9dk/mKpK80u9vzZLdoN+v
5I7a5+EmswXL2ceraFcX6jP2KK9xMeMj5WUdq4a7tLixu5bW6heGeJikkbjBUjsa7T4rTSW/xS1C
aJ2SSMwsrKcEERqQRU/xejQ+KbG9ChZL3ToZ5cd25GfyArNNtJ9y2rNr5/19559RXrXjPUtA8Iax
bxWPhjSru7ntIpJftUAMUY28BUGBuOCS3uKo6fqekx+DdY8RjwzpTzf2pEkME0O+OIFOQOh29Tjp
k+1V38v87E9vP/K55nXZ2Hw3v77RLHVH1nQ7OK+UtBHd3Zid8HBABXBP0PcV22pWGgTa/rHhy38P
6fBC+ktfpcLGfOjm2BxtbPC/7IFct4x/5Jp4G/653P8A6GtJuy/rz/yGld/f+j/U5TXvDup+Gr/7
Hqlv5UjLvRgQySL6qw4IrKr0jUo5NX+DXh6ST57mDUms4WbrsbOB9OB+VdLeeEtS8OSRabongTT9
Xt40X7RfX6rI87kZbZlhsA6dKdrb/wBdRb7f10PEqK9E8SeBYY/iLpWj2kT2UOqpFMYGbcbbcTvX
PfG04pur+KtD0TV7jR9N8IaNcafayGBpbuIvPKVOGbzM5XJBxSvp/XQdv69Tz2iu58H6dpJsPEHi
jULBbi001V+z2TsSjSOxChj3A4+tXYW0zxz4W1uU6Hp2marpUIuopNPi8pJIwfmVlyeff/JHovxB
a/kec1u6h4c+w+EtJ137Xv8A7QklTyPLx5ew4zuzzn6CumiGm+DPA+kak+jWGp6pq5kkzfx+ZHDE
pwAFyOTnOat+M3tNU+H/AIRfTLRbSO5uJ8W6sSqSFgGAz23Zx7U2ui7pCXRvz/I8xor2288Jal4c
ki03RPAmn6vbxov2i+v1WR53Iy2zLDYB06VwXxH8OW/h3xHClrbtaw3dslyLZm3GBjkMme+CDSvq
NI4+ivWvGepaB4Q1i3isfDGlXd3PaRSS/aoAYoxt4CoMDccElvcV5jq15DqGqT3dvZRWUUrbhbxf
cTjkD2zT62Dpcp0UV3mhWWleH/A7eKtR06HUru5uja2VtcZMS4GWdgPvdCMUdLi62ODorf13xFa6
7bwgaBpunXUb5MthGYldcdCmSM5713fjPV9C8J65a2ln4U0e5aW1ikujcW4IwR0QDAU4GS2CST7U
AeS0V6nH4Y0my+L+iQQWscmk6lEl3HbTqHVVdGO0g5yAR3pLHVPDep+Mn8KN4X02PS57h7WO6RCL
pXyQH359e2MDNGrsuuv4Bpv00/E8toq/qNgNK1660+c7ltbloXPqFbB/lWn4zfw0+tqfCsbR6f5K
5DF8+Zk5++SfSle6TXUdrNrsT6N4FvdZ0yPUDquj2FvKSIzfXgjLYODgYJ61n+IvC+p+GLqKHUI4
9sy74Z4XDxyr6qw603w/p+j6jdyR6zrf9kwqmUl+ytPvbP3cL045zXW/EVorPQ/Dek6cklxpVtE7
2+ouysLksQW24PAB7Hn2pvoEdbozbX4a6tNa20t3qGkadLdKHgtr68Ec0gPQhcHr71zeraRe6Hqk
2najAYLmE4dSc/QgjqMV6j4l0zQPEeq6XqPiHW30DUp7eIS2EsPmHA6EMpxGD/tflXIfE65vrnxx
dG/s/srIiRxJv37owPlbcOuev6dqT0fzYLVfJDNX8I6baeEU8Q6XrzahCboWrI1kYdrbSx5LHPbt
3rkq7of8kPb/ALDg/wDRVcLTfxNf1sg6L+urCut8NeAbvxTbRSWetaJDNKzKtpcXRWc477ApOO9c
lXZ/Cn/kpWkf70n/AKLaqiruxMnZXMrxJ4Wk8NGFZdX0i/aRmUrYXPmmMrj74wMdf0NYNXdY/wCQ
5f8A/XzJ/wChGvTPF2raF4T1+zt7XwrpF00tpDJcm4gBABHRFGAp7lsEkn2qIaxT7lyVpNLoeTVp
aroV7o0NhLdqgW+t1uYdrZyh6Z9DXS+LYbTwb8QrhtO0+zntWjWWK2vIRLGodQcbT6EnHpXS+NfF
z2Fj4aYaFoM/2nSo5SLiwVxHnPyp/dX2ov7t/P8Az/yFbX5f5f5nkdFegfDzwsutW+ra1Jpf9qNZ
BRb2AYIssrH+I5HyqOcd66K98KX+seG9XfW/B1hodxZWzXNrdWCLGrFeSjqGOcjvTlotQWr0OO8M
eD9I8S2rLH4jeHU0gknez+wMwATP/LTcAcjHbvXIwxNNPHEpAZ2CgnpknFdv8Kf+RpvP+wbcf+g1
x2n/APIStf8Arsn8xVJXml3t+bJbtBv1/JHbXPwk1mC5ezj1bQri/UZ+xRXuJjxkfKyjtXDXdpcW
N3La3ULwzxMUkjcYKkdjXafFaaS3+KWoTROySRmFlZTggiNSCKn+L0aHxTY3oULJe6dDPLju3Iz+
QFZptpPuW1ZtfP8Ar7zz6ivWvGepaB4Q1i3isfDGlXd3PaRSS/aoAYoxt4CoMDccElvcVR0/U9Jj
8G6x4jHhnSnm/tSJIYJod8cQKcgdDt6nHTJ9qrv5f52J7ef+VzzOuzsPhvf32iWOqPrOh2cV8paC
O7uzE74OCACuCfoe4rttSsNAm1/WPDlv4f0+CF9Ja/S4WM+dHNsDja2eF/2QK5bxj/yTTwN/1zuf
/Q1pN2X9ef8AkNK7+/8AR/qcpr3h3U/DV/8AY9Ut/KkZd6MCGSRfVWHBFZVekalHJq/wa8PSSfPc
wak1nCzddjZwPpwPyrpbzwlqXhySLTdE8Cafq9vGi/aL6/VZHncjLbMsNgHTpTtbf+uot9v66HiV
FeieJPAsMfxF0rR7SJ7KHVUimMDNuNtuJ3rnvjacU3V/FWh6Jq9xo+m+ENGuNPtZDA0t3EXnlKnD
N5mcrkg4pX0/roO39ep57RXc+D9O0k2HiDxRqFgtxaaaq/Z7J2JRpHYhQx7gcfWrsLaZ458La3Kd
D07TNV0qEXUUmnxeUkkYPzKy5PPv/kj0X4gtfyPOa3dQ8OfYfCWk679r3/2hJKnkeXjy9hxndnnP
0FdNENN8GeB9I1J9GsNT1TVzJJm/j8yOGJTgALkcnOc1b8Zvaap8P/CL6ZaLaR3NxPi3ViVSQsAw
Ge27OPam10XdIS6N+f5HmNFe23nhLUvDkkWm6J4E0/V7eNF+0X1+qyPO5GW2ZYbAOnSuC+I/hy38
O+I4UtbdrWG7tkuRbM24wMchkz3wQaV9RpHH0V614z1LQPCGsW8Vj4Y0q7u57SKSX7VADFGNvAVB
gbjgkt7ivMdWvIdQ1Se7t7KKyilbcLeL7iccge2afWwdLlOiiu80Ky0rw/4HbxVqOnQ6ld3N0bWy
trjJiXAyzsB97oRijpcXWxwdFb2veIrXXbaEDQNN066jcky2EZiV1x0KZIznvXXWZ0HR/hbpGtXm
i2t9fm7mjiWRABIcnmQjllUDhc96OjbDqkeZ0V3ukR2nxH8Y6XYnR7HSkVXa5/s5PLWRFGeF7HjG
feuztPDmoXuqLpl78NtOtdCkfy/Pj2i5iXoHMm/JI6niizA8PortdD0u507xfqulWfhyHxBdW8jw
xrcAmOPa2N7DIHPuQOa6fWvDNzf+DNXvtY8MaVo19YKktvLpjIFkXOGV0V27dzSv7vMO3vcp5ro2
hXuvTXMViqFra3e5k3tt+ReuPfmsw16p8MPETEajY/2VpOLXSZ5BOLQebLjHEjfxA55H0rh9W1uX
xJLawLpOk2Th9q/YLQQ7y2B82OtNr3rL+tWJbXf9aI6v4Of8hvUf+vYf+hCvo60/48oP+ua/yryn
QfDkXhfXxp0GnGKJLM5vmfLXcmULHGeAuQAPc16raEfYoOf+Wa/ypFInooyPWjI9aACijI9aMj1o
AKKMj1oyPWgAooyPWjI9aACijI9aMj1oAKKMj1oyPWgAooyPWjI9aACijI9aMj1oAKKMj1oyPWgA
ooyPWjI9aACijI9aMj1oAKKMj1oyPWgAooyPWjI9aACijI9aMj1oAKKMj1oyPWgAooyPWjI9aACi
jI9aMj1oAKKMj1oyPWgAooyPWjI9aACijI9aMj1oAKKMj1oyPWgAooyPWjI9aACijI9aMj1oAKKM
j1oyPWgAooyPWjI9aACijI9aMj1oAKKMj1oyPWgAooyPWjI9aACijI9aMj1oAKKMj1oyPWgAooyP
WjI9aACijI9aMj1oAKKMj1oyPWgAooyPWjI9aAPOPij/AMizrf8A1xX/ANlr5rFfSnxR/wCRZ1v/
AK4r/wCy181imJi0UUUCCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoo
ooAKKKKACiiigAooooAKKKKACiiigD6T+EH/ACTuy/35f/RjV3TfdNcL8IP+Sd2X+/L/AOjGrum+
6aRR8e6ZYjUtSgszdW1oJW2+fdSbI092bsK9U1Pw5Y3ngDRdBj8YeGBdWE0skjtqK7GDEkY4z39K
8gopvVWJWjudt4H1XTorXW/Der3a21pqsIRLojKRyoSVJ9vf2rQ/4lngbwfrNnHren6pq2rqsCjT
5PMjiiH3iWwOTnp9K85ooev5DWn5nXeFNIlurN7qz8ZWOiXG8pJFPdtbsV4wQR97qeParXjPW7CL
StL8O6PfNfx2Mj3FzfHOJ52PJGeoHPNcPRQxI9R1uz0Lx9qFn4hHiTTdNLwxrqNtdybJUZRgmMY+
fI6Vj+I9R0rxt49YHUk03S44Rb21zNGSuEX5cjqATn6ZrhqKNP6/r7g6HqHhnQtE8G63D4g1Lxdp
F1HaBnit9PmMssrYIAIxx1rzjULoX2pXV2ECCeZ5No/h3EnH61WopdRhXZ/D/RYLjV7LWLjXdHsI
rK8R3hvboRSOFIYlQRyO3XrXGUVSdnclq+h3PxC0mG31y81601/Rr6O7vGeOGzuxJKgOSCwA4HHr
WxrdnoXj7ULPxCPEmm6aXhjXUba7k2SoyjBMYx8+R0ry6ipirJLsU3d37nUeP/EFt4j8VS3NiD9h
hjS3tsjBKIMZx7nJpmpaJo1r4J0vVbbVVm1S5kK3FmJUJiX5sHaPmHQdfWuaootpYL63O3+HGj6J
fX9zfa1qOnQizAa3tb64WFJ5DnG4nnaMc4B6ip/F2gXd+97rt/4w8NX04G4QWt/ufA6JGuOg9K4G
im9RLQ67S/Bljq2l293H4t0S0lcHzre+m8l4zkjA67uOe3WrfjTVNJt/DmjeFdIvRfx6ezyz3arh
HkY9F9hk/pXDUUPXQFodLoGiaNqPh7W73UNVW0vbOMNaW5lRTO2CcAHk8gdPWqfhnxLdeFtUa/tL
e1uJGiaFo7pC6FW68Aj0rGoo63Doeu+EPiBZy2+um70bwtppTTpGiWK1EP2l+0bAt84P90da4bSY
l8Q+Irm5Gqad4embMsTAmCFWyPlUj7nGa5uijrcOlj0vVNRtfDXhjU7R/Eaa/ruqosEk0MzTRwQg
5I3nqT/n34/wlpemaz4it7LV9QWwsnVi9w0ioFIUkctxyeKxKKFvdg9rFu/toINXubW2nWS3jnaO
ObcCGUMQGyOOnNer3vh+wtfDEeg+HvF/hi3hnAbULqbUVWW5b+7wDhB6Z/rnx2ij7Nh9bnY6LcR+
APiBY3El/ZajBCf3s2ny+ahRwQcHjJAOcV0Ol6J4e0HxaviaTxbpU+lwStcwwQyFrlzyVUx44OT/
APqry2ii70fVC01XRm/Ba/8ACX+KL6RtQ0/TPtEklx5l/P5UYy2du7HXn9K7jx7otjqel6XPaeKf
D0h0rS1gkiW/VnlZASQgHXPbpXlFFK3uqKHfVtnoWny6b4u8BWWgXOr2Wmappc7tbvfP5cUsT8kb
uxB/l+UHizUNLtPD2ieEdO1CO8jtJGnvLyEZjaRj/D6gAnn6VwlFN6sS0R3kfgDR3nWUeO9BNhnL
OZSs232jPf2zVbxrq+m+K/HcbWlyLfT1WK1W7lU/dXjzCOuOfyFcZRR28h9z1fTPsnhW4i1nW/G1
trS2Sl7HT7S7efdJghcg8IBmvLrq5kvLya6lOZJpGkc+pJyahopdbh0sFep+CdL07T/C7atZeIdB
t/EV0GSNtQvFj+xJkglV5O8+pAwD+fllFPpYXU6HxJ4bOipHcv4g0fVZJ5DuFjd+c4PXc3Hf1rY0
q+s9B+F+qSRXcDatrEwtvJSQGSKBeWJXOQDyOfUVw1FLo0O+qZ1Hw916z8OeM7PUL8EWoDxyOoyU
DKRux7ZrqNE0DQvDXimLxDceMNIn061kaeKO3mL3EnXapjxweea8voqr7NboVt10Z6P4f1/SNat/
Fuk6jdppZ1uYXFvcSj5EYOWCsR0HTn61JZR6V4F8M68s2vabqmoanbG1hg06UyqoPVmbAx16V5pR
U20su1h31v53PU/BOl6dp/hdtWsvEOg2/iK6DJG2oXix/YkyQSq8nefUgYB/Pj/EPh59CMN4fEOj
6pLLKSfsF35zqeu5uO/rXOUU3vdCW1men+ILHSPH9/beIIPE2ladJLBGl7bX8pjkjdRglBj5x/n6
YvjTVdM8TeMrOCzvBDpttDFZJeSqcbV6uR1xz+lcVRR18tw6fger6Z9k8K3EWs6342ttaWyUvY6f
aXbz7pMELkHhAM15ddXMl5eTXUpzJNI0jn1JOTUNFLrcfSwV6N8L9KtLTXNP8R3niHRLSGF5A1tc
Xgjn+6VztPGOfWvOaKpOxLV9DpfGGhR6VftdR63pGopdzSOFsLnzTGM5+fjjr+hq98TL60v/ABVB
NZ3UNxELKBS8MgdQQvIyO4rjKKlKyS7FN3dzsvide2moeMDPZXUNzD9lgXzIZA65CDIyO4rW1Sys
fGfh7w9Naa/o9ncWFiLS4t9QuhCwKngjI5Brzein0t53/P8AzF/lb8v8jtfB2qaZ/ZOteF9ZuxaW
2o7GhvMbkilQ5BOP4TxzVe+8G2Gmafc3Vz4t0Sd0QmCCxlM7yt2B4G361yVFD1GtDrPh1q9lo/it
JNRl8m1uIJLZ5sZEe9cAn2ziq+p+HU8PX9jJ/bmj6hHJOMGxuhIUAI5cY+Xr/Oubopp2afYm1013
PXfGPh/Qtd8a3Ou3PjHQ4tLk8sskFz505CooICL3OD3NcR478SReKPFEt7bI0dnEiwWytwfLXoT9
Tk/jXM0VKVrLsU2dl8Tb20v/ABVHNZ3UNzELKBS8MgdcheRkdxUdpeWq/CnUbNrmEXT6pFIsBcb2
UIQWC9ce9cjRT6Pz/wA7h28v8rHrkmsaWfiNfXQ1Kz+ztoJiWXz12F/JA2g5xuzxjrVa60yw8T/D
/wAK2yeJdDsZbGObz47y8CuNzDGFGTnjvjtXllFD1/r1/wAxLT+vJL9Du/FWv6bZaLo3hrQLo3kG
mSG4mu9hVZZic/KD2GTV/wAQ6do/jzUR4g0/xHpWnT3KJ9rtNSmMLRyBQDtODuHHb/8AV5rRR6j9
Dp4ZrTwZ4z0+7sNRi1WO0dJJJYVKqx/iVc9eO9beseFdD1vV7jWNN8X6Nb6fdSGdoruUpPEWOWXy
8ZbBJxXntFAjufB+o6SLDxB4X1C/W3tdSVfs966kIsiMSpYdgePpV2FNM8DeFtbiOuadqeq6rCLW
KPT5fNSOMn5mZsDB9v8AI85opPX8hrT8z0OL+zfGfgfSNNfWbDTNU0gyR4v5PLjmiY5BDYPIwBip
PF93pNj4K8LWOj6rb301hPM0jRsM79wJbb1Ck5wT1FecUU2+3e4keleIdO0fx5qI8Qaf4j0rTp7l
E+12mpTGFo5AoB2nB3Djt/8Aq4jXdOstL1EWtjqkWpIqAvPChVN/cDPUDjmsyii1th37nZfE29tL
/wAVRzWd1DcxCygUvDIHXIXkZHcVyESq8yK7bVLAE+gplFC0dxPax0XjTRtH0PW1tNE1RdRtTCrm
ZZUkAYk5GV47D862tCvdK8QeBm8K6jqMOm3dvdG6srm4yImyMMjEfd6k5rg6KFtZj63Rva74dttD
t4SNe0zUbqRyDFYSGVUXHUvgDOe1eiePvDWm674itJf+Eh03TZ47OFbmK+kMZ27chk4w3Bxjjp71
473rd8WeI/8AhKNZXUPsv2bEEcPl+Zv+6MZzgdaHt8/0F1+X6o7yy1yy1r40aAumMXsLGNbOCQjH
mKiN82PqTUVpo/h7SPGsvieXxNpx062uXuEs1c/ai4JIjMeOzd844rgvDGt/8I54kstX+z/aPszl
vK37N3BHXBx19Kzry4+13s9zt2ebIz7c5xk5xmjVWa31/GwaO6e2n4XLOo3v9r69dX0v7v7XctK3
P3dzZ/rWn400bR9D1tbTRNUXUbUwq5mWVJAGJORleOw/OudopWskl0He7bZ1umeDtO1bTLe5i8Xa
Nazuv762vpDC0ZyeAed3HP41p+KtU0fS/DeheGtMvo9UfT52ubi5jH7ssTnYp7jn+Vef0U79hep6
l4o0rRfHGujxDY+K9JsoLlE+0W99MY5oSqgEKuPm6VznxG12w13xHEdMdpbSztY7RJmGDLtz8361
yFHQ0rLboO53Q/5Ie3/YcH/oquFrf1fxpr+vaamnajfLLaI4kWNbeOPDAEA5VQehNYFPq3/WyQui
X9bhXo3wv0q0tNc0/wAR3niHRLSGF5A1tcXgjn+6VztPGOfWvOaKadhNX0Ol8YaFHpV+11Hrekai
l3NI4WwufNMYzn5+OOv6Gr3xMvrS/wDFUE1ndQ3EQsoFLwyB1BC8jI7iuMoqUrJLsU3d3Oy+J17a
ah4wM9ldQ3MP2WBfMhkDrkIMjI7itbVLKx8Z+HvD01pr+j2dxYWItLi31C6ELAqeCMjkGvN6KfS3
nf8AP/MX+Vvy/wAjtfB2qaZ/ZOteF9ZuxaW2o7GhvMbkilQ5BOP4TxzVe+8G2Gmafc3Vz4t0Sd0Q
mCCxlM7yt2B4G361yVFD1GtDrPh1q9lo/itJNRl8m1uIJLZ5sZEe9cAn2ziq+p+HU8PX9jJ/bmj6
hHJOMGxuhIUAI5cY+Xr/ADrm6Kadmn2JtdNdz13xj4f0LXfGtzrtz4x0OLS5PLLJBc+dOQqKCAi9
zg9zXEeO/EkXijxRLe2yNHZxIsFsrcHy16E/U5P41zNFSlay7FNnZfE29tL/AMVRzWd1DcxCygUv
DIHXIXkZHcVHaXlqvwp1Gza5hF0+qRSLAXG9lCEFgvXHvXI0U+j8/wDO4dvL/Kx65JrGln4jX10N
Ss/s7aCYll89dhfyQNoOcbs8Y61WutMsPE/w/wDCtsniXQ7GWxjm8+O8vArjcwxhRk54747V5ZRQ
9f69f8xLT+vJL9Du/FWv6bZaLo3hrQLo3kGmSG4mu9hVZZic/KD2GTV/xDp2j+PNRHiDT/EeladP
con2u01KYwtHIFAO04O4cdv/ANXmtFHqP0OnhmtPBnjPT7uw1GLVY7R0kklhUqrH+JVz1471t6x4
V0PW9XuNY03xfo1vp91IZ2iu5Sk8RY5ZfLxlsEnFee0UCO58H6jpIsPEHhfUL9be11JV+z3rqQiy
IxKlh2B4+lXYU0zwN4W1uI65p2p6rqsItYo9Pl81I4yfmZmwMH2/yPOaKT1/Ia0/M9Di/s3xn4H0
jTX1mw0zVNIMkeL+Ty45omOQQ2DyMAYqTxfd6TY+CvC1jo+q299NYTzNI0bDO/cCW29QpOcE9RXn
FFNvt3uJHpXiHTtH8eaiPEGn+I9K06e5RPtdpqUxhaOQKAdpwdw47f8A6uI13TrLS9RFrY6pFqSK
gLzwoVTf3Az1A45rMootbYd+52XxNvbS/wDFUc1ndQ3MQsoFLwyB1yF5GR3FcbRRQIK7zQr3SvEH
gZvCuo6jDpt3b3RurK5uMiJsjDIxH3epOa4OijpYOtze17w7baHbQka9pmo3UjkGKwkMqouOpfAG
c9q1dVvbST4U6BZpdQtdRXs7SQLIC6A9CV6gGuMopdGh9UzovBHiCLwz4rtNRuEZ7Ybop1XrsYYJ
H0zn8K2J/A2jS3b3Ft420JdLZiyNJKftCr6GLGcj61wtFNiR3/hC60xtF8TeHBrMOnzXxT7LfXBM
cciox+Vj/CCP5mtLTbXRPDfgrxTYP4g0681W6tV4tpgY8BuFRjje3UkAccV5dRSeqa7qw07P53Ow
+HOp2Ona/dRajcrawX1jNaee/wB2NnAwT7cVmaxob+Gp7WdNY0i/YvuU2F0JtpXBBYY4zWFSGnfV
NC6WZ7r4a1DStd8WXOvadc5mvrMfa7Vlw0EilB17g9voa9etI0NnASi58te3tXzn8HP+Q3qP/XsP
/QhX0daf8eUH/XNf5UrJbFeo/wAqP/nmv5UeVH/zzX8qfRQAzyo/+ea/lR5Uf/PNfyp9FADPKj/5
5r+VHlR/881/Kn0UAM8qP/nmv5UeVH/zzX8qfRQAzyo/+ea/lR5Uf/PNfyp9FADPKj/55r+VHlR/
881/Kn0UAM8qP/nmv5UeVH/zzX8qfRQAzyo/+ea/lR5Uf/PNfyp9FADPKj/55r+VHlR/881/Kn0U
AM8qP/nmv5UeVH/zzX8qfRQAzyo/+ea/lR5Uf/PNfyp9FADPKj/55r+VHlR/881/Kn0UAM8qP/nm
v5UeVH/zzX8qfRQAzyo/+ea/lR5Uf/PNfyp9FADPKj/55r+VHlR/881/Kn0UAM8qP/nmv5UeVH/z
zX8qfRQAzyo/+ea/lR5Uf/PNfyp9FADPKj/55r+VHlR/881/Kn0UAM8qP/nmv5UeVH/zzX8qfRQA
zyo/+ea/lR5Uf/PNfyp9FADPKj/55r+VHlR/881/Kn0UAM8qP/nmv5UeVH/zzX8qfRQAzyo/+ea/
lR5Uf/PNfyp9FADPKj/55r+VHlR/881/Kn0UAM8qP/nmv5UeVH/zzX8qfRQAzyo/+ea/lR5Uf/PN
fyp9FADPKj/55r+VHlR/881/Kn0UAM8qP/nmv5UeVH/zzX8qfRQAzyo/+ea/lR5Uf/PNfyp9FADP
Kj/55r+VHlR/881/Kn0UAM8qP/nmv5UeVH/zzX8qfRQAzyo/+ea/lR5Uf/PNfyp9FADPKj/55r+V
HlR/881/Kn0UAM8qP/nmv5UeVH/zzX8qfRQB5v8AFABfDGtgAAeSvA/4DXzYK+lPij/yLOt/9cV/
9lr5rFMTFooooEFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUU
UAFFFFABRRRQAUUUUAFFFFAH0n8IP+Sd2X+/L/6Mau6b7prhfhB/yTuy/wB+X/0Y1d033TSKPj3T
J7O11KCa/svttojZkt/NMfmD03DkV6ZqA8CWPg3S/EH/AAhRcX8skYg/tSYeXsJGd3fOPQV5RXoG
v/8AJGfCv/X3cf8AoTU5fB9xK+L+uzM3wZ4f07VTqurav5q6RpcPnSxxNhpGJO1AffHWtC50nw54
n8J6lq3h/TJtKvdK2vPatctOksR43AtyCMGn+EmD/C3xlGihpEa2kZfVA/P4cGtjQtbttbs/Gepw
aTbaXaroogMMH3S/IB6Dk/SlPS6XRfpf/gDjrZvq/wDJf8Ew7XSfDnhvwfput69ps2rXeqM5gtVu
WgSONTjcWXknp+dUvFugaZFpGk+ItAjmi07Ut0ZtpW3tBKpwVDdwecfSrtrq/h3xH4O03Rdf1CfS
7vS2cW90luZ0kjY5KlQc56flW34juNJg+GPhyDThMbNNUJiknG15lXO+THYFiePTFU1d/Nfdt/Xm
JPT5P7yjf6Z4N8HT2Oja3pNzqWoSxJJe3KXTRi2LdkUcNgev/wBasHXtA07wl45NjqIuLzSRiVPK
YK8kbLleenXgn2NdR8Rdag0vxf4ks59Htr19St4Bb3Mv3oB5YGV49fQjkVlfFv5fEOlwt/rYdKgS
Qdw3PWpvtLz/AM/ysO3Ty/y/O5b0O08E+NdQOh2OgXmk3kkbtBdreNMNyjPzq3AHHavOJYzFM8bY
yjFTj2r1DwN4ufV7yPwzHplhpUl7AbdNR0y3Ec4IXq5Od2cc4wec5rzO9tXsr+4tJCC8ErRsR0JU
4P8AKh6SBaogrs/AyeErq7tbDWtMvb2/u7tYU2zeXCiNgAnaQxOc/pXGVu+C/wDkd9D/AOv6H/0M
VcNZJES0TYzxZp9vpvjDVbCyi8u3gunjij3FsAHgZOSa7C/0zwb4OnsdG1vSbnUtQliSS9uUumjF
sW7Io4bA9f8A61c94wdY/iZqrv8AcXUWLfTdXV/EXWoNL8X+JLOfR7a9fUreAW9zL96AeWBlePX0
I5FZxfuRff8Ay/U0kvfku3+f6HF+M/Dg8LeJbjTo5TNb4WW3kPVo2GRn37fhWTLpt/BYxX0tlcx2
cx2xXDxMI3PorYweh6eldr8W/l8Q6XC3+th0qBJB3Dc9a5u98U6jf+GLHw/MIfsVk5eIqmHyc9Tn
n7xp7Jrs/wBRb2fl+g/w5ceGbVbmfxBZXl9INot7eCXy0bruLt1HbGK6K80bw14j8G6lrvh+wuNK
utLZPPtZJzMjoxwCGbnPX8q4nTtOu9W1CGwsYGmuZm2oi9Sf8Peuw8R39n4Z8PP4O0qZbieSQSar
dp915B0iX/ZU9/X8actvyCO/5jNF0XQNJ8KR+JPE0E96LuVorKwhk8vzAv3nZhyBnjj9c1heIb3Q
L6SCTQ9Jn00AETRSXBmUnjBUnn1r0G98ST+HvhX4TvNKjhW+cTRLdPEshhAclgoYEAk45x0FZHiy
ZfEfw70nxRdwQpqv2t7SeaKMJ56gEhiBxkY/nRLd+T/4AR2XmcLb6bf3ltPc21lczwW43TSxRMyx
D1YgYHQ9a1PBWnWmr+M9KsL6LzbWecJIm4ruGD3BBFM0jxTqOi6Pqml2gh+z6kmyfemWxgjg546m
qOkapc6JqtvqVmUFxbtvjLjIB+lNNKXkS1ePmdfrGr+CbS4v7CHwMyzRPJCk/wDasxwwJAbaffnF
c94eu/D1m88mu6Zc6hwvkxRT+Uuec7iOfTpXeeDvG2qeM9fj8OeJUt9S0++V0w1uitCQpIZSoGOl
echxoniBmWG3uxaXBAjuE3xybWxhl7g4qVdNJ9SnZp2OuvNI8N+IvB2p67oOm3GkXGlsnnW73Bmj
kVjjhm5z/nvXAV6i2sy+OPh9rMENtb6QdKC3T2+nxCO3uFJ/iXqGGMjnB9K8uo+00HQK9R8R/wDC
EeFrqzsZvBhvZJLOKd5hqc0eSw5459K8urvLP4t+KIZoI5ZbaeyULG1o1smx0AxgnG7p71S1VkLZ
3OZiutEk8SG5uNOni0gyFvscM251XHCh26845rtNDtPBPjXUDodjoF5pN5JG7QXa3jTDcoz86twB
x2rF+Juj2ei+NbiGwiENvNGk4hHAjLDJUenPb3ro/A3i59XvI/DMemWGlSXsBt01HTLcRzgherk5
3ZxzjB5zmpjrGw3o7nE6HPoGnXN1/b+mXGolCFiihn8pcgnduYc+mMV0V5pHhvxF4O1PXdB0240i
40tk863e4M0cisccM3Of8965BWfQtfPmQW11JZ3BVop03xSFTghh3BxXoLazL44+H2swQ21vpB0o
LdPb6fEI7e4Un+JeoYYyOcH0obvC47WnYwfAyeErq7tbDWtMvb2/u7tYU2zeXCiNgAnaQxOc/pWL
4usLbTPF2rWNnH5VtBcvHGm4ttUHgZOSfxqTwX/yO+h/9f0P/oYqXx7/AMj9rv8A1+Sfzpy3Xz/Q
S2fy/U6rwrpvgnXdK1C1j0e9k1C10t7l7m4uCqiRVGdqoemTxn0rkvBnh0eKfFFppbymKF9zzSL1
VFGTj34x+NdB8LP+PnxJ/wBgW4/pXP8AgzxEPC3ii01R4jLCm5JY16sjDBx785/Cn9r5f5k/Y+f6
I6vTLTwN4q1d/DunaNd6dcSB1s9QN40hkdQSN6HgA47V5zcQSWtzLbyjbJE5Rh6EHBr1jwVaeDbb
x7Y3Wjape6jczSt9ns2tTGLcEHczuThtq56DrivN/Eksc/ijVpYiDG95KykdwXNR1Rfcy66zSNR8
FafpMH9o6Fe6rqL5M266MEScnAXbyeMda5Otzwv4an8SX7oJFtrG3Xzby8k+5BGOpPv6DvVok2PF
/h/R7HTtF8RaKs40zUw2bWd8tEyHDLu7jr+VXdP1jwTqeo21jb/D1mmuJViQf2xN1Jx6Vi+MvEdv
rE9pp+lxtDo2mR+TZo33mH8Tt7sRmtT4aW8dlc6p4puVBg0a1aSPPRpmBVB/P9KUWtW9tX8gd9Et
/wBSfUvC+iar8W08NaPH9isFcQyFZGc7lUs5BYnngj8Ku6ZY+B/EPiZ/C9v4fvbKVmkih1EXrO+5
QeWjI2gHFc14G0+78RePbRVvpbadpWuZLmP7425YkZ7n+tdponjqHxF4wfSm0a0shqLNbjUbOMR3
gJBwzSAYJOOcAUJOyXXUbau2ttDlvCfhjTZz4g1DWfNuLLRE3NBbttM7biBz2XirbaZ4Z8T+EtZ1
TSNJm0W80pUkZDdNPHMrHGMtyDwateE7G48KHxXrLXDyw6QxtHtlA2XbM5UBwQfl7+vPUVYtdVXx
z4L16ySwtdHk0+L7cE01PKhnA6rInOTxwc/yqW7x07f0/u6DS975/wBI5bRtU8H2OmRrqnhy61O+
JPmOb1oUAzxtC89PWrHjLw/pVnpOj6/oizwWOqK/+i3DbmiZTg4Pcf571i+H9e/sC7kuP7K0zUd6
bPL1C381V5zlRkYPvXWePp5fEPhnQ/FIkeKCYva/YePLt2X/AJ54A+U4788daqW1xR3sWfCum+Cd
d0rULWPR72TULXS3uXubi4KqJFUZ2qh6ZPGfSvM67/4Wf8fPiT/sC3H9KyPh/wCHE8T+LILOVS8E
StPLGCAZFX+AZ45OB+NO15fL9WK9o/P9EdN4Z8F6O3hDU7nWIGl1Z9Nlv7WPzGXyIlGEYgEZLHkA
54HvXmNe76L4X8Xz6j4tv9W0sW76jpslvaxi4iYA4wkYwxwAABzgV4jqGn3WlahPYXsXlXMDlJE3
BtrDtkEg1Ld5fL9X/wAC47WXz/Rf8ErV6B8Oo/C2s6nZaDqvhs3V3cO+b37dImAFLAbFwO2Otef1
2fwp/wCSlaR/vSf+i2q46uxEtFcz/Ft3oE139l0XQDpbW8siSubx5vNwcDhvu9D+dTwfDbxfczvD
DosjMiK5Pmx7cMMj5t2Ccds5rC1j/kOX/wD18yf+hGu4+K2pXi+KtNiS4kRLWxgeEKxGxiMlh79O
fYVnDWKb6/5GkviaXT/M4608Oate62+jQ2ZGoIWDQyusZXb1yWIH6123iD4U6rBbaS2k2AaR7NWv
N97EMTdwNzDI+mRWb8WgP+E8mkwN0ttA7n1JQc074if8g3wh/wBgWL+tO/u/O35iW/yv+RyNhpV/
qmoLYWFrJc3TEgRxjJ46/h71p634J8R+HbZbnVdLlggY48wMrqD6EqTj8a6z4fHT7LwJ4p1G7kvY
iDDBJLYBTOkbHnbuIABPX6VXsfEXgzR9F1mxsX8RTjUbVovKuo4fLEn8L8NnIPenLTQFrqSfDi+t
tTlm0S80TR5oYrGeVbiSyVpywGQS59M/oK8+s41lvoI3GUeRVYeoJrtPhT/yNN5/2Dbj/wBBrjtP
/wCQla/9dk/mKqOtRfL82S/4b+f5I9N8TW/w90XxZP4euvDVzbRoUU39vfyMy7lBzsbI4z79K4bx
f4bk8K+I59MaXzo1AeGXGPMjbkH+n4Vt/FsFvibqYAySIQAP+ua1b+L5C+JNMgY/vodLgSX1DfMe
azjrGLNHu15f5f5mJb/DnxbdXj2sOjSPKiLI2JY9oDDI+bdtzjtnNR2ngDxRfTXENvpMjyW0/wBn
mXzEGx8Zwct0x36e9dH8XNWvH16y09Z3S1gsoXEatgFyvLH1PQfhVO1u7iT4Q6vJJPI8kmrQhnZi
SwCcZP4D8qrv5f52IXTz/wArmPc+A/FFnYXd7caNPHb2hImdivy46kDOSPcZHvXUSWvhDQPBHhzU
NS8MvqFzqSSmWVL6SIrtbGQoJB4Pt0ro7ueW4+JmpxyuzK/htlIJ6gxA/wAzmuR8Y/8AJNPA3/XO
5/8AQ1pNtK3mv/bl+g4q7v5P8k/1M3xf4a06x03Tdf0KWZ9I1EMFSfBeCReqEjr3x9KqaT4C8Ua3
Yi90/R5pbZvuyMyoH/3dxG78K6eaOMfBrw9b3R2i51gsuf8Ann8wY/StP4hT+Ek8XSWuqXHiSKWy
SOOGKzSHyYlCgjy8sCP8abVm15/on+olqr/1vb9Dyi7tLixu5LW7gkguIm2vHIuGU+4ro7X4ceL7
ywW9g0O4MLLuXcyqzD1Ckhj+VdINX0Xxh8VPDctvHdGBVihna9RQ8zpnDNtJBzhRXKeMNV1G68ba
nc3FxMLiK7kSM7iDGFYhQvpgCl2+f4D7/L8TL0/RtS1XUhp1jZTT3mSDEq8jHXPpj3q/rng3xD4b
hSbVtMlt4XO1ZNyuufTKkgH2NdL4Qnmtvh9401OCRv7QKwxmYH5wjudxz15pvgOWS68IeMrC4Zns
l0/7QFY5CyqflI9D/hQ9L+Sv+oLX5uxzOheEde8SpK+kabJcxxHDvuVFB9MsQM+1dB4p0QaP8PfD
oudOS11I3FylwxiCyNhuAx6kY6VN4rke0+GPg+0tmK2tws08wU4DyBh19cZNW/EM82p/DnwMdQkZ
t1xLEzueSgcKOfoKpq90u6X4iTtZvs3+By+k+AvFGt2IvdP0eaW2b7sjMqB/93cRu/CsK7tLixu5
LW7gkguIm2vHIuGU+4r1f4hT+Ek8XSWuqXHiSKWySOOGKzSHyYlCgjy8sCP8a4zx54g0zxJrNrea
al5iO0jgmku1USSuuRuO0kEkY5qU72aHa2423+HPi26vHtYdGkeVEWRsSx7QGGR827bnHbOawNQ0
+60u/msb2FobmFtskbYyp/Cu++LmrXj69Zaes7pawWULiNWwC5Xlj6noPwrzuaaW4lMs8ryyNjLu
xJPbqaOr+YdF8hlaOjaBqviG7NtpNjLdSgZYIOFHqSeB+NZ1ehGaXTfglA9g7Rtf6myXjocFlVTt
Un04BxT2Tf8AW9hbtI5fXfCeu+GvKOr6dJbLKcI+5XVj6blJGa0Yvhr4wnkeOPRZWKKrk+bHtwRk
YO7BOOw5rmftM5t1tjNIYA+8RljtDdM49a9B+LeoXo8U6dEJpEjtrGF4ArEbSRksPfPf2o2Xz/QN
38jirXQtTvNcXRYbN/7RZzGLdyEbcOSDuIA6d61JPh94ri0x9RfRLgWyAszZUsAOp253Y98Yr0W4
Ak+MvhC7cAXN1YQzXHHJco4yffAFctoGralJ8aY7h5pTPNqLQygk8oWKlSPQDt7UJNtR66r7tAbS
Tl00f3nn4BZgqgkk4AHerF9p19pk4g1CzuLSYqGEdxE0bYPfBAOKveI44rHxfqkdqFEUN7KIwOgA
c4FO8TeJr/xXqi6hqIhE6xCIeUu0YGccZPrSTvFNDas2jQ0bVPB9jpka6p4cutTviT5jm9aFAM8b
QvPT1qz4x8PaVaaVo2vaIs8Fjqivi1uG3NEynBw3cf571ieH9e/sC7kuP7K0zUd6bPL1C381V5zl
RkYPvXX+OGn8UaB4f8SRyPFFcu1mticCO3cHH7vAHynHfJ461TV7W7iWl7kms2Hg7wXfWui6joN1
q100KSXF59saLaWH8CrwQPeua8deHbfwv4qm0+0meW22JLF5n3lVhna3uK7fxJ4ubwdrNnoNxpdj
rUumRRq97qMIablQ2I2GNoGeM7jXKfEvSxp/iv7QtzPcR6hbpeI1w26RQ38JPtjj2xUt6pru/wDg
DS0s+yNLV7m21j4TrqraPpVneJqot/MsrRYiUEZOCRyeTXnld0P+SHt/2HB/6Krhab+J/L8kH2V8
/wA2FegfDqPwtrOp2Wg6r4bN1d3Dvm9+3SJgBSwGxcDtjrXn9dn8Kf8AkpWkf70n/otqqOrsRLRX
M/xbd6BNd/ZdF0A6W1vLIkrm8ebzcHA4b7vQ/nU8Hw28X3M7ww6LIzIiuT5se3DDI+bdgnHbOawt
Y/5Dl/8A9fMn/oRruPitqV4virTYkuJES1sYHhCsRsYjJYe/Tn2FZw1im+v+RpL4ml0/zOOtPDmr
Xutvo0NmRqCFg0MrrGV29cliB+tdt4g+FOqwW2ktpNgGkezVrzfexDE3cDcwyPpkVm/FoD/hPJpM
DdLbQO59SUHNO+In/IN8If8AYFi/rTv7vzt+Ylv8r/kcjYaVf6pqC2FhayXN0xIEcYyeOv4e9aet
+CfEfh22W51XS5YIGOPMDK6g+hKk4/Gus+Hx0+y8CeKdRu5L2IgwwSS2AUzpGx527iAAT1+lV7Hx
F4M0fRdZsbF/EU41G1aLyrqOHyxJ/C/DZyD3py00Ba6knw4vrbU5ZtEvNE0eaGKxnlW4kslacsBk
EufTP6CvPrONZb6CNxlHkVWHqCa7T4U/8jTef9g24/8AQa47T/8AkJWv/XZP5iqjrUXy/Nkv+G/n
+SPTfE1v8PdF8WT+Hrrw1c20aFFN/b38jMu5Qc7GyOM+/SuG8X+G5PCviOfTGl86NQHhlxjzI25B
/p+FbfxbBb4m6mAMkiEAD/rmtW/i+QviTTIGP76HS4El9Q3zHms46xizR7teX+X+ZiW/w58W3V49
rDo0jyoiyNiWPaAwyPm3bc47ZzUdp4A8UX01xDb6TI8ltP8AZ5l8xBsfGcHLdMd+nvXR/FzVrx9e
stPWd0tYLKFxGrYBcryx9T0H4VTtbu4k+EOrySTyPJJq0IZ2YksAnGT+A/Kq7+X+diF08/8AK5j3
PgPxRZ2F3e3GjTx29oSJnYr8uOpAzkj3GR711Elr4Q0DwR4c1DUvDL6hc6kkpllS+kiK7WxkKCQe
D7dK6O7nluPiZqccrsyv4bZSCeoMQP8AM5rkfGP/ACTTwN/1zuf/AENaTbSt5r/25foOKu7+T/JP
9TN8X+GtOsdN03X9ClmfSNRDBUnwXgkXqhI698fSqmk+AvFGt2IvdP0eaW2b7sjMqB/93cRu/Cun
mjjHwa8PW90doudYLLn/AJ5/MGP0rT+IU/hJPF0lrqlx4kilskjjhis0h8mJQoI8vLAj/Gm1Ztef
6J/qJaq/9b2/Q8ou7S4sbuS1u4JILiJtrxyLhlPuK6O1+HHi+8sFvYNDuDCy7l3Mqsw9QpIY/lXS
DV9F8YfFTw3Lbx3RgVYoZ2vUUPM6ZwzbSQc4UVynjDVdRuvG2p3NxcTC4iu5EjO4gxhWIUL6YApd
vn+A+/y/Ey9P0bUtV1IadY2U095kgxKvIx1z6Y96v654N8Q+G4Um1bTJbeFztWTcrrn0ypIB9jXS
+EJ5rb4feNNTgkb+0CsMZmB+cI7ncc9eab4DlkuvCHjKwuGZ7JdP+0BWOQsqn5SPQ/4UPS/kr/qC
1+bsczoXhHXvEqSvpGmyXMcRw77lRQfTLEDPtXQeKdEGj/D3w6LnTktdSNxcpcMYgsjYbgMepGOl
TeK5HtPhj4PtLZitrcLNPMFOA8gYdfXGTVvxDPNqfw58DHUJGbdcSxM7nkoHCjn6CqavdLul+Ik7
Wb7N/gcvpPgLxRrdiL3T9Hmltm+7IzKgf/d3EbvwrCu7S4sbuS1u4JILiJtrxyLhlPuK9X+IU/hJ
PF0lrqlx4kilskjjhis0h8mJQoI8vLAj/GuM8eeINM8Saza3mmpeYjtI4JpLtVEkrrkbjtJBJGOa
lO9mh2tuNt/hz4turx7WHRpHlRFkbEse0BhkfNu25x2zmsDUNPutLv5rG9haG5hbbJG2Mqfwrvvi
5q14+vWWnrO6WsFlC4jVsAuV5Y+p6D8K87mmluJTLPK8sjYy7sST26mjq/mHRfIZWjo2gar4huzb
aTYy3UoGWCDhR6kngfjWdXoRml034JQPYO0bX+psl46HBZVU7VJ9OAcU9k3/AFvYW7SOW13wnrvh
ryjq+nSWyynCPuV1Y+m5SRmnWHhDX9UtbO5sdNknivHaOBkZTuK/eyM5UD1OBWSbmc2wtjNIYA28
RljtDdM49a9CvNUu7D4JaNBazPELq9mWVkOCVBJ259CcflRsmw3aRx+t+Fta8OXcNrqtg9vNOMxL
uV9/OOCpNaM3w58XW+nG/l0O4WBV3nlS4HqUB3D8q1PhTi+8fael5I8yW0cssEbNuAcKT8oPGe/4
VdsPEfg3TPFC679t8WyXySl5DIkH7znlW+boemKLbIO7OI0bQNV8Q3TW2k2Ul1Mq7mCYAUepJ4FW
9c8G+IfDcKTatpktvC52iQMrpn03KSAa3dM0zT9ZuPEviCW+vNN8Owzbnit1Hmyh3OyPGdv55A/W
tzSD4dn+Hvi+HQ11kwpbxySLqDxsgbd8pUIODxSb92/lcaWtvOxleCfhxea5BcXt9Z5spLGSS0dL
qMFpR93I3ZA69QBXLa54W1jw4sLarapCJiRHtnjkzjGfuMcdR1rovhf/AMhLXf8AsC3P/stcXZxx
zX1vHKcRvKqsfQEjNVa8kl/WrFe0W3/WiPSvhJp15a39xeXFtJFb3VsfIkdcCTay5I9RyOa+hLT/
AI8oP+ua/wAq8yhls/8AhY1/aWz3ge0s0iMMoUQxp8hQRYOcHnOfavTbT/jyg/65r/KpvfVFWtuT
UUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABR
RRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFF
FABRRRQAUUUUAFFFFABRXP6z4usdHvo7WRJJXJHmlBxGPU1uW9xFdQJPC4eNxlWB4IoAkooooA84
+KP/ACLOt/8AXFf/AGWvmsV9KfFH/kWdb/64r/7LXzWKYmLRRRQIKKKKACiiigAooooAKKKKACii
igAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAPpP4Qf8k7sv9+X/
ANGNXdN901wvwg/5J3Zf78v/AKMau6b7ppFHx7plxaWmpQT31l9ttUbMlt5pj8wem4ciu8uPiH4Y
utGtdIm8CBrG1Zngi/tWQbGbknO3J69zXntta3F7cpbWsEs88hwkUSFmY+gA5Na3/CHeKP8AoW9Y
/wDAGX/4mm9rMlbj/DPiifwzqU88NvFcWtzG0NxaTcpLGf4T/jWhrHjS2uNBk0TQtDh0awnkElyE
naZ5iOgLNzj2rlY4Jpp1giid5mO1Y1UlifTHrU99pWo6W6pqFhdWjOMqLiFoyw9sgUPVD6m1oPiD
Q9NsDbar4Vt9VcSF0mNy8LjIHB2g5HH61B4n8U3Xia5gLwQ2lnax+Va2kAwkK+3qT3NZljpeoao7
Jp9hdXbqMstvC0hH1wDUNxbT2k7wXMMkMyHDRyKVZfqDQ9dxLTY7W3+IVnNbWJ1zwza6rqFggjtr
x52jO1fuh1AIfHvWMPFs1z4sm1/VbG11J59wkt51/dkEYAHpgYx9KzLTRdVv7Z7mz0y9uIE+9LDA
zqv1IGBVSOKSaVYoo3eRjgIqkkn6Udb/ANah0O7t/iHpWj+ZceHvB9npuoupUXT3LzmPPUqrDg1w
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
UYfiOasS63q07XDTapeyG5UJOXuHPmqOgbJ+YexqhRQA+GaW3mSaCV4pUOVdGKsp9QR0q1qGs6pq
qxrqOpXl4I87BcTtJtz1xuJxVzw54dl8R3F7DDOkJtbSS7YuCdwTHAx35rFNHkHmelfB6R21e/jL
sUW3yqk8AlhnA/AflX0Xaf8AHlB/1zX+VfOPwc/5Deo/9ew/9CFfR1p/x5Qf9c1/lSKRNRRRQAUU
UUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRR
QAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFA
BRRRQAUUUUAFFFFABRRRQB5x8Uf+RZ1v/riv/stfNYr6U+KP/Is63/1xX/2WvmsUxMWiiigQUUUU
AFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQA
UUUUAfSfwg/5J3Zf78v/AKMau6b7prhfhB/yTuy/35f/AEY1d033TSKPjKvQNf8A+SM+Ff8Ar7uP
/QmritMgs7rUoIb+9+xWjtiS48oyeWPXaOTXpmoHwJfeDdL8P/8ACalBYSySCf8AsuY+ZvJONvbG
fU05fB9xK+L+uzMnwjtj+FvjKUEh2a2jcr1CF+f5mtjQodASz8Z2vh+6ubnS20USM9yuD5oz7D+V
cp4M8QadpR1XSdX81tI1SHyZZIly0bAna4HtnpWhc6t4c8MeE9S0nw/qc2q3uq7UnumtmgSKIc7Q
G5JOT+dKet33X6W/4I46WXZ/5P8A4BffS5vHPw98P22iSQSahpPmxXFm8yxvhiCHG4gEcVc8R6TD
p3wv8OafNcw3E9vqhjmaJ9yozbmZA3Q4yAcdwa4vQdM8KX1gW1nxDcaZdrIflFm0yOmBjBXoevWr
Pi7xFpt1ZaboWgLMuk6aGZJZhh55WOWcjt7fWqbs/Vp/qJLT0TOm+IqaDL4v8SHVru6hv7e3gXTI
4lyjnywSDweM+46msr4t/N4h0uZv9bNpUDyHuW561bv9T8G+MZ7HWdb1a503UIokjvbZLVpBcle6
MOFyPWsbV9f0fxb45lvtYN1Z6SyeTD5ChniVVwmR9eSPepttH+uv53Hfr5f5flY6XwHL4VhvFfw7
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
inYn589PavKqKb1EtD07wQ95PY+LLLTdRjbxROyi3uTOA86hz5myRu565z6GtWy03WdM8B+LY/EO
pyTag9opFpJd+e0KbvvNgkAk9s9q8copNXTXlYadnfzudv8AC+aEeIr6zlmjhe+06e1haRtqmRgM
DP4Vjar4a13whdWdzq1gbfdJuizIrBypBP3SfasGkNVfVNC6NM+gdJvRrHi2XWbXVTd6de2e6G3M
xY2rgoHQqfu87T716paf8eUH/XNf5V84/Bz/AJDeo/8AXsP/AEIV9HWn/HlB/wBc1/lU2S2K9Sai
iigAooooAKKKKACiiigAooooAKhubW3vITDdW8U8ROdkqBhn6GpqKAGxxpFGscaKiKMKqjAA9AKd
RRQAUUUUAFFFFABRRRQAEAjB5FQWtjaWKMlnawW6MclYYwgJ9eKnooAKKKKACiiigAooooAKKKKA
CiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAK
KKKACq91Y216EFzEsgRtyhumasUUAMjijiXbHGiL6KMU+iigAooooAKKKKAPOPij/wAizrf/AFxX
/wBlr5rFfSnxR/5FnW/+uK/+y181imJi0UUUCCiiigAooooAKKKKACiiigAooooAKKKKACiiigAo
oooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigD6T+EH/JO7L/fl/wDRjV3TfdNcL8IP
+Sd2X+/L/wCjGrum+6aRR8seBvD9h4n159KvZp4nlt5GtmiYDMqjIDZByMA+lZ/h7RX1rxRY6O29
DPcCKQr95Vz8x+oANN8N6o2ieJNO1JSR9nuEdsd1z8w/LNel2mmx+HPiR4r1vaPs+nWsl5bnsWmH
yAf99EVV0mpdLP8ADX8f0Js2mlvp+OhxpsvBtj4q1ax1KXWX0+CUxWr2jRNIxBwSxYAY44wK1fHX
hvwZ4WafTrWbXZNWESSRGVojDhsH5sAN0z071wG9pJt7ElmbJJ7mu7+MP/I9n/r0h/8AQal3UY/1
0K05nb+tUSx+GvBmmeD9E1jXZtdM+prIdtkYSqlWx0YZ9O5qjrnhTRdIOjazDf3l54a1FiC6Iq3E
e37y8/Ln/A1014PC5+GXg8eJW1YLtn8k6f5f9/ndv/Dp71kfEm4W30vQdJ0u3VPDyQmeynEhczlv
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
p+n2QsNH09Cttbb9xyerMe5NczRQ9WC0VgooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKA
CiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAK
KKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoo
ooAKKKKACiiigAooooAKKKKACkNLSGgD0f4Of8hvUf8Ar2H/AKEK+jrT/jyg/wCua/yr5x+Dn/Ib
1H/r2H/oQr6OtP8Ajyg/65r/ACpFE1FFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUU
AFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQA
UUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAHnHxR/5FnW/wDriv8A
7LXzWK+lPij/AMizrf8A1xX/ANlr5rFMTFooooEFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFA
BRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAH0n8IP8Akndl/vy/+jGrum+6a4X4
Qf8AJO7L/fl/9GNXdN900ij5m+FuoJZ+N4LWc/6NqMb2coPQhxx+oFHgvw+x+KNtptwPlsLp3mJ6
AREnn8VH51yNpcyWV5BdQnbLDIsiH0IORXsmsxx6U3inxjANsep6bALQ/wC3OMPj3G0n8apu1p9r
/wDA/G5KV7x7/wDDP9DhH8fa1ZeLtX1fSbzyGv5juJjV8oD8o+YHGBiuq+L3i3W49Yn0BbwDTJra
F3h8pOSfm+9jPUDvXlEalnGATz2rvfjCp/4TonBx9kh5x/s1LVoxXn+hSd5N/wBbo3L3xZrfhb4Y
+Dzo14Lc3CziXMSPuw/H3gfU9Kq+MLueDQfCnjD7NDp/iKV3MhjhC+YFPyyFCMZ6Hp/F9KtXvi7W
/Cvwy8Hvo92LczrP5oMSPuw/H3gcdT0rE8dtJ4m0HS/GUckjCbNreQmQssEy/wB0E/KrDnH+NOfx
NruKPwpeR0/hX4heJ9T8JeKr671ESXNhbxvbP5EY2ElsnAXB6DrWd4B8X654q+JGk/2zeC4+zxz+
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
HTW/+v6b/wBDNb3hnXtR8R/FXRtR1OczXD3SDpgKo6AAdBWH4wRz401shG/4/pu3+2aXb5/oHf5f
qdh8Jp7+20/xZPpau1/HYBrcRx72L5OMLg5PtioNZ8UfE+fRruHVrfUk0+SMpO0uliNQp4OW2DH5
0fDWee00HxnPbSyQzx6buR42KspG7BBHINcndeJ/El7ayW13rWqT28gw8cty7Kw9wTg0566eX6sI
6a+f6I9A+G/xB8Tal4u0jRbvURJYEGMxeRGPlWM4GQuew71zXir4geJtWbUdHvdRElgZ2QxeRGvC
vkchc9h3pvwp/wCSlaP/AL0n/otq5vWf+Q5qH/XzJ/6EaJatX8/zQR0Tt5fqe0eMtd8f6dqFhB4Z
t76Sw+wQsTBp4mXfg5+bYeenGawfA+peINS+L1pN4kWdNQS0kXbNbiFguxiPlwPU9qi+JviDXdM1
+wg07VdQtYP7Ngby7ed0XPOTgHrVL4WX19qPxPtbnULqe5uDbygyTuXYgIccnmh7yf8Ai/Ul6RXy
/Qu+G/GF14019fDniuO2v7W93xRzGBElgfBKlWUD0rzbU7J9N1W7sZDl7aZ4ifUqSP6V2Hwz0m6u
/HlrfeU62Vi7z3FwwwiKoPU9Otct4gvU1LxHqV9H/q7i6klX6FiRS7en/DfqW95ev+f/AADOooop
khRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUA
FFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAU
UUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFIaWkNAHo/wc/wCQ3qP/AF7D
/wBCFfR1p/x5Qf8AXNf5V84/Bz/kN6j/ANew/wDQhX0daf8AHlB/1zX+VIomooooAKKKKACiiigA
ooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACi
iigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKK
R3WNC7sFVRkk9BQAtFcVr/ifU4LqJ9NSM2a4bzDyJvUA9q6PRdattbshPAcOOJIz1Q+hoA0qKKKA
POPij/yLOt/9cV/9lr5rFfSnxR/5FnW/+uK/+y181imJi0UUUCCiiigAooooAKKKKACiiigAoooo
AKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigD6T+EH/JO7L/fl/8A
RjV3TfdNcL8IP+Sd2X+/L/6Mau6b7ppFHxlWvd+J9ZvtBttDub1pNNtmDQw7FG0jOPmAyep6ml8O
eG7zxPez2ljLAk8UDz7ZmI3heoXAPPPtVHTtPn1TU7XT7YDz7mVYk3dMk459qdr+6Te2pe0DxTrP
heaabRrz7NJMoWQ+Uj5A5H3ga0dV+I/izW9Nm07UdV860mAEkf2eJc4II5VQeoFYms6VLoms3WmT
zQyzW0hjd4SShYdcEgH26VPr+l2mk30cFlqkWoxtAkhmiAAViOU4J5FK91cdmmRXmt6jf6XY6bc3
G+zsdwt49ijZuOTyBk/iTS22u6lZ6Pd6RDc4sLtlaaEorBiOhBIyD9MVnUUxGhY63qOm2F9Y2lx5
dtfoEuU2Kd6jOBkjI6npiqUUskEqSxO0ciEMrocFSOhBq+mhXr+HZNdCp9ijuBbMd3zbyM9PTFZt
HUOh1N18R/F97p7WM+uXDW7LtYBVVmHoWADH86xv7c1H+wf7EFxjTjN9oMIRRmTGMlsZPHbOKz6K
ANDR9b1HQL1rvTLjyJ2jaJm2K4KnqCGBFauieP8AxP4d0/7DpWp/Z7beX2fZ4n+Y9TllJrmq7Hwx
4P0jxLassfiN4dTSCSd7P7AzABM/8tNwByMdu9HRsOtiHUPGfjDxjAuj3N1NqCyOHW3htE3My5PG
xQTjms7/AIQ/xP8A9C5q/wD4Ay//ABNYtFGgzetR4m8FX0OqJZ3umT/Mkc1xaEA5HIG9cHiptY8f
+KdetGtdR1iaW3b70aKsat7EIBn8a5utnwroP/CTeJLPR/tP2b7QWHm7N+3ClumRnp60WvoK9tRN
A8U614Xmml0a8+zPOoWQ+Uj7gOn3ga17z4oeMtQsp7O61jzLeeNo5E+zQjcpGCMhMjiuUuIvIuZY
d27y3K5xjODio6V+ZDs4s0NF1zUfD2orqGlXJt7pVKhwitweowwIP5VWvLy41C9nvLqQyXE7mSRy
ANzE5J4qCimI7OL4r+NoIUhj1rbHGoVR9lhOAOB/BXN6xrN/r2pyajqdx593IAHk2KucDA4UAdBU
2laXaX9hqdxc6pFZyWkPmQwuATctn7i8jn86yqHvqC20OqtfiT4ws7AWUOu3AhVdo3KjMB7MQW/W
qGieLtd8O3dzdaXftDPdf66Ro0kL8553g9yaxKKOtw6WOvvPih4y1Cyns7nWPMgnQxyJ9lhG5SME
ZCZ/KsoeD/ExAI8OauQf+nKT/wCJrFoo0Hc1p/DHiCyge5udD1OCGMbnlltJFVR6kkYFbx+LPjfZ
s/twhcY4tYR+uyuLrd8WeHP+EX1hLD7V9p3W8c2/y9n3hnGMnpQ9hGZd6nfX+oNf3V3NNeMwYzO5
LZHTntit28+Ini2/0xtOudbuHtmXYyhVVmHoWA3H8TXMUUdLD63Lml6rf6LfJe6bdSW1ynSSM4OP
Q+o9jWjrvjLxD4liSLV9TluYkOVj2qi59cKACfc1hUUPUWxd0rVb3RNTh1HTpvJu4STHJsVsZBB4
YEdCaZHDe6vqBSCCa6vJ2ZtkMZZnPJOFUfU8VY0bQr3XprmKxVC1tbvcyb22/IvXHvzWbR6gbX/C
H+J/+hc1f/wBl/8AiaqX+iatpSJJqOl3tmjnCNcW7xhj6AsBmqFFAHVWvxJ8YWdgLKHXbgQqu0bl
RmA9mILfrWJYa1qWmap/aVlezQ3u4sZlb5mJ659c+9WvCug/8JN4ks9H+0/ZvtBYebs37cKW6ZGe
nrWVcReRcyw7t3luVzjGcHFGzv1DpY2dd8ZeIfEsSRavqctzEhyse1UXPrhQAT7mqOo6zf6tHZx3
1x5q2cAt4BsVdkY6DgDP1PNUKKLDuX49Z1CLRZtHS4xYTSiaSLYvLjgHOM/rS6vreo69dR3OpXHn
zRxLCrbFXCL0GFA9az6KBFnTtQutK1CC/spfKuYHDxvtDbSO+CCDXW/8Lc8c/wDQc/8AJSD/AOIr
iaKAOisPHXiTTNWvtUs9R8u9vjm4k8iM7/wK4H4AVdvPih4y1Cyns7rWPMt542jkT7NCNykYIyEy
OK5CilbSw763Lulare6JqcOo6dN5N3CSY5NitjIIPDAjoTVWaaS4nkmlbdJIxdjjGSTk0yimI7OL
4r+NoYUij1rCIoVR9lh4A6fwVQk8e+Jptfh12TUs6lDEYY5vIj4Q5427dvc9q5uijrcOljpNY8f+
KdetGtdR1iaW3b70aKsat7EIBn8a5uilALMABkk4AoS7BcSiux1zwbpXh21lh1DxMg1uOFZDp8dk
7DcQCFMucA4PpXHUB0uFFKMFgCcDPJrr9Q8H6TH4Sudf0nxE2oR206QvG1i0PzN7lj/Kh6K4buxx
9FXNLt7K61COHUb5rG1bO+4WEyleOPlBBOTxWz4s8L23h2HS7iz1Q6hbajAZ45DbmEgA46FjQ9AW
pzVFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQ
AUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAB
RRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFIaWkNAHo/wc/5Deo/9ew/9CFfR1p/x5Qf
9c1/lXzj8HP+Q3qP/XsP/QhX0daf8eUH/XNf5UiiaiiigAooooAKKKKACiiigAooooA5DU/iToGm
6jc2Si+vZbQ4ujY2jzLb/wC+yjArZh8T6LP4cHiFNRh/sryzIbknCgDrnvnPGOueK4rw5qWta+ur
XXhmDQ9H0pL6WN2ngaWWeRcBnYKyhc++TXlV+90f2dGEMheP+3XEzIMApz27Ddt4oA9f0740+CdS
1NLGPUZYmkbZHLNCyRse3zHp+NSeO9M8ba5qun2Hh7UBpekMM3l7FIBMOf4e/T0I61xfxVi8Pr8E
tKayW2DD7P8AYzHjcePm6c9M5966weINFuPDei+DfEGqXFlq+qaXAGMYZG3FBkiTBUHIPWgDmNI1
DxD4M+Mmn+EZfEN5r2nX0HmN9rbfJDkP3JJGNmfoa9sr5/0/TYvht8b9K0zS719Vi1aIJObrbJPD
ksM7wBjpntkZz2r6AoAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiii
gAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiikZgqlicADJoAS
SRIo2eRgqKMlicACvNvEXiaXW5HtLNmj09Th26Gb/wCtUXifxHcaxcNZw7odOQ8noZv/AK1Z+m2M
1/OlvbITnjjoKALehpOLkWMURms5T80X9w/3h6V6FpGi22ko3lKDK/3nxyaXR9Hh0q2CKA0p+8/r
WlQAUUUUAecfFH/kWdb/AOuK/wDstfNYr6U+KP8AyLOt/wDXFf8A2WvmsUxMWiiigQUUUUAFFFFA
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
ooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiii
gAooooAKKKKACiiigAooooAKKKKACiiigApDS0hoA9H+Dn/Ib1H/AK9h/wChCvo60/48oP8Armv8
q+cfg5/yG9R/69h/6EK+jrT/AI8oP+ua/wAqRRNRRRQAUUUUAFFFFABRRRQAUUUUAcRdfCvw9c6p
c3iSajbR3cnmXNpbXjxwTMepZB61p6Z4E0DS/Dl34fitDLpd1I8klvM24Dd1A9AO3cV0lFAHnOn/
AAR8GafqUV59nurgRPvjguJy0anqOO/0NdD4s8B6B40ghTV7UmSD/UzxNskT2BHb2NdLRQBxnhX4
XeGfCN+dQsbeaa+KlRcXMm9lB647D69a7OiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAK
KKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoo
ooAKxPFWpHTdDldEZ5ZCI0VByc9cfhW3TXjSQqXRWKnIyM4NAHGahp8OvWlulhp88bIqgSyLsAHo
c9a6PRtGg0e0EcYBkP337k1pUUAFFFFABRRRQB5x8Uf+RZ1v/riv/stfNYr6U+KP/Is63/1xX/2W
vmsUxMWiiigQUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQA
UUUUAFFFFABRRRQAUUUUAfSfwg/5J3Zf78v/AKMau6b7prhfhB/yTuy/35f/AEY1d033TSKPjKir
emT2drqUE1/ZfbbRGzJb+aY/MHpuHIr0zUB4EsfBul+IP+EKLi/lkjEH9qTDy9hIzu75x6Cm9Fcl
aux5RRXXeDPD+naqdV1bV/NXSNLh86WOJsNIxJ2oD7461oXOk+HPE/hPUtW8P6ZNpV7pW157Vrlp
0liPG4FuQRg0PQaV2cDRXe2uk+HPDfg/Tdb17TZtWu9UZzBarctAkcanG4svJPT86peLdA0yLSNJ
8RaBHNFp2pbozbStvaCVTgqG7g84+lD0dhLU4+ivSr/TPBvg6ex0bW9JudS1CWJJL25S6aMWxbsi
jhsD1/8ArVg69oGneEvHJsdRFxeaSMSp5TBXkjZcrz068E+xo6h0ucnRXpWh2ngnxrqB0Ox0C80m
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
dmJLAJxk/gPyrB8WeI/+Eo1hdQ+y/ZtsEcPl+Zv+6MZzgdaZD4g8nwddeH/sufPu0uvP8z7u1cbd
uOfrmq6P1/8Abr/kJbx8l+lvzPVLueW4+JmpxyuzK/htlIJ6gxA/zOa5Hxj/AMk08Df9c7n/ANDW
qjfEDd4ouNa/szHnacbHyfP6fIE37tvtnGPxqa28eaM3hvStJ1bwmmpNpqusMr37xjLHJO1V+nUn
pRJX/rzl/mgi7W/rol+hfmjjHwa8PW90doudYLLn/nn8wY/StP4hT+Ek8XSWuqXHiSKWySOOGKzS
HyYlCgjy8sCP8a4DxP4rvPE9xb+bDDa2lqnl2tpbrtjhX29+BzWx/wAJ3Yana26eJvDNvq93bRiO
O7F09vIyjoH2/eoeuvn+iX6fiJaaeX63/r0NcavovjD4qeG5beO6MCrFDO16ih5nTOGbaSDnCiuU
8YarqN1421O5uLiYXEV3IkZ3EGMKxChfTAFVdU10XmtRajp1hb6V5ATyIrXICFTkNk9Wz3rorjx5
o2pzC/1fwbZXmq4G+5W5kiSQju0Y4J9eaXZ+v4j7r0/AseEJ5rb4feNNTgkb+0CsMZmB+cI7ncc9
eab4DlkuvCHjKwuGZ7JdP+0BWOQsqn5SPQ/4Vg+HvFs+gajezCzt7iyv1ZLqycYjdCc4HpjPBq7q
fjW1bQbjRtA0GHRrS7YNdFbhp5JcdBubovt/9eh7PzVv6/MF08nf+vyNHxXI9p8MfB9pbMVtbhZp
5gpwHkDDr64yat+IZ5tT+HPgY6hIzbriWJnc8lA4Uc/QVgaP4yt7bQF0PW9Eh1jT4pDLbq07QvCx
64ZecH0o8UeNv+El0XTNNXS4bGOwd/L8l8rsONqhccYA65OetU3q+uqYlsvRo7H4hT+Ek8XSWuqX
HiSKWySOOGKzSHyYlCgjy8sCP8a4zx54g0zxJrNreaal5iO0jgmku1USSuuRuO0kEkY5q5/wndhq
drbp4m8M2+r3dtGI47sXT28jKOgfb96uc13VYdX1EXFtpttp0KoI0t7cHaAO5J6n1NTa1l5judp8
XNWvH16y09Z3S1gsoXEatgFyvLH1PQfhXnc00txKZZ5XlkbGXdiSe3U1teLPEf8AwlGsLqH2X7Nt
gjh8vzN/3RjOcDrWLE/lzJJjO1gceuKaWrv3f5iey9F+QyvQjNLpvwSgewdo2v8AU2S8dDgsqqdq
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
KKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAo
oooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACkNLSGgD0f4Of8AIb1H/r2H/oQr6OtP+PKD
/rmv8q+cfg5/yG9R/wCvYf8AoQr6OtP+PKD/AK5r/KkUTUUUUAFFFFABRRRQAUUUUAFFFFABRRRQ
AUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAB
RRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAec
fFH/AJFnW/8Ariv/ALLXzWK+lPij/wAizrf/AFxX/wBlr5rFMTFooooEFFFFABRRRQAUUUUAFFFF
ABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAH0n8IP+Sd2X
+/L/AOjGrum+6a4X4Qf8k7sv9+X/ANGNXdN900ij41hleCeOaNirxsGUjsQcivZ/EJjsdG17xlFh
f7d062ggI/vyDEo+oCV4rVuXU9QnsIrCa+uZLOE5jt3mYxoeeQpOB1P503rG39eZK0d/68h+maRq
WrzMmm6fdXjR4Li3iZyo9TgcV33xg0bVG8UyakunXZsUtYQ9yIW8tTjGC2MdeK8/0/VtS0l3fTdQ
u7N3GHa2maMsPQ7SM1Zu/E2v39s9tea5qVxbv9+Ka7kdW78gnBolqkl0GtHqdzrutapo/wAMfBba
ZqN1Zl1uN/2eZk3YcYzg8/jWd4oiXxR4OsfGESL9uif7HquwY3OPuSEe4xn3Iripr+8uLWC1nu55
be3z5MTyFkjz12g8DPtRDqF7b2k9rBd3EVtPjzoUkKpJjpuAOD+ND1u/O4LRJeVjuPA3/Ih+Of8A
r0i/m1UfhZewWPxE0yS4kWON98W5jgAshA/UgVysF/eWtvPBb3c8MNwAs0cchVZAOgYDg/jVenf3
r+ViWvdt/XQ9O8H+Ddf0v4lQXV9plxb2dnO8s11Km2IIAeQ54P4VY8O3tjpmn+MvF91aG8tbm4ay
hhEpi81ZHJYBgMj5Sp4rzmbXtYubMWc+rX0tqBgQyXDsmP8AdJxVc394bAWBu5zZh/MFv5h8sP8A
3tucZ96m2lv61tf8Cr3d/wCutvxPUNE1DQvFPhfxD4c0fw6dKkNr9tjH217jzHjI4G4cHtxVKHS9
Q1b4I2cGnWVxdzLq7sUgiLsBsPOB25FeeWd/eadcefY3c9rNgr5kEhRsHqMjmrVl4i1zTbf7PYaz
qFrDkt5cF06Lk9TgHGab6+dvwYJ7fP8AFDr/AMN65pdt9p1DR7+1gyF8ye3dFyegyRWXWw+sa/r5
TT7rWru5jc5CXt+RFkDOSZGCj8TTv+EW1D/n40j/AMHFp/8AHaNQOj+Dv/JRbT/rjN/6Aau+BPCW
q6Z4rj17WrKfTdL04vPLNdoYs4BwAGwTyRXGPbar4cljvIL+GCY5VZLDUopHHHP+qckD61Xv9b1b
VFC6hql7dqpyBcXDyAfmTRfVNboVtGn1PQ/B082vJ8Qri1hkkmvbV3jiRSzEszEAAdTzXET+E/E1
vbyTXGharHDGpZ3e1kCqo5JJI4FUNP1bUtJd303ULuzaQAObaZoyw99pGauTeLPEdxA8E/iDVZYp
FKvG95IysD1BBPIpWslbtb8x3u3fvc6TwDE+u6H4i8Lr80t1At1bKf8AnpGw4H1B/SqnxMu45fFz
afAc22lwR2MWP9hef1JrlrO+u9OuVubG6ntZ1BCywSFGGevI5qKWWSeZ5ppHklkYs7uxLMT1JJ6m
m9Wv6/rQS0T/AK/rU9Q8F+Hdbh8DeMIpdIvkku7WH7OrW7Ay8sflGOeo6Vzfgm8k8HfEKwk1iCWz
CMY51nQoyK6kZIPIHIP0rJTxf4mjRUTxFq6oowqreyAAeg+as28vbvUblrm9uprm4bG6WeQuxxwM
k807+9zBa8bHW678OvEkHiK4gstJury2llL29xAhaN0Y5U7hwOD3Navw+0+7GleONOSB5LwWBhEU
Y3MXBYYGOvPpXDwa/rNrafZLfV7+K2xjyY7l1TH+6DiorDV9T0p5H07UbuzeQYdredoyw99pGalK
y5elrDbu79b3L8/hPxNb28k1xoWqxwxqWd3tZAqqOSSSOBWJWxN4r8R3MLwT+INVlikUq6SXkhVg
eoIJwRTh4X1AgH7RpH/g4tP/AI5T1AzbD/kI2v8A11T+Yr1nWb+GH416vpd42LHV4UsZ89BviXY3
1DYrzSfw/f2ULXLXGm4i+b9zqls7/gqyFifoKo3N9eXt4bu6up57liCZpZCzkjp8x57CjR2T8/xF
qrtf1Y9n1a2az+NPhC1cgvDYwxsR0yA4/pXAeIPCXiibxJqksOg6q8T3crI6WshDAucEHHSuel1z
V59Qiv5tUvZL2IYjuHuHMiDnoxOR1P51c/4TLxR/0Mmsf+B0v/xVL18/xHft5fgZMkMttdNBPG8U
0b7XRxhlYHkEHoa7n4w/8j1/25w/+g1ws08txO888ryzSMWeR2LMxPUknqakvL681Gfz767nupsB
fMnkLtgdBk84oeqSDZs9Va7SP4J2+rB8XQtn0tfXBmDH/wAdWpfH2oR2vhHRNShILarfRak4HqkK
KR+deSm/vDYCwN3ObNX8wW5kPlhv723OM+9E9/eXNtBbXF3PLBbgiGKSQssYPUKCcD8KpvW67/8A
B/MS7Pz/AMvyPSPiB4U1fxJ4wj1jQ7Ga+sNViikinhXcinaFIY/w9O9dNa3kEvxv0nT7eVZF0zTT
Zs6nI3rGxP5Zx+FeMWmuatYWzW1nql7bQN96KG4dFP1AOKgtL680+6F1ZXc9tcDOJYZCjjPXkc0l
orLbX8mvwuD11e+n6f5HdeF/FV1qmvy6B4kv7i+0rUma3YXMpkMLk/I6lvukHH51paTaah4W8B+P
bLzHhu7aeCEuhwSpbGR7FT+Rry3ewfeGO/Od2ec+tXp9d1e6S4S41W+mW52+eslw7CXb93dk/Njt
npSt7tvl+KKv71/O53Nwn/Cw/AwvE+fxFocYWcfxXNt2b3I/x9RXm1WbHUL3TZ/PsLy4tJipUyQS
mNsHqMgjitH/AIRjUX+Y3OkknnJ1i0z/AOjab3uStrDfCX/I46J/1/Q/+hiuh8U+JdT0fxR4v02z
lVLbUbl0nBXJwCeh7cEiuefQ9S01ftq3eno0BEitb6rbtIpHQqEkLE/Tmsu4uJru4kuLmaSaaRtz
ySMWZj6knkmh66ev42/yGtPw/C/+Z7TpeqW+la38PXunWOGfSWt2djgAtwM/jisDwn4F1rSPiLFc
ajYy22nabM88t5Ku2IouSCG6HPHSvOLi+u7uOCO5up5o4E2QrJIWEa+ig9B7CrE+u6vc2Qsp9Vvp
bQAAQSXDsg/4CTinfXmW+v53/AVtOV7afgrHpGgSzeItH+JE9jBLPJeskkUUaFnYGRyAAOelReCd
G1fRtB8TSeIbS5stGfTnUx3iFA838G1W79efpXnWn6zqmk+Z/ZupXll5mN/2ado92OmdpGeppb/W
tV1VVXUdTvbwKcqLidpMfTcTUtaWXaxV9bvvc7L4TaPqb+N9K1NNPumsFeQNciFjGDsYctjHU4rm
vE2j6npmr3Mt/p91axz3EhiaeFkDjd2JHPUfnVey8R65ptsLaw1nUbWAEkRQXTooJ6nAOKi1DWtV
1YRjUtTvLwR52C5naTbnrjcTjpTlq1boStL3PRPiR4e1rVr3Q59O0m+u4V0iBTJBbs6g88ZA68is
XwJpGpaR8S9Bj1KwubN3mLKtxE0ZYbTyMisCPxd4lijWOPxDqyIgCqq3sgAA6ADdVebX9ZuL2G9n
1e/luoOIp3uXZ4/91icj8KadpX87iavG3lY3/EHhLxRN4k1SWHQdVeJ7uVkdLWQhgXOCDjpXJzwy
208kE8bxTRsVdHGGVh1BB6Gtf/hMvFH/AEMmsf8AgdL/APFVHFo+o6shvmu7F2mYszXWqW8cjHPJ
YPIGzn1HNRFWSRbd3cyK9KSzn8afCrTrTS0+0anoc7iW1Q/O0TnIZR37D8DXH/8ACLah/wA/Gkf+
Di0/+O1mwXN1pt35lrcyQTxkgSQS4I+jKf5Gq0asydnc1JdA1vw6tpq2o6ZcWkIuFCfaE2MzD5vu
nnt1xXafEDwpq/iTxhHrGh2M19YarFFJFPCu5FO0KQx/h6d686vtV1HVHV9Qv7q7deA1xM0hH5k1
Jaa5q1hbNbWeqXttA33oobh0U/UA4o9egbbdT2e3vIJfjXpmn28qyLpmlmzdlORvWNifyzj8Kw/h
RNHrE40aZwJ9Ovk1K0J9M7ZV/Ig/WvLbS+vLC5FzZ3c9tcAECWGQo3PXkc0Wd/eafdC6srue2uBk
CWGQo4z15HNNPW7/AKd7/mD2sv60t+R6dcf8ip8S/wDsJx/+jjW1oE0et/DvVNd3g3kWiy6bdjux
QZRvxU/pXjR1TUDFcxG+ujHdNvuEMzYmbOcuM/Mc85NFtqmoWVtPbWt9dQQXAxNFFMyrIOmGAOD1
71Fvda8v0t/mVf3k/O/43PQW0vUtV+CujRaZZXV3KmpSsyW8TOQMNyQO1cTeaHruirFd6hpV9aRi
QBXuIHRS3UDJHXimWXiPXNNthbWOs6jawAkiKC6dFBPXgHFNv9f1nVYBBqOr395ErbhHcXLyKD64
Ynnk1V7S5l5foT0szvviBoWoeLL608VaBZzahZ39ugkFshkaKVRgqyjkdq8/1bRdQ0K6S21O1e2n
eMSiN8bgpzjI7dOlNsNX1PSyx0/Ubuz3/e+zztHn64IqvcXM93O09zNJNK5y0kjFmP1JpWtsO/c7
vXv+SM+Ff+vu4/8AQmqT4a2891oHjO3topJZ5NN2pHGpZmJ3YAA6muDkv7yWyispLud7WElooGkJ
RCepC9Bn2qTT9W1LSXd9N1C7s2kADm2maMsPfaRmm9XLz/ysLZLy/wA7l+fwn4mt7eSa40LVY4Y1
LO72sgVVHJJJHArtNe0TVda+G/glNM066vCkdxv8iJnCZcYyR06HrXETeLPEdxA8E/iDVZYpFKvG
95IysD1BBPIqO38S69aWiWltrepQ2yDCwx3bqij0ABxRurf11GtHf1Oy8YR/8I58PNE8K3LJ/aZn
a9uolYEw5yFU474P6V5zTpJHlkaSR2d2OWZjkk+5ptLq2w6WCiiimIKKKKACiiigAooooAKKKKAC
iiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK
KKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigApDS0hoA9H+Dn/Ib1H/r
2H/oQr6OtP8Ajyg/65r/ACr5x+Dn/Ib1H/r2H/oQr6OtP+PKD/rmv8qRRNRRRQAUUUUAFFFFABRR
RQAUUUUAFFcLd/EK8l1C+g8P+FtQ1iCwkMVzcxyJEgcDJVNxy5HtRqPxR0qz+H0fjC3tZ7i1eRYj
BkJIjk4IPbIIoA7qivJLj472No9lcXHhzVYdJutuL6RcLkjnaMfMB9ecVO3xusItas7e60DU7XTL
2QJb6hOmxZATgMFI+7yD1zjtQB6pRXFeM/iPZeE9RtNIhsLrVNYu13RWVqPm288k++D0z0NReEPi
ZaeKLzUNMl0u703WLGMyyWVwPmKj0/McEdxQB3VFeRah8cZdKtjcX3gnWbaEHb5kxCLnsMkV0U/x
S0uw8A2XirUrS4tftuRb2PDSyHJAx0GCBnPoaAO7orzPRPjFa3mu2mk61oOoaJLe4FrJdD5JCeg6
DGfxqbW/i5Z6N4wvPDX9i6heXkEYaMWoDmZiAdoHbgkk+xoA9GorhfAvxMtPGep32lSabc6Zqdmu
97a4OSVzgntyCRkY7it7xf4lh8IeGbrW57d7iO325jRgCcsB1P1oA3Ko32s6Xplxb29/qVnazXLb
YI551RpTkDCgn5jkjp6iuc1H4g2unfDaHxo9jM9vLHFILcON4DsFHPTjNeafE3Vk13Xfhdq0cTRJ
ezLOsbHJUM8JwfzoA98oriE+JNrfeOz4V0fTp9Rli/4+ruNwsUH97JPXH8+K7egAooooAKKKKACi
iigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKK
KACiiigAqK5uYbO2kuJ3WOKMZZieAKS7u4LG2e4uZVjiQZZmry/WtduPENzlt0Vgh/dxf3/9pqAN
XW9a1K/aLUNKvQtimCnl929H/wAK6fw7r6a3aHchjuouJYz6+o9q4nw/ZXcuoj7IgMD8Txt9wj1+
tejWOn2+nw+XAgXPU9zQBaooooA84+KP/Is63/1xX/2WvmsV9KfFH/kWdb/64r/7LXzWKYmLRRRQ
IKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA
ooooAKKKKAPpP4Qf8k7sv9+X/wBGNXdN901wvwg/5J3Zf78v/oxq7pvumkUfHumW9pd6lBBfXv2K
1dsSXPlGTyx67Rya7y4+Hnhi10a11ebx2FsbpmSCX+ypDvZeCMbsjp3FecV6Br//ACRnwr/193H/
AKE1OXw39CV8Vv62Od8M+F5/E2pTwQ3EVva20bTXF3NwkUY/iP8AhWhrHgu3t9Bk1vQtch1mwgkE
dyyQNC8JPQlW5x71p+Edsfwt8ZSgkOzW0bleoQvz/M1saFDoCWfjO18P3Vzc6W2iiRnuVwfNGfYf
yolpfyX6X/L8Rx117v8A4BymkeC7e40CPXNd1yHRtPnkMduzQNNJMR1IRece9UfE/hWXw6bSeO8h
v9OvUMlreQghZAOoIPQj0rrX0ubxz8PfD9tokkEmoaT5sVxZvMsb4YghxuIBHFXPEekw6d8L/Dmn
zXMNxPb6oY5mifcqM25mQN0OMgHHcGm1rbzX3bX/AK9BJ6X8n/X9epg2/wAPLSK2sBrnia10rUNQ
QSW1o8DSHa33S7AgJn3rAm8MzWHittB1W6t7B43KyXEpPlqMZDe4Ixj613HxFTQZfF/iQ6td3UN/
b28C6ZHEuUc+WCQeDxn3HU1lfFv5vEOlzN/rZtKgeQ9y3PWpvs/662/LUdunl/l/mMi+H2l6qssH
h7xdaanqMaFxaG2eEuByQjMcE1wjKVYqwwQcEGvVfAcvhWG8V/DsV/J4p+zMLdNTdVgMm35thQH3
wGxn1FeW3AlFzKJwRMHO8Echs8/rQ9JWBaq5HXWeE/B9j4jRDdeI7LTpJZxBFbspkmdjjBCAjgk4
zn1rk63fBf8AyO+h/wDX9D/6GKuKu0iZOyuU9e0r+xNfvtL87zvsszReZt27sHrjJx+ddVb/AA8t
IrawGueJrXStQ1BBJbWjwNIdrfdLsCAmfes3xgiyfEzVUf7jaiwb6bq6v4ipoMvi/wASHVru6hv7
e3gXTI4lyjnywSDweM+46ms4v3It9S5L32l0/wAzzvW9GvPD+sXOl3yBbiBtrbTkMOoI9iMGs+u/
+LfzeIdLmb/WzaVA8h7luetYupa3o114K0vSrbSkh1S2kLXF4IkBlX5sDcPmPUdfSnqk/J2Fu15q
/wCBV8PaNp2rPOdS1220mGEKd0sbOz5z91RycY/WtTWPBMFvoUut6FrtvrNhbuEuCkTQyRE8AlGz
x71zOn/Yv7Qg/tH7R9i3jzvs+PM299u7jP1r0iaTRx8NdYi8Ew3DxM8Z1Rr9x9oSMH5SqqNpXOck
HI9PRy+G4R+KxzmkeC7e40CPXNd1yHRtPnkMduzQNNJMR1IRece9UfE/hWXw6bSeO8hv9OvUMlre
QghZAOoIPQj0rrX0ubxz8PfD9tokkEmoaT5sVxZvMsb4YghxuIBHFS+L9Mj0r4Q6JZPcw3Fzbag6
SNC+5UZgzMgbocZAOO4NE9L+T/D+v8gjrb+v6/pnltaGi6WNZ1aGxN5bWayZLXFy+2NAASST+Fau
ga3o2neHtbstQ0pLu8vIwtpcGJGMDYIyCeR1HT0rmqNmLod7H8PNO1RJ4fDvi2z1TUYUMhtPs7Ql
wOuxiSGrn/DHha68S6jNbpNHaW9tGZrq5m+5Cg6k+/tXR+AoB4Yt5PG2pkx28CPFYQnhrqZgRx/s
jJyf8Kk8Lybvhp42uySJZZLdZGUc7Wfn+Zoel/T8f61GtbebMnWPBdvb6DJreha5DrNhBII7lkga
F4SehKtzj3rka9Z0KHQEs/Gdr4furm50ttFEjPcrg+aM+w/lXk1Lrb+u36B0v/XR/qKASQAMk9BX
eH4d6fYtbWeueK7TTdWuEVkszbvIE3dA7g4U/WuItZhb3kE5XcI5Fcj1wc16h4w8J3Xi/wASt4l0
i8spNHvEjeS5kuUQW2FAYOCc5GOgFV2F1ZwF74du9M8TnQtQlhtZ1mWJppGxGoOMOT/dwc59K3te
8CWWk+FDrtl4jt9TVbkWzrbwEIGIzw5bnt271e+MggPi6zlgfesmnQtuxgt97BP4YqOP/khU3/Ya
H/osVH2X5f5pFW95ef8Alc5/wv4Wm8Sy3bm7hsrGyi826u5slY17cDqTzx7VpX/gmzOg3eseH/EE
OsW9kR9qT7O8EkYPRtrZyPervw4kaOw8Q/2hCjeHXtlXUZC5Vl5OzZgHLZJwOnuK04k0d/APiCPw
Q92W2q2pLqWPP8gE48vZ8uOue+Pwqp6LTt/V/IUdX8/6+ZzWkeFNGudJg1DWPFtlpnn58uBYWnlA
BIyyqRt6VV8UeEbjw3JZyC7gvtPvk32t5B92Qd8jsRkcVkaZpl5rGpQafYQtNczttRF/mfQD1rrf
Hmo2lvp+j+E7GdbmPR0cT3C/deZjlgvsDkUPo/MS7EsfgHQvPSxm8daaupOQohjgd4tx7GXOBz7V
hHwZrA8Y/wDCLmFP7Q8zZ975MYzvz/dxzTvB/hyTXtV8yWQW+mWeJr27fhYoxz19TjAFdbpfjiwv
fjL/AG5cn7PYTBraOR+Ni7NqsfT1PpmnbVfP/gfeHRmafh3p95Jc2Oi+K7TUdYt1ZmshbvGH2/eC
OThj9K4MgqSCMEcEGvW/BngTUfD3j+y1HUbm0SxWZhbzJcI5uiwKqEUHPfJyOgNeb+JkSLxVq6R4
2LeTBcem81N9vMprfyMuus0jwpo1zpMGoax4tstM8/PlwLC08oAJGWVSNvSuTq3pmmXmsalBp9hC
01zO21EX+Z9APWqWuhLNnxL4Qm8Nz2UjXsF3pt8u+3voASrrxnjsRnpWtH4S8FSyLHH8QQzuQqqN
HmySe33qb481G0t9P0fwnYzrcx6Ojie4X7rzMcsF9gciofhppkN34p/tK8H+g6TE19OT0+QZUfnj
8qUbO/bXXyCV16/qRaz4GlsvHMfhXTb1dQun2AyGLygrEbiCMngDkmtKP4daZe3sulaX4vs7vWow
w+yG1dEZl6qsh4J4PaqHhjU9Z1T4nW+qadEk2oz3Ty7JWwm053AnsApNdnoj+DD43nk8OSXS+IGM
n2T7Wc2XnEHO0gByOuN1JX5VffUbtd28jz/w54QudenvjPcxafZaeu68upwSIuSMYHU8Hj2q1q/g
y2g0GXW9C1yHWbCBxHclYGhkhJ6Eo3OD61t+FQ2paH4s8J3VxFbazeSrJGJ3CCWRHyyZ6ZyP1rX8
N+Frnw54O8YW+sSQR3k+nlxaJMsjIqZw7bSQMkjHPY0N+7fyv69/6+Y0tbedv6/ryOM0jwpo1zpM
Goax4tstM8/PlwLC08oAJGWVSNvSq/iXwhN4bnspGvYLvTb5d9vfQAlXXjPHYjPSsbTNMvNY1KDT
7CFprmdtqIv8z6Aetdb481G0t9P0fwnYzrcx6Ojie4X7rzMcsF9gcim9LPzJWug6Pwl4KlkWOP4g
hnchVUaPNkk9vvVieMfDkXhXxFLpEWofbjEil5PK8vDEZ24ye2O/etP4aaZDd+Kf7SvB/oOkxNfT
k9PkGVH54/Ks+ytLzxz4zk3Pse8meeeVukMecsx9gP6UNapf1/W4X0b/AK/rb7zQ8PfD+bXPC+o6
5NfLaR20MksERi3tcCMZbHIwAcDPPJ9q42vXtB1mHV7rxdHYqY9LstBltrKP0jX+I+7HLH615DSv
rptb9WO2nz/yCuz8H+DdF8VfZ7Z/FAs9UndlWy+wPJwATnfuC9ATXGV2fwp/5KVpH+9J/wCi2q4q
7sTJ2VzM8T6Jo2iyRxaX4hGqy73SdBZvB5RHuxOc89PSufq7rH/Icv8A/r5k/wDQjXqnjnxvqXhn
xLZQ6QlvCxsoGuZGhV2n+XhSSCQoHYY6mohrFN9S5K0ml0/zPHq2de8Oy6Db6VNLOko1G0W7QKCN
gbsfeum8cXU3hP4k3N7oLixkkhSVfLUYXeg3AAjHJz+dbvjXx34m0yx8NPZ6tJE13pUc85CId7nO
TyKL+7fz/wA/8hW1+V/y/wAzyOivR/hxpMUul634ikbTvttqUitX1JwkEcjnl2zxkdvetu9kl1fw
3q8Hi3xH4Y1B47ZpbCW1uofOjlXkKu0DIPTFOWgLU5XwboHhbxJE9lOdYj1WO2lnd45IhAdvIABU
t0x+tcXbxefcxQ7tvmOFzjOMnFdt8Kf+RpvP+wbcf+g1x2n/APIStf8Arsn8xVRV6iXe35slu0G/
X8kd/qHwz0ay1h9FXxrajVxtAt7myeJSWAKjfuI5yK4TVtKvNE1S406/iMVzA2116/Qg9wRzXV/F
slfibqZBwQISCP8ArmtW/i+A3iTTJ2H76fS4Hl9S3zDn8qzi20n3LaSbXlf8v8zzyivYfH3jS98M
a9bQ6JHbwXcllC9xdvCsjt8uAg3A4UAZ+pqhpvi3UoPAGta/CLeLUJdXiO9YFKofL5KqQQCQD+Zq
u/l/nYldPP8AyueW13dt4D0ZfDelatq3ixNNbUldoYnsHkGVOCCyt9OoHWu71PUGvfFOteHTb2ya
bcaK928KQKMzmMP5mcZzn37VxPjH/kmngb/rnc/+hrSbsv68/wDIaV39/wCSf6nO+J/Ct54YuLfz
pobq0uk8y2u7dt0cy+x9enFYNekXMB1D4LaBG5/ejV2ghY9lbdn8M11erRan4ZvV0jw1r3hbSrG2
RVkiurmITTtgFmlDKTzn8qdrO39bX/UW/wDXnY8Mor0nW9A0bWPido9lYT2LQaisT3i6fMrxRyc+
YqkdM7c/jUWt/EfVtL1y703RY7Kz0e1laBLIWsbI6qcZfIyScc80un3/AIDt/Xqed0V6D4LNvZ6L
4n8XvZ28t3ZBFtI3QGOKSRiNwX24xV2w1i6+IHhPxFBrwhuL7Tbb7ZaXYhVHQKfmXKgZB/z2oeny
V/6+QLX77HmNdJqnh+0svA2h63HJMbm/lmSVGYbAEbA2jGfzJrp21S48B+ANBn0UQw6lq/mT3F20
Su+xSAqDcCAOal8Y3f8AwkPgLwfOsENvLdXMyyLEm1PMLBWYAdMnn8abXRd0hLo35v8AA8vor3PV
otT8M3q6R4a17wtpVjbIqyRXVzEJp2wCzShlJ5z+VeefEe20qLxHDPpU1g63NsktwlhKskUc3IcK
R0HGce9K/Ydu5x9Few+PvGl74Y162h0SO3gu5LKF7i7eFZHb5cBBuBwoAz9TXlWranNrGqT6hcrE
s07bnES7VzjGQO1HWwdLlOiivQ9Emj8I/DlfEtrbQS6xf3htoJ5ow/2dFHJUHjcSDT6XF1seeUVv
674w1bxNbwxas0FxLE+5bgQIkmCMbSVAyPwr0Px9441Lw14itLbR1t4SbOF7l2gV2nyvCsWBO0AD
gY6mjpqHU8dor2BNNs7L40+HLuxgW3g1KBL3yUGFRnRsgDsMjP41X0zxtcal49Phy4tLRvD11dva
/Yfs6AKCSA+7G7dnknPrRZuy66/gDsrvpp+J5PRWlq9lHo/iW9sfvx2l28XP8SqxH8hWh4z1nSNc
1tbvRdLXTbUQqhhWJIwWBOTheO4/KkndJrqNqzafQn0bw3oN7pkd5qvi61015CQLcWzzuMHHzBSM
Zqv4n8JzeHPsc6XkF/p16he1u4M7ZAOoIPQj0qr4f/4R37XJ/wAJH/af2bZ+7/s/Zu3Z/i39sZ6c
11vxBdZdB8OpokK/8I2iutlIGLSNIT84kyBhs9hkdefRvoJeZWbwBpunLaweIPFdtpeo3MayJafZ
Xl2Bum9wQFrmvEXh+88Ma3Npd9saSPBDxnKupGQwr0jxJJ4Vm1bTj43S+h15YIhdpp7hoQMfL5mR
kHHUJn61yPxNXUv+E0nfUjAfMiRrZrfPlmHHyYzz9ffNJvX5sa2+S/r+vIk1fQPDh8Br4i0VtVVx
fC0eO9eMj7hYkBVHt3ri67of8kPb/sOD/wBFVwtN/E/l+SD7K/rqwrs/B/g3RfFX2e2fxQLPVJ3Z
VsvsDycAE537gvQE1xldn8Kf+SlaR/vSf+i2qoq7sTJ2VzM8T6Jo2iyRxaX4hGqy73SdBZvB5RHu
xOc89PSufq7rH/Icv/8Ar5k/9CNeqeOfG+peGfEtlDpCW8LGyga5kaFXaf5eFJIJCgdhjqaiGsU3
1LkrSaXT/M8erZ17w7LoNvpU0s6SjUbRbtAoI2Bux966bxxdTeE/iTc3uguLGSSFJV8tRhd6DcAC
McnP51u+NfHfibTLHw09nq0kTXelRzzkIh3uc5PIov7t/P8Az/yFbX5X/L/M8jor0f4caTFLpet+
IpG077balIrV9ScJBHI55ds8ZHb3rbvZJdX8N6vB4t8R+GNQeO2aWwltbqHzo5V5CrtAyD0xTloC
1OV8G6B4W8SRPZTnWI9VjtpZ3eOSIQHbyAAVLdMfrXF28Xn3MUO7b5jhc4zjJxXbfCn/AJGm8/7B
tx/6DXHaf/yErX/rsn8xVRV6iXe35slu0G/X8kd/qHwz0ay1h9FXxrajVxtAt7myeJSWAKjfuI5y
K4TVtKvNE1S406/iMVzA2116/Qg9wRzXV/FslfibqZBwQISCP+ua1b+L4DeJNMnYfvp9LgeX1LfM
OfyrOLbSfctpJteV/wAv8zzyivYfH3jS98Ma9bQ6JHbwXcllC9xdvCsjt8uAg3A4UAZ+pqhpvi3U
oPAGta/CLeLUJdXiO9YFKofL5KqQQCQD+Zqu/l/nYldPP/K55bXd23gPRl8N6Vq2reLE01tSV2hi
eweQZU4ILK306gda7vU9Qa98U614dNvbJptxor3bwpAozOYw/mZxnOfftXE+Mf8Akmngb/rnc/8A
oa0m7L+vP/IaV39/5J/qc74n8K3nhi4t/OmhurS6TzLa7t23RzL7H16cVg16RcwHUPgtoEbn96NX
aCFj2Vt2fwzXV6tFqfhm9XSPDWveFtKsbZFWSK6uYhNO2AWaUMpPOfyp2s7f1tf9Rb/152PDKK9J
1vQNG1j4naPZWE9i0GorE94unzK8UcnPmKpHTO3P41FrfxH1bS9cu9N0WOys9HtZWgSyFrGyOqnG
XyMknHPNLp9/4Dt/Xqed0V6D4LNvZ6L4n8XvZ28t3ZBFtI3QGOKSRiNwX24xV2w1i6+IHhPxFBrw
huL7Tbb7ZaXYhVHQKfmXKgZB/wA9qHp8lf8Ar5AtfvseY10mqeH7Sy8DaHrcckxub+WZJUZhsARs
DaMZ/MmunbVLjwH4A0GfRRDDqWr+ZPcXbRK77FICoNwIA5qXxjd/8JD4C8HzrBDby3VzMsixJtTz
CwVmAHTJ5/Gm10XdIS6N+b/A8vor3PVotT8M3q6R4a17wtpVjbIqyRXVzEJp2wCzShlJ5z+VeefE
e20qLxHDPpU1g63NsktwlhKskUc3IcKR0HGce9K/Ydu5x9Few+PvGl74Y162h0SO3gu5LKF7i7eF
ZHb5cBBuBwoAz9TXlWranNrGqT6hcrEs07bnES7VzjGQO1HWwdLlOiivQ9Emj8I/DlfEtrbQS6xf
3htoJ5ow/wBnRRyVB43Eg0+lxdbHnlFb2veMNW8TW0MWrNBcSxOWW4ECJJgjG0lQMj8K7a210eHv
hDod7BbQS6h9tnS2kmQOsOSdzhTwW4AGfU0dG2HVJHldFeieHL26+JXjjS4PERgmjtkkkkZYxGZF
UbtrbcDGQPwJrrLTUdSm1VbfVfEHgp/Drvsk01LqHakR4+X5Qcge9FmB4fRXfeG7LVbTxTraeFn0
5re2Z1/tK72NFBEGO1w7ZHIHXBzXS6nBda74G16TXdb0LWruxjSa2uNPIMsPzYIYhFG0ik37vN8x
2963yPNfDnh2XxHcXsMM6Qm1tJLti4J3BMcDHfmsU16p8MPFeuEajpp1B/sdlpM8tvFtXEbLggg4
z3PWuJ1PxJrvi25s7bVtQe52ybYt6qNpYgHoB7U2veSX9asSfu3f9aI6n4Of8hvUf+vYf+hCvo60
/wCPKD/rmv8AKvL9L0630XxQ2k2X9nrZ2lmVRIHDT7yULtN3BPGM9ga9QtP+PKD/AK5r/Kl6FepN
RRRQAUUUUAFFFFABRRRQAUUUUAeVaHrd74pj1rU7/wAWtodtY3ksH2K2WJDEidGkZ1JJPPtXnE7q
/wCzbdsjs6nWiQz/AHiN/U+9e93ngXwtqGrf2pd6FZTXu7cZWj5Y+pHQn61LJ4O8Oy6VLpb6Ramw
lmM72+35Gkzndj1oA8f+K4A+BXhbAA/49v8A0Sal+PPHw+8LEcETJjHb91XsOoeGNE1XSoNLvtNt
7ixt9vlQOuVTAwMfQUat4Z0XXbOC01TTYLu3tyDFHKuQhxjj8KAPMvHnjHUYvijY+GI9YtvD1gYB
LLqckSFzkMcBn4A42/XP0rnPh9dW5/aA1edNbOrQLZPnUJCo83aseT8uBgYIyOwr27XPCmheJRGN
Z0u2vDF9xpF5X2B64qC28E+GbK9W8tdEs4bhYjCJI02nYV2leO2OKAPFdY8V6N8TfiGltqur29j4
R0pt6pPL5f2t+mcHk5x+A9Ca0/jBeafcnwXr1jLDdeH7a8KO9vhoxhl4446Kw/CvSP8AhV3gf/oW
dP8A+/f/ANetmDw1oltoZ0SLTLZdMOf9FKZTk5PB9+aAPF/jHrmk+Mbvwtpfhq9gv9Ta6LJJbMH8
oHAGSOnODj/ZrR0sf8ZSan/15H/0Wlem6N4I8M+H7s3WlaLaWtwRjzUT5h9CelXI/Dujxa9Jriaf
AuqSLse6A+crgDGfoBQB5P4a4/ag8TY4/wBC/wDZYK674zxPL8KdZEaFiqxsQBnAEi5NdVB4d0e2
12fW4dPgTU512S3QHzuvHBP/AAEflWhNDFcQSQTRrJFIpV0cZDA9QR3FAHzx4h8W6DP+znp+jQ6n
byakYbeI2quDIrI4LZXqBhTz9KyviDBc3Xhf4VW9k5ju5bJUhcNtKuRCFOR05xzXusXw28GQxXEa
eHLAJcACQGPOQCDj25APFaE/hHw/dLpqz6TbSDTABZBl/wBRjGNvp91fyoA8k+FErfD/AMbap4G1
xIUu7txNa3u3H2jjhcnqDgkD13Dqa91rJ1TwxomtXltealptvc3NqcwSuvzR854P15rWoAKKKKAC
iiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK
KKACiiigApsjrHGzscKoyadWH4ruLqHRmisoGmuJ2CKo9O/6UAcJ4k1O/wBXvQblXhsR80EJ6MOz
H1pNG0q41a4WOJSIwfmfsBXX3em3ev2kMU2nx2SIB8zPll9gBW9p+nwabarbwKAo6nuTQAafp8Gm
2ywwrjHU9yat0UUAFFFFAHnHxR/5FnW/+uK/+y181ivpT4o/8izrf/XFf/Za+axTExaKKKBBRRRQ
AUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAB
RRRQB9J/CD/kndl/vy/+jGrum+6a4X4Qf8k7sv8Afl/9GNXdN900ij490yCzutSghv737FaO2JLj
yjJ5Y9do5NemagfAl94N0vw//wAJqUFhLJIJ/wCy5j5m8k429sZ9TXlFFN6qxK0dzrvBniDTtKOq
6Tq/mtpGqQ+TLJEuWjYE7XA9s9K0LnVvDnhjwnqWk+H9Tm1W91Xak901s0CRRDnaA3JJyfzrgaKH
qNaM6XQdM8KX1gW1nxDcaZdrIflFm0yOmBjBXoevWrPi7xFpt1ZaboWgLMuk6aGZJZhh55WOWcjt
7fWuRooYloelX+p+DfGM9jrOt6tc6bqEUSR3tslq0guSvdGHC5HrWNq+v6P4t8cy32sG6s9JZPJh
8hQzxKq4TI+vJHvXHUUdf66h0PStDm8B+D9SXXINeu9Yu7cMbe1SyaEByCBuZuO/b9a88vbp76+u
LuQASTyNIwHTLHJ/nUFFLqMK6/wNF4ct9QttW1nxEdPns7pJEtvsUkvmquDncvTniuQoqk7aktX0
O08eDw5danda1o3iM31zd3Rka1+xSReUpyc7264OB071rX+p+DfGM9jrOt6tc6bqEUSR3tslq0gu
SvdGHC5HrXmtFSlZWXQpu7udB4z8RjxT4muNRjiMVvhYreM9VjUYGffv+NS6knhceCdLawkY+IDI
ftqESYCfNjqNv93pXNUUW0sF9bm/4es/DF7BcR67ql3p0+4eRNFB5seOc7lHOenSukl1fwt4W8K6
rpegahcavf6oghluXtzDHHGOoCtznk/5FeeUU3roJaHS6DpnhS+sC2s+IbjTLtZD8os2mR0wMYK9
D161Y8X+IdNvLDTdB0FJhpGnBiskww88jfecjt7fWuSooeoLQ6XQE8Lt4e1s61Iy6oIx/ZygSYL4
PXaMdcfeqj4Yi0aXxDaL4guHg0wMWmdVZiQBkD5QTycDj1rIop31uFtLHqXiUeDfEuoLPN4+EFtC
vl2tpFo83lwRjoqj+Z71zvhDX9M0iXV9H1R5ZdF1OIwSTRJ8yEE7JAp+vSuPoqUrDbO+udW8OeGP
CepaT4f1ObVb3VdqT3TWzQJFEOdoDcknJ/Ouc8JLoL+IrceJXZNL2t5rLvznadv3AT1xWJRTW9xP
axZ1EWo1S7FiSbMTP5BOeUydvXnpjrXW6bpnw/SK2vb/AMRXzFVVptPWybezY5USfdxn9K4mihaI
HqzoPEeup4s8Wvf3J+x2krpEuF3+RCMAcDrgc4Heu3U+BF8DP4Z/4TY4a9F39o/subj5cbdv9c15
RRStpYd9bnc+GNc0LT7TX/DWqXEz6RqLARX8MR3KUY7XKHnB4OOvarUWq+F/CHh3WLXRdWn1nUdU
h+zGU2rQRwxnrw3JPNeeUUPUE7fmem+FL3wlp3g6SIeJjpWuXoKXVx9hlmeOPJ+RCoAGRgkgk/05
PXtJ8OWEdu2j+JjqrO+JVNjJB5a+uW6/SueopvV3EtFY9Z1SXwLd6BaaHp3jQ6dpsXzzRrpcztcS
/wB92wM+wxgfljgL2x0K18Qw21vrEt9pRKebdx2zRMAfvYRucj9axaKOtw6WPRtLu/BPgy4bWdO1
i51vU40YWkBtGhSJyMbnLdcZ7V55NK880k0rFpJGLMx7knJplFLrcYV6b4UvfCWneDpIh4mOla5e
gpdXH2GWZ448n5EKgAZGCSCT/TzKin0sLrc3/EOleHtPghfRfEh1aR2IkQ2MkGwY65brWlZ63pul
fDO9060ud2r6pcqLlAjDy4F5A3EYOT6HvXHUUujXcfVM6HwT4jTwr4qtNVlhaaFNySov3irDBx78
5rqdMk8AeHdfXxDba9eXpgcy2+miyZHDc4DSH5SBmvNaKd+ovI6Gyk0jX/EN/deINQl01LpnmWWG
EyhXZs4KjnGCelbWoax4d8O+Fr3RPDV5PqNzqRUXd/JCYlEanIRFPPPfP/6uEopW0sh31uem+FL3
wlp3g6SIeJjpWuXoKXVx9hlmeOPJ+RCoAGRgkgk/05HxDpXh7T4IX0XxIdWkdiJENjJBsGOuW61g
UU3q7iWisdjZ63pulfDO9060ud2r6pcqLlAjDy4F5A3EYOT6HvWBoev6n4b1A32k3P2e5KGPf5av
8p6jDAjtWbRR1uHSx6r4Z+Lmr+Tq/wDb2ufvPsT/AGH/AERP9f8Aw/cT/wBC4rzPUNQutV1Ce/vZ
fNuZ3LyPtC7mPfAAAqtRStrcd9LBXoHw6k8LaNqdlr2q+JDa3du75svsMj5BUqDvXI756V5/RVJ2
JaudJ4ttNAhvPtWi6+dUNxLI8qGzeHysnI5b73U/lVj4g6zYa54khu9OuPOgW0hiLbGX5lXBGGAN
cnRUpWSXYpu7udX8Q9YsNd8Um902fz7f7NCm/Yy/MqgEYYA9a1ru78MeK9A0RdQ199IvtNtBaPG9
lJMsgU8MCnT8a8+op9LfP+vvF/w39fcdb4S8Q6bp1rquha0sz6RqaqrywD54nU5VwD19xRfaV4Ks
dPuZLfxLd6ndlD9nhisWhAbtvLnkfSuSooeo1odJ4F1+18OeJo7u+R2s5Ynt5/LGWVXGMj6cU3Vb
Dw/pd7ZTaR4iOpoZt0imzkhMSggjJb73fp6VztFNOzT7Cto13PVvE1x8Pdb8WT+IbrxLc3MblGNh
b2Eis21QMb2wOce3WuG8X+JJPFXiOfU2i8mMgRwxZz5ca8Af1/GsKipStbyHc6v4hazYa54kju9O
n8+AWkMZbYy/Mq4IwwBqO11axj+Gt9pLz4vpdRjnSLY3KBCCc4x17ZzXMUU+/n/ncXby/wArHp8n
i3Q28eXmpC+/0OTRTapJ5T8y+UF24xnqOuMVHJdeENf8EeHNP1LxM+n3OmpKJYksZJS25s43AADg
e/WvNKKHr/Xr/mC0/ryS/Q7HxX4psLmx0rQ/DyTx6VpZLxyz4Ek0pOS5A6d8fWtPV73wh42uI9Y1
HWZ9D1Ro1W7iNm06SsoxuQqeMgd//wBfndFHqM6GTUNN8PeK7O/8Nz3FzDZsknmXShDI4PzcDop6
etb+qQ+Ate1KbWT4gvNN+0OZZtPNi0jhzywVwduCc9a8/ooEdj4T8QaRYR61omqfaF0XVVCiZFDS
QlSSjEd/fFXX1Tw34V8Marp+hapNq+oaqghe4Nq0CQxdxhuST/npzwNFJ6oadju7PVfD3iLwdp+i
a9qUulXelu/2a6W2adJI2OSpVeQc0/xdr2gTeEvD2meH7mZ302WUt5sZV+SCHPGPmOTgE471wNFN
6/mJaHomr3vhDxtcR6xqOsz6HqjRqt3EbNp0lZRjchU8ZA7/AP6+O12PRodREeh3FzcWioAZrhAr
O/cgDoOmM81mUUeg7nV/ELWbDXPEkd3p0/nwC0hjLbGX5lXBGGANcvFs85PM+5uG76d6ZRQtHcT2
sdF40Tw0mtqPCsjSaf5K5Lb8+Zk5++AfStLw/rujXnhSXwt4ilntbcT/AGm0vYY/M8l8YIZepU+3
rXF0ULaw+tze12w8OWFvCmj61PqtyzkySG1MEarjgAMck5r0Tx9aeE9R8RWg1jWLjS7qCzhEgW1M
y3CbcjaV+63JHPHSvHa1vEPiC78S6mL+8jhjlESRYhUhcKMDqTzR0+f6C6/L9Ud3pHiKDxJ8Z9Fu
LOJorG3AtrVH+8I0RsE+55NJHdeCNH8W3HiYandvcwzySppH2UgibJ/5a52lc8jv0rgNC1m48Pa3
a6raJE89sxZFlBKk4I5AIPf1qncztdXU1w4AeVy7BemSc8Udref4h3v5fhcmurxtS1ea9uutxOZZ
cf7TZP8AOtfxonhpNbUeFZGk0/yVyW358zJz98A+lc7RStokug76tvqdbpml+Cb7TLd73xHeaZfB
f36PZGZCcn7pXoMY61b8U+JdHTRtI8P+HPPmstNlNw11cLtM0pPUL2HJ/wAiuHop31Eel65d+B/G
mqJr17rt1pN1IiC6szZtLuZQB8jrwOB3rm/HXiS38T6+k9jC8VlbQJa26yfeKLnk+/JrmKKVl8h3
PQbmyurH4KeXd201u7a2GCzRlCR5XXB7V59Wje6/rOp2629/q1/dQKQyxT3LuoI4BAJxWdT6t/1t
YXRL+twr0D4dSeFtG1Oy17VfEhtbu3d82X2GR8gqVB3rkd89K8/opp2E1c6TxbaaBDefatF186ob
iWR5UNm8PlZORy33up/KrHxB1mw1zxJDd6dcedAtpDEW2MvzKuCMMAa5OipSskuxTd3c6v4h6xYa
74pN7ps/n2/2aFN+xl+ZVAIwwB61rXd34Y8V6Boi6hr76RfabaC0eN7KSZZAp4YFOn4159RT6W+f
9feL/hv6+463wl4h03TrXVdC1pZn0jU1VXlgHzxOpyrgHr7ii+0rwVY6fcyW/iW71O7KH7PDFYtC
A3beXPI+lclRQ9RrQ6TwLr9r4c8TR3d8jtZyxPbz+WMsquMZH04puq2Hh/S72ym0jxEdTQzbpFNn
JCYlBBGS33u/T0rnaKadmn2FbRruereJrj4e634sn8Q3XiW5uY3KMbC3sJFZtqgY3tgc49utcN4v
8SSeKvEc+ptF5MZAjhizny414A/r+NYVFSla3kO51fxC1mw1zxJHd6dP58AtIYy2xl+ZVwRhgDUd
rq1jH8Nb7SXnxfS6jHOkWxuUCEE5xjr2zmuYop9/P/O4u3l/lY9Pk8W6G3jy81IX3+hyaKbVJPKf
mXygu3GM9R1xio5Lrwhr/gjw5p+peJn0+501JRLEljJKW3NnG4AAcD3615pRQ9f69f8AMFp/Xkl+
h2PivxTYXNjpWh+Hknj0rSyXjlnwJJpSclyB074+taer3vhDxtcR6xqOsz6HqjRqt3EbNp0lZRjc
hU8ZA7//AK/O6KPUZ0Mmoab4e8V2d/4bnuLmGzZJPMulCGRwfm4HRT09a39Uh8Ba9qU2snxBeab9
ocyzaebFpHDnlgrg7cE5615/RQI7Hwn4g0iwj1rRNU+0LouqqFEyKGkhKklGI7++Kuvqnhvwr4Y1
XT9C1SbV9Q1VBC9wbVoEhi7jDckn/PTngaKT1Q07Hd2eq+HvEXg7T9E17UpdKu9Ld/s10ts06SRs
clSq8g5p/i7XtAm8JeHtM8P3MzvpsspbzYyr8kEOeMfMcnAJx3rgaKb1/MS0PRNXvfCHja4j1jUd
Zn0PVGjVbuI2bTpKyjG5Cp4yB3//AF8drsejQ6iI9DuLm4tFQAzXCBWd+5AHQdMZ5rMoo9B3Or+I
Ws2GueJI7vTp/PgFpDGW2MvzKuCMMAa5SiigQV2nh/XdGvPCkvhbxFLPa24n+02l7DH5nkvjBDL1
Kn29a4uijyDzN7XrDw5YW0KaPrU+q3LOTJIbUwRquOAAxyTmrupazYXHw10XSYp919bXc0ksWxht
VuhzjB/A1ylFLpYfW5teE/EEnhfxJaaqkXmrESskWcb0YYYfka6CfSvh5cXb3yeJ76C1di/2D+z2
MqZ52iTO38a4WimI7bwzrOgppev+HtSubmy0/UnR4LsReY0exiVDqOTkY6Vp2eqeENB8IeItHsNU
mvby9t1C3T2zxrKwPCKvJGOSSxGc15tRSaurd9Bp2d/mdR4D12x0LXZ21MyLZXlpLaSyRruaMOPv
Y79Kpa3YaPpT28ui+IRqjFiWxaSQGLGMH5uv4elYlIafVMXke3+ENc03xL4km1e3ilh1KayCX8TD
5N6lQrKfcZ/KvZrT/jyg/wCua/yr5x+Dn/Ib1H/r2H/oQr6OtP8Ajyg/65r/ACpFE1FFFABRRRQA
UUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABR
RRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFF
FABRRRQAUUUUAFFFFAHnHxR/5FnW/wDriv8A7LXzWK+lPij/AMizrf8A1xX/ANlr5rFMTFooooEF
FFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUU
UUAFFFFAH0n8IP8Akndl/vy/+jGrum+6a4X4Qf8AJO7L/fl/9GNXdN900ij490y+Gm6lBeG1trsR
Nu8i6j3xv7MvcV6pqfiOxs/AGi69H4P8MG6v5pY5EbTl2KFJAxznt615BXoGv/8AJGfCv/X3cf8A
oTU5fB80SviXz/JlXwPpWnS22t+JNXtFubTSoQ6WpOEklckKD7e3vWiy6d428IazdrodjpWr6Qi3
C/YIjEksJ6grnqAM5+lReDma4+GnjK0hGbhBb3IXGcqrZJx7YrX0TxJfeIdK8Z6/qiQRhdJWzBhT
YpJyFHU8/wCNKfVdl+l/z0HHo31f+X6amXH/AGZ4L8D6NqZ0Ww1TVNXMkhbUI/NjijU4AC5HJyOf
rVTxdpVhf+G9F8U6Vp8dh9vd7e4tYf8AVrKp4KjsDg8VFp3inQr7wva6D4osb6WOxdmtLqwdRIoY
5KkNxjNdF4q1Ozj+G3hmO3sWsbVr8zWsEjbpDCmcux7li2fTmqaTfzX3f1/mJbfJ/wBf16EWtXWi
eA7608Pr4a07U/KhjfUrq7iLyszDJCN/BgHisHxTpen+DfHoMdkl9pbItzBbTOQrI6nAJ64B/lXR
fETxBqej+LddsbOOCS1162gO549zFdgUFD9cjvWR8WyF8TWFn1ltNMghlx2YAn+RFTd6S63/AM9P
kVZbeX+X53ZreFb3TfHmpPot54P0u0tnhdheafAYntyBkMzd+eOa8tlQRzOisGCsQGHf3r03wR4v
1zxPqVt4S1W4e60u6hNuViURPEqocEMgBOMDO7IPevONQthZaldWivvEEzxhx/FgkZ/Sh6SEtYla
u3+H+raTDqVjpd34bsb+4u7xEN1dfPsRiBgIRjI5OfeuIrd8F/8AI76H/wBf0P8A6GKuHxJES2bH
eMrWKDxzq9rawxxRLeOkcUahVUZ4AA4Ars9autE8B31p4fXw1p2p+VDG+pXV3EXlZmGSEb+DAPFc
r4ykEPxK1aVvupqDMfwauu+IniDU9H8W67Y2ccElrr1tAdzx7mK7AoKH65Hes4fBHz/y2/rsaS+O
X9dTkfH/AIftvDniqW2sSfsM0aXFtk5IRxnGfY5FZd14d1Wz0K01q4tdmnXbFIJvMU7yM8bQcjoe
orq/i4wTxNYWeQZbTTYIZfZsE4/IiuYvNQ16bw5ZWV21z/Y8Tk2weLEe7nO1sc9T3prZ27/hcW7V
+36FHTdOudW1K30+zjMlxcSCNF9z/SvSPF+m6DbfDGA6TaW7SWmp/Y3vhGvmXBVGLtuxnaWzgZ6A
VnfD+ztBomr30WtaTYazIPstqdQuhCIkYfO69STg4HHHNdBe+E/J+Dy2P/CQaDJ5Wotc/aEvcxPi
M/u1bHL/AOzTnpFr0/Nfp/WgQ1d/X8n+pyvw/wBW0mHUrHS7vw3Y39xd3iIbq6+fYjEDAQjGRyc+
9Y3jW3htPG2s29tDHDDHduqRxqFVRnoAOAKTwX/yO+h/9f0P/oYqXx7/AMj9rv8A1+Sfzolun6/o
C2fy/Uo6d4d1XVtNvtQsrXzbWwXfcyeYq7BgnOCQT0PTNQaTeW9hqcN1dWMd9DGSWt5WIV+DjOPf
n8Kt6VqGvWuk6lb6Y1yLCdMXoii3KVwfvHBxxn0rHAJ6CjZ6C6HqvhW903x5qT6LeeD9LtLZ4XYX
mnwGJ7cgZDM3fnjmuL0HWdL8PyXrXWh2ur3BYLbtcsTEgGckr/Fniuv8EeL9c8T6lbeEtVuHutLu
oTblYlETxKqHBDIATjAzuyD3rirLwze6r4nl0TTgJnjmdDKeEVFOC7HsO9DXvadUF/d1OtnGkeMf
AWsawNEstJ1LSWjIexTy4plY42lemf8A61eb12XijW7Cy0mPwn4fk36dA/mXd30N5MP4v9wdh7Vy
Vta3F5OILWCWeVukcSFmP4Clu21sN6Kz3Iq9E+Guh6eLy01XW7WK5gurpbKytplDLK5++5B4KqP1
IrhLW1Eupw2ly4tg0yxyPJx5eTgk56Yr2aLQoLrx3oMun+JfDZ0rS3jjs7OLUA0zKDknaBguxyet
XHdeZMup5xqd9D4d+IerTQ6Xp9zDBdzxpaXUAeEDcQPkGBx2rtfBviSz1+9vZNQ8H+F4dNsLV7m5
ki00BsAcAEkjJPt2Ncd8RdL/ALN8Zag/2+xuvtVxLNttZt5iy5+WTj5W9q1Jh/wjXwjii+7e+Irj
zG9Rbx9PzPP0NZxf7u/lb5/1qXJfvLef4GFoviLS9Mub+8uvDtnqFxO+63SfiGAZJI2Dg9QAO2K6
WcaR4x8BaxrA0Sy0nUtJaMh7FPLimVjjaV6Z/wDrVxOhaFfeItVi0+wj3SvyzNwsajqzHsBXQeKN
bsLLSY/Cfh+Tfp0D+Zd3fQ3kw/i/3B2HtTa9233f1/VxJ+9f7yHSPFul6LpMFvF4U0u9vBkz3WoK
Zt/JwFXouBgVe8c6ZpT6DoPiXTLFdPOprIJrND8ishxuX0B/wrK8KeGE1czalqcxtNCsvmurk9W9
I09WP6Z+lReLPEr+JNRjMMAttOtUEFlar0ijHT6k9zTl+P6BH8Df03xjYXN3b6fB4C0WaGRljKLA
zzt24frn8Ku/8ILpT/GN/D6M/wDZcf7949+WChN5TPXrx64rnfDPj/xF4YhSx065U2ZlLtbNEp3k
4B+bG4Zx2NbniSc/D74pR6lp4eQMi3LwTyFmxIDvQsck9+Tnt1pvdP1++wujRa0PVtB8Y+IT4bn8
K6XZWl1vjtbm0iKXETAEqWfPzdK82vbV7G+uLSX/AFkEjRt9VOD/ACr1fwPfeFLjx1az+H9G1Jb6
V2eQ3UqmC0TBLsm3k8ZA3eteZeILmO98R6ndRHMc11LIh9QWJFRs16FaO5nV1mkeLdL0XSYLeLwp
pd7eDJnutQUzb+TgKvRcDArk66Xwp4YTVzNqWpzG00Ky+a6uT1b0jT1Y/pn6VZJr+NdP0r+xPD/i
jTNPjsDqQfzrIHMYZDjKj0Pp9KtaL4zfWtas9Mg8FeEvMuZVjB/szpk8n73Yc1zHizxK3iPUYzFC
LbTrSMQWVqvSKMdPxPc1v/DqNdIsdc8XTKMabbGK1z3nk4H5A/rSi7Xb21f/AAAaeiW+xbvrHQ/E
nxoj0mG2trPSlm+zlLVBEshRST93HLMCM/StPR7nTdf8Zz+FbzwXpdrYAyxmWGAx3EAUHDtJnnoO
vrXHfD7R4vEfjmytbyWQIS07lHKuxUFsAjkEkdRzXXaD481zxP4wTw7qyLPpN7I1vJabMNGuDzvH
zkjHJJPehRdlHrr/AF/X4DbV3LpoYnhXSdJsdJ8R+I721j1OLS3WG1gl/wBXIzNgMwHUdOPrU+NO
8ceDtavk0Ow0zVdIVZw2nxmKOWIk5BXJ5GCc1Q0zW7LwnqniHw7qFtJf6JcytBKsbhZBsY7XU9M1
1Gg3+g2vgTxa2h2F7Dp/2Ty5Lq/dTJLK/wAqINvygDJ/76qW7xbXbT+v67DWkref9f18zitF8W2e
j6bHar4V0e+uATvuL6Iys+TwAOAMDitfxroVjJp/hzVrPTV0m61cMs1kMhVIYAOoPQHPT6Vy2geJ
dY8LXclzpF19mllTY5MSvuXOcYYH0rrPGrzaz4T0HxjdF4tTuZHglXe219hO10Un5enIHGTVu2jf
dEq+qXmXvEOqaF4K18eG4PCul31rbLGt1cXcReeVmUFir5+XrVS88AWp+LFt4fty6abdbblOfmWE
qWIz+BAP0pt34p8K+Jr621PV9D1KbXdqI0VrKogunGAN2RuGeBgV2k2po3x40qKcxpOunC3lC9Fl
aNm2j8wKSurPd6/PQG1Z22t/kc7pmoeG/E/iZ/Cx8MadZ6dO0kFlewRlbhXUHazPn5s46e/Oa8wv
bSSwv7izl/1kErRN9VOD/KvR/B2raveeLtB8Kzwwrb6Tfyy5WPEgxuLbj6dfT8a4XxJcR3fijVri
Igxy3krqR3Bc4qez7/8AA1/Mp9V2/wCD/wAAy69G+F+q2l3rmn+HLzw9ol3DM8ha5uLMST/dLY3H
jHHpXnNdn8Kf+SlaR/vSf+i2rSG9jOW1yj4w12PVr9rWLRdI05bSaRA1hbeUZBnHz889P1Nah+Fe
sxXUcFzqOj2vnIrQPcXfliYsM7UBXLEZGeMc9a5PWP8AkOX/AP18yf8AoRrsfixNI3i6zUucR6fb
hBnpxn+ZrOHwxfe35Gk/ia7X/NHOf8Ixdw+JJtD1G6s9NuYSQ8l5KViGBkfMAeo6cV23inwBp6Wm
hm11vw7YMdPQzNNdMouH7yL8pyD68Vj/ABa58dOx+81pASfU7BS/EP8A5Bng89v7Fi/maf2fnb8x
Lf5X/I5rRPD2o+IdSay06NZHQF5JGYLHGg6szHoK09W8CajpmlyalDe6ZqdpCQs8mnXQm8knpuGA
RXReAprK3+HniyW4097/AGmAz28c5hZosn+IAkAHJP0qha+NfD+nWGp22leEZLZ7+0e2d21NpQAR
12lOcHmnLTRBHXVmn8LfEerzXU+hyXrtpkWn3Dpb7VwDjOc4z1J715zYqr6hbKwDKZVBBGQRkV2X
wo58VXSjq2m3AA9TtrjrD/kJWv8A12T+Yqo/xF8vzZMv4b+f5I9U8Za/oWheNbnQrnwdocmlx+WG
eC28mcBkUkh17jJ7CuH8d+G4vC/ieWytpGks5EWe2Zuvlt0B+hyPwrV+K0Uk/wAUdQhiQvJIYVVV
GSSY1AAqf4vSIPFNjZBg0tlp0MEuOzcnH5EVnHWMWaPdry/yKzfC3WoZyt3f6TZwbEZbm6ujHE5Y
Z2qSuSQCM8Y96r23w41W4F67ahpMEVlcrbzTT3W2MFlBDBsYKnI9+elX/i7czTeKbSB3Jjh0+AIu
eBlcmqtiSPg7qmD11eH/ANANV3fb/OxC6Lv/AJXG3vwy13T7e+eebT/Os42ma1W5BmeIdZFXH3fc
4+ldBdanYeGPh/4VuU8NaHfS30c3nyXdmGc7WGMMMHPPfPatidi/xP1IMcg+HGB/78iuU8Y/8k08
Df8AXO5/9DWk7pW81/7cv0HGzafk/wAk/wBSt4x0bS5fD2leK9EtTZ2t+zRT2m4ssMq5+6T2ODVa
x+HeqXVjb3V1f6Tpn2ld1vFqF2IpJgehVcHr74rdu1jsPhF4ZtL8bDd6obkI3XyhkE/TkfnWh8R9
W8O2njO6i1TwnNeShIzHcDU3iV02jG1QpAHbj0NNpJtef6L/ADBaq/l+tjzPVNF1DRtWk0u+tmjv
EYKYxzuz0xjqD2xXTD4Zauixpd6lotjeyKGSxur5UnbPQbcYyfrWnp/iay8UfE7wxcvpv2G3t/Kt
lR5/N3bSdhLFR3IH4VyXjH7V/wAJnrP23f5/2yTdu643HH4Yxj2pdr+f4f8ADh3+X4jdG8Larrur
zabZwp50G4zvI4WOIKcEs3QCr2s+BtS0fSzqiXenalYK4SS4064EyxsegbgEVseEd/8AwrTxr9nz
9q22+/H3vL3Hd+GM5o8Abv8AhFfGvnZ+x/2b82enmZOz8etD0v5K/wCv9eYLW3m7GJofgrUdc02T
U/tNhp+nq/li51C48lHf+6pwcmuj8a6VdaL8NvC9heKgmjuLk5RgysC2QwI6ggg1W8X5/wCFaeCv
Iz9l8uffjp5m4Zz79at65u/4Vr4F+358v7RNnd/zz3jH4Yqmr3Xml+Ik7Wfk3+H9fMxLH4d6pdWN
vdXV/pOmfaV3W8WoXYikmB6FVwevviuf1fSL7Q9Tm07UYDDcxHDKTkexB7g+tem/EfVvDtp4zuot
U8JzXkoSMx3A1N4ldNoxtUKQB249DXD+MPE0XijULO5h002KW9qlsqNOZSwUnBLFR2OPwqU72aHa
25qt8LdahnK3d/pNnBsRlubq6McTlhnapK5JAIzxj3rk9W0ybR9Un0+4eJ5YW2lon3I3GQQe4wa7
P4u3M03im0gdyY4dPgCLngZXJrgQCSAAST0Ao3b+f5h0XyErc8PeE9T8S+e9mIYrW3GZ7q5kEcUX
1Y/0rKurO6sZfKu7aa3kI3bJUKHHrg13M+//AIUbafZM7P7Wb7Zt9dvy7vb7v6U+jf8AW9hdUv62
uc7r3hS50G3huTqGmX9tK5jWawuRKoYDOD0IP4VuSfCrWbeeOK61LRrXzlUwNcXflickA7UBXJIy
AeMZ71wwz+Ga9A+L32j/AISuy8zd5f8AZ0Hk+mMHOPxzRsvn+gbv5fqjm7fwjqs3i5PDMqR22otI
Y8TMQgOM5yAeCO4rYb4X64EmRLnS5L+FS7acl2Dc7R32Y9OcZz7V21zn/hcXg7zf+Pv+zoftGeu/
Y/X3rj/D/wBu/wCF0w7t/wBq/tR/N9cbju/DGaErtR9fwdgbsnL0f3nDLGzSCML85O0A8c1oa5oG
p+G78WOrW32e5KCQJ5iv8pzg5UkdjU3iYovjHVjaY2C+lMe3/fOMU3xFf63qOpLNr5uDeCMKPtEX
lts5xxgcdalO8UymrSaNPRfFtno+mx2q+FdHvrgE77i+iMrPk8ADgDA4rT8e6Rp8ej6Brttpo0m4
1NHM9iuQqlSMOoPQHPT6VzWgeJdY8LXclzpF19mllTY5MSvuXOcYYH0rr/GMUniTwx4e8U3rNFqF
9M1pMCxKMASA6qT8o45A45q2r2fmiU7Xv5mh4hn0/wAF6np2h6f4S0vUoJbeN2ubu3Mst0W6lGzx
+Ga5T4i6Pp+heM7mz0sbLfYknk7t3kswyUz7f1rrfFPjDW/AGuxeG9EnKafYxRgC4XzTPlQSSWyQ
OSMLgCub+J2kWuleKI5LSMwrfWsd28BYny3bO4c89Rn8alu9pLuxpWVn2Rravrmpa/8ABlbnVLpr
maPWBErMoGFERwOAPU15rXdD/kh7f9hwf+iq4Wm/ify/JAvhXz/NhXo3wv1W0u9c0/w5eeHtEu4Z
nkLXNxZiSf7pbG48Y49K85rs/hT/AMlK0j/ek/8ARbVUN7ES2uUfGGux6tftaxaLpGnLaTSIGsLb
yjIM4+fnnp+prUPwr1mK6jgudR0e185FaB7i78sTFhnagK5YjIzxjnrXJ6x/yHL/AP6+ZP8A0I12
PxYmkbxdZqXOI9Ptwgz04z/M1nD4Yvvb8jSfxNdr/mjnP+EYu4fEk2h6jdWem3MJIeS8lKxDAyPm
APUdOK7bxT4A09LTQza634dsGOnoZmmumUXD95F+U5B9eKx/i1z46dj95rSAk+p2Cl+If/IM8Hnt
/YsX8zT+z87fmJb/ACv+RzWieHtR8Q6k1lp0ayOgLySMwWONB1ZmPQVp6t4E1HTNLk1KG90zU7SE
hZ5NOuhN5JPTcMAiui8BTWVv8PPFktxp73+0wGe3jnMLNFk/xAEgA5J+lULXxr4f06w1O20rwjJb
Pf2j2zu2ptKACOu0pzg805aaII66s0/hb4j1ea6n0OS9dtMi0+4dLfauAcZznGepPevObFVfULZW
AZTKoIIyCMiuy+FHPiq6UdW024AHqdtcdYf8hK1/67J/MVUf4i+X5smX8N/P8keqeMtf0LQvGtzo
Vz4O0OTS4/LDPBbeTOAyKSQ69xk9hXD+O/DcXhfxPLZW0jSWciLPbM3Xy26A/Q5H4Vq/FaKSf4o6
hDEheSQwqqqMkkxqABU/xekQeKbGyDBpbLToYJcdm5OPyIrOOsYs0e7Xl/kVm+FutQzlbu/0mzg2
Iy3N1dGOJywztUlckgEZ4x71XtvhxqtwL121DSYIrK5W3mmnutsYLKCGDYwVOR789Kv/ABduZpvF
NpA7kxw6fAEXPAyuTVWxJHwd1TB66vD/AOgGq7vt/nYhdF3/AMrjb34Za7p9vfPPNp/nWcbTNarc
gzPEOsirj7vucfSugutTsPDHw/8ACtynhrQ76W+jm8+S7swznawxhhg55757VsTsX+J+pBjkHw4w
P/fkVynjH/kmngb/AK53P/oa0ndK3mv/AG5foONm0/J/kn+pW8Y6Npcvh7SvFeiWps7W/Zop7TcW
WGVc/dJ7HBqtY/DvVLqxt7q6v9J0z7Su63i1C7EUkwPQquD198Vu3ax2Hwi8M2l+Nhu9UNyEbr5Q
yCfpyPzrQ+I+reHbTxndRap4TmvJQkZjuBqbxK6bRjaoUgDtx6Gm0k2vP9F/mC1V/L9bHmeqaLqG
jatJpd9bNHeIwUxjndnpjHUHtiumHwy1dFjS71LRbG9kUMljdXypO2eg24xk/WtPT/E1l4o+J3hi
5fTfsNvb+VbKjz+bu2k7CWKjuQPwrkvGP2r/AITPWftu/wA/7ZJu3dcbjj8MYx7Uu1/P8P8Ahw7/
AC/Ebo3hbVdd1ebTbOFPOg3Gd5HCxxBTglm6AVe1nwNqWj6WdUS707UrBXCSXGnXAmWNj0DcAitj
wjv/AOFaeNfs+ftW2334+95e47vwxnNHgDd/wivjXzs/Y/7N+bPTzMnZ+PWh6X8lf9f68wWtvN2M
TQ/BWo65psmp/abDT9PV/LFzqFx5KO/91Tg5NdH410q60X4beF7C8VBNHcXJyjBlYFshgR1BBBqt
4vz/AMK08FeRn7L5c+/HTzNwzn361b1zd/wrXwL9vz5f2ibO7/nnvGPwxVNXuvNL8RJ2s/Jv8P6+
ZiWPw71S6sbe6ur/AEnTPtK7reLULsRSTA9Cq4PX3xXP6vpF9oepzadqMBhuYjhlJyPYg9wfWvTf
iPq3h208Z3UWqeE5ryUJGY7gam8Sum0Y2qFIA7cehrh/GHiaLxRqFncw6abFLe1S2VGnMpYKTgli
o7HH4VKd7NDtbc1W+FutQzlbu/0mzg2Iy3N1dGOJywztUlckgEZ4x71yeraZNo+qT6fcPE8sLbS0
T7kbjIIPcYNdn8XbmabxTaQO5McOnwBFzwMrk1wFHV/P8w6L5BW54e8J6n4l897MQxWtuMz3VzII
4ovqx/pWHXoE+/8A4UbafZM7P7Wb7Zt9dvy7vb7v6U9k3/W9hbtL+tjnde8KXOg20N0dQ0y/tZXK
LNYXIlUMBnB6EH8KuaX8P9Y1fSLTVLaSzW0uHkUvLKUEITgs5IwB9CT7VyvOPavQNVuZo/gnoNuj
lY5tQmLgH720nGfzo2Tfp+YbtL+tmc/rHhC/0m+srSO5stSe94gbTpvOVzkDGcDnkVqv8MNZAeKO
+0ebUY1LPpsV6rXIwMkbcYz+NSfCLyf+Fh2fmgF/Kl8oE4y+w4/HGalg8W+GtH11b1PBVzHqFtOX
3PrEhIcHnIKetG1kG92czofhy8165nhhmtLVbdd00t5MIkjGcck+9XtY8D6hpOltqcd5pup2KMEl
n065EyxMegbgEVraXZaRrK+JvGGsWUzWdtOHXToZdpZ5XOAz4yFHqAP6VuaLd6VqPw+8YyaX4cGl
RJbRh3F3JMJG3ZA+fgEdePWk78t+qVxpLm8m7Gf8P/BlhqcV5dXuo6NcCTTpWS2advNt34w7rt4A
9cnrXH65oC6IsJXWdJ1HzSRiwnMmzGPvZUYzmui+F/Op66O50W5x+S1xln5X2+38/wD1Pmrvz/dy
M/pVWvNL+t2K9ot/1sj1L4XaDqGkXr3d9EIVvrQvChYbyoZfmK9QDnjPXBr3u0/48oP+ua/yrzGO
aB/ibqkUdg8EqWaEzmYus6HZs2rjCgYYcZzXpdoJPscGHTHlr/CfT61N76lWsWaKZiX++n/fB/xo
xL/fT/vg/wCNAD6KZiX++n/fB/xoxL/fT/vg/wCNAD6KZiX++n/fB/xoxL/fT/vg/wCNAD6KZiX+
+n/fB/xoxL/fT/vg/wCNAD6KZiX++n/fB/xoxL/fT/vg/wCNAD6KZiX++n/fB/xoxL/fT/vg/wCN
AD6KZiX++n/fB/xoxL/fT/vg/wCNAD6KZiX++n/fB/xoxL/fT/vg/wCNAD6KZiX++n/fB/xoxL/f
T/vg/wCNAD6KZiX++n/fB/xoxL/fT/vg/wCNAD6KZiX++n/fB/xoxL/fT/vg/wCNAD6KZiX++n/f
B/xoxL/fT/vg/wCNAD6KZiX++n/fB/xoxL/fT/vg/wCNAD6KZiX++n/fB/xoxL/fT/vg/wCNAD6K
ZiX++n/fB/xoxL/fT/vg/wCNAD6KZiX++n/fB/xoxL/fT/vg/wCNAD6KZiX++n/fB/xoxL/fT/vg
/wCNAD6KZiX++n/fB/xoxL/fT/vg/wCNAD6KZiX++n/fB/xoxL/fT/vg/wCNAD6KZiX++n/fB/xo
xL/fT/vg/wCNAD6KZiX++n/fB/xoxL/fT/vg/wCNAD6KZiX++n/fB/xoxL/fT/vg/wCNAD6KZiX+
+n/fB/xoxL/fT/vg/wCNAD6KZiX++n/fB/xoxL/fT/vg/wCNAD6KZiX++n/fB/xoxL/fT/vg/wCN
AD6KZiX++n/fB/xoxL/fT/vg/wCNAD6KZiX++n/fB/xoxL/fT/vg/wCNAD6KZiX++n/fB/xoxL/f
T/vg/wCNAD6KZiX++n/fB/xoxL/fT/vg/wCNAD6KZiX++n/fB/xoxL/fT/vg/wCNAD6KZiX++n/f
B/xoxL/fT/vg/wCNAD6KZiX++n/fB/xoxL/fT/vg/wCNAD6KZiX++n/fB/xoxL/fT/vg/wCNAD6K
ZiX++n/fB/xoxL/fT/vg/wCNAHnfxR/5FnW/+uK/+y181ivpP4n5/wCEY1vcQT5K9Bj+7XzYKYmL
RRRQIKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACi
iigAooooAKKKKAPpP4Qf8k7sv9+X/wBGNXdN901wvwg/5J3Zf78v/oxq7pvumkUfHumXx0zUoL0W
1tdGFt3k3Ue+N/Zl7iu0k+K99LZxWcnhnww9rESY4WsGKIT1IXfgVxWm6bd6xqMGn2EXnXU7bY49
wXcfqSAK6s/CTxwBn+w//JuD/wCLpvbXYlbnP6H4i1Hw7qv9o6bIkcpBV0Zco6nqpXuK0dd8calr
mmrpotdP06wD+Y1tp9v5KO/95uTk1i6fpV/quorp9hayXF2xIEUYyeOv4e9aGu+D/EHhpI5NX0yW
2jkOFk3K6k+mVJAPtSeyuPW7LOg+NLrQLA2a6XpF9D5hkX7daCUoxA6HI9BWf4g8R6l4m1D7bqcw
d1UJGirtSNR/CoHQVNoXhDX/ABKkj6RpstzHGcNJuVEB9NzEDPtVLVtG1LQr5rLVLOW1uAM7JB1H
qD0I9xTe+oltodHpvxJ1nT7C1tXtNMvmsxttLi9tRJLbjtsbIxj3zWRZ+KtWs/Eb68J1mv5Cxkad
A6vuGCCOmMcVZ0vwF4o1rTv7Q0/R5prU5KyFlXd/uhiC34ZrIttKv7zVF0yC0le+Zygg24fcOowe
mMGj7XmHTyOrk+KOsrbTRafp+jaXJMpWS4sLMRysD75NcSSSSSck9TXT6j8OvFuk2D3t5osyW6Dc
7I6SbR6kKSQK5elpcetgrpfDPjKfwvGRb6Po93L5olSe9tjJJGRjG1gwwOM/Wuarc0Pwf4g8SRtJ
pGmS3MSttMgKqgPXG5iBnkVSv0Ey14m8a3HimHbc6Po1rKZfNe4s7YpLIcEfMxY5HOat6b8SdZ0+
wtbV7TTL5rMbbS4vbUSS247bGyMY981y1/YXOmX89jeR+VcwOY5E3BtrDqMjIP4Vt6X4C8Ua1p39
oafo801qclZCyru/3QxBb8M1K202G99TF1C/utUv5769maa5ncvJI3UmtW+8WX+oeFNP8Oyw2y2d
jIZInRWEhJz945x/EegFYk0MtvM8M0bRyxsVdHGCpHUEdqZRpa3QNb36hWw3iO8fwmnhwxwfY0uj
dB9p8zfjGM5xjn0rHrWuvDOsWWgW2uXNk0em3LbIZmdfmPP8Od3Y84pvYXUv+GfGU/heMi30fR7u
XzRKk97bGSSMjGNrBhgcZ+tL4m8a3HimHbc6Po1rKZfNe4s7YpLIcEfMxY5HOaq6H4P8QeJI2k0j
TJbmJW2mQFVQHrjcxAzyKy7+wudMv57G8j8q5gcxyJuDbWHUZGQfwofmC8jW0bxZf6HomraVbQ2z
wanGI5mlViyjBHykEAdT1Bqloet3nh/VE1CxMfnIrLiVA6spGCCD7VnUUdbh0sdvJ8UdZW2mi0/T
9G0uSZSslxYWYjlYH3yazfC/ja+8KRX0VrY6fdpegLML2JpMgZ44YcHPOc1Q0vwzrGs6de6hYWTT
Wlkpe4l3qoQAEnqRngdBmqmm6ZfaxfR2WnW0lzcyfdjjGSf8B70dbBfQ6LU/Hj6nps9kfDHhq2Ey
7fOtrDZInurbuDWR4b8Q3fhfXIdWsY4JJ4gwVZ1JU7gQcgEHv61Nrvg/xB4aSOTV9Mlto5DhZNyu
pPplSQD7Vh0J63Q3tZli+u5NQ1C5vZQqyXErSuEGACxyce3NS6Rqk+i6xaanbLG81rKJUWQEqSPX
BBx+NUq7KH4U+NbiCOaLRd0cih1P2qEZBGR/HQtNugnrucxqeoS6rqt3qM6os1zM0zqgIUFjk4yS
cc+tXfEPiS88ST2kl1FBClpbrbQxW6lUVF6cEk5/GqGoafdaVqE9hexeVcwOUkTcG2sO2QSDV3S/
DOsazp17qFhZNNaWSl7iXeqhAASepGeB0GaSty6bIbvfXcv+FvGt94SgvobSx066jvQqzLeQs4Kj
PHDDg55BzVjU/Hj6nps9kfDHhq2Ey7fOtrDZInurbuDWNonhvWPEc7w6Rp8t26YLlMBVz0yxwB+J
qfXfCGv+GlRtX0yW2RzhZMq6E+m5SRn2zTl5iXkbGl/Ei+0zw9baI2i6He2duSyC8tWkJYknJ+bG
ecZxWdrni2TW1tgui6LpzW8nmK+n2nlMx9G5ORSaL4F8TeIbQXWmaRNNbnO2UssatjrgsRn8KzNW
0bUdDvWs9Ts5bW4AzskHUeoPQj3FD313BbaHWr8VdXEouG0jQHvRyLxrAecD65B6/hXMS+INSuPE
I1y5nFxfiUSl5VBBI6AjpjtitLT/AIeeLNU05b+00Wd7Z13IxZVLD1CsQT+ArnZLeaK5a2khkSdW
2NGykMGzjGOuaNn5huvI66++JWsXWnT2VpZaVpaXC7Z5NPtRE8o7gnJ/TFcbXS3vw+8V6fpZ1K60
W4jtVXezZUso9SoO4fiK5ql1HrYK7PS/iRfaZ4ettEbRdDvbO3JZBeWrSEsSTk/NjPOM4rjK6HRf
AvibxDaC60zSJprc52ylljVsdcFiM/hT6C6jfEHipvEEEMR0TRdP8pi27T7TymbI6McnIqF/Et4/
hSLw4sUEdklwbhnRSJJHxj5jnBAHoB0FVtS0PU9H1IafqFlLbXRIxHIMbs8Ag9CPccV03/Co/HP/
AEA//JuD/wCLpdB9Tk9O1G70nUIL+xnaC5gbdHIvUH/Pauuk+KetHzZrfT9GtL+ZSsl/b2QW4bPU
7snn8K5zVvDmr6HqyaXqFm0d84UrCjrITu6Y2E8n0rUufhv4vs7Br2bQ5xCq7m2sjMB6lASw/Km3
p5BbXzM3QvEV1oN9NdR29pdmZCksd7D5qOCQeQe+R1q74g8bar4is4rGWO0s7CJt62djD5UW71Iy
cn8aydJ0bUddvhZaXZy3VwRnZGOg9SegHuau674P1/w0kb6vpsttHIcLJuV1J9NykjPtQ9lcFvoa
Wl/EHUNN0y30+XS9G1CC2BWH7dZiRkGScA5Hc1m+JPFmq+KbiKTUZYxHAu2GCFNkcQ9FWp9F8CeJ
vENmLvS9JkntySBKXRFOODgsRmsvVtG1LQr02eqWctrcAZ2SDqPUHoR7ih76iW2h01l8TNV0+0hj
t9M0UXMMYjjvTZAzqAMD5s4zj2rlm1O9fVDqbXUpvvN87z93zb85zn61t6f8PPFmqact/aaLO9s6
7kYsqlh6hWIJ/AVzk0MtvM8M0bxyxsVdHGCpHUEdqPtX6h08jsrr4oa7c206pbaZbXdzH5c9/b2o
S4lXuC+f5AVxVa2l+GdY1nTr3ULCyaa0slL3Eu9VCAAk9SM8DoM1k0raj6BXW+GvH134Wtoo7PRd
EmmiZmW7uLUtOM9t4YHHauSrpdF+H/ifxDpy6hpWmfaLVmKiTz4k5HXhmBqlcRD4k8UyeJTC0mka
RYPGzMWsLbyjIWx985Oen6mq3iDxDd+JNSS+vI4Y5UhSECFSFwowOpPNTeIPB+u+FlgbWbH7KJyw
j/fI+7GM/dY46jrWHUq3Qbv1NXxF4gu/E2q/2jexwxzeWkW2FSFwowOpPNa1j49vrbSLbTLzStH1
SC1BW3OoWpkaJT2BDDiuUq3e6Ze6cls93bPCtzEJoS38aHow9qfQRa0PxHqXh3U2vtMmWKRgVdCo
ZHU9VZT1Fa9/8QL670+5srfSdE05LpCk72NiI3dT1BJJ/SuTooeqsPrcv6NrF7oOqwalp8vl3MJy
pIyCCMEEdwRWhrXip9amtpv7G0exkgkMm6xtjEZTwfn5Oen6mreh+BbnxBYfabPWdHEwieVrOSdh
OqrnOVCH09e4rl442llWNBl3IVR6k09bpdRdLne3Pxb1me6e8j0nQbe/YY+2xWWZhxgfMzHtXDXd
3cX13Ld3UzzXErF5JHOSxPc11Vz8LfGtpA00mhSlFGSIpo5G/wC+VYk/lXIOjRuyOpVlOCpGCDU6
XHrY1fEPiC78S6kt/eRwxyrCkIEKkLhRgdSeabFrt1F4an0JY4TazXK3LOQd4ZRgAHOMfhWXRT/r
9RHUN471Rtem1gwWf2iay+xMuxtgTYFyBuzuwPXHtVuw+JF/Y6JY6W+i6HeRWKlYJLy0Mrpk5JBL
YB+g7CuMrqdN+HHizV9Lh1Kw0kzWkylo3FxENwzjoWz29KPP+uv/AAQMvX/EWp+Jb8XmqXHmyKux
FACpGvoqjgCtmz+ImqQadBZX1hpOrR2y7YG1K0EzxL6A5HH1zXN6hpt7pN49nqFrLbXCfejlXafr
9PeqtC20G99TU1rX77XdUXULoxxzIqpGIIxGsar0CgdMV0A+JurSJG95pui315GoVL66sVecY6fN
nGR9K4uijyEbOjeKdV0LV5tSs5k82fcJ0kQNHKGOSGXoRV7WfHOpaxpR0uO007TbBnDyW+nW4hWV
h0LckmuYopW0sO+tzpND8a6joemyaZ9lsNQ09n8wW2oW/nIj/wB5RkYNJ4h8a6r4n0+zstQW28u0
d2iaKMoQG/hxnAAAAAAFc5WteeH7uy8O6drckkJtr95EiRWO8FDg7hjH5E03rqxLyNiz+ImqQadB
ZX1hpOrR2y7YG1K0EzxL6A5HH1zWJrmu3niHUftt6IRIEEapDGERFHQADtWZRQ9XcFpoa3iHxBd+
JdSW/vI4Y5VhSECFSFwowOpPNZcbmKVJFxlWDDPtTaKFo7oPI2/FXim+8XasupahFbxTLEsQW3Vl
XAJPck559aXw94s1Pw0Z0szDLa3AxPa3MYkhl+qn+lYdFC02B6m9rviq5163htjp+mWFtE5cQ2Fq
IlLEYyepJx716B488a32heJYbVbHTL6KO0gkg+3WolMDFBkocgjoK8hoo6B1O68Dare638WtM1HU
JjNdTTlnc8fwHAA7AelP1H4k61bX1/HDbaal5vkh/tJbUC62ZIxv+nGcZrgqKTWiQ76tj0kZJll6
srBue5rY8VeKb7xdqy6lqEVvFMsSxBbdWVcAk9yTnn1rEopiOt0v4g6hpumW+ny6Xo2oQWwKw/br
MSMgyTgHI7ms3xH4s1XxTcQyajKgjgXbBBCmyOIf7IqfRfAnibxDZi70vSZJ7ckgSl0RTjg4LEZr
L1bRtS0K9NnqlnLa3AGdkg6j1B6Ee4oe+oLbQ6eD4nawtvbpeafo+pT2yhYbq+sxJNGB0w2RXMav
q99r2qS6jqVwZrmU/M5GMDsAB0A9K2NN+HvivVrBL6y0aZ7ZxuR2dE3j1AYgkfQVz91aXFjdyWt3
C8E8bbXjkUqyn3FD313BbaHbaveaBY/DVdC07XF1K7bURdMFtZItq+WVI+YYODjv3rg66bV/BVzp
Ph9NbXVdKvrNpxb5spmcq5Utg5UDoPWuZpdX/XQfRBXW+GvH134Wtoo7PRdEmmiZmW7uLUtOM9t4
YHHauSrpdF+H/ifxDpy6hpWmfaLVmKiTz4k5HXhmBqlcRD4k8UyeJTC0mkaRYPGzMWsLbyjIWx98
5Oen6mq3iDxDd+JNSS+vI4Y5UhSECFSFwowOpPNTeIPB+u+FlgbWbH7KJywj/fI+7GM/dY46jrWH
Uq3Qbv1NXxF4gu/E2q/2jexwxzeWkW2FSFwowOpPNa1j49vrbSLbTLzStH1SC1BW3OoWpkaJT2BD
DiuUq3e6Ze6cls93bPCtzEJoS38aHow9qfQRa0PxHqXh3U2vtMmWKRgVdCoZHU9VZT1Fa9/8QL67
0+5srfSdE05LpCk72NiI3dT1BJJ/SuTooeqsPrcv6NrF7oOqwalp8vl3MJypIyCCMEEdwRWhrXip
9amtpv7G0exkgkMm6xtjEZTwfn5Oen6mreh+BbnxBYfabPWdHEwieVrOSdhOqrnOVCH09e4rl442
llWNBl3IVR6k09bpdRdLne3Pxb1me6e8j0nQbe/YY+2xWWZhxgfMzHtXDXd3cX13Ld3UzzXErF5J
HOSxPc11Vz8LfGtpA00mhSlFGSIpo5G/75ViT+Vcg6NG7I6lWU4KkYINTpcetjV8Q+ILvxLqS395
HDHKsKQgQqQuFGB1J5psWu3UXhqfQljhNrNcrcs5B3hlGAAc4x+FZdFP+v1EdQ3jvVG16bWDBZ/a
JrL7Ey7G2BNgXIG7O7A9ce1W7D4kX9joljpb6Lod5FYqVgkvLQyumTkkEtgH6DsK4yup034ceLNX
0uHUrDSTNaTKWjcXEQ3DOOhbPb0o8/66/wDBAy9f8Ran4lvxeapcebIq7EUAKka+iqOAK2bP4iap
Bp0FlfWGk6tHbLtgbUrQTPEvoDkcfXNc3qGm3uk3j2eoWsttcJ96OVdp+v096q0LbQb31NTWtfvt
d1RdQujHHMiqkYgjEaxqvQKB0xXQD4m6tIkb3mm6LfXkahUvrqxV5xjp82cZH0ri6KPIRs6N4p1X
QtXm1KzmTzZ9wnSRA0coY5IZehFXtZ8c6lrGlHS47TTtNsGcPJb6dbiFZWHQtySa5iilbSw763Ok
0PxrqOh6bJpn2Ww1DT2fzBbahb+ciP8A3lGRg0niHxrqvifT7Oy1Bbby7R3aJooyhAb+HGcAAAAA
AVzla154fu7Lw7p2tySQm2v3kSJFY7wUODuGMfkTTeurEvI2LP4iapBp0FlfWGk6tHbLtgbUrQTP
EvoDkcfXNYmua7eeIdR+23ohEgQRqkMYREUdAAO1ZlFD1dwWmhreIfEF34l1Jb+8jhjlWFIQIVIX
CjA6k81k0UUAFbnh7xZqfhozpZmGW1uBie1uYxJDL9VP9Kw6KAN7XvFVzr1tDbHT9MsLaJy4hsLU
RKWIxk9STj3qvc+ILu68NWWhPHCLWzleaN1U7yW65OcY/Csmiiw7ktrdT2V1FdWsrxTxMHjkQ4Kk
dCK7I/FDVWkFzJpGgyagP+X99PUzk+uc4z+FcRRQI6DRPGOqaHe3txELe5S+z9qt7qIPFNkk/MvH
cnp61fufiNq9xpl9piWem21hdxeUba2t/LSLnJZQD949yc1yFFK2lh31uaeg69feG9Vj1HT3VZkB
Uh13K6ngqw7g1Nr3iEa6If8AiTaTp5jJJOn25i35x975jnp+tUbDTL3VHmSxtnnaGJppAn8KL1Y+
wqmab8xI9a+F2v6jq961nfT+cljaFIGZRvCll+UnuBt4z0rlvEHxj8c6X4k1TT7TWEjtrW8lghT7
JCdqK5VRkrk8Ada1vg5/yG9R/wCvYf8AoQry7xh/yO2vf9hG4/8ARjUMa2Op/wCF4/EH/oNp/wCA
cP8A8RR/wvH4g/8AQbT/AMA4f/iK88opDPQ/+F4/EH/oNp/4Bw//ABFH/C8fiD/0G0/8A4f/AIiv
PKKAPQ/+F4/EH/oNp/4Bw/8AxFH/AAvH4g/9BtP/AADh/wDiK88ooA9D/wCF4/EH/oNp/wCAcP8A
8RR/wvH4g/8AQbT/AMA4f/iK88ooA9D/AOF4/EH/AKDaf+AcP/xFH/C8fiD/ANBtP/AOH/4ivPKK
APQ/+F4/EH/oNp/4Bw//ABFH/C8fiD/0G0/8A4f/AIivPKKAPQ/+F4/EH/oNp/4Bw/8AxFH/AAvH
4g/9BtP/AADh/wDiK88ooA9D/wCF4/EH/oNp/wCAcP8A8RR/wvH4g/8AQbT/AMA4f/iK88ooA9D/
AOF4/EH/AKDaf+AcP/xFH/C8fiD/ANBtP/AOH/4ivPKKAPQ/+F4/EH/oNp/4Bw//ABFH/C8fiD/0
G0/8A4f/AIivPKKAPQ/+F4/EH/oNp/4Bw/8AxFH/AAvH4g/9BtP/AADh/wDiK88ooA9D/wCF4/EH
/oNp/wCAcP8A8RR/wvH4g/8AQbT/AMA4f/iK88ooA9D/AOF4/EH/AKDaf+AcP/xFH/C8fiD/ANBt
P/AOH/4ivPKKAPQ/+F4/EH/oNp/4Bw//ABFH/C8fiD/0G0/8A4f/AIivPKKAPQ/+F4/EH/oNp/4B
w/8AxFH/AAvH4g/9BtP/AADh/wDiK88ooA9D/wCF4/EH/oNp/wCAcP8A8RR/wvH4g/8AQbT/AMA4
f/iK88ooA9D/AOF4/EH/AKDaf+AcP/xFH/C8fiD/ANBtP/AOH/4ivPKKAPQ/+F4/EH/oNp/4Bw//
ABFH/C8fiD/0G0/8A4f/AIivPKKAPQ/+F4/EH/oNp/4Bw/8AxFH/AAvH4g/9BtP/AADh/wDiK88o
oA9D/wCF4/EH/oNp/wCAcP8A8RR/wvH4g/8AQbT/AMA4f/iK88ooA9D/AOF4/EH/AKDaf+AcP/xF
H/C8fiD/ANBtP/AOH/4ivPKKAPQ/+F4/EH/oNp/4Bw//ABFH/C8fiD/0G0/8A4f/AIivPKKAPQ/+
F4/EH/oNp/4Bw/8AxFH/AAvH4g/9BtP/AADh/wDiK88ooA9D/wCF4/EH/oNp/wCAcP8A8RR/wvH4
g/8AQbT/AMA4f/iK88ooA9D/AOF4/EH/AKDaf+AcP/xFH/C8fiD/ANBtP/AOH/4ivPKKAPQ/+F4/
EH/oNp/4Bw//ABFH/C8fiD/0G0/8A4f/AIivPKKAPQ/+F4/EH/oNp/4Bw/8AxFH/AAvH4g/9BtP/
AADh/wDiK88ooA9D/wCF4/EH/oNp/wCAcP8A8RR/wvH4g/8AQbT/AMA4f/iK88ooA9D/AOF4/EH/
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
H0n8IP8Akndl/vy/+jGrum+6a4X4Qf8AJO7L/fl/9GNXdN900ij5dk0DSV0qbUbq7ubSGGeODbb2
4nZ2dXYH5pEwAIz69az/ALL4X/6DGsf+CqL/AOSK2tW/5Ee9/wCwla/+i7iuKroxKSqtL+tDmwsn
Kkm/61NHW9Oi0rU/s0Fw9xC0EM6SPEI2KyRLIAVDNggPjqelZ1bfir/kLwf9g2w/9JIqxKwNwooo
oAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig
AooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC
iiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAq9q2s3+uXgu9Sn8+cRrGH2K
vyqMAYUAVRooAt6Xqd5o2pQ6hYTeTdQHdHJtDbTjHQgjvVeaV7ieSaVt0kjFmOMZJOTTKKACiiig
AooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC
iiigAooooAKKKKACiiigAooooAKKKKACiiigApDS0GgD0f4O/wDIb1H/AK9h/wChCvLfGH/I7a9/
2Ebj/wBGNXqHweZV1y/DMAWtwBnud2f6Va1j4Jf2trd/qP8AwkPlfa7mSfy/sW7ZvYtjPmDOM9cU
ikeF0V7P/wAKD/6mX/yQ/wDtlH/Cg/8AqZf/ACQ/+2UAeMUV7P8A8KD/AOpl/wDJD/7ZR/woP/qZ
f/JD/wC2UAeMUV7P/wAKD/6mX/yQ/wDtlH/Cg/8AqZf/ACQ/+2UAeMUV7P8A8KD/AOpl/wDJD/7Z
R/woP/qZf/JD/wC2UAeMUV7P/wAKD/6mX/yQ/wDtlH/Cg/8AqZf/ACQ/+2UAeMUV7P8A8KD/AOpl
/wDJD/7ZR/woP/qZf/JD/wC2UAeMUV7P/wAKD/6mX/yQ/wDtlH/Cg/8AqZf/ACQ/+2UAeMUV7P8A
8KD/AOpl/wDJD/7ZR/woP/qZf/JD/wC2UAeMUV7P/wAKD/6mX/yQ/wDtlH/Cg/8AqZf/ACQ/+2UA
eMUV7P8A8KD/AOpl/wDJD/7ZR/woP/qZf/JD/wC2UAeMUV7P/wAKD/6mX/yQ/wDtlH/Cg/8AqZf/
ACQ/+2UAeMUV7P8A8KD/AOpl/wDJD/7ZR/woP/qZf/JD/wC2UAeMUV7P/wAKD/6mX/yQ/wDtlH/C
g/8AqZf/ACQ/+2UAeMUV7P8A8KD/AOpl/wDJD/7ZR/woP/qZf/JD/wC2UAeMUV7P/wAKD/6mX/yQ
/wDtlH/Cg/8AqZf/ACQ/+2UAeMUV7P8A8KD/AOpl/wDJD/7ZR/woP/qZf/JD/wC2UAeMUV7P/wAK
D/6mX/yQ/wDtlH/Cg/8AqZf/ACQ/+2UAeMUV7P8A8KD/AOpl/wDJD/7ZR/woP/qZf/JD/wC2UAeM
UV7P/wAKD/6mX/yQ/wDtlH/Cg/8AqZf/ACQ/+2UAeMUV7P8A8KD/AOpl/wDJD/7ZR/woP/qZf/JD
/wC2UAeMUV7P/wAKD/6mX/yQ/wDtlH/Cg/8AqZf/ACQ/+2UAeMUV7P8A8KD/AOpl/wDJD/7ZR/wo
P/qZf/JD/wC2UAeMUV7P/wAKD/6mX/yQ/wDtlH/Cg/8AqZf/ACQ/+2UAeMUV7P8A8KD/AOpl/wDJ
D/7ZR/woP/qZf/JD/wC2UAeMUV7P/wAKD/6mX/yQ/wDtlH/Cg/8AqZf/ACQ/+2UAeMUV7P8A8KD/
AOpl/wDJD/7ZR/woP/qZf/JD/wC2UAeMUV7P/wAKD/6mX/yQ/wDtlH/Cg/8AqZf/ACQ/+2UAeMUV
7P8A8KD/AOpl/wDJD/7ZR/woP/qZf/JD/wC2UAeMUV7P/wAKD/6mX/yQ/wDtlH/Cg/8AqZf/ACQ/
+2UAeMUV7P8A8KD/AOpl/wDJD/7ZR/woP/qZf/JD/wC2UAeMUV7P/wAKD/6mX/yQ/wDtlH/Cg/8A
qZf/ACQ/+2UAeMUV7P8A8KD/AOpl/wDJD/7ZR/woP/qZf/JD/wC2UAeMUV7P/wAKD/6mX/yQ/wDt
lH/Cg/8AqZf/ACQ/+2UAeMUV7P8A8KD/AOpl/wDJD/7ZR/woP/qZf/JD/wC2UAaOh/8AJva/9cZv
/Shq8rFe2ajoS+FfhFcaKbsXBhicLKU2by0hf7uT0z69q8TFMTFooooEFFFFABRRRQAUUUUAFFFF
ABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAH0h8I32fDyx
ykhy8vKxsw/1jegruTMCP9XP/wB+X/wrkvg1/wAk1sf+us3/AKGa76kUfLWrf8iPe/8AYStf/Rdx
XFV38+mX+q+Dr6DTrG5vJl1C1cx28TSMF8u4GcKDxkjn3rm/+EN8Uf8AQt6x/wCAMv8A8TXTi/4z
/rocuE/gx/rqHir/AJC8H/YNsP8A0kirEre8YQy22vJBPE8U0en2KPG6lWVhaxAgg9CD2rBrnOgK
KKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoo
ooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiii
gAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKA
CiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAK
KKKACiiigAooooAKKKKACiiigAooooAKKKKAHRzSwsWikeNsYyjEHFSG/vf+fy4/7+H/ABqCigCb
7fe/8/lx/wB/W/xpPt97/wA/lx/39b/GocUYoGTfb73/AJ/Lj/v6f8aPt97/AM/lx/39P+NQ4oxQ
BN9vvf8An8uP+/p/xo+33v8Az+XH/f0/41DijFAE32+9/wCfy4/7+n/Gj7fe/wDP5cf9/T/jUOKM
UATfb73/AJ/Lj/v6f8aPt97/AM/lx/39P+NQ4oxQBN9vvf8An8uP+/p/xo+33v8Az+XH/f0/41Di
jFAE32+9/wCfy4/7+n/Gj7fe/wDP5cf9/T/jUOKMUATfb73/AJ/Lj/v6f8aPt97/AM/lx/39P+NQ
4oxQBN9vvf8An8uP+/p/xo+33v8Az+XH/f0/41DijFAE32+9/wCfy4/7+n/Gj7fe/wDP5cf9/T/j
UOKMUATfb73/AJ/Lj/v6f8aPt97/AM/lx/39P+NQ4oxQBN9vvf8An8uP+/p/xo+33v8Az+XH/f0/
41DijFAE32+9/wCfy4/7+n/Gj7fe/wDP5cf9/T/jUOKMUATfb73/AJ/Lj/v6f8aPt97/AM/lx/39
P+NQ4oxQBN9vvf8An8uP+/p/xo+33v8Az+XH/f0/41DijFAE32+9/wCfy4/7+n/Gj7fe/wDP5cf9
/T/jUOKMUATfb73/AJ/Lj/v6f8aPt97/AM/lx/39P+NQ4oxQBN9vvf8An8uP+/p/xo+33v8Az+XH
/f0/41DijFAE32+9/wCfy4/7+n/Gj7fe/wDP5cf9/T/jUOKMUATfb73/AJ/Lj/v6f8aPt97/AM/l
x/39P+NQ4oxQBN9vvf8An8uP+/p/xo+33v8Az+XH/f0/41DijFAE32+9/wCfy4/7+n/Gj7fe/wDP
5cf9/T/jUOKMUATfb73/AJ/Lj/v6f8aPt97/AM/lx/39P+NQ4oxQBN9vvf8An8uP+/p/xo+33v8A
z+XH/f0/41DijFAE32+9/wCfy4/7+n/Gj7fe/wDP5cf9/T/jUOKMUATfb73/AJ/Lj/v6f8aPt97/
AM/lx/39P+NQ4oxQBN9vvf8An8uP+/p/xo+33v8Az+XH/f0/41DijFAE32+9/wCfy4/7+n/Gj7fe
/wDP5cf9/T/jUOKMUATfb73/AJ/Lj/v6f8aPt97/AM/lx/39P+NQ4oxQBN9vvf8An8uP+/p/xo+3
3v8Az+XH/f0/41DijFAE32+9/wCfy4/7+n/Gj7fe/wDP5cf9/T/jUOKMUATfb73/AJ/Lj/v6f8aP
t97/AM/lx/39P+NQ4oxQBN9vvf8An8uP+/p/xo+33v8Az+XH/f0/41DijFAE32+9/wCfy4/7+t/j
S/b73/n8uP8Av63+NQYoxQIme7uZUKSXMzoeqs5INRCiloAKKKKACiiigAooooAKKKKACiiigAoo
ooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigD6c+DX/ACTWx/66
zf8AoZrvq4H4Nf8AJNbH/rrN/wChmu+pFHxRJNLNjzJHfHTcxOKZRRTbb3JSS2CiiigAooooAKKK
KACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoooo
AKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA
ooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACi
iigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKK
KACiiigAooooAKKKKACiiigAooooAKKKKACjFFFABijFFFABijFFFABijFFFABijFFFABijFFFAB
ijFFFABijFFFABijFFFABijFFFABijFFFABijFFFABijFFFABijFFFABijFFFABijFFFABijFFFA
BijFFFABijFFFABijFFFABijFFFABijFFFABijFFFABijFFFABijFFFABijFFFABijFFFABijFFF
ABijFFFABijFFFABijFFFABijFFFABijFFFABiiiigAooooAKKKKACiiigAooooAKKKKACiiigAo
oooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigD6c+DX/JNbH/rr
N/6Ga76vNvhNNFbfDKymuL/7LEJZRlmRVzvPdhXcWt1a3zMtprK3DKMsIpInIHvgUij42zSZoooE
FFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAU
UUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRR
RQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFF
ABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUA
FFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAU
UUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRR
RQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFF
ABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUA
FFFFABRRRQAUUUUAFFFFAHtHgDx9oej+BYdG1KzvJzuk8wRxoyMGYnuwrodJ+JPhLRbT7PZadqaI
TuYmOMsx9zvoooGf/9k=
--000000000000ea7a9e062138a972--
