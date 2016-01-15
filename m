Received: by 10.25.159.19 with SMTP id i19csp367860lfe;
        Fri, 15 Jan 2016 02:25:17 -0800 (PST)
X-Received: by 10.140.220.134 with SMTP id q128mr13003787qhb.56.1452853515861;
        Fri, 15 Jan 2016 02:25:15 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z23si10706800qka.91.2016.01.15.02.25.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jan 2016 02:25:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@virtualopensystems-com.20150623.gappssmtp.com
Received: from localhost ([::1]:46255 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aK1ZD-0001Nm-5f
	for alex.bennee@linaro.org; Fri, 15 Jan 2016 05:25:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39356)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <a.rigo@virtualopensystems.com>) id 1aK1ZA-0001K7-05
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 05:25:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <a.rigo@virtualopensystems.com>) id 1aK1Z7-0004S9-Pf
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 05:25:11 -0500
Received: from mail-ig0-x230.google.com ([2607:f8b0:4001:c05::230]:35913)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <a.rigo@virtualopensystems.com>) id 1aK1Z6-0004R7-Go
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 05:25:09 -0500
Received: by mail-ig0-x230.google.com with SMTP id z14so8524887igp.1
	for <qemu-arm@nongnu.org>; Fri, 15 Jan 2016 02:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=virtualopensystems-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=weYECJvSM586S7hs8T75co863uBhQ6v+PJ2pEEbkkds=;
	b=gu0+GxUeptCGY7FAQG4vIi8ZsFI4FSqSf8kRixLmV4LFNeetGXHDZy0b/vdXbMrIuV
	0Y7iLdDIJFcJWU9WJMzBZB1McQlNJazZ6oaepu/KBqUdpmaE+HZQHkpn/1X+Wt9Gs1C7
	ab2l+R8AeR3TXrk5pOEXBwQuA6dcPLrIrS4/IHO9HBoCSTyHa4LSBBMkUw7eBTtlrJMW
	kk6g4u/+ZgBj8PyHp+5isd64jXUFdpHF4h+Wcy15cDhInZYC50brpPQkqbTCjFS/mKyM
	uWmjbxjzeyQFEsemq6J7tGMpBXvN4wHDJeqwvR6bX9vRQ7z7r3qeiEuc2f/e0xf58+UQ
	5H+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=weYECJvSM586S7hs8T75co863uBhQ6v+PJ2pEEbkkds=;
	b=HatkaAiPu0EjhSqnCdsBDibfLcCmzCkGlyoZvO/ap9OMvCLVigP70Yv8lQ+PWfsWo0
	OtbOuSArFRWvg33Jh3ftHc/6jgv3Hkuorr3Ox05lTi6bz0zUDcyhO1t72GZx7JyNSGgA
	hpya3Jx2y1JwZkcJFet40T+SEFAeVLrs0Wpwg5FMvLoV2Dmsc9GXkMDIaFM6b275TYmm
	LWl/5TEJdmDMppL25eJDVw1JFQP4ImlFw5XYTJu55zNHIyEP3aH4D3ElfJVAYwAQ6NLN
	OuJROaLzOvW1gmfzZ0EzAmszRjnCDgzY24+jFHFHq8JaQfuRtBtONIm9W2r3B+PjCMYW
	mMXQ==
X-Gm-Message-State: AG10YORX2vLQasUscIkqe/xuPZJLIkwH2qFhSacOZ4UbfHByQjACvzXBDo0Nb4IzvsrlOQeJI7IE4s5sfiO12A==
MIME-Version: 1.0
X-Received: by 10.50.142.73 with SMTP id ru9mr2449843igb.49.1452853507993;
	Fri, 15 Jan 2016 02:25:07 -0800 (PST)
Received: by 10.64.224.180 with HTTP; Fri, 15 Jan 2016 02:25:07 -0800 (PST)
X-Originating-IP: [80.15.154.113]
In-Reply-To: <CAFEAcA9FTxhaf3upvM-d6D14TpqA+Ed_OVJvFWK1Js_j2nTzhQ@mail.gmail.com>
References: <1452851965-19418-1-git-send-email-a.rigo@virtualopensystems.com>
	<CAFEAcA9FTxhaf3upvM-d6D14TpqA+Ed_OVJvFWK1Js_j2nTzhQ@mail.gmail.com>
Date: Fri, 15 Jan 2016 11:25:07 +0100
Message-ID: <CAH47eN188FvUMUpWNPQgJNJoGV61YLZ8yyR_=AKm_MmHBo1TmA@mail.gmail.com>
From: alvise rigo <a.rigo@virtualopensystems.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c05::230
Cc: "tech@virtualopensystems.com" <tech@virtualopensystems.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"open list:ARM" <qemu-arm@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH] target-arm: fix MMU index in
	arm_cpu_do_unaligned_access
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
X-TUID: M4+8u02aN5v7

