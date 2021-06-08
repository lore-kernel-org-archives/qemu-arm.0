Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4224088lfa;
        Tue, 8 Jun 2021 01:50:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMMjJZK4aZGwXsTlA7Qqm0TOAR3hrqrxYlV6jSgTFD0QlGZ1A+U3kdErVfm3h2L4vy5ME/
X-Received: by 2002:a17:906:2988:: with SMTP id x8mr22587410eje.122.1623142212708;
        Tue, 08 Jun 2021 01:50:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623142212; cv=none;
        d=google.com; s=arc-20160816;
        b=jtrpVclDLXnz5PY+5ZW84xV0BwuazzersrnZm+IefxVXqu46L9yropVSOIh4p7t89I
         IkvKBBu0/Q4gsf/lBc0LpExbrYNGqXJgDywgKxCYZxVoRJzMZSYWMakegGh3vsj36wNz
         GnJeSCVjOAuPpA0uNZtx88ERFHLxYofEkxZ7PizWvPxmSRQjEcT0gQqLqso90bh2q9ff
         Rm5UWOgtCGROyGRsi+ilUMxTDVujmoY+lD3SoNUWp5mWVldeoWFUCzLrAPK0hNEfvphf
         F4VoJNpoucbgP+z72Vf1GGahGen9R/tzo57DDsWgIw5qSMbToxLXavXZY1/AoPwJboF4
         PULA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject
         :dkim-signature;
        bh=3vNNkAxm7jCoL7keVki3btNM5++6I3t/W1L8MVZn7aY=;
        b=hH1hfnnSR4HJ9DnZ59otG33X2YFdqGnQ/mEYhiaMnhiAFNM7DLQ/waVku8Eeqqd9WM
         7PMST6uk6K6H81Mmg8H+WoBLSXEyW0M/aXbUBv4zKxnzPlxcx67/09dyW4VydYN7ZGpp
         IR4aN9aLYi2MwtQ9FOY1boeCOEVCoB3G/7tMcEl8WnBf/0ACCvSrsVPhR4ZX4kwHl45t
         uuHico/bxXnoiByZDS+jQKHz0n80YQUQUnP2UilDDcRRx05BnH0Z7YQ1x9Dwoh37m+Ux
         V5TglfpnxiOmBs/LJggZn+lAY7z7nmyW/mFyesxOIIViqt4ku1EX65xTIXIT+cQ3LJGw
         CHHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="GHmHFM/c";
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id jo17si14792498ejb.32.2021.06.08.01.50.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Jun 2021 01:50:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="GHmHFM/c";
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623142211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3vNNkAxm7jCoL7keVki3btNM5++6I3t/W1L8MVZn7aY=;
	b=GHmHFM/ccewbk5YRBT9ovlOb3GTEDYh79DSwyq4drEk+FGGE0YZdCBVly+2haJ24FcgndE
	Vz8lYAWsC8n/UDabrHgHBC/1WKawUfL7KeXK5cx+4m5FAj7IPH3M5slvgL6YPOtkcA1XEc
	sr7mhTGBt7sEZefXpefjPVwxO7ERvJQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-SYkNUu1aPPS-sOFbZ5AySA-1; Tue, 08 Jun 2021 04:50:10 -0400
X-MC-Unique: SYkNUu1aPPS-sOFbZ5AySA-1
Received: by mail-wr1-f70.google.com with SMTP id k25-20020a5d52590000b0290114dee5b660so9143203wrc.16
        for <alex.bennee@linaro.org>; Tue, 08 Jun 2021 01:50:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3vNNkAxm7jCoL7keVki3btNM5++6I3t/W1L8MVZn7aY=;
        b=hzfi8PcT8qhDnvnMwagESTBWcGJS7snCj4EY+A8o8+ojQbcBYGS1+NV+WyHMRh21SO
         zJgT4lD1t9yTPV7IVKh7ws4vsmLj9O96vGHF+wbBesiHAv1srglCYsk6Svt/nhclr7/+
         HTL60rCvx0REbqJ6Ifen7+rYbiDd6cvsC09x75ECYja0WTXUh3gShkmqGYCYPK9bxqsN
         YDMJhFf/pQqGCdZkPvS9pvQJGq8l+h67U8vNHZ5p5VPe0Yoil35jJJmJO8evWt0QXINV
         K6g+gVFVOI4/ksTFcYsUNTmA5Aw0lcHTmlNc7DaEzy3ZwiKsjJ6EJR/1/yMHKtd14ZP8
         OP2g==
X-Gm-Message-State: AOAM531cbyevwSm8Gbp76AnFPBTwDDGmBzEQc6M7+0dvtzLth/7+q1nc
	CNmVax15if8SHSATH0cD5zJkTf8kEGiVX7d/FGXuJkrtA1Whn7u8QWPxKw+j0zh5p66haPlrIyj
	RcSZa+ZDBy6Xemtv3
X-Received: by 2002:a5d:6b52:: with SMTP id x18mr20856855wrw.11.1623142208945;
        Tue, 08 Jun 2021 01:50:08 -0700 (PDT)
X-Received: by 2002:a5d:6b52:: with SMTP id x18mr20856837wrw.11.1623142208748;
        Tue, 08 Jun 2021 01:50:08 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.235])
        by smtp.gmail.com with ESMTPSA id t1sm18788436wrx.28.2021.06.08.01.50.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 01:50:08 -0700 (PDT)
