Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp3780802wrp;
        Tue, 24 Sep 2019 04:25:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxcoV7hw24LCPz8lFvqSsMhQAwSb31zvl/cJeZK60T97EWj2g2bcLg8mzK+2bsmd0BivX0o
X-Received: by 2002:a17:906:938b:: with SMTP id l11mr1943052ejx.67.1569324300543;
        Tue, 24 Sep 2019 04:25:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569324300; cv=none;
        d=google.com; s=arc-20160816;
        b=ZZIqbDEtcRu8eOXkXgdEDdrh2Z9YUeyt8DYAMYaOf3G3UaA3aW9M2Qzqm3qEwXhpg8
         9t+UnkNF44JwtaFAMyAfCKL8IBgRND/KSQ3N2bH8yNbkCbK4JC46k+9GCejUUht42slY
         PI6B6Wj59LKmfeMnBw1e+K/Xo5XiooIC/rDhv6s5MuhUxibuo1YjEpPTDcQkC+A9IXQ9
         FittWzNPzi94Vj15Jwwex3srB9wg8Luln4xhdMer7VK398ur6dkZN0hrXFoeUfJhIf3p
         dgZ9ZRi6TsqZkIuNc8fd75XYhn44SfvaeH9WSCKOW4hEYmC7iAcy7e9uxeD9b6C22nF9
         XKOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=Krh+BBe3o1Qa1RDZDrrecWWsYLcDdW4XuDs6Vy/2kHg=;
        b=OOHoYL4JpruJeADf1EgwUPHgpjlUKLgiiP/xckgGSAfJ/nbzNxRoa8C2/c7mXinqR4
         2fZvmuA4+oIfkTYwsfHZ8t0y29KCMPOddP5zWI/7HNzSanEA1z9y7w66JpibhkWEYk6O
         dQhSbf1WchWNlQS4EGSRcCiw6+rW5hy3kG757KafDc4VHai34zaUa2s5WSIPIsIRWVwY
         DipLBnDC+0Z8rgKdIHbCIpfyWRgb6BTNsumWQ5V/6iyVbUr3609IQcPZ7OJZ6Vg68xtz
         3qa60CcW+aUKsA3vQ2DqjnpoWMme8d28RFkUweR/gZXHusarKKoEi4CwRpoyISG2ve0b
         qCNA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c8si681579ejx.141.2019.09.24.04.25.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Sep 2019 04:25:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iCiwF-0007b7-Ld
	for alex.bennee@linaro.org; Tue, 24 Sep 2019 07:24:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41440)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1iCiva-0007ZX-3y
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 07:24:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1iCivY-00032a-O8
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 07:24:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:62044)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1iCivV-00031a-MM; Tue, 24 Sep 2019 07:24:13 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 02A7B7FDE9;
 Tue, 24 Sep 2019 11:24:13 +0000 (UTC)
Received: from [10.36.116.30] (ovpn-116-30.ams2.redhat.com [10.36.116.30])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 87E365C1B2;
 Tue, 24 Sep 2019 11:24:03 +0000 (UTC)
Subject: Re: [PATCH 2/4] target/arm: Move cortex-m related functions to new
 file v7m.c
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20190921150420.30743-1-thuth@redhat.com>
 <20190921150420.30743-3-thuth@redhat.com>
 <bd6efd14-9200-98e2-4f76-dda101f85274@redhat.com>
 <8585b93b-e239-829b-d634-b89941f27aed@redhat.com>
 <5b967a2a-e1db-9a9f-7590-fc6905354f7a@redhat.com>
 <240ae462-9f6e-bb1f-3657-1baaba4051ca@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <74706e48-31c9-c7d2-e700-e6b702f7560a@redhat.com>
Date: Tue, 24 Sep 2019 13:24:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <240ae462-9f6e-bb1f-3657-1baaba4051ca@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Tue, 24 Sep 2019 11:24:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +bsfa9OQXk54

Hi Thomas,

