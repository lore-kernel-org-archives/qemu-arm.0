Received: by 10.25.77.65 with SMTP id a62csp229197lfb;
        Fri, 27 Jan 2017 05:14:29 -0800 (PST)
X-Received: by 10.159.41.199 with SMTP id s65mr4615948uas.87.1485522868940;
        Fri, 27 Jan 2017 05:14:28 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x22e.google.com (mail-vk0-x22e.google.com. [2607:f8b0:400c:c05::22e])
        by mx.google.com with ESMTPS id j64si1413150vkg.223.2017.01.27.05.14.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Jan 2017 05:14:28 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::22e as permitted sender) client-ip=2607:f8b0:400c:c05::22e;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::22e as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-vk0-x22e.google.com with SMTP id r136so175036076vke.1
        for <alex.bennee@linaro.org>; Fri, 27 Jan 2017 05:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IXcx76vd6K4pviz+9rNZOrKldEFsByGY2kVOUozNCA4=;
        b=ImGmH7mYuITJVI1cFFBIls7wOymNYnfMfrpxcsAMzUJVeqWW+xF1TpzKW7KI+/IOtm
         H8lM/vQWij6ywzpW6FbGz0kMWbzxvf3E+1W42KYG1a428FIWfTDgrEsJTwVG026UX0iE
         49WZvAfFut0qeqShfFgBI+dmgwr5RQiLHH8xQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IXcx76vd6K4pviz+9rNZOrKldEFsByGY2kVOUozNCA4=;
        b=PQdSOHlN8+wtlcQAgnB+F5G1sAne2J6csvRZP0hrvINJEv0lWWDizDQKNAMq+tlZWx
         DtxHAiB281rg2T185SzlYUAngxbkrCiksxIxpJ6H2rd9ZFhuK3rz4IYur5MF5znfS9mF
         tmJ5mivMpDQTzZ17anesU81MdYQrjGApz3qUNJi38OjN4GgY/o1mq4vOUVMYseZjlPj+
         ETb798EGMcuVkN/0I8M0u9Qz6dYzAMZjoSMoOn78kkMp6qrIO4t1A072v6DM21ISWU3p
         BshzygGhVEVOWUfU7MSt6An6PbIjqXVIx3jZRbIYYOZV2lEAZv7KBsSmZaMhp3o1BjpX
         epLA==
X-Gm-Message-State: AIkVDXK/wD+Y/HKx3BoPz1gz0TE3B/3BCswJqLrFMATrXxmojpc+ha/FbvNmm0DdVB82AKHBG8Z6PjPXHMD0BSbyhTU=
X-Received: by 10.31.216.5 with SMTP id p5mr3329740vkg.170.1485522868394; Fri,
 27 Jan 2017 05:14:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.205.2 with HTTP; Fri, 27 Jan 2017 05:14:08 -0800 (PST)
In-Reply-To: <87bmusadr3.fsf@linaro.org>
References: <1485285380-10565-1-git-send-email-peter.maydell@linaro.org>
 <1485285380-10565-4-git-send-email-peter.maydell@linaro.org> <87bmusadr3.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Jan 2017 13:14:08 +0000
Message-ID: <CAFEAcA9huvBSMMpShBRMkbfhW_4pdyCJs=t2CUA18Gx_BAQj8g@mail.gmail.com>
Subject: Re: [PATCH 03/10] armv7m: add state for v7M CCR, CFSR, HFSR, DFSR,
 MMFAR, BFAR
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>, Liviu Ionescu <ilg@livius.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: q/+B8/xydIzD

On 27 January 2017 at 12:28, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
>> Add the structure fields, VMState fields, reset code and macros for
>> the v7M system control registers CCR, CFSR, HFSR, DFSR, MMFAR and
>> BFAR.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  target/arm/cpu.h     | 54 +++++++++++++++++++++++++++++++++++++++++++++=
+++++++
>>  target/arm/cpu.c     |  7 +++++++
>>  target/arm/machine.c | 10 ++++++++--
>>  3 files changed, 69 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index b2cc329..4b062d2 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -21,6 +21,7 @@
>>  #define ARM_CPU_H
>>
>>  #include "kvm-consts.h"
>> +#include "hw/registerfields.h"
>>
>>  #if defined(TARGET_AARCH64)
>>    /* AArch64 definitions */
>> @@ -405,6 +406,12 @@ typedef struct CPUARMState {
>>          uint32_t vecbase;
>>          uint32_t basepri;
>>          uint32_t control;
>> +        uint32_t ccr; /* Configuration and Control */
>> +        uint32_t cfsr; /* Configurable Fault Status */
>> +        uint32_t hfsr; /* HardFault Status */
>> +        uint32_t dfsr; /* Debug Fault Status Register */
>> +        uint32_t mmfar; /* MemManage Fault Address */
>> +        uint32_t bfar; /* BusFault Address */
>
> Given the CPUARMState needs to be accessed via env do we need to start
> getting concerned about its size?

We only care that accesses to the front of it are within easy
reach (specifically, accesses to fields via frequently used
TCG globals); it doesn't matter if more things are added at
the end.

thanks
-- PMM
