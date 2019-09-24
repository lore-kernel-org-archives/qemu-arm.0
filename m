Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp3758632wrp;
        Tue, 24 Sep 2019 04:02:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxZmSSXXg80paBdFuy/1kFpLMh+b/9gYn5n3pIWGadSN2mmNEwC0kSKoU7e7ZwnzKfsvJUb
X-Received: by 2002:a50:b582:: with SMTP id a2mr2036038ede.98.1569322957215;
        Tue, 24 Sep 2019 04:02:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569322957; cv=none;
        d=google.com; s=arc-20160816;
        b=uXYPrvgLdDwbM+HD912hxGqFMN8p1dUGtlQ65LFy7kLPMwStUaOpSErHc+oVCmU4Jx
         eVZADR1b37+e3uv08Gms+zSciEdQhbQUHcT+sjl8JKy+hj72bvVJX/8/WZQTg6vw5Q5z
         zeu2ZIJf6uqAKQgqaVN1FTuY3F6VXuByZv970UHGXDPS2meTIO0IvVXA6v932OwpWXc1
         ZbCSjxfnU29Vl7po94idp/S3oydEL7oftQLAL40mr4/CPGR0s5602I12/RJMIPiTG1Tf
         BqgAEtcfS9dfRePpKuWzWLGfg0tdTu1yg0EtZVEbwYQRZUudQau9EZtfIIveaRXUUt+J
         yttA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=OvUx1k7o3N4ZHZNq4IxiFb6XcIpuDNsaPJl+x7zR7vI=;
        b=Hd8/rSUds/sb7Rd2xOz8OZlRoimbWkC+Q3Iy7h4qXq7qYIIfAfaxkXXOhCJhS0/sOu
         KO5ReCfa/f8mAtCRw1q5lzNEtTMF49ws3D2Hq8LComcm9aZasMf8qn3uBV6Cj0380LsM
         7B+1pIDrYEcH4fGsg/ekVCJhdTiDRSv7FqShMNYMwP35dn7HK0QdWx7Iq9qoNAYx05oL
         7W4n8yfPBmw2RkA4+L/GwJD8xTUeSiEfg62jcW2KehYJQ2CAJiDVm1aHlPmUCOBj9/IO
         kxPv8y+Pf8E1xzq6Yo2EF5n1jPqcX9as6vH/CoFLNtr6qsYQ0DkwwZ9X11koSwl5gzAj
         Y37g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e4si621770ejb.303.2019.09.24.04.02.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Sep 2019 04:02:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iCiaa-0006Go-5u
	for alex.bennee@linaro.org; Tue, 24 Sep 2019 07:02:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38758)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1iCiaM-0006Fb-B2
 for qemu-arm@nongnu.org; Tue, 24 Sep 2019 07:02:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1iCiaJ-0000Eh-5A
 for qemu-arm@nongnu.org; Tue, 24 Sep 2019 07:02:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57318)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1iCiaI-0000EK-TP; Tue, 24 Sep 2019 07:02:19 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9AAE0C057F88;
 Tue, 24 Sep 2019 11:02:17 +0000 (UTC)
Received: from [10.36.116.30] (ovpn-116-30.ams2.redhat.com [10.36.116.30])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F87D600CC;
 Tue, 24 Sep 2019 11:02:12 +0000 (UTC)
Subject: Re: [PATCH 2/4] target/arm: Move cortex-m related functions to new
 file v7m.c
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20190921150420.30743-1-thuth@redhat.com>
 <20190921150420.30743-3-thuth@redhat.com>
 <bd6efd14-9200-98e2-4f76-dda101f85274@redhat.com>
 <8585b93b-e239-829b-d634-b89941f27aed@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <5b967a2a-e1db-9a9f-7590-fc6905354f7a@redhat.com>
Date: Tue, 24 Sep 2019 13:02:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <8585b93b-e239-829b-d634-b89941f27aed@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Tue, 24 Sep 2019 11:02:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yCE9Pmw2GueT

Hi Thomas,

