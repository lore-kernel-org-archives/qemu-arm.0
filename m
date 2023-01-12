Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp4703419ejc;
        Thu, 12 Jan 2023 03:20:48 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuCqR8pcYIvFR1EC+gcJ65LrQMVrvWIbsYsHvyqa+uyEKUeXwXfcXl8Ve/jCvt6u46WZHhR
X-Received: by 2002:ac8:7c8b:0:b0:3a5:4fa8:141c with SMTP id y11-20020ac87c8b000000b003a54fa8141cmr13252970qtv.23.1673522448421;
        Thu, 12 Jan 2023 03:20:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673522448; cv=none;
        d=google.com; s=arc-20160816;
        b=F0xdNIG8YmgwtPZHSj71VEFSqFzu/rY1kKb+o9ejOfNjMigQH2XO/FwghfvbFUF099
         QYgKUHaNSvJWh49VHpsVY0MhLVaVgMaQ3CJSAB4PZmH5tevGVpxQKGLEr1J4h8yeq+vf
         Hx0DGZMO1d4ZCsGoI7ZDbE8geIec+aDT2iWHLvH6rb9dkp0KkW0z4qAAoU4HDHqE1IsK
         L0RRYHYignRHi1gTFYNj0D8O9KyirRPxXsJSo3hu2qq23Ed3RIsYjfg4MCapz/kz2HQ/
         32Jgos6xPUSCZoXU/oWYL3i9e6xGyRVm1nKkMLgDh0ic6dRxs8qAvFg3TWIy7t/L/Dk/
         YdHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=JnAC9Rw0dpTSPawHnysPOek8UnGCBXB9113lAWZhX3M=;
        b=lnkVynPSuswxQ7TIIl8IH78GcfEKnb8Uk/pf66LlFBXexcCQz1tf0jZuciAd3+KZ9i
         /5qHK0UTJM1aBIQRl4GIVNsC7m4QkxtXhFslNS+AJrZHQrzWeyl/A1x7zTixwxeGFzO+
         JeNi7PNKnXYdpVsjclVMkf4BKBGbFMji75pjolD5Huz0ybmpiQDdn2a5Xt2sJRc4SM8Q
         +A5/jy8+RXwVCiwOj8USIH/jkzNRTQNUW2Sfbc5vYQFndO2cUSK/C14tZ0HlQGUSkAPl
         1mOVQ9oljOSOmINeucrEbn+VNQrWvWoYl/yAJ2Rjjc9adHeDJEu8xZ35nTJzLhHXW06P
         MGHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="ZyG/+aYV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i26-20020ac860da000000b0039cdeacc6cbsi10711139qtm.120.2023.01.12.03.20.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Jan 2023 03:20:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="ZyG/+aYV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pFvTa-00048L-Ts; Thu, 12 Jan 2023 06:10:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <janne.karhunen@gmail.com>)
 id 1pFvTW-000464-JL
 for qemu-arm@nongnu.org; Thu, 12 Jan 2023 06:10:27 -0500
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <janne.karhunen@gmail.com>)
 id 1pFvTQ-0001Fd-EW
 for qemu-arm@nongnu.org; Thu, 12 Jan 2023 06:10:22 -0500
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-4b6255ce5baso233631357b3.11
 for <qemu-arm@nongnu.org>; Thu, 12 Jan 2023 03:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=JnAC9Rw0dpTSPawHnysPOek8UnGCBXB9113lAWZhX3M=;
 b=ZyG/+aYVz1KLwsKWRKhenvUDxKoZ638TFnwrWf3ZhJGPZjqp6CPm2tESRe+vOT9+Bg
 l2uv/QM3W3T9OoVuSM5ehj1ggp3wIcAjgSDPyI66/DVh4Kt8WX7RzxjIGaayUsM4y36y
 PFTPVsjci1yxEa7j+RGcWDp7hO+6FPdQCfrXRY67xx2I+ZaGwym9DXCuu4ooQMunN87A
 vfh2GnocknCn8bEQP/7sPoYfQ3MX8I97nPFrgHiB3dsqFkGCLZVTa/6LzSkcbw+Miq/A
 YmhYgkXN5BHbyzp2QUAyVemfiQxNsLVWAgrr59UFNITYQZG8knDYokrX3mTYlAe0yavV
 t5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JnAC9Rw0dpTSPawHnysPOek8UnGCBXB9113lAWZhX3M=;
 b=RVDeCqXzNm1KdwuRCtyKEcPrObNVAsgb4xFbv0uk8bNL+jc/EB0RCpYOns6V8SDp5l
 jNMXCb3BiWoF4RtsbXR/i1EePL8jHiLqqRkfEPfbfe/3BHwVO0XNU6jaqU3nfWU0DqM6
 N3l5VczbRvBv8tkBlMBXhEOWi36zp43qyt9QXfvyG0fWBFiyxYc6qmfJ/D+brCWe7D6C
 wGSOuS1qOmwD0ycGma5q7kG1v9T9o6pfqxol7QyLKFRizS2arUBbhgXjfsKRM7VzEpCK
 +bQWcihzlUljoy5Ag1Qeju5XhZOb745QUYH2q7Ajq6XOSgk9GtZ6tBuQTPWo4jDpKa3N
 zG8Q==
