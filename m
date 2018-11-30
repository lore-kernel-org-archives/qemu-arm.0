Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3877587wrt;
        Fri, 30 Nov 2018 10:19:29 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WbeV2SSVXmcImkGc5nj8xUauBYInEbr1NpvJ1lQVVps36T58QKt7dNjZirTHa25ya8Evhf
X-Received: by 2002:a81:5791:: with SMTP id l139mr6713741ywb.413.1543601969768;
        Fri, 30 Nov 2018 10:19:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543601969; cv=none;
        d=google.com; s=arc-20160816;
        b=GnRM++nZpeXAzu3qwUFRH62KA2/SpwoTCAlgVwh1G8lMgDzj8IxnifHvF/k1dJou59
         SdVqRP9tKaV2ihN3Us7Rz7pgQkd6OoU/qdJOMZbJvuEZcjE4LfCEm/zFJ8IgSVyzeC/m
         Nm7EnlgSLdkd1qRfUDxjHt/iMhi9h67HTmnCZj60JA/JDiUtPnW+iT8QZNqRWSCi1VyU
         e2qe+Ug09iRblENJ/iJGkIAUkFTz1sDdp8PSRjM/KH2t1AXUVIo/OqeCC9Q6Uz4oyKzm
         BLr58UUcC8e0O2LAQ5b2Y7qt9bOye3KYRTqryHMXxsPQzMu5YJbe7BAnLJPCQ6IE9Mud
         rgwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=fxTHUAXfp4CpxDcb1yaveak3i7CCrtjHPdlyFC29K+o=;
        b=UJtxZzjbe6kqw14ZnbVJBAfsGaDilTeVlLwaT0NndF4VO1tjt4Q0cyB+4zFQ0Z7XE5
         YMxD1PxUdfu2Dv11SJfbQpaXF5/nFBoOsUgwMHN8BQ8fcRkk0GevRsfpUEjcpjPE0pi9
         lt9LAsrfQnOvJUSkqOq3BYguMbJA5E0C08sKNOGkljI7YX+kuyf0+mW1ERiBVh3m4b/4
         3GA/+aIxL751Ky3nwy29rPDsjtayFjs8pVW3liskgRq3+f8gxG0GgyANpeJun76lRm7L
         pqoIhsanqM7dbK1wLP30Vrg6mIVdoxvC9UO7EV5xNS4e4QvW3UxTHFUGCsnDrRYfsVNa
         JU/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HXJAJfj4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u65si3547971ywa.410.2018.11.30.10.19.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 10:19:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HXJAJfj4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34145 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSnNx-0007Qw-6k
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 13:19:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52319)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gSnNh-0007Qm-MY
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 13:19:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gSnNd-0007OA-F4
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 13:19:13 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:46114)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gSnNc-0007MC-SY
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 13:19:09 -0500
Received: by mail-pg1-x542.google.com with SMTP id w7so2825450pgp.13
	for <qemu-arm@nongnu.org>; Fri, 30 Nov 2018 10:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=fxTHUAXfp4CpxDcb1yaveak3i7CCrtjHPdlyFC29K+o=;
	b=HXJAJfj4NJxiHQyXKDz3OdJhq4NA31ph3ivV2/i7I8yR/8DCOENmaUxd7+poU+XDjx
	aNICSnO6SM8elA9iGJuJhXf3w9iayztRhh7JQBmQou+nSVeJpVGbdHkBvWgaPuVmt79w
	0GWosSrpCF1XnCxDwg4RozMtXnJW30FBXCJw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=fxTHUAXfp4CpxDcb1yaveak3i7CCrtjHPdlyFC29K+o=;
	b=s4gGzQjqXFj6AbhLFJcK2OjPmQBSAiUmUi8f9oqUxjLOch02eV+yJtzBp1NIFhgT8P
	Uz03BLRY9NRULHUXv5eymF9Uidj0YvdKtQEqD2f1bK4ncs9yLeGfWO5yYM/2arylwY9E
	ZKjqDwdXyKVZ1fF4jbSHox8AFpsRGwp9skw29qMWS2nDZ66XbE6jJQyUPRa3LROuGR1e
	IElSVde0+mOtPI7lQPaA0/Bw1WKEqmcmCZjoPoeY3H54Gtkj2F65Ksd0Q1SSVDsf4M81
	cqKn4tjnr5qDYrnJC9Bo7PGSvzmqDr+u7/XxpRdHq0UDTSOZsnjsm3rIJf9+EFaUdvG1
	jH/w==
