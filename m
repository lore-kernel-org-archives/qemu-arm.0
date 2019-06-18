Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3636020wrg;
        Tue, 18 Jun 2019 05:02:55 -0700 (PDT)
X-Received: by 2002:a1c:305:: with SMTP id 5mr3426897wmd.101.1560859375565;
        Tue, 18 Jun 2019 05:02:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560859375; cv=none;
        d=google.com; s=arc-20160816;
        b=UYIROo7BSHmPIxB8uTUYWlBzhZ7lID9oEd6w+vmlnqjUYHFPkTkbr9z+etUGeZMC2E
         KOE/EukYqn9CY8pAMOVoRBEQ0I1aYRWq4dNic2vNd9WQn6/pCDOUTzQdIneNVFoyxgs1
         HXTlSDR+SD95cSSFmggNKKn7Me493goyfn8BSBJQbDPaVPQsDiEDoxidzrWAWRjbGdqs
         r4C65tcR1gw9VAzetnP+R2ez62km+UC9dgChIP853sPuvjv28C8g+YTrsKIcWAtmK1WG
         RYywJAnC5ZudK4PA2KnvhOKVZeksdT2p9vpMY0KfFILM49Z1M6XmudtHIVePuT4fyNfn
         rLnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:references:cc:to:from:subject;
        bh=IGCHtVAKBdxxwabmbid3Uih1yuqLLDaIvPXVsbzNyHw=;
        b=CpphuZBGANz8pZwweEz4rQAsufkyivnQp2X0p7l2JBINtsZ6NTCBKDLK0U1hvH4bUU
         N879NwRPC4vam4v9OpDWrUHq1PE0zCAmArwkPizXVdy+tIsMPccYErEVZ1qgDBpGskae
         iw8VeC/T4YYFYHGPmVPC1SwIDaFsWeIlnmlYi6CXobt4Awl7qQaXGSMW9PJRmjDPyyFQ
         68ohMw5/n/xmreI6CTYL8jCZTKy7TH/G7MZHqLOI3cndRoVVpsCGIeywJOMpHr++c5eQ
         sJeRW/QNgrsi74ioy9tGtJkIPdhval1Lk2NWTMpgl2LGD3RaK7d0iZK9F/7Nsq2pX4dM
         WSFg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v15sor6978021wrp.38.2019.06.18.05.02.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 18 Jun 2019 05:02:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IGCHtVAKBdxxwabmbid3Uih1yuqLLDaIvPXVsbzNyHw=;
        b=UjCoCkepLHE4FLee7wkTtF3JJvBN44VscESOs3BSGLP6PJ8qO13KxSOmNh+/h4TPT1
         kwtBG4lQN0QUoseOr3jU/DOfqERxCY5djawH7T9fVAN1QnjABH99FCz3Pj51a7qzfhgR
         nWLODtHBqDkg+rMB1atL+Ak3qAT+/eZi6vzIY6QUduq9A37HtU34buczE8w9/aoo7B74
         yZYrCrTmgskPRDKTszFh4M6QlDilYCxL4dmmEum2i0FuMnSStQXkBeOzOJzAqdYXhqEk
         sFGqmQemBuCcedlmfYiv7pIe9aqH+OzqqSl0paN6GFeEoI9Ky1GMrkQsGwmjjoLTT/vH
         0cig==
X-Gm-Message-State: APjAAAUhu+PRZCGA6LDMKIkYmgLLCHF7oxaX8FMMD6NXWU7/nv7K/M6H
	soB0Qx5BusdChHJ9VO5x37tBKg==
X-Google-Smtp-Source: APXvYqwLwe4+7Ft3fXs36NldqdpaROHdDP6l+tzZrt0H9bRKJPycHc6FJT7mons8HwH0f+LFAtHUHA==
X-Received: by 2002:a5d:428d:: with SMTP id k13mr20040259wrq.142.1560859375317;
        Tue, 18 Jun 2019 05:02:55 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.38] (183.red-88-21-202.staticip.rima-tde.net. [88.21.202.183])
        by smtp.gmail.com with ESMTPSA id l124sm3790128wmf.36.2019.06.18.05.02.54
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Jun 2019 05:02:54 -0700 (PDT)
Subject: Re: [RFC PATCH 1/2] target/arm: Add stubs to build with
 CONFIG_SEMIHOSTING disabled
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
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
 <ff40b72b-3dc3-2d34-e5e4-5d110247c620@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <80085fe0-d47c-29c0-8e1b-b1e2ca81c96f@redhat.com>