X-Gm-Message-State: AFqh2kq2kcmLLaxoUCtUxvbGElxs5p5RTttRDvxXYvuH7NqYfHLlnaxp
 8DTczIytRwdehRyV83A/BE4WGSt04YprTX8thNpPf9/7fS3atg==
X-Received: by 2002:a81:3984:0:b0:472:f0bc:6c3e with SMTP id
 g126-20020a813984000000b00472f0bc6c3emr1784468ywa.240.1673521818343; Thu, 12
 Jan 2023 03:10:18 -0800 (PST)
MIME-Version: 1.0
From: Janne Karhunen <janne.karhunen@gmail.com>
Date: Thu, 12 Jan 2023 13:10:05 +0200
Message-ID: <CAE=NcrY02FoRhbAYiw+BQ9q111HcMmGjbpVW0pM8e6P5agusHQ@mail.gmail.com>
Subject: static builds on aarch64 ubuntu 22.04
To: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=janne.karhunen@gmail.com; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: EBDQveB6V5ke

Hi,

Anyone seen this on aarch64 ubuntu 22.04 when doing a static build?
Broken libc build maybe? Standard -fPIC (and disabled PIE as AFAIK
those are mutually exclusive) doesn't seem to affect, neither does
gcc9 -> gcc10 change or even entirely disabled stack protector.