X-Gm-Message-State: AA+aEWaZMcUNwaXr/XoVk388oWoXruqO1e+mQXnK2vAdoIzD6V+rLTFN
	K54/SwjFF2Oh3Yr80FGD8DinbQ==
X-Received: by 2002:a63:2263:: with SMTP id t35mr5673205pgm.69.1543601946487; 
	Fri, 30 Nov 2018 10:19:06 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-170-180.tukw.qwest.net.
	[97.113.170.180]) by smtp.gmail.com with ESMTPSA id
	i4sm12854722pfj.82.2018.11.30.10.19.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Nov 2018 10:19:05 -0800 (PST)
To: Aaron Lindsay <aaron@os.amperecomputing.com>
References: <20181120212553.8480-1-aaron@os.amperecomputing.com>
	<20181120212553.8480-14-aaron@os.amperecomputing.com>
	<d6fde9c7-b72e-ae9d-817b-71c3d6369dbc@linaro.org>
	<20181130175629.GB24714@quinoa.localdomain>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <fb2e45b2-463d-aefe-e3d7-f3027f662c12@linaro.org>
Date: Fri, 30 Nov 2018 10:19:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181130175629.GB24714@quinoa.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: Re: [Qemu-arm] [PATCH v8 13/13] target/arm: Send interrupts on PMU
 counter overflow
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Aaron Lindsay <alindsay@codeaurora.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	SM-Aaron Lindsay <alindsay@os.amperecomputing.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b3e+siN+eWCn

On 11/30/18 9:56 AM, Aaron Lindsay wrote:
> On Nov 30 09:13, Richard Henderson wrote:
>> On 11/20/18 1:26 PM, Aaron Lindsay wrote:
>>> Setup a QEMUTimer to get a callback when we expect counters to next
>>> overflow and trigger an interrupt at that time.
>>>
>>> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
>>> Signed-off-by: Aaron Lindsay <alindsay@os.amperecomputing.com>
>>> ---
>>>  target/arm/cpu.c    |  12 +++++
>>>  target/arm/cpu.h    |   7 +++
>>>  target/arm/helper.c | 126 +++++++++++++++++++++++++++++++++++++++++---
>>>  3 files changed, 139 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>>> index 208a08e867..7311a48e3c 100644
>>> --- a/target/arm/cpu.c
>>> +++ b/target/arm/cpu.c
>>> @@ -827,6 +827,13 @@ static void arm_cpu_finalizefn(Object *obj)
>>>          QLIST_REMOVE(hook, node);
>>>          g_free(hook);
>>>      }
>>> +#ifndef CONFIG_USER_ONLY
>>> +    if (arm_feature(&cpu->env, ARM_FEATURE_PMU) && cpu->pmu_timer) {
>>
>> No need for two tests here.  Just check cpu->pmu_timer.
>> (If it's set for any reason it should be freed, surely.)
>>
>>> @@ -1305,7 +1338,18 @@ void pmccntr_op_start(CPUARMState *env)
>>>              eff_cycles /= 64;
>>>          }
>>>  
>>> -        env->cp15.c15_ccnt = eff_cycles - env->cp15.c15_ccnt_delta;
>>> +        uint64_t new_pmccntr = eff_cycles - env->cp15.c15_ccnt_delta;
>>> +
>>> +        unsigned int overflow_bit = (env->cp15.c9_pmcr & PMCRLC) ? 63 : 31;
>>> +        uint64_t overflow_mask = (uint64_t)1 << overflow_bit;
>>> +        if (!(new_pmccntr & overflow_mask) &&
>>> +                (env->cp15.c15_ccnt & overflow_mask)) {
>>
>> Fyi, this expression is
>>
>>     env->cp15.c15_ccnt & ~new_pmccntr & overflow_mask
>>
>>> +            env->cp15.c9_pmovsr |= (1 << 31);
>>> +            new_pmccntr &= ~overflow_mask;
>>
>> Why this line?  You just checked that overflow_mask was unset in new_pmccntr above.
> 
> This ensures that when overflow_bit == 31 (because PMCR.LC is not set)
> the high 32 bits remain 0 even after an overflow has occurred. As you
> point out, it's silly when overflow_bit == 64, but I didn't think it was
> worth the extra conditional to avoid it.

Eh?  But we've set overflow_mask based on PMCR.LC, so what you say here doesn't
make sense.

> Thanks for your review. I'll take a look at your suggested logic
> simplifications for v9, do you think that this patch looks OK at the
> big-picture level?

Yes, big picture looks good.


r~

