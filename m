Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1525200njf;
        Tue, 3 Sep 2024 10:18:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUqMldGQJb6BqTpvQOC5fkHcnlQFGSQmRrgjyMIBU8qUT3+Evws5pGmQAqXSN5LLd4AAzPZSFD3e1cu0Q==@linaro.org
X-Google-Smtp-Source: AGHT+IEuFU+gz+X5uiC24aJiGk6NgE5fQoISM/rFKsQgaq26DvvTn/LKmuLfJPQGmRr/zGYldcvl
X-Received: by 2002:a05:6358:520b:b0:1b5:fba4:548a with SMTP id e5c5f4694b2df-1b8123f65b4mr327051255d.8.1725383902435;
        Tue, 03 Sep 2024 10:18:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725383902; cv=none;
        d=google.com; s=arc-20160816;
        b=vMdD+OFvBheJEF0xEUp2duf2e207Zp46gCLKE9n8lMm0txG4On6C4HV7+ZncFpi90w
         YjB745LMR3SEdCaZGjvHTvtYtK8IkWj0ogdB29CoLDFRG3vBn+d8BAph2HpBBk9V314V
         NmXkTdmxkr630g0cDJFfBS7+ei0Ab7+2MAN+Glip0CDufYTysd5brM8QhOV1xP9HiGaT
         OS2K3Y61KMakwxeUJta+TTyXgv+Trusp6/OIAkofzYvNpEL/DowdA3zTXx4T6Uc69r5/
         +eHWv/nULO0ENLjAX0SLQCZLp43UQEAWym/Aen7ZMekKQhDBlnPa2h/xHLmEJaAyy92T
         Z4Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=YVsMsuQ/Y5QaB4Gl7SjXorRiDEhWepdaK6X8uYtfQ7o=;
        fh=3cRitFH3I1bz9ilhKjmOyszcyLhxDG7mGbypLyyj9w4=;
        b=yDAhXrkoMLojTxv2X3nlorwe9q4FxUhQxe73cjsSMERYKfQJ9as2j5yxsz/hjxhtB6
         xnJbB66hk+Eebn137DGCXdIDGSYCyUhUwN/3ssHWbwJaqubaBEsTOfP4pimozImRaSss
         E8gNV79Yyqj3IvFTwbtmLA2tv6hEkWqu5Yy5VqBEZsz+a/X5D64t4igaIpJAtiUMknVz
         zOcFDpdfj0sEjXPR2tOKvFGKzyHYEMi0o80JQ3HEZLsM3CHBZm0qEt1W8Yebu7RkrO01
         SCQvMrTQd6hB5FbzZWeQYxyHMz6HnSlDFpbyCdNXr5Y0bKBmKB7IFWfM7tuvlfmutdmh
         oecg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=l2r6FljJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c340c89f29si74289666d6.194.2024.09.03.10.18.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 10:18:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=l2r6FljJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slXAF-0002Ev-Pd; Tue, 03 Sep 2024 13:17:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marietto2008@gmail.com>)
 id 1slXAB-0001vi-45; Tue, 03 Sep 2024 13:17:55 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marietto2008@gmail.com>)
 id 1slXA3-0003K3-G1; Tue, 03 Sep 2024 13:17:54 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-7163489149eso3750196a12.1; 
 Tue, 03 Sep 2024 10:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725383866; x=1725988666; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YVsMsuQ/Y5QaB4Gl7SjXorRiDEhWepdaK6X8uYtfQ7o=;
 b=l2r6FljJrS0BASrt+2Wf+9AyTJvBBcTZi8mGj5kkmCcJgNiafaKAG4nF4tC0xn4QaY
 mzZ1Ptikaj0wDEqeJcgPaxWvlYEdADI73XWM4qfXUc2gu4hSySHKDsBEDM4+fZ+xFXjz
 ZHOJEq/ALy4KjSCEQzT7RMacWLubdSxNulPKZjLbtDjhsKtVORq/h7uBJYJkn9Gluaxg
 tIGsrXzGHfLaV3fUfFy4shSgv6IK5zu4aLbrArQzeAV5ug1bJ/tpBUoY6bsqMqCkU8rR
 NvJRWJFnmqs6zQTwjjSUu7SX/ELy4Shlqk8brNc+seijxtOWOwl0AIUHrq4BWf5EIIVt
 x6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725383866; x=1725988666;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YVsMsuQ/Y5QaB4Gl7SjXorRiDEhWepdaK6X8uYtfQ7o=;
 b=mYBx/+nQ8uBJxIQNjvHRLHkmRuXv3//DC7/Ldoxkh6Is/4DcC3adsXAg3VDZ/3agpX
 YDMRemYCoVdrdc3dDTsdtgBy6Zo+IbTWGAglvY5x/WDk/Y2LrbU861zDjG7VgeDrZtEV
 9CF2y4p3GfwXhUsswGZws+PgkXciwAGU2kYbTP4XG3s4TlVgk9iJ1zBt8D38gmXoE0pY
 pEyM+J0R2mZFeoxQ7oh5pxWst7AYtMUwbBvGRuM8goQAk34kSjiYnFwdgjvB/RarAr7/
 t62H43VX0zz7msr7seslPGsP2LmP9j8rR/MCQk3grjxpg+oxy04vcQ6Xremr45RewolI
 HS9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjSax4UsjEQ6Q4oq253TY+hcxR0BgZ5JAcDnIXHPWGCwvO0gwrBYgWvm2JiWZDFXCLP9QZ2D1lBA==@nongnu.org
X-Gm-Message-State: AOJu0YyPPxCqzVqOaaYGgC6TsRiwnabYKoQnhSmmvb56PPQC0ewipssv
 Qy7t/sI90F8DWouErS1APOSDPJLZSC7XehR+NsyXlFWDTVxWfSJm0Ak5cSRUHucxP7HHuaIgpdK
 hrF7RCzxPGAj5VW2NImxPL3xUe1k=
X-Received: by 2002:a17:90a:6883:b0:2d3:c4cd:245f with SMTP id
 98e67ed59e1d1-2d88d6aeb4dmr11784469a91.17.1725383865040; Tue, 03 Sep 2024
 10:17:45 -0700 (PDT)
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
 <CA+1FSijfe+5V4RHs-1ow2JwAeiKcmW31V2Ddx9a9zxb_kybDFg@mail.gmail.com>
 <70b240aa-98de-4998-8c1b-34349fc831ba@linaro.org>
In-Reply-To: <70b240aa-98de-4998-8c1b-34349fc831ba@linaro.org>
From: Mario Marietto <marietto2008@gmail.com>
Date: Tue, 3 Sep 2024 19:17:07 +0200
Message-ID: <CA+1FSiiyb2v7oy43exRuY7kQpLgUcEifAE2zrEtpYPkgAY+TRw@mail.gmail.com>
Subject: Re: Error : init: partition(s) not found in /sys, waiting for their
 uevent(s): mmcblk0p2, mmcblk0p3 while trying to emulate Android 14 on Ubuntu
 24.04 X64 bit using qemu-system-aarch64.
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-discuss@nongnu.org, qemu-arm <qemu-arm@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000608a0206213a3c07"
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=marietto2008@gmail.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 NORMAL_HTTP_TO_IP=0.001, NUMERIC_HTTP_ADDR=1.242, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
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
X-TUID: bwFyXMivFTpy

--000000000000608a0206213a3c07
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

@Pierrick Bouvier :

---> I'm really glad to see it worked! Are you already running the
raspberry image, or vanilla AOSP ?

No and I don't think I will. I have a project that I'm working on that aims
to emulate Android for Arm on Linux x64 bit. I knew that it would be
slow,but I didn't think it would be so much. When I used AVD as an
emulator,Android went faster.
@Peter Maydell <peter.maydell@linaro.org> :
I think that I've understood the reason why several years ago it worked.
Probably I'd used this special version of qemu :
https://github.com/antmicro/kvm-aosp-qemu/releases/tag/5.0.0-kvm-aosp

I'm sure that it contains the necessary patches to be able to boot Android
10 on the Jetson Nano.

On Tue, Sep 3, 2024 at 6:31=E2=80=AFPM Pierrick Bouvier <pierrick.bouvier@l=
inaro.org>
wrote:

> Without answering specifically on your question, if you want to exchange
> files with a android guest, simply use adb (push/pull commands). It's
> much better and faster than any other solution you can try, and
> cuttlefish tools already setup all the adb stuff for you.
>
> You can use adb-sync (https://github.com/jb2170/better-adb-sync) to have
> something similar to rsync, in case you want to send files incrementally.
>
> Pierrick
>
> On 9/3/24 08:24, Mario Marietto wrote:
> > Hello.
> >
> > Actually I'm using my Jetson Nano and I'm trying to emulate Android 10
> > by antmicro. I'm trying to use the same parameters used several years
> > ago,when it worked. What I want to try now is to enable virtio-blk-pci
> > on qemu. Probably in addition to using qemu 5.0,I had configured qemu
> > with virtio-blk-pci enabled,because I used these parameters and they
> > worked great :
> >
> > -drive
> >
> index=3D0,if=3Dnone,id=3Dsystem,file=3D/home/aresuser/Desktop/antmicro/ao=
sp-img/system-rw.img
> \
> >          -device virtio-blk-pci,drive=3Dsystem \
> >          -drive
> >
> index=3D1,if=3Dnone,id=3Dvendor,file=3D/home/aresuser/Desktop/antmicro/ao=
sp-img/vendor-rw.img
> \
> >          -device virtio-blk-pci,drive=3Dvendor \
> >          -drive
> >
> index=3D2,if=3Dnone,id=3Duserdata,file=3D/home/aresuser/Desktop/antmicro/=
aosp-img/userdata.img
> \
> >          -device virtio-blk-pci,drive=3Duserdata \
> >
> > Can someone tell me how to enable the "VirtFS support" in qemu 5.0 ?
> > because at the moment it is configured to "no" :
> >
> > root@jetson:/home/aresuser/Desktop/antmicro/qemu-5.0.0# ./configure
> > Install prefix    /usr/local
> > BIOS directory    /usr/local/share/qemu
> > firmware path     /usr/local/share/qemu-firmware
> > binary directory  /usr/local/bin
> > library directory /usr/local/lib
> > module directory  /usr/local/lib/qemu
> > libexec directory /usr/local/libexec
> > include directory /usr/local/include
> > config directory  /usr/local/etc
> > local state directory   /usr/local/var
> > Manual directory  /usr/local/share/man
> > ELF interp prefix /usr/gnemul/qemu-%M
> > Build directory   /home/aresuser/Desktop/antmicro/qemu-5.0.0
> > Source path       /home/aresuser/Desktop/antmicro/qemu-5.0.0
> > GIT binary        git
> > GIT submodules
> > C compiler        cc
> > Host C compiler   cc
> > C++ compiler      c++
> > Objective-C compiler clang
> > ARFLAGS           rv
> > CFLAGS            -O2 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 -g
> > QEMU_CFLAGS       -I/usr/include/pixman-1 -I$(SRC_PATH)/dtc/libfdt
> >   -pthread -I/usr/include/glib-2.0
> > -I/usr/lib/aarch64-linux-gnu/glib-2.0/include -fPIE -DPIE  -D_GNU_SOURC=
E
> > -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -Wstrict-prototypes
> > -Wredundant-decls -Wall -Wundef -Wwrite-strings -Wmissing-prototypes
> > -fno-strict-aliasing -fno-common -fwrapv -std=3Dgnu99
> >   -Wexpansion-to-defined -Wendif-labels -Wno-shift-negative-value
> > -Wno-missing-include-dirs -Wempty-body -Wnested-externs
> > -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers
> > -Wold-style-declaration -Wold-style-definition -Wtype-limits
> > -fstack-protector-strong  -I/usr/include/libpng16
> >   -I$(SRC_PATH)/capstone/include
> > QEMU_LDFLAGS      -L$(BUILD_DIR)/dtc/libfdt -Wl,-z,relro -Wl,-z,now -pi=
e
> >   -fstack-protector-strong
> > make              make
> > install           install
> > python            /usr/bin/python3 -B (3.10.12)
> > genisoimage       /usr/bin/genisoimage
> > slirp support     internal
> > smbd              /usr/sbin/smbd
> > module support    no
> > alt path mod load no
> > host CPU          aarch64
> > host big endian   no
> > target list       aarch64-softmmu alpha-softmmu arm-softmmu cris-softmm=
u
> > hppa-softmmu i386-softmmu lm32-softmmu m68k-softmmu microblaze-softmmu
> > microblazeel-softmmu mips-softmmu mips64-softmmu mips64el-softmmu
> > mipsel-softmmu moxie-softmmu nios2-softmmu or1k-softmmu ppc-softmmu
> > ppc64-softmmu riscv32-softmmu riscv64-softmmu rx-softmmu s390x-softmmu
> > sh4-softmmu sh4eb-softmmu sparc-softmmu sparc64-softmmu tricore-softmmu
> > unicore32-softmmu x86_64-softmmu xtensa-softmmu xtensaeb-softmmu
> > aarch64-linux-user aarch64_be-linux-user alpha-linux-user arm-linux-use=
r
> > armeb-linux-user cris-linux-user hppa-linux-user i386-linux-user
> > m68k-linux-user microblaze-linux-user microblazeel-linux-user
> > mips-linux-user mips64-linux-user mips64el-linux-user mipsel-linux-user
> > mipsn32-linux-user mipsn32el-linux-user nios2-linux-user or1k-linux-use=
r
> > ppc-linux-user ppc64-linux-user ppc64abi32-linux-user ppc64le-linux-use=
r
> > riscv32-linux-user riscv64-linux-user s390x-linux-user sh4-linux-user
> > sh4eb-linux-user sparc-linux-user sparc32plus-linux-user
> > sparc64-linux-user tilegx-linux-user x86_64-linux-user xtensa-linux-use=
r
> > xtensaeb-linux-user
> > gprof enabled     no
> > sparse enabled    no
> > strip binaries    yes
> > profiler          no
> > static build      no
> > SDL support       yes (2.26.1)
> > SDL image support no
> > GTK support       yes (3.24.33)
> > GTK GL support    yes
> > VTE support       no
> > TLS priority      NORMAL
> > GNUTLS support    no
> > libgcrypt         no
> > nettle            no
> > libtasn1          no
> > PAM               no
> > iconv support     yes
> > curses support    yes
> > virgl support     no
> > curl support      no
> > mingw32 support   no
> > Audio drivers     pa oss
> > Block whitelist (rw)
> > Block whitelist (ro)
> >
> > *VirtFS support    no*
> >
> > Multipath support no
> > VNC support       yes
> > VNC SASL support  no
> > VNC JPEG support  yes
> > VNC PNG support   yes
> > xen support       no
> > brlapi support    no
> > Documentation     no
> > PIE               yes
> > vde support       no
> > netmap support    no
> > Linux AIO support no
> > Linux io_uring support no
> > ATTR/XATTR support yes
> > Install blobs     yes
> > KVM support       yes
> > HAX support       no
> > HVF support       no
> > WHPX support      no
> > TCG support       yes
> > TCG debug enabled no
> > TCG interpreter   no
> > malloc trim support yes
> > RDMA support      no
> > PVRDMA support    no
> > fdt support       git
> > membarrier        no
> > preadv support    yes
> > fdatasync         yes
> > madvise           yes
> > posix_madvise     yes
> > posix_memalign    yes
> > libcap-ng support no
> > vhost-net support yes
> > vhost-crypto support yes
> > vhost-scsi support yes
> > vhost-vsock support yes
> > vhost-user support yes
> > vhost-user-fs support yes
> > Trace backends    log
> > spice support     no
> > rbd support       no
> > xfsctl support    no
> > smartcard support no
> > libusb            no
> > usb net redir     no
> > OpenGL support    yes
> > OpenGL dmabufs    yes
> > libiscsi support  no
> > libnfs support    no
> > build guest agent yes
> > QGA VSS support   no
> > QGA w32 disk info no
> > QGA MSI support   no
> > seccomp support   no
> > coroutine backend ucontext
> > coroutine pool    yes
> > debug stack usage no
> > mutex debugging   no
> > crypto afalg      no
> > GlusterFS support no
> > gcov              gcov
> > gcov enabled      no
> > TPM support       yes
> > libssh support    no
> > QOM debugging     yes
> > Live block migration yes
> > lzo support       no
> > snappy support    no
> > bzip2 support     no
> > lzfse support     no
> > zstd support      no
> > NUMA host support yes
> > libxml2           yes
> > tcmalloc support  no
> > jemalloc support  no
> > avx2 optimization
> > avx512f optimization no
> > replication support yes
> > VxHS block device no
> > bochs support     yes
> > cloop support     yes
> > dmg support       yes
> > qcow v1 support   yes
> > vdi support       yes
> > vvfat support     yes
> > qed support       yes
> > parallels support yes
> > sheepdog support  yes
> > capstone          internal
> > libpmem support   no
> > libudev           yes
> > default devices   yes
> > plugin support    no
> > fuzzing support   no
> > gdb               /usr/bin/gdb
> > cross containers  docker
> >
> > Thanks.
> >
> > On Tue, Sep 3, 2024 at 10:55=E2=80=AFAM Mario Marietto <marietto2008@gm=
ail.com
> > <mailto:marietto2008@gmail.com>> wrote:
> >
> >     Finally it worked :
> >
> >     Istantanea_2024-09-03_10-51-35.jpg
> >     Very thanks man. In any case it is VERY slow and not usable at all.
> >     Is there something that I can do to improve its speed ?
> >
> >
> >     On Tue, Sep 3, 2024 at 10:33=E2=80=AFAM Mario Marietto
> >     <marietto2008@gmail.com <mailto:marietto2008@gmail.com>> wrote:
> >
> >         ziomario@Z390-AORUS-PRO-DEST:/mnt/zroot-133/_OS/Android/aosp_14=
/android-image$
> HOME=3D$(pwd) ./bin/launch_cvd -vm_manager qemu_cli
> -report_anonymous_usage_stats=3Dn --start_webrtc=3Dfalse
> >
> >         09-03 10:04:44.206 2786386 2786386 I launch_cvd: main.cc:235
> >         Using system_image_dir of:
> >
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >         NOTICE:
> >
> >         By using this Android Virtual Device, you agree to
> >         Google Terms of Service (https://policies.google.com/terms
> >         <https://policies.google.com/terms>).
> >         The Google Privacy Policy (https://policies.google.com/privacy
> >         <https://policies.google.com/privacy>)
> >         describes how Google handles information generated as you use
> >         Google Services.
> >
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> >         Reading --config option from:
> >         /mnt/zroot-133/_OS/Android/aosp_14/android-image/android-info.t=
xt
> >         Launching CVD using --config=3D'phone'.
> >         GPU auto mode: detected prerequisites for accelerated rendering
> >         support.
> >         Enabling --gpu_mode=3Dgfxstream.
> >         GPU vhost user auto mode: not yet supported with qemu_cli. Not
> >         enabling vhost user gpu.
> >         Requested resuming a previous session (the default behavior) bu=
t
> >         the base images have changed under the overlay, making the
> >         overlay incompatible. Wiping the overlay files.
> >         Path for instance UDS: /tmp/cf_avd_1000
> >
> >         The following lines contain useful debugging information:
> >           Serial console is disabled; use -console=3Dtrue to enable it.
> >           Logcat output:
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/instances/cv=
d-1/logs/logcat
> >
> >           Kernel log:
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/instances/cv=
d-1/kernel.log
> >           Launcher log:
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/instances/cv=
d-1/logs/launcher.log
> >
> >           Instance configuration:
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/instances/cv=
d-1/cuttlefish_config.json
> >
> >           Launcher Build ID: 12309296
> >
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/modem_simulator
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/tombstone_receiver
> >         /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/log_tee
> >         /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/wmediumd
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/casimir_control_ser=
ver
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/screen_recording_se=
rver
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/adb_connector
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/socket_vsock_proxy
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/socket_vsock_proxy
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/tcp_connector
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/control_env_proxy_s=
erver
> >         /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/echo_serve=
r
> >         Start modem simulator, server_fds: 58, Sim type: normal
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/gnss_grpc_proxy
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/logcat_receiver
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/kernel_log_monitor
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/openwrt_control_ser=
ver
> >         /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/log_tee
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/process_restarter
> >         /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/netsimd
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/socket_vsock_proxy
> >
> >         Failed to open socket: Connection refused
> >
> >
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/socket_vsock_proxy
> >         /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/secure_env
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/x86_64-linux-gnu/qe=
mu/qemu-system-aarch64
> >         Server listening on
> >         unix:/tmp/cf_avd_1000/cvd-1/grpc_socket/CasimirControlServer.so=
ck
> >         Server listening on
> >         unix:/tmp/cf_avd_1000/cvd-1/grpc_socket/EchoServer.sock
> >         Server listening on
> >         unix:/tmp/cf_avd_1000/cvd-1/grpc_socket/OpenwrtControlServer.so=
ck
> >         root-canal I 09-03 10:06:13.219 device_boutique.cc:37
> >         Registering beacon
> >         root-canal I 09-03 10:06:13.219 device_boutique.cc:37
> >         Registering beacon_swarm
> >         root-canal I 09-03 10:06:13.219 device_boutique.cc:37
> >         Registering scripted_beacon
> >         root-canal I 09-03 10:06:13.219 device_boutique.cc:37
> >         Registering sniffer
> >         Server listening on
> >
>  unix:/tmp/cf_avd_1000/cvd-1/grpc_socket/ControlEnvProxyServer.sock
> >         netsimd I 09-03 08:06:13.221 rust_main.rs:98
> >         <http://rust_main.rs:98> - netsim artifacts path:
> >         "/tmp/android-ziomario/netsimd"
> >         netsimd I 09-03 08:06:13.221 rust_main.rs:101
> >         <http://rust_main.rs:101> - NetsimdArgs {
> >             fd_startup_str: Some(
> >                 "{\"devices\":[{\"name\":\"0.0.0.0:6520
> >         <http://0.0.0.0:6520
> >\",\"chips\":[{\"kind\":\"BLUETOOTH\",\"fdIn\":81,\"fdOut\":82},{\"kind\=
":\"UWB\",\"fdIn
> >         \":83,\"fdOut\":84}]}]}",
> >             ),
> >             no_cli_ui: false,
> >             no_web_ui: false,
> >             pcap: false,
> >             disable_address_reuse: false,
> >             hci_port: Some(
> >                 7300,
> >             ),
> >             connector_instance: None,
> >             instance: Some(
> >                 1,
> >             ),
> >             logtostderr: false,
> >             dev: false,
> >             rust_grpc: false,
> >             rust_hostapd: false,
> >             rust_slirp: true,
> >             vsock: None,
> >             config: None,
> >             host_dns: None,
> >             http_proxy: None,
> >             wifi_tap: None,
> >             test_beacons: false,
> >             no_test_beacons: false,
> >             no_shutdown: false,
> >             verbose: false,
> >             version: false,
> >         }
> >         Size of OBJECT =3D 1204
> >         Size of components in TPMT_SENSITIVE =3D 744
> >             TPMI_ALG_PUBLIC                 2
> >             TPM2B_AUTH                      50
> >             TPM2B_DIGEST                    50
> >             TPMU_SENSITIVE_COMPOSITE        642
> >         MAX_CONTEXT_SIZE can be reduced to 1264 (1344)
> >         size : 360
> >         starting Rust KeyMint TA implementation in a thread
> >         starting C++ KeyMint implementation in a thread with FDs in=3D3=
1,
> >         out=3D30
> >         KeyMint Rust TA running with infile=3D37, outfile=3D36,
> >         security_level=3DSoftware
> >         No secure deletion data file found. Creating one.
> >         I0903 10:06:13.249418 2786724 SharedLibrary.cpp:64]
> >         SharedLibrary::open for [libvulkan.so]
> >
> >         I0903 10:06:13.249507 2786724 SharedLibrary.cpp:76]
> >         SharedLibrary::open for [libvulkan.so]: not found in map, open
> >         for the first time
> >
> >         I0903 10:06:13.249511 2786724 SharedLibrary.cpp:186]
> >         SharedLibrary::open for [libvulkan.so] (posix): begin
> >
> >         I0903 10:06:13.249514 2786724 SharedLibrary.cpp:244]
> >         SharedLibrary::open for [libvulkan.so] (posix,linux): call
> >         dlopen on [libvulkan.so
> >         ]
> >
> >         added library libvulkan.so
> >         I0903 10:06:13.250535 2786724 HealthMonitor.cpp:280]
> >         HealthMonitor disabled.
> >         createGlobalVkEmulation:964 Selecting Vulkan device: NVIDIA
> >         GeForce GTX 1060 3GB
> >         initialize: Supports id properties, got a vulkan device UUID
> >         I0903 10:06:13.354756 2786724 SharedLibrary.cpp:76]
> >         SharedLibrary::open for [libGLESv2.so]: not found in map, open
> >         for the first time
> >
> >         I0903 10:06:13.354764 2786724 SharedLibrary.cpp:186]
> >         SharedLibrary::open for [libGLESv2.so] (posix): begin
> >
> >         I0903 10:06:13.354768 2786724 SharedLibrary.cpp:244]
> >         SharedLibrary::open for [libGLESv2.so] (posix,linux): call
> >         dlopen on [libGLESv2.so
> >         ]
> >
> >         I0903 10:06:13.355076 2786724 SharedLibrary.cpp:76]
> >         SharedLibrary::open for [libEGL.so]: not found in map, open for
> >         the first time
> >
> >         I0903 10:06:13.355081 2786724 SharedLibrary.cpp:186]
> >         SharedLibrary::open for [libEGL.so] (posix): begin
> >
> >         I0903 10:06:13.355084 2786724 SharedLibrary.cpp:244]
> >         SharedLibrary::open for [libEGL.so] (posix,linux): call dlopen
> >         on [libEGL.so]
> >
> >         I0903 10:06:13.448821 2786724 VkCommonOperations.cpp:1226]
> >         Initializing VkEmulation features:
> >         I0903 10:06:13.448837 2786724 VkCommonOperations.cpp:1227]
> >              glInteropSupported: true
> >         I0903 10:06:13.448840 2786724 VkCommonOperations.cpp:1228]
> >              useDeferredCommands: true
> >         I0903 10:06:13.448842 2786724 VkCommonOperations.cpp:1230]
> >              createResourceWithRequirements: true
> >         I0903 10:06:13.448844 2786724 VkCommonOperations.cpp:1231]
> >              useVulkanComposition: false
> >         I0903 10:06:13.448846 2786724 VkCommonOperations.cpp:1232]
> >              useVulkanNativeSwapchain: false
> >         I0903 10:06:13.448848 2786724 VkCommonOperations.cpp:1233]
> >              enable guestRenderDoc: false
> >         I0903 10:06:13.448850 2786724 VkCommonOperations.cpp:1234]
> >              ASTC LDR emulation mode: 2
> >         I0903 10:06:13.448852 2786724 VkCommonOperations.cpp:1235]
> >              enable ETC2 emulation: true
> >         I0903 10:06:13.448854 2786724 VkCommonOperations.cpp:1236]
> >              enable Ycbcr emulation: false
> >         I0903 10:06:13.448856 2786724 VkCommonOperations.cpp:1237]
> >              guestUsesAngle: false
> >         I0903 10:06:13.448858 2786724 VkCommonOperations.cpp:1238]
> >              useDedicatedAllocations: false
> >         I0903 10:06:13.449542 2786724 FrameBuffer.cpp:486] Graphics
> >         Adapter Vendor Google (NVIDIA Corporation)
> >         I0903 10:06:13.449548 2786724 FrameBuffer.cpp:487] Graphics
> >         Adapter Android Emulator OpenGL ES Translator (NVIDIA GeForce
> >         GTX 1060 3GB/
> >         PCIe/SSE2)
> >         I0903 10:06:13.449551 2786724 FrameBuffer.cpp:488] Graphics API
> >         Version OpenGL ES 3.0 (OpenGL ES 3.2 NVIDIA 535.183.01)
> >         I0903 10:06:13.449553 2786724 FrameBuffer.cpp:489] Graphics API
> >         Extensions GL_OES_EGL_sync GL_OES_EGL_image
> >         GL_OES_EGL_image_external G
> >         L_OES_depth24 GL_OES_depth32 GL_OES_element_index_uint
> >         GL_OES_texture_float GL_OES_texture_float_linear
> >         GL_OES_compressed_paletted_text
> >         ure GL_OES_compressed_ETC1_RGB8_texture GL_OES_depth_texture
> >         GL_OES_texture_half_float GL_OES_texture_half_float_linear
> >         GL_OES_packed_d
> >         epth_stencil GL_OES_vertex_half_float
> >         GL_OES_standard_derivatives GL_OES_texture_npot
> >         GL_OES_rgb8_rgba8 GL_OVR_multiview2 GL_EXT_multiv
> >         iew_texture_multisample GL_EXT_color_buffer_float
> >         GL_EXT_color_buffer_half_float GL_EXT_texture_format_BGRA8888
> >         GL_APPLE_texture_format
> >         _BGRA8888 GL_EXT_texture_buffer GL_OES_texture_buffer
> >         GL_EXT_draw_buffers_indexed
> >         I0903 10:06:13.449559 2786724 FrameBuffer.cpp:490] Graphics
> >         Device Extensions N/A
> >         GUEST_UBOOT_VERSION: 2024.01-g1ed8f8bde33e-ab12091206 (Jul 10
> >         2024 - 23:47:38 +0000)
> >         U-Boot 20
> >         starting Rust KeyMint TA implementation in a thread
> >         starting C++ KeyMint implementation in a thread with FDs in=3D3=
1,
> >         out=3D30
> >         KeyMint Rust TA running with infile=3D37, outfile=3D36,
> >         security_level=3DSoftware
> >         Secure deletion data file found. Parsing.
> >         2024-09-03T08:06:13.626075Z qemu-system-aarch64:
> >         virtio-serial-bus: Unexpected port id 16 for device
> virtio-serial.0
> >         2024-09-03T08:06:13.626410Z qemu-system-aarch64:
> >         virtio-serial-bus: Unexpected port id 17 for device
> virtio-serial.0
> >         2024-09-03T08:06:13.626599Z qemu-system-aarch64:
> >         virtio-serial-bus: Unexpected port id 18 for device
> virtio-serial.0
> >         2024-09-03T08:06:13.626788Z qemu-system-aarch64:
> >         virtio-serial-bus: Unexpected port id 19 for device
> virtio-serial.0
> >         2024-09-03T08:06:13.626980Z qemu-system-aarch64:
> >         virtio-serial-bus: Unexpected port id 20 for device
> virtio-serial.0
> >         2024-09-03T08:06:13.627171Z qemu-system-aarch64:
> >         virtio-serial-bus: Unexpected port id 21 for device
> virtio-serial.0
> >         2024-09-03T08:06:13.627360Z qemu-system-aarch64:
> >         virtio-serial-bus: Unexpected port id 22 for device
> virtio-serial.0
> >         2024-09-03T08:06:13.627549Z qemu-system-aarch64:
> >         virtio-serial-bus: Unexpected port id 23 for device
> virtio-serial.0
> >         2024-09-03T08:06:13.627738Z qemu-system-aarch64:
> >         virtio-serial-bus: Unexpected port id 24 for device
> virtio-serial.0
> >         2024-09-03T08:06:13.627930Z qemu-system-aarch64:
> >         virtio-serial-bus: Unexpected port id 25 for device
> virtio-serial.0
> >         2024-09-03T08:06:13.628119Z qemu-system-aarch64:
> >         virtio-serial-bus: Unexpected port id 26 for device
> virtio-serial.0
> >         2024-09-03T08:06:13.628307Z qemu-system-aarch64:
> >         virtio-serial-bus: Unexpected port id 27 for device
> virtio-serial.0
> >         2024-09-03T08:06:13.628496Z qemu-system-aarch64:
> >         virtio-serial-bus: Unexpected port id 28 for device
> virtio-serial.0
> >         2024-09-03T08:06:13.628683Z qemu-system-aarch64:
> >         virtio-serial-bus: Unexpected port id 29 for device
> virtio-serial.0
> >         2024-09-03T08:06:13.628874Z qemu-system-aarch64:
> >         virtio-serial-bus: Unexpected port id 30 for device
> virtio-serial.0
> >
> >         GUEST_KERNEL_VERSION:
> >         6.6.46-android15-8-g3569b053517c-ab12290856-4k
> >         (kleaf@build-host) (Android (11368308, +pgo, +bolt, +lto, +mlgo=
,
> >         based on r510928) clang version 18.0.0
> >         (https://android.googlesource.com/toolchain/llvm-project
> >         <https://android.googlesource.com/toolchain/llvm-project>
> >         477610d4d0d988e69dbc3fae4fe86bff3f07f2b5), LLD 18.0.0) #1 SMP
> >         PREEMPT Wed Aug 28 21:43:33 UTC 2024
> >         ] Linux version
> >         transport message failed, response body: device '0.0.0.0:6520
> >         <http://0.0.0.0:6520>' not found
> >         transport message failed, response body: device '0.0.0.0:6520
> >         <http://0.0.0.0:6520>' not found
> >         transport message failed, response body: device '0.0.0.0:6520
> >         <http://0.0.0.0:6520>' not found
> >         transport message failed, response body: device '0.0.0.0:6520
> >         <http://0.0.0.0:6520>' not found
> >         GUEST_BUILD_FINGERPRINT:
> >
>  generic/aosp_cf_arm64_only_phone/vsoc_arm64_only:VanillaIceCream/MAIN.1c=
019b0c/12309296:userdebug/test-keys
> >         transport message failed, response body: device '0.0.0.0:6520
> >         <http://0.0.0.0:6520>' not found
> >         transport message failed, response body: device '0.0.0.0:6520
> >         <http://0.0.0.0:6520>' not found
> >         transport message failed, response body: device '0.0.0.0:6520
> >         <http://0.0.0.0:6520>' not found
> >         transport message failed, response body: device '0.0.0.0:6520
> >         <http://0.0.0.0:6520>' not found
> >         transport message failed, response body: device '0.0.0.0:6520
> >         <http://0.0.0.0:6520>' not found
> >         transport message failed, response body: device '0.0.0.0:6520
> >         <http://0.0.0.0:6520>' not found
> >         transport message failed, response body: device '0.0.0.0:6520
> >         <http://0.0.0.0:6520>' not found
> >         transport message failed, response body: device '0.0.0.0:6520
> >         <http://0.0.0.0:6520>' not found
> >         init: starting service 'adbd'...
> >         proxy_fastboot] Stop event (11) received. Stopping proxy
> >         proxy_adb] Start event (5) received. Starting proxy
> >         proxy_adb] From: tcp: 6520
> >         proxy_adb] To: vsock: 3:5555 vhost_user: false
> >         transport message failed, response body: device '0.0.0.0:6520
> >         <http://0.0.0.0:6520>' not found
> >         I0903 10:09:30.816108 2787314 IntelDrmDecoder.cpp:38]
> >         IntelDrmDecoder created for context 2
> >         I0903 10:09:32.764820 2787316 IntelDrmDecoder.cpp:38]
> >         IntelDrmDecoder created for context 7
> >         VIRTUAL_DEVICE_DISPLAY_POWER_MODE_CHANGED
> >         VIRTUAL_DEVICE_DISPLAY_POWER_MODE_CHANGED
> >         I0903 10:10:20.918014 2787359 IntelDrmDecoder.cpp:38]
> >         IntelDrmDecoder created for context 11
> >
> >         I see a lot of errors,but it seems connected :
> >
> >         ziomario@Z390-AORUS-PRO-DEST:~/Scrivania$ adb devices
> >         List of devices attached
> >         0.0.0.0:6520 <http://0.0.0.0:6520>    device
> >
> >         but scrcpy didn't work :
> >
> >         ziomario@Z390-AORUS-PRO-DEST:~/Scrivania$ scrcpy
> >
> >         scrcpy 2.6.1 <https://github.com/Genymobile/scrcpy
> >         <https://github.com/Genymobile/scrcpy>>
> >         INFO: ADB device found:
> >         INFO:     --> (tcpip) 0.0.0.0:6520 <http://0.0.0.0:6520>
> >                             device  Cuttlefish_arm64_phone_64_bit_only
> >
> >         /usr/local/share/scrcpy/scrcpy-server: 1 file pushed, 0 skipped=
.
> >         90.0 MB/s (71112 bytes in 0.001s)
> >         [server] INFO: Device: [Google] generic Cuttlefish arm64 phone
> >         64-bit only (Android 14)
> >         [server] ERROR: Could not register rotation watcher
> >         java.lang.NullPointerException: Attempt to invoke virtual metho=
d
> >         'java.lang.Class java.lang.Object.getClass()' on a null object
> >         reference
> >
> >                 at
> >
>  com.genymobile.scrcpy.wrappers.WindowManager.registerRotationWatcher(Win=
dowManager.java:185)
> >                 at
> >         com.genymobile.scrcpy.device.Device.<init>(Device.java:93)
> >                 at com.genymobile.scrcpy.Server.scrcpy(Server.java:145)
> >                 at
> >         com.genymobile.scrcpy.Server.internalMain(Server.java:290)
> >                 at com.genymobile.scrcpy.Server.main(Server.java:245)
> >                 at
> >         com.android.internal.os.RuntimeInit.nativeFinishInit(Native
> Method)
> >                 at
> >         com.android.internal.os.RuntimeInit.main(RuntimeInit.java:369)
> >
> >         [server] ERROR: Could not register display fold listener
> >
> >         java.lang.NullPointerException: Attempt to invoke virtual metho=
d
> >         'java.lang.Class java.lang.Object.getClass()' on a null object
> >         reference
> >
> >                 at
> >
>  com.genymobile.scrcpy.wrappers.WindowManager.registerDisplayFoldListener=
(WindowManager.java:206)
> >                 at
> >         com.genymobile.scrcpy.device.Device.<init>(Device.java:108)
> >                 at com.genymobile.scrcpy.Server.scrcpy(Server.java:145)
> >                 at
> >         com.genymobile.scrcpy.Server.internalMain(Server.java:290)
> >                 at com.genymobile.scrcpy.Server.main(Server.java:245)
> >                 at
> >         com.android.internal.os.RuntimeInit.nativeFinishInit(Native
> Method)
> >                 at
> >         com.android.internal.os.RuntimeInit.main(RuntimeInit.java:369)
> >
> >         [server] WARN: No clipboard manager, copy-paste between device
> >         and computer will not work
> >         [server] ERROR: Attempt to invoke virtual method
> >         'android.view.InputDevice
> >         android.hardware.input.InputManagerGlobal.getInputDevice(int)'
> >         on a null object reference
> >         java.lang.NullPointerException: Attempt to invoke virtual metho=
d
> >         'android.view.InputDevice
> >         android.hardware.input.InputManagerGlobal.getInputDevice(int)'
> >         on a null object reference
> >                 at
> >         android.view.KeyCharacterMap.load(KeyCharacterMap.java:364)
> >                 at
> >
>  com.genymobile.scrcpy.control.Controller.<init>(Controller.java:45)
> >                 at com.genymobile.scrcpy.Server.scrcpy(Server.java:159)
> >                 at
> >         com.genymobile.scrcpy.Server.internalMain(Server.java:290)
> >                 at com.genymobile.scrcpy.Server.main(Server.java:245)
> >                 at
> >         com.android.internal.os.RuntimeInit.nativeFinishInit(Native
> Method)
> >                 at
> >         com.android.internal.os.RuntimeInit.main(RuntimeInit.java:369)
> >
> >         INFO: Renderer: opengl
> >         INFO: OpenGL version: 4.6.0 NVIDIA 535.183.01
> >         INFO: Trilinear filtering enabled
> >         WARN: Device disconnected
> >         ERROR: Demuxer 'video': stream disabled due to connection error
> >         ERROR: Demuxer 'audio': stream disabled due to connection error
> >
> >         Even if the phone is still up :
> >
> >         ziomario@Z390-AORUS-PRO-DEST:~/Scrivania$ adb devices
> >         List of devices attached
> >         0.0.0.0:6520 <http://0.0.0.0:6520>    device
> >
> >         On Tue, Sep 3, 2024 at 1:03=E2=80=AFAM Pierrick Bouvier
> >         <pierrick.bouvier@linaro.org
> >         <mailto:pierrick.bouvier@linaro.org>> wrote:
> >
> >             The cvd-host package in this case are binaries/libraries
> >             compiled for
> >             aarch64, so it can be used on linux aarch64 and benefit fro=
m
> >             kvm
> >             acceleration.
> >
> >             In your case, running emulation from a x64 host, you need
> >             cvd-host_package-x86_64.tar.gz instead.
> >
> >             On 9/2/24 15:38, Mario Marietto wrote:
> >              > Update :
> >              >
> >              >
> >             ziomario@Z390-AORUS-PRO-DEST:/mnt/zroot-133/_OS/Android/aos=
p_14/android-image/bin$
> mkdir x86_64-linux-musl
> >              >
> >              >
> >             ziomario@Z390-AORUS-PRO-DEST:/mnt/zroot-133/_OS/Android/aos=
p_14/android-image/bin$
> cp
> /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/aarch64-linux-musl/c=
rosvm
> /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/x86_64-linux-musl
> >              >
> >              >
> >             ziomario@Z390-AORUS-PRO-DEST:/mnt/zroot-133/_OS/Android/aos=
p_14/android-image$
> HOME=3D$(pwd) ./bin/launch_cvd -vm_manager qemu_cli
> -report_anonymous_usage_stats=3Dn --start_webrtc=3Dfalse
> >              >
> >              >
> >              > Unfortunately it does not work :
> >              >
> >              >
> >              > 09-03 00:03:28.916 2737211 2737211 I launch_cvd:
> >             main.cc:235 Using
> >              > system_image_dir of:
> >              >
> >
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >              > NOTICE:
> >              >
> >              > By using this Android Virtual Device, you agree to
> >              > Google Terms of Service
> >             (https://policies.google.com/terms
> >             <https://policies.google.com/terms>
> >              > <https://policies.google.com/terms
> >             <https://policies.google.com/terms>>).
> >              > The Google Privacy Policy
> >             (https://policies.google.com/privacy
> >             <https://policies.google.com/privacy>
> >              > <https://policies.google.com/privacy
> >             <https://policies.google.com/privacy>>)
> >              > describes how Google handles information generated as yo=
u
> use
> >              > Google Services.
> >              >
> >
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >              >
> >              > Reading --config option from:
> >              >
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/android-info.txt
> >              > Launching CVD using --config=3D'phone'.
> >              >
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/aarch64-linux-gnu/g=
fxstream_graphics_detector:
> error while loading shared
> >              >
> >              > libraries: libc.so.6: cannot open shared object file: No
> >             such file or
> >              > directory
> >              >
> >              > Failed to run graphics detector, bad return value: 127.
> >             Assuming no
> >              > availability.
> >              > GPU auto mode: did not detect prerequisites for
> >             accelerated rendering
> >              > support, enabling --gpu_mode=3Dguest_swiftshader.
> >              > GPU vhost user auto mode: not needed for
> >             --gpu_mode=3Dguest_swiftshader.
> >              > Not enabling vhost user gpu.
> >              > Requested resuming a previous session (the default
> >             behavior) but the
> >              > base images have changed under the overlay, making the
> >             overlay
> >              > incompatible. Wiping the overlay files.
> >              >
> >              > Path for instance UDS: /tmp/cf_avd_1000
> >              >
> >              > The following lines contain useful debugging information=
:
> >              >   Serial console is disabled; use -console=3Dtrue to ena=
ble
> it.
> >              >   Logcat output:
> >              >
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/instances/cv=
d-1/logs/logcat
> >              >   Kernel log:
> >              >
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/instances/cv=
d-1/kernel.log
> >              >   Launcher log:
> >              >
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/instances/cv=
d-1/logs/launcher.log
> >              >   Instance configuration:
> >              >
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/instances/cv=
d-1/cuttlefish_config.json
> >              >   Launcher Build ID: 12309296
> >              > 4. main.cc:232| RunCvdMain|
> >              > 3. main.cc:104| Run|
> >              > 2. server_loop_impl.cpp:89| Run|
> >              > 1. qemu_manager.cpp:247| StartCommands|
> >              > |
> >
>  device/google/cuttlefish/host/libs/vm_manager/qemu_manager.cpp:97
> >              > | Result<std::pair<int, int>>
> >             cuttlefish::vm_manager::(anonymous
> >              > namespace)::GetQemuVersion(const std::string &)
> >              > v CF_EXPECT(qemu_version_ret =3D=3D 0)
> >              >
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/aarch64-linux-gnu/q=
emu/qemu-system-aarch64
> -version returned unexpected response .
> >              > Stderr was
> >              >
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/aarch64-linux-gnu/q=
emu/qemu-system-aarch64:
> error while loading shared
> >              >
> >              > libraries: libncursesw.so.6: cannot open shared object
> >             file: No such
> >              > file or directory
> >              >
> >              > On Mon, Sep 2, 2024 at 11:30=E2=80=AFPM Mario Marietto
> >             <marietto2008@gmail.com <mailto:marietto2008@gmail.com>
> >              > <mailto:marietto2008@gmail.com
> >             <mailto:marietto2008@gmail.com>>> wrote:
> >              >
> >              >     Something is not right :
> >              >
> >              >
> >               ziomario@Z390-AORUS-PRO-DEST:/mnt/zroot-133/_OS/Android/a=
osp_14/android-image$
> unzip ../aosp_cf_*.zip
> >              >
> >              >     Archive:  ../aosp_cf_arm64_only_phone-img-12309296.z=
ip
> >              >       inflating: android-info.txt
> >              >       inflating: fastboot-info.txt
> >              >       inflating: kernel_16k
> >              >       inflating: ramdisk_16k.img
> >              >       inflating: boot.img
> >              >       inflating: boot_16k.img
> >              >       inflating: bootloader
> >              >       inflating: init_boot.img
> >              >       inflating: userdata.img
> >              >       inflating: vbmeta.img
> >              >       inflating: vbmeta_system.img
> >              >       inflating: vbmeta_system_dlkm.img
> >              >       inflating: vbmeta_vendor_dlkm.img
> >              >       inflating: vendor_boot.img
> >              >       inflating: super.img
> >              >
> >              >
> >               ziomario@Z390-AORUS-PRO-DEST:/mnt/zroot-133/_OS/Android/a=
osp_14/android-image$
> tar xzvf ../cvd-host_package.tar.gz
> >              >
> >              >
> >              >     ./
> >              >     ./lib64/
> >              >     ./lib64/android.hardware.keymaster@3.0.so
> >             <mailto:android.hardware.keymaster@3.0.so>
> >              >     <mailto:android.hardware.keymaster@3.0.so
> >             <mailto:android.hardware.keymaster@3.0.so>>
> >              >     ./lib64/libciborium_io.dylib.so
> >             <http://libciborium_io.dylib.so>
> >             <http://libciborium_io.dylib.so
> >             <http://libciborium_io.dylib.so>>
> >              >     ./lib64/libjpeg.so
> >              >     ./lib64/cuttlefish_net.so
> >              >     ./lib64/libbase.so
> >              >     ./lib64/vulkan.pastel.so <http://vulkan.pastel.so>
> >             <http://vulkan.pastel.so <http://vulkan.pastel.so>>
> >              >     ./lib64/libcuttlefish_host_config.so
> >              >     ./lib64/libflagset.dylib.so
> >             <http://libflagset.dylib.so> <http://libflagset.dylib.so
> >             <http://libflagset.dylib.so>>
> >              >     ./lib64/libkmr_common.dylib.so
> >             <http://libkmr_common.dylib.so>
> >             <http://libkmr_common.dylib.so <
> http://libkmr_common.dylib.so>>
> >              >     ./lib64/libpkcs1.dylib.so <http://libpkcs1.dylib.so>
> >             <http://libpkcs1.dylib.so <http://libpkcs1.dylib.so>>
> >              >     ./lib64/libicui18n-host.so
> >              >     ./lib64/libwayland_client.so
> >              >     ./lib64/libunwindstack.so
> >              >     ./lib64/libkmr_ta.dylib.so
> >             <http://libkmr_ta.dylib.so> <http://libkmr_ta.dylib.so
> >             <http://libkmr_ta.dylib.so>>
> >              >     ./lib64/libcoset.dylib.so <http://libcoset.dylib.so>
> >             <http://libcoset.dylib.so <http://libcoset.dylib.so>>
> >              >     ./lib64/libcppbor.so
> >              >     ./lib64/libgatekeeper.so
> >              >     ./lib64/libyuv.so
> >              >     ./lib64/libgrpc++.so
> >              >     ./lib64/libkmr_cf_ffi.so
> >              >     ./lib64/libcppcose_rkp.so
> >              >     ./lib64/libcuttlefish_transport.so
> >              >     ./lib64/liblzma.so
> >              >     ./lib64/libciborium_ll.dylib.so
> >             <http://libciborium_ll.dylib.so>
> >             <http://libciborium_ll.dylib.so
> >             <http://libciborium_ll.dylib.so>>
> >              >     ./lib64/libcuttlefish_allocd_utils.so
> >              >     ./lib64/libgflags.so
> >              >     ./lib64/android.hardware.keymaster@4.0.so
> >             <mailto:android.hardware.keymaster@4.0.so>
> >              >     <mailto:android.hardware.keymaster@4.0.so
> >             <mailto:android.hardware.keymaster@4.0.so>>
> >              >     ./lib64/libcfg_if.dylib.so
> >             <http://libcfg_if.dylib.so> <http://libcfg_if.dylib.so
> >             <http://libcfg_if.dylib.so>>
> >              >     ./lib64/libspki.dylib.so <http://libspki.dylib.so>
> >             <http://libspki.dylib.so <http://libspki.dylib.so>>
> >              >     ./lib64/libzeroize.dylib.so
> >             <http://libzeroize.dylib.so> <http://libzeroize.dylib.so
> >             <http://libzeroize.dylib.so>>
> >              >     ./lib64/libcgrouprc.so
> >              >     ./lib64/libprotobuf-cpp-full.so
> >              >     ./lib64/libcutils.so
> >              >     ./lib64/libsqlite.so
> >              >     ./lib64/libcuttlefish_utils_result.so
> >              >     ./lib64/libbinder_ndk.so
> >              >     ./lib64/libext2_uuid-host.so
> >              >     ./lib64/libhex.dylib.so <http://libhex.dylib.so>
> >             <http://libhex.dylib.so <http://libhex.dylib.so>>
> >              >     ./lib64/libc_musl.so
> >              >     ./lib64/libconst_oid.dylib.so
> >             <http://libconst_oid.dylib.so> <http://libconst_oid.dylib.s=
o
> >             <http://libconst_oid.dylib.so>>
> >              >     ./lib64/libprotobuf_support.dylib.so
> >             <http://libprotobuf_support.dylib.so>
> >              >     <http://libprotobuf_support.dylib.so
> >             <http://libprotobuf_support.dylib.so>>
> >              >     ./lib64/tpm2-tss2-tcti.so
> >              >     ./lib64/libserde.dylib.so <http://libserde.dylib.so>
> >             <http://libserde.dylib.so <http://libserde.dylib.so>>
> >              >     ./lib64/libartpalette.so
> >              >     ./lib64/liblog.so
> >              >     ./lib64/libonce_cell.dylib.so
> >             <http://libonce_cell.dylib.so> <http://libonce_cell.dylib.s=
o
> >             <http://libonce_cell.dylib.so>>
> >              >     ./lib64/libthiserror.dylib.so
> >             <http://libthiserror.dylib.so> <http://libthiserror.dylib.s=
o
> >             <http://libthiserror.dylib.so>>
> >              >     ./lib64/libssl-host.so
> >              >     ./lib64/libc++.so
> >              >     ./lib64/libext4_utils.so
> >              >     ./lib64/libpkcs8.dylib.so <http://libpkcs8.dylib.so>
> >             <http://libpkcs8.dylib.so <http://libpkcs8.dylib.so>>
> >              >     ./lib64/libsparse-host.so
> >              >     ./lib64/sandboxed_api_sandbox2.so
> >              >     ./lib64/libcuttlefish_command_util.so
> >              >     ./lib64/libbssl_sys.dylib.so
> >             <http://libbssl_sys.dylib.so> <http://libbssl_sys.dylib.so
> >             <http://libbssl_sys.dylib.so>>
> >              >     ./lib64/libkeymaster_messages.so
> >              >     ./lib64/libcuttlefish_web.so
> >              >     ./lib64/libvpx.so
> >              >     ./lib64/libopus.so
> >              >     ./lib64/libminijail.so
> >              >     ./lib64/libcurl-host.so
> >              >     ./lib64/libcuttlefish_kernel_log_monitor_utils.so
> >              >     ./lib64/tpm2-tss2-util.so
> >              >     ./lib64/liblibc.dylib.so <http://liblibc.dylib.so>
> >             <http://liblibc.dylib.so <http://liblibc.dylib.so>>
> >              >     ./lib64/libprotobuf.dylib.so
> >             <http://libprotobuf.dylib.so> <http://libprotobuf.dylib.so
> >             <http://libprotobuf.dylib.so>>
> >              >     ./lib64/libbitflags.dylib.so
> >             <http://libbitflags.dylib.so> <http://libbitflags.dylib.so
> >             <http://libbitflags.dylib.so>>
> >              >     ./lib64/libutils.so
> >              >     ./lib64/libjsoncpp.so
> >              >     ./lib64/libext2_blkid-host.so
> >              >     ./lib64/libnl.so
> >              >     ./lib64/tpm2-tss2-sys.so
> >              >     ./lib64/libartbase.so
> >              >     ./lib64/libxml2.so
> >              >     ./lib64/libkmr_proto_rust.dylib.so
> >             <http://libkmr_proto_rust.dylib.so>
> >             <http://libkmr_proto_rust.dylib.so
> >             <http://libkmr_proto_rust.dylib.so>>
> >              >     ./lib64/libcuttlefish_security.so
> >              >     ./lib64/libsecure_env_tpm.dylib.so
> >             <http://libsecure_env_tpm.dylib.so>
> >             <http://libsecure_env_tpm.dylib.so
> >             <http://libsecure_env_tpm.dylib.so>>
> >              >     ./lib64/libz-host.so
> >              >     ./lib64/libprocessgroup.so
> >              >     ./lib64/libcrypto_utils.so
> >              >     ./lib64/libder.dylib.so <http://libder.dylib.so>
> >             <http://libder.dylib.so <http://libder.dylib.so>>
> >              >     ./lib64/libdexfile.so
> >              >     ./lib64/cf_metrics_proto.so
> >              >     ./lib64/tpm2-tss2-esys.so
> >              >     ./lib64/libcuttlefish_utils.so
> >              >     ./lib64/libkeymaster_portable.so
> >              >     ./lib64/libfruit.so
> >              >     ./lib64/tpm2-tss2-rc.so
> >              >     ./lib64/libcap.so
> >              >     ./lib64/libnix.dylib.so <http://libnix.dylib.so>
> >             <http://libnix.dylib.so <http://libnix.dylib.so>>
> >              >     ./lib64/libicuuc-host.so
> >              >     ./lib64/libziparchive.so
> >              >     ./lib64/libkmr_ta_nonsecure.dylib.so
> >             <http://libkmr_ta_nonsecure.dylib.so>
> >              >     <http://libkmr_ta_nonsecure.dylib.so
> >             <http://libkmr_ta_nonsecure.dylib.so>>
> >              >     ./lib64/libstd.dylib.so <http://libstd.dylib.so>
> >             <http://libstd.dylib.so <http://libstd.dylib.so>>
> >              >     ./lib64/libhalf.dylib.so <http://libhalf.dylib.so>
> >             <http://libhalf.dylib.so <http://libhalf.dylib.so>>
> >              >     ./lib64/tpm2-tss2-mu.so
> >              >     ./lib64/libmemoffset.dylib.so
> >             <http://libmemoffset.dylib.so> <http://libmemoffset.dylib.s=
o
> >             <http://libmemoffset.dylib.so>>
> >              >     ./lib64/liblp.so
> >              >     ./lib64/libcuttlefish_fs.so
> >              >     ./lib64/libProxyConfig.so
> >              >     ./lib64/libopenssl.dylib.so
> >             <http://libopenssl.dylib.so> <http://libopenssl.dylib.so
> >             <http://libopenssl.dylib.so>>
> >              >     ./lib64/libkmr_wire.dylib.so
> >             <http://libkmr_wire.dylib.so> <http://libkmr_wire.dylib.so
> >             <http://libkmr_wire.dylib.so>>
> >              >     ./lib64/libkmr_crypto_boring.dylib.so
> >             <http://libkmr_crypto_boring.dylib.so>
> >              >     <http://libkmr_crypto_boring.dylib.so
> >             <http://libkmr_crypto_boring.dylib.so>>
> >              >     ./lib64/liblog_rust.dylib.so
> >             <http://liblog_rust.dylib.so> <http://liblog_rust.dylib.so
> >             <http://liblog_rust.dylib.so>>
> >              >     ./lib64/libhidlbase.so
> >              >     ./lib64/libgrpc_wrap.so
> >              >     ./lib64/libgrpc++_unsecure.so
> >              >     ./lib64/libbytes.dylib.so <http://libbytes.dylib.so>
> >             <http://libbytes.dylib.so <http://libbytes.dylib.so>>
> >              >     ./lib64/libsoft_attestation_cert.so
> >              >     ./lib64/libcuttlefish_run_cvd_proto.so
> >              >     ./lib64/libbinder.so
> >              >     ./lib64/libcrypto-host.so
> >              >     ./lib64/libwebm_mkvmuxer.so
> >              >     ./lib64/libkmr_cf.dylib.so
> >             <http://libkmr_cf.dylib.so> <http://libkmr_cf.dylib.so
> >             <http://libkmr_cf.dylib.so>>
> >              >     ./lib64/libciborium.dylib.so
> >             <http://libciborium.dylib.so> <http://libciborium.dylib.so
> >             <http://libciborium.dylib.so>>
> >              >     ./lib64/libpuresoftkeymasterdevice_host.so
> >              >     ./lib64/libx509_cert.dylib.so
> >             <http://libx509_cert.dylib.so> <http://libx509_cert.dylib.s=
o
> >             <http://libx509_cert.dylib.so>>
> >              >     ./lib64/libsec1.dylib.so <http://libsec1.dylib.so>
> >             <http://libsec1.dylib.so <http://libsec1.dylib.so>>
> >              >     ./nativetest64/
> >              >     ./nativetest64/modem_simulator_test/
> >              >
>  ./nativetest64/modem_simulator_test/modem_simulator_test
> >              >     ./nativetest64/cuttlefish_net_tests/
> >              >
>  ./nativetest64/cuttlefish_net_tests/cuttlefish_net_tests
> >              >     ./etc/
> >              >     ./etc/modem_simulator/
> >              >     ./etc/modem_simulator/files/
> >              >
> >
>  ./etc/modem_simulator/files/iccprofile_for_sim0_for_CtsCarrierApiTestCas=
es.xml
> >              >     ./etc/modem_simulator/files/iccprofile_for_sim0.xml
> >              >     ./etc/modem_simulator/files/numeric_operator.xml
> >              >     ./etc/cvd_rsa4096.avbpubkey
> >              >     ./etc/bootloader_aarch64/
> >              >     ./etc/bootloader_aarch64/bootloader.qemu
> >              >     ./etc/bootloader_aarch64/bootloader.crosvm
> >              >     ./etc/bootloader_riscv64/
> >              >     ./etc/bootloader_riscv64/bootloader.qemu
> >              >     ./etc/automotive/
> >              >     ./etc/automotive/vhalconfig/
> >              >
> >
>  ./etc/automotive/vhalconfig/VendorClusterTestProperties.json
> >              >     ./etc/automotive/vhalconfig/DefaultProperties.json
> >              >     ./etc/automotive/vhalconfig/TestProperties.json
> >              >     ./etc/automotive/proxy_config.json
> >              >     ./etc/cvd_rsa2048.avbpubkey
> >              >     ./etc/cvd_avb_testkey_rsa4096.pem
> >              >     ./etc/bootloader_arm/
> >              >     ./etc/bootloader_arm/bootloader.qemu
> >              >     ./etc/bootloader_x86_64/
> >              >     ./etc/bootloader_x86_64/bootloader.qemu
> >              >     ./etc/bootloader_x86_64/bootloader.crosvm
> >              >     ./etc/cvd_avb_testkey_rsa2048.pem
> >              >     ./etc/openwrt/
> >              >     ./etc/openwrt/images/
> >              >     ./etc/openwrt/images/openwrt_kernel_aarch64
> >              >     ./etc/openwrt/images/openwrt_rootfs_x86_64
> >              >     ./etc/openwrt/images/openwrt_rootfs_aarch64
> >              >     ./etc/openwrt/images/openwrt_kernel_x86_64
> >              >     ./etc/cvd_config/
> >              >     ./etc/cvd_config/cvd_config_tv.json
> >              >     ./etc/cvd_config/cvd_config_tablet.json
> >              >     ./etc/cvd_config/cvd_config_wear.json
> >              >     ./etc/cvd_config/cvd_config_auto_portrait.json
> >              >     ./etc/cvd_config/cvd_config_slim.json
> >              >     ./etc/cvd_config/cvd_config_go.json
> >              >     ./etc/cvd_config/cvd_config_foldable.json
> >              >     ./etc/cvd_config/cvd_config_auto.json
> >              >     ./etc/cvd_config/cvd_config_auto_md.json
> >              >     ./etc/cvd_config/cvd_config_phone.json
> >              >     ./usr/
> >              >     ./usr/share/
> >              >     ./usr/share/vulkan/
> >              >     ./usr/share/vulkan/icd.d/
> >              >     ./usr/share/vulkan/icd.d/vk_swiftshader_icd.json
> >              >     ./usr/share/qemu/
> >              >     ./usr/share/qemu/aarch64-linux-gnu/
> >              >
> >
>  ./usr/share/qemu/aarch64-linux-gnu/opensbi-riscv64-generic-fw_dynamic.bi=
n
> >              >     ./usr/share/qemu/aarch64-linux-gnu/efi-virtio.rom
> >              >     ./usr/share/qemu/aarch64-linux-gnu/keymaps/
> >              >     ./usr/share/qemu/aarch64-linux-gnu/keymaps/en-us
> >              >     ./usr/share/webrtc/
> >              >     ./usr/share/webrtc/assets/
> >              >     ./usr/share/webrtc/assets/style.css
> >              >     ./usr/share/webrtc/assets/index.css
> >              >     ./usr/share/webrtc/assets/index.html
> >              >     ./usr/share/webrtc/assets/js/
> >              >     ./usr/share/webrtc/assets/js/location.js
> >              >     ./usr/share/webrtc/assets/js/rootcanal.js
> >              >     ./usr/share/webrtc/assets/js/app.js
> >              >     ./usr/share/webrtc/assets/js/touch.js
> >              >     ./usr/share/webrtc/assets/js/adb.js
> >              >     ./usr/share/webrtc/assets/js/index.js
> >              >     ./usr/share/webrtc/assets/js/cf_webrtc.js
> >              >     ./usr/share/webrtc/assets/js/server_connector.js
> >              >     ./usr/share/webrtc/assets/js/controls.js
> >              >     ./usr/share/webrtc/assets/controls.css
> >              >     ./usr/share/webrtc/assets/custom.css
> >              >     ./usr/share/webrtc/assets/client.html
> >              >     ./usr/share/webrtc/certs/
> >              >     ./usr/share/webrtc/certs/server.p12
> >              >     ./usr/share/webrtc/certs/server.key
> >              >     ./usr/share/webrtc/certs/trusted.pem
> >              >     ./usr/share/webrtc/certs/server.crt
> >              >     ./usr/share/zoneinfo/
> >              >     ./usr/share/zoneinfo/tzdata
> >              >     ./usr/share/crosvm/
> >              >     ./usr/share/crosvm/aarch64-linux-gnu/
> >              >     ./usr/share/crosvm/aarch64-linux-gnu/seccomp/
> >              >
> >
>  ./usr/share/crosvm/aarch64-linux-gnu/seccomp/snd_null_device.policy
> >              >
> >
>  ./usr/share/crosvm/aarch64-linux-gnu/seccomp/gpu_render_server.policy
> >              >
> >               ./usr/share/crosvm/aarch64-linux-gnu/seccomp/battery.poli=
cy
> >              >
> >
>  ./usr/share/crosvm/aarch64-linux-gnu/seccomp/block_device.policy
> >              >
> >
>  ./usr/share/crosvm/aarch64-linux-gnu/seccomp/pmem_device.policy
> >              >
> >
>  ./usr/share/crosvm/aarch64-linux-gnu/seccomp/wl_device.policy
> >              >
> >
>  ./usr/share/crosvm/aarch64-linux-gnu/seccomp/9p_device.policy
> >              >
> >
>  ./usr/share/crosvm/aarch64-linux-gnu/seccomp/input_device.policy
> >              >
> >
>  ./usr/share/crosvm/aarch64-linux-gnu/seccomp/net_device.policy
> >              >
> >
>  ./usr/share/crosvm/aarch64-linux-gnu/seccomp/rng_device.policy
> >              >
> >
>  ./usr/share/crosvm/aarch64-linux-gnu/seccomp/coiommu_device.policy
> >              >
> >
>  ./usr/share/crosvm/aarch64-linux-gnu/seccomp/gpu_device.policy
> >              >
> >
>  ./usr/share/crosvm/aarch64-linux-gnu/seccomp/serial_device.policy
> >              >
> >
>  ./usr/share/crosvm/aarch64-linux-gnu/seccomp/cras_audio_device.policy
> >              >
> >
>  ./usr/share/crosvm/aarch64-linux-gnu/seccomp/null_audio_device.policy
> >              >
> >
>  ./usr/share/crosvm/aarch64-linux-gnu/seccomp/snd_cras_device.policy
> >              >
> >
>  ./usr/share/crosvm/aarch64-linux-gnu/seccomp/vhost_scmi_device.policy
> >              >
> >
>  ./usr/share/crosvm/aarch64-linux-gnu/seccomp/balloon_device.policy
> >              >
> >
>  ./usr/share/crosvm/aarch64-linux-gnu/seccomp/vhost_net_device.policy
> >              >
> >
>  ./usr/share/crosvm/aarch64-linux-gnu/seccomp/vhost_vsock_device.policy
> >              >
> >
>  ./usr/share/crosvm/aarch64-linux-gnu/seccomp/fs_device.policy
> >              >
> >
>  ./usr/share/crosvm/aarch64-linux-gnu/seccomp/video_device.policy
> >              >
> >
>  ./usr/share/crosvm/aarch64-linux-gnu/seccomp/xhci_device.policy
> >              >
> >
>  ./usr/share/crosvm/aarch64-linux-gnu/seccomp/vios_audio_device.policy
> >              >     ./bin/
> >              >     ./bin/modem_simulator
> >              >     ./bin/ms-tpm-20-ref
> >              >     ./bin/mkenvimage_slim
> >              >     ./bin/metrics
> >              >     ./bin/socket_vsock_proxy
> >              >     ./bin/resize.f2fs
> >              >     ./bin/metrics_launcher
> >              >     ./bin/automotive_vsock_proxy
> >              >     ./bin/newfs_msdos
> >              >     ./bin/netsim-ui/
> >              >     ./bin/netsim-ui/assets/
> >              >     ./bin/netsim-ui/assets/grid-background.svg
> >              >     ./bin/netsim-ui/assets/netsim-logo.svg
> >              >     ./bin/netsim-ui/assets/polar-background.svg
> >              >     ./bin/netsim-ui/assets/hexagonal-background.png
> >              >     ./bin/netsim-ui/assets/netsim-logo-b.svg
> >              >     ./bin/netsim-ui/node_modules/
> >              >     ./bin/netsim-ui/node_modules/tslib/
> >              >     ./bin/netsim-ui/node_modules/tslib/tslib.es6.js
> >              >     ./bin/netsim-ui/index.html
> >              >     ./bin/netsim-ui/js/
> >              >     ./bin/netsim-ui/js/device-info.js
> >              >     ./bin/netsim-ui/js/device-list.js
> >              >     ./bin/netsim-ui/js/packet-info.js
> >              >     ./bin/netsim-ui/js/device-dropzone.js
> >              >     ./bin/netsim-ui/js/navigation-bar.js
> >              >     ./bin/netsim-ui/js/device-map.js
> >              >     ./bin/netsim-ui/js/device-dragzone.js
> >              >     ./bin/netsim-ui/js/netsim-app.js
> >              >     ./bin/netsim-ui/js/customize-map-button.js
> >              >     ./bin/netsim-ui/js/device-observer.js
> >              >     ./bin/netsim-ui/js/license-info.js
> >              >     ./bin/netsim-ui/js/cube-sprite.js
> >              >     ./bin/netsim-ui/js/pyramid-sprite.js
> >              >     ./bin/unpack_bootimg
> >              >     ./bin/adb
> >              >     ./bin/extract-vmlinux
> >              >     ./bin/health
> >              >     ./bin/screen_recording_server
> >              >     ./bin/lz4
> >              >     ./bin/wmediumd_gen_config
> >              >     ./bin/gnss_grpc_proxy
> >              >     ./bin/simg2img
> >              >     ./bin/secure_env
> >              >     ./bin/mke2fs
> >              >     ./bin/snapshot_util_cvd
> >              >     ./bin/cvd_internal_display
> >              >     ./bin/acloud_translator
> >              >     ./bin/defrag.f2fs
> >              >     ./bin/tombstone_receiver
> >              >     ./bin/root-canal
> >              >     ./bin/netsimd
> >              >     ./bin/console_forwarder
> >              >     ./bin/powerwash_cvd
> >              >     ./bin/process_restarter
> >              >     ./bin/fsck.f2fs
> >              >     ./bin/cvd_host_bugreport
> >              >     ./bin/extract-ikconfig
> >              >     ./bin/cvd_internal_status
> >              >     ./bin/webRTC
> >              >     ./bin/acloud
> >              >     ./bin/tcp_connector
> >              >     ./bin/process_sandboxer
> >              >     ./bin/webrtc_operator
> >              >     ./bin/cvd_update_location
> >              >     ./bin/e2fsdroid
> >              >     ./bin/avbtool
> >              >     ./bin/fastboot
> >              >     ./bin/build_super_image
> >              >     ./bin/powerbtn_cvd
> >              >     ./bin/allocd_client
> >              >     ./bin/dump.f2fs
> >              >     ./bin/netsim
> >              >     ./bin/casimir
> >              >     ./bin/pica
> >              >     ./bin/cvd_update_security_algorithm
> >              >     ./bin/record_cvd
> >              >     ./bin/vhal_proxy_server
> >              >     ./bin/cvd_status
> >              >     ./bin/cvd_import_locations
> >              >     ./bin/launch_cvd
> >              >     ./bin/cvd_internal_start
> >              >     ./bin/restart_cvd
> >              >     ./bin/cvd_internal_host_bugreport
> >              >     ./bin/mkuserimg_mke2fs
> >              >     ./bin/fec
> >              >     ./bin/cvd_internal_env
> >              >     ./bin/vhost_device_vsock
> >              >     ./bin/cvd_internal_stop
> >              >     ./bin/cvd_send_sms
> >              >     ./bin/assemble_cvd
> >              >     ./bin/cvd_send_id_disclosure
> >              >     ./bin/mcopy
> >              >     ./bin/operator_proxy
> >              >     ./bin/mkbootfs
> >              >     ./bin/run_cvd
> >              >     ./bin/openwrt_control_server
> >              >     ./bin/mkbootimg
> >              >     ./bin/kernel_log_monitor
> >              >     ./bin/mmd
> >              >     ./bin/toybox
> >              >     ./bin/crosvm
> >              >     ./bin/aarch64-linux-musl/
> >              >     ./bin/aarch64-linux-musl/crosvm
> >              >     ./bin/sefcontext_compile
> >              >     ./bin/wmediumd
> >              >     ./bin/echo_server
> >              >     ./bin/log_tee
> >              >     ./bin/lpmake
> >              >     ./bin/logcat_receiver
> >              >     ./bin/lpunpack
> >              >     ./bin/control_env_proxy_server
> >              >     ./bin/mtools
> >              >     ./bin/adb_connector
> >              >     ./bin/aarch64-linux-gnu/
> >              >     ./bin/aarch64-linux-gnu/libepoxy.so.0
> >              >     ./bin/aarch64-linux-gnu/libffi.so.7
> >              >     ./bin/aarch64-linux-gnu/qemu/
> >              >     ./bin/aarch64-linux-gnu/qemu/qemu-system-x86_64
> >              >     ./bin/aarch64-linux-gnu/qemu/libepoxy.so.0
> >              >     ./bin/aarch64-linux-gnu/qemu/libvirglrenderer.so.1
> >              >     ./bin/aarch64-linux-gnu/qemu/libgbm.so.1
> >              >     ./bin/aarch64-linux-gnu/qemu/libgfxstream_backend.so=
.0
> >              >     ./bin/aarch64-linux-gnu/qemu/librutabaga_gfx_ffi.so.=
0
> >              >     ./bin/aarch64-linux-gnu/qemu/qemu-system-riscv64
> >              >     ./bin/aarch64-linux-gnu/qemu/qemu-system-aarch64
> >              >     ./bin/aarch64-linux-gnu/qemu/libc++.so.1
> >              >     ./bin/aarch64-linux-gnu/qemu/libunwind.so.1
> >              >     ./bin/aarch64-linux-gnu/qemu/libz.so.1
> >              >     ./bin/aarch64-linux-gnu/qemu/libc++abi.so.1
> >              >     ./bin/aarch64-linux-gnu/libvirglrenderer.so.1
> >              >     ./bin/aarch64-linux-gnu/libdrm.so.2
> >              >     ./bin/aarch64-linux-gnu/libgbm.so.1
> >              >     ./bin/aarch64-linux-gnu/libgfxstream_backend.so
> >              >     ./bin/aarch64-linux-gnu/libwayland-client.so.0
> >              >     ./bin/aarch64-linux-gnu/libminijail.so
> >              >     ./bin/aarch64-linux-gnu/gfxstream_graphics_detector
> >              >     ./bin/aarch64-linux-gnu/crosvm
> >              >     ./bin/lpadd
> >              >     ./bin/make_f2fs
> >              >     ./bin/sandboxer_proxy
> >              >     ./bin/stop_cvd
> >              >     ./bin/casimir_control_server
> >              >
> >              >
> >              >
> >               ziomario@Z390-AORUS-PRO-DEST:/mnt/zroot-133/_OS/Android/a=
osp_14/android-image$
> HOME=3D$(pwd) ./bin/launch_cvd -vm_manager qemu_cli
> -report_anonymous_usage_stats=3Dn --start_webrtc=3Dfalse
> >              >
> >              >
> >              >     09-02 23:27:10.473 2729990 2729990 I launch_cvd:
> >             main.cc:235 Using
> >              >     system_image_dir of:
> >              >
> >
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >              >     NOTICE:
> >              >
> >              >     By using this Android Virtual Device, you agree to
> >              >     Google Terms of Service
> >             (https://policies.google.com/terms
> >             <https://policies.google.com/terms>
> >              >     <https://policies.google.com/terms
> >             <https://policies.google.com/terms>>).
> >              >     The Google Privacy Policy
> >             (https://policies.google.com/privacy
> >             <https://policies.google.com/privacy>
> >              >     <https://policies.google.com/privacy
> >             <https://policies.google.com/privacy>>)
> >              >     describes how Google handles information generated a=
s
> >             you use
> >              >     Google Services.
> >              >
> >
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >              >
> >              >     Reading --config option from:
> >              >
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/android-info.txt
> >              >     Launching CVD using --config=3D'phone'.
> >              >     aarch64-binfmt-P: Could not open
> >             '/lib/ld-linux-aarch64.so.1': No
> >              >     such file or directory
> >              >     Failed to run graphics detector, bad return value:
> >             255. Assuming no
> >              >     availability.
> >              >     GPU auto mode: did not detect prerequisites for
> >             accelerated
> >              >     rendering support, enabling
> --gpu_mode=3Dguest_swiftshader.
> >              >     GPU vhost user auto mode: not needed for
> >              >     --gpu_mode=3Dguest_swiftshader. Not enabling vhost u=
ser
> >             gpu.
> >              >     Requested resuming a previous session (the default
> >             behavior) but the
> >              >     base images have changed under the overlay, making
> >             the overlay inc
> >              >     ompatible. Wiping the overlay files.
> >              >     Path for instance UDS: /tmp/cf_avd_1000
> >              >     Failed to run
> >              >
> >
>  `/mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/crosvm
> >              >     create_qcow2 --backing-file
> >             /mnt/zroot-133/_OS/Android/aosp_
> >              >
> >
>  14/android-image/cuttlefish/instances/cvd-1/persistent_composite.img
> >              >
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/cuttlefish/instan
> >              >     ces/cvd-1/persistent_composite_overlay.img`
> >              >     stdout:
> >              >     ###
> >              >
> >              >     ###
> >              >     stderr:
> >              >     ###
> >              >
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/crosvm: riga 3:
> >              >
> >
>  /mnt/zroot-133/_OS/Android/aosp_14/android-image/bin/x86_64-linux-
> >              >     musl/crosvm: File o directory non esistente
> >              >
> >              >     ###
> >              >     Return code: "127"
> >              >     qemu: uncaught target signal 6 (Aborted) - core dump=
ed
> >              >     09-02 23:27:31.223 2729990 2729990 E launch_cvd:
> >             subprocess.cpp:207
> >              >     Subprocess 2730018 was interrupted by a signal
> >             'Aborted' (6)
> >              >     09-02 23:27:31.224 2729990 2729990 E launch_cvd:
> >             main.cc:323
> >              >     assemble_cvd returned -1
> >              >
> >              >     On Mon, Sep 2, 2024 at 11:20=E2=80=AFPM Mario Mariet=
to
> >              >     <marietto2008@gmail.com
> >             <mailto:marietto2008@gmail.com>
> >             <mailto:marietto2008@gmail.com
> >             <mailto:marietto2008@gmail.com>>> wrote:
> >              >
> >              >         Hello.
> >              >
> >              >         I've downloaded this file :
> >              >         aosp_cf_arm64_only_phone-img-12309296.zip and
> >             this file :
> >              >         cvd-host_package.tar.gz
> >              >
> >              >         from here :
> >              >
> >
> https://ci.android.com/builds/submitted/12309296/aosp_cf_arm64_only_phone=
-trunk_staging-userdebug/latest
> <
> https://ci.android.com/builds/submitted/12309296/aosp_cf_arm64_only_phone=
-trunk_staging-userdebug/latest>
> <
> https://ci.android.com/builds/submitted/12309296/aosp_cf_arm64_only_phone=
-trunk_staging-userdebug/latest
> <
> https://ci.android.com/builds/submitted/12309296/aosp_cf_arm64_only_phone=
-trunk_staging-userdebug/latest
> >>
> >              >
> >              >         But let's say that I don't want to use the *.img
> >             files that are
> >              >         stored inside
> >             "aosp_cf_arm64_only_phone-img-12309296.zip",but
> >              >         the same files that have been produced when I
> >             have compiled this
> >              >         version of Android :
> >              >
> >              >
> >
> https://github.com/raspberry-vanilla/android_local_manifest?tab=3Dreadme-=
ov-file
> <
> https://github.com/raspberry-vanilla/android_local_manifest?tab=3Dreadme-=
ov-file>
> <
> https://github.com/raspberry-vanilla/android_local_manifest?tab=3Dreadme-=
ov-file
> <
> https://github.com/raspberry-vanilla/android_local_manifest?tab=3Dreadme-=
ov-file
> >>
> >              >
> >              >         Can I do it ? Is it supposed to work the same ?
> >              >
> >              >         Thanks.
> >              >
> >              >         On Mon, Sep 2, 2024 at 10:23=E2=80=AFPM Pierrick=
 Bouvier
> >              >         <pierrick.bouvier@linaro.org
> >             <mailto:pierrick.bouvier@linaro.org>
> >              >         <mailto:pierrick.bouvier@linaro.org
> >             <mailto:pierrick.bouvier@linaro.org>>> wrote:
> >              >
> >              >
> >              >
> >              >             On 9/2/24 13:20, Pierrick Bouvier wrote:
> >              >              > On 9/2/24 12:53, Mario Marietto wrote:
> >              >              >> Hello Pierrick.
> >              >              >>
> >              >              >> With Cuttlefish can I emulate Android 14
> >             for arm64 ? I
> >              >             ask because in
> >              >              >> your script I read :
> >              >              >>
> >              >              >>
> >             "|/home/user/.work/qemu/build/qemu-system-x86_64", so,I
> >              >             suspect that you
> >              >              >> have emulated Android x64 bit,but I need
> >             arm64. |
> >              >              >>
> >              >              >
> >              >              > Yes, it works for both architecture. The
> >             only thing I
> >              >             didn't try is an
> >              >              > arm64 vm accelerated with kvm (I don't
> >             have this a
> >              >             linux-aarch64
> >              >              > machine), but it should work.
> >              >
> >              >             And of course, if you want to write a custom
> >             wrapper for
> >              >             qemu, name it
> >              >             qemu-system-aarch64, and call the same binar=
y
> >             instead of
> >              >             x86_64 variants.
> >              >
> >              >              >
> >              >              >> I also read "for aarch64 images: select
> >              >              >>
> >             |aosp_cf_arm64_only_phone-trunk_staging-userdebug" : I'm
> >              >             not able to
> >              >              >> download this kind of images. I don't
> >             understand how the
> >              >             Branch Grid
> >              >              >> works. Can you explain to me a little bi=
t
> >             more ?
> >              >              >> |
> >              >              >
> >              >              > You have a link just next to it ("Branch
> >             grid") on the
> >              >             wiki page.
> >              >              > Once on ci android page, click on filter
> >             button (three
> >              >             bars, inverted
> >              >              > pyramid), and select
> >              >
>  aosp_cf_arm64_only_phone-trunk_staging-userdebug.
> >              >              > Then go to artifacts, and download image
> and
> >              >             cvd_host_x86_64 package, as
> >              >              > wiki mentions.
> >              >              >
> >              >              > Don't hesitate to ask more questions on
> >             this. I imagine
> >              >             this topic might
> >              >              > interest some people who try to do the
> >             same thing.
> >              >              >
> >              >              > Pierrick
> >              >              >
> >              >              >> |
> >              >              >> |
> >              >              >>
> >              >              >>
> >              >              >> On Mon, Sep 2, 2024 at 8:47=E2=80=AFPM P=
ierrick
> >             Bouvier
> >              >              >> <pierrick.bouvier@linaro.org
> >             <mailto:pierrick.bouvier@linaro.org>
> >              >             <mailto:pierrick.bouvier@linaro.org
> >             <mailto:pierrick.bouvier@linaro.org>>
> >              >             <mailto:pierrick.bouvier@linaro.org
> >             <mailto:pierrick.bouvier@linaro.org>
> >              >             <mailto:pierrick.bouvier@linaro.org
> >             <mailto:pierrick.bouvier@linaro.org>>>> wrote:
> >              >              >>
> >              >              >>      Hello Mario,
> >              >              >>
> >              >              >>      very recently, I had to investigate
> >             booting time of
> >              >             Android when using
> >              >              >>      QEMU. You can probably manage to
> >             boot this with
> >              >             only QEMU alone, but in
> >              >              >>      my experience, using Cuttlefish
> >             tooling is an
> >              >             easier approach.
> >              >              >>
> >              >              >>      If you really want to use only QEMU=
,
> >             you can use
> >              >             Cuttlefish to get
> >              >              >>      exact
> >              >              >>      command line used (which disk goes
> >             where), and
> >              >             iterate from that.
> >              >              >>
> >              >              >>      Instructions:
> >              >              >>
> >              >
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
id+using+QEMU>>
> <
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
> >>>
> >              >              >>
> >              >              >>      As you'll see, I could not get a
> >             direct graphic
> >              >             output, but using
> >              >              >>      scrcpy, it worked well for me. Hope
> >             it can fit your
> >              >             use case.
> >              >              >>
> >              >              >>      Regards,
> >              >              >>      Pierrick
> >              >              >>
> >              >              >>      On 9/2/24 06:49, Mario Marietto
> wrote:
> >              >              >>       > Hello.
> >              >              >>       >
> >              >              >>       > I would like to emulate Android
> >             14 on my Ubuntu
> >              >             24.04 OS X64 bit
> >              >              >>      using
> >              >              >>       > qemu-system-aarch64. I tried
> >             using the following
> >              >             parameters :
> >              >              >>       >
> >              >              >>       > qemu-system-aarch64 \
> >              >              >>       >          -smp 4 \
> >              >              >>       >          -m 2048 \
> >              >              >>       >          -cpu cortex-a72 \
> >              >              >>       >          -M virt \
> >              >              >>       >          -device
> >             virtio-gpu-pci,xres=3D1024,yres=3D768 \
> >              >              >>       >          -display sdl,gl=3Don \
> >              >              >>       >          -device usb-ehci \
> >              >              >>       >          -device usb-kbd \
> >              >              >>       >          -device
> virtio-tablet-pci \
> >              >              >>       >          -usb \
> >              >              >>       >          -serial stdio \
> >              >              >>       >          -kernel
> >              >             /mnt/zroot-133/_OS/Android/rpi4/Image \
> >              >              >>       >          -initrd
> >              >             /mnt/zroot-133/_OS/Android/rpi4/ramdisk.img =
\
> >              >              >>       >          -drive
> >              >              >>       >
> >              >              >>
> >              >
> >
>  index=3D0,if=3Dnone,id=3Dsystem,file=3D/mnt/zroot-133/_OS/Android/rpi4/b=
oot.img \
> >              >              >>       >          -device
> >             virtio-blk-pci,drive=3Dboot \
> >              >              >>       >          -drive
> >              >              >>       >
> >              >              >>
> >              >
> >
>  index=3D1,if=3Dnone,id=3Dsystem,file=3D/mnt/zroot-133/_OS/Android/rpi4/s=
ystem.img \
> >              >              >>       >          -device
> >             virtio-blk-pci,drive=3Dsystem \
> >              >              >>       >          -drive
> >              >              >>       >
> >              >              >>
> >              >
> >
>  index=3D2,if=3Dnone,id=3Dvendor,file=3D/mnt/zroot-133/_OS/Android/rpi4/v=
endor.img \
> >              >              >>       >          -device
> >             virtio-blk-pci,drive=3Dvendor \
> >              >              >>       > -append "console=3DttyAMA0,38400
> >             drm.debug=3D0x0
> >              >             rootwait rootdelay=3D5
> >              >              >>       > root=3D/dev/mmcblk0p2
> >             androidboot.hardware=3Drpi4
> >              >              >>       > androidboot.selinux=3Dpermissive
> >             security=3Dselinux
> >              >             selinux=3D1
> >              >              >>       > androidboot.qemu.hw.mainkeys=3D0
> >              >             androidboot.lcd.density=3D160"
> >              >              >>       >
> >              >              >>       > The error I get in short is :
> >              >              >>       >
> >              >              >>       > [ 1.993668] init: bool
> >              >              >>       >
> >              >              >>
> >              >
> >
>  android::init::BlockDevInitializer::InitDevices(std::set<std::string>):
> >              >              >>       > partition(s) not found in /sys,
> >             waiting for
> >              >             their uevent(s):
> >              >              >>      mmcblk0p2,
> >              >              >>       > mmcblk0p3
> >              >              >>       >
> >              >              >>       >
> >              >              >>       > One user suggested to :
> >              >              >>       >
> >              >              >>       >
> >              >              >>       >
> >              >              >>       >
> >              >              >>       >
> >              >              >>       > Hi!!! The "/sys" is a "dynamic
> >             fs" created at
> >              >             ram from the
> >              >              >>      kernel, to
> >              >              >>       > export a lot of things...so most
> >             of the files
> >              >             only exist at runtime.
> >              >              >>       > Normally, the partitions from th=
e
> >             block device
> >              >             have a symlink at
> >              >              >>       > /sys/<something>/<...> that
> >             points to /dev/
> >              >             block node. It seems
> >              >              >>      that
> >              >              >>       > there are no such files under
> >             /sys according to
> >              >             what init is looking
> >              >              >>       > for. You can double check this a=
t
> >             init source
> >              >             code to check the
> >              >              >>      exact
> >              >              >>       > path but I'm guessing that you'l=
l
> >             have to change
> >              >             the qemu arguments
> >              >              >>       > regarding the block device.
> >              >              >>       >
> >              >              >>       > About userdata.img I think it's
> >             normal since in
> >              >             the old days, the
> >              >              >>      image
> >              >              >>       > was a "empty sparse image", that
> >             means, at the
> >              >             first flashing
> >              >              >>      process,
> >              >              >>       > there isn't userdata information=
,
> >             we're just
> >              >             "flashing the
> >              >              >>      partition"
> >              >              >>       > with empty data.
> >              >              >>       > Tks!!!
> >              >              >>       >
> >              >              >>       >
> >              >              >>       >
> >              >              >>       > So,in short I should change the
> >             qemu arguments
> >              >             regarding the block
> >              >              >>       > device. I tried in this way :
> >              >              >>       >
> >              >              >>       >
> >              >              >>       > qemu-system-aarch64 \
> >              >              >>       >          -smp 4 \
> >              >              >>       >          -m 2048 \
> >              >              >>       >          -cpu cortex-a72 \
> >              >              >>       >          -M virt \
> >              >              >>       >          -device
> >             virtio-gpu-pci,xres=3D1024,yres=3D768 \
> >              >              >>       >          -display sdl,gl=3Don \
> >              >              >>       >          -device usb-ehci \
> >              >              >>       >          -device usb-kbd \
> >              >              >>       >          -device
> virtio-tablet-pci \
> >              >              >>       >          -usb \
> >              >              >>       >          -serial stdio \
> >              >              >>       >          -kernel
> >              >             /mnt/zroot-133/_OS/Android/rpi4/Image \
> >              >              >>       >          -initrd
> >              >             /mnt/zroot-133/_OS/Android/rpi4/ramdisk.img =
\
> >              >              >>       >          -hda
> >              >             /mnt/zroot-133/_OS/Android/rpi4/boot.img \
> >              >              >>       >          -hdb
> >              >             /mnt/zroot-133/_OS/Android/rpi4/system.img \
> >              >              >>       >          -hdc
> >              >             /mnt/zroot-133/_OS/Android/rpi4/vendor.img \
> >              >              >>       >        -append
> "console=3DttyAMA0,38400
> >              >             drm.debug=3D0x0 rootwait
> >              >              >>      rootdelay=3D5
> >              >              >>       > root=3D/dev/mmcblk0p2
> >             androidboot.hardware=3Drpi4
> >              >              >>       > androidboot.selinux=3Dpermissive
> >             security=3Dselinux
> >              >             selinux=3D1
> >              >              >>       > androidboot.qemu.hw.mainkeys=3D0
> >              >             androidboot.lcd.density=3D160"
> >              >              >>       >
> >              >              >>       >
> >              >              >>       > but the error is still there. Do
> >             you know some
> >              >             different alternative
> >              >              >>       > block devices to try ? thanks.
> >              >              >>       >
> >              >              >>       >
> >              >              >>       > --
> >              >              >>       > Mario.
> >              >              >>
> >              >              >>
> >              >              >>
> >              >              >> --
> >              >              >> Mario.
> >              >
> >              >
> >              >
> >              >         --
> >              >         Mario.
> >              >
> >              >
> >              >
> >              >     --
> >              >     Mario.
> >              >
> >              >
> >              >
> >              > --
> >              > Mario.
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

--000000000000608a0206213a3c07
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdj5AUGllcnJpY2sgQm91dmllciA6PC9kaXY+PGRpdj7CoDxicj48
L2Rpdj48ZGl2Pi0tLSZndDsgSSYjMzk7bSByZWFsbHkgZ2xhZCB0byBzZWUgaXQgd29ya2VkISBB
cmUgeW91IGFscmVhZHkgcnVubmluZyB0aGUgcmFzcGJlcnJ5IGltYWdlLCBvciB2YW5pbGxhIEFP
U1AgPzwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+Tm8gYW5kIEkgZG9uJiMzOTt0IHRoaW5rIEkg
d2lsbC4gSSBoYXZlIGEgcHJvamVjdCB0aGF0IEkmIzM5O20gd29ya2luZyBvbiB0aGF0IGFpbXMg
dG8gZW11bGF0ZSBBbmRyb2lkIGZvciBBcm0gb24gTGludXggeDY0IGJpdC4gSSBrbmV3IHRoYXQg
aXQgd291bGQgYmUgc2xvdyxidXQgSSBkaWRuJiMzOTt0IHRoaW5rIGl0IHdvdWxkIGJlIHNvIG11
Y2guIFdoZW4gSSB1c2VkIEFWRCBhcyBhbiBlbXVsYXRvcixBbmRyb2lkIHdlbnQgZmFzdGVyLjwv
ZGl2PjxkaXY+PGgzIGNsYXNzPSJnbWFpbC1pdyBnbWFpbC1nRnhzdWQiPjxhIGNsYXNzPSJnbWFp
bF9wbHVzcmVwbHkiIGlkPSJwbHVzUmVwbHlDaGlwLTEiIGhyZWY9Im1haWx0bzpwZXRlci5tYXlk
ZWxsQGxpbmFyby5vcmciIHRhYmluZGV4PSItMSI+QFBldGVyIE1heWRlbGw8L2E+IDo8L2gzPjxo
MyBjbGFzcz0iZ21haWwtaXcgZ21haWwtZ0Z4c3VkIj48c3BhbiBjbGFzcz0iZ21haWwtcXUiIHJv
bGU9ImdyaWRjZWxsIiB0YWJpbmRleD0iLTEiPjxzcGFuIG5hbWU9IlBldGVyIE1heWRlbGwiIGNs
YXNzPSJnbWFpbC1nRCI+PHNwYW4+PC9zcGFuPjwvc3Bhbj48L3NwYW4+PC9oMz48aDMgY2xhc3M9
ImdtYWlsLWl3IGdtYWlsLWdGeHN1ZCI+PHNwYW4gY2xhc3M9ImdtYWlsLXF1IiByb2xlPSJncmlk
Y2VsbCIgdGFiaW5kZXg9Ii0xIj48c3BhbiBuYW1lPSJQZXRlciBNYXlkZWxsIiBjbGFzcz0iZ21h
aWwtZ0QiPjxzcGFuPjwvc3Bhbj48L3NwYW4+PC9zcGFuPjwvaDM+PC9kaXY+PGRpdj48L2Rpdj48
ZGl2PkkgdGhpbmsgdGhhdCBJJiMzOTt2ZSB1bmRlcnN0b29kIHRoZSByZWFzb24gd2h5IHNldmVy
YWwgeWVhcnMgYWdvIGl0IHdvcmtlZC4gUHJvYmFibHkgSSYjMzk7ZCB1c2VkIHRoaXMgc3BlY2lh
bCB2ZXJzaW9uIG9mIHFlbXUgOjxicj48L2Rpdj48ZGl2PjxoMyBjbGFzcz0iZ21haWwtaXcgZ21h
aWwtZ0Z4c3VkIj48c3BhbiBjbGFzcz0iZ21haWwtcXUiIHJvbGU9ImdyaWRjZWxsIiB0YWJpbmRl
eD0iLTEiPjxzcGFuIG5hbWU9IlBldGVyIE1heWRlbGwiIGNsYXNzPSJnbWFpbC1nRCI+PHNwYW4+
PC9zcGFuPjwvc3Bhbj48L3NwYW4+PC9oMz48L2Rpdj48ZGl2PjxhIGhyZWY9Imh0dHBzOi8vZ2l0
aHViLmNvbS9hbnRtaWNyby9rdm0tYW9zcC1xZW11L3JlbGVhc2VzL3RhZy81LjAuMC1rdm0tYW9z
cCI+aHR0cHM6Ly9naXRodWIuY29tL2FudG1pY3JvL2t2bS1hb3NwLXFlbXUvcmVsZWFzZXMvdGFn
LzUuMC4wLWt2bS1hb3NwPC9hPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SSYjMzk7bSBzdXJl
IHRoYXQgaXQgY29udGFpbnMgdGhlIG5lY2Vzc2FyeSBwYXRjaGVzIHRvIGJlIGFibGUgdG8gYm9v
dCBBbmRyb2lkIDEwIG9uIHRoZSBKZXRzb24gTmFuby7CoCA8YnI+PC9kaXY+PC9kaXY+PGJyPjxk
aXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+
T24gVHVlLCBTZXAgMywgMjAyNCBhdCA2OjMx4oCvUE0gUGllcnJpY2sgQm91dmllciAmbHQ7PGEg
aHJlZj0ibWFpbHRvOnBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZyI+cGllcnJpY2suYm91dmll
ckBsaW5hcm8ub3JnPC9hPiZndDsgd3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJn
bWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDox
cHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij5XaXRob3V0IGFuc3dl
cmluZyBzcGVjaWZpY2FsbHkgb24geW91ciBxdWVzdGlvbiwgaWYgeW91IHdhbnQgdG8gZXhjaGFu
Z2UgPGJyPg0KZmlsZXMgd2l0aCBhIGFuZHJvaWQgZ3Vlc3QsIHNpbXBseSB1c2UgYWRiIChwdXNo
L3B1bGwgY29tbWFuZHMpLiBJdCYjMzk7cyA8YnI+DQptdWNoIGJldHRlciBhbmQgZmFzdGVyIHRo
YW4gYW55IG90aGVyIHNvbHV0aW9uIHlvdSBjYW4gdHJ5LCBhbmQgPGJyPg0KY3V0dGxlZmlzaCB0
b29scyBhbHJlYWR5IHNldHVwIGFsbCB0aGUgYWRiIHN0dWZmIGZvciB5b3UuPGJyPg0KPGJyPg0K
WW91IGNhbiB1c2UgYWRiLXN5bmMgKDxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9qYjIxNzAv
YmV0dGVyLWFkYi1zeW5jIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczov
L2dpdGh1Yi5jb20vamIyMTcwL2JldHRlci1hZGItc3luYzwvYT4pIHRvIGhhdmUgPGJyPg0Kc29t
ZXRoaW5nIHNpbWlsYXIgdG8gcnN5bmMsIGluIGNhc2UgeW91IHdhbnQgdG8gc2VuZCBmaWxlcyBp
bmNyZW1lbnRhbGx5Ljxicj4NCjxicj4NClBpZXJyaWNrPGJyPg0KPGJyPg0KT24gOS8zLzI0IDA4
OjI0LCBNYXJpbyBNYXJpZXR0byB3cm90ZTo8YnI+DQomZ3Q7IEhlbGxvLjxicj4NCiZndDsgPGJy
Pg0KJmd0OyBBY3R1YWxseSBJJiMzOTttIHVzaW5nIG15IEpldHNvbiBOYW5vIGFuZCBJJiMzOTtt
IHRyeWluZyB0byBlbXVsYXRlIEFuZHJvaWQgMTAgPGJyPg0KJmd0OyBieSBhbnRtaWNyby4gSSYj
Mzk7bSB0cnlpbmcgdG8gdXNlIHRoZSBzYW1lIHBhcmFtZXRlcnMgdXNlZCBzZXZlcmFsIHllYXJz
IDxicj4NCiZndDsgYWdvLHdoZW4gaXQgd29ya2VkLiBXaGF0IEkgd2FudCB0byB0cnkgbm93IGlz
IHRvIGVuYWJsZSB2aXJ0aW8tYmxrLXBjaSA8YnI+DQomZ3Q7IG9uIHFlbXUuIFByb2JhYmx5IGlu
IGFkZGl0aW9uIHRvIHVzaW5nIHFlbXUgNS4wLEkgaGFkIGNvbmZpZ3VyZWQgcWVtdSA8YnI+DQom
Z3Q7IHdpdGggdmlydGlvLWJsay1wY2kgZW5hYmxlZCxiZWNhdXNlIEkgdXNlZCB0aGVzZSBwYXJh
bWV0ZXJzIGFuZCB0aGV5IDxicj4NCiZndDsgd29ya2VkIGdyZWF0IDo8YnI+DQomZ3Q7IDxicj4N
CiZndDsgLWRyaXZlIDxicj4NCiZndDsgaW5kZXg9MCxpZj1ub25lLGlkPXN5c3RlbSxmaWxlPS9o
b21lL2FyZXN1c2VyL0Rlc2t0b3AvYW50bWljcm8vYW9zcC1pbWcvc3lzdGVtLXJ3LmltZyBcPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgIMKgIC1kZXZpY2UgdmlydGlvLWJsay1wY2ksZHJpdmU9c3lzdGVt
IFw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgLWRyaXZlIDxicj4NCiZndDsgaW5kZXg9MSxpZj1u
b25lLGlkPXZlbmRvcixmaWxlPS9ob21lL2FyZXN1c2VyL0Rlc2t0b3AvYW50bWljcm8vYW9zcC1p
bWcvdmVuZG9yLXJ3LmltZyBcPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIC1kZXZpY2UgdmlydGlv
LWJsay1wY2ksZHJpdmU9dmVuZG9yIFw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgLWRyaXZlIDxi
cj4NCiZndDsgaW5kZXg9MixpZj1ub25lLGlkPXVzZXJkYXRhLGZpbGU9L2hvbWUvYXJlc3VzZXIv
RGVza3RvcC9hbnRtaWNyby9hb3NwLWltZy91c2VyZGF0YS5pbWcgXDxicj4NCiZndDvCoCDCoCDC
oCDCoCDCoCAtZGV2aWNlIHZpcnRpby1ibGstcGNpLGRyaXZlPXVzZXJkYXRhIFw8YnI+DQomZ3Q7
IDxicj4NCiZndDsgQ2FuIHNvbWVvbmUgdGVsbCBtZSBob3cgdG8gZW5hYmxlIHRoZSAmcXVvdDtW
aXJ0RlMgc3VwcG9ydCZxdW90OyBpbiBxZW11IDUuMCA/IDxicj4NCiZndDsgYmVjYXVzZSBhdCB0
aGUgbW9tZW50IGl0IGlzIGNvbmZpZ3VyZWQgdG8gJnF1b3Q7bm8mcXVvdDsgOjxicj4NCiZndDsg
PGJyPg0KJmd0OyByb290QGpldHNvbjovaG9tZS9hcmVzdXNlci9EZXNrdG9wL2FudG1pY3JvL3Fl
bXUtNS4wLjAjIC4vY29uZmlndXJlPGJyPg0KJmd0OyBJbnN0YWxsIHByZWZpeCDCoCDCoC91c3Iv
bG9jYWw8YnI+DQomZ3Q7IEJJT1MgZGlyZWN0b3J5IMKgIMKgL3Vzci9sb2NhbC9zaGFyZS9xZW11
PGJyPg0KJmd0OyBmaXJtd2FyZSBwYXRoIMKgIMKgIC91c3IvbG9jYWwvc2hhcmUvcWVtdS1maXJt
d2FyZTxicj4NCiZndDsgYmluYXJ5IGRpcmVjdG9yeSDCoC91c3IvbG9jYWwvYmluPGJyPg0KJmd0
OyBsaWJyYXJ5IGRpcmVjdG9yeSAvdXNyL2xvY2FsL2xpYjxicj4NCiZndDsgbW9kdWxlIGRpcmVj
dG9yeSDCoC91c3IvbG9jYWwvbGliL3FlbXU8YnI+DQomZ3Q7IGxpYmV4ZWMgZGlyZWN0b3J5IC91
c3IvbG9jYWwvbGliZXhlYzxicj4NCiZndDsgaW5jbHVkZSBkaXJlY3RvcnkgL3Vzci9sb2NhbC9p
bmNsdWRlPGJyPg0KJmd0OyBjb25maWcgZGlyZWN0b3J5IMKgL3Vzci9sb2NhbC9ldGM8YnI+DQom
Z3Q7IGxvY2FsIHN0YXRlIGRpcmVjdG9yeSDCoCAvdXNyL2xvY2FsL3Zhcjxicj4NCiZndDsgTWFu
dWFsIGRpcmVjdG9yeSDCoC91c3IvbG9jYWwvc2hhcmUvbWFuPGJyPg0KJmd0OyBFTEYgaW50ZXJw
IHByZWZpeCAvdXNyL2duZW11bC9xZW11LSVNPGJyPg0KJmd0OyBCdWlsZCBkaXJlY3RvcnkgwqAg
L2hvbWUvYXJlc3VzZXIvRGVza3RvcC9hbnRtaWNyby9xZW11LTUuMC4wPGJyPg0KJmd0OyBTb3Vy
Y2UgcGF0aCDCoCDCoCDCoCAvaG9tZS9hcmVzdXNlci9EZXNrdG9wL2FudG1pY3JvL3FlbXUtNS4w
LjA8YnI+DQomZ3Q7IEdJVCBiaW5hcnkgwqAgwqAgwqAgwqBnaXQ8YnI+DQomZ3Q7IEdJVCBzdWJt
b2R1bGVzPGJyPg0KJmd0OyBDIGNvbXBpbGVyIMKgIMKgIMKgIMKgY2M8YnI+DQomZ3Q7IEhvc3Qg
QyBjb21waWxlciDCoCBjYzxicj4NCiZndDsgQysrIGNvbXBpbGVyIMKgIMKgIMKgYysrPGJyPg0K
Jmd0OyBPYmplY3RpdmUtQyBjb21waWxlciBjbGFuZzxicj4NCiZndDsgQVJGTEFHUyDCoCDCoCDC
oCDCoCDCoCBydjxicj4NCiZndDsgQ0ZMQUdTIMKgIMKgIMKgIMKgIMKgIMKgLU8yIC1VX0ZPUlRJ
RllfU09VUkNFIC1EX0ZPUlRJRllfU09VUkNFPTIgLWc8YnI+DQomZ3Q7IFFFTVVfQ0ZMQUdTIMKg
IMKgIMKgIC1JL3Vzci9pbmNsdWRlL3BpeG1hbi0xIC1JJChTUkNfUEFUSCkvZHRjL2xpYmZkdCA8
YnI+DQomZ3Q7wqAgwqAtcHRocmVhZCAtSS91c3IvaW5jbHVkZS9nbGliLTIuMCA8YnI+DQomZ3Q7
IC1JL3Vzci9saWIvYWFyY2g2NC1saW51eC1nbnUvZ2xpYi0yLjAvaW5jbHVkZSAtZlBJRSAtRFBJ
RSDCoC1EX0dOVV9TT1VSQ0UgPGJyPg0KJmd0OyAtRF9GSUxFX09GRlNFVF9CSVRTPTY0IC1EX0xB
UkdFRklMRV9TT1VSQ0UgLVdzdHJpY3QtcHJvdG90eXBlcyA8YnI+DQomZ3Q7IC1XcmVkdW5kYW50
LWRlY2xzIC1XYWxsIC1XdW5kZWYgLVd3cml0ZS1zdHJpbmdzIC1XbWlzc2luZy1wcm90b3R5cGVz
IDxicj4NCiZndDsgLWZuby1zdHJpY3QtYWxpYXNpbmcgLWZuby1jb21tb24gLWZ3cmFwdiAtc3Rk
PWdudTk5IDxicj4NCiZndDvCoCDCoC1XZXhwYW5zaW9uLXRvLWRlZmluZWQgLVdlbmRpZi1sYWJl
bHMgLVduby1zaGlmdC1uZWdhdGl2ZS12YWx1ZSA8YnI+DQomZ3Q7IC1Xbm8tbWlzc2luZy1pbmNs
dWRlLWRpcnMgLVdlbXB0eS1ib2R5IC1XbmVzdGVkLWV4dGVybnMgPGJyPg0KJmd0OyAtV2Zvcm1h
dC1zZWN1cml0eSAtV2Zvcm1hdC15MmsgLVdpbml0LXNlbGYgLVdpZ25vcmVkLXF1YWxpZmllcnMg
PGJyPg0KJmd0OyAtV29sZC1zdHlsZS1kZWNsYXJhdGlvbiAtV29sZC1zdHlsZS1kZWZpbml0aW9u
IC1XdHlwZS1saW1pdHMgPGJyPg0KJmd0OyAtZnN0YWNrLXByb3RlY3Rvci1zdHJvbmcgwqAtSS91
c3IvaW5jbHVkZS9saWJwbmcxNiA8YnI+DQomZ3Q7wqAgwqAtSSQoU1JDX1BBVEgpL2NhcHN0b25l
L2luY2x1ZGU8YnI+DQomZ3Q7IFFFTVVfTERGTEFHUyDCoCDCoCDCoC1MJChCVUlMRF9ESVIpL2R0
Yy9saWJmZHQgLVdsLC16LHJlbHJvIC1XbCwteixub3cgLXBpZSA8YnI+DQomZ3Q7wqAgwqAtZnN0
YWNrLXByb3RlY3Rvci1zdHJvbmc8YnI+DQomZ3Q7IG1ha2UgwqAgwqAgwqAgwqAgwqAgwqAgwqBt
YWtlPGJyPg0KJmd0OyBpbnN0YWxsIMKgIMKgIMKgIMKgIMKgIGluc3RhbGw8YnI+DQomZ3Q7IHB5
dGhvbiDCoCDCoCDCoCDCoCDCoCDCoC91c3IvYmluL3B5dGhvbjMgLUIgKDMuMTAuMTIpPGJyPg0K
Jmd0OyBnZW5pc29pbWFnZSDCoCDCoCDCoCAvdXNyL2Jpbi9nZW5pc29pbWFnZTxicj4NCiZndDsg
c2xpcnAgc3VwcG9ydCDCoCDCoCBpbnRlcm5hbDxicj4NCiZndDsgc21iZCDCoCDCoCDCoCDCoCDC
oCDCoCDCoC91c3Ivc2Jpbi9zbWJkPGJyPg0KJmd0OyBtb2R1bGUgc3VwcG9ydCDCoCDCoG5vPGJy
Pg0KJmd0OyBhbHQgcGF0aCBtb2QgbG9hZCBubzxicj4NCiZndDsgaG9zdCBDUFUgwqAgwqAgwqAg
wqAgwqBhYXJjaDY0PGJyPg0KJmd0OyBob3N0IGJpZyBlbmRpYW4gwqAgbm88YnI+DQomZ3Q7IHRh
cmdldCBsaXN0IMKgIMKgIMKgIGFhcmNoNjQtc29mdG1tdSBhbHBoYS1zb2Z0bW11IGFybS1zb2Z0
bW11IGNyaXMtc29mdG1tdSA8YnI+DQomZ3Q7IGhwcGEtc29mdG1tdSBpMzg2LXNvZnRtbXUgbG0z
Mi1zb2Z0bW11IG02OGstc29mdG1tdSBtaWNyb2JsYXplLXNvZnRtbXUgPGJyPg0KJmd0OyBtaWNy
b2JsYXplZWwtc29mdG1tdSBtaXBzLXNvZnRtbXUgbWlwczY0LXNvZnRtbXUgbWlwczY0ZWwtc29m
dG1tdSA8YnI+DQomZ3Q7IG1pcHNlbC1zb2Z0bW11IG1veGllLXNvZnRtbXUgbmlvczItc29mdG1t
dSBvcjFrLXNvZnRtbXUgcHBjLXNvZnRtbXUgPGJyPg0KJmd0OyBwcGM2NC1zb2Z0bW11IHJpc2N2
MzItc29mdG1tdSByaXNjdjY0LXNvZnRtbXUgcngtc29mdG1tdSBzMzkweC1zb2Z0bW11IDxicj4N
CiZndDsgc2g0LXNvZnRtbXUgc2g0ZWItc29mdG1tdSBzcGFyYy1zb2Z0bW11IHNwYXJjNjQtc29m
dG1tdSB0cmljb3JlLXNvZnRtbXUgPGJyPg0KJmd0OyB1bmljb3JlMzItc29mdG1tdSB4ODZfNjQt
c29mdG1tdSB4dGVuc2Etc29mdG1tdSB4dGVuc2FlYi1zb2Z0bW11IDxicj4NCiZndDsgYWFyY2g2
NC1saW51eC11c2VyIGFhcmNoNjRfYmUtbGludXgtdXNlciBhbHBoYS1saW51eC11c2VyIGFybS1s
aW51eC11c2VyIDxicj4NCiZndDsgYXJtZWItbGludXgtdXNlciBjcmlzLWxpbnV4LXVzZXIgaHBw
YS1saW51eC11c2VyIGkzODYtbGludXgtdXNlciA8YnI+DQomZ3Q7IG02OGstbGludXgtdXNlciBt
aWNyb2JsYXplLWxpbnV4LXVzZXIgbWljcm9ibGF6ZWVsLWxpbnV4LXVzZXIgPGJyPg0KJmd0OyBt
aXBzLWxpbnV4LXVzZXIgbWlwczY0LWxpbnV4LXVzZXIgbWlwczY0ZWwtbGludXgtdXNlciBtaXBz
ZWwtbGludXgtdXNlciA8YnI+DQomZ3Q7IG1pcHNuMzItbGludXgtdXNlciBtaXBzbjMyZWwtbGlu
dXgtdXNlciBuaW9zMi1saW51eC11c2VyIG9yMWstbGludXgtdXNlciA8YnI+DQomZ3Q7IHBwYy1s
aW51eC11c2VyIHBwYzY0LWxpbnV4LXVzZXIgcHBjNjRhYmkzMi1saW51eC11c2VyIHBwYzY0bGUt
bGludXgtdXNlciA8YnI+DQomZ3Q7IHJpc2N2MzItbGludXgtdXNlciByaXNjdjY0LWxpbnV4LXVz
ZXIgczM5MHgtbGludXgtdXNlciBzaDQtbGludXgtdXNlciA8YnI+DQomZ3Q7IHNoNGViLWxpbnV4
LXVzZXIgc3BhcmMtbGludXgtdXNlciBzcGFyYzMycGx1cy1saW51eC11c2VyIDxicj4NCiZndDsg
c3BhcmM2NC1saW51eC11c2VyIHRpbGVneC1saW51eC11c2VyIHg4Nl82NC1saW51eC11c2VyIHh0
ZW5zYS1saW51eC11c2VyIDxicj4NCiZndDsgeHRlbnNhZWItbGludXgtdXNlcjxicj4NCiZndDsg
Z3Byb2YgZW5hYmxlZCDCoCDCoCBubzxicj4NCiZndDsgc3BhcnNlIGVuYWJsZWQgwqAgwqBubzxi
cj4NCiZndDsgc3RyaXAgYmluYXJpZXMgwqAgwqB5ZXM8YnI+DQomZ3Q7IHByb2ZpbGVyIMKgIMKg
IMKgIMKgIMKgbm88YnI+DQomZ3Q7IHN0YXRpYyBidWlsZCDCoCDCoCDCoG5vPGJyPg0KJmd0OyBT
REwgc3VwcG9ydCDCoCDCoCDCoCB5ZXMgKDIuMjYuMSk8YnI+DQomZ3Q7IFNETCBpbWFnZSBzdXBw
b3J0IG5vPGJyPg0KJmd0OyBHVEsgc3VwcG9ydCDCoCDCoCDCoCB5ZXMgKDMuMjQuMzMpPGJyPg0K
Jmd0OyBHVEsgR0wgc3VwcG9ydCDCoCDCoHllczxicj4NCiZndDsgVlRFIHN1cHBvcnQgwqAgwqAg
wqAgbm88YnI+DQomZ3Q7IFRMUyBwcmlvcml0eSDCoCDCoCDCoE5PUk1BTDxicj4NCiZndDsgR05V
VExTIHN1cHBvcnQgwqAgwqBubzxicj4NCiZndDsgbGliZ2NyeXB0IMKgIMKgIMKgIMKgIG5vPGJy
Pg0KJmd0OyBuZXR0bGUgwqAgwqAgwqAgwqAgwqAgwqBubzxicj4NCiZndDsgbGlidGFzbjEgwqAg
wqAgwqAgwqAgwqBubzxicj4NCiZndDsgUEFNIMKgIMKgIMKgIMKgIMKgIMKgIMKgIG5vPGJyPg0K
Jmd0OyBpY29udiBzdXBwb3J0IMKgIMKgIHllczxicj4NCiZndDsgY3Vyc2VzIHN1cHBvcnQgwqAg
wqB5ZXM8YnI+DQomZ3Q7IHZpcmdsIHN1cHBvcnQgwqAgwqAgbm88YnI+DQomZ3Q7IGN1cmwgc3Vw
cG9ydCDCoCDCoCDCoG5vPGJyPg0KJmd0OyBtaW5ndzMyIHN1cHBvcnQgwqAgbm88YnI+DQomZ3Q7
IEF1ZGlvIGRyaXZlcnMgwqAgwqAgcGEgb3NzPGJyPg0KJmd0OyBCbG9jayB3aGl0ZWxpc3QgKHJ3
KTxicj4NCiZndDsgQmxvY2sgd2hpdGVsaXN0IChybyk8YnI+DQomZ3Q7IDxicj4NCiZndDsgKlZp
cnRGUyBzdXBwb3J0IMKgIMKgbm8qPGJyPg0KJmd0OyA8YnI+DQomZ3Q7IE11bHRpcGF0aCBzdXBw
b3J0IG5vPGJyPg0KJmd0OyBWTkMgc3VwcG9ydCDCoCDCoCDCoCB5ZXM8YnI+DQomZ3Q7IFZOQyBT
QVNMIHN1cHBvcnQgwqBubzxicj4NCiZndDsgVk5DIEpQRUcgc3VwcG9ydCDCoHllczxicj4NCiZn
dDsgVk5DIFBORyBzdXBwb3J0IMKgIHllczxicj4NCiZndDsgeGVuIHN1cHBvcnQgwqAgwqAgwqAg
bm88YnI+DQomZ3Q7IGJybGFwaSBzdXBwb3J0IMKgIMKgbm88YnI+DQomZ3Q7IERvY3VtZW50YXRp
b24gwqAgwqAgbm88YnI+DQomZ3Q7IFBJRSDCoCDCoCDCoCDCoCDCoCDCoCDCoCB5ZXM8YnI+DQom
Z3Q7IHZkZSBzdXBwb3J0IMKgIMKgIMKgIG5vPGJyPg0KJmd0OyBuZXRtYXAgc3VwcG9ydCDCoCDC
oG5vPGJyPg0KJmd0OyBMaW51eCBBSU8gc3VwcG9ydCBubzxicj4NCiZndDsgTGludXggaW9fdXJp
bmcgc3VwcG9ydCBubzxicj4NCiZndDsgQVRUUi9YQVRUUiBzdXBwb3J0IHllczxicj4NCiZndDsg
SW5zdGFsbCBibG9icyDCoCDCoCB5ZXM8YnI+DQomZ3Q7IEtWTSBzdXBwb3J0IMKgIMKgIMKgIHll
czxicj4NCiZndDsgSEFYIHN1cHBvcnQgwqAgwqAgwqAgbm88YnI+DQomZ3Q7IEhWRiBzdXBwb3J0
IMKgIMKgIMKgIG5vPGJyPg0KJmd0OyBXSFBYIHN1cHBvcnQgwqAgwqAgwqBubzxicj4NCiZndDsg
VENHIHN1cHBvcnQgwqAgwqAgwqAgeWVzPGJyPg0KJmd0OyBUQ0cgZGVidWcgZW5hYmxlZCBubzxi
cj4NCiZndDsgVENHIGludGVycHJldGVyIMKgIG5vPGJyPg0KJmd0OyBtYWxsb2MgdHJpbSBzdXBw
b3J0IHllczxicj4NCiZndDsgUkRNQSBzdXBwb3J0IMKgIMKgIMKgbm88YnI+DQomZ3Q7IFBWUkRN
QSBzdXBwb3J0IMKgIMKgbm88YnI+DQomZ3Q7IGZkdCBzdXBwb3J0IMKgIMKgIMKgIGdpdDxicj4N
CiZndDsgbWVtYmFycmllciDCoCDCoCDCoCDCoG5vPGJyPg0KJmd0OyBwcmVhZHYgc3VwcG9ydCDC
oCDCoHllczxicj4NCiZndDsgZmRhdGFzeW5jIMKgIMKgIMKgIMKgIHllczxicj4NCiZndDsgbWFk
dmlzZSDCoCDCoCDCoCDCoCDCoCB5ZXM8YnI+DQomZ3Q7IHBvc2l4X21hZHZpc2UgwqAgwqAgeWVz
PGJyPg0KJmd0OyBwb3NpeF9tZW1hbGlnbiDCoCDCoHllczxicj4NCiZndDsgbGliY2FwLW5nIHN1
cHBvcnQgbm88YnI+DQomZ3Q7IHZob3N0LW5ldCBzdXBwb3J0IHllczxicj4NCiZndDsgdmhvc3Qt
Y3J5cHRvIHN1cHBvcnQgeWVzPGJyPg0KJmd0OyB2aG9zdC1zY3NpIHN1cHBvcnQgeWVzPGJyPg0K
Jmd0OyB2aG9zdC12c29jayBzdXBwb3J0IHllczxicj4NCiZndDsgdmhvc3QtdXNlciBzdXBwb3J0
IHllczxicj4NCiZndDsgdmhvc3QtdXNlci1mcyBzdXBwb3J0IHllczxicj4NCiZndDsgVHJhY2Ug
YmFja2VuZHMgwqAgwqBsb2c8YnI+DQomZ3Q7IHNwaWNlIHN1cHBvcnQgwqAgwqAgbm88YnI+DQom
Z3Q7IHJiZCBzdXBwb3J0IMKgIMKgIMKgIG5vPGJyPg0KJmd0OyB4ZnNjdGwgc3VwcG9ydCDCoCDC
oG5vPGJyPg0KJmd0OyBzbWFydGNhcmQgc3VwcG9ydCBubzxicj4NCiZndDsgbGlidXNiIMKgIMKg
IMKgIMKgIMKgIMKgbm88YnI+DQomZ3Q7IHVzYiBuZXQgcmVkaXIgwqAgwqAgbm88YnI+DQomZ3Q7
IE9wZW5HTCBzdXBwb3J0IMKgIMKgeWVzPGJyPg0KJmd0OyBPcGVuR0wgZG1hYnVmcyDCoCDCoHll
czxicj4NCiZndDsgbGliaXNjc2kgc3VwcG9ydCDCoG5vPGJyPg0KJmd0OyBsaWJuZnMgc3VwcG9y
dCDCoCDCoG5vPGJyPg0KJmd0OyBidWlsZCBndWVzdCBhZ2VudCB5ZXM8YnI+DQomZ3Q7IFFHQSBW
U1Mgc3VwcG9ydCDCoCBubzxicj4NCiZndDsgUUdBIHczMiBkaXNrIGluZm8gbm88YnI+DQomZ3Q7
IFFHQSBNU0kgc3VwcG9ydCDCoCBubzxicj4NCiZndDsgc2VjY29tcCBzdXBwb3J0IMKgIG5vPGJy
Pg0KJmd0OyBjb3JvdXRpbmUgYmFja2VuZCB1Y29udGV4dDxicj4NCiZndDsgY29yb3V0aW5lIHBv
b2wgwqAgwqB5ZXM8YnI+DQomZ3Q7IGRlYnVnIHN0YWNrIHVzYWdlIG5vPGJyPg0KJmd0OyBtdXRl
eCBkZWJ1Z2dpbmcgwqAgbm88YnI+DQomZ3Q7IGNyeXB0byBhZmFsZyDCoCDCoCDCoG5vPGJyPg0K
Jmd0OyBHbHVzdGVyRlMgc3VwcG9ydCBubzxicj4NCiZndDsgZ2NvdiDCoCDCoCDCoCDCoCDCoCDC
oCDCoGdjb3Y8YnI+DQomZ3Q7IGdjb3YgZW5hYmxlZCDCoCDCoCDCoG5vPGJyPg0KJmd0OyBUUE0g
c3VwcG9ydCDCoCDCoCDCoCB5ZXM8YnI+DQomZ3Q7IGxpYnNzaCBzdXBwb3J0IMKgIMKgbm88YnI+
DQomZ3Q7IFFPTSBkZWJ1Z2dpbmcgwqAgwqAgeWVzPGJyPg0KJmd0OyBMaXZlIGJsb2NrIG1pZ3Jh
dGlvbiB5ZXM8YnI+DQomZ3Q7IGx6byBzdXBwb3J0IMKgIMKgIMKgIG5vPGJyPg0KJmd0OyBzbmFw
cHkgc3VwcG9ydCDCoCDCoG5vPGJyPg0KJmd0OyBiemlwMiBzdXBwb3J0IMKgIMKgIG5vPGJyPg0K
Jmd0OyBsemZzZSBzdXBwb3J0IMKgIMKgIG5vPGJyPg0KJmd0OyB6c3RkIHN1cHBvcnQgwqAgwqAg
wqBubzxicj4NCiZndDsgTlVNQSBob3N0IHN1cHBvcnQgeWVzPGJyPg0KJmd0OyBsaWJ4bWwyIMKg
IMKgIMKgIMKgIMKgIHllczxicj4NCiZndDsgdGNtYWxsb2Mgc3VwcG9ydCDCoG5vPGJyPg0KJmd0
OyBqZW1hbGxvYyBzdXBwb3J0IMKgbm88YnI+DQomZ3Q7IGF2eDIgb3B0aW1pemF0aW9uPGJyPg0K
Jmd0OyBhdng1MTJmIG9wdGltaXphdGlvbiBubzxicj4NCiZndDsgcmVwbGljYXRpb24gc3VwcG9y
dCB5ZXM8YnI+DQomZ3Q7IFZ4SFMgYmxvY2sgZGV2aWNlIG5vPGJyPg0KJmd0OyBib2NocyBzdXBw
b3J0IMKgIMKgIHllczxicj4NCiZndDsgY2xvb3Agc3VwcG9ydCDCoCDCoCB5ZXM8YnI+DQomZ3Q7
IGRtZyBzdXBwb3J0IMKgIMKgIMKgIHllczxicj4NCiZndDsgcWNvdyB2MSBzdXBwb3J0IMKgIHll
czxicj4NCiZndDsgdmRpIHN1cHBvcnQgwqAgwqAgwqAgeWVzPGJyPg0KJmd0OyB2dmZhdCBzdXBw
b3J0IMKgIMKgIHllczxicj4NCiZndDsgcWVkIHN1cHBvcnQgwqAgwqAgwqAgeWVzPGJyPg0KJmd0
OyBwYXJhbGxlbHMgc3VwcG9ydCB5ZXM8YnI+DQomZ3Q7IHNoZWVwZG9nIHN1cHBvcnQgwqB5ZXM8
YnI+DQomZ3Q7IGNhcHN0b25lIMKgIMKgIMKgIMKgIMKgaW50ZXJuYWw8YnI+DQomZ3Q7IGxpYnBt
ZW0gc3VwcG9ydCDCoCBubzxicj4NCiZndDsgbGlidWRldiDCoCDCoCDCoCDCoCDCoCB5ZXM8YnI+
DQomZ3Q7IGRlZmF1bHQgZGV2aWNlcyDCoCB5ZXM8YnI+DQomZ3Q7IHBsdWdpbiBzdXBwb3J0IMKg
IMKgbm88YnI+DQomZ3Q7IGZ1enppbmcgc3VwcG9ydCDCoCBubzxicj4NCiZndDsgZ2RiIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIC91c3IvYmluL2dkYjxicj4NCiZndDsgY3Jvc3MgY29udGFpbmVycyDC
oGRvY2tlcjxicj4NCiZndDsgPGJyPg0KJmd0OyBUaGFua3MuPGJyPg0KJmd0OyA8YnI+DQomZ3Q7
IE9uIFR1ZSwgU2VwIDMsIDIwMjQgYXQgMTA6NTXigK9BTSBNYXJpbyBNYXJpZXR0byAmbHQ7PGEg
aHJlZj0ibWFpbHRvOm1hcmlldHRvMjAwOEBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5tYXJp
ZXR0bzIwMDhAZ21haWwuY29tPC9hPiA8YnI+DQomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFp
bHRvOm1hcmlldHRvMjAwOEBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5tYXJpZXR0bzIwMDhA
Z21haWwuY29tPC9hPiZndDsmZ3Q7IHdyb3RlOjxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKg
RmluYWxseSBpdCB3b3JrZWQgOjxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgSXN0YW50YW5l
YV8yMDI0LTA5LTAzXzEwLTUxLTM1LmpwZzxicj4NCiZndDvCoCDCoCDCoFZlcnkgdGhhbmtzIG1h
bi4gSW4gYW55IGNhc2UgaXQgaXMgVkVSWSBzbG93IGFuZCBub3QgdXNhYmxlIGF0IGFsbC48YnI+
DQomZ3Q7wqAgwqAgwqBJcyB0aGVyZSBzb21ldGhpbmcgdGhhdCBJIGNhbiBkbyB0byBpbXByb3Zl
IGl0cyBzcGVlZCA/PGJyPg0KJmd0OyA8YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDCoE9uIFR1
ZSwgU2VwIDMsIDIwMjQgYXQgMTA6MzPigK9BTSBNYXJpbyBNYXJpZXR0bzxicj4NCiZndDvCoCDC
oCDCoCZsdDs8YSBocmVmPSJtYWlsdG86bWFyaWV0dG8yMDA4QGdtYWlsLmNvbSIgdGFyZ2V0PSJf
YmxhbmsiPm1hcmlldHRvMjAwOEBnbWFpbC5jb208L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFp
bHRvOm1hcmlldHRvMjAwOEBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5tYXJpZXR0bzIwMDhA
Z21haWwuY29tPC9hPiZndDsmZ3Q7IHdyb3RlOjxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKg
IMKgIMKgemlvbWFyaW9AWjM5MC1BT1JVUy1QUk8tREVTVDovbW50L3pyb290LTEzMy9fT1MvQW5k
cm9pZC9hb3NwXzE0L2FuZHJvaWQtaW1hZ2UkIEhPTUU9JChwd2QpIC4vYmluL2xhdW5jaF9jdmQg
LXZtX21hbmFnZXIgcWVtdV9jbGkgLXJlcG9ydF9hbm9ueW1vdXNfdXNhZ2Vfc3RhdHM9biAtLXN0
YXJ0X3dlYnJ0Yz1mYWxzZTxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgMDktMDMg
MTA6MDQ6NDQuMjA2IDI3ODYzODYgMjc4NjM4NiBJIGxhdW5jaF9jdmQ6IG1haW4uY2M6MjM1PGJy
Pg0KJmd0O8KgIMKgIMKgIMKgIMKgVXNpbmcgc3lzdGVtX2ltYWdlX2RpciBvZjo8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAgwqA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgTk9USUNFOjxi
cj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgQnkgdXNpbmcgdGhpcyBBbmRyb2lkIFZp
cnR1YWwgRGV2aWNlLCB5b3UgYWdyZWUgdG88YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBHb29nbGUg
VGVybXMgb2YgU2VydmljZSAoPGEgaHJlZj0iaHR0cHM6Ly9wb2xpY2llcy5nb29nbGUuY29tL3Rl
cm1zIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL3BvbGljaWVzLmdv
b2dsZS5jb20vdGVybXM8L2E+PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0
dHBzOi8vcG9saWNpZXMuZ29vZ2xlLmNvbS90ZXJtcyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9
Il9ibGFuayI+aHR0cHM6Ly9wb2xpY2llcy5nb29nbGUuY29tL3Rlcm1zPC9hPiZndDspLjxicj4N
CiZndDvCoCDCoCDCoCDCoCDCoFRoZSBHb29nbGUgUHJpdmFjeSBQb2xpY3kgKDxhIGhyZWY9Imh0
dHBzOi8vcG9saWNpZXMuZ29vZ2xlLmNvbS9wcml2YWN5IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdl
dD0iX2JsYW5rIj5odHRwczovL3BvbGljaWVzLmdvb2dsZS5jb20vcHJpdmFjeTwvYT48YnI+DQom
Z3Q7wqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9wb2xpY2llcy5nb29nbGUuY29t
L3ByaXZhY3kiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vcG9saWNp
ZXMuZ29vZ2xlLmNvbS9wcml2YWN5PC9hPiZndDspPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgZGVz
Y3JpYmVzIGhvdyBHb29nbGUgaGFuZGxlcyBpbmZvcm1hdGlvbiBnZW5lcmF0ZWQgYXMgeW91IHVz
ZTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoEdvb2dsZSBTZXJ2aWNlcy48YnI+DQomZ3Q7wqAgwqAg
wqAgwqAgwqA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBSZWFk
aW5nIC0tY29uZmlnIG9wdGlvbiBmcm9tOjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoC9tbnQvenJv
b3QtMTMzL19PUy9BbmRyb2lkL2Fvc3BfMTQvYW5kcm9pZC1pbWFnZS9hbmRyb2lkLWluZm8udHh0
PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgTGF1bmNoaW5nIENWRCB1c2luZyAtLWNvbmZpZz0mIzM5
O3Bob25lJiMzOTsuPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgR1BVIGF1dG8gbW9kZTogZGV0ZWN0
ZWQgcHJlcmVxdWlzaXRlcyBmb3IgYWNjZWxlcmF0ZWQgcmVuZGVyaW5nPGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgc3VwcG9ydC48YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBFbmFibGluZyAtLWdwdV9t
b2RlPWdmeHN0cmVhbS48YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBHUFUgdmhvc3QgdXNlciBhdXRv
IG1vZGU6IG5vdCB5ZXQgc3VwcG9ydGVkIHdpdGggcWVtdV9jbGkuIE5vdDxicj4NCiZndDvCoCDC
oCDCoCDCoCDCoGVuYWJsaW5nIHZob3N0IHVzZXIgZ3B1Ljxicj4NCiZndDvCoCDCoCDCoCDCoCDC
oFJlcXVlc3RlZCByZXN1bWluZyBhIHByZXZpb3VzIHNlc3Npb24gKHRoZSBkZWZhdWx0IGJlaGF2
aW9yKSBidXQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqB0aGUgYmFzZSBpbWFnZXMgaGF2ZSBjaGFu
Z2VkIHVuZGVyIHRoZSBvdmVybGF5LCBtYWtpbmcgdGhlPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
b3ZlcmxheSBpbmNvbXBhdGlibGUuIFdpcGluZyB0aGUgb3ZlcmxheSBmaWxlcy48YnI+DQomZ3Q7
wqAgwqAgwqAgwqAgwqBQYXRoIGZvciBpbnN0YW5jZSBVRFM6IC90bXAvY2ZfYXZkXzEwMDA8YnI+
DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoFRoZSBmb2xsb3dpbmcgbGluZXMgY29udGFp
biB1c2VmdWwgZGVidWdnaW5nIGluZm9ybWF0aW9uOjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDC
oFNlcmlhbCBjb25zb2xlIGlzIGRpc2FibGVkOyB1c2UgLWNvbnNvbGU9dHJ1ZSB0byBlbmFibGUg
aXQuPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgTG9nY2F0IG91dHB1dDo8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAgwqAvbW50L3pyb290LTEzMy9fT1MvQW5kcm9pZC9hb3NwXzE0L2FuZHJvaWQtaW1h
Z2UvY3V0dGxlZmlzaC9pbnN0YW5jZXMvY3ZkLTEvbG9ncy9sb2djYXQ8YnI+DQomZ3Q7IDxicj4N
CiZndDvCoCDCoCDCoCDCoCDCoCDCoEtlcm5lbCBsb2c6PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
L21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQvYW9zcF8xNC9hbmRyb2lkLWltYWdlL2N1dHRsZWZp
c2gvaW5zdGFuY2VzL2N2ZC0xL2tlcm5lbC5sb2c8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqBM
YXVuY2hlciBsb2c6PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgL21udC96cm9vdC0xMzMvX09TL0Fu
ZHJvaWQvYW9zcF8xNC9hbmRyb2lkLWltYWdlL2N1dHRsZWZpc2gvaW5zdGFuY2VzL2N2ZC0xL2xv
Z3MvbGF1bmNoZXIubG9nPGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqBJbnN0
YW5jZSBjb25maWd1cmF0aW9uOjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoC9tbnQvenJvb3QtMTMz
L19PUy9BbmRyb2lkL2Fvc3BfMTQvYW5kcm9pZC1pbWFnZS9jdXR0bGVmaXNoL2luc3RhbmNlcy9j
dmQtMS9jdXR0bGVmaXNoX2NvbmZpZy5qc29uPGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAgwqAgwqBMYXVuY2hlciBCdWlsZCBJRDogMTIzMDkyOTY8YnI+DQomZ3Q7IDxicj4NCiZndDvC
oCDCoCDCoCDCoCDCoC9tbnQvenJvb3QtMTMzL19PUy9BbmRyb2lkL2Fvc3BfMTQvYW5kcm9pZC1p
bWFnZS9iaW4vbW9kZW1fc2ltdWxhdG9yPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgL21udC96cm9v
dC0xMzMvX09TL0FuZHJvaWQvYW9zcF8xNC9hbmRyb2lkLWltYWdlL2Jpbi90b21ic3RvbmVfcmVj
ZWl2ZXI8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAvbW50L3pyb290LTEzMy9fT1MvQW5kcm9pZC9h
b3NwXzE0L2FuZHJvaWQtaW1hZ2UvYmluL2xvZ190ZWU8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAv
bW50L3pyb290LTEzMy9fT1MvQW5kcm9pZC9hb3NwXzE0L2FuZHJvaWQtaW1hZ2UvYmluL3dtZWRp
dW1kPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgL21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQvYW9z
cF8xNC9hbmRyb2lkLWltYWdlL2Jpbi9jYXNpbWlyX2NvbnRyb2xfc2VydmVyPGJyPg0KJmd0O8Kg
IMKgIMKgIMKgIMKgL21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQvYW9zcF8xNC9hbmRyb2lkLWlt
YWdlL2Jpbi9zY3JlZW5fcmVjb3JkaW5nX3NlcnZlcjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoC9t
bnQvenJvb3QtMTMzL19PUy9BbmRyb2lkL2Fvc3BfMTQvYW5kcm9pZC1pbWFnZS9iaW4vYWRiX2Nv
bm5lY3Rvcjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoC9tbnQvenJvb3QtMTMzL19PUy9BbmRyb2lk
L2Fvc3BfMTQvYW5kcm9pZC1pbWFnZS9iaW4vc29ja2V0X3Zzb2NrX3Byb3h5PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgIMKgL21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQvYW9zcF8xNC9hbmRyb2lkLWlt
YWdlL2Jpbi9zb2NrZXRfdnNvY2tfcHJveHk8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAvbW50L3py
b290LTEzMy9fT1MvQW5kcm9pZC9hb3NwXzE0L2FuZHJvaWQtaW1hZ2UvYmluL3RjcF9jb25uZWN0
b3I8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAvbW50L3pyb290LTEzMy9fT1MvQW5kcm9pZC9hb3Nw
XzE0L2FuZHJvaWQtaW1hZ2UvYmluL2NvbnRyb2xfZW52X3Byb3h5X3NlcnZlcjxicj4NCiZndDvC
oCDCoCDCoCDCoCDCoC9tbnQvenJvb3QtMTMzL19PUy9BbmRyb2lkL2Fvc3BfMTQvYW5kcm9pZC1p
bWFnZS9iaW4vZWNob19zZXJ2ZXI8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBTdGFydCBtb2RlbSBz
aW11bGF0b3IsIHNlcnZlcl9mZHM6IDU4LCBTaW0gdHlwZTogbm9ybWFsPGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgL21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQvYW9zcF8xNC9hbmRyb2lkLWltYWdl
L2Jpbi9nbnNzX2dycGNfcHJveHk8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAvbW50L3pyb290LTEz
My9fT1MvQW5kcm9pZC9hb3NwXzE0L2FuZHJvaWQtaW1hZ2UvYmluL2xvZ2NhdF9yZWNlaXZlcjxi
cj4NCiZndDvCoCDCoCDCoCDCoCDCoC9tbnQvenJvb3QtMTMzL19PUy9BbmRyb2lkL2Fvc3BfMTQv
YW5kcm9pZC1pbWFnZS9iaW4va2VybmVsX2xvZ19tb25pdG9yPGJyPg0KJmd0O8KgIMKgIMKgIMKg
IMKgL21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQvYW9zcF8xNC9hbmRyb2lkLWltYWdlL2Jpbi9v
cGVud3J0X2NvbnRyb2xfc2VydmVyPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgL21udC96cm9vdC0x
MzMvX09TL0FuZHJvaWQvYW9zcF8xNC9hbmRyb2lkLWltYWdlL2Jpbi9sb2dfdGVlPGJyPg0KJmd0
O8KgIMKgIMKgIMKgIMKgL21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQvYW9zcF8xNC9hbmRyb2lk
LWltYWdlL2Jpbi9wcm9jZXNzX3Jlc3RhcnRlcjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoC9tbnQv
enJvb3QtMTMzL19PUy9BbmRyb2lkL2Fvc3BfMTQvYW5kcm9pZC1pbWFnZS9iaW4vbmV0c2ltZDxi
cj4NCiZndDvCoCDCoCDCoCDCoCDCoC9tbnQvenJvb3QtMTMzL19PUy9BbmRyb2lkL2Fvc3BfMTQv
YW5kcm9pZC1pbWFnZS9iaW4vc29ja2V0X3Zzb2NrX3Byb3h5PGJyPg0KJmd0OyA8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAgwqBGYWlsZWQgdG8gb3BlbiBzb2NrZXQ6IENvbm5lY3Rpb24gcmVmdXNlZDxi
cj4NCiZndDsgPGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAvbW50L3pyb290LTEz
My9fT1MvQW5kcm9pZC9hb3NwXzE0L2FuZHJvaWQtaW1hZ2UvYmluL3NvY2tldF92c29ja19wcm94
eTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoC9tbnQvenJvb3QtMTMzL19PUy9BbmRyb2lkL2Fvc3Bf
MTQvYW5kcm9pZC1pbWFnZS9iaW4vc2VjdXJlX2Vudjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoC9t
bnQvenJvb3QtMTMzL19PUy9BbmRyb2lkL2Fvc3BfMTQvYW5kcm9pZC1pbWFnZS9iaW4veDg2XzY0
LWxpbnV4LWdudS9xZW11L3FlbXUtc3lzdGVtLWFhcmNoNjQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAg
wqBTZXJ2ZXIgbGlzdGVuaW5nIG9uPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgdW5peDovdG1wL2Nm
X2F2ZF8xMDAwL2N2ZC0xL2dycGNfc29ja2V0L0Nhc2ltaXJDb250cm9sU2VydmVyLnNvY2s8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqBTZXJ2ZXIgbGlzdGVuaW5nIG9uPGJyPg0KJmd0O8KgIMKgIMKg
IMKgIMKgdW5peDovdG1wL2NmX2F2ZF8xMDAwL2N2ZC0xL2dycGNfc29ja2V0L0VjaG9TZXJ2ZXIu
c29jazxicj4NCiZndDvCoCDCoCDCoCDCoCDCoFNlcnZlciBsaXN0ZW5pbmcgb248YnI+DQomZ3Q7
wqAgwqAgwqAgwqAgwqB1bml4Oi90bXAvY2ZfYXZkXzEwMDAvY3ZkLTEvZ3JwY19zb2NrZXQvT3Bl
bndydENvbnRyb2xTZXJ2ZXIuc29jazxicj4NCiZndDvCoCDCoCDCoCDCoCDCoHJvb3QtY2FuYWwg
SSAwOS0wMyAxMDowNjoxMy4yMTkgZGV2aWNlX2JvdXRpcXVlLmNjOjM3PGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgUmVnaXN0ZXJpbmcgYmVhY29uPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgcm9vdC1j
YW5hbCBJIDA5LTAzIDEwOjA2OjEzLjIxOSBkZXZpY2VfYm91dGlxdWUuY2M6Mzc8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAgwqBSZWdpc3RlcmluZyBiZWFjb25fc3dhcm08YnI+DQomZ3Q7wqAgwqAgwqAg
wqAgwqByb290LWNhbmFsIEkgMDktMDMgMTA6MDY6MTMuMjE5IGRldmljZV9ib3V0aXF1ZS5jYzoz
Nzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoFJlZ2lzdGVyaW5nIHNjcmlwdGVkX2JlYWNvbjxicj4N
CiZndDvCoCDCoCDCoCDCoCDCoHJvb3QtY2FuYWwgSSAwOS0wMyAxMDowNjoxMy4yMTkgZGV2aWNl
X2JvdXRpcXVlLmNjOjM3PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgUmVnaXN0ZXJpbmcgc25pZmZl
cjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoFNlcnZlciBsaXN0ZW5pbmcgb248YnI+DQomZ3Q7wqAg
wqAgwqAgwqAgwqB1bml4Oi90bXAvY2ZfYXZkXzEwMDAvY3ZkLTEvZ3JwY19zb2NrZXQvQ29udHJv
bEVudlByb3h5U2VydmVyLnNvY2s8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBuZXRzaW1kIEkgMDkt
MDMgMDg6MDY6MTMuMjIxIDxhIGhyZWY9Imh0dHA6Ly9ydXN0X21haW4ucnM6OTgiIHJlbD0ibm9y
ZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPnJ1c3RfbWFpbi5yczo5ODwvYT48YnI+DQomZ3Q7wqAg
wqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL3J1c3RfbWFpbi5yczo5OCIgcmVsPSJub3Jl
ZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL3J1c3RfbWFpbi5yczo5ODwvYT4mZ3Q7IC0g
bmV0c2ltIGFydGlmYWN0cyBwYXRoOjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCZxdW90Oy90bXAv
YW5kcm9pZC16aW9tYXJpby9uZXRzaW1kJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgbmV0
c2ltZCBJIDA5LTAzIDA4OjA2OjEzLjIyMSA8YSBocmVmPSJodHRwOi8vcnVzdF9tYWluLnJzOjEw
MSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+cnVzdF9tYWluLnJzOjEwMTwvYT48
YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL3J1c3RfbWFpbi5yczox
MDEiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9ydXN0X21haW4ucnM6
MTAxPC9hPiZndDsgLSBOZXRzaW1kQXJncyB7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgwqDC
oGZkX3N0YXJ0dXBfc3RyOiBTb21lKDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoMKgwqDCoMKg
wqDCoCZxdW90O3tcJnF1b3Q7ZGV2aWNlc1wmcXVvdDs6W3tcJnF1b3Q7bmFtZVwmcXVvdDs6XCZx
dW90OzxhIGhyZWY9Imh0dHA6Ly8wLjAuMC4wOjY1MjAiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0
PSJfYmxhbmsiPjAuMC4wLjA6NjUyMDwvYT48YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAmbHQ7PGEg
aHJlZj0iaHR0cDovLzAuMC4wLjA6NjUyMCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFu
ayI+aHR0cDovLzAuMC4wLjA6NjUyMDwvYT4mZ3Q7XCZxdW90OyxcJnF1b3Q7Y2hpcHNcJnF1b3Q7
Olt7XCZxdW90O2tpbmRcJnF1b3Q7OlwmcXVvdDtCTFVFVE9PVEhcJnF1b3Q7LFwmcXVvdDtmZElu
XCZxdW90Ozo4MSxcJnF1b3Q7ZmRPdXRcJnF1b3Q7OjgyfSx7XCZxdW90O2tpbmRcJnF1b3Q7Olwm
cXVvdDtVV0JcJnF1b3Q7LFwmcXVvdDtmZEluPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgXCZxdW90
Ozo4MyxcJnF1b3Q7ZmRPdXRcJnF1b3Q7Ojg0fV19XX0mcXVvdDssPGJyPg0KJmd0O8KgIMKgIMKg
IMKgIMKgIMKgwqDCoCksPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgwqDCoG5vX2NsaV91aTog
ZmFsc2UsPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgwqDCoG5vX3dlYl91aTogZmFsc2UsPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgwqDCoHBjYXA6IGZhbHNlLDxicj4NCiZndDvCoCDCoCDC
oCDCoCDCoCDCoMKgwqBkaXNhYmxlX2FkZHJlc3NfcmV1c2U6IGZhbHNlLDxicj4NCiZndDvCoCDC
oCDCoCDCoCDCoCDCoMKgwqBoY2lfcG9ydDogU29tZSg8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAg
wqDCoMKgwqDCoMKgwqA3MzAwLDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoMKgwqApLDxicj4N
CiZndDvCoCDCoCDCoCDCoCDCoCDCoMKgwqBjb25uZWN0b3JfaW5zdGFuY2U6IE5vbmUsPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgwqDCoGluc3RhbmNlOiBTb21lKDxicj4NCiZndDvCoCDCoCDC
oCDCoCDCoCDCoMKgwqDCoMKgwqDCoDEsPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgwqDCoCks
PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgwqDCoGxvZ3Rvc3RkZXJyOiBmYWxzZSw8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAgwqAgwqDCoMKgZGV2OiBmYWxzZSw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAg
wqAgwqDCoMKgcnVzdF9ncnBjOiBmYWxzZSw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqDCoMKg
cnVzdF9ob3N0YXBkOiBmYWxzZSw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqDCoMKgcnVzdF9z
bGlycDogdHJ1ZSw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqDCoMKgdnNvY2s6IE5vbmUsPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgwqDCoGNvbmZpZzogTm9uZSw8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAgwqAgwqDCoMKgaG9zdF9kbnM6IE5vbmUsPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKg
wqDCoGh0dHBfcHJveHk6IE5vbmUsPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgwqDCoHdpZmlf
dGFwOiBOb25lLDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoMKgwqB0ZXN0X2JlYWNvbnM6IGZh
bHNlLDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoMKgwqBub190ZXN0X2JlYWNvbnM6IGZhbHNl
LDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoMKgwqBub19zaHV0ZG93bjogZmFsc2UsPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgwqDCoHZlcmJvc2U6IGZhbHNlLDxicj4NCiZndDvCoCDCoCDC
oCDCoCDCoCDCoMKgwqB2ZXJzaW9uOiBmYWxzZSw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqB9PGJy
Pg0KJmd0O8KgIMKgIMKgIMKgIMKgU2l6ZSBvZiBPQkpFQ1QgPSAxMjA0PGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgU2l6ZSBvZiBjb21wb25lbnRzIGluIFRQTVRfU0VOU0lUSVZFID0gNzQ0PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgwqDCoFRQTUlfQUxHX1BVQkxJQyDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoDI8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqDCoMKgVFBNMkJfQVVU
SCDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqA1MDxicj4NCiZndDvC
oCDCoCDCoCDCoCDCoCDCoMKgwqBUUE0yQl9ESUdFU1QgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqA1MDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoMKgwqBUUE1VX1NFTlNJ
VElWRV9DT01QT1NJVEUgwqDCoMKgwqDCoMKgwqA2NDI8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBN
QVhfQ09OVEVYVF9TSVpFIGNhbiBiZSByZWR1Y2VkIHRvIDEyNjQgKDEzNDQpPGJyPg0KJmd0O8Kg
IMKgIMKgIMKgIMKgc2l6ZSA6IDM2MDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoHN0YXJ0aW5nIFJ1
c3QgS2V5TWludCBUQSBpbXBsZW1lbnRhdGlvbiBpbiBhIHRocmVhZDxicj4NCiZndDvCoCDCoCDC
oCDCoCDCoHN0YXJ0aW5nIEMrKyBLZXlNaW50IGltcGxlbWVudGF0aW9uIGluIGEgdGhyZWFkIHdp
dGggRkRzIGluPTMxLDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoG91dD0zMDxicj4NCiZndDvCoCDC
oCDCoCDCoCDCoEtleU1pbnQgUnVzdCBUQSBydW5uaW5nIHdpdGggaW5maWxlPTM3LCBvdXRmaWxl
PTM2LDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoHNlY3VyaXR5X2xldmVsPVNvZnR3YXJlPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgTm8gc2VjdXJlIGRlbGV0aW9uIGRhdGEgZmlsZSBmb3VuZC4gQ3Jl
YXRpbmcgb25lLjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoEkwOTAzIDEwOjA2OjEzLjI0OTQxOCAy
Nzg2NzI0IFNoYXJlZExpYnJhcnkuY3BwOjY0XTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoFNoYXJl
ZExpYnJhcnk6Om9wZW4gZm9yIFtsaWJ2dWxrYW4uc29dPGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAgwqBJMDkwMyAxMDowNjoxMy4yNDk1MDcgMjc4NjcyNCBTaGFyZWRMaWJyYXJ5LmNw
cDo3Nl08YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBTaGFyZWRMaWJyYXJ5OjpvcGVuIGZvciBbbGli
dnVsa2FuLnNvXTogbm90IGZvdW5kIGluIG1hcCwgb3Blbjxicj4NCiZndDvCoCDCoCDCoCDCoCDC
oGZvciB0aGUgZmlyc3QgdGltZTxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgSTA5
MDMgMTA6MDY6MTMuMjQ5NTExIDI3ODY3MjQgU2hhcmVkTGlicmFyeS5jcHA6MTg2XTxicj4NCiZn
dDvCoCDCoCDCoCDCoCDCoFNoYXJlZExpYnJhcnk6Om9wZW4gZm9yIFtsaWJ2dWxrYW4uc29dIChw
b3NpeCk6IGJlZ2luPGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBJMDkwMyAxMDow
NjoxMy4yNDk1MTQgMjc4NjcyNCBTaGFyZWRMaWJyYXJ5LmNwcDoyNDRdPGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgU2hhcmVkTGlicmFyeTo6b3BlbiBmb3IgW2xpYnZ1bGthbi5zb10gKHBvc2l4LGxp
bnV4KTogY2FsbDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoGRsb3BlbiBvbiBbbGlidnVsa2FuLnNv
PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgXTxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgIMKg
IMKgYWRkZWQgbGlicmFyeSBsaWJ2dWxrYW4uc288YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBJMDkw
MyAxMDowNjoxMy4yNTA1MzUgMjc4NjcyNCBIZWFsdGhNb25pdG9yLmNwcDoyODBdPGJyPg0KJmd0
O8KgIMKgIMKgIMKgIMKgSGVhbHRoTW9uaXRvciBkaXNhYmxlZC48YnI+DQomZ3Q7wqAgwqAgwqAg
wqAgwqBjcmVhdGVHbG9iYWxWa0VtdWxhdGlvbjo5NjQgU2VsZWN0aW5nIFZ1bGthbiBkZXZpY2U6
IE5WSURJQTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoEdlRm9yY2UgR1RYIDEwNjAgM0dCPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgaW5pdGlhbGl6ZTogU3VwcG9ydHMgaWQgcHJvcGVydGllcywgZ290
IGEgdnVsa2FuIGRldmljZSBVVUlEPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgSTA5MDMgMTA6MDY6
MTMuMzU0NzU2IDI3ODY3MjQgU2hhcmVkTGlicmFyeS5jcHA6NzZdPGJyPg0KJmd0O8KgIMKgIMKg
IMKgIMKgU2hhcmVkTGlicmFyeTo6b3BlbiBmb3IgW2xpYkdMRVN2Mi5zb106IG5vdCBmb3VuZCBp
biBtYXAsIG9wZW48YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBmb3IgdGhlIGZpcnN0IHRpbWU8YnI+
DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoEkwOTAzIDEwOjA2OjEzLjM1NDc2NCAyNzg2
NzI0IFNoYXJlZExpYnJhcnkuY3BwOjE4Nl08YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBTaGFyZWRM
aWJyYXJ5OjpvcGVuIGZvciBbbGliR0xFU3YyLnNvXSAocG9zaXgpOiBiZWdpbjxicj4NCiZndDsg
PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgSTA5MDMgMTA6MDY6MTMuMzU0NzY4IDI3ODY3MjQgU2hh
cmVkTGlicmFyeS5jcHA6MjQ0XTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoFNoYXJlZExpYnJhcnk6
Om9wZW4gZm9yIFtsaWJHTEVTdjIuc29dIChwb3NpeCxsaW51eCk6IGNhbGw8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAgwqBkbG9wZW4gb24gW2xpYkdMRVN2Mi5zbzxicj4NCiZndDvCoCDCoCDCoCDCoCDC
oF08YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoEkwOTAzIDEwOjA2OjEzLjM1NTA3
NiAyNzg2NzI0IFNoYXJlZExpYnJhcnkuY3BwOjc2XTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoFNo
YXJlZExpYnJhcnk6Om9wZW4gZm9yIFtsaWJFR0wuc29dOiBub3QgZm91bmQgaW4gbWFwLCBvcGVu
IGZvcjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoHRoZSBmaXJzdCB0aW1lPGJyPg0KJmd0OyA8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqBJMDkwMyAxMDowNjoxMy4zNTUwODEgMjc4NjcyNCBTaGFyZWRM
aWJyYXJ5LmNwcDoxODZdPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgU2hhcmVkTGlicmFyeTo6b3Bl
biBmb3IgW2xpYkVHTC5zb10gKHBvc2l4KTogYmVnaW48YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDC
oCDCoCDCoCDCoEkwOTAzIDEwOjA2OjEzLjM1NTA4NCAyNzg2NzI0IFNoYXJlZExpYnJhcnkuY3Bw
OjI0NF08YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBTaGFyZWRMaWJyYXJ5OjpvcGVuIGZvciBbbGli
RUdMLnNvXSAocG9zaXgsbGludXgpOiBjYWxsIGRsb3Blbjxicj4NCiZndDvCoCDCoCDCoCDCoCDC
oG9uIFtsaWJFR0wuc29dPGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBJMDkwMyAx
MDowNjoxMy40NDg4MjEgMjc4NjcyNCBWa0NvbW1vbk9wZXJhdGlvbnMuY3BwOjEyMjZdPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgSW5pdGlhbGl6aW5nIFZrRW11bGF0aW9uIGZlYXR1cmVzOjxicj4N
CiZndDvCoCDCoCDCoCDCoCDCoEkwOTAzIDEwOjA2OjEzLjQ0ODgzNyAyNzg2NzI0IFZrQ29tbW9u
T3BlcmF0aW9ucy5jcHA6MTIyN108YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqDCoMKgwqBnbElu
dGVyb3BTdXBwb3J0ZWQ6IHRydWU8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBJMDkwMyAxMDowNjox
My40NDg4NDAgMjc4NjcyNCBWa0NvbW1vbk9wZXJhdGlvbnMuY3BwOjEyMjhdPGJyPg0KJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgwqDCoMKgdXNlRGVmZXJyZWRDb21tYW5kczogdHJ1ZTxicj4NCiZndDvC
oCDCoCDCoCDCoCDCoEkwOTAzIDEwOjA2OjEzLjQ0ODg0MiAyNzg2NzI0IFZrQ29tbW9uT3BlcmF0
aW9ucy5jcHA6MTIzMF08YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqDCoMKgwqBjcmVhdGVSZXNv
dXJjZVdpdGhSZXF1aXJlbWVudHM6IHRydWU8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBJMDkwMyAx
MDowNjoxMy40NDg4NDQgMjc4NjcyNCBWa0NvbW1vbk9wZXJhdGlvbnMuY3BwOjEyMzFdPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgwqDCoMKgdXNlVnVsa2FuQ29tcG9zaXRpb246IGZhbHNlPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgIMKgSTA5MDMgMTA6MDY6MTMuNDQ4ODQ2IDI3ODY3MjQgVmtDb21t
b25PcGVyYXRpb25zLmNwcDoxMjMyXTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoMKgwqDCoHVz
ZVZ1bGthbk5hdGl2ZVN3YXBjaGFpbjogZmFsc2U8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBJMDkw
MyAxMDowNjoxMy40NDg4NDggMjc4NjcyNCBWa0NvbW1vbk9wZXJhdGlvbnMuY3BwOjEyMzNdPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgwqDCoMKgZW5hYmxlIGd1ZXN0UmVuZGVyRG9jOiBmYWxz
ZTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoEkwOTAzIDEwOjA2OjEzLjQ0ODg1MCAyNzg2NzI0IFZr
Q29tbW9uT3BlcmF0aW9ucy5jcHA6MTIzNF08YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqDCoMKg
wqBBU1RDIExEUiBlbXVsYXRpb24gbW9kZTogMjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoEkwOTAz
IDEwOjA2OjEzLjQ0ODg1MiAyNzg2NzI0IFZrQ29tbW9uT3BlcmF0aW9ucy5jcHA6MTIzNV08YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqDCoMKgwqBlbmFibGUgRVRDMiBlbXVsYXRpb246IHRydWU8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBJMDkwMyAxMDowNjoxMy40NDg4NTQgMjc4NjcyNCBWa0Nv
bW1vbk9wZXJhdGlvbnMuY3BwOjEyMzZdPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgwqDCoMKg
ZW5hYmxlIFljYmNyIGVtdWxhdGlvbjogZmFsc2U8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBJMDkw
MyAxMDowNjoxMy40NDg4NTYgMjc4NjcyNCBWa0NvbW1vbk9wZXJhdGlvbnMuY3BwOjEyMzddPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgwqDCoMKgZ3Vlc3RVc2VzQW5nbGU6IGZhbHNlPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgSTA5MDMgMTA6MDY6MTMuNDQ4ODU4IDI3ODY3MjQgVmtDb21tb25P
cGVyYXRpb25zLmNwcDoxMjM4XTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoMKgwqDCoHVzZURl
ZGljYXRlZEFsbG9jYXRpb25zOiBmYWxzZTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoEkwOTAzIDEw
OjA2OjEzLjQ0OTU0MiAyNzg2NzI0IEZyYW1lQnVmZmVyLmNwcDo0ODZdIEdyYXBoaWNzPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgQWRhcHRlciBWZW5kb3IgR29vZ2xlIChOVklESUEgQ29ycG9yYXRp
b24pPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgSTA5MDMgMTA6MDY6MTMuNDQ5NTQ4IDI3ODY3MjQg
RnJhbWVCdWZmZXIuY3BwOjQ4N10gR3JhcGhpY3M8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBBZGFw
dGVyIEFuZHJvaWQgRW11bGF0b3IgT3BlbkdMIEVTIFRyYW5zbGF0b3IgKE5WSURJQSBHZUZvcmNl
PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgR1RYIDEwNjAgM0dCLzxicj4NCiZndDvCoCDCoCDCoCDC
oCDCoFBDSWUvU1NFMik8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBJMDkwMyAxMDowNjoxMy40NDk1
NTEgMjc4NjcyNCBGcmFtZUJ1ZmZlci5jcHA6NDg4XSBHcmFwaGljcyBBUEk8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAgwqBWZXJzaW9uIE9wZW5HTCBFUyAzLjAgKE9wZW5HTCBFUyAzLjIgTlZJRElBIDUz
NS4xODMuMDEpPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgSTA5MDMgMTA6MDY6MTMuNDQ5NTUzIDI3
ODY3MjQgRnJhbWVCdWZmZXIuY3BwOjQ4OV0gR3JhcGhpY3MgQVBJPGJyPg0KJmd0O8KgIMKgIMKg
IMKgIMKgRXh0ZW5zaW9ucyBHTF9PRVNfRUdMX3N5bmMgR0xfT0VTX0VHTF9pbWFnZTxicj4NCiZn
dDvCoCDCoCDCoCDCoCDCoEdMX09FU19FR0xfaW1hZ2VfZXh0ZXJuYWwgRzxicj4NCiZndDvCoCDC
oCDCoCDCoCDCoExfT0VTX2RlcHRoMjQgR0xfT0VTX2RlcHRoMzIgR0xfT0VTX2VsZW1lbnRfaW5k
ZXhfdWludDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoEdMX09FU190ZXh0dXJlX2Zsb2F0IEdMX09F
U190ZXh0dXJlX2Zsb2F0X2xpbmVhcjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoEdMX09FU19jb21w
cmVzc2VkX3BhbGV0dGVkX3RleHQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqB1cmUgR0xfT0VTX2Nv
bXByZXNzZWRfRVRDMV9SR0I4X3RleHR1cmUgR0xfT0VTX2RlcHRoX3RleHR1cmU8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAgwqBHTF9PRVNfdGV4dHVyZV9oYWxmX2Zsb2F0IEdMX09FU190ZXh0dXJlX2hh
bGZfZmxvYXRfbGluZWFyPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgR0xfT0VTX3BhY2tlZF9kPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgIMKgZXB0aF9zdGVuY2lsIEdMX09FU192ZXJ0ZXhfaGFsZl9mbG9h
dDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoEdMX09FU19zdGFuZGFyZF9kZXJpdmF0aXZlcyBHTF9P
RVNfdGV4dHVyZV9ucG90PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgR0xfT0VTX3JnYjhfcmdiYTgg
R0xfT1ZSX211bHRpdmlldzIgR0xfRVhUX211bHRpdjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoGll
d190ZXh0dXJlX211bHRpc2FtcGxlIEdMX0VYVF9jb2xvcl9idWZmZXJfZmxvYXQ8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAgwqBHTF9FWFRfY29sb3JfYnVmZmVyX2hhbGZfZmxvYXQgR0xfRVhUX3RleHR1
cmVfZm9ybWF0X0JHUkE4ODg4PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgR0xfQVBQTEVfdGV4dHVy
ZV9mb3JtYXQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBfQkdSQTg4ODggR0xfRVhUX3RleHR1cmVf
YnVmZmVyIEdMX09FU190ZXh0dXJlX2J1ZmZlcjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoEdMX0VY
VF9kcmF3X2J1ZmZlcnNfaW5kZXhlZDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoEkwOTAzIDEwOjA2
OjEzLjQ0OTU1OSAyNzg2NzI0IEZyYW1lQnVmZmVyLmNwcDo0OTBdIEdyYXBoaWNzPGJyPg0KJmd0
O8KgIMKgIMKgIMKgIMKgRGV2aWNlIEV4dGVuc2lvbnMgTi9BPGJyPg0KJmd0O8KgIMKgIMKgIMKg
IMKgR1VFU1RfVUJPT1RfVkVSU0lPTjogMjAyNC4wMS1nMWVkOGY4YmRlMzNlLWFiMTIwOTEyMDYg
KEp1bCAxMDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoDIwMjQgLSAyMzo0NzozOCArMDAwMCk8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqBVLUJvb3QgMjA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBzdGFy
dGluZyBSdXN0IEtleU1pbnQgVEEgaW1wbGVtZW50YXRpb24gaW4gYSB0aHJlYWQ8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAgwqBzdGFydGluZyBDKysgS2V5TWludCBpbXBsZW1lbnRhdGlvbiBpbiBhIHRo
cmVhZCB3aXRoIEZEcyBpbj0zMSw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBvdXQ9MzA8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAgwqBLZXlNaW50IFJ1c3QgVEEgcnVubmluZyB3aXRoIGluZmlsZT0zNywg
b3V0ZmlsZT0zNiw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBzZWN1cml0eV9sZXZlbD1Tb2Z0d2Fy
ZTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoFNlY3VyZSBkZWxldGlvbiBkYXRhIGZpbGUgZm91bmQu
IFBhcnNpbmcuPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgMjAyNC0wOS0wM1QwODowNjoxMy42MjYw
NzVaIHFlbXUtc3lzdGVtLWFhcmNoNjQ6PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgdmlydGlvLXNl
cmlhbC1idXM6IFVuZXhwZWN0ZWQgcG9ydCBpZCAxNiBmb3IgZGV2aWNlIHZpcnRpby1zZXJpYWwu
MDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoDIwMjQtMDktMDNUMDg6MDY6MTMuNjI2NDEwWiBxZW11
LXN5c3RlbS1hYXJjaDY0Ojxicj4NCiZndDvCoCDCoCDCoCDCoCDCoHZpcnRpby1zZXJpYWwtYnVz
OiBVbmV4cGVjdGVkIHBvcnQgaWQgMTcgZm9yIGRldmljZSB2aXJ0aW8tc2VyaWFsLjA8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAgwqAyMDI0LTA5LTAzVDA4OjA2OjEzLjYyNjU5OVogcWVtdS1zeXN0ZW0t
YWFyY2g2NDo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqB2aXJ0aW8tc2VyaWFsLWJ1czogVW5leHBl
Y3RlZCBwb3J0IGlkIDE4IGZvciBkZXZpY2UgdmlydGlvLXNlcmlhbC4wPGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgMjAyNC0wOS0wM1QwODowNjoxMy42MjY3ODhaIHFlbXUtc3lzdGVtLWFhcmNoNjQ6
PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgdmlydGlvLXNlcmlhbC1idXM6IFVuZXhwZWN0ZWQgcG9y
dCBpZCAxOSBmb3IgZGV2aWNlIHZpcnRpby1zZXJpYWwuMDxicj4NCiZndDvCoCDCoCDCoCDCoCDC
oDIwMjQtMDktMDNUMDg6MDY6MTMuNjI2OTgwWiBxZW11LXN5c3RlbS1hYXJjaDY0Ojxicj4NCiZn
dDvCoCDCoCDCoCDCoCDCoHZpcnRpby1zZXJpYWwtYnVzOiBVbmV4cGVjdGVkIHBvcnQgaWQgMjAg
Zm9yIGRldmljZSB2aXJ0aW8tc2VyaWFsLjA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAyMDI0LTA5
LTAzVDA4OjA2OjEzLjYyNzE3MVogcWVtdS1zeXN0ZW0tYWFyY2g2NDo8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAgwqB2aXJ0aW8tc2VyaWFsLWJ1czogVW5leHBlY3RlZCBwb3J0IGlkIDIxIGZvciBkZXZp
Y2UgdmlydGlvLXNlcmlhbC4wPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgMjAyNC0wOS0wM1QwODow
NjoxMy42MjczNjBaIHFlbXUtc3lzdGVtLWFhcmNoNjQ6PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
dmlydGlvLXNlcmlhbC1idXM6IFVuZXhwZWN0ZWQgcG9ydCBpZCAyMiBmb3IgZGV2aWNlIHZpcnRp
by1zZXJpYWwuMDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoDIwMjQtMDktMDNUMDg6MDY6MTMuNjI3
NTQ5WiBxZW11LXN5c3RlbS1hYXJjaDY0Ojxicj4NCiZndDvCoCDCoCDCoCDCoCDCoHZpcnRpby1z
ZXJpYWwtYnVzOiBVbmV4cGVjdGVkIHBvcnQgaWQgMjMgZm9yIGRldmljZSB2aXJ0aW8tc2VyaWFs
LjA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAyMDI0LTA5LTAzVDA4OjA2OjEzLjYyNzczOFogcWVt
dS1zeXN0ZW0tYWFyY2g2NDo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqB2aXJ0aW8tc2VyaWFsLWJ1
czogVW5leHBlY3RlZCBwb3J0IGlkIDI0IGZvciBkZXZpY2UgdmlydGlvLXNlcmlhbC4wPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgMjAyNC0wOS0wM1QwODowNjoxMy42Mjc5MzBaIHFlbXUtc3lzdGVt
LWFhcmNoNjQ6PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgdmlydGlvLXNlcmlhbC1idXM6IFVuZXhw
ZWN0ZWQgcG9ydCBpZCAyNSBmb3IgZGV2aWNlIHZpcnRpby1zZXJpYWwuMDxicj4NCiZndDvCoCDC
oCDCoCDCoCDCoDIwMjQtMDktMDNUMDg6MDY6MTMuNjI4MTE5WiBxZW11LXN5c3RlbS1hYXJjaDY0
Ojxicj4NCiZndDvCoCDCoCDCoCDCoCDCoHZpcnRpby1zZXJpYWwtYnVzOiBVbmV4cGVjdGVkIHBv
cnQgaWQgMjYgZm9yIGRldmljZSB2aXJ0aW8tc2VyaWFsLjA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAg
wqAyMDI0LTA5LTAzVDA4OjA2OjEzLjYyODMwN1ogcWVtdS1zeXN0ZW0tYWFyY2g2NDo8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAgwqB2aXJ0aW8tc2VyaWFsLWJ1czogVW5leHBlY3RlZCBwb3J0IGlkIDI3
IGZvciBkZXZpY2UgdmlydGlvLXNlcmlhbC4wPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgMjAyNC0w
OS0wM1QwODowNjoxMy42Mjg0OTZaIHFlbXUtc3lzdGVtLWFhcmNoNjQ6PGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgdmlydGlvLXNlcmlhbC1idXM6IFVuZXhwZWN0ZWQgcG9ydCBpZCAyOCBmb3IgZGV2
aWNlIHZpcnRpby1zZXJpYWwuMDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoDIwMjQtMDktMDNUMDg6
MDY6MTMuNjI4NjgzWiBxZW11LXN5c3RlbS1hYXJjaDY0Ojxicj4NCiZndDvCoCDCoCDCoCDCoCDC
oHZpcnRpby1zZXJpYWwtYnVzOiBVbmV4cGVjdGVkIHBvcnQgaWQgMjkgZm9yIGRldmljZSB2aXJ0
aW8tc2VyaWFsLjA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAyMDI0LTA5LTAzVDA4OjA2OjEzLjYy
ODg3NFogcWVtdS1zeXN0ZW0tYWFyY2g2NDo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqB2aXJ0aW8t
c2VyaWFsLWJ1czogVW5leHBlY3RlZCBwb3J0IGlkIDMwIGZvciBkZXZpY2UgdmlydGlvLXNlcmlh
bC4wPGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBHVUVTVF9LRVJORUxfVkVSU0lP
Tjo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqA2LjYuNDYtYW5kcm9pZDE1LTgtZzM1NjliMDUzNTE3
Yy1hYjEyMjkwODU2LTRrPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgKGtsZWFmQGJ1aWxkLWhvc3Qp
IChBbmRyb2lkICgxMTM2ODMwOCwgK3BnbywgK2JvbHQsICtsdG8sICttbGdvLDxicj4NCiZndDvC
oCDCoCDCoCDCoCDCoGJhc2VkIG9uIHI1MTA5MjgpIGNsYW5nIHZlcnNpb24gMTguMC4wPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgKDxhIGhyZWY9Imh0dHBzOi8vYW5kcm9pZC5nb29nbGVzb3VyY2Uu
Y29tL3Rvb2xjaGFpbi9sbHZtLXByb2plY3QiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxh
bmsiPmh0dHBzOi8vYW5kcm9pZC5nb29nbGVzb3VyY2UuY29tL3Rvb2xjaGFpbi9sbHZtLXByb2pl
Y3Q8L2E+PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHBzOi8vYW5kcm9p
ZC5nb29nbGVzb3VyY2UuY29tL3Rvb2xjaGFpbi9sbHZtLXByb2plY3QiIHJlbD0ibm9yZWZlcnJl
ciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vYW5kcm9pZC5nb29nbGVzb3VyY2UuY29tL3Rvb2xj
aGFpbi9sbHZtLXByb2plY3Q8L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoDQ3NzYxMGQ0
ZDBkOTg4ZTY5ZGJjM2ZhZTRmZTg2YmZmM2YwN2YyYjUpLCBMTEQgMTguMC4wKSAjMSBTTVA8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqBQUkVFTVBUIFdlZCBBdWcgMjggMjE6NDM6MzMgVVRDIDIwMjQ8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBdIExpbnV4IHZlcnNpb248YnI+DQomZ3Q7wqAgwqAgwqAg
wqAgwqB0cmFuc3BvcnQgbWVzc2FnZSBmYWlsZWQsIHJlc3BvbnNlIGJvZHk6IGRldmljZSAmIzM5
OzxhIGhyZWY9Imh0dHA6Ly8wLjAuMC4wOjY1MjAiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJf
YmxhbmsiPjAuMC4wLjA6NjUyMDwvYT48YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJl
Zj0iaHR0cDovLzAuMC4wLjA6NjUyMCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+
aHR0cDovLzAuMC4wLjA6NjUyMDwvYT4mZ3Q7JiMzOTsgbm90IGZvdW5kPGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgdHJhbnNwb3J0IG1lc3NhZ2UgZmFpbGVkLCByZXNwb25zZSBib2R5OiBkZXZpY2Ug
JiMzOTs8YSBocmVmPSJodHRwOi8vMC4wLjAuMDo2NTIwIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdl
dD0iX2JsYW5rIj4wLjAuMC4wOjY1MjA8L2E+PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgJmx0Ozxh
IGhyZWY9Imh0dHA6Ly8wLjAuMC4wOjY1MjAiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxh
bmsiPmh0dHA6Ly8wLjAuMC4wOjY1MjA8L2E+Jmd0OyYjMzk7IG5vdCBmb3VuZDxicj4NCiZndDvC
oCDCoCDCoCDCoCDCoHRyYW5zcG9ydCBtZXNzYWdlIGZhaWxlZCwgcmVzcG9uc2UgYm9keTogZGV2
aWNlICYjMzk7PGEgaHJlZj0iaHR0cDovLzAuMC4wLjA6NjUyMCIgcmVsPSJub3JlZmVycmVyIiB0
YXJnZXQ9Il9ibGFuayI+MC4wLjAuMDo2NTIwPC9hPjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCZs
dDs8YSBocmVmPSJodHRwOi8vMC4wLjAuMDo2NTIwIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0i
X2JsYW5rIj5odHRwOi8vMC4wLjAuMDo2NTIwPC9hPiZndDsmIzM5OyBub3QgZm91bmQ8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAgwqB0cmFuc3BvcnQgbWVzc2FnZSBmYWlsZWQsIHJlc3BvbnNlIGJvZHk6
IGRldmljZSAmIzM5OzxhIGhyZWY9Imh0dHA6Ly8wLjAuMC4wOjY1MjAiIHJlbD0ibm9yZWZlcnJl
ciIgdGFyZ2V0PSJfYmxhbmsiPjAuMC4wLjA6NjUyMDwvYT48YnI+DQomZ3Q7wqAgwqAgwqAgwqAg
wqAmbHQ7PGEgaHJlZj0iaHR0cDovLzAuMC4wLjA6NjUyMCIgcmVsPSJub3JlZmVycmVyIiB0YXJn
ZXQ9Il9ibGFuayI+aHR0cDovLzAuMC4wLjA6NjUyMDwvYT4mZ3Q7JiMzOTsgbm90IGZvdW5kPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgIMKgR1VFU1RfQlVJTERfRklOR0VSUFJJTlQ6PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgIMKgZ2VuZXJpYy9hb3NwX2NmX2FybTY0X29ubHlfcGhvbmUvdnNvY19hcm02NF9v
bmx5OlZhbmlsbGFJY2VDcmVhbS9NQUlOLjFjMDE5YjBjLzEyMzA5Mjk2OnVzZXJkZWJ1Zy90ZXN0
LWtleXM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqB0cmFuc3BvcnQgbWVzc2FnZSBmYWlsZWQsIHJl
c3BvbnNlIGJvZHk6IGRldmljZSAmIzM5OzxhIGhyZWY9Imh0dHA6Ly8wLjAuMC4wOjY1MjAiIHJl
bD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPjAuMC4wLjA6NjUyMDwvYT48YnI+DQomZ3Q7
wqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovLzAuMC4wLjA6NjUyMCIgcmVsPSJub3Jl
ZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovLzAuMC4wLjA6NjUyMDwvYT4mZ3Q7JiMzOTsg
bm90IGZvdW5kPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgdHJhbnNwb3J0IG1lc3NhZ2UgZmFpbGVk
LCByZXNwb25zZSBib2R5OiBkZXZpY2UgJiMzOTs8YSBocmVmPSJodHRwOi8vMC4wLjAuMDo2NTIw
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj4wLjAuMC4wOjY1MjA8L2E+PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly8wLjAuMC4wOjY1MjAiIHJlbD0i
bm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly8wLjAuMC4wOjY1MjA8L2E+Jmd0OyYj
Mzk7IG5vdCBmb3VuZDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoHRyYW5zcG9ydCBtZXNzYWdlIGZh
aWxlZCwgcmVzcG9uc2UgYm9keTogZGV2aWNlICYjMzk7PGEgaHJlZj0iaHR0cDovLzAuMC4wLjA6
NjUyMCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+MC4wLjAuMDo2NTIwPC9hPjxi
cj4NCiZndDvCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vMC4wLjAuMDo2NTIwIiBy
ZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vMC4wLjAuMDo2NTIwPC9hPiZn
dDsmIzM5OyBub3QgZm91bmQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqB0cmFuc3BvcnQgbWVzc2Fn
ZSBmYWlsZWQsIHJlc3BvbnNlIGJvZHk6IGRldmljZSAmIzM5OzxhIGhyZWY9Imh0dHA6Ly8wLjAu
MC4wOjY1MjAiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPjAuMC4wLjA6NjUyMDwv
YT48YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovLzAuMC4wLjA6NjUy
MCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovLzAuMC4wLjA6NjUyMDwv
YT4mZ3Q7JiMzOTsgbm90IGZvdW5kPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgdHJhbnNwb3J0IG1l
c3NhZ2UgZmFpbGVkLCByZXNwb25zZSBib2R5OiBkZXZpY2UgJiMzOTs8YSBocmVmPSJodHRwOi8v
MC4wLjAuMDo2NTIwIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj4wLjAuMC4wOjY1
MjA8L2E+PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly8wLjAuMC4w
OjY1MjAiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly8wLjAuMC4wOjY1
MjA8L2E+Jmd0OyYjMzk7IG5vdCBmb3VuZDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoHRyYW5zcG9y
dCBtZXNzYWdlIGZhaWxlZCwgcmVzcG9uc2UgYm9keTogZGV2aWNlICYjMzk7PGEgaHJlZj0iaHR0
cDovLzAuMC4wLjA6NjUyMCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+MC4wLjAu
MDo2NTIwPC9hPjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vMC4w
LjAuMDo2NTIwIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vMC4wLjAu
MDo2NTIwPC9hPiZndDsmIzM5OyBub3QgZm91bmQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqB0cmFu
c3BvcnQgbWVzc2FnZSBmYWlsZWQsIHJlc3BvbnNlIGJvZHk6IGRldmljZSAmIzM5OzxhIGhyZWY9
Imh0dHA6Ly8wLjAuMC4wOjY1MjAiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPjAu
MC4wLjA6NjUyMDwvYT48YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDov
LzAuMC4wLjA6NjUyMCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovLzAu
MC4wLjA6NjUyMDwvYT4mZ3Q7JiMzOTsgbm90IGZvdW5kPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
dHJhbnNwb3J0IG1lc3NhZ2UgZmFpbGVkLCByZXNwb25zZSBib2R5OiBkZXZpY2UgJiMzOTs8YSBo
cmVmPSJodHRwOi8vMC4wLjAuMDo2NTIwIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5r
Ij4wLjAuMC4wOjY1MjA8L2E+PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0
dHA6Ly8wLjAuMC4wOjY1MjAiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6
Ly8wLjAuMC4wOjY1MjA8L2E+Jmd0OyYjMzk7IG5vdCBmb3VuZDxicj4NCiZndDvCoCDCoCDCoCDC
oCDCoGluaXQ6IHN0YXJ0aW5nIHNlcnZpY2UgJiMzOTthZGJkJiMzOTsuLi48YnI+DQomZ3Q7wqAg
wqAgwqAgwqAgwqBwcm94eV9mYXN0Ym9vdF0gU3RvcCBldmVudCAoMTEpIHJlY2VpdmVkLiBTdG9w
cGluZyBwcm94eTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoHByb3h5X2FkYl0gU3RhcnQgZXZlbnQg
KDUpIHJlY2VpdmVkLiBTdGFydGluZyBwcm94eTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoHByb3h5
X2FkYl0gRnJvbTogdGNwOiA2NTIwPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgcHJveHlfYWRiXSBU
bzogdnNvY2s6IDM6NTU1NSB2aG9zdF91c2VyOiBmYWxzZTxicj4NCiZndDvCoCDCoCDCoCDCoCDC
oHRyYW5zcG9ydCBtZXNzYWdlIGZhaWxlZCwgcmVzcG9uc2UgYm9keTogZGV2aWNlICYjMzk7PGEg
aHJlZj0iaHR0cDovLzAuMC4wLjA6NjUyMCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFu
ayI+MC4wLjAuMDo2NTIwPC9hPjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVmPSJo
dHRwOi8vMC4wLjAuMDo2NTIwIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRw
Oi8vMC4wLjAuMDo2NTIwPC9hPiZndDsmIzM5OyBub3QgZm91bmQ8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAgwqBJMDkwMyAxMDowOTozMC44MTYxMDggMjc4NzMxNCBJbnRlbERybURlY29kZXIuY3BwOjM4
XTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoEludGVsRHJtRGVjb2RlciBjcmVhdGVkIGZvciBjb250
ZXh0IDI8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBJMDkwMyAxMDowOTozMi43NjQ4MjAgMjc4NzMx
NiBJbnRlbERybURlY29kZXIuY3BwOjM4XTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoEludGVsRHJt
RGVjb2RlciBjcmVhdGVkIGZvciBjb250ZXh0IDc8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBWSVJU
VUFMX0RFVklDRV9ESVNQTEFZX1BPV0VSX01PREVfQ0hBTkdFRDxicj4NCiZndDvCoCDCoCDCoCDC
oCDCoFZJUlRVQUxfREVWSUNFX0RJU1BMQVlfUE9XRVJfTU9ERV9DSEFOR0VEPGJyPg0KJmd0O8Kg
IMKgIMKgIMKgIMKgSTA5MDMgMTA6MTA6MjAuOTE4MDE0IDI3ODczNTkgSW50ZWxEcm1EZWNvZGVy
LmNwcDozOF08YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBJbnRlbERybURlY29kZXIgY3JlYXRlZCBm
b3IgY29udGV4dCAxMTxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgSSBzZWUgYSBs
b3Qgb2YgZXJyb3JzLGJ1dCBpdCBzZWVtcyBjb25uZWN0ZWQgOjxicj4NCiZndDsgPGJyPg0KJmd0
O8KgIMKgIMKgIMKgIMKgemlvbWFyaW9AWjM5MC1BT1JVUy1QUk8tREVTVDp+L1Njcml2YW5pYSQg
YWRiIGRldmljZXM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBMaXN0IG9mIGRldmljZXMgYXR0YWNo
ZWQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqA8YSBocmVmPSJodHRwOi8vMC4wLjAuMDo2NTIwIiBy
ZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj4wLjAuMC4wOjY1MjA8L2E+ICZsdDs8YSBo
cmVmPSJodHRwOi8vMC4wLjAuMDo2NTIwIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5r
Ij5odHRwOi8vMC4wLjAuMDo2NTIwPC9hPiZndDsgwqDCoMKgZGV2aWNlPGJyPg0KJmd0OyA8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqBidXQgc2NyY3B5IGRpZG4mIzM5O3Qgd29yayA6PGJyPg0KJmd0
OyA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqB6aW9tYXJpb0BaMzkwLUFPUlVTLVBSTy1ERVNUOn4v
U2NyaXZhbmlhJCBzY3JjcHk8YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoHNjcmNw
eSAyLjYuMSAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL0dlbnltb2JpbGUvc2NyY3B5
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dpdGh1Yi5jb20vR2Vu
eW1vYmlsZS9zY3JjcHk8L2E+PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0
dHBzOi8vZ2l0aHViLmNvbS9HZW55bW9iaWxlL3NjcmNweSIgcmVsPSJub3JlZmVycmVyIiB0YXJn
ZXQ9Il9ibGFuayI+aHR0cHM6Ly9naXRodWIuY29tL0dlbnltb2JpbGUvc2NyY3B5PC9hPiZndDsm
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgSU5GTzogQURCIGRldmljZSBmb3VuZDo8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAgwqBJTkZPOiDCoMKgwqDCoC0tJmd0OyAodGNwaXApIDxhIGhyZWY9Imh0
dHA6Ly8wLjAuMC4wOjY1MjAiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPjAuMC4w
LjA6NjUyMDwvYT4gJmx0OzxhIGhyZWY9Imh0dHA6Ly8wLjAuMC4wOjY1MjAiIHJlbD0ibm9yZWZl
cnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly8wLjAuMC4wOjY1MjA8L2E+Jmd0Ozxicj4NCiZn
dDvCoCDCoCDCoCDCoCDCoCDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRl
dmljZSDCoEN1dHRsZWZpc2hfYXJtNjRfcGhvbmVfNjRfYml0X29ubHk8YnI+DQomZ3Q7IDxicj4N
CiZndDvCoCDCoCDCoCDCoCDCoC91c3IvbG9jYWwvc2hhcmUvc2NyY3B5L3NjcmNweS1zZXJ2ZXI6
IDEgZmlsZSBwdXNoZWQsIDAgc2tpcHBlZC48YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqA5MC4wIE1C
L3MgKDcxMTEyIGJ5dGVzIGluIDAuMDAxcyk8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBbc2VydmVy
XSBJTkZPOiBEZXZpY2U6IFtHb29nbGVdIGdlbmVyaWMgQ3V0dGxlZmlzaCBhcm02NCBwaG9uZTxi
cj4NCiZndDvCoCDCoCDCoCDCoCDCoDY0LWJpdCBvbmx5IChBbmRyb2lkIDE0KTxicj4NCiZndDvC
oCDCoCDCoCDCoCDCoFtzZXJ2ZXJdIEVSUk9SOiBDb3VsZCBub3QgcmVnaXN0ZXIgcm90YXRpb24g
d2F0Y2hlcjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoGphdmEubGFuZy5OdWxsUG9pbnRlckV4Y2Vw
dGlvbjogQXR0ZW1wdCB0byBpbnZva2UgdmlydHVhbCBtZXRob2Q8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAgwqAmIzM5O2phdmEubGFuZy5DbGFzcyBqYXZhLmxhbmcuT2JqZWN0LmdldENsYXNzKCkmIzM5
OyBvbiBhIG51bGwgb2JqZWN0PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgcmVmZXJlbmNlPGJyPg0K
Jmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqDCoMKgwqDCoMKgIGF0PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgIMKgY29tLmdlbnltb2JpbGUuc2NyY3B5LndyYXBwZXJzLldpbmRvd01hbmFnZXIu
cmVnaXN0ZXJSb3RhdGlvbldhdGNoZXIoV2luZG93TWFuYWdlci5qYXZhOjE4NSk8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAgwqAgwqDCoMKgwqDCoMKgwqBhdDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoGNv
bS5nZW55bW9iaWxlLnNjcmNweS5kZXZpY2UuRGV2aWNlLiZsdDtpbml0Jmd0OyhEZXZpY2UuamF2
YTo5Myk8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqDCoMKgwqDCoMKgwqBhdCBjb20uZ2VueW1v
YmlsZS5zY3JjcHkuU2VydmVyLnNjcmNweShTZXJ2ZXIuamF2YToxNDUpPGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgIMKgwqDCoMKgwqDCoMKgYXQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBjb20uZ2Vu
eW1vYmlsZS5zY3JjcHkuU2VydmVyLmludGVybmFsTWFpbihTZXJ2ZXIuamF2YToyOTApPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgwqDCoMKgwqDCoMKgYXQgY29tLmdlbnltb2JpbGUuc2NyY3B5
LlNlcnZlci5tYWluKFNlcnZlci5qYXZhOjI0NSk8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqDC
oMKgwqDCoMKgwqBhdDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoGNvbS5hbmRyb2lkLmludGVybmFs
Lm9zLlJ1bnRpbWVJbml0Lm5hdGl2ZUZpbmlzaEluaXQoTmF0aXZlIE1ldGhvZCk8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAgwqAgwqDCoMKgwqDCoMKgwqBhdDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoGNv
bS5hbmRyb2lkLmludGVybmFsLm9zLlJ1bnRpbWVJbml0Lm1haW4oUnVudGltZUluaXQuamF2YToz
NjkpPGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBbc2VydmVyXSBFUlJPUjogQ291
bGQgbm90IHJlZ2lzdGVyIGRpc3BsYXkgZm9sZCBsaXN0ZW5lcjxicj4NCiZndDsgPGJyPg0KJmd0
O8KgIMKgIMKgIMKgIMKgamF2YS5sYW5nLk51bGxQb2ludGVyRXhjZXB0aW9uOiBBdHRlbXB0IHRv
IGludm9rZSB2aXJ0dWFsIG1ldGhvZDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCYjMzk7amF2YS5s
YW5nLkNsYXNzIGphdmEubGFuZy5PYmplY3QuZ2V0Q2xhc3MoKSYjMzk7IG9uIGEgbnVsbCBvYmpl
Y3Q8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqByZWZlcmVuY2U8YnI+DQomZ3Q7IDxicj4NCiZndDvC
oCDCoCDCoCDCoCDCoCDCoMKgwqDCoMKgwqAgYXQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBjb20u
Z2VueW1vYmlsZS5zY3JjcHkud3JhcHBlcnMuV2luZG93TWFuYWdlci5yZWdpc3RlckRpc3BsYXlG
b2xkTGlzdGVuZXIoV2luZG93TWFuYWdlci5qYXZhOjIwNik8YnI+DQomZ3Q7wqAgwqAgwqAgwqAg
wqAgwqDCoMKgwqDCoMKgwqBhdDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoGNvbS5nZW55bW9iaWxl
LnNjcmNweS5kZXZpY2UuRGV2aWNlLiZsdDtpbml0Jmd0OyhEZXZpY2UuamF2YToxMDgpPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgwqDCoMKgwqDCoMKgYXQgY29tLmdlbnltb2JpbGUuc2NyY3B5
LlNlcnZlci5zY3JjcHkoU2VydmVyLmphdmE6MTQ1KTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDC
oMKgwqDCoMKgwqDCoGF0PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgY29tLmdlbnltb2JpbGUuc2Ny
Y3B5LlNlcnZlci5pbnRlcm5hbE1haW4oU2VydmVyLmphdmE6MjkwKTxicj4NCiZndDvCoCDCoCDC
oCDCoCDCoCDCoMKgwqDCoMKgwqDCoGF0IGNvbS5nZW55bW9iaWxlLnNjcmNweS5TZXJ2ZXIubWFp
bihTZXJ2ZXIuamF2YToyNDUpPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgwqDCoMKgwqDCoMKg
YXQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBjb20uYW5kcm9pZC5pbnRlcm5hbC5vcy5SdW50aW1l
SW5pdC5uYXRpdmVGaW5pc2hJbml0KE5hdGl2ZSBNZXRob2QpPGJyPg0KJmd0O8KgIMKgIMKgIMKg
IMKgIMKgwqDCoMKgwqDCoMKgYXQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBjb20uYW5kcm9pZC5p
bnRlcm5hbC5vcy5SdW50aW1lSW5pdC5tYWluKFJ1bnRpbWVJbml0LmphdmE6MzY5KTxicj4NCiZn
dDsgPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgW3NlcnZlcl0gV0FSTjogTm8gY2xpcGJvYXJkIG1h
bmFnZXIsIGNvcHktcGFzdGUgYmV0d2VlbiBkZXZpY2U8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBh
bmQgY29tcHV0ZXIgd2lsbCBub3Qgd29yazxicj4NCiZndDvCoCDCoCDCoCDCoCDCoFtzZXJ2ZXJd
IEVSUk9SOiBBdHRlbXB0IHRvIGludm9rZSB2aXJ0dWFsIG1ldGhvZDxicj4NCiZndDvCoCDCoCDC
oCDCoCDCoCYjMzk7YW5kcm9pZC52aWV3LklucHV0RGV2aWNlPGJyPg0KJmd0O8KgIMKgIMKgIMKg
IMKgYW5kcm9pZC5oYXJkd2FyZS5pbnB1dC5JbnB1dE1hbmFnZXJHbG9iYWwuZ2V0SW5wdXREZXZp
Y2UoaW50KSYjMzk7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgb24gYSBudWxsIG9iamVjdCByZWZl
cmVuY2U8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBqYXZhLmxhbmcuTnVsbFBvaW50ZXJFeGNlcHRp
b246IEF0dGVtcHQgdG8gaW52b2tlIHZpcnR1YWwgbWV0aG9kPGJyPg0KJmd0O8KgIMKgIMKgIMKg
IMKgJiMzOTthbmRyb2lkLnZpZXcuSW5wdXREZXZpY2U8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBh
bmRyb2lkLmhhcmR3YXJlLmlucHV0LklucHV0TWFuYWdlckdsb2JhbC5nZXRJbnB1dERldmljZShp
bnQpJiMzOTs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBvbiBhIG51bGwgb2JqZWN0IHJlZmVyZW5j
ZTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoMKgwqDCoMKgwqDCoGF0PGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgYW5kcm9pZC52aWV3LktleUNoYXJhY3Rlck1hcC5sb2FkKEtleUNoYXJhY3Rlck1h
cC5qYXZhOjM2NCk8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqDCoMKgwqDCoMKgwqBhdDxicj4N
CiZndDvCoCDCoCDCoCDCoCDCoGNvbS5nZW55bW9iaWxlLnNjcmNweS5jb250cm9sLkNvbnRyb2xs
ZXIuJmx0O2luaXQmZ3Q7KENvbnRyb2xsZXIuamF2YTo0NSk8YnI+DQomZ3Q7wqAgwqAgwqAgwqAg
wqAgwqDCoMKgwqDCoMKgwqBhdCBjb20uZ2VueW1vYmlsZS5zY3JjcHkuU2VydmVyLnNjcmNweShT
ZXJ2ZXIuamF2YToxNTkpPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgwqDCoMKgwqDCoMKgYXQ8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBjb20uZ2VueW1vYmlsZS5zY3JjcHkuU2VydmVyLmludGVy
bmFsTWFpbihTZXJ2ZXIuamF2YToyOTApPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgwqDCoMKg
wqDCoMKgYXQgY29tLmdlbnltb2JpbGUuc2NyY3B5LlNlcnZlci5tYWluKFNlcnZlci5qYXZhOjI0
NSk8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqDCoMKgwqDCoMKgwqBhdDxicj4NCiZndDvCoCDC
oCDCoCDCoCDCoGNvbS5hbmRyb2lkLmludGVybmFsLm9zLlJ1bnRpbWVJbml0Lm5hdGl2ZUZpbmlz
aEluaXQoTmF0aXZlIE1ldGhvZCk8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqDCoMKgwqDCoMKg
wqBhdDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoGNvbS5hbmRyb2lkLmludGVybmFsLm9zLlJ1bnRp
bWVJbml0Lm1haW4oUnVudGltZUluaXQuamF2YTozNjkpPGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAgwqBJTkZPOiBSZW5kZXJlcjogb3BlbmdsPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
SU5GTzogT3BlbkdMIHZlcnNpb246IDQuNi4wIE5WSURJQSA1MzUuMTgzLjAxPGJyPg0KJmd0O8Kg
IMKgIMKgIMKgIMKgSU5GTzogVHJpbGluZWFyIGZpbHRlcmluZyBlbmFibGVkPGJyPg0KJmd0O8Kg
IMKgIMKgIMKgIMKgV0FSTjogRGV2aWNlIGRpc2Nvbm5lY3RlZDxicj4NCiZndDvCoCDCoCDCoCDC
oCDCoEVSUk9SOiBEZW11eGVyICYjMzk7dmlkZW8mIzM5Ozogc3RyZWFtIGRpc2FibGVkIGR1ZSB0
byBjb25uZWN0aW9uIGVycm9yPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgRVJST1I6IERlbXV4ZXIg
JiMzOTthdWRpbyYjMzk7OiBzdHJlYW0gZGlzYWJsZWQgZHVlIHRvIGNvbm5lY3Rpb24gZXJyb3I8
YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoEV2ZW4gaWYgdGhlIHBob25lIGlzIHN0
aWxsIHVwIDo8YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoHppb21hcmlvQFozOTAt
QU9SVVMtUFJPLURFU1Q6fi9TY3JpdmFuaWEkIGFkYiBkZXZpY2VzPGJyPg0KJmd0O8KgIMKgIMKg
IMKgIMKgTGlzdCBvZiBkZXZpY2VzIGF0dGFjaGVkPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgPGEg
aHJlZj0iaHR0cDovLzAuMC4wLjA6NjUyMCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFu
ayI+MC4wLjAuMDo2NTIwPC9hPiAmbHQ7PGEgaHJlZj0iaHR0cDovLzAuMC4wLjA6NjUyMCIgcmVs
PSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovLzAuMC4wLjA6NjUyMDwvYT4mZ3Q7
IMKgwqDCoGRldmljZTxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgT24gVHVlLCBT
ZXAgMywgMjAyNCBhdCAxOjAz4oCvQU0gUGllcnJpY2sgQm91dmllcjxicj4NCiZndDvCoCDCoCDC
oCDCoCDCoCZsdDs8YSBocmVmPSJtYWlsdG86cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnIiB0
YXJnZXQ9Il9ibGFuayI+cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPC9hPjxicj4NCiZndDvC
oCDCoCDCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnBpZXJyaWNrLmJvdXZpZXJA
bGluYXJvLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZzwv
YT4mZ3Q7Jmd0OyB3cm90ZTo8YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oFRoZSBjdmQtaG9zdCBwYWNrYWdlIGluIHRoaXMgY2FzZSBhcmUgYmluYXJpZXMvbGlicmFyaWVz
PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGlsZWQgZm9yPGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgYWFyY2g2NCwgc28gaXQgY2FuIGJlIHVzZWQgb24gbGludXggYWFyY2g2
NCBhbmQgYmVuZWZpdCBmcm9tPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKga3ZtPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgYWNjZWxlcmF0aW9uLjxicj4NCiZndDsgPGJyPg0KJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgSW4geW91ciBjYXNlLCBydW5uaW5nIGVtdWxhdGlvbiBmcm9t
IGEgeDY0IGhvc3QsIHlvdSBuZWVkPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgY3ZkLWhv
c3RfcGFja2FnZS14ODZfNjQudGFyLmd6IGluc3RlYWQuPGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqBPbiA5LzIvMjQgMTU6MzgsIE1hcmlvIE1hcmlldHRvIHdyb3RlOjxi
cj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7IFVwZGF0ZSA6PGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxi
cj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoHppb21hcmlvQFozOTAtQU9SVVMtUFJPLURFU1Q6
L21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQvYW9zcF8xNC9hbmRyb2lkLWltYWdlL2JpbiQgbWtk
aXIgeDg2XzY0LWxpbnV4LW11c2w8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxi
cj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgemlvbWFyaW9AWjM5MC1BT1JVUy1QUk8tREVTVDovbW50L3pyb290LTEzMy9fT1MvQW5k
cm9pZC9hb3NwXzE0L2FuZHJvaWQtaW1hZ2UvYmluJCBjcCAvbW50L3pyb290LTEzMy9fT1MvQW5k
cm9pZC9hb3NwXzE0L2FuZHJvaWQtaW1hZ2UvYmluL2FhcmNoNjQtbGludXgtbXVzbC9jcm9zdm0g
L21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQvYW9zcF8xNC9hbmRyb2lkLWltYWdlL2Jpbi94ODZf
NjQtbGludXgtbXVzbDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqB6
aW9tYXJpb0BaMzkwLUFPUlVTLVBSTy1ERVNUOi9tbnQvenJvb3QtMTMzL19PUy9BbmRyb2lkL2Fv
c3BfMTQvYW5kcm9pZC1pbWFnZSQgSE9NRT0kKHB3ZCkgLi9iaW4vbGF1bmNoX2N2ZCAtdm1fbWFu
YWdlciBxZW11X2NsaSAtcmVwb3J0X2Fub255bW91c191c2FnZV9zdGF0cz1uIC0tc3RhcnRfd2Vi
cnRjPWZhbHNlPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
IFVuZm9ydHVuYXRlbHkgaXQgZG9lcyBub3Qgd29yayA6PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7IDA5LTAzIDAwOjAzOjI4LjkxNiAyNzM3MjExIDI3Mzcy
MTEgSSBsYXVuY2hfY3ZkOjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoG1haW4uY2M6MjM1
IFVzaW5nPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsgc3lzdGVtX2ltYWdlX2Rp
ciBvZjo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoD09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT08YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0
OyBOT1RJQ0U6PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0OyBCeSB1c2luZyB0aGlzIEFuZHJvaWQgVmlydHVhbCBEZXZp
Y2UsIHlvdSBhZ3JlZSB0bzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7IEdvb2ds
ZSBUZXJtcyBvZiBTZXJ2aWNlPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgKDxhIGhyZWY9
Imh0dHBzOi8vcG9saWNpZXMuZ29vZ2xlLmNvbS90ZXJtcyIgcmVsPSJub3JlZmVycmVyIiB0YXJn
ZXQ9Il9ibGFuayI+aHR0cHM6Ly9wb2xpY2llcy5nb29nbGUuY29tL3Rlcm1zPC9hPjxicj4NCiZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwczovL3BvbGljaWVzLmdvb2ds
ZS5jb20vdGVybXMiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vcG9s
aWNpZXMuZ29vZ2xlLmNvbS90ZXJtczwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDsgJmx0OzxhIGhyZWY9Imh0dHBzOi8vcG9saWNpZXMuZ29vZ2xlLmNvbS90ZXJtcyIg
cmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9wb2xpY2llcy5nb29nbGUu
Y29tL3Rlcm1zPC9hPjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVmPSJo
dHRwczovL3BvbGljaWVzLmdvb2dsZS5jb20vdGVybXMiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0
PSJfYmxhbmsiPmh0dHBzOi8vcG9saWNpZXMuZ29vZ2xlLmNvbS90ZXJtczwvYT4mZ3Q7Jmd0Oyku
PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsgVGhlIEdvb2dsZSBQcml2YWN5IFBv
bGljeTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCg8YSBocmVmPSJodHRwczovL3BvbGlj
aWVzLmdvb2dsZS5jb20vcHJpdmFjeSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+
aHR0cHM6Ly9wb2xpY2llcy5nb29nbGUuY29tL3ByaXZhY3k8L2E+PGJyPg0KJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHBzOi8vcG9saWNpZXMuZ29vZ2xlLmNvbS9wcml2
YWN5IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL3BvbGljaWVzLmdv
b2dsZS5jb20vcHJpdmFjeTwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZn
dDsgJmx0OzxhIGhyZWY9Imh0dHBzOi8vcG9saWNpZXMuZ29vZ2xlLmNvbS9wcml2YWN5IiByZWw9
Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL3BvbGljaWVzLmdvb2dsZS5jb20v
cHJpdmFjeTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0
cHM6Ly9wb2xpY2llcy5nb29nbGUuY29tL3ByaXZhY3kiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0
PSJfYmxhbmsiPmh0dHBzOi8vcG9saWNpZXMuZ29vZ2xlLmNvbS9wcml2YWN5PC9hPiZndDsmZ3Q7
KTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7IGRlc2NyaWJlcyBob3cgR29vZ2xl
IGhhbmRsZXMgaW5mb3JtYXRpb24gZ2VuZXJhdGVkIGFzIHlvdSB1c2U8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgJmd0OyBHb29nbGUgU2VydmljZXMuPGJyPg0KJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqA9PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PGJy
Pg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0OyBSZWFkaW5nIC0tY29uZmlnIG9wdGlvbiBmcm9tOjxicj4NCiZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgL21udC96cm9v
dC0xMzMvX09TL0FuZHJvaWQvYW9zcF8xNC9hbmRyb2lkLWltYWdlL2FuZHJvaWQtaW5mby50eHQ8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyBMYXVuY2hpbmcgQ1ZEIHVzaW5nIC0t
Y29uZmlnPSYjMzk7cGhvbmUmIzM5Oy48YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0
Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoC9tbnQvenJvb3QtMTMzL19PUy9BbmRyb2lk
L2Fvc3BfMTQvYW5kcm9pZC1pbWFnZS9iaW4vYWFyY2g2NC1saW51eC1nbnUvZ2Z4c3RyZWFtX2dy
YXBoaWNzX2RldGVjdG9yOiBlcnJvciB3aGlsZSBsb2FkaW5nIHNoYXJlZDxicj4NCiZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsg
bGlicmFyaWVzOiBsaWJjLnNvLjY6IGNhbm5vdCBvcGVuIHNoYXJlZCBvYmplY3QgZmlsZTogTm88
YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBzdWNoIGZpbGUgb3I8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgJmd0OyBkaXJlY3Rvcnk8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7IEZhaWxlZCB0byBydW4g
Z3JhcGhpY3MgZGV0ZWN0b3IsIGJhZCByZXR1cm4gdmFsdWU6IDEyNy48YnI+DQomZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqBBc3N1bWluZyBubzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAm
Z3Q7IGF2YWlsYWJpbGl0eS48YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyBHUFUg
YXV0byBtb2RlOiBkaWQgbm90IGRldGVjdCBwcmVyZXF1aXNpdGVzIGZvcjxicj4NCiZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoGFjY2VsZXJhdGVkIHJlbmRlcmluZzxicj4NCiZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7IHN1cHBvcnQsIGVuYWJsaW5nIC0tZ3B1X21vZGU9Z3Vlc3Rfc3dpZnRz
aGFkZXIuPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsgR1BVIHZob3N0IHVzZXIg
YXV0byBtb2RlOiBub3QgbmVlZGVkIGZvcjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoC0t
Z3B1X21vZGU9Z3Vlc3Rfc3dpZnRzaGFkZXIuPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDsgTm90IGVuYWJsaW5nIHZob3N0IHVzZXIgZ3B1Ljxicj4NCiZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7IFJlcXVlc3RlZCByZXN1bWluZyBhIHByZXZpb3VzIHNlc3Npb24gKHRoZSBk
ZWZhdWx0PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgYmVoYXZpb3IpIGJ1dCB0aGU8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyBiYXNlIGltYWdlcyBoYXZlIGNoYW5nZWQg
dW5kZXIgdGhlIG92ZXJsYXksIG1ha2luZyB0aGU8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqBvdmVybGF5PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsgaW5jb21wYXRpYmxl
LiBXaXBpbmcgdGhlIG92ZXJsYXkgZmlsZXMuPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyBQYXRoIGZvciBpbnN0YW5j
ZSBVRFM6IC90bXAvY2ZfYXZkXzEwMDA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0
Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7IFRoZSBmb2xsb3dpbmcgbGluZXMg
Y29udGFpbiB1c2VmdWwgZGVidWdnaW5nIGluZm9ybWF0aW9uOjxicj4NCiZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7wqAgwqBTZXJpYWwgY29uc29sZSBpcyBkaXNhYmxlZDsgdXNlIC1jb25z
b2xlPXRydWUgdG8gZW5hYmxlIGl0Ljxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
wqAgwqBMb2djYXQgb3V0cHV0Ojxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgL21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQvYW9z
cF8xNC9hbmRyb2lkLWltYWdlL2N1dHRsZWZpc2gvaW5zdGFuY2VzL2N2ZC0xL2xvZ3MvbG9nY2F0
PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoEtlcm5lbCBsb2c6PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAvbW50L3pyb290LTEzMy9fT1MvQW5kcm9pZC9hb3NwXzE0L2FuZHJvaWQtaW1hZ2UvY3V0dGxl
ZmlzaC9pbnN0YW5jZXMvY3ZkLTEva2VybmVsLmxvZzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7wqAgwqBMYXVuY2hlciBsb2c6PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAvbW50L3pyb290LTEzMy9fT1MvQW5k
cm9pZC9hb3NwXzE0L2FuZHJvaWQtaW1hZ2UvY3V0dGxlZmlzaC9pbnN0YW5jZXMvY3ZkLTEvbG9n
cy9sYXVuY2hlci5sb2c8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgSW5z
dGFuY2UgY29uZmlndXJhdGlvbjo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxi
cj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoC9tbnQvenJvb3QtMTMzL19PUy9BbmRyb2lkL2Fv
c3BfMTQvYW5kcm9pZC1pbWFnZS9jdXR0bGVmaXNoL2luc3RhbmNlcy9jdmQtMS9jdXR0bGVmaXNo
X2NvbmZpZy5qc29uPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoExhdW5j
aGVyIEJ1aWxkIElEOiAxMjMwOTI5Njxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
IDQuIG1haW4uY2M6MjMyfCBSdW5DdmRNYWlufDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7IDMuIG1haW4uY2M6MTA0fCBSdW58PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDsgMi4gc2VydmVyX2xvb3BfaW1wbC5jcHA6ODl8IFJ1bnw8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0OyAxLiBxZW11X21hbmFnZXIuY3BwOjI0N3wgU3RhcnRDb21tYW5kc3w8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyB8PGJyPg0KJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgZGV2aWNlL2dvb2dsZS9jdXR0bGVmaXNoL2hvc3QvbGlicy92bV9tYW5hZ2VyL3Fl
bXVfbWFuYWdlci5jcHA6OTc8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyB8IFJl
c3VsdCZsdDtzdGQ6OnBhaXImbHQ7aW50LCBpbnQmZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoGN1dHRsZWZpc2g6OnZtX21hbmFnZXI6Oihhbm9ueW1vdXM8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0OyBuYW1lc3BhY2UpOjpHZXRRZW11VmVyc2lvbihjb25zdCBz
dGQ6OnN0cmluZyAmYW1wOyk8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyB2IENG
X0VYUEVDVChxZW11X3ZlcnNpb25fcmV0ID09IDApPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAvbW50L3pyb290LTEzMy9fT1Mv
QW5kcm9pZC9hb3NwXzE0L2FuZHJvaWQtaW1hZ2UvYmluL2FhcmNoNjQtbGludXgtZ251L3FlbXUv
cWVtdS1zeXN0ZW0tYWFyY2g2NCAtdmVyc2lvbiByZXR1cm5lZCB1bmV4cGVjdGVkIHJlc3BvbnNl
IC48YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyBTdGRlcnIgd2FzPGJyPg0KJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAv
bW50L3pyb290LTEzMy9fT1MvQW5kcm9pZC9hb3NwXzE0L2FuZHJvaWQtaW1hZ2UvYmluL2FhcmNo
NjQtbGludXgtZ251L3FlbXUvcWVtdS1zeXN0ZW0tYWFyY2g2NDogZXJyb3Igd2hpbGUgbG9hZGlu
ZyBzaGFyZWQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCAmZ3Q7IGxpYnJhcmllczogbGlibmN1cnNlc3cuc28uNjogY2Fubm90
IG9wZW4gc2hhcmVkIG9iamVjdDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoGZpbGU6IE5v
IHN1Y2g8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyBmaWxlIG9yIGRpcmVjdG9y
eTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDsgT24gTW9uLCBTZXAgMiwgMjAyNCBhdCAxMTozMOKAr1BNIE1hcmlvIE1h
cmlldHRvPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Im1haWx0bzpt
YXJpZXR0bzIwMDhAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+bWFyaWV0dG8yMDA4QGdtYWls
LmNvbTwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86bWFyaWV0dG8yMDA4QGdtYWlsLmNv
bSIgdGFyZ2V0PSJfYmxhbmsiPm1hcmlldHRvMjAwOEBnbWFpbC5jb208L2E+Jmd0Ozxicj4NCiZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOm1h
cmlldHRvMjAwOEBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5tYXJpZXR0bzIwMDhAZ21haWwu
Y29tPC9hPjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0i
bWFpbHRvOm1hcmlldHRvMjAwOEBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5tYXJpZXR0bzIw
MDhAZ21haWwuY29tPC9hPiZndDsmZ3Q7Jmd0OyB3cm90ZTo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqBT
b21ldGhpbmcgaXMgbm90IHJpZ2h0IDo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0
Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqA8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqB6aW9tYXJpb0BaMzkwLUFPUlVTLVBSTy1ERVNUOi9tbnQvenJvb3Qt
MTMzL19PUy9BbmRyb2lkL2Fvc3BfMTQvYW5kcm9pZC1pbWFnZSQgdW56aXAgLi4vYW9zcF9jZl8q
LnppcDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoEFyY2hpdmU6IMKgLi4vYW9zcF9jZl9hcm02NF9vbmx5
X3Bob25lLWltZy0xMjMwOTI5Ni56aXA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgaW5mbGF0aW5nOiBhbmRyb2lkLWluZm8udHh0PGJyPg0KJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoGluZmxhdGluZzogZmFzdGJvb3QtaW5mby50eHQ8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgaW5mbGF0aW5nOiBr
ZXJuZWxfMTZrPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoGlu
ZmxhdGluZzogcmFtZGlza18xNmsuaW1nPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoGluZmxhdGluZzogYm9vdC5pbWc8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgaW5mbGF0aW5nOiBib290XzE2ay5pbWc8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgaW5mbGF0aW5nOiBib290bG9hZGVyPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoGluZmxhdGluZzogaW5p
dF9ib290LmltZzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqBp
bmZsYXRpbmc6IHVzZXJkYXRhLmltZzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqBpbmZsYXRpbmc6IHZibWV0YS5pbWc8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgaW5mbGF0aW5nOiB2Ym1ldGFfc3lzdGVtLmltZzxicj4NCiZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqBpbmZsYXRpbmc6IHZibWV0YV9z
eXN0ZW1fZGxrbS5pbWc8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgaW5mbGF0aW5nOiB2Ym1ldGFfdmVuZG9yX2Rsa20uaW1nPGJyPg0KJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoGluZmxhdGluZzogdmVuZG9yX2Jvb3QuaW1nPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoGluZmxhdGluZzogc3VwZXIu
aW1nPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0O8KgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgemlv
bWFyaW9AWjM5MC1BT1JVUy1QUk8tREVTVDovbW50L3pyb290LTEzMy9fT1MvQW5kcm9pZC9hb3Nw
XzE0L2FuZHJvaWQtaW1hZ2UkIHRhciB4enZmIC4uL2N2ZC1ob3N0X3BhY2thZ2UudGFyLmd6PGJy
Pg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuLzxi
cj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0Lzxicj4NCiZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0LzxhIGhyZWY9Im1haWx0
bzphbmRyb2lkLmhhcmR3YXJlLmtleW1hc3RlckAzLjAuc28iIHRhcmdldD0iX2JsYW5rIj5hbmRy
b2lkLmhhcmR3YXJlLmtleW1hc3RlckAzLjAuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86YW5kcm9pZC5oYXJkd2FyZS5rZXltYXN0
ZXJAMy4wLnNvIiB0YXJnZXQ9Il9ibGFuayI+YW5kcm9pZC5oYXJkd2FyZS5rZXltYXN0ZXJAMy4w
LnNvPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgJmx0
O21haWx0bzo8YSBocmVmPSJtYWlsdG86YW5kcm9pZC5oYXJkd2FyZS5rZXltYXN0ZXJAMy4wLnNv
IiB0YXJnZXQ9Il9ibGFuayI+YW5kcm9pZC5oYXJkd2FyZS5rZXltYXN0ZXJAMy4wLnNvPC9hPjxi
cj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmFu
ZHJvaWQuaGFyZHdhcmUua2V5bWFzdGVyQDMuMC5zbyIgdGFyZ2V0PSJfYmxhbmsiPmFuZHJvaWQu
aGFyZHdhcmUua2V5bWFzdGVyQDMuMC5zbzwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0LzxhIGhyZWY9Imh0dHA6Ly9saWJjaWJvcml1
bV9pby5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+bGliY2lib3Jp
dW1faW8uZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0OzxhIGhy
ZWY9Imh0dHA6Ly9saWJjaWJvcml1bV9pby5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJn
ZXQ9Il9ibGFuayI+aHR0cDovL2xpYmNpYm9yaXVtX2lvLmR5bGliLnNvPC9hPiZndDs8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmNpYm9yaXVtX2lv
LmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliY2li
b3JpdW1faW8uZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0Ozxh
IGhyZWY9Imh0dHA6Ly9saWJjaWJvcml1bV9pby5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0
YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmNpYm9yaXVtX2lvLmR5bGliLnNvPC9hPiZndDsmZ3Q7
PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvbGlianBl
Zy5zbzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L2N1
dHRsZWZpc2hfbmV0LnNvPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDC
oC4vbGliNjQvbGliYmFzZS5zbzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAuL2xpYjY0LzxhIGhyZWY9Imh0dHA6Ly92dWxrYW4ucGFzdGVsLnNvIiByZWw9Im5vcmVm
ZXJyZXIiIHRhcmdldD0iX2JsYW5rIj52dWxrYW4ucGFzdGVsLnNvPC9hPiAmbHQ7PGEgaHJlZj0i
aHR0cDovL3Z1bGthbi5wYXN0ZWwuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsi
Pmh0dHA6Ly92dWxrYW4ucGFzdGVsLnNvPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL3Z1bGthbi5wYXN0ZWwuc28iIHJlbD0ibm9yZWZlcnJl
ciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly92dWxrYW4ucGFzdGVsLnNvPC9hPiAmbHQ7PGEgaHJl
Zj0iaHR0cDovL3Z1bGthbi5wYXN0ZWwuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxh
bmsiPmh0dHA6Ly92dWxrYW4ucGFzdGVsLnNvPC9hPiZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvbGliY3V0dGxlZmlzaF9ob3N0X2NvbmZp
Zy5zbzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0Lzxh
IGhyZWY9Imh0dHA6Ly9saWJmbGFnc2V0LmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdl
dD0iX2JsYW5rIj5saWJmbGFnc2V0LmR5bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGliZmxhZ3NldC5keWxpYi5zbyIgcmVsPSJub3Jl
ZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmZsYWdzZXQuZHlsaWIuc288L2E+Jmd0
OyAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmZsYWdzZXQuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJl
ciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJmbGFnc2V0LmR5bGliLnNvPC9hPjxicj4NCiZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGliZmxhZ3NldC5keWxp
Yi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmZsYWdzZXQu
ZHlsaWIuc288L2E+Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8Kg
IMKgIMKgLi9saWI2NC88YSBocmVmPSJodHRwOi8vbGlia21yX2NvbW1vbi5keWxpYi5zbyIgcmVs
PSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+bGlia21yX2NvbW1vbi5keWxpYi5zbzwvYT48
YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmttcl9j
b21tb24uZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9s
aWJrbXJfY29tbW9uLmR5bGliLnNvPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmttcl9jb21tb24uZHlsaWIuc28iIHJlbD0ibm9yZWZl
cnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJrbXJfY29tbW9uLmR5bGliLnNvPC9hPiAm
bHQ7PGEgaHJlZj0iaHR0cDovL2xpYmttcl9jb21tb24uZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJl
ciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJrbXJfY29tbW9uLmR5bGliLnNvPC9hPiZndDsm
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvPGEg
aHJlZj0iaHR0cDovL2xpYnBrY3MxLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0i
X2JsYW5rIj5saWJwa2NzMS5keWxpYi5zbzwvYT4gJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJwa2Nz
MS5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYnBr
Y3MxLmR5bGliLnNvPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEg
aHJlZj0iaHR0cDovL2xpYnBrY3MxLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0i
X2JsYW5rIj5odHRwOi8vbGlicGtjczEuZHlsaWIuc288L2E+ICZsdDs8YSBocmVmPSJodHRwOi8v
bGlicGtjczEuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6
Ly9saWJwa2NzMS5keWxpYi5zbzwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L2xpYmljdWkxOG4taG9zdC5zbzxicj4NCiZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L2xpYndheWxhbmRfY2xpZW50LnNv
PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvbGlidW53
aW5kc3RhY2suc288YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9s
aWI2NC88YSBocmVmPSJodHRwOi8vbGlia21yX3RhLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIi
IHRhcmdldD0iX2JsYW5rIj5saWJrbXJfdGEuZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJrbXJfdGEuZHlsaWIuc28iIHJlbD0i
bm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJrbXJfdGEuZHlsaWIuc288L2E+
Jmd0OyAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmttcl90YS5keWxpYi5zbyIgcmVsPSJub3JlZmVy
cmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmttcl90YS5keWxpYi5zbzwvYT48YnI+DQom
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmttcl90YS5keWxp
Yi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmttcl90YS5k
eWxpYi5zbzwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAuL2xpYjY0LzxhIGhyZWY9Imh0dHA6Ly9saWJjb3NldC5keWxpYi5zbyIgcmVsPSJub3Jl
ZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+bGliY29zZXQuZHlsaWIuc288L2E+ICZsdDs8YSBocmVm
PSJodHRwOi8vbGliY29zZXQuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxh
bmsiPmh0dHA6Ly9saWJjb3NldC5keWxpYi5zbzwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJjb3NldC5keWxpYi5zbyIgcmVsPSJub3Jl
ZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmNvc2V0LmR5bGliLnNvPC9hPiAmbHQ7
PGEgaHJlZj0iaHR0cDovL2xpYmNvc2V0LmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdl
dD0iX2JsYW5rIj5odHRwOi8vbGliY29zZXQuZHlsaWIuc288L2E+Jmd0OyZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC9saWJjcHBib3Iuc288YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC9saWJnYXRla2Vl
cGVyLnNvPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQv
bGlieXV2LnNvPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGli
NjQvbGliZ3JwYysrLnNvPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDC
oC4vbGliNjQvbGlia21yX2NmX2ZmaS5zbzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAuL2xpYjY0L2xpYmNwcGNvc2VfcmtwLnNvPGJyPg0KJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvbGliY3V0dGxlZmlzaF90cmFuc3BvcnQuc288
YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC9saWJsem1h
LnNvPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvPGEg
aHJlZj0iaHR0cDovL2xpYmNpYm9yaXVtX2xsLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRh
cmdldD0iX2JsYW5rIj5saWJjaWJvcml1bV9sbC5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmNpYm9yaXVtX2xsLmR5bGliLnNv
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliY2lib3JpdW1fbGwu
ZHlsaWIuc288L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVm
PSJodHRwOi8vbGliY2lib3JpdW1fbGwuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0
PSJfYmxhbmsiPmh0dHA6Ly9saWJjaWJvcml1bV9sbC5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmNpYm9yaXVtX2xsLmR5bGli
LnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliY2lib3JpdW1f
bGwuZHlsaWIuc288L2E+Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0
O8KgIMKgIMKgLi9saWI2NC9saWJjdXR0bGVmaXNoX2FsbG9jZF91dGlscy5zbzxicj4NCiZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L2xpYmdmbGFncy5zbzxicj4N
CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0LzxhIGhyZWY9Im1h
aWx0bzphbmRyb2lkLmhhcmR3YXJlLmtleW1hc3RlckA0LjAuc28iIHRhcmdldD0iX2JsYW5rIj5h
bmRyb2lkLmhhcmR3YXJlLmtleW1hc3RlckA0LjAuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86YW5kcm9pZC5oYXJkd2FyZS5rZXlt
YXN0ZXJANC4wLnNvIiB0YXJnZXQ9Il9ibGFuayI+YW5kcm9pZC5oYXJkd2FyZS5rZXltYXN0ZXJA
NC4wLnNvPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKg
Jmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86YW5kcm9pZC5oYXJkd2FyZS5rZXltYXN0ZXJANC4w
LnNvIiB0YXJnZXQ9Il9ibGFuayI+YW5kcm9pZC5oYXJkd2FyZS5rZXltYXN0ZXJANC4wLnNvPC9h
Pjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRv
OmFuZHJvaWQuaGFyZHdhcmUua2V5bWFzdGVyQDQuMC5zbyIgdGFyZ2V0PSJfYmxhbmsiPmFuZHJv
aWQuaGFyZHdhcmUua2V5bWFzdGVyQDQuMC5zbzwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0LzxhIGhyZWY9Imh0dHA6Ly9saWJjZmdf
aWYuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmxpYmNmZ19pZi5k
eWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0
cDovL2xpYmNmZ19pZi5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+
aHR0cDovL2xpYmNmZ19pZi5keWxpYi5zbzwvYT4mZ3Q7ICZsdDs8YSBocmVmPSJodHRwOi8vbGli
Y2ZnX2lmLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8v
bGliY2ZnX2lmLmR5bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8
YSBocmVmPSJodHRwOi8vbGliY2ZnX2lmLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdl
dD0iX2JsYW5rIj5odHRwOi8vbGliY2ZnX2lmLmR5bGliLnNvPC9hPiZndDsmZ3Q7PGJyPg0KJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvPGEgaHJlZj0iaHR0cDov
L2xpYnNwa2kuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmxpYnNw
a2kuZHlsaWIuc288L2E+ICZsdDs8YSBocmVmPSJodHRwOi8vbGlic3BraS5keWxpYi5zbyIgcmVs
PSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYnNwa2kuZHlsaWIuc288L2E+
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGli
c3BraS5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xp
YnNwa2kuZHlsaWIuc288L2E+ICZsdDs8YSBocmVmPSJodHRwOi8vbGlic3BraS5keWxpYi5zbyIg
cmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYnNwa2kuZHlsaWIuc288
L2E+Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9s
aWI2NC88YSBocmVmPSJodHRwOi8vbGliemVyb2l6ZS5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVy
IiB0YXJnZXQ9Il9ibGFuayI+bGliemVyb2l6ZS5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYnplcm9pemUuZHlsaWIuc28iIHJl
bD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJ6ZXJvaXplLmR5bGliLnNv
PC9hPiZndDsgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJ6ZXJvaXplLmR5bGliLnNvIiByZWw9Im5v
cmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliemVyb2l6ZS5keWxpYi5zbzwvYT48
YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYnplcm9p
emUuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJ6
ZXJvaXplLmR5bGliLnNvPC9hPiZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDvCoCDCoCDCoC4vbGliNjQvbGliY2dyb3VwcmMuc288YnI+DQomZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC9saWJwcm90b2J1Zi1jcHAtZnVsbC5zbzxicj4N
CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L2xpYmN1dGlscy5z
bzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L2xpYnNx
bGl0ZS5zbzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0
L2xpYmN1dHRsZWZpc2hfdXRpbHNfcmVzdWx0LnNvPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDvCoCDCoCDCoC4vbGliNjQvbGliYmluZGVyX25kay5zbzxicj4NCiZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L2xpYmV4dDJfdXVpZC1ob3N0LnNvPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvPGEgaHJlZj0i
aHR0cDovL2xpYmhleC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+
bGliaGV4LmR5bGliLnNvPC9hPiAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmhleC5keWxpYi5zbyIg
cmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmhleC5keWxpYi5zbzwv
YT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9s
aWJoZXguZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9s
aWJoZXguZHlsaWIuc288L2E+ICZsdDs8YSBocmVmPSJodHRwOi8vbGliaGV4LmR5bGliLnNvIiBy
ZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliaGV4LmR5bGliLnNvPC9h
PiZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGli
NjQvbGliY19tdXNsLnNvPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDC
oC4vbGliNjQvPGEgaHJlZj0iaHR0cDovL2xpYmNvbnN0X29pZC5keWxpYi5zbyIgcmVsPSJub3Jl
ZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+bGliY29uc3Rfb2lkLmR5bGliLnNvPC9hPjxicj4NCiZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGliY29uc3Rfb2lkLmR5
bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliY29uc3Rf
b2lkLmR5bGliLnNvPC9hPiZndDsgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJjb25zdF9vaWQuZHls
aWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJjb25zdF9v
aWQuZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9
Imh0dHA6Ly9saWJjb25zdF9vaWQuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJf
YmxhbmsiPmh0dHA6Ly9saWJjb25zdF9vaWQuZHlsaWIuc288L2E+Jmd0OyZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC88YSBocmVmPSJodHRwOi8v
bGlicHJvdG9idWZfc3VwcG9ydC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9i
bGFuayI+bGlicHJvdG9idWZfc3VwcG9ydC5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYnByb3RvYnVmX3N1cHBvcnQuZHlsaWIu
c28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJwcm90b2J1Zl9z
dXBwb3J0LmR5bGliLnNvPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0
O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJwcm90b2J1Zl9zdXBwb3J0LmR5bGliLnNv
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlicHJvdG9idWZfc3Vw
cG9ydC5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJl
Zj0iaHR0cDovL2xpYnByb3RvYnVmX3N1cHBvcnQuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIg
dGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJwcm90b2J1Zl9zdXBwb3J0LmR5bGliLnNvPC9hPiZn
dDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQv
dHBtMi10c3MyLXRjdGkuc288YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKg
IMKgLi9saWI2NC88YSBocmVmPSJodHRwOi8vbGlic2VyZGUuZHlsaWIuc28iIHJlbD0ibm9yZWZl
cnJlciIgdGFyZ2V0PSJfYmxhbmsiPmxpYnNlcmRlLmR5bGliLnNvPC9hPiAmbHQ7PGEgaHJlZj0i
aHR0cDovL2xpYnNlcmRlLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5r
Ij5odHRwOi8vbGlic2VyZGUuZHlsaWIuc288L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlic2VyZGUuZHlsaWIuc28iIHJlbD0ibm9yZWZl
cnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJzZXJkZS5keWxpYi5zbzwvYT4gJmx0Ozxh
IGhyZWY9Imh0dHA6Ly9saWJzZXJkZS5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9
Il9ibGFuayI+aHR0cDovL2xpYnNlcmRlLmR5bGliLnNvPC9hPiZndDsmZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvbGliYXJ0cGFsZXR0ZS5zbzxi
cj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L2xpYmxvZy5z
bzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0LzxhIGhy
ZWY9Imh0dHA6Ly9saWJvbmNlX2NlbGwuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0
PSJfYmxhbmsiPmxpYm9uY2VfY2VsbC5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYm9uY2VfY2VsbC5keWxpYi5zbyIgcmVsPSJu
b3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYm9uY2VfY2VsbC5keWxpYi5zbzwv
YT4mZ3Q7ICZsdDs8YSBocmVmPSJodHRwOi8vbGlib25jZV9jZWxsLmR5bGliLnNvIiByZWw9Im5v
cmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlib25jZV9jZWxsLmR5bGliLnNvPC9h
Pjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlib25j
ZV9jZWxsLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8v
bGlib25jZV9jZWxsLmR5bGliLnNvPC9hPiZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvPGEgaHJlZj0iaHR0cDovL2xpYnRoaXNlcnJvci5k
eWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+bGlidGhpc2Vycm9yLmR5
bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRw
Oi8vbGlidGhpc2Vycm9yLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5r
Ij5odHRwOi8vbGlidGhpc2Vycm9yLmR5bGliLnNvPC9hPiZndDsgJmx0OzxhIGhyZWY9Imh0dHA6
Ly9saWJ0aGlzZXJyb3IuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsi
Pmh0dHA6Ly9saWJ0aGlzZXJyb3IuZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJ0aGlzZXJyb3IuZHlsaWIuc28iIHJlbD0ibm9y
ZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJ0aGlzZXJyb3IuZHlsaWIuc288L2E+
Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2
NC9saWJzc2wtaG9zdC5zbzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAuL2xpYjY0L2xpYmMrKy5zbzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAuL2xpYjY0L2xpYmV4dDRfdXRpbHMuc288YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmd0O8KgIMKgIMKgLi9saWI2NC88YSBocmVmPSJodHRwOi8vbGlicGtjczguZHlsaWIuc28i
IHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmxpYnBrY3M4LmR5bGliLnNvPC9hPiAm
bHQ7PGEgaHJlZj0iaHR0cDovL2xpYnBrY3M4LmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRh
cmdldD0iX2JsYW5rIj5odHRwOi8vbGlicGtjczguZHlsaWIuc288L2E+Jmd0Ozxicj4NCiZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlicGtjczguZHlsaWIuc28i
IHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJwa2NzOC5keWxpYi5z
bzwvYT4gJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJwa2NzOC5keWxpYi5zbyIgcmVsPSJub3JlZmVy
cmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYnBrY3M4LmR5bGliLnNvPC9hPiZndDsmZ3Q7
PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvbGlic3Bh
cnNlLWhvc3Quc288YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9s
aWI2NC9zYW5kYm94ZWRfYXBpX3NhbmRib3gyLnNvPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDvCoCDCoCDCoC4vbGliNjQvbGliY3V0dGxlZmlzaF9jb21tYW5kX3V0aWwuc288YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC88YSBocmVmPSJo
dHRwOi8vbGliYnNzbF9zeXMuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxh
bmsiPmxpYmJzc2xfc3lzLmR5bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCZsdDs8YSBocmVmPSJodHRwOi8vbGliYnNzbF9zeXMuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJl
ciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJic3NsX3N5cy5keWxpYi5zbzwvYT4mZ3Q7ICZs
dDs8YSBocmVmPSJodHRwOi8vbGliYnNzbF9zeXMuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIg
dGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJic3NsX3N5cy5keWxpYi5zbzwvYT48YnI+DQomZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmJzc2xfc3lzLmR5bGli
LnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliYnNzbF9zeXMu
ZHlsaWIuc288L2E+Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8Kg
IMKgIMKgLi9saWI2NC9saWJrZXltYXN0ZXJfbWVzc2FnZXMuc288YnI+DQomZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC9saWJjdXR0bGVmaXNoX3dlYi5zbzxicj4N
CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L2xpYnZweC5zbzxi
cj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L2xpYm9wdXMu
c288YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC9saWJt
aW5pamFpbC5zbzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xp
YjY0L2xpYmN1cmwtaG9zdC5zbzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAuL2xpYjY0L2xpYmN1dHRsZWZpc2hfa2VybmVsX2xvZ19tb25pdG9yX3V0aWxzLnNvPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvdHBtMi10c3My
LXV0aWwuc288YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2
NC88YSBocmVmPSJodHRwOi8vbGlibGliYy5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJn
ZXQ9Il9ibGFuayI+bGlibGliYy5keWxpYi5zbzwvYT4gJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJs
aWJjLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGli
bGliYy5keWxpYi5zbzwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0Ozxh
IGhyZWY9Imh0dHA6Ly9saWJsaWJjLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0i
X2JsYW5rIj5odHRwOi8vbGlibGliYy5keWxpYi5zbzwvYT4gJmx0OzxhIGhyZWY9Imh0dHA6Ly9s
aWJsaWJjLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8v
bGlibGliYy5keWxpYi5zbzwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAuL2xpYjY0LzxhIGhyZWY9Imh0dHA6Ly9saWJwcm90b2J1Zi5keWxpYi5z
byIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+bGlicHJvdG9idWYuZHlsaWIuc288
L2E+PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJw
cm90b2J1Zi5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDov
L2xpYnByb3RvYnVmLmR5bGliLnNvPC9hPiZndDsgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJwcm90
b2J1Zi5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xp
YnByb3RvYnVmLmR5bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8
YSBocmVmPSJodHRwOi8vbGlicHJvdG9idWYuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFy
Z2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJwcm90b2J1Zi5keWxpYi5zbzwvYT4mZ3Q7Jmd0Ozxicj4N
CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0LzxhIGhyZWY9Imh0
dHA6Ly9saWJiaXRmbGFncy5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFu
ayI+bGliYml0ZmxhZ3MuZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
Jmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJiaXRmbGFncy5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVy
IiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmJpdGZsYWdzLmR5bGliLnNvPC9hPiZndDsgJmx0
OzxhIGhyZWY9Imh0dHA6Ly9saWJiaXRmbGFncy5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0
YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmJpdGZsYWdzLmR5bGliLnNvPC9hPjxicj4NCiZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGliYml0ZmxhZ3MuZHlsaWIu
c28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJiaXRmbGFncy5k
eWxpYi5zbzwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAuL2xpYjY0L2xpYnV0aWxzLnNvPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZn
dDvCoCDCoCDCoC4vbGliNjQvbGlianNvbmNwcC5zbzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L2xpYmV4dDJfYmxraWQtaG9zdC5zbzxicj4NCiZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L2xpYm5sLnNvPGJyPg0KJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvdHBtMi10c3MyLXN5cy5z
bzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L2xpYmFy
dGJhc2Uuc288YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2
NC9saWJ4bWwyLnNvPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4v
bGliNjQvPGEgaHJlZj0iaHR0cDovL2xpYmttcl9wcm90b19ydXN0LmR5bGliLnNvIiByZWw9Im5v
cmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5saWJrbXJfcHJvdG9fcnVzdC5keWxpYi5zbzwvYT48
YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmttcl9w
cm90b19ydXN0LmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRw
Oi8vbGlia21yX3Byb3RvX3J1c3QuZHlsaWIuc288L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlia21yX3Byb3RvX3J1c3QuZHlsaWIuc28i
IHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJrbXJfcHJvdG9fcnVz
dC5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0i
aHR0cDovL2xpYmttcl9wcm90b19ydXN0LmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdl
dD0iX2JsYW5rIj5odHRwOi8vbGlia21yX3Byb3RvX3J1c3QuZHlsaWIuc288L2E+Jmd0OyZndDs8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC9saWJjdXR0
bGVmaXNoX3NlY3VyaXR5LnNvPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDC
oCDCoC4vbGliNjQvPGEgaHJlZj0iaHR0cDovL2xpYnNlY3VyZV9lbnZfdHBtLmR5bGliLnNvIiBy
ZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5saWJzZWN1cmVfZW52X3RwbS5keWxpYi5z
bzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xp
YnNlY3VyZV9lbnZfdHBtLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5r
Ij5odHRwOi8vbGlic2VjdXJlX2Vudl90cG0uZHlsaWIuc288L2E+Jmd0Ozxicj4NCiZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlic2VjdXJlX2Vudl90cG0uZHls
aWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJzZWN1cmVf
ZW52X3RwbS5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEg
aHJlZj0iaHR0cDovL2xpYnNlY3VyZV9lbnZfdHBtLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIi
IHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlic2VjdXJlX2Vudl90cG0uZHlsaWIuc288L2E+Jmd0
OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC9s
aWJ6LWhvc3Quc288YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9s
aWI2NC9saWJwcm9jZXNzZ3JvdXAuc288YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0
O8KgIMKgIMKgLi9saWI2NC9saWJjcnlwdG9fdXRpbHMuc288YnI+DQomZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC88YSBocmVmPSJodHRwOi8vbGliZGVyLmR5bGli
LnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5saWJkZXIuZHlsaWIuc288L2E+
ICZsdDs8YSBocmVmPSJodHRwOi8vbGliZGVyLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRh
cmdldD0iX2JsYW5rIj5odHRwOi8vbGliZGVyLmR5bGliLnNvPC9hPiZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmRlci5keWxpYi5zbyIgcmVs
PSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmRlci5keWxpYi5zbzwvYT4g
Jmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJkZXIuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFy
Z2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJkZXIuZHlsaWIuc288L2E+Jmd0OyZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC9saWJkZXhmaWxlLnNvPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvY2ZfbWV0cmlj
c19wcm90by5zbzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xp
YjY0L3RwbTItdHNzMi1lc3lzLnNvPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvC
oCDCoCDCoC4vbGliNjQvbGliY3V0dGxlZmlzaF91dGlscy5zbzxicj4NCiZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L2xpYmtleW1hc3Rlcl9wb3J0YWJsZS5zbzxi
cj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L2xpYmZydWl0
LnNvPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvdHBt
Mi10c3MyLXJjLnNvPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4v
bGliNjQvbGliY2FwLnNvPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDC
oC4vbGliNjQvPGEgaHJlZj0iaHR0cDovL2xpYm5peC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVy
IiB0YXJnZXQ9Il9ibGFuayI+bGlibml4LmR5bGliLnNvPC9hPiAmbHQ7PGEgaHJlZj0iaHR0cDov
L2xpYm5peC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDov
L2xpYm5peC5keWxpYi5zbzwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0
OzxhIGhyZWY9Imh0dHA6Ly9saWJuaXguZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0
PSJfYmxhbmsiPmh0dHA6Ly9saWJuaXguZHlsaWIuc288L2E+ICZsdDs8YSBocmVmPSJodHRwOi8v
bGlibml4LmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8v
bGlibml4LmR5bGliLnNvPC9hPiZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDvCoCDCoCDCoC4vbGliNjQvbGliaWN1dWMtaG9zdC5zbzxicj4NCiZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L2xpYnppcGFyY2hpdmUuc288YnI+DQomZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC88YSBocmVmPSJodHRwOi8v
bGlia21yX3RhX25vbnNlY3VyZS5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9i
bGFuayI+bGlia21yX3RhX25vbnNlY3VyZS5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYmttcl90YV9ub25zZWN1cmUuZHlsaWIu
c28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJrbXJfdGFfbm9u
c2VjdXJlLmR5bGliLnNvPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0
O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJrbXJfdGFfbm9uc2VjdXJlLmR5bGliLnNv
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlia21yX3RhX25vbnNl
Y3VyZS5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJl
Zj0iaHR0cDovL2xpYmttcl90YV9ub25zZWN1cmUuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIg
dGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJrbXJfdGFfbm9uc2VjdXJlLmR5bGliLnNvPC9hPiZn
dDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQv
PGEgaHJlZj0iaHR0cDovL2xpYnN0ZC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9
Il9ibGFuayI+bGlic3RkLmR5bGliLnNvPC9hPiAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYnN0ZC5k
eWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYnN0ZC5k
eWxpYi5zbzwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9
Imh0dHA6Ly9saWJzdGQuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsi
Pmh0dHA6Ly9saWJzdGQuZHlsaWIuc288L2E+ICZsdDs8YSBocmVmPSJodHRwOi8vbGlic3RkLmR5
bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlic3RkLmR5
bGliLnNvPC9hPiZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDC
oCDCoC4vbGliNjQvPGEgaHJlZj0iaHR0cDovL2xpYmhhbGYuZHlsaWIuc28iIHJlbD0ibm9yZWZl
cnJlciIgdGFyZ2V0PSJfYmxhbmsiPmxpYmhhbGYuZHlsaWIuc288L2E+ICZsdDs8YSBocmVmPSJo
dHRwOi8vbGliaGFsZi5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+
aHR0cDovL2xpYmhhbGYuZHlsaWIuc288L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGliaGFsZi5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVy
IiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmhhbGYuZHlsaWIuc288L2E+ICZsdDs8YSBocmVm
PSJodHRwOi8vbGliaGFsZi5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFu
ayI+aHR0cDovL2xpYmhhbGYuZHlsaWIuc288L2E+Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC90cG0yLXRzczItbXUuc288YnI+DQomZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9saWI2NC88YSBocmVmPSJodHRwOi8v
bGlibWVtb2Zmc2V0LmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5s
aWJtZW1vZmZzZXQuZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0
OzxhIGhyZWY9Imh0dHA6Ly9saWJtZW1vZmZzZXQuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIg
dGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJtZW1vZmZzZXQuZHlsaWIuc288L2E+Jmd0OyAmbHQ7
PGEgaHJlZj0iaHR0cDovL2xpYm1lbW9mZnNldC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0
YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYm1lbW9mZnNldC5keWxpYi5zbzwvYT48YnI+DQomZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cDovL2xpYm1lbW9mZnNldC5keWxp
Yi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYm1lbW9mZnNl
dC5keWxpYi5zbzwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAuL2xpYjY0L2xpYmxwLnNvPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZn
dDvCoCDCoCDCoC4vbGliNjQvbGliY3V0dGxlZmlzaF9mcy5zbzxicj4NCiZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L2xpYlByb3h5Q29uZmlnLnNvPGJyPg0KJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvPGEgaHJlZj0iaHR0cDov
L2xpYm9wZW5zc2wuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmxp
Ym9wZW5zc2wuZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0Ozxh
IGhyZWY9Imh0dHA6Ly9saWJvcGVuc3NsLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdl
dD0iX2JsYW5rIj5odHRwOi8vbGlib3BlbnNzbC5keWxpYi5zbzwvYT4mZ3Q7ICZsdDs8YSBocmVm
PSJodHRwOi8vbGlib3BlbnNzbC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9i
bGFuayI+aHR0cDovL2xpYm9wZW5zc2wuZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJvcGVuc3NsLmR5bGliLnNvIiByZWw9Im5v
cmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlib3BlbnNzbC5keWxpYi5zbzwvYT4m
Z3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0
LzxhIGhyZWY9Imh0dHA6Ly9saWJrbXJfd2lyZS5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0
YXJnZXQ9Il9ibGFuayI+bGlia21yX3dpcmUuZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJrbXJfd2lyZS5keWxpYi5zbyIgcmVs
PSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmttcl93aXJlLmR5bGliLnNv
PC9hPiZndDsgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJrbXJfd2lyZS5keWxpYi5zbyIgcmVsPSJu
b3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmttcl93aXJlLmR5bGliLnNvPC9h
Pjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlia21y
X3dpcmUuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9s
aWJrbXJfd2lyZS5keWxpYi5zbzwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0LzxhIGhyZWY9Imh0dHA6Ly9saWJrbXJfY3J5cHRvX2Jv
cmluZy5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+bGlia21yX2Ny
eXB0b19ib3JpbmcuZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0
OzxhIGhyZWY9Imh0dHA6Ly9saWJrbXJfY3J5cHRvX2JvcmluZy5keWxpYi5zbyIgcmVsPSJub3Jl
ZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmttcl9jcnlwdG9fYm9yaW5nLmR5bGli
LnNvPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgJmx0
OzxhIGhyZWY9Imh0dHA6Ly9saWJrbXJfY3J5cHRvX2JvcmluZy5keWxpYi5zbyIgcmVsPSJub3Jl
ZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmttcl9jcnlwdG9fYm9yaW5nLmR5bGli
LnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8v
bGlia21yX2NyeXB0b19ib3JpbmcuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJf
YmxhbmsiPmh0dHA6Ly9saWJrbXJfY3J5cHRvX2JvcmluZy5keWxpYi5zbzwvYT4mZ3Q7Jmd0Ozxi
cj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0LzxhIGhyZWY9
Imh0dHA6Ly9saWJsb2dfcnVzdC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9i
bGFuayI+bGlibG9nX3J1c3QuZHlsaWIuc288L2E+PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJsb2dfcnVzdC5keWxpYi5zbyIgcmVsPSJub3JlZmVy
cmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmxvZ19ydXN0LmR5bGliLnNvPC9hPiZndDsg
Jmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJsb2dfcnVzdC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVy
IiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmxvZ19ydXN0LmR5bGliLnNvPC9hPjxicj4NCiZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlibG9nX3J1c3QuZHls
aWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJsb2dfcnVz
dC5keWxpYi5zbzwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAuL2xpYjY0L2xpYmhpZGxiYXNlLnNvPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDvCoCDCoCDCoC4vbGliNjQvbGliZ3JwY193cmFwLnNvPGJyPg0KJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvbGliZ3JwYysrX3Vuc2VjdXJlLnNvPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvPGEgaHJlZj0i
aHR0cDovL2xpYmJ5dGVzLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5r
Ij5saWJieXRlcy5keWxpYi5zbzwvYT4gJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJieXRlcy5keWxp
Yi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmJ5dGVzLmR5
bGliLnNvPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0i
aHR0cDovL2xpYmJ5dGVzLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5r
Ij5odHRwOi8vbGliYnl0ZXMuZHlsaWIuc288L2E+ICZsdDs8YSBocmVmPSJodHRwOi8vbGliYnl0
ZXMuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saWJi
eXRlcy5keWxpYi5zbzwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAuL2xpYjY0L2xpYnNvZnRfYXR0ZXN0YXRpb25fY2VydC5zbzxicj4NCiZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0L2xpYmN1dHRsZWZpc2hfcnVu
X2N2ZF9wcm90by5zbzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAu
L2xpYjY0L2xpYmJpbmRlci5zbzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAuL2xpYjY0L2xpYmNyeXB0by1ob3N0LnNvPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDvCoCDCoCDCoC4vbGliNjQvbGlid2VibV9ta3ZtdXhlci5zbzxicj4NCiZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0LzxhIGhyZWY9Imh0dHA6Ly9saWJr
bXJfY2YuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmxpYmttcl9j
Zi5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0i
aHR0cDovL2xpYmttcl9jZi5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFu
ayI+aHR0cDovL2xpYmttcl9jZi5keWxpYi5zbzwvYT4mZ3Q7ICZsdDs8YSBocmVmPSJodHRwOi8v
bGlia21yX2NmLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRw
Oi8vbGlia21yX2NmLmR5bGliLnNvPC9hPjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZs
dDs8YSBocmVmPSJodHRwOi8vbGlia21yX2NmLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRh
cmdldD0iX2JsYW5rIj5odHRwOi8vbGlia21yX2NmLmR5bGliLnNvPC9hPiZndDsmZ3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbGliNjQvPGEgaHJlZj0iaHR0
cDovL2xpYmNpYm9yaXVtLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5r
Ij5saWJjaWJvcml1bS5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAm
bHQ7PGEgaHJlZj0iaHR0cDovL2xpYmNpYm9yaXVtLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIi
IHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGliY2lib3JpdW0uZHlsaWIuc288L2E+Jmd0OyAmbHQ7
PGEgaHJlZj0iaHR0cDovL2xpYmNpYm9yaXVtLmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRh
cmdldD0iX2JsYW5rIj5odHRwOi8vbGliY2lib3JpdW0uZHlsaWIuc288L2E+PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHA6Ly9saWJjaWJvcml1bS5keWxpYi5z
byIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYmNpYm9yaXVtLmR5
bGliLnNvPC9hPiZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDC
oCDCoC4vbGliNjQvbGlicHVyZXNvZnRrZXltYXN0ZXJkZXZpY2VfaG9zdC5zbzxicj4NCiZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2xpYjY0LzxhIGhyZWY9Imh0dHA6Ly9s
aWJ4NTA5X2NlcnQuZHlsaWIuc28iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmxp
Yng1MDlfY2VydC5keWxpYi5zbzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7
PGEgaHJlZj0iaHR0cDovL2xpYng1MDlfY2VydC5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0
YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYng1MDlfY2VydC5keWxpYi5zbzwvYT4mZ3Q7ICZsdDs8
YSBocmVmPSJodHRwOi8vbGlieDUwOV9jZXJ0LmR5bGliLnNvIiByZWw9Im5vcmVmZXJyZXIiIHRh
cmdldD0iX2JsYW5rIj5odHRwOi8vbGlieDUwOV9jZXJ0LmR5bGliLnNvPC9hPjxicj4NCiZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlieDUwOV9jZXJ0LmR5bGli
LnNvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlieDUwOV9jZXJ0
LmR5bGliLnNvPC9hPiZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvC
oCDCoCDCoC4vbGliNjQvPGEgaHJlZj0iaHR0cDovL2xpYnNlYzEuZHlsaWIuc28iIHJlbD0ibm9y
ZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmxpYnNlYzEuZHlsaWIuc288L2E+ICZsdDs8YSBocmVm
PSJodHRwOi8vbGlic2VjMS5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFu
ayI+aHR0cDovL2xpYnNlYzEuZHlsaWIuc288L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCZsdDs8YSBocmVmPSJodHRwOi8vbGlic2VjMS5keWxpYi5zbyIgcmVsPSJub3JlZmVy
cmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpYnNlYzEuZHlsaWIuc288L2E+ICZsdDs8YSBo
cmVmPSJodHRwOi8vbGlic2VjMS5keWxpYi5zbyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9i
bGFuayI+aHR0cDovL2xpYnNlYzEuZHlsaWIuc288L2E+Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9uYXRpdmV0ZXN0NjQvPGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vbmF0aXZldGVzdDY0L21vZGVtX3NpbXVsYXRv
cl90ZXN0Lzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL25hdGl2
ZXRlc3Q2NC9tb2RlbV9zaW11bGF0b3JfdGVzdC9tb2RlbV9zaW11bGF0b3JfdGVzdDxicj4NCiZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL25hdGl2ZXRlc3Q2NC9jdXR0bGVm
aXNoX25ldF90ZXN0cy88YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKg
Li9uYXRpdmV0ZXN0NjQvY3V0dGxlZmlzaF9uZXRfdGVzdHMvY3V0dGxlZmlzaF9uZXRfdGVzdHM8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9ldGMvPGJyPg0KJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vZXRjL21vZGVtX3NpbXVsYXRvci88
YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9ldGMvbW9kZW1fc2lt
dWxhdG9yL2ZpbGVzLzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqA8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAuL2V0Yy9tb2RlbV9zaW11bGF0b3IvZmlsZXMv
aWNjcHJvZmlsZV9mb3Jfc2ltMF9mb3JfQ3RzQ2FycmllckFwaVRlc3RDYXNlcy54bWw8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9ldGMvbW9kZW1fc2ltdWxhdG9y
L2ZpbGVzL2ljY3Byb2ZpbGVfZm9yX3NpbTAueG1sPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDvCoCDCoCDCoC4vZXRjL21vZGVtX3NpbXVsYXRvci9maWxlcy9udW1lcmljX29wZXJh
dG9yLnhtbDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2V0Yy9j
dmRfcnNhNDA5Ni5hdmJwdWJrZXk8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8Kg
IMKgIMKgLi9ldGMvYm9vdGxvYWRlcl9hYXJjaDY0Lzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAuL2V0Yy9ib290bG9hZGVyX2FhcmNoNjQvYm9vdGxvYWRlci5xZW11
PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vZXRjL2Jvb3Rsb2Fk
ZXJfYWFyY2g2NC9ib290bG9hZGVyLmNyb3N2bTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAuL2V0Yy9ib290bG9hZGVyX3Jpc2N2NjQvPGJyPg0KJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vZXRjL2Jvb3Rsb2FkZXJfcmlzY3Y2NC9ib290bG9h
ZGVyLnFlbXU8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9ldGMv
YXV0b21vdGl2ZS88YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9l
dGMvYXV0b21vdGl2ZS92aGFsY29uZmlnLzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAm
Z3Q7wqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAuL2V0Yy9hdXRvbW90aXZl
L3ZoYWxjb25maWcvVmVuZG9yQ2x1c3RlclRlc3RQcm9wZXJ0aWVzLmpzb248YnI+DQomZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9ldGMvYXV0b21vdGl2ZS92aGFsY29uZmln
L0RlZmF1bHRQcm9wZXJ0aWVzLmpzb248YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0
O8KgIMKgIMKgLi9ldGMvYXV0b21vdGl2ZS92aGFsY29uZmlnL1Rlc3RQcm9wZXJ0aWVzLmpzb248
YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9ldGMvYXV0b21vdGl2
ZS9wcm94eV9jb25maWcuanNvbjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAuL2V0Yy9jdmRfcnNhMjA0OC5hdmJwdWJrZXk8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0O8KgIMKgIMKgLi9ldGMvY3ZkX2F2Yl90ZXN0a2V5X3JzYTQwOTYucGVtPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vZXRjL2Jvb3Rsb2FkZXJfYXJt
Lzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2V0Yy9ib290bG9h
ZGVyX2FybS9ib290bG9hZGVyLnFlbXU8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0
O8KgIMKgIMKgLi9ldGMvYm9vdGxvYWRlcl94ODZfNjQvPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDvCoCDCoCDCoC4vZXRjL2Jvb3Rsb2FkZXJfeDg2XzY0L2Jvb3Rsb2FkZXIucWVt
dTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2V0Yy9ib290bG9h
ZGVyX3g4Nl82NC9ib290bG9hZGVyLmNyb3N2bTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAuL2V0Yy9jdmRfYXZiX3Rlc3RrZXlfcnNhMjA0OC5wZW08YnI+DQomZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9ldGMvb3BlbndydC88YnI+DQomZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9ldGMvb3BlbndydC9pbWFnZXMvPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vZXRjL29wZW53cnQvaW1h
Z2VzL29wZW53cnRfa2VybmVsX2FhcmNoNjQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
Jmd0O8KgIMKgIMKgLi9ldGMvb3BlbndydC9pbWFnZXMvb3BlbndydF9yb290ZnNfeDg2XzY0PGJy
Pg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vZXRjL29wZW53cnQvaW1h
Z2VzL29wZW53cnRfcm9vdGZzX2FhcmNoNjQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
Jmd0O8KgIMKgIMKgLi9ldGMvb3BlbndydC9pbWFnZXMvb3BlbndydF9rZXJuZWxfeDg2XzY0PGJy
Pg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vZXRjL2N2ZF9jb25maWcv
PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vZXRjL2N2ZF9jb25m
aWcvY3ZkX2NvbmZpZ190di5qc29uPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvC
oCDCoCDCoC4vZXRjL2N2ZF9jb25maWcvY3ZkX2NvbmZpZ190YWJsZXQuanNvbjxicj4NCiZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2V0Yy9jdmRfY29uZmlnL2N2ZF9jb25m
aWdfd2Vhci5qc29uPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4v
ZXRjL2N2ZF9jb25maWcvY3ZkX2NvbmZpZ19hdXRvX3BvcnRyYWl0Lmpzb248YnI+DQomZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9ldGMvY3ZkX2NvbmZpZy9jdmRfY29uZmln
X3NsaW0uanNvbjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2V0
Yy9jdmRfY29uZmlnL2N2ZF9jb25maWdfZ28uanNvbjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAuL2V0Yy9jdmRfY29uZmlnL2N2ZF9jb25maWdfZm9sZGFibGUuanNv
bjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2V0Yy9jdmRfY29u
ZmlnL2N2ZF9jb25maWdfYXV0by5qc29uPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZn
dDvCoCDCoCDCoC4vZXRjL2N2ZF9jb25maWcvY3ZkX2NvbmZpZ19hdXRvX21kLmpzb248YnI+DQom
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9ldGMvY3ZkX2NvbmZpZy9jdmRf
Y29uZmlnX3Bob25lLmpzb248YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKg
IMKgLi91c3IvPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vdXNy
L3NoYXJlLzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL3Vzci9z
aGFyZS92dWxrYW4vPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4v
dXNyL3NoYXJlL3Z1bGthbi9pY2QuZC88YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0
O8KgIMKgIMKgLi91c3Ivc2hhcmUvdnVsa2FuL2ljZC5kL3ZrX3N3aWZ0c2hhZGVyX2ljZC5qc29u
PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vdXNyL3NoYXJlL3Fl
bXUvPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vdXNyL3NoYXJl
L3FlbXUvYWFyY2g2NC1saW51eC1nbnUvPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZn
dDvCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC4vdXNyL3NoYXJlL3FlbXUv
YWFyY2g2NC1saW51eC1nbnUvb3BlbnNiaS1yaXNjdjY0LWdlbmVyaWMtZndfZHluYW1pYy5iaW48
YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi91c3Ivc2hhcmUvcWVt
dS9hYXJjaDY0LWxpbnV4LWdudS9lZmktdmlydGlvLnJvbTxicj4NCiZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL3Vzci9zaGFyZS9xZW11L2FhcmNoNjQtbGludXgtZ251L2tl
eW1hcHMvPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vdXNyL3No
YXJlL3FlbXUvYWFyY2g2NC1saW51eC1nbnUva2V5bWFwcy9lbi11czxicj4NCiZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL3Vzci9zaGFyZS93ZWJydGMvPGJyPg0KJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vdXNyL3NoYXJlL3dlYnJ0Yy9hc3NldHMv
PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vdXNyL3NoYXJlL3dl
YnJ0Yy9hc3NldHMvc3R5bGUuY3NzPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvC
oCDCoCDCoC4vdXNyL3NoYXJlL3dlYnJ0Yy9hc3NldHMvaW5kZXguY3NzPGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vdXNyL3NoYXJlL3dlYnJ0Yy9hc3NldHMvaW5k
ZXguaHRtbDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL3Vzci9z
aGFyZS93ZWJydGMvYXNzZXRzL2pzLzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAuL3Vzci9zaGFyZS93ZWJydGMvYXNzZXRzL2pzL2xvY2F0aW9uLmpzPGJyPg0KJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vdXNyL3NoYXJlL3dlYnJ0Yy9hc3Nl
dHMvanMvcm9vdGNhbmFsLmpzPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDC
oCDCoC4vdXNyL3NoYXJlL3dlYnJ0Yy9hc3NldHMvanMvYXBwLmpzPGJyPg0KJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vdXNyL3NoYXJlL3dlYnJ0Yy9hc3NldHMvanMvdG91
Y2guanM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi91c3Ivc2hh
cmUvd2VicnRjL2Fzc2V0cy9qcy9hZGIuanM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
Jmd0O8KgIMKgIMKgLi91c3Ivc2hhcmUvd2VicnRjL2Fzc2V0cy9qcy9pbmRleC5qczxicj4NCiZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL3Vzci9zaGFyZS93ZWJydGMvYXNz
ZXRzL2pzL2NmX3dlYnJ0Yy5qczxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAuL3Vzci9zaGFyZS93ZWJydGMvYXNzZXRzL2pzL3NlcnZlcl9jb25uZWN0b3IuanM8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi91c3Ivc2hhcmUvd2VicnRj
L2Fzc2V0cy9qcy9jb250cm9scy5qczxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAuL3Vzci9zaGFyZS93ZWJydGMvYXNzZXRzL2NvbnRyb2xzLmNzczxicj4NCiZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL3Vzci9zaGFyZS93ZWJydGMvYXNzZXRz
L2N1c3RvbS5jc3M8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi91
c3Ivc2hhcmUvd2VicnRjL2Fzc2V0cy9jbGllbnQuaHRtbDxicj4NCiZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL3Vzci9zaGFyZS93ZWJydGMvY2VydHMvPGJyPg0KJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vdXNyL3NoYXJlL3dlYnJ0Yy9jZXJ0cy9z
ZXJ2ZXIucDEyPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vdXNy
L3NoYXJlL3dlYnJ0Yy9jZXJ0cy9zZXJ2ZXIua2V5PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDvCoCDCoCDCoC4vdXNyL3NoYXJlL3dlYnJ0Yy9jZXJ0cy90cnVzdGVkLnBlbTxicj4N
CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL3Vzci9zaGFyZS93ZWJydGMv
Y2VydHMvc2VydmVyLmNydDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAuL3Vzci9zaGFyZS96b25laW5mby88YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0
O8KgIMKgIMKgLi91c3Ivc2hhcmUvem9uZWluZm8vdHpkYXRhPGJyPg0KJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDvCoCDCoCDCoC4vdXNyL3NoYXJlL2Nyb3N2bS88YnI+DQomZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi91c3Ivc2hhcmUvY3Jvc3ZtL2FhcmNoNjQtbGlu
dXgtZ251Lzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL3Vzci9z
aGFyZS9jcm9zdm0vYWFyY2g2NC1saW51eC1nbnUvc2VjY29tcC88YnI+DQomZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0O8KgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLi91
c3Ivc2hhcmUvY3Jvc3ZtL2FhcmNoNjQtbGludXgtZ251L3NlY2NvbXAvc25kX251bGxfZGV2aWNl
LnBvbGljeTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqA8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAuL3Vzci9zaGFyZS9jcm9zdm0vYWFyY2g2NC1saW51eC1n
bnUvc2VjY29tcC9ncHVfcmVuZGVyX3NlcnZlci5wb2xpY3k8YnI+DQomZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0O8KgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLi91c3Iv
c2hhcmUvY3Jvc3ZtL2FhcmNoNjQtbGludXgtZ251L3NlY2NvbXAvYmF0dGVyeS5wb2xpY3k8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgLi91c3Ivc2hhcmUvY3Jvc3ZtL2FhcmNoNjQtbGludXgtZ251L3NlY2NvbXAv
YmxvY2tfZGV2aWNlLnBvbGljeTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAg
wqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAuL3Vzci9zaGFyZS9jcm9zdm0vYWFy
Y2g2NC1saW51eC1nbnUvc2VjY29tcC9wbWVtX2RldmljZS5wb2xpY3k8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Li91c3Ivc2hhcmUvY3Jvc3ZtL2FhcmNoNjQtbGludXgtZ251L3NlY2NvbXAvd2xfZGV2aWNlLnBv
bGljeTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqA8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAuL3Vzci9zaGFyZS9jcm9zdm0vYWFyY2g2NC1saW51eC1nbnUv
c2VjY29tcC85cF9kZXZpY2UucG9saWN5PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZn
dDvCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC4vdXNyL3NoYXJlL2Nyb3N2
bS9hYXJjaDY0LWxpbnV4LWdudS9zZWNjb21wL2lucHV0X2RldmljZS5wb2xpY3k8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgLi91c3Ivc2hhcmUvY3Jvc3ZtL2FhcmNoNjQtbGludXgtZ251L3NlY2NvbXAvbmV0X2Rl
dmljZS5wb2xpY3k8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLi91c3Ivc2hhcmUvY3Jvc3ZtL2FhcmNoNjQtbGlu
dXgtZ251L3NlY2NvbXAvcm5nX2RldmljZS5wb2xpY3k8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0O8KgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLi91c3Ivc2hh
cmUvY3Jvc3ZtL2FhcmNoNjQtbGludXgtZ251L3NlY2NvbXAvY29pb21tdV9kZXZpY2UucG9saWN5
PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoDxicj4NCiZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoC4vdXNyL3NoYXJlL2Nyb3N2bS9hYXJjaDY0LWxpbnV4LWdudS9zZWNj
b21wL2dwdV9kZXZpY2UucG9saWN5PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvC
oCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC4vdXNyL3NoYXJlL2Nyb3N2bS9h
YXJjaDY0LWxpbnV4LWdudS9zZWNjb21wL3NlcmlhbF9kZXZpY2UucG9saWN5PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoC4vdXNyL3NoYXJlL2Nyb3N2bS9hYXJjaDY0LWxpbnV4LWdudS9zZWNjb21wL2NyYXNfYXVk
aW9fZGV2aWNlLnBvbGljeTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqA8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAuL3Vzci9zaGFyZS9jcm9zdm0vYWFyY2g2
NC1saW51eC1nbnUvc2VjY29tcC9udWxsX2F1ZGlvX2RldmljZS5wb2xpY3k8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgLi91c3Ivc2hhcmUvY3Jvc3ZtL2FhcmNoNjQtbGludXgtZ251L3NlY2NvbXAvc25kX2NyYXNf
ZGV2aWNlLnBvbGljeTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqA8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAuL3Vzci9zaGFyZS9jcm9zdm0vYWFyY2g2NC1s
aW51eC1nbnUvc2VjY29tcC92aG9zdF9zY21pX2RldmljZS5wb2xpY3k8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Li91c3Ivc2hhcmUvY3Jvc3ZtL2FhcmNoNjQtbGludXgtZ251L3NlY2NvbXAvYmFsbG9vbl9kZXZp
Y2UucG9saWN5PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoDxicj4NCiZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC4vdXNyL3NoYXJlL2Nyb3N2bS9hYXJjaDY0LWxpbnV4
LWdudS9zZWNjb21wL3Zob3N0X25ldF9kZXZpY2UucG9saWN5PGJyPg0KJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDvCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC4vdXNy
L3NoYXJlL2Nyb3N2bS9hYXJjaDY0LWxpbnV4LWdudS9zZWNjb21wL3Zob3N0X3Zzb2NrX2Rldmlj
ZS5wb2xpY3k8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgPGJyPg0KJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLi91c3Ivc2hhcmUvY3Jvc3ZtL2FhcmNoNjQtbGludXgt
Z251L3NlY2NvbXAvZnNfZGV2aWNlLnBvbGljeTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7wqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAuL3Vzci9zaGFyZS9j
cm9zdm0vYWFyY2g2NC1saW51eC1nbnUvc2VjY29tcC92aWRlb19kZXZpY2UucG9saWN5PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoC4vdXNyL3NoYXJlL2Nyb3N2bS9hYXJjaDY0LWxpbnV4LWdudS9zZWNjb21wL3ho
Y2lfZGV2aWNlLnBvbGljeTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqA8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAuL3Vzci9zaGFyZS9jcm9zdm0vYWFyY2g2
NC1saW51eC1nbnUvc2VjY29tcC92aW9zX2F1ZGlvX2RldmljZS5wb2xpY3k8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vPGJyPg0KJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL21vZGVtX3NpbXVsYXRvcjxicj4NCiZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9tcy10cG0tMjAtcmVmPGJyPg0KJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL21rZW52aW1hZ2Vfc2xpbTxi
cj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9tZXRyaWNzPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL3NvY2tldF92c29j
a19wcm94eTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9y
ZXNpemUuZjJmczxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jp
bi9tZXRyaWNzX2xhdW5jaGVyPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDC
oCDCoC4vYmluL2F1dG9tb3RpdmVfdnNvY2tfcHJveHk8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vbmV3ZnNfbXNkb3M8YnI+DQomZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vbmV0c2ltLXVpLzxicj4NCiZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9uZXRzaW0tdWkvYXNzZXRzLzxicj4NCiZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9uZXRzaW0tdWkvYXNzZXRzL2dy
aWQtYmFja2dyb3VuZC5zdmc8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKg
IMKgLi9iaW4vbmV0c2ltLXVpL2Fzc2V0cy9uZXRzaW0tbG9nby5zdmc8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vbmV0c2ltLXVpL2Fzc2V0cy9wb2xhci1i
YWNrZ3JvdW5kLnN2Zzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAu
L2Jpbi9uZXRzaW0tdWkvYXNzZXRzL2hleGFnb25hbC1iYWNrZ3JvdW5kLnBuZzxicj4NCiZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9uZXRzaW0tdWkvYXNzZXRzL25l
dHNpbS1sb2dvLWIuc3ZnPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDC
oC4vYmluL25ldHNpbS11aS9ub2RlX21vZHVsZXMvPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDvCoCDCoCDCoC4vYmluL25ldHNpbS11aS9ub2RlX21vZHVsZXMvdHNsaWIvPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL25ldHNpbS11aS9ub2Rl
X21vZHVsZXMvdHNsaWIvdHNsaWIuZXM2LmpzPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDvCoCDCoCDCoC4vYmluL25ldHNpbS11aS9pbmRleC5odG1sPGJyPg0KJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL25ldHNpbS11aS9qcy88YnI+DQomZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vbmV0c2ltLXVpL2pzL2RldmljZS1p
bmZvLmpzPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL25l
dHNpbS11aS9qcy9kZXZpY2UtbGlzdC5qczxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAuL2Jpbi9uZXRzaW0tdWkvanMvcGFja2V0LWluZm8uanM8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vbmV0c2ltLXVpL2pzL2RldmljZS1k
cm9wem9uZS5qczxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jp
bi9uZXRzaW0tdWkvanMvbmF2aWdhdGlvbi1iYXIuanM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vbmV0c2ltLXVpL2pzL2RldmljZS1tYXAuanM8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vbmV0c2ltLXVpL2pzL2Rl
dmljZS1kcmFnem9uZS5qczxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAuL2Jpbi9uZXRzaW0tdWkvanMvbmV0c2ltLWFwcC5qczxicj4NCiZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9uZXRzaW0tdWkvanMvY3VzdG9taXplLW1hcC1idXR0
b24uanM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vbmV0
c2ltLXVpL2pzL2RldmljZS1vYnNlcnZlci5qczxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAuL2Jpbi9uZXRzaW0tdWkvanMvbGljZW5zZS1pbmZvLmpzPGJyPg0KJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL25ldHNpbS11aS9qcy9jdWJl
LXNwcml0ZS5qczxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jp
bi9uZXRzaW0tdWkvanMvcHlyYW1pZC1zcHJpdGUuanM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vdW5wYWNrX2Jvb3RpbWc8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vYWRiPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDvCoCDCoCDCoC4vYmluL2V4dHJhY3Qtdm1saW51eDxicj4NCiZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9oZWFsdGg8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vc2NyZWVuX3JlY29yZGluZ19zZXJ2ZXI8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vbHo0PGJyPg0KJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL3dtZWRpdW1kX2dlbl9jb25m
aWc8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vZ25zc19n
cnBjX3Byb3h5PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmlu
L3NpbWcyaW1nPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmlu
L3NlY3VyZV9lbnY8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9i
aW4vbWtlMmZzPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmlu
L3NuYXBzaG90X3V0aWxfY3ZkPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDC
oCDCoC4vYmluL2N2ZF9pbnRlcm5hbF9kaXNwbGF5PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDvCoCDCoCDCoC4vYmluL2FjbG91ZF90cmFuc2xhdG9yPGJyPg0KJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL2RlZnJhZy5mMmZzPGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL3RvbWJzdG9uZV9yZWNlaXZlcjxicj4N
CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9yb290LWNhbmFsPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL25ldHNpbWQ8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vY29uc29sZV9mb3J3
YXJkZXI8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vcG93
ZXJ3YXNoX2N2ZDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jp
bi9wcm9jZXNzX3Jlc3RhcnRlcjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAuL2Jpbi9mc2NrLmYyZnM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8Kg
IMKgIMKgLi9iaW4vY3ZkX2hvc3RfYnVncmVwb3J0PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDvCoCDCoCDCoC4vYmluL2V4dHJhY3QtaWtjb25maWc8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vY3ZkX2ludGVybmFsX3N0YXR1czxicj4NCiZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi93ZWJSVEM8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vYWNsb3VkPGJyPg0KJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL3RjcF9jb25uZWN0b3I8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vcHJvY2Vzc19zYW5kYm94
ZXI8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vd2VicnRj
X29wZXJhdG9yPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmlu
L2N2ZF91cGRhdGVfbG9jYXRpb248YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8Kg
IMKgIMKgLi9iaW4vZTJmc2Ryb2lkPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvC
oCDCoCDCoC4vYmluL2F2YnRvb2w8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8Kg
IMKgIMKgLi9iaW4vZmFzdGJvb3Q8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8Kg
IMKgIMKgLi9iaW4vYnVpbGRfc3VwZXJfaW1hZ2U8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmd0O8KgIMKgIMKgLi9iaW4vcG93ZXJidG5fY3ZkPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDvCoCDCoCDCoC4vYmluL2FsbG9jZF9jbGllbnQ8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vZHVtcC5mMmZzPGJyPg0KJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL25ldHNpbTxicj4NCiZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9jYXNpbWlyPGJyPg0KJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL3BpY2E8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vY3ZkX3VwZGF0ZV9zZWN1cml0eV9hbGdvcml0aG08YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vcmVjb3JkX2N2ZDxi
cj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi92aGFsX3Byb3h5
X3NlcnZlcjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9j
dmRfc3RhdHVzPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmlu
L2N2ZF9pbXBvcnRfbG9jYXRpb25zPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvC
oCDCoCDCoC4vYmluL2xhdW5jaF9jdmQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0
O8KgIMKgIMKgLi9iaW4vY3ZkX2ludGVybmFsX3N0YXJ0PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDvCoCDCoCDCoC4vYmluL3Jlc3RhcnRfY3ZkPGJyPg0KJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL2N2ZF9pbnRlcm5hbF9ob3N0X2J1Z3JlcG9ydDxi
cj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9ta3VzZXJpbWdf
bWtlMmZzPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL2Zl
Yzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9jdmRfaW50
ZXJuYWxfZW52PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmlu
L3Zob3N0X2RldmljZV92c29jazxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAuL2Jpbi9jdmRfaW50ZXJuYWxfc3RvcDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAuL2Jpbi9jdmRfc2VuZF9zbXM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vYXNzZW1ibGVfY3ZkPGJyPg0KJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL2N2ZF9zZW5kX2lkX2Rpc2Nsb3N1cmU8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vbWNvcHk8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vb3BlcmF0b3JfcHJveHk8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vbWtib290ZnM8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vcnVuX2N2ZDxicj4N
CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9vcGVud3J0X2NvbnRy
b2xfc2VydmVyPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmlu
L21rYm9vdGltZzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jp
bi9rZXJuZWxfbG9nX21vbml0b3I8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8Kg
IMKgIMKgLi9iaW4vbW1kPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDC
oC4vYmluL3RveWJveDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAu
L2Jpbi9jcm9zdm08YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9i
aW4vYWFyY2g2NC1saW51eC1tdXNsLzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAuL2Jpbi9hYXJjaDY0LWxpbnV4LW11c2wvY3Jvc3ZtPGJyPg0KJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL3NlZmNvbnRleHRfY29tcGlsZTxicj4NCiZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi93bWVkaXVtZDxicj4NCiZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9lY2hvX3NlcnZlcjxicj4N
CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9sb2dfdGVlPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL2xwbWFrZTxicj4NCiZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9sb2djYXRfcmVjZWl2ZXI8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vbHB1bnBhY2s8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vY29udHJvbF9l
bnZfcHJveHlfc2VydmVyPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDC
oC4vYmluL210b29sczxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAu
L2Jpbi9hZGJfY29ubmVjdG9yPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDC
oCDCoC4vYmluL2FhcmNoNjQtbGludXgtZ251Lzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAuL2Jpbi9hYXJjaDY0LWxpbnV4LWdudS9saWJlcG94eS5zby4wPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL2FhcmNoNjQtbGludXgt
Z251L2xpYmZmaS5zby43PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDC
oC4vYmluL2FhcmNoNjQtbGludXgtZ251L3FlbXUvPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDvCoCDCoCDCoC4vYmluL2FhcmNoNjQtbGludXgtZ251L3FlbXUvcWVtdS1zeXN0ZW0t
eDg2XzY0PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL2Fh
cmNoNjQtbGludXgtZ251L3FlbXUvbGliZXBveHkuc28uMDxicj4NCiZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9hYXJjaDY0LWxpbnV4LWdudS9xZW11L2xpYnZpcmds
cmVuZGVyZXIuc28uMTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAu
L2Jpbi9hYXJjaDY0LWxpbnV4LWdudS9xZW11L2xpYmdibS5zby4xPGJyPg0KJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL2FhcmNoNjQtbGludXgtZ251L3FlbXUvbGli
Z2Z4c3RyZWFtX2JhY2tlbmQuc28uMDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAuL2Jpbi9hYXJjaDY0LWxpbnV4LWdudS9xZW11L2xpYnJ1dGFiYWdhX2dmeF9mZmku
c28uMDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9hYXJj
aDY0LWxpbnV4LWdudS9xZW11L3FlbXUtc3lzdGVtLXJpc2N2NjQ8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vYWFyY2g2NC1saW51eC1nbnUvcWVtdS9xZW11
LXN5c3RlbS1hYXJjaDY0PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDC
oC4vYmluL2FhcmNoNjQtbGludXgtZ251L3FlbXUvbGliYysrLnNvLjE8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vYWFyY2g2NC1saW51eC1nbnUvcWVtdS9s
aWJ1bndpbmQuc28uMTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAu
L2Jpbi9hYXJjaDY0LWxpbnV4LWdudS9xZW11L2xpYnouc28uMTxicj4NCiZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9hYXJjaDY0LWxpbnV4LWdudS9xZW11L2xpYmMr
K2FiaS5zby4xPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmlu
L2FhcmNoNjQtbGludXgtZ251L2xpYnZpcmdscmVuZGVyZXIuc28uMTxicj4NCiZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9hYXJjaDY0LWxpbnV4LWdudS9saWJkcm0u
c28uMjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9hYXJj
aDY0LWxpbnV4LWdudS9saWJnYm0uc28uMTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAuL2Jpbi9hYXJjaDY0LWxpbnV4LWdudS9saWJnZnhzdHJlYW1fYmFja2VuZC5z
bzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9hYXJjaDY0
LWxpbnV4LWdudS9saWJ3YXlsYW5kLWNsaWVudC5zby4wPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDvCoCDCoCDCoC4vYmluL2FhcmNoNjQtbGludXgtZ251L2xpYm1pbmlqYWlsLnNv
PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL2FhcmNoNjQt
bGludXgtZ251L2dmeHN0cmVhbV9ncmFwaGljc19kZXRlY3Rvcjxicj4NCiZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9hYXJjaDY0LWxpbnV4LWdudS9jcm9zdm08YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vbHBhZGQ8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgLi9iaW4vbWFrZV9mMmZzPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC4vYmluL3NhbmRib3hlcl9wcm94
eTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9zdG9wX2N2
ZDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAuL2Jpbi9jYXNpbWly
X2NvbnRyb2xfc2VydmVyPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7wqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB6aW9tYXJpb0BaMzkw
LUFPUlVTLVBSTy1ERVNUOi9tbnQvenJvb3QtMTMzL19PUy9BbmRyb2lkL2Fvc3BfMTQvYW5kcm9p
ZC1pbWFnZSQgSE9NRT0kKHB3ZCkgLi9iaW4vbGF1bmNoX2N2ZCAtdm1fbWFuYWdlciBxZW11X2Ns
aSAtcmVwb3J0X2Fub255bW91c191c2FnZV9zdGF0cz1uIC0tc3RhcnRfd2VicnRjPWZhbHNlPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAwOS0w
MiAyMzoyNzoxMC40NzMgMjcyOTk5MCAyNzI5OTkwIEkgbGF1bmNoX2N2ZDo8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqBtYWluLmNjOjIzNSBVc2luZzxicj4NCiZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqBzeXN0ZW1faW1hZ2VfZGlyIG9mOjxicj4NCiZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqA9
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoE5PVElD
RTo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqBCeSB1c2luZyB0aGlzIEFuZHJvaWQgVmlydHVhbCBEZXZp
Y2UsIHlvdSBhZ3JlZSB0bzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqBHb29nbGUgVGVybXMgb2YgU2VydmljZTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCg8
YSBocmVmPSJodHRwczovL3BvbGljaWVzLmdvb2dsZS5jb20vdGVybXMiIHJlbD0ibm9yZWZlcnJl
ciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vcG9saWNpZXMuZ29vZ2xlLmNvbS90ZXJtczwvYT48
YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9wb2xpY2ll
cy5nb29nbGUuY29tL3Rlcm1zIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRw
czovL3BvbGljaWVzLmdvb2dsZS5jb20vdGVybXM8L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9wb2xpY2llcy5nb29n
bGUuY29tL3Rlcm1zIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL3Bv
bGljaWVzLmdvb2dsZS5jb20vdGVybXM8L2E+PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
Jmx0OzxhIGhyZWY9Imh0dHBzOi8vcG9saWNpZXMuZ29vZ2xlLmNvbS90ZXJtcyIgcmVsPSJub3Jl
ZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9wb2xpY2llcy5nb29nbGUuY29tL3Rlcm1z
PC9hPiZndDsmZ3Q7KS48YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKg
VGhlIEdvb2dsZSBQcml2YWN5IFBvbGljeTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCg8
YSBocmVmPSJodHRwczovL3BvbGljaWVzLmdvb2dsZS5jb20vcHJpdmFjeSIgcmVsPSJub3JlZmVy
cmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9wb2xpY2llcy5nb29nbGUuY29tL3ByaXZhY3k8
L2E+PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHBzOi8vcG9s
aWNpZXMuZ29vZ2xlLmNvbS9wcml2YWN5IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5r
Ij5odHRwczovL3BvbGljaWVzLmdvb2dsZS5jb20vcHJpdmFjeTwvYT4mZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwczovL3BvbGlj
aWVzLmdvb2dsZS5jb20vcHJpdmFjeSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+
aHR0cHM6Ly9wb2xpY2llcy5nb29nbGUuY29tL3ByaXZhY3k8L2E+PGJyPg0KJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHBzOi8vcG9saWNpZXMuZ29vZ2xlLmNvbS9wcml2
YWN5IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL3BvbGljaWVzLmdv
b2dsZS5jb20vcHJpdmFjeTwvYT4mZ3Q7Jmd0Oyk8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmd0O8KgIMKgIMKgZGVzY3JpYmVzIGhvdyBHb29nbGUgaGFuZGxlcyBpbmZvcm1hdGlvbiBn
ZW5lcmF0ZWQgYXM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqB5b3UgdXNlPGJyPg0KJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoEdvb2dsZSBTZXJ2aWNlcy48YnI+DQom
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoFJlYWRpbmcgLS1jb25maWcg
b3B0aW9uIGZyb206PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoDxicj4N
CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC9tbnQvenJvb3QtMTMzL19PUy9BbmRyb2lkL2Fv
c3BfMTQvYW5kcm9pZC1pbWFnZS9hbmRyb2lkLWluZm8udHh0PGJyPg0KJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDvCoCDCoCDCoExhdW5jaGluZyBDVkQgdXNpbmcgLS1jb25maWc9JiMzOTtw
aG9uZSYjMzk7Ljxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqBhYXJj
aDY0LWJpbmZtdC1QOiBDb3VsZCBub3Qgb3Blbjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCYjMzk7L2xpYi9sZC1saW51eC1hYXJjaDY0LnNvLjEmIzM5OzogTm88YnI+DQomZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgc3VjaCBmaWxlIG9yIGRpcmVjdG9yeTxicj4NCiZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqBGYWlsZWQgdG8gcnVuIGdyYXBoaWNz
IGRldGVjdG9yLCBiYWQgcmV0dXJuIHZhbHVlOjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oDI1NS4gQXNzdW1pbmcgbm88YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKg
IMKgYXZhaWxhYmlsaXR5Ljxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqBHUFUgYXV0byBtb2RlOiBkaWQgbm90IGRldGVjdCBwcmVyZXF1aXNpdGVzIGZvcjxicj4NCiZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoGFjY2VsZXJhdGVkPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDvCoCDCoCDCoHJlbmRlcmluZyBzdXBwb3J0LCBlbmFibGluZyAtLWdwdV9tb2Rl
PWd1ZXN0X3N3aWZ0c2hhZGVyLjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqBHUFUgdmhvc3QgdXNlciBhdXRvIG1vZGU6IG5vdCBuZWVkZWQgZm9yPGJyPg0KJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoC0tZ3B1X21vZGU9Z3Vlc3Rfc3dpZnRzaGFk
ZXIuIE5vdCBlbmFibGluZyB2aG9zdCB1c2VyPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
Z3B1Ljxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqBSZXF1ZXN0ZWQg
cmVzdW1pbmcgYSBwcmV2aW91cyBzZXNzaW9uICh0aGUgZGVmYXVsdDxicj4NCiZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoGJlaGF2aW9yKSBidXQgdGhlPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDvCoCDCoCDCoGJhc2UgaW1hZ2VzIGhhdmUgY2hhbmdlZCB1bmRlciB0aGUgb3Zlcmxh
eSwgbWFraW5nPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgdGhlIG92ZXJsYXkgaW5jPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoG9tcGF0aWJsZS4gV2lwaW5n
IHRoZSBvdmVybGF5IGZpbGVzLjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqBQYXRoIGZvciBpbnN0YW5jZSBVRFM6IC90bXAvY2ZfYXZkXzEwMDA8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgRmFpbGVkIHRvIHJ1bjxicj4NCiZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBgL21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQvYW9zcF8xNC9hbmRyb2lkLWltYWdlL2Jpbi9j
cm9zdm08YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgY3JlYXRlX3Fj
b3cyIC0tYmFja2luZy1maWxlPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgL21udC96cm9v
dC0xMzMvX09TL0FuZHJvaWQvYW9zcF88YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0
O8KgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgMTQvYW5kcm9pZC1pbWFnZS9j
dXR0bGVmaXNoL2luc3RhbmNlcy9jdmQtMS9wZXJzaXN0ZW50X2NvbXBvc2l0ZS5pbWc8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgL21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQvYW9zcF8xNC9hbmRyb2lkLWltYWdl
L2N1dHRsZWZpc2gvaW5zdGFuPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDC
oCDCoGNlcy9jdmQtMS9wZXJzaXN0ZW50X2NvbXBvc2l0ZV9vdmVybGF5LmltZ2A8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgc3Rkb3V0Ojxicj4NCiZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAjIyM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAjIyM8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgc3RkZXJyOjxicj4NCiZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAjIyM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0O8KgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgL21udC96
cm9vdC0xMzMvX09TL0FuZHJvaWQvYW9zcF8xNC9hbmRyb2lkLWltYWdlL2Jpbi9jcm9zdm06IHJp
Z2EgMzo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgPGJyPg0KJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgL21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQvYW9zcF8xNC9h
bmRyb2lkLWltYWdlL2Jpbi94ODZfNjQtbGludXgtPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDvCoCDCoCDCoG11c2wvY3Jvc3ZtOiBGaWxlIG8gZGlyZWN0b3J5IG5vbiBlc2lzdGVu
dGU8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAjIyM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
Jmd0O8KgIMKgIMKgUmV0dXJuIGNvZGU6ICZxdW90OzEyNyZxdW90Ozxicj4NCiZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqBxZW11OiB1bmNhdWdodCB0YXJnZXQgc2lnbmFsIDYg
KEFib3J0ZWQpIC0gY29yZSBkdW1wZWQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0
O8KgIMKgIMKgMDktMDIgMjM6Mjc6MzEuMjIzIDI3Mjk5OTAgMjcyOTk5MCBFIGxhdW5jaF9jdmQ6
PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgc3VicHJvY2Vzcy5jcHA6MjA3PGJyPg0KJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoFN1YnByb2Nlc3MgMjczMDAxOCB3YXMg
aW50ZXJydXB0ZWQgYnkgYSBzaWduYWw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmIzM5
O0Fib3J0ZWQmIzM5OyAoNik8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKg
IMKgMDktMDIgMjM6Mjc6MzEuMjI0IDI3Mjk5OTAgMjcyOTk5MCBFIGxhdW5jaF9jdmQ6PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgbWFpbi5jYzozMjM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0O8KgIMKgIMKgYXNzZW1ibGVfY3ZkIHJldHVybmVkIC0xPGJyPg0KJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0
O8KgIMKgIMKgT24gTW9uLCBTZXAgMiwgMjAyNCBhdCAxMToyMOKAr1BNIE1hcmlvIE1hcmlldHRv
PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJt
YWlsdG86bWFyaWV0dG8yMDA4QGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPm1hcmlldHRvMjAw
OEBnbWFpbC5jb208L2E+PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0O21haWx0bzo8
YSBocmVmPSJtYWlsdG86bWFyaWV0dG8yMDA4QGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPm1h
cmlldHRvMjAwOEBnbWFpbC5jb208L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOm1hcmlldHRvMjAwOEBnbWFpbC5jb20iIHRhcmdl
dD0iX2JsYW5rIj5tYXJpZXR0bzIwMDhAZ21haWwuY29tPC9hPjxicj4NCiZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOm1hcmlldHRvMjAwOEBnbWFpbC5j
b20iIHRhcmdldD0iX2JsYW5rIj5tYXJpZXR0bzIwMDhAZ21haWwuY29tPC9hPiZndDsmZ3Q7Jmd0
OyB3cm90ZTo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqBIZWxsby48YnI+DQomZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqBJJiMzOTt2ZSBkb3dubG9hZGVkIHRoaXMgZmlsZSA6PGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoGFvc3BfY2ZfYXJtNjRfb25seV9waG9u
ZS1pbWctMTIzMDkyOTYuemlwIGFuZDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoHRoaXMg
ZmlsZSA6PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoGN2
ZC1ob3N0X3BhY2thZ2UudGFyLmd6PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgZnJvbSBoZXJl
IDo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoDxhIGhyZWY9Imh0dHBzOi8vY2kuYW5kcm9pZC5jb20vYnVpbGRzL3N1Ym1pdHRl
ZC8xMjMwOTI5Ni9hb3NwX2NmX2FybTY0X29ubHlfcGhvbmUtdHJ1bmtfc3RhZ2luZy11c2VyZGVi
dWcvbGF0ZXN0IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2NpLmFu
ZHJvaWQuY29tL2J1aWxkcy9zdWJtaXR0ZWQvMTIzMDkyOTYvYW9zcF9jZl9hcm02NF9vbmx5X3Bo
b25lLXRydW5rX3N0YWdpbmctdXNlcmRlYnVnL2xhdGVzdDwvYT4gJmx0OzxhIGhyZWY9Imh0dHBz
Oi8vY2kuYW5kcm9pZC5jb20vYnVpbGRzL3N1Ym1pdHRlZC8xMjMwOTI5Ni9hb3NwX2NmX2FybTY0
X29ubHlfcGhvbmUtdHJ1bmtfc3RhZ2luZy11c2VyZGVidWcvbGF0ZXN0IiByZWw9Im5vcmVmZXJy
ZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2NpLmFuZHJvaWQuY29tL2J1aWxkcy9zdWJtaXR0
ZWQvMTIzMDkyOTYvYW9zcF9jZl9hcm02NF9vbmx5X3Bob25lLXRydW5rX3N0YWdpbmctdXNlcmRl
YnVnL2xhdGVzdDwvYT4mZ3Q7ICZsdDs8YSBocmVmPSJodHRwczovL2NpLmFuZHJvaWQuY29tL2J1
aWxkcy9zdWJtaXR0ZWQvMTIzMDkyOTYvYW9zcF9jZl9hcm02NF9vbmx5X3Bob25lLXRydW5rX3N0
YWdpbmctdXNlcmRlYnVnL2xhdGVzdCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+
aHR0cHM6Ly9jaS5hbmRyb2lkLmNvbS9idWlsZHMvc3VibWl0dGVkLzEyMzA5Mjk2L2Fvc3BfY2Zf
YXJtNjRfb25seV9waG9uZS10cnVua19zdGFnaW5nLXVzZXJkZWJ1Zy9sYXRlc3Q8L2E+ICZsdDs8
YSBocmVmPSJodHRwczovL2NpLmFuZHJvaWQuY29tL2J1aWxkcy9zdWJtaXR0ZWQvMTIzMDkyOTYv
YW9zcF9jZl9hcm02NF9vbmx5X3Bob25lLXRydW5rX3N0YWdpbmctdXNlcmRlYnVnL2xhdGVzdCIg
cmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9jaS5hbmRyb2lkLmNvbS9i
dWlsZHMvc3VibWl0dGVkLzEyMzA5Mjk2L2Fvc3BfY2ZfYXJtNjRfb25seV9waG9uZS10cnVua19z
dGFnaW5nLXVzZXJkZWJ1Zy9sYXRlc3Q8L2E+Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqBCdXQgbGV0JiMzOTtzIHNheSB0aGF0IEkgZG9uJiMzOTt0IHdhbnQgdG8gdXNlIHRoZSAq
LmltZzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoGZpbGVzIHRoYXQgYXJlPGJyPg0KJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoHN0b3JlZCBpbnNpZGU8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmcXVvdDthb3NwX2NmX2FybTY0X29ubHlfcGhvbmUt
aW1nLTEyMzA5Mjk2LnppcCZxdW90OyxidXQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgdGhlIHNhbWUgZmlsZXMgdGhhdCBoYXZlIGJlZW4gcHJvZHVjZWQg
d2hlbiBJPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgaGF2ZSBjb21waWxlZCB0aGlzPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoHZlcnNpb24gb2Yg
QW5kcm9pZCA6PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoDxhIGhy
ZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9yYXNwYmVycnktdmFuaWxsYS9hbmRyb2lkX2xvY2FsX21h
bmlmZXN0P3RhYj1yZWFkbWUtb3YtZmlsZSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFu
ayI+aHR0cHM6Ly9naXRodWIuY29tL3Jhc3BiZXJyeS12YW5pbGxhL2FuZHJvaWRfbG9jYWxfbWFu
aWZlc3Q/dGFiPXJlYWRtZS1vdi1maWxlPC9hPiAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9naXRodWIu
Y29tL3Jhc3BiZXJyeS12YW5pbGxhL2FuZHJvaWRfbG9jYWxfbWFuaWZlc3Q/dGFiPXJlYWRtZS1v
di1maWxlIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dpdGh1Yi5j
b20vcmFzcGJlcnJ5LXZhbmlsbGEvYW5kcm9pZF9sb2NhbF9tYW5pZmVzdD90YWI9cmVhZG1lLW92
LWZpbGU8L2E+Jmd0OyAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL3Jhc3BiZXJyeS12
YW5pbGxhL2FuZHJvaWRfbG9jYWxfbWFuaWZlc3Q/dGFiPXJlYWRtZS1vdi1maWxlIiByZWw9Im5v
cmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dpdGh1Yi5jb20vcmFzcGJlcnJ5LXZh
bmlsbGEvYW5kcm9pZF9sb2NhbF9tYW5pZmVzdD90YWI9cmVhZG1lLW92LWZpbGU8L2E+ICZsdDs8
YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vcmFzcGJlcnJ5LXZhbmlsbGEvYW5kcm9pZF9sb2Nh
bF9tYW5pZmVzdD90YWI9cmVhZG1lLW92LWZpbGUiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJf
YmxhbmsiPmh0dHBzOi8vZ2l0aHViLmNvbS9yYXNwYmVycnktdmFuaWxsYS9hbmRyb2lkX2xvY2Fs
X21hbmlmZXN0P3RhYj1yZWFkbWUtb3YtZmlsZTwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoENhbiBJIGRvIGl0ID8gSXMgaXQgc3VwcG9zZWQgdG8gd29yayB0aGUgc2FtZSA/
PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgVGhhbmtzLjxicj4NCiZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoE9uIE1vbiwgU2VwIDIsIDIwMjQgYXQgMTA6MjPigK9QTSBQaWVycmljayBCb3V2aWVyPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCZsdDs8YSBocmVm
PSJtYWlsdG86cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnIiB0YXJnZXQ9Il9ibGFuayI+cGll
cnJpY2suYm91dmllckBsaW5hcm8ub3JnPC9hPjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZyIg
dGFyZ2V0PSJfYmxhbmsiPnBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZzwvYT4mZ3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCZsdDttYWlsdG86PGEg
aHJlZj0ibWFpbHRvOnBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZyIgdGFyZ2V0PSJfYmxhbmsi
PnBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpwaWVycmljay5ib3V2aWVyQGxpbmFyby5v
cmciIHRhcmdldD0iX2JsYW5rIj5waWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc8L2E+Jmd0OyZn
dDsmZ3Q7IHdyb3RlOjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqBPbiA5LzIvMjQgMTM6MjAsIFBpZXJyaWNrIEJvdXZpZXIgd3JvdGU6PGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7IE9uIDkvMi8yNCAx
Mjo1MywgTWFyaW8gTWFyaWV0dG8gd3JvdGU6PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0OyBIZWxsbyBQaWVycmljay48YnI+DQom
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7
PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAm
Z3Q7Jmd0OyBXaXRoIEN1dHRsZWZpc2ggY2FuIEkgZW11bGF0ZSBBbmRyb2lkIDE0PGJyPg0KJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgZm9yIGFybTY0ID8gSTxicj4NCiZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBhc2sgYmVjYXVzZSBpbjxicj4NCiZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDsgeW91
ciBzY3JpcHQgSSByZWFkIDo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCZxdW90O3wvaG9tZS91c2VyLy53b3JrL3FlbXUvYnVpbGQvcWVtdS1zeXN0ZW0teDg2XzY0
JnF1b3Q7LCBzbyxJPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoHN1c3BlY3QgdGhhdCB5b3U8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7IGhhdmUgZW11bGF0ZWQgQW5kcm9pZCB4
NjQgYml0LGJ1dCBJIG5lZWQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBhcm02NC4gfDxi
cj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0
OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDsgWWVzLCBpdCB3b3JrcyBmb3IgYm90aCBhcmNoaXRlY3R1cmUuIFRoZTxicj4N
CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoG9ubHkgdGhpbmcgSTxicj4NCiZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBkaWRuJiMzOTt0IHRyeSBpcyBhbjxi
cj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0
OyBhcm02NCB2bSBhY2NlbGVyYXRlZCB3aXRoIGt2bSAoSSBkb24mIzM5O3Q8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqBoYXZlIHRoaXMgYTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBsaW51eC1hYXJjaDY0PGJyPg0KJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7IG1hY2hpbmUpLCBidXQg
aXQgc2hvdWxkIHdvcmsuPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgQW5kIG9mIGNv
dXJzZSwgaWYgeW91IHdhbnQgdG8gd3JpdGUgYSBjdXN0b208YnI+DQomZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqB3cmFwcGVyIGZvcjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqBxZW11LCBuYW1lIGl0PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoHFlbXUtc3lzdGVtLWFhcmNoNjQsIGFuZCBjYWxs
IHRoZSBzYW1lIGJpbmFyeTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoGluc3RlYWQgb2Y8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgeDg2
XzY0IHZhcmlhbnRzLjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0
OyBJIGFsc28gcmVhZCAmcXVvdDtmb3IgYWFyY2g2NCBpbWFnZXM6IHNlbGVjdDxicj4NCiZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqB8YW9zcF9jZl9hcm02NF9vbmx5X3Bob25lLXRydW5r
X3N0YWdpbmctdXNlcmRlYnVnJnF1b3Q7IDogSSYjMzk7bTxicj4NCiZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBub3QgYWJsZSB0bzxicj4NCiZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDsgZG93bmxv
YWQgdGhpcyBraW5kIG9mIGltYWdlcy4gSSBkb24mIzM5O3Q8YnI+DQomZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqB1bmRlcnN0YW5kIGhvdyB0aGU8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgQnJhbmNoIEdyaWQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7IHdvcmtzLiBDYW4geW91
IGV4cGxhaW4gdG8gbWUgYSBsaXR0bGUgYml0PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
bW9yZSA/PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7Jmd0OyB8PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCAmZ3Q7IFlvdSBoYXZlIGEgbGluayBqdXN0IG5leHQgdG8gaXQgKCZx
dW90O0JyYW5jaDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoGdyaWQmcXVvdDspIG9uIHRo
ZTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqB3
aWtpIHBhZ2UuPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7IE9uY2Ugb24gY2kgYW5kcm9pZCBwYWdlLCBjbGljayBvbiBmaWx0ZXI8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBidXR0b24gKHRocmVlPGJyPg0KJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoGJhcnMsIGludmVydGVkPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7IHB5
cmFtaWQpLCBhbmQgc2VsZWN0PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoGFvc3BfY2ZfYXJtNjRfb25seV9waG9uZS10cnVua19zdGFnaW5nLXVz
ZXJkZWJ1Zy48YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDsgVGhlbiBnbyB0byBhcnRpZmFjdHMsIGFuZCBkb3dubG9hZCBpbWFnZSBhbmQ8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgY3Zk
X2hvc3RfeDg2XzY0IHBhY2thZ2UsIGFzPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7IHdpa2kgbWVudGlvbnMuPGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7IERvbiYjMzk7
dCBoZXNpdGF0ZSB0byBhc2sgbW9yZSBxdWVzdGlvbnMgb248YnI+DQomZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqB0aGlzLiBJIGltYWdpbmU8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgdGhpcyB0b3BpYyBtaWdodDxicj4NCiZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyBpbnRlcmVzdCBzb21lIHBl
b3BsZSB3aG8gdHJ5IHRvIGRvIHRoZTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoHNhbWUg
dGhpbmcuPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7IFBpZXJyaWNrPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0OyB8PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0OyB8PGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0Ozxicj4NCiZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDs8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZn
dDsmZ3Q7IE9uIE1vbiwgU2VwIDIsIDIwMjQgYXQgODo0N+KAr1BNIFBpZXJyaWNrPGJyPg0KJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgQm91dmllcjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDsgJmx0OzxhIGhyZWY9Im1haWx0bzpw
aWVycmljay5ib3V2aWVyQGxpbmFyby5vcmciIHRhcmdldD0iX2JsYW5rIj5waWVycmljay5ib3V2
aWVyQGxpbmFyby5vcmc8L2E+PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0O21haWx0
bzo8YSBocmVmPSJtYWlsdG86cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnIiB0YXJnZXQ9Il9i
bGFuayI+cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmx0O21haWx0bzo8YSBocmVm
PSJtYWlsdG86cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnIiB0YXJnZXQ9Il9ibGFuayI+cGll
cnJpY2suYm91dmllckBsaW5hcm8ub3JnPC9hPjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZyIg
dGFyZ2V0PSJfYmxhbmsiPnBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZzwvYT4mZ3Q7Jmd0Ozxi
cj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7
bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmciIHRhcmdl
dD0iX2JsYW5rIj5waWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc8L2E+PGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cGllcnJpY2suYm91dmll
ckBsaW5hcm8ub3JnIiB0YXJnZXQ9Il9ibGFuayI+cGllcnJpY2suYm91dmllckBsaW5hcm8ub3Jn
PC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cGllcnJpY2suYm91dmllckBsaW5hcm8u
b3JnIiB0YXJnZXQ9Il9ibGFuayI+cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPC9hPjxicj4N
CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnBpZXJy
aWNrLmJvdXZpZXJAbGluYXJvLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnBpZXJyaWNrLmJvdXZpZXJA
bGluYXJvLm9yZzwvYT4mZ3Q7Jmd0OyZndDsmZ3Q7IHdyb3RlOjxicj4NCiZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAg
wqAgSGVsbG8gTWFyaW8sPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCB2ZXJ5IHJlY2VudGx5LCBJIGhh
ZCB0byBpbnZlc3RpZ2F0ZTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoGJvb3RpbmcgdGlt
ZSBvZjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqBBbmRyb2lkIHdoZW4gdXNpbmc8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgUUVNVS4gWW91IGNhbiBwcm9iYWJs
eSBtYW5hZ2UgdG88YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBib290IHRoaXMgd2l0aDxi
cj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBvbmx5
IFFFTVUgYWxvbmUsIGJ1dCBpbjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCBteSBleHBlcmllbmNlLCB1c2luZyBD
dXR0bGVmaXNoPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgdG9vbGluZyBpcyBhbjxicj4N
CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBlYXNpZXIg
YXBwcm9hY2guPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCBJZiB5b3UgcmVhbGx5IHdhbnQgdG8gdXNl
IG9ubHkgUUVNVSw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqB5b3UgY2FuIHVzZTxicj4N
CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBDdXR0bGVm
aXNoIHRvIGdldDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCBleGFjdDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCBjb21tYW5kIGxp
bmUgdXNlZCAod2hpY2ggZGlzayBnb2VzPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgd2hl
cmUpLCBhbmQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgaXRlcmF0ZSBmcm9tIHRoYXQuPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCBJbnN0cnVjdGlv
bnM6PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgPGEgaHJlZj0iaHR0cHM6Ly9saW5hcm8uYXRsYXNzaWFuLm5ldC93
aWtpL3NwYWNlcy9RRU1VL3BhZ2VzLzI5NDY0MDY4MDk3L1J1bitBbmRyb2lkK3VzaW5nK1FFTVUi
IHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vbGluYXJvLmF0bGFzc2lh
bi5uZXQvd2lraS9zcGFjZXMvUUVNVS9wYWdlcy8yOTQ2NDA2ODA5Ny9SdW4rQW5kcm9pZCt1c2lu
ZytRRU1VPC9hPiAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9saW5hcm8uYXRsYXNzaWFuLm5ldC93aWtp
L3NwYWNlcy9RRU1VL3BhZ2VzLzI5NDY0MDY4MDk3L1J1bitBbmRyb2lkK3VzaW5nK1FFTVUiIHJl
bD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vbGluYXJvLmF0bGFzc2lhbi5u
ZXQvd2lraS9zcGFjZXMvUUVNVS9wYWdlcy8yOTQ2NDA2ODA5Ny9SdW4rQW5kcm9pZCt1c2luZytR
RU1VPC9hPiZndDsgJmx0OzxhIGhyZWY9Imh0dHBzOi8vbGluYXJvLmF0bGFzc2lhbi5uZXQvd2lr
aS9zcGFjZXMvUUVNVS9wYWdlcy8yOTQ2NDA2ODA5Ny9SdW4rQW5kcm9pZCt1c2luZytRRU1VIiBy
ZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2xpbmFyby5hdGxhc3NpYW4u
bmV0L3dpa2kvc3BhY2VzL1FFTVUvcGFnZXMvMjk0NjQwNjgwOTcvUnVuK0FuZHJvaWQrdXNpbmcr
UUVNVTwvYT4gJmx0OzxhIGhyZWY9Imh0dHBzOi8vbGluYXJvLmF0bGFzc2lhbi5uZXQvd2lraS9z
cGFjZXMvUUVNVS9wYWdlcy8yOTQ2NDA2ODA5Ny9SdW4rQW5kcm9pZCt1c2luZytRRU1VIiByZWw9
Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2xpbmFyby5hdGxhc3NpYW4ubmV0
L3dpa2kvc3BhY2VzL1FFTVUvcGFnZXMvMjk0NjQwNjgwOTcvUnVuK0FuZHJvaWQrdXNpbmcrUUVN
VTwvYT4mZ3Q7Jmd0OyAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9saW5hcm8uYXRsYXNzaWFuLm5ldC93
aWtpL3NwYWNlcy9RRU1VL3BhZ2VzLzI5NDY0MDY4MDk3L1J1bitBbmRyb2lkK3VzaW5nK1FFTVUi
IHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vbGluYXJvLmF0bGFzc2lh
bi5uZXQvd2lraS9zcGFjZXMvUUVNVS9wYWdlcy8yOTQ2NDA2ODA5Ny9SdW4rQW5kcm9pZCt1c2lu
ZytRRU1VPC9hPiAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9saW5hcm8uYXRsYXNzaWFuLm5ldC93aWtp
L3NwYWNlcy9RRU1VL3BhZ2VzLzI5NDY0MDY4MDk3L1J1bitBbmRyb2lkK3VzaW5nK1FFTVUiIHJl
bD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vbGluYXJvLmF0bGFzc2lhbi5u
ZXQvd2lraS9zcGFjZXMvUUVNVS9wYWdlcy8yOTQ2NDA2ODA5Ny9SdW4rQW5kcm9pZCt1c2luZytR
RU1VPC9hPiZndDsgJmx0OzxhIGhyZWY9Imh0dHBzOi8vbGluYXJvLmF0bGFzc2lhbi5uZXQvd2lr
aS9zcGFjZXMvUUVNVS9wYWdlcy8yOTQ2NDA2ODA5Ny9SdW4rQW5kcm9pZCt1c2luZytRRU1VIiBy
ZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2xpbmFyby5hdGxhc3NpYW4u
bmV0L3dpa2kvc3BhY2VzL1FFTVUvcGFnZXMvMjk0NjQwNjgwOTcvUnVuK0FuZHJvaWQrdXNpbmcr
UUVNVTwvYT4gJmx0OzxhIGhyZWY9Imh0dHBzOi8vbGluYXJvLmF0bGFzc2lhbi5uZXQvd2lraS9z
cGFjZXMvUUVNVS9wYWdlcy8yOTQ2NDA2ODA5Ny9SdW4rQW5kcm9pZCt1c2luZytRRU1VIiByZWw9
Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2xpbmFyby5hdGxhc3NpYW4ubmV0
L3dpa2kvc3BhY2VzL1FFTVUvcGFnZXMvMjk0NjQwNjgwOTcvUnVuK0FuZHJvaWQrdXNpbmcrUUVN
VTwvYT4mZ3Q7Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIEFzIHlvdSYjMzk7bGwgc2Vl
LCBJIGNvdWxkIG5vdCBnZXQgYTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoGRpcmVjdCBn
cmFwaGljPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoG91dHB1dCwgYnV0IHVzaW5nPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIHNjcmNweSwgaXQgd29ya2VkIHdl
bGwgZm9yIG1lLiBIb3BlPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgaXQgY2FuIGZpdCB5
b3VyPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oHVzZSBjYXNlLjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgUmVnYXJkcyw8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAg
UGllcnJpY2s8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIE9uIDkvMi8yNCAwNjo0OSwgTWFyaW8gTWFy
aWV0dG8gd3JvdGU6PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0OyBIZWxsby48YnI+DQomZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0OyBJIHdvdWxkIGxpa2UgdG8gZW11bGF0ZSBBbmRy
b2lkPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgMTQgb24gbXkgVWJ1bnR1PGJyPg0KJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoDI0LjA0IE9TIFg2
NCBiaXQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDsmZ3Q7wqAgwqAgwqAgdXNpbmc8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHFlbXUtc3lz
dGVtLWFhcmNoNjQuIEkgdHJpZWQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqB1c2luZyB0
aGUgZm9sbG93aW5nPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoHBhcmFtZXRlcnMgOjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7IHFlbXUtc3lzdGVtLWFhcmNoNjQgXDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCDCoCAtc21wIDQgXDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCAt
bSAyMDQ4IFw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgLWNwdSBjb3J0ZXgt
YTcyIFw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgLU0gdmlydCBcPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIC1kZXZpY2U8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqB2aXJ0aW8tZ3B1LXBjaSx4cmVzPTEwMjQseXJlcz03NjggXDxicj4NCiZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCAtZGlzcGxheSBzZGwsZ2w9b24gXDxicj4NCiZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCAtZGV2aWNlIHVzYi1laGNpIFw8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgLWRldmljZSB1c2Ita2JkIFw8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAgwqAgLWRldmljZSB2aXJ0aW8tdGFibGV0LXBjaSBcPGJyPg0KJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIC11c2IgXDxicj4NCiZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCDCoCAtc2VyaWFsIHN0ZGlvIFw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAgwqAgLWtlcm5lbDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAvbW50L3pyb290LTEzMy9fT1MvQW5kcm9pZC9ycGk0L0ltYWdlIFw8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgLWluaXRyZDxicj4NCiZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAvbW50L3pyb290LTEzMy9fT1Mv
QW5kcm9pZC9ycGk0L3JhbWRpc2suaW1nIFw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqDCoMKgIC1kcml2ZTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGluZGV4PTAsaWY9bm9uZSxpZD1zeXN0ZW0sZmlsZT0vbW50L3pyb290LTEz
My9fT1MvQW5kcm9pZC9ycGk0L2Jvb3QuaW1nIFw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAgwqAgLWRldmljZTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoHZpcnRpby1ibGst
cGNpLGRyaXZlPWJvb3QgXDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDvCoCDCoMKgwqDCoMKgwqDCoCAt
ZHJpdmU8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBpbmRleD0xLGlmPW5vbmUsaWQ9c3lzdGVtLGZpbGU9L21udC96cm9vdC0xMzMvX09TL0Fu
ZHJvaWQvcnBpNC9zeXN0ZW0uaW1nIFw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAg
wqAgLWRldmljZTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoHZpcnRpby1ibGstcGNpLGRy
aXZlPXN5c3RlbSBcPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIC1kcml2ZTxi
cj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0
OyZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlu
ZGV4PTIsaWY9bm9uZSxpZD12ZW5kb3IsZmlsZT0vbW50L3pyb290LTEzMy9fT1MvQW5kcm9pZC9y
cGk0L3ZlbmRvci5pbWcgXDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCAtZGV2
aWNlPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgdmlydGlvLWJsay1wY2ksZHJpdmU9dmVu
ZG9yIFw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IC1hcHBlbmQgJnF1b3Q7Y29uc29sZT10dHlBTUEw
LDM4NDAwPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgZHJtLmRlYnVnPTB4MDxicj4NCiZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqByb290d2FpdCBy
b290ZGVsYXk9NTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDsgcm9vdD0vZGV2L21tY2JsazBwMjxicj4N
CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoGFuZHJvaWRib290LmhhcmR3YXJlPXJwaTQ8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7IGFuZHJvaWRib290LnNlbGludXg9cGVybWlzc2l2ZTxicj4NCiZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoHNlY3VyaXR5PXNlbGludXg8YnI+DQomZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgc2VsaW51eD0xPGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKg
IMKgJmd0OyBhbmRyb2lkYm9vdC5xZW11Lmh3Lm1haW5rZXlzPTA8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgYW5kcm9pZGJvb3QubGNkLmRlbnNp
dHk9MTYwJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDsg
VGhlIGVycm9yIEkgZ2V0IGluIHNob3J0IGlzIDo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0
O8KgIMKgIMKgIMKgJmd0OyBbIDEuOTkzNjY4XSBpbml0OiBib29sPGJyPg0KJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKg
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYW5kcm9pZDo6aW5pdDo6Qmxv
Y2tEZXZJbml0aWFsaXplcjo6SW5pdERldmljZXMoc3RkOjpzZXQmbHQ7c3RkOjpzdHJpbmcmZ3Q7
KTo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHBhcnRpdGlvbihzKSBub3QgZm91bmQgaW4gL3N5cyw8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqB3YWl0aW5nIGZvcjxicj4NCiZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqB0aGVpciB1ZXZlbnQocyk6PGJy
Pg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
Jmd0O8KgIMKgIMKgIG1tY2JsazBwMiw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IG1tY2JsazBwMzxi
cj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0
OyZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKg
IMKgJmd0OyBPbmUgdXNlciBzdWdnZXN0ZWQgdG8gOjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDC
oCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0OyBIaSEhISBU
aGUgJnF1b3Q7L3N5cyZxdW90OyBpcyBhICZxdW90O2R5bmFtaWM8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqBmcyZxdW90OyBjcmVhdGVkIGF0PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoHJhbSBmcm9tIHRoZTxicj4NCiZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCBr
ZXJuZWwsIHRvPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0OyBleHBvcnQgYSBsb3Qgb2YgdGhpbmdzLi4u
c28gbW9zdDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoG9mIHRoZSBmaWxlczxicj4NCiZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBvbmx5IGV4aXN0
IGF0IHJ1bnRpbWUuPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0OyBOb3JtYWxseSwgdGhlIHBhcnRpdGlv
bnMgZnJvbSB0aGU8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBibG9jayBkZXZpY2U8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgaGF2ZSBh
IHN5bWxpbmsgYXQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IC9zeXMvJmx0O3NvbWV0aGluZyZndDsv
Jmx0Oy4uLiZndDsgdGhhdDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoHBvaW50cyB0byAv
ZGV2Lzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqBibG9jayBub2RlLiBJdCBzZWVtczxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCB0aGF0PGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKg
IMKgJmd0OyB0aGVyZSBhcmUgbm8gc3VjaCBmaWxlcyB1bmRlcjxicj4NCiZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoC9zeXMgYWNjb3JkaW5nIHRvPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoHdoYXQgaW5pdCBpcyBsb29raW5nPGJyPg0KJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKg
IMKgIMKgJmd0OyBmb3IuIFlvdSBjYW4gZG91YmxlIGNoZWNrIHRoaXMgYXQ8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqBpbml0IHNvdXJjZTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBjb2RlIHRvIGNoZWNrIHRoZTxicj4NCiZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDC
oCBleGFjdDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDsgcGF0aCBidXQgSSYjMzk7bSBndWVzc2luZyB0
aGF0IHlvdSYjMzk7bGw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBoYXZlIHRvIGNoYW5n
ZTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqB0
aGUgcWVtdSBhcmd1bWVudHM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHJlZ2FyZGluZyB0aGUgYmxv
Y2sgZGV2aWNlLjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IEFi
b3V0IHVzZXJkYXRhLmltZyBJIHRoaW5rIGl0JiMzOTtzPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgbm9ybWFsIHNpbmNlIGluPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoHRoZSBvbGQgZGF5cywgdGhlPGJyPg0KJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIGltYWdl
PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAm
Z3Q7Jmd0O8KgIMKgIMKgIMKgJmd0OyB3YXMgYSAmcXVvdDtlbXB0eSBzcGFyc2UgaW1hZ2UmcXVv
dDssIHRoYXQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBtZWFucywgYXQgdGhlPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoGZpcnN0IGZs
YXNoaW5nPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIHByb2Nlc3MsPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0OyB0aGVy
ZSBpc24mIzM5O3QgdXNlcmRhdGEgaW5mb3JtYXRpb24sPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgd2UmIzM5O3JlIGp1c3Q8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgJnF1b3Q7Zmxhc2hpbmcgdGhlPGJyPg0KJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIHBhcnRp
dGlvbiZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDsgd2l0aCBlbXB0eSBkYXRhLjxicj4NCiZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvC
oCDCoCDCoCDCoCZndDsgVGtzISEhPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDC
oCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0OyBTbyxp
biBzaG9ydCBJIHNob3VsZCBjaGFuZ2UgdGhlPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
cWVtdSBhcmd1bWVudHM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgcmVnYXJkaW5nIHRoZSBibG9jazxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDsgZGV2
aWNlLiBJIHRyaWVkIGluIHRoaXMgd2F5IDo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8Kg
IMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDsgcWVtdS1zeXN0ZW0tYWFyY2g2NCBc
PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAm
Z3Q7Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIC1zbXAgNCBcPGJyPg0KJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIC1tIDIwNDggXDxicj4NCiZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCDCoCAtY3B1IGNvcnRleC1hNzIgXDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCDCoCAtTSB2aXJ0IFw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAg
LWRldmljZTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoHZpcnRpby1ncHUtcGNpLHhyZXM9
MTAyNCx5cmVzPTc2OCBcPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIC1kaXNw
bGF5IHNkbCxnbD1vbiBcPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIC1kZXZp
Y2UgdXNiLWVoY2kgXDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCAtZGV2aWNl
IHVzYi1rYmQgXDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCAtZGV2aWNlIHZp
cnRpby10YWJsZXQtcGNpIFw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgLXVz
YiBcPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIC1zZXJpYWwgc3RkaW8gXDxi
cj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0
OyZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCAta2VybmVsPGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoC9tbnQvenJvb3QtMTMzL19P
Uy9BbmRyb2lkL3JwaTQvSW1hZ2UgXDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDC
oCAtaW5pdHJkPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoC9tbnQvenJvb3QtMTMzL19PUy9BbmRyb2lkL3JwaTQvcmFtZGlzay5pbWcgXDxicj4N
CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoMKgwqDCoMKgwqDCoCAtaGRhPGJyPg0KJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoC9tbnQvenJvb3QtMTMzL19PUy9B
bmRyb2lkL3JwaTQvYm9vdC5pbWcgXDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDC
oCAtaGRiPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoC9tbnQvenJvb3QtMTMzL19PUy9BbmRyb2lkL3JwaTQvc3lzdGVtLmltZyBcPGJyPg0KJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIC1oZGM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgL21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQv
cnBpNC92ZW5kb3IuaW1nIFw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgLWFwcGVu
ZCAmcXVvdDtjb25zb2xlPXR0eUFNQTAsMzg0MDA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgZHJtLmRlYnVnPTB4MCByb290d2FpdDxicj4NCiZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvC
oCDCoCDCoCByb290ZGVsYXk9NTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDsgcm9vdD0vZGV2L21tY2Js
azBwMjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoGFuZHJvaWRib290LmhhcmR3YXJlPXJw
aTQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGFuZHJvaWRib290LnNlbGludXg9cGVybWlzc2l2ZTxi
cj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoHNlY3VyaXR5PXNlbGludXg8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgc2VsaW51eD0xPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0
O8KgIMKgIMKgIMKgJmd0OyBhbmRyb2lkYm9vdC5xZW11Lmh3Lm1haW5rZXlzPTA8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgYW5kcm9pZGJvb3Qu
bGNkLmRlbnNpdHk9MTYwJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDC
oCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGJ1dCB0aGUgZXJyb3IgaXMgc3RpbGwgdGhl
cmUuIERvPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgeW91IGtub3cgc29tZTxicj4NCiZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBkaWZmZXJlbnQg
YWx0ZXJuYXRpdmU8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGJsb2NrIGRldmljZXMgdG8gdHJ5ID8g
dGhhbmtzLjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDsmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0
O8KgIMKgIMKgIMKgJmd0OyAtLTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDvCoCDCoCDCoCDCoCZndDsgTWFyaW8uPGJyPg0KJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Jmd0Ozxi
cj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0
OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgICZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmZ3Q7Jmd0OyAtLTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0OyZndDsgTWFyaW8uPGJyPg0KJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
ICZndDvCoCDCoCDCoCDCoCDCoC0tPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoE1hcmlvLjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAtLTxi
cj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7wqAgwqAgwqBNYXJpby48YnI+DQomZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAm
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmd0OyAtLTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7IE1h
cmlvLjxicj4NCiZndDsgPGJyPg0KJmd0OyA8YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDCoCDC
oCDCoC0tIDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoE1hcmlvLjxicj4NCiZndDsgPGJyPg0KJmd0
OyA8YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDCoC0tIDxicj4NCiZndDvCoCDCoCDCoE1hcmlv
Ljxicj4NCiZndDsgPGJyPg0KJmd0OyA8YnI+DQomZ3Q7IDxicj4NCiZndDsgLS0gPGJyPg0KJmd0
OyBNYXJpby48YnI+DQo8L2Jsb2NrcXVvdGU+PC9kaXY+PGJyIGNsZWFyPSJhbGwiPjxicj48c3Bh
biBjbGFzcz0iZ21haWxfc2lnbmF0dXJlX3ByZWZpeCI+LS0gPC9zcGFuPjxicj48ZGl2IGRpcj0i
bHRyIiBjbGFzcz0iZ21haWxfc2lnbmF0dXJlIj5NYXJpby48YnI+PC9kaXY+DQo=
--000000000000608a0206213a3c07--
