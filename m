Received: by 10.25.159.19 with SMTP id i19csp1431379lfe;
        Mon, 8 Feb 2016 08:38:48 -0800 (PST)
X-Received: by 10.140.154.10 with SMTP id a10mr36183977qha.92.1454949528656;
        Mon, 08 Feb 2016 08:38:48 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j131si31122103qhj.100.2016.02.08.08.38.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Feb 2016 08:38:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:46461 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aSops-0004QA-3D
	for alex.bennee@linaro.org; Mon, 08 Feb 2016 11:38:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35742)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aSopp-0004Pp-MJ
	for qemu-arm@nongnu.org; Mon, 08 Feb 2016 11:38:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aSopj-0008DJ-05
	for qemu-arm@nongnu.org; Mon, 08 Feb 2016 11:38:43 -0500
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:35180)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aSopi-0008CQ-Kz
	for qemu-arm@nongnu.org; Mon, 08 Feb 2016 11:38:38 -0500
Received: by mail-vk0-x22d.google.com with SMTP id e6so98711853vkh.2
	for <qemu-arm@nongnu.org>; Mon, 08 Feb 2016 08:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=FxzE/toWHISzcG/hZeERQM+vLGvU7SpgXaPgfrUvkog=;
	b=fBSqwlugLrhKnB1lOD1B+nsD/10I8lE4iDDzd1PjHBmqMCoWc/EL4Us/hQBJza8QGK
	nIgHL4POUdXvAgGSh46t/aqNgqMSPYOpDN7iE1O729ZQyQdUx6fZ/vLf3VfgHCz/WwkE
	E7co1cnaorXnvbb7X1BF9SzwAItVxpVEQtqlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=FxzE/toWHISzcG/hZeERQM+vLGvU7SpgXaPgfrUvkog=;
	b=J66f7IDxftiJylUmSkNODn7oKFT8q1O2Ts06LH8uWnsA+JCU57ESx5QURwM/YOEnKZ
	vm+Ig8nhMqVZm08sYl/rdDkhjXUZqhK+KX+u4/1vSZfXXh5a9IVUi+O1JhjD8/WMNUeq
	Gpit92yE4eSqyJMuIy73Wz+ZULL8CHkzM8jyKOccunq+RQc+2+Nu3M9uyndV/5MPiQ6G
	8xiKleTcZMHK9o1o46rSZQU6ocmsSAr/a1yU5yw4Z+HM8672WnlgmFLPbainTHoPyaqT
	fbautWDEDRMRRSVuxpYMKLudHlAmoS3xlcsILKoZwqLiL2p/pgaKwfxgIvlpR+vKaADS
	LExw==
X-Gm-Message-State: AG10YOSEZNoSresgw7F1rHCpvPt5ZK+L4rGSn/qzJ6nwQw/VYg7dnSjjE7ScRK+qAq4dbIC9Toc1LlRoZ/Yr1TxW
X-Received: by 10.31.1.6 with SMTP id 6mr18688448vkb.139.1454949518207; Mon,
	08 Feb 2016 08:38:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Mon, 8 Feb 2016 08:38:18 -0800 (PST)
In-Reply-To: <56B8C2EE.5090700@gmail.com>
References: <1454690704-16233-1-git-send-email-peter.maydell@linaro.org>
	<1454690704-16233-6-git-send-email-peter.maydell@linaro.org>
	<56B8C2EE.5090700@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2016 16:38:18 +0000
Message-ID: <CAFEAcA9v2KHF92omDQ3EzhdGsO=Vyt37zJ7REp=23sVJeQ1BaA@mail.gmail.com>
To: Sergey Fedorov <serge.fdrv@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22d
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
X-TUID: 8+8Pm3xpVJ9g

On 8 February 2016 at 16:31, Sergey Fedorov <serge.fdrv@gmail.com> wrote:
> One of the MDCR_EL2's should be MDCR_EL3 instead.

