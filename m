Received: by 10.25.159.19 with SMTP id i19csp1434172lfe;
        Mon, 8 Feb 2016 08:44:34 -0800 (PST)
X-Received: by 10.55.212.156 with SMTP id s28mr29284530qks.55.1454949874765;
        Mon, 08 Feb 2016 08:44:34 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g3si31242680qkb.15.2016.02.08.08.44.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Feb 2016 08:44:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46513 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aSovS-00009q-6P
	for alex.bennee@linaro.org; Mon, 08 Feb 2016 11:44:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37212)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aSovP-000060-Lh
	for qemu-arm@nongnu.org; Mon, 08 Feb 2016 11:44:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aSovK-0001or-MK
	for qemu-arm@nongnu.org; Mon, 08 Feb 2016 11:44:31 -0500
Received: from mail-lb0-x244.google.com ([2a00:1450:4010:c04::244]:34798)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aSovK-0001o2-9U; Mon, 08 Feb 2016 11:44:26 -0500
Received: by mail-lb0-x244.google.com with SMTP id e10so4237943lbb.1;
	Mon, 08 Feb 2016 08:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=kxKdb6cxMQX9NMsaDjE7ajBejMDmPjKqO1arjU/N9QY=;
	b=DdUy71bzkqtaXuw+Ty2yajCqG/vWCZy/quDiGOHfrXjsfcRCRxoao/QFsv874wkcjU
	zxFtsBXZjrTYv5V14LgIEvHZun3rnetVVJbQ1hPSNqUG7n5HonO/Mvf3tFp7MU2MhAed
	+F/2i4XLJGwKsxr8O3nVzvQXv2c6tBI/lzoSiIkNjYsJzjH3ARt32HqmWwZC8N1BPPyA
	XsXCDuWZ+prlU27+YGx4Ufp9gzFJFxsYVN7N9RWB/oVHeUFfOS7cnbHLC59NvKMQMTYS
	Eb6m+7PjtRt3xV6U4ml3V4wRtPQVvUtZV2Na03evKHUpuyolfPluVyec31n0Ee3m7Ge1
	xlUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=kxKdb6cxMQX9NMsaDjE7ajBejMDmPjKqO1arjU/N9QY=;
	b=fCFO8lQPmN8+nxKRWMvNog4xPrRGyn+V4XxXpRaE2a+9RVd245NqPdnkq8blZGiW/8
	2Pi6inyqFa9crYOmR+ajO6Vy5m7LKzEhVlGdFmoqoS/4Ht93tQ53PLRX8Acku+5qBipQ
	ixJCcJYGJ0Bc1IFoS6uf2OzizZ97EYWGEaNzxPoo2fAeRXkbsR0LbmlKJLqnvoBmIQfV
	w7B6aUMBx7oGcp2YmaoUTdb/3G/X7ngZf6PWo4BRlNox8ZaX8S51/Vvdc3FnW7pUFVZA
	3ueOt/EKXt9wMUHCJi6kD7aL3jzp47S33tBtkZDWuMkrdsuvBsxijrLvrF7N+z4cYD5q
	OkOw==
X-Gm-Message-State: AG10YOTBtpN8ONh9ayzZmTrYa8G8xNEnKyGXkELlFl3tQtknYrQ9SwHcOuyVwJrtwNtFZA==
X-Received: by 10.112.139.164 with SMTP id qz4mr11496098lbb.41.1454949865480; 
	Mon, 08 Feb 2016 08:44:25 -0800 (PST)
Received: from [10.30.10.50] ([213.243.91.10])
	by smtp.googlemail.com with ESMTPSA id
	34sm4138609lfv.35.2016.02.08.08.44.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 08 Feb 2016 08:44:24 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1454690704-16233-1-git-send-email-peter.maydell@linaro.org>
	<1454690704-16233-6-git-send-email-peter.maydell@linaro.org>
	<56B8C2EE.5090700@gmail.com>
	<CAFEAcA9v2KHF92omDQ3EzhdGsO=Vyt37zJ7REp=23sVJeQ1BaA@mail.gmail.com>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56B8C5E7.9040609@gmail.com>
Date: Mon, 8 Feb 2016 19:44:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9v2KHF92omDQ3EzhdGsO=Vyt37zJ7REp=23sVJeQ1BaA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::244
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 5/6] target-arm: Implement
 MDCR_EL2.TDA and MDCR_EL2.TDA traps
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +JqVEKMMC2OK

