Received: by 10.182.158.201 with SMTP id ww9csp3390487obb;
        Wed, 2 Dec 2015 15:22:44 -0800 (PST)
X-Received: by 10.55.72.23 with SMTP id v23mr7295251qka.24.1449098564916;
        Wed, 02 Dec 2015 15:22:44 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 25si5925780qky.58.2015.12.02.15.22.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Dec 2015 15:22:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60776 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4GjU-00019X-G5
	for alex.bennee@linaro.org; Wed, 02 Dec 2015 18:22:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50848)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4GjR-00016A-Oi
	for qemu-arm@nongnu.org; Wed, 02 Dec 2015 18:22:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4GjO-00021M-LE
	for qemu-arm@nongnu.org; Wed, 02 Dec 2015 18:22:41 -0500
Received: from mail-qk0-x233.google.com ([2607:f8b0:400d:c09::233]:34624)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1a4GjO-00021H-Gd; Wed, 02 Dec 2015 18:22:38 -0500
Received: by qkfo3 with SMTP id o3so23344544qkf.1;
	Wed, 02 Dec 2015 15:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=ZYCGWKJav3bz6Y44/R9VZOiQAoinf/SPCaYWP0qCXAo=;
	b=W5i8G2cuOfm2UJlgX7CeeI8FkV3fWEKE+s73RrOG05hlBycCp36mA2z0L/XPZ/sA5W
	wYolVOgC9/Dy2YgWYOLssE4YvQ2Id8BOp+daKrUR0IZZjxS0Lpkyg1teY+XqMU+9GvqB
	dobmF7EVI1pZ/mBGsbrnSvtzjFPcorbbPdfEWjCdmRisR72y71F4lhrANNWfS+tpo+yR
	Ff4BQihwrVsMuE3ei+Wy9s9ptDSRAdW/g8lyfCKWwKz3o07DH2o27cdebEAHZ7eF/Qit
	s621r0npFcD4hsBRkBHTftFMwXHWL9CbpQyeTtE0u7ejSodfLLrUCl554roOBBNJiLnT
	zvWw==
X-Received: by 10.55.72.10 with SMTP id v10mr7095022qka.14.1449098558088;
	Wed, 02 Dec 2015 15:22:38 -0800 (PST)
Received: from [10.142.1.2] (ool-182df582.dyn.optonline.net. [24.45.245.130])
	by smtp.gmail.com with ESMTPSA id
	c80sm2212735qkj.4.2015.12.02.15.22.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Dec 2015 15:22:37 -0800 (PST)
Message-ID: <565F7D3D.4030501@gmail.com>
Date: Wed, 02 Dec 2015 18:22:37 -0500
From: Michael Davidsaver <mdavidsaver@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
	<1447031505-12477-12-git-send-email-mdavidsaver@gmail.com>
	<CAFEAcA_M0z=QaeASNBfM6QfOhZ=+hvZD0XkX9nM4C4x3Fs0EEw@mail.gmail.com>
In-Reply-To: <CAFEAcA_M0z=QaeASNBfM6QfOhZ=+hvZD0XkX9nM4C4x3Fs0EEw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::233
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH 11/18] armv7m: fix I and F flag handling
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
X-TUID: 6ViRX8MXui3k

On 11/20/2015 08:47 AM, Peter Maydell wrote:
> On 9 November 2015 at 01:11, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
>> Despite having the same notation, these bits
>> have completely different meaning than -AR.
>>
>> Add armv7m_excp_unmasked()
>> to calculate the currently runable exception priority
>> taking into account masks and active handlers.
>> Use this in conjunction with the pending exception
>> priority to determine if the pending exception
>> can interrupt execution.
> 
> This function is used by code added in earlier patches in
> this series, so this patch needs to be moved earlier in the
> series, or those patches won't compile.

Should be fixed.

>> Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
>> ---
>>  target-arm/cpu.c | 26 +++++++-------------------
>>  target-arm/cpu.h | 27 ++++++++++++++++++++++++++-
>>  2 files changed, 33 insertions(+), 20 deletions(-)
>>
>> diff --git a/target-arm/cpu.c b/target-arm/cpu.c
>> index be026bc..5d03117 100644
>> --- a/target-arm/cpu.c
>> +++ b/target-arm/cpu.c
>> @@ -173,6 +173,8 @@ static void arm_cpu_reset(CPUState *s)
>>          uint32_t initial_pc; /* Loaded from 0x4 */
>>          uint8_t *rom;
>>
>> +        env->v7m.exception_prio = env->v7m.pending_prio = 0x100;
>> +
>>          env->daif &= ~PSTATE_I;
>>          rom = rom_ptr(0);
>>          if (rom) {
>> @@ -301,29 +303,15 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>>  {
>>      CPUClass *cc = CPU_GET_CLASS(cs);
>>      ARMCPU *cpu = ARM_CPU(cs);
>> -    CPUARMState *env = &cpu->env;
>>      bool ret = false;
>>
>> -
>> -    if (interrupt_request & CPU_INTERRUPT_FIQ
>> -        && !(env->daif & PSTATE_F)) {
>> -        cs->exception_index = EXCP_FIQ;
>> -        cc->do_interrupt(cs);
>> -        ret = true;
>> -    }
>> -    /* ARMv7-M interrupt return works by loading a magic value
>> -     * into the PC.  On real hardware the load causes the
>> -     * return to occur.  The qemu implementation performs the
>> -     * jump normally, then does the exception return when the
>> -     * CPU tries to execute code at the magic address.
>> -     * This will cause the magic PC value to be pushed to
>> -     * the stack if an interrupt occurred at the wrong time.
>> -     * We avoid this by disabling interrupts when
>> -     * pc contains a magic address.
> 
> This (removing this comment and the checks for the magic address)
> seem to be part of a separate change [probably the one in
> "armv7m: Undo armv7m.hack"] and shouldn't be in this patch.

Relocated.

>> +    /* ARMv7-M interrupt masking works differently than -A or -R.
>> +     * There is no FIQ/IRQ distinction.
>> +     * Instead of masking interrupt sources, the I and F bits
>> +     * (along with basepri) mask certain exception priority levels.
>>       */
>>      if (interrupt_request & CPU_INTERRUPT_HARD
>> -        && !(env->daif & PSTATE_I)
>> -        && (env->regs[15] < 0xfffffff0)) {
>> +            && (armv7m_excp_unmasked(cpu) >= cpu->env.v7m.pending_prio)) {
>>          cs->exception_index = EXCP_IRQ;
>>          cc->do_interrupt(cs);
>>          ret = true;
>> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
>> index c193fbb..29d89ce 100644
>> --- a/target-arm/cpu.h
>> +++ b/target-arm/cpu.h
>> @@ -1033,9 +1033,34 @@ void arm_cpu_list(FILE *f, fprintf_function cpu_fprintf);
>>  uint32_t arm_phys_excp_target_el(CPUState *cs, uint32_t excp_idx,
>>                                   uint32_t cur_el, bool secure);
>>
>> +/* @returns highest (numerically lowest) unmasked exception priority
>> + */
>> +static inline
>> +int armv7m_excp_unmasked(ARMCPU *cpu)
> 
> What this is really calculating is the current execution
> priority (running priority) of the CPU, so I think a better
> name would be armv7m_current_exec_priority() or
> armv7m_current_priority() or armv7m_running_priority() or similar.

Now armv7m_excp_running_prio()

>> +{
>> +    CPUARMState *env = &cpu->env;
>> +    int runnable;
>> +
>> +    /* find highest (numerically lowest) priority which could
>> +     * run based on masks
>> +     */
>> +    if (env->daif&PSTATE_F) { /* FAULTMASK */
> 
> Style issue -- operands should have spaces around them.
> 
>> +        runnable = -2;
> 
> These all seem to be off by one: FAULTMASK sets the
> running priority to -1, not -2, PRIMASK sets it to 0,
> not -1, and so on.

The off by one was due to my confusing runnable vs. running distinction, now gone.

>> +    } else if (env->daif&PSTATE_I) { /* PRIMASK */
>> +        runnable = -1;
>> +    } else if (env->v7m.basepri > 0) {
>> +        /* BASEPRI==1 -> runnable==-1 (same as PRIMASK==1) */
> 
> (applies to operands in comments too)
> 
>> +        runnable = env->v7m.basepri-2;
> 
> Where is this - 2 from? Also, BASEPRI values honour the
> PRIGROUP setting. (Compare the ExecutionPriority pseudocode).

The off by two for BASEPRI was my mis-reading the definition.

>> +    } else {
>> +        runnable = 0x100; /* lower than any possible priority */
>> +    }
>> +    /* consider priority of active handler */
>> +    return MIN(runnable, env->v7m.exception_prio-1);
> 
> I don't think this -1 should be here.

It is gone.

>> +}
>> +
>>  /* Interface between CPU and Interrupt controller.  */
>>  void armv7m_nvic_set_pending(void *opaque, int irq);
>> -int armv7m_nvic_acknowledge_irq(void *opaque);
>> +void armv7m_nvic_acknowledge_irq(void *opaque);
>>  void armv7m_nvic_complete_irq(void *opaque, int irq);
>>
>>  /* Interface for defining coprocessor registers.
> 
> thanks
> -- PMM
> 