Oops, yes :-)

> On 05.02.2016 19:45, Peter Maydell wrote:
>> Implement the debug register traps controlled by MDCR_EL2.TDA
>> and MDCR_EL3.TDA.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  target-arm/helper.c | 39 ++++++++++++++++++++++++++++++---------
>>  1 file changed, 30 insertions(+), 9 deletions(-)
>>
>> diff --git a/target-arm/helper.c b/target-arm/helper.c
>> index 8c2adbc..064b415 100644
>> --- a/target-arm/helper.c
>> +++ b/target-arm/helper.c
>> @@ -420,6 +420,24 @@ static CPAccessResult access_tdra(CPUARMState *env, const ARMCPRegInfo *ri,
>>      return CP_ACCESS_OK;
>>  }
>>
>> +/* Check for traps to general debug registers, which are controlled
>> + * by MDCR_EL2.TDA for EL2 and MDCR_EL3.TDA for EL3.
>> + */
>> +static CPAccessResult access_tda(CPUARMState *env, const ARMCPRegInfo *ri,
>> +                                  bool isread)
>> +{
>> +    int el = arm_current_el(env);
>> +
>> +    if (el < 2 && (env->cp15.mdcr_el2 & MDCR_TDA)
>> +        && !arm_is_secure_below_el3(env)) {
>> +        return CP_ACCESS_TRAP_EL2;
>> +    }
>> +    if (el < 3 && (env->cp15.mdcr_el3 & MDCR_TDA)) {
>> +        return CP_ACCESS_TRAP_EL3;
>> +    }
>> +    return CP_ACCESS_OK;
>> +}
>> +
>>  static void dacr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
>>  {
>>      ARMCPU *cpu = arm_env_get_cpu(env);
>> @@ -3385,7 +3403,8 @@ static const ARMCPRegInfo el3_no_el2_cp_reginfo[] = {
>>        .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
>>      { .name = "MDCR_EL2", .state = ARM_CP_STATE_BOTH,
>>        .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 1,
>> -      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
>> +      .access = PL2_RW, .accessfn = access_tda,
>> +      .type = ARM_CP_CONST, .resetvalue = 0 },
>>      { .name = "HPFAR_EL2", .state = ARM_CP_STATE_BOTH,
>>        .opc0 = 3, .opc1 = 4, .crn = 6, .crm = 0, .opc2 = 4,
>>        .access = PL2_RW, .accessfn = access_el3_aa32ns_aa64any,
>> @@ -3804,7 +3823,7 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
>>      /* Monitor debug system control register; the 32-bit alias is DBGDSCRext. */
>>      { .name = "MDSCR_EL1", .state = ARM_CP_STATE_BOTH,
>>        .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 2,
>> -      .access = PL1_RW,
>> +      .access = PL1_RW, .accessfn = access_tda,
>>        .fieldoffset = offsetof(CPUARMState, cp15.mdscr_el1),
>>        .resetvalue = 0 },
>>      /* MDCCSR_EL0, aka DBGDSCRint. This is a read-only mirror of MDSCR_EL1.
>> @@ -3813,7 +3832,7 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
>>      { .name = "MDCCSR_EL0", .state = ARM_CP_STATE_BOTH,
>>        .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 0,
>>        .type = ARM_CP_ALIAS,
>> -      .access = PL1_R,
>> +      .access = PL1_R, .accessfn = access_tda,
>
> From ARMv8 ARM rev. A.h: "If MDSCR_EL1.TDCC==1, EL0 read accesses to
> this register are trapped to EL1." But it seems like we just don't
> implement "Config-RO for EL0" so far.

Yes. There's a comment about this, though it's just outside the
context region that diff has produced.

> Maybe it's worth to implement a
> separate function for checks controlled by MDSCR_EL1.TDCC?

I think that's a separate issue from the EL2/EL3 traps and
should go in its own patch. This series is just trying to get
EL3 right.

thanks
-- PMM