On 08.02.2016 19:38, Peter Maydell wrote:
> On 8 February 2016 at 16:31, Sergey Fedorov <serge.fdrv@gmail.com> wrote:
>> One of the MDCR_EL2's should be MDCR_EL3 instead.
> Oops, yes :-)
>
>> On 05.02.2016 19:45, Peter Maydell wrote:
>>> Implement the debug register traps controlled by MDCR_EL2.TDA
>>> and MDCR_EL3.TDA.
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>>  target-arm/helper.c | 39 ++++++++++++++++++++++++++++++---------
>>>  1 file changed, 30 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/target-arm/helper.c b/target-arm/helper.c
>>> index 8c2adbc..064b415 100644
>>> --- a/target-arm/helper.c
>>> +++ b/target-arm/helper.c
>>> @@ -420,6 +420,24 @@ static CPAccessResult access_tdra(CPUARMState *env, const ARMCPRegInfo *ri,
>>>      return CP_ACCESS_OK;
>>>  }
>>>
>>> +/* Check for traps to general debug registers, which are controlled
>>> + * by MDCR_EL2.TDA for EL2 and MDCR_EL3.TDA for EL3.
>>> + */
>>> +static CPAccessResult access_tda(CPUARMState *env, const ARMCPRegInfo *ri,
>>> +                                  bool isread)
>>> +{
>>> +    int el = arm_current_el(env);
>>> +
>>> +    if (el < 2 && (env->cp15.mdcr_el2 & MDCR_TDA)
>>> +        && !arm_is_secure_below_el3(env)) {
>>> +        return CP_ACCESS_TRAP_EL2;
>>> +    }
>>> +    if (el < 3 && (env->cp15.mdcr_el3 & MDCR_TDA)) {
>>> +        return CP_ACCESS_TRAP_EL3;
>>> +    }
>>> +    return CP_ACCESS_OK;
>>> +}
>>> +
>>>  static void dacr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
>>>  {
>>>      ARMCPU *cpu = arm_env_get_cpu(env);
>>> @@ -3385,7 +3403,8 @@ static const ARMCPRegInfo el3_no_el2_cp_reginfo[] = {
>>>        .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
>>>      { .name = "MDCR_EL2", .state = ARM_CP_STATE_BOTH,
>>>        .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 1,
>>> -      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
>>> +      .access = PL2_RW, .accessfn = access_tda,
>>> +      .type = ARM_CP_CONST, .resetvalue = 0 },
>>>      { .name = "HPFAR_EL2", .state = ARM_CP_STATE_BOTH,
>>>        .opc0 = 3, .opc1 = 4, .crn = 6, .crm = 0, .opc2 = 4,
>>>        .access = PL2_RW, .accessfn = access_el3_aa32ns_aa64any,
>>> @@ -3804,7 +3823,7 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
>>>      /* Monitor debug system control register; the 32-bit alias is DBGDSCRext. */
>>>      { .name = "MDSCR_EL1", .state = ARM_CP_STATE_BOTH,
>>>        .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 2,
>>> -      .access = PL1_RW,
>>> +      .access = PL1_RW, .accessfn = access_tda,
>>>        .fieldoffset = offsetof(CPUARMState, cp15.mdscr_el1),
>>>        .resetvalue = 0 },
>>>      /* MDCCSR_EL0, aka DBGDSCRint. This is a read-only mirror of MDSCR_EL1.
>>> @@ -3813,7 +3832,7 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
>>>      { .name = "MDCCSR_EL0", .state = ARM_CP_STATE_BOTH,
>>>        .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 0,
>>>        .type = ARM_CP_ALIAS,
>>> -      .access = PL1_R,
>>> +      .access = PL1_R, .accessfn = access_tda,
>> From ARMv8 ARM rev. A.h: "If MDSCR_EL1.TDCC==1, EL0 read accesses to
>> this register are trapped to EL1." But it seems like we just don't
>> implement "Config-RO for EL0" so far.
> Yes. There's a comment about this, though it's just outside the
> context region that diff has produced.
>
>> Maybe it's worth to implement a
>> separate function for checks controlled by MDSCR_EL1.TDCC?
> I think that's a separate issue from the EL2/EL3 traps and
> should go in its own patch. This series is just trying to get
> EL3 right.

Okay, with fixed subject:

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

Kind regards,
Sergey
