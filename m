Received: by 10.25.208.211 with SMTP id h202csp437629lfg;
        Sat, 27 Feb 2016 13:56:26 -0800 (PST)
X-Received: by 10.140.234.11 with SMTP id f11mr11349431qhc.51.1456610186734;
        Sat, 27 Feb 2016 13:56:26 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h206si19215120qhd.62.2016.02.27.13.56.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 27 Feb 2016 13:56:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56477 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aZmqg-0002pN-BB
	for alex.bennee@linaro.org; Sat, 27 Feb 2016 16:56:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35295)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aZmqd-0002p4-52
	for qemu-arm@nongnu.org; Sat, 27 Feb 2016 16:56:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aZmqb-0001oU-Uq
	for qemu-arm@nongnu.org; Sat, 27 Feb 2016 16:56:23 -0500
Received: from mail-wm0-x234.google.com ([2a00:1450:400c:c09::234]:38657)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aZmqb-0001oO-JQ; Sat, 27 Feb 2016 16:56:21 -0500
Received: by mail-wm0-x234.google.com with SMTP id l68so14753196wml.1;
	Sat, 27 Feb 2016 13:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=to+PwTww7YEwe+GEF9Xxrzh/AVJmHK9JNvzqHNxtTvU=;
	b=J4XRBm4VEB7IsFlks4RE9vJ6nLAPddY0Fkj5iOjQ8CWCIYLEVGsMzHSbd5ipbCUTxL
	7T1tZ2x+0qhkiDKGF3CLVJ4qxYhcTJJ8D0rPerTZrUVnexwLZQajt0LDdpCLRL8vNPtq
	1ONQPTb4HpWCH113rBowsu0luXjN4wm+59R3iD4ykdFg8cM6Y/cPwwhiiBImwuKsZoyv
	hFTsxNC+oEx2Yyw2NU2iICbJbww7hx1xC/LqO4mQUpKZsMLVrzlV04ytw+qiedWmO9tY
	O9sdRny8R6ACYaHlrgpVbS4H7ZhF4lDW8prVudaytdo0KuzMDa60HzInWylFwFIntIcE
	4gSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=to+PwTww7YEwe+GEF9Xxrzh/AVJmHK9JNvzqHNxtTvU=;
	b=Hq+IrI81/TbFToDgHF5/M/FxR6SiJ9qGsomxtClMug1ImNmGBKp31QAwCedBuziQEK
	8mubjQZDVXm4zBv9HqrfghsPVIREgW2x/57SPFaxfp56Zct7HfelLrcvwqSapfAjnrx5
	t0jr9gCNBu8fs0lyW5eheDNAbN4F4BcEf8NRGPIPNAq49WIOP6YBRGdT+hlrhFjpYqr/
	J2IFQZHfW3sss0yktLbcYx/xZtTXg9fvkCC1tB60Lt6VwFv6VociPl35k1a+RKOMBVrC
	8LlrGgoc+ew5aH98U3ST7dM6WaYVo5WeEjDNUStZoBuHgOrNSr3AR35uCL1JyHNyJRU5
	1uIg==
X-Gm-Message-State: AD7BkJI8ZkH2KnStyD1oGBV4Ub/5u0nk4bwOnh2BO5ovDJLe9ZJsHqazabLiQg/+Lt4VAvykDdF/Hd9X6jk7gg==
MIME-Version: 1.0
X-Received: by 10.28.146.209 with SMTP id u200mr4018820wmd.59.1456610180378;
	Sat, 27 Feb 2016 13:56:20 -0800 (PST)
Received: by 10.28.31.12 with HTTP; Sat, 27 Feb 2016 13:56:20 -0800 (PST)
In-Reply-To: <CAFEAcA_-X0SMfihg288z7w-pQhAUJH-BS+N3PooPNQAT5dcH6Q@mail.gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
	<fb6f0c034f8a1d36961247f56337aca1f22b3653.1453100525.git.crosthwaite.peter@gmail.com>
	<CAFEAcA_-X0SMfihg288z7w-pQhAUJH-BS+N3PooPNQAT5dcH6Q@mail.gmail.com>
