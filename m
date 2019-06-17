Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2638612wrg;
        Mon, 17 Jun 2019 08:33:55 -0700 (PDT)
X-Received: by 2002:a5d:540e:: with SMTP id g14mr1432308wrv.346.1560785635020;
        Mon, 17 Jun 2019 08:33:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560785635; cv=none;
        d=google.com; s=arc-20160816;
        b=fZ+vr37+adoWhag9QHjhl5ARTauU+RNl6MQs7qrqxT/ZyXCyXat91y4C7Z99N/h3j8
         91TtlVd/lq6Hxe4DxdDYP/MIA1gLcUzncbJK8WSlsrrI/xvE//xEzSw/pxkig5YXUAbl
         ZxrahzitwqFYaqtm6K08P9BeclK0nx1+JjAs9kdJIgsH4j0u6HHaRW8zssDwSCZJbHPm
         c9dBD8dNl859gW5Jjr09B9Mn73OtZdRilqYR2TAKaN6pnO5lxlpi2O3sAINBAptrTigB
         SP2bFEk6l0zdvjQHpcY57puEXP/JJxoLgFXwDjNdnlcp3+eievptlMmLVj3C8jwzvPbz
         +lpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=9lrRlMIMHEQC4vy/D8lyTESWp6sJBMthgCamSxf4p14=;
        b=De3pQ8hUb9v12+g8/0XCV0VatsA3lRSIurYbhkLiizn3U+T0M1PNLh73+6N0yoYNS0
         3alHI4j6IqGkMpJyslgIk8djyamiyYihwZSNzfNbcG/IOZS2WH6ru8q6osBkgUvWvi0h
         whsyosaA6vFFPLHaGMeuTIVBly4lEdLUJI3YAz0ZskpCVCtKk7Nz3A8DWUM1b3QqtZoB
         22X+1IUVSV7xmg3oBMrr7MEKLQsa8LuBF6Z9QZXC3YrHYMLcuOmRDj38LDOsA6sw+5vp
         o3v/jr+0Ub3arO20cYmGSCaYGkUD/9CIpEPz3PLUbYSAM+VBqDj2nQSiH/AGgrXINCAy
         Prxg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id t1sor6264747wmj.22.2019.06.17.08.33.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Jun 2019 08:33:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9lrRlMIMHEQC4vy/D8lyTESWp6sJBMthgCamSxf4p14=;
        b=MNgk4lygZBSMxhdTLn2m7NTEAUQvmjGwh860h9Rgq+jPq0oynzaG9v4AoUCEs98kHa
         987ncr1BQ1nGJzHq7VZqVitgs2VGDWZui+cV2Ys2cWn+JGaieZaXyTvpF111kkF9PRIJ
         45XsGl+MKFnD67SWdPKGqxV3GTQggqFEqXs+qnLPovnXYEXhyy8PEd7Xt8XQy1zIDNj9
         jsyVoWTpLSqP3HC1v0VGih4C9nb8k2aJeVoH+FQE7ZaDgmb9Tq7fKfmP1nj7u7T3K98h
         cGRfPuzSlLE1PDcT2PMduz7ruYafuM6GGy/TXug3g+yM5uWjI19EeUogXE1/rfnD+KPq
         jWwQ==
X-Gm-Message-State: APjAAAW0hzuQgGIV4v4JY7xpoPsPMwyl+bVu5cMm+ZRnQUSosW6of6QA
	vANtsQtKTqemweNwY7QxcHnkmw==
X-Google-Smtp-Source: APXvYqxVh+LaPVNZqFbh/L5PbBbUp7MBbTXMew0Efhdsub/O2ii/gQ34TzO9KcFCSSknIunqMeucrw==
X-Received: by 2002:a1c:9d48:: with SMTP id g69mr16489571wme.31.1560785634770;
        Mon, 17 Jun 2019 08:33:54 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.38] (183.red-88-21-202.staticip.rima-tde.net. [88.21.202.183])
        by smtp.gmail.com with ESMTPSA id t198sm18650719wmt.2.2019.06.17.08.33.53
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 08:33:54 -0700 (PDT)
Subject: Re: [RFC PATCH 1/2] target/arm: Add stubs to build with
 CONFIG_SEMIHOSTING disabled
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aleksandar Rikalo <arikalo@wavecomp.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20190531154735.20809-1-philmd@redhat.com>
 <20190531154735.20809-2-philmd@redhat.com> <878su09r38.fsf@zen.linaroharston>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <ff40b72b-3dc3-2d34-e5e4-5d110247c620@redhat.com>