On Fri, Jan 15, 2016 at 11:04 AM, Peter Maydell
<peter.maydell@linaro.org> wrote:
> On 15 January 2016 at 09:59, Alvise Rigo <a.rigo@virtualopensystems.com> wrote:
>> arm_regime_using_lpae_format checks whether the LPAE extension is used
>> for stage 1 translation regimes. MMU indexes not exclusively of a stage 1
>> regime won't work with this method.
>>
>> In case of ARMMMUIdx_S12NSE0 or ARMMMUIdx_S12NSE1, offset these values
>> by ARMMMUIdx_S1NSE0 to get the right index indicating a stage 1
>> translation regime.
>>
>> Rename also the function to arm_s1_regime_using_lpae_format and update
>> the comments to reflect the change.
>>
>> Signed-off-by: Alvise Rigo <a.rigo@virtualopensystems.com>
>> ---
>>  target-arm/helper.c    | 8 ++++----
>>  target-arm/internals.h | 5 +++--
>>  target-arm/op_helper.c | 8 ++++++--
>>  3 files changed, 13 insertions(+), 8 deletions(-)
>>
>> diff --git a/target-arm/helper.c b/target-arm/helper.c
>> index 59d5a41..8317ff5 100644
>> --- a/target-arm/helper.c
>> +++ b/target-arm/helper.c
>> @@ -5996,10 +5996,10 @@ static inline bool regime_using_lpae_format(CPUARMState *env,
>>      return false;
>>  }
>>
>> -/* Returns true if the translation regime is using LPAE format page tables.
>> - * Used when raising alignment exceptions, whose FSR changes depending on
>> - * whether the long or short descriptor format is in use. */
>> -bool arm_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
>> +/* Returns true if the stage 1 translation regime is using LPAE format page
>> + * tables. Used when raising alignment exceptions, whose FSR changes depending
>> + * on whether the long or short descriptor format is in use. */
>> +bool arm_s1_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
>>  {
>>      return regime_using_lpae_format(env, mmu_idx);
>>  }
>> diff --git a/target-arm/internals.h b/target-arm/internals.h
>> index b925aaa..d226bbe 100644
>> --- a/target-arm/internals.h
>> +++ b/target-arm/internals.h
>> @@ -441,8 +441,9 @@ struct ARMMMUFaultInfo {
>>  bool arm_tlb_fill(CPUState *cpu, vaddr address, int rw, int mmu_idx,
>>                    uint32_t *fsr, ARMMMUFaultInfo *fi);
>>
>> -/* Return true if the translation regime is using LPAE format page tables */
>> -bool arm_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx);
>> +/* Return true if the stage 1 translation regime is using LPAE format page
>> + * tables */
>> +bool arm_s1_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx);
>>
>>  /* Raise a data fault alignment exception for the specified virtual address */
>>  void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr, int is_write,
>> diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
>> index e42d287..ccc505d 100644
>> --- a/target-arm/op_helper.c
>> +++ b/target-arm/op_helper.c
>> @@ -133,7 +133,7 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr, int is_write,
>>  {
>>      ARMCPU *cpu = ARM_CPU(cs);
>>      CPUARMState *env = &cpu->env;
>> -    int target_el;
>> +    int target_el, mmu_idx;
>>      bool same_el;
>>
>>      if (retaddr) {
>> @@ -146,10 +146,14 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr, int is_write,
>>
>>      env->exception.vaddress = vaddr;
>>
>> +    mmu_idx = cpu_mmu_index(env, false);
>> +    if (mmu_idx == ARMMMUIdx_S12NSE0 || mmu_idx == ARMMMUIdx_S12NSE1) {
>> +        mmu_idx += ARMMMUIdx_S1NSE0;
>> +    }
>
> I would let the arm_s1_regime_using_lpae_format() function do this conversion
> from the S12 index to the S1 index.

OK, I will send the updated version right away.

>
> Otherwise this looks good to me.

Thank you,
alvise

>
>>      /* the DFSR for an alignment fault depends on whether we're using
>>       * the LPAE long descriptor format, or the short descriptor format
>>       */
>> -    if (arm_regime_using_lpae_format(env, cpu_mmu_index(env, false))) {
>> +    if (arm_s1_regime_using_lpae_format(env, mmu_idx)) {
>>          env->exception.fsr = 0x21;
>>      } else {
>>          env->exception.fsr = 0x1;
>> --
>> 2.7.0
>
> thanks
> -- PMM