Date: Sat, 27 Feb 2016 13:56:20 -0800
Message-ID: <CAPokK=q+gcoQx_2N_Ry0rQAfDdapytVMOndqHzqEO0yaLdyHTg@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::234
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	sridhar kulkarni <sridhar_kulk@yahoo.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>
Subject: Re: [Qemu-arm] [PATCH v1 04/17] target-arm: implement SCTLR.EE
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
X-TUID: C5SYYSrnQRvr

On Tue, Jan 19, 2016 at 7:58 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 18 January 2016 at 07:12, Peter Crosthwaite
> <crosthwaitepeter@gmail.com> wrote:
>> From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
>>
>> Implement SCTLR.EE bit which controls data endianess for exceptions
>> and page table translations. SCTLR.EE is mirrored to the CPSR.E bit
>> on exception entry.
>>
>> Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
>> ---
>>
>>  target-arm/helper.c | 42 ++++++++++++++++++++++++++++++++----------
>>  1 file changed, 32 insertions(+), 10 deletions(-)
>>
>> diff --git a/target-arm/helper.c b/target-arm/helper.c
>> index 59d5a41..afac1b2 100644
>> --- a/target-arm/helper.c
>> +++ b/target-arm/helper.c
>> @@ -5889,7 +5889,10 @@ void arm_cpu_do_interrupt(CPUState *cs)
>>      /* Clear IT bits.  */
>>      env->condexec_bits = 0;
>>      /* Switch to the new mode, and to the correct instruction set.  */
>> -    env->uncached_cpsr = (env->uncached_cpsr & ~CPSR_M) | new_mode;
>> +    env->uncached_cpsr = (env->uncached_cpsr & ~(CPSR_M)) | new_mode;
>
> Why change this line?
>

Reverted

>> +    /* Set new mode endianess */
>
> "endianness"
>

Fixed

>> +    env->uncached_cpsr = (env->uncached_cpsr & ~(CPSR_E)) |
>> +        (env->cp15.sctlr_el[arm_current_el(env)] & SCTLR_EE ? CPSR_E : 0);
>
> This is a bit confusing. I think just splitting it into
> multiple statements would help:
>    env->uncached_cpsr &= ~CPSR_E;
>    if (env->cp15.sctlr_el[arm_current_el(env)] & SCTLR_EE) {
>        env->uncached_cpsr |= CPSR_E;
>    }
>

Fixed.

>>      env->daif |= mask;
>>      /* this is a lie, as the was no c1_sys on V4T/V5, but who cares
>>       * and we should just guard the thumb mode on V4 */
>> @@ -5958,6 +5961,12 @@ static inline bool regime_translation_disabled(CPUARMState *env,
>>      return (regime_sctlr(env, mmu_idx) & SCTLR_M) == 0;
>>  }
>>
>> +static inline bool regime_translation_big_endian(CPUARMState *env,
>> +                                                 ARMMMUIdx mmu_idx)
>> +{
>> +    return (regime_sctlr(env, mmu_idx) & SCTLR_EE) != 0;
>> +}
>> +
>>  /* Return the TCR controlling this translation regime */
>>  static inline TCR *regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
>>  {
>> @@ -6263,7 +6272,7 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
>>   */
>>  static uint32_t arm_ldl_ptw(CPUState *cs, hwaddr addr, bool is_secure,
>>                              ARMMMUIdx mmu_idx, uint32_t *fsr,
>> -                            ARMMMUFaultInfo *fi)
>> +                            ARMMMUFaultInfo *fi, bool be)
>>  {
>>      ARMCPU *cpu = ARM_CPU(cs);
>>      CPUARMState *env = &cpu->env;
>> @@ -6274,12 +6283,16 @@ static uint32_t arm_ldl_ptw(CPUState *cs, hwaddr addr, bool is_secure,
>>      if (fi->s1ptw) {
>>          return 0;
>>      }
>> -    return address_space_ldl(cs->as, addr, attrs, NULL);
>> +    if (be) {
>> +        return address_space_ldl_be(cs->as, addr, attrs, NULL);
>> +    } else {
>> +        return address_space_ldl_le(cs->as, addr, attrs, NULL);
>> +    }
>>  }
>
> Why not just call regime_translation_big_endian() inside arm_ldl_ptw()
> and arm_ldq_ptw(), rather than having every call site making the call
> and passing in the result?
>

Fixed.

> PS: this patch will conflict with the multi-ases series but only
> fairly trivially.
>

Resolved.

Regards,
Peter

> thanks
> -- PMM