On 9/24/19 1:06 PM, Thomas Huth wrote:
> On 24/09/2019 13.02, Auger Eric wrote:
>> Hi Thomas,
>>
>> On 9/23/19 8:09 PM, Thomas Huth wrote:
>>> On 23/09/2019 16.31, Auger Eric wrote:
>>>> Hi Thomas,
>>>>
>>>> On 9/21/19 5:04 PM, Thomas Huth wrote:
>>>>> We are going to make CONFIG_ARM_V7M optional, so the related cortex-m
>>>>> CPUs should only be created if the switch is enabled. This can best
>>>>> be done if the code resides in a separate file, thus move the related
>>>>> functions to a new file v7m.c which only gets compiled if CONFIG_ARM_V7M
>>>>> is enabled.
>>>>>
>>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>>> ---
>>>>>  target/arm/Makefile.objs |   1 +
>>>>>  target/arm/cpu.c         | 146 -----------------------------
>>>>>  target/arm/v7m.c         | 193 +++++++++++++++++++++++++++++++++++++++
>>>>>  3 files changed, 194 insertions(+), 146 deletions(-)
>>>>>  create mode 100644 target/arm/v7m.c
>>> [...]
>>>>> diff --git a/target/arm/v7m.c b/target/arm/v7m.c
>>>>> new file mode 100644
>>>>> index 0000000000..505043febe
>>>>> --- /dev/null
>>>>> +++ b/target/arm/v7m.c
>>>>> @@ -0,0 +1,193 @@
>>>>> +/*
>>>>> + * ARM v7m helpers.
>>>>> + *
>>>>> + * This code is licensed under the GNU GPL v2 or later.
>>>>> + *
>>>>> + * SPDX-License-Identifier: GPL-2.0-or-later
>>>>> + */
>>>>> +
>>>>> +#include "qemu/osdep.h"
>>>>> +#include "qemu/qemu-print.h"
>>>>> +#include "qemu-common.h"
>>>>> +#include "target/arm/idau.h"
>>>>> +#include "qemu/module.h"
>>>>> +#include "qapi/error.h"
>>>>> +#include "qapi/visitor.h"
>>>>> +#include "cpu.h"
>>>>> +#include "internals.h"
>>>>> +#include "exec/exec-all.h"
>>>>> +#include "hw/qdev-properties.h"
>>>>> +#if !defined(CONFIG_USER_ONLY)
>>>>> +#include "hw/loader.h"
>>>>> +#include "hw/boards.h"
>>>>> +#endif
>>>>> +#include "sysemu/sysemu.h"
>>>>> +#include "sysemu/tcg.h"
>>>>> +#include "sysemu/hw_accel.h"
>>>>> +#include "disas/capstone.h"
>>>>> +#include "fpu/softfloat.h"
>>>>
>>>> I guess some of those headers are not needed.
>>>
>>> Yeah, I just copy-n-pasted from the source file ... I'll check what can
>>> be omitted (if this patch series has a chance at all...)
>>>
>>>>> +
>>>>> +#if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
>>>>> +
>>>>> +static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>>>>> +{
>>>>> +    CPUClass *cc = CPU_GET_CLASS(cs);
>>>>> +    ARMCPU *cpu = ARM_CPU(cs);
>>>>> +    CPUARMState *env = &cpu->env;
>>>>> +    bool ret = false;
>>>>> +
>>>>> +    /*
>>>>> +     * ARMv7-M interrupt masking works differently than -A or -R.
>>>>> +     * There is no FIQ/IRQ distinction. Instead of I and F bits
>>>>> +     * masking FIQ and IRQ interrupts, an exception is taken only
>>>>> +     * if it is higher priority than the current execution priority
>>>>> +     * (which depends on state like BASEPRI, FAULTMASK and the
>>>>> +     * currently active exception).
>>>>> +     */
>>>>> +    if (interrupt_request & CPU_INTERRUPT_HARD
>>>>> +        && (armv7m_nvic_can_take_pending_exception(env->nvic))) {
>>>>
>>>> so what is the status wrt m_helper.c which stays unconditionally
>>>> compiled. m_helper functions seem to called from target/arm/translate.c
>>>> mostly. Have you abandoned the stub idea. It may be confusing to have 2
>>>> different helper files. At least a comment explaining where a new helper
>>>> shall go may be useful.
>>>
>>> All the HELPER() functions should definitely stay in m_helper.c. They
>>> are required for linking. Or do you prefer a stub file instead? Then we
>>> could maybe make the whole m_helper.c conditional in the Makefile.objs
>>> instead.
>>
>> I was simply referring to your previous approach:
>>
>> Applying [Qemu-devel] [RFC PATCH 3/3] target/arm: Make m_helper.c
>> optional via CONFIG_ARM_V7M seems to fix the issue
>> https://lists.gnu.org/archive/html/qemu-devel/2019-09/msg00333.html
>>
>> It seems to work fine as it removes the call to armv7m_nvic.c functions
>> so no need to move the interrupt controller code?
> 
> Yes, but then we either need stubs in a separate file, or have to put
> lots of #ifdefs into translate.c ... none of those solutions seem to be
> really perfect :-(
Yep, the separate stub file looked cleaner to me.

> Anyway, Philippe is currently respinning his series (I think), so I'll
> postpone my work now to avoid to interfere with him.
OK

Thanks

Eric
> 
>  Thomas
> 