On 9/23/19 8:09 PM, Thomas Huth wrote:
> On 23/09/2019 16.31, Auger Eric wrote:
>> Hi Thomas,
>>
>> On 9/21/19 5:04 PM, Thomas Huth wrote:
>>> We are going to make CONFIG_ARM_V7M optional, so the related cortex-m
>>> CPUs should only be created if the switch is enabled. This can best
>>> be done if the code resides in a separate file, thus move the related
>>> functions to a new file v7m.c which only gets compiled if CONFIG_ARM_V7M
>>> is enabled.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>  target/arm/Makefile.objs |   1 +
>>>  target/arm/cpu.c         | 146 -----------------------------
>>>  target/arm/v7m.c         | 193 +++++++++++++++++++++++++++++++++++++++
>>>  3 files changed, 194 insertions(+), 146 deletions(-)
>>>  create mode 100644 target/arm/v7m.c
> [...]
>>> diff --git a/target/arm/v7m.c b/target/arm/v7m.c
>>> new file mode 100644
>>> index 0000000000..505043febe
>>> --- /dev/null
>>> +++ b/target/arm/v7m.c
>>> @@ -0,0 +1,193 @@
>>> +/*
>>> + * ARM v7m helpers.
>>> + *
>>> + * This code is licensed under the GNU GPL v2 or later.
>>> + *
>>> + * SPDX-License-Identifier: GPL-2.0-or-later
>>> + */
>>> +
>>> +#include "qemu/osdep.h"
>>> +#include "qemu/qemu-print.h"
>>> +#include "qemu-common.h"
>>> +#include "target/arm/idau.h"
>>> +#include "qemu/module.h"
>>> +#include "qapi/error.h"
>>> +#include "qapi/visitor.h"
>>> +#include "cpu.h"
>>> +#include "internals.h"
>>> +#include "exec/exec-all.h"
>>> +#include "hw/qdev-properties.h"
>>> +#if !defined(CONFIG_USER_ONLY)
>>> +#include "hw/loader.h"
>>> +#include "hw/boards.h"
>>> +#endif
>>> +#include "sysemu/sysemu.h"
>>> +#include "sysemu/tcg.h"
>>> +#include "sysemu/hw_accel.h"
>>> +#include "disas/capstone.h"
>>> +#include "fpu/softfloat.h"
>>
>> I guess some of those headers are not needed.
> 
> Yeah, I just copy-n-pasted from the source file ... I'll check what can
> be omitted (if this patch series has a chance at all...)
> 
>>> +
>>> +#if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
>>> +
>>> +static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>>> +{
>>> +    CPUClass *cc = CPU_GET_CLASS(cs);
>>> +    ARMCPU *cpu = ARM_CPU(cs);
>>> +    CPUARMState *env = &cpu->env;
>>> +    bool ret = false;
>>> +
>>> +    /*
>>> +     * ARMv7-M interrupt masking works differently than -A or -R.
>>> +     * There is no FIQ/IRQ distinction. Instead of I and F bits
>>> +     * masking FIQ and IRQ interrupts, an exception is taken only
>>> +     * if it is higher priority than the current execution priority
>>> +     * (which depends on state like BASEPRI, FAULTMASK and the
>>> +     * currently active exception).
>>> +     */
>>> +    if (interrupt_request & CPU_INTERRUPT_HARD
>>> +        && (armv7m_nvic_can_take_pending_exception(env->nvic))) {
>>
>> so what is the status wrt m_helper.c which stays unconditionally
>> compiled. m_helper functions seem to called from target/arm/translate.c
>> mostly. Have you abandoned the stub idea. It may be confusing to have 2
>> different helper files. At least a comment explaining where a new helper
>> shall go may be useful.
> 
> All the HELPER() functions should definitely stay in m_helper.c. They
> are required for linking. Or do you prefer a stub file instead? Then we
> could maybe make the whole m_helper.c conditional in the Makefile.objs
> instead.

I was simply referring to your previous approach:

Applying [Qemu-devel] [RFC PATCH 3/3] target/arm: Make m_helper.c
optional via CONFIG_ARM_V7M seems to fix the issue
https://lists.gnu.org/archive/html/qemu-devel/2019-09/msg00333.html

It seems to work fine as it removes the call to armv7m_nvic.c functions
so no need to move the interrupt controller code?

Thanks

Eric

> 
> However, there's one thing I currently don't quite understand in this
> code (since I'm not an ARM guy, sorry) : There are references to "v8" in
> m_helper.c, too. Is that related to a separate CPU type, ie. should the
> v8 code also be available when CONFIG_ARM_V7M is disabled? Or can the
> code in m_helper.c be disabled completely if CONFIG_ARM_V7M is not set?
> 
>  Thomas
> 