Subject: Re: [PATCH v16 00/99] arm tcg/kvm refactor and split with kvm only
 support
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <8a4af018-acc9-0d35-7f28-9b32987519a0@redhat.com>
Message-ID: <12350ead-ce55-ba94-53b5-23aac7bd265b@redhat.com>
Date: Tue, 8 Jun 2021 10:50:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <8a4af018-acc9-0d35-7f28-9b32987519a0@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: lU1ecxJo/+XM

On 6/8/21 10:44 AM, Philippe Mathieu-Daudé wrote:
> Hi Alex,
> 
> On 6/4/21 5:51 PM, Alex Bennée wrote:
>> Hi,
>>
>> I have picked up the baton from Claudio to try and get the ARM
>> re-factoring across the line. Most of the patches from Claudio remain
>> unchanged and have just had minor fixups from re-basing against the
>> moving target. I've done my best to make sure any fixes that have been
>> made in the meantime weren't lost.
>>
>> I've included Phillipe's qtest_has_accel v7 patches (I had problems
>> with v8) to aid in my aarch64 testing. I'm expecting them to be
>> up-streamed by Phillipe in due course. I've also nabbed one of
>> Phillipe's Kconfig tweaks to allow for target specific expression of
>> some config variables.
>>
>> The main thing that enables the --disable-tcg build is the addition of
>> --with-devices-FOO configure option which is a mechanism to override
>> the existing default device configurations. The two that I've been
>> testing are a 64 bit only build on x86:
>>
>>   '../../configure' '--without-default-features' \
>>      '--target-list=arm-softmmu,aarch64-softmmu' \
>>      '--with-devices-aarch64=../../configs/aarch64-softmmu/64bit-only.mak'
>>
>> which results in the aarch64-softmmu build only supporting sbsa-ref,
>> virt and xlnx-versal-virt.
>>
>> The second is a KVM only cross build:
>>
>>   '../../configure' '--disable-docs' \
>>     '--target-list=aarch64-softmmu' \
>>     '--enable-kvm' '--disable-tcg' \
>>     '--cross-prefix=aarch64-linux-gnu-' \
>>     '--with-devices-aarch64=../../configs/aarch64-softmmu/virt-only.mak'
>>
>> Finally I've made a few minor Kconfig and testing tweaks before adding
>> some gitlab coverage. As a result I was able to drop the Revert: idau
>> patch because I can properly build an image without stray devices in
>> the qtree.
>>
>> The following need review:
>>
>>  - gitlab: defend the new stripped down arm64 configs
>>  - tests/qtest: make xlnx-can-test conditional on being configured
>>  - tests/qtest: split the cdrom-test into arm/aarch64
>>  - hw/arm: add dependency on OR_IRQ for XLNX_VERSAL
>>  - target/arm: move CONFIG_V7M out of default-devices
> 
> Without using --with-devices-aarch64, I'm getting:
> 
> FAILED: libqemu-aarch64-softmmu.fa.p/target_arm_tcg_sysemu_m_helper.c.o
> cc -Ilibqemu-aarch64-softmmu.fa.p -I. -I../.. -Itarget/arm
> -I../../target/arm -I../../capstone/include/capstone -Iqapi -Itrace -Iui
> -Iui/shader -I/usr/include/pixman-1 -I/usr/include/spice-server
> -I/usr/include/spice-1 -I/usr/include/glib-2.0
> -I/usr/lib/aarch64-linux-gnu/glib-2.0/include -fdiagnostics-color=auto
> -pipe -Wall -Winvalid-pch -Werror -std=gnu99 -O2 -g -isystem
> /home/phil/qemu/linux-headers -isystem linux-headers -iquote . -iquote
> /home/phil/qemu -iquote /home/phil/qemu/include -iquote
> /home/phil/qemu/disas/libvixl -pthread -U_FORTIFY_SOURCE
> -D_FORTIFY_SOURCE=2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64
> -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef
> -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common
> -fwrapv -Wold-style-declaration -Wold-style-definition -Wtype-limits
> -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers
> -Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined
> -Wimplicit-fallthrough=2 -Wno-missing-include-dirs
> -Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIE
> -isystem../../linux-headers -isystemlinux-headers -DNEED_CPU_H
> '-DCONFIG_TARGET="aarch64-softmmu-config-target.h"'
> '-DCONFIG_DEVICES="aarch64-softmmu-config-devices.h"' -MD -MQ
> libqemu-aarch64-softmmu.fa.p/target_arm_tcg_sysemu_m_helper.c.o -MF
> libqemu-aarch64-softmmu.fa.p/target_arm_tcg_sysemu_m_helper.c.o.d -o
> libqemu-aarch64-softmmu.fa.p/target_arm_tcg_sysemu_m_helper.c.o -c
> ../../target/arm/tcg/sysemu/m_helper.c
> In file included from ../../target/arm/tcg/sysemu/m_helper.c:12:
> /home/phil/qemu/include/exec/helper-proto.h:41:10: fatal error:
> trace/generated-helpers.h: No such file or directory
>    41 | #include "trace/generated-helpers.h"
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> 
> both --enable-xen and --disable-xen.
> 
> Is that expected?

IIRC (this was looong ago) before this configuration was not
buildable and Kconfig was erroring with something like:
"dependency not satisfied: ARM_V7M select TCG"