Date: Tue, 18 Jun 2019 14:02:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <ff40b72b-3dc3-2d34-e5e4-5d110247c620@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: CDS3qCVsSg8B

On 6/17/19 5:33 PM, Philippe Mathieu-Daudé wrote:
> On 6/17/19 5:19 PM, Alex Bennée wrote:
>> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
>>
>>> If a distribution wants to build QEMU without semihosting support,
>>> it currently gets this build failure:
>>>
>>>   $ ./configure --target-list=aarch64-softmmu --without-default-devices
>>>   $ sed -i s/CONFIG_SEMIHOSTING=y/CONFIG_SEMIHOSTING=n/default-configs/arm-softmmu.mak
>>
>> I'm still not convinced we should be adding support for stuff being done
>> outside the normal build process...
> 
> If the "KVM/TCG split" series is accepted, then we can add a
> --disable-tcg job in the list of "normal builds" and we don't need this
> particular patch.
> 
>> that said...
>>
>>>   $ make subdir-aarch64-softmmu
>>>   [...]
>>>     LINK    aarch64-softmmu/qemu-system-aarch64
>>>   /usr/bin/ld: target/arm/arm-semi.o: in function `do_arm_semihosting':
>>>   ./target/arm/arm-semi.c:321: undefined reference to `qemu_semihosting_console_out'
>>>   /usr/bin/ld: ./target/arm/arm-semi.c:318: undefined reference to `qemu_semihosting_console_out'
>>>   collect2: error: ld returned 1 exit status
>>>   make[1]: *** [Makefile:204: qemu-system-aarch64] Error 1
>>>   make: *** [Makefile:472: subdir-aarch64-softmmu] Error 2
>>>
>>> Fix it by providing a stub when semihosting is disabled.
>>>
>>> Reported-by: Miroslav Rezanina <mrezanin@redhat.com>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> ---
>>>  target/arm/Makefile.objs    |  3 ++-
>>>  target/arm/arm-semi-stubs.c | 21 +++++++++++++++++++++
>>>  2 files changed, 23 insertions(+), 1 deletion(-)
>>>  create mode 100644 target/arm/arm-semi-stubs.c
>>>
>>> diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
>>> index 6bdcc65c2c..39b02b1fa4 100644
>>> --- a/target/arm/Makefile.objs
>>> +++ b/target/arm/Makefile.objs
>>> @@ -1,4 +1,5 @@
>>> -obj-y += arm-semi.o
>>> +obj-$(CONFIG_SEMIHOSTING) += arm-semi.o
>>> +obj-$(call lnot,$(CONFIG_SEMIHOSTING)) += arm-semi-stubs.o
>>>  obj-$(CONFIG_SOFTMMU) += machine.o psci.o arch_dump.o monitor.o
>>>  obj-$(CONFIG_KVM) += kvm.o
>>>  obj-$(call land,$(CONFIG_KVM),$(call lnot,$(TARGET_AARCH64))) += kvm32.o
>>> diff --git a/target/arm/arm-semi-stubs.c b/target/arm/arm-semi-stubs.c
>>> new file mode 100644
>>> index 0000000000..a91ecbd9d5
>>> --- /dev/null
>>> +++ b/target/arm/arm-semi-stubs.c
>>> @@ -0,0 +1,21 @@
>>> +/*
>>> + *  Arm "Angel" semihosting stubs
>>> + *
>>> + * Copyright (c) 2019 Red Hat, Inc.
>>> + *
>>> + * Author:
>>> + *   Philippe Mathieu-Daudé <philmd@redhat.com>
>>> + *
>>> + * SPDX-License-Identifier: GPL-2.0-or-later
>>> + *
>>> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
>>> + * See the COPYING file in the top-level directory.
>>> + */
>>> +
>>> +#include "qemu/osdep.h"
>>> +#include "cpu.h"
>>> +
>>> +target_ulong do_arm_semihosting(CPUARMState *env)
>>> +{
>>> +    g_assert_not_reached();
>>> +}
>>
>> Could this not just be added to arm-semi.c in an
>>
>>   #ifndef CONFIG_SEMIHOSTING
>>   target_ulong do_arm_semihosting(CPUARMState *env)
>>   {
>>       g_assert_not_reached();
>>   }
>>   #else
>>   ... rest of arm-semi.c....
>>   #endif

Note that CONFIG_SEMIHOSTING is a Make definition, not a CPP one,
and it doesn't look straight forward to get it added to config-target.h...