Date: Mon, 17 Jun 2019 17:33:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <878su09r38.fsf@zen.linaroharston>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: iUb6QYzoh6fL

On 6/17/19 5:19 PM, Alex Bennée wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> If a distribution wants to build QEMU without semihosting support,
>> it currently gets this build failure:
>>
>>   $ ./configure --target-list=aarch64-softmmu --without-default-devices
>>   $ sed -i s/CONFIG_SEMIHOSTING=y/CONFIG_SEMIHOSTING=n/default-configs/arm-softmmu.mak
> 
> I'm still not convinced we should be adding support for stuff being done
> outside the normal build process...

If the "KVM/TCG split" series is accepted, then we can add a
--disable-tcg job in the list of "normal builds" and we don't need this
particular patch.

> that said...
> 
>>   $ make subdir-aarch64-softmmu
>>   [...]
>>     LINK    aarch64-softmmu/qemu-system-aarch64
>>   /usr/bin/ld: target/arm/arm-semi.o: in function `do_arm_semihosting':
>>   ./target/arm/arm-semi.c:321: undefined reference to `qemu_semihosting_console_out'
>>   /usr/bin/ld: ./target/arm/arm-semi.c:318: undefined reference to `qemu_semihosting_console_out'
>>   collect2: error: ld returned 1 exit status
>>   make[1]: *** [Makefile:204: qemu-system-aarch64] Error 1
>>   make: *** [Makefile:472: subdir-aarch64-softmmu] Error 2
>>
>> Fix it by providing a stub when semihosting is disabled.
>>
>> Reported-by: Miroslav Rezanina <mrezanin@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  target/arm/Makefile.objs    |  3 ++-
>>  target/arm/arm-semi-stubs.c | 21 +++++++++++++++++++++
>>  2 files changed, 23 insertions(+), 1 deletion(-)
>>  create mode 100644 target/arm/arm-semi-stubs.c
>>
>> diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
>> index 6bdcc65c2c..39b02b1fa4 100644
>> --- a/target/arm/Makefile.objs
>> +++ b/target/arm/Makefile.objs
>> @@ -1,4 +1,5 @@
>> -obj-y += arm-semi.o
>> +obj-$(CONFIG_SEMIHOSTING) += arm-semi.o
>> +obj-$(call lnot,$(CONFIG_SEMIHOSTING)) += arm-semi-stubs.o
>>  obj-$(CONFIG_SOFTMMU) += machine.o psci.o arch_dump.o monitor.o
>>  obj-$(CONFIG_KVM) += kvm.o
>>  obj-$(call land,$(CONFIG_KVM),$(call lnot,$(TARGET_AARCH64))) += kvm32.o
>> diff --git a/target/arm/arm-semi-stubs.c b/target/arm/arm-semi-stubs.c
>> new file mode 100644
>> index 0000000000..a91ecbd9d5
>> --- /dev/null
>> +++ b/target/arm/arm-semi-stubs.c
>> @@ -0,0 +1,21 @@
>> +/*
>> + *  Arm "Angel" semihosting stubs
>> + *
>> + * Copyright (c) 2019 Red Hat, Inc.
>> + *
>> + * Author:
>> + *   Philippe Mathieu-Daudé <philmd@redhat.com>
>> + *
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "cpu.h"
>> +
>> +target_ulong do_arm_semihosting(CPUARMState *env)
>> +{
>> +    g_assert_not_reached();
>> +}
> 
> Could this not just be added to arm-semi.c in an
> 
>   #ifndef CONFIG_SEMIHOSTING
>   target_ulong do_arm_semihosting(CPUARMState *env)
>   {
>       g_assert_not_reached();
>   }
>   #else
>   ... rest of arm-semi.c....
>   #endif

OK, thanks for your reviews!

Phil.