[2751/2752] cc -Ilibqemu-aarch64-softmmu.fa.p -I. -I.. -Itarget/arm
-I../target/arm -Iqapi -Itrace -Iui -Iui/shader
-I/usr/include/pixman-1 -I/usr/include/spice-server
-I/usr/include/spice-1 -I/usr/include/glib-2.0
-I/usr/lib/aarch64-linux-gnu/glib-2.0/include -fdiagnostics-color=auto
-Wall -Winvalid-pch -std=gnu11 -O2 -g -isystem
/build/qemu/linux-headers -isystem linux-headers -iquote . -iquote
/build/qemu -iquote /build/qemu/include -iquote
/build/qemu/tcg/aarch64 -pthread -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2
-D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE
-Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings
-Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv
-Wold-style-declaration -Wold-style-definition -Wtype-limits
-Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers
-Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined
-Wimplicit-fallthrough=2 -Wno-missing-include-dirs
-Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIC
-fno-stack-protector -isystem../linux-headers -isystemlinux-headers
-DNEED_CPU_H '-DCONFIG_TARGET="aarch64-softmmu-config-target.h"'
'-DCONFIG_DEVICES="aarch64-softmmu-config-devices.h"' -MD -MQ
libqemu-aarch64-softmmu.fa.p/target_arm_sve_helper.c.o -MF
libqemu-aarch64-softmmu.fa.p/target_arm_sve_helper.c.o.d -o
libqemu-aarch64-softmmu.fa.p/target_arm_sve_helper.c.o -c
../target/arm/sve_helper.c
[2752/2752] c++ @qemu-system-aarch64.rsp
FAILED: qemu-system-aarch64
c++ @qemu-system-aarch64.rsp
/usr/bin/ld: /usr/lib/aarch64-linux-gnu/libgmodule-2.0.a(gmodule.c.o):
in function `g_module_open_full':
(.text+0x5bc): warning: Using 'dlopen' in statically linked
applications requires at runtime the shared libraries from the glibc
version used for linking
/usr/bin/ld: libblockdev.fa.p/os-posix.c.o: in function `change_process_uid':
/build/qemu/build/../os-posix.c:174: warning: Using 'initgroups' in
statically linked applications requires at runtime the shared
libraries from the glibc version used for linking
/usr/bin/ld: /usr/lib/aarch64-linux-gnu/libgio-2.0.a(glocalfileinfo.c.o):
in function `_g_local_file_info_get':
(.text+0x35e4): warning: Using 'getgrgid_r' in statically linked
applications requires at runtime the shared libraries from the glibc
version used for linking
/usr/bin/ld: /usr/lib/libmount.a(la-utils.o): in function `mnt_get_gid':
/build/util-linux-2.37.4/libmount/src/utils.c:649: warning: Using
'getgrnam_r' in statically linked applications requires at runtime the
shared libraries from the glibc version used for linking
/usr/bin/ld: libblockdev.fa.p/os-posix.c.o: in function `os_parse_cmd_args':
/build/qemu/build/../os-posix.c:136: warning: Using 'getpwnam' in
statically linked applications requires at runtime the shared
libraries from the glibc version used for linking
/usr/bin/ld: libcommon.fa.p/net_slirp.c.o: in function `slirp_smb':
/build/qemu/build/../net/slirp.c:890: warning: Using 'getpwuid' in
statically linked applications requires at runtime the shared
libraries from the glibc version used for linking
/usr/bin/ld: /usr/lib/libmount.a(la-utils.o): in function `mnt_get_uid':
/build/util-linux-2.37.4/libmount/src/utils.c:622: warning: Using
'getpwnam_r' in statically linked applications requires at runtime the
shared libraries from the glibc version used for linking
/usr/bin/ld: /usr/lib/aarch64-linux-gnu/libgio-2.0.a(glocalfileinfo.c.o):
in function `lookup_uid_data':
(.text+0x12fc): warning: Using 'getpwuid_r' in statically linked
applications requires at runtime the shared libraries from the glibc
version used for linking
/usr/bin/ld: libcommon.fa.p/net_l2tpv3.c.o: in function `net_init_l2tpv3':
/build/qemu/build/../net/l2tpv3.c:640: warning: Using 'getaddrinfo' in
statically linked applications requires at runtime the shared
libraries from the glibc version used for linking
/usr/bin/ld: libcommon.fa.p/net_net.c.o: in function `parse_host_port':
/build/qemu/build/../net/net.c:102: warning: Using 'gethostbyname' in
statically linked applications requires at runtime the shared
libraries from the glibc version used for linking
/usr/bin/ld: /usr/lib/aarch64-linux-gnu/libgio-2.0.a(gnetworkaddress.c.o):
in function `g_network_address_parse':
(.text+0x18d8): warning: Using 'getservbyname' in statically linked
applications requires at runtime the shared libraries from the glibc
version used for linking
/usr/bin/ld: (.text+0x18f0): warning: Using 'endservent' in statically
linked applications requires at runtime the shared libraries from the
glibc version used for linking
/usr/lib/gcc/aarch64-linux-gnu/10/../../../aarch64-linux-gnu/libc.a(abort.o):
in function `abort':
(.text.unlikely+0x20): relocation truncated to fit:
R_AARCH64_LD64_GOTPAGE_LO15 against symbol `__stack_chk_guard' defined
in .data.rel.ro section in
/usr/lib/gcc/aarch64-linux-gnu/10/../../../aarch64-linux-gnu/libc.a(libc-start.o)
/usr/bin/ld: (.text.unlikely+0x20): warning: too many GOT entries for
-fpic, please recompile with -fPIC
collect2: error: ld returned 1 exit status
ninja: build stopped: subcommand failed.
make[1]: *** [Makefile:162: run-ninja] Error 1
make[1]: Leaving directory '/build/qemu/build'
make[1]: Entering directory '/build/qemu/build'
[1/51] Generating qemu-version.h with a custom command (wrapped by
meson to capture output)
[2/36] Linking target qemu-system-aarch64
FAILED: qemu-system-aarch64



--
Janne
