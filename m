Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4221392lfa;
        Tue, 8 Jun 2021 01:45:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvcHP9DbaZKqXnTl6Loi9FQzUiLrqTWNfYNIEmQhqirh1htoLakIHAAO23vyCnPF5RKCgT
X-Received: by 2002:a17:907:9721:: with SMTP id jg33mr12500215ejc.64.1623141901044;
        Tue, 08 Jun 2021 01:45:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623141901; cv=none;
        d=google.com; s=arc-20160816;
        b=vLAkAnyadKlD9t34moIthP4TcVqQ4WASUgMWw8RaGvIFm7bnM5GtK46Kxwmr+9OqzO
         bYZnOPLB4Bc5kj6uK45LxcBDLXWg1fWXwsCq4ntATG7WbucpzreIboRJ/ETOdaenvE9a
         P/eSesm7T4E8Lf5T0TKdF2a9PwS4EBY7eDc3gpYquZR4QO7vgXWpKtwPxLiWjkY/GI7w
         S40glCs17anD9952bcxVhjq9g92GcTsCX82UyszXmfmAwP4YlIXD2WMs5jmtrfHnnYI7
         z+w2GAJzF12emkSwWZZjzULrKR14acryBw5XyGmkbpClvswZD3e1sGgxniyd5AzYMbTV
         fx4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=AfUK83u6XUviXdtQ9ZVpN77bLhprOo2KRa58JOI09ao=;
        b=k4gfSqr6CU7kIfVo3MYYbY8U+4hryZOgSCydHqUwIKNUVYOinNL+FKRO+Zj3vonma/
         Z1BaKdk+kQjALb9yred6cwe1rM/J2jZiO0fKa0JI5Gnj5hHHmrjK7ZrNL1dDv+CnplYs
         F6uBOE1Zl0itAjkiTYxAKeX13tn+4Vi8uiZIp+BGvuMHtzLmYir5WJH42he7tMLE8rPU
         VmQA7buLx00pefiEmcTtGlfw0gGauycBC6raA1e5+dnXFV6lPQc9iG/X+kY6d6BE6w4Z
         0kK1FvZir/FIJNHvCf0ubr5nzOfuuiyGwPyqqnzr/47zGE5zhJ92Csq2j1la9Uk5w4ks
         ejEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BIPmmtxC;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id cb18si14781086edb.80.2021.06.08.01.45.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Jun 2021 01:45:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BIPmmtxC;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623141900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AfUK83u6XUviXdtQ9ZVpN77bLhprOo2KRa58JOI09ao=;
	b=BIPmmtxCTzncn4mXMgWX6VvhyABV37lue6R83ezDbtpL001nNV0/+EP9YPPfg46A0vOMgo
	tYncQH8JujDgCbAv3gnRFhPkponRrYkwAOC7V1QeftMgOYgJy3Bw3oH16Ts3tyxPpEceNX
	CCaBEWqjrYZI7dmzO+x646MH/QpoQQI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-E0RsLfRCP0ShrDmCH1ophw-1; Tue, 08 Jun 2021 04:44:58 -0400
X-MC-Unique: E0RsLfRCP0ShrDmCH1ophw-1
Received: by mail-wm1-f70.google.com with SMTP id g81-20020a1c9d540000b02901a3d4d3f7fcso973165wme.2
        for <alex.bennee@linaro.org>; Tue, 08 Jun 2021 01:44:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AfUK83u6XUviXdtQ9ZVpN77bLhprOo2KRa58JOI09ao=;
        b=iU2GU7p1QscHI488vrlY9r6ZIjeDU3Z/n771439etBCzaeKQ+3pi6BQl56q/Vok+EN
         tas4LEwFK/ZxsqLs+d1PoRdZt+pTKIoDjD3/SRXJtZQyV5LbgHsNWGINsyqL/QhZPyE8
         Gcw2iNmN+31qeLjiojzc9E7tFN/Nn2x/n0yd2SP/BFaX8ye1Wzacj4WeRyCg78ea2nwC
         R8VuM+HSsnbqyOv6oF8UNJqb2FdR26QvJS+4nAFdeF2ZYOmoVv0jLVVZ4yToijQ4DFx5
         L4DkDs7hd/dQ3am9uXiCj5Exb4zvGxdFt4o0LxEpthSKh+t/aKGAvL/RNJHLsc2e50UZ
         Aglw==
X-Gm-Message-State: AOAM530Xzc24q3FDJTJH6nwHPLRch1oqPUI68+s1OI3A/aba0tPe/pbc
	ORsefeDsYQ5Mtya50VNGN4sPkEZ+RbX3MLaCbUwU5Oqne1yU7zhvwiwfSj75CaXja0BoiQY6Fp2
	j+zpEyB1X+QOgs1Sz
X-Received: by 2002:a5d:4fc6:: with SMTP id h6mr21874379wrw.1.1623141897479;
        Tue, 08 Jun 2021 01:44:57 -0700 (PDT)
X-Received: by 2002:a5d:4fc6:: with SMTP id h6mr21874367wrw.1.1623141897257;
        Tue, 08 Jun 2021 01:44:57 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.235])
        by smtp.gmail.com with ESMTPSA id w13sm20569472wrc.31.2021.06.08.01.44.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 01:44:56 -0700 (PDT)
Subject: Re: [PATCH v16 00/99] arm tcg/kvm refactor and split with kvm only
 support
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8a4af018-acc9-0d35-7f28-9b32987519a0@redhat.com>
Date: Tue, 8 Jun 2021 10:44:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 9JX1A/8sWwBe

Hi Alex,

On 6/4/21 5:51 PM, Alex Bennée wrote:
> Hi,
> 
> I have picked up the baton from Claudio to try and get the ARM
> re-factoring across the line. Most of the patches from Claudio remain
> unchanged and have just had minor fixups from re-basing against the
> moving target. I've done my best to make sure any fixes that have been
> made in the meantime weren't lost.
> 
> I've included Phillipe's qtest_has_accel v7 patches (I had problems
> with v8) to aid in my aarch64 testing. I'm expecting them to be
> up-streamed by Phillipe in due course. I've also nabbed one of
> Phillipe's Kconfig tweaks to allow for target specific expression of
> some config variables.
> 
> The main thing that enables the --disable-tcg build is the addition of
> --with-devices-FOO configure option which is a mechanism to override
> the existing default device configurations. The two that I've been
> testing are a 64 bit only build on x86:
> 
>   '../../configure' '--without-default-features' \
>      '--target-list=arm-softmmu,aarch64-softmmu' \
>      '--with-devices-aarch64=../../configs/aarch64-softmmu/64bit-only.mak'
> 
> which results in the aarch64-softmmu build only supporting sbsa-ref,
> virt and xlnx-versal-virt.
> 
> The second is a KVM only cross build:
> 
>   '../../configure' '--disable-docs' \
>     '--target-list=aarch64-softmmu' \
>     '--enable-kvm' '--disable-tcg' \
>     '--cross-prefix=aarch64-linux-gnu-' \
>     '--with-devices-aarch64=../../configs/aarch64-softmmu/virt-only.mak'
> 
> Finally I've made a few minor Kconfig and testing tweaks before adding
> some gitlab coverage. As a result I was able to drop the Revert: idau
> patch because I can properly build an image without stray devices in
> the qtree.
> 
> The following need review:
> 
>  - gitlab: defend the new stripped down arm64 configs
>  - tests/qtest: make xlnx-can-test conditional on being configured
>  - tests/qtest: split the cdrom-test into arm/aarch64
>  - hw/arm: add dependency on OR_IRQ for XLNX_VERSAL
>  - target/arm: move CONFIG_V7M out of default-devices

Without using --with-devices-aarch64, I'm getting:

FAILED: libqemu-aarch64-softmmu.fa.p/target_arm_tcg_sysemu_m_helper.c.o
cc -Ilibqemu-aarch64-softmmu.fa.p -I. -I../.. -Itarget/arm
-I../../target/arm -I../../capstone/include/capstone -Iqapi -Itrace -Iui
-Iui/shader -I/usr/include/pixman-1 -I/usr/include/spice-server
-I/usr/include/spice-1 -I/usr/include/glib-2.0
-I/usr/lib/aarch64-linux-gnu/glib-2.0/include -fdiagnostics-color=auto
-pipe -Wall -Winvalid-pch -Werror -std=gnu99 -O2 -g -isystem
/home/phil/qemu/linux-headers -isystem linux-headers -iquote . -iquote
/home/phil/qemu -iquote /home/phil/qemu/include -iquote
/home/phil/qemu/disas/libvixl -pthread -U_FORTIFY_SOURCE
-D_FORTIFY_SOURCE=2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64
-D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef
-Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common
-fwrapv -Wold-style-declaration -Wold-style-definition -Wtype-limits
-Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers
-Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined
-Wimplicit-fallthrough=2 -Wno-missing-include-dirs
-Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIE
-isystem../../linux-headers -isystemlinux-headers -DNEED_CPU_H
'-DCONFIG_TARGET="aarch64-softmmu-config-target.h"'
'-DCONFIG_DEVICES="aarch64-softmmu-config-devices.h"' -MD -MQ
libqemu-aarch64-softmmu.fa.p/target_arm_tcg_sysemu_m_helper.c.o -MF
libqemu-aarch64-softmmu.fa.p/target_arm_tcg_sysemu_m_helper.c.o.d -o
libqemu-aarch64-softmmu.fa.p/target_arm_tcg_sysemu_m_helper.c.o -c
../../target/arm/tcg/sysemu/m_helper.c
In file included from ../../target/arm/tcg/sysemu/m_helper.c:12:
/home/phil/qemu/include/exec/helper-proto.h:41:10: fatal error:
trace/generated-helpers.h: No such file or directory
   41 | #include "trace/generated-helpers.h"
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.

both --enable-xen and --disable-xen.

Is that expected?

Thanks,

Phil.
