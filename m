Received: by 10.182.158.201 with SMTP id ww9csp3388593obb;
        Wed, 2 Dec 2015 15:18:17 -0800 (PST)
X-Received: by 10.55.51.142 with SMTP id z136mr3107222qkz.21.1449098296549;
        Wed, 02 Dec 2015 15:18:16 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 200si5920835qhm.3.2015.12.02.15.18.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Dec 2015 15:18:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60753 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4GfA-0006d6-9k
	for alex.bennee@linaro.org; Wed, 02 Dec 2015 18:18:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49583)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4Gf6-0006ct-RK
	for qemu-arm@nongnu.org; Wed, 02 Dec 2015 18:18:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4Gf3-0000Me-IS
	for qemu-arm@nongnu.org; Wed, 02 Dec 2015 18:18:12 -0500
Received: from mail-qg0-x229.google.com ([2607:f8b0:400d:c04::229]:34509)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1a4Gf3-0000MX-Df; Wed, 02 Dec 2015 18:18:09 -0500
Received: by qgeb1 with SMTP id b1so47672666qge.1;
	Wed, 02 Dec 2015 15:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=F++V7kVa/LHLY0UnAQuw2U4A57de6IFATt6oowRDGac=;
	b=UDI0OWc/c73GJ2kQSejnsVefUyPdl7UKl0IDtI8bZiBMg/MioAe9gsGPdZY0IMP4h+
	6IGCCDlJIuKphxnuxyFZF/5Uo63oWaTKxIyQPnxGHptllyPcizRPFUfa+5Of1M/yK0B3
	LcUcz17XSOEDSQLsRGtLV13w8Zs5GOFtN2A6Dm238IIlpj/mxzMuxeTZGgWyQK7hBnM3
	U9yXEYSBAqPlc8s/XhOcjSW1P33pMknvbErJ4LVZLxPxIzW0hEQllxFhS2EcOXKfnsI2
	Gc1Nl5OA39vgv8+LVUipd0tcO02T5dgJBhiTLYHfrLjLAY9fhIGaCH3BZVMb6koivwfg
	v8xw==
X-Received: by 10.140.225.144 with SMTP id v138mr7839740qhb.89.1449098288869; 
	Wed, 02 Dec 2015 15:18:08 -0800 (PST)
Received: from [10.142.1.2] (ool-182df582.dyn.optonline.net. [24.45.245.130])
	by smtp.gmail.com with ESMTPSA id
	u77sm2197854qki.8.2015.12.02.15.18.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Dec 2015 15:18:08 -0800 (PST)
Message-ID: <565F7C2F.1020708@gmail.com>
Date: Wed, 02 Dec 2015 18:18:07 -0500
From: Michael Davidsaver <mdavidsaver@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
	<1447031505-12477-7-git-send-email-mdavidsaver@gmail.com>
	<CAFEAcA-kjyt2qVjrMN-3+aEapb4u0tRqy62+=8j5EsrNVUSc6Q@mail.gmail.com>
In-Reply-To: <CAFEAcA-kjyt2qVjrMN-3+aEapb4u0tRqy62+=8j5EsrNVUSc6Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c04::229
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH 06/18] armv7m: new NVIC utility functions
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
X-TUID: Ee0j/syaSTIe

On 11/20/2015 08:25 AM, Peter Maydell wrote:
> On 9 November 2015 at 01:11, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
>> Internal functions for operations previously done
>> by GIC internals.
>>
>> nvic_irq_update() recalculates highest pending/active
>> exceptions.
>>
>> armv7m_nvic_set_pending() include exception escalation
>> logic.
>>
>> armv7m_nvic_acknowledge_irq() and nvic_irq_update()
>> update ARMCPU fields.
> 
> Hi; I have a lot of review comments on this patch set, but that's
> really because v7M exception logic is pretty complicated and
> our current code is a long way away from correct. You might
> find it helpful to separate out "restructure the NVIC code
> into its own device" into separate patches from "and now add
> functionality like exception escalation", perhaps.

I'd certainly find this helpful :) I'm just not sure how to accomplish this and still make every patch compile.

>> Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
>> ---
>>  hw/intc/armv7m_nvic.c | 250 +++++++++++++++++++++++++++++++++++++++++++++++---
>>  1 file changed, 235 insertions(+), 15 deletions(-)
>>
>> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
>> index 487a09a..ebb4d4e 100644
>> --- a/hw/intc/armv7m_nvic.c
>> +++ b/hw/intc/armv7m_nvic.c
>> @@ -140,36 +140,256 @@ static void systick_reset(nvic_state *s)
>>      timer_del(s->systick.timer);
>>  }
>>
>> -/* The external routines use the hardware vector numbering, ie. the first
>> -   IRQ is #16.  The internal GIC routines use #32 as the first IRQ.  */
>> +/* caller must call nvic_irq_update() after this */
>> +static
>> +void set_prio(nvic_state *s, unsigned irq, uint8_t prio)
>> +{
>> +    unsigned submask = (1<<(s->prigroup+1))-1;
>> +
>> +    assert(irq > 3); /* only use for configurable prios */
>> +    assert(irq < NVIC_MAX_VECTORS);
>> +
>> +    s->vectors[irq].raw_prio = prio;
>> +    s->vectors[irq].prio_group = (prio>>(s->prigroup+1));
>> +    s->vectors[irq].prio_sub = irq + (prio&submask)*NVIC_MAX_VECTORS;
> 
> Precalculating the group priority seems a bit odd, since it
> will change later anyway if the guest writes to PRIGROUP.

I've kept the pre-calculation as the alternative comparison code is no simpler when tie breaking with exception number is done.

>> +
>> +    DPRINTF(0, "Set %u priority grp %d sub %u\n", irq,
>> +            s->vectors[irq].prio_group, s->vectors[irq].prio_sub);
>> +}
>> +
>> +/* recompute highest pending */
>> +static
>> +void nvic_irq_update(nvic_state *s, int update_active)
>> +{
>> +    unsigned i;
>> +    int lvl;
>> +    CPUARMState *env = &s->cpu->env;
>> +    int16_t act_group = 0x100, pend_group = 0x100;
>> +    uint16_t act_sub = 0, pend_sub = 0;
>> +    uint16_t act_irq = 0, pend_irq = 0;
>> +
>> +    /* find highest priority */
>> +    for (i = 1; i < s->num_irq; i++) {
>> +        vec_info *I = &s->vectors[i];
> 
> Minor style issue: we prefer lower case for variable names,
> and CamelCase for structure type names (see CODING_STYLE).
> So this would be VecInfo *vec; or something similar.

Done.

>> +
>> +        DPRINTF(2, " VECT %d %d:%u\n", i, I->prio_group, I->prio_sub);
>> +
>> +        if (I->active && ((I->prio_group < act_group)
>> +                || (I->prio_group == act_group && I->prio_sub < act_sub)))
> 
> Because the group priority and sub priority are just two contiguous
> parts of the raw priority, you get the same effect here by just
> doing a comparison on the raw value: "I->raw_prio <  act_raw_prio".

Not quite since it's possible that I->raw_prio == act_raw_prio.  As I read the ARM this situation should be avoided by using the exception number to break the tie.  This way no two priorities are ever equal.  This is the reason that act_sub is "irq + (prio&submask)*NVIC_MAX_VECTORS".

> Note however that the running priority is actually only the
> group priority part (see the pseudocode ExecutionPriority function)
> and so you want something more like:
> 
>     highestpri = 0x100;
>     for (each vector) {
>         if (vector->active && vector->raw_prio < highestpri) {
>             highestpri = vector->raw_prio & prigroup_mask;
>             act_sub = vector->raw_prio & ~prigroup_mask; // if you need it
>         }
>     }
> 
> (this is why it's not worth precalculating the group and
> subpriorities -- it's cheap enough to do at this point.)
> 
>> +        {
>> +            act_group = I->prio_group;
>> +            act_sub = I->prio_sub;
>> +            act_irq = i;
>> +        }
>> +
>> +        if (I->enabled && I->pending && ((I->prio_group < pend_group)
>> +                || (I->prio_group == pend_group && I->prio_sub < pend_sub)))
>> +        {
>> +            pend_group = I->prio_group;
>> +            pend_sub = I->prio_sub;
>> +            pend_irq = i;
>> +        }
>> +    }
>> +
>> +    env->v7m.pending = pend_irq;
>> +    env->v7m.pending_prio = pend_group;
>> +
>> +    if (update_active) {
>> +        env->v7m.exception = act_irq;
>> +        env->v7m.exception_prio = act_group;
>> +    }
>> +
>> +    /* Raise NVIC output even if pend_group is masked.
>> +     * This is necessary as we get no notification
>> +     * when PRIMASK et al. are changed.
>> +     * As long as our output is high cpu_exec() will call
>> +     * into arm_v7m_cpu_exec_interrupt() frequently, which
>> +     * then tests to see if the pending exception
>> +     * is permitted.
>> +     */
> 
> This is bad -- we should instead arrange to update our idea
> of the current running priority when PRIMASK &c are updated.
> (Also it's not clear why we need to have an outbound qemu_irq
> just to tell the core there's a pending exception. I think
> we should just be able to call cpu_interrupt().)

I agree, but haven't done anything about it as yet (not sure I will).

>> +    lvl = pend_irq > 0;
>> +    DPRINTF(1, "highest pending %d %d:%u\n", pend_irq, pend_group, pend_sub);
>> +    DPRINTF(1, "highest active  %d %d:%u\n", act_irq, act_group, act_sub);
>> +
>> +    DPRINTF(0, "IRQ %c highest act %d pend %d\n",
>> +            lvl ? 'X' : '_', act_irq, pend_irq);
>> +
>> +    qemu_set_irq(s->excpout, lvl);
>> +}
>> +
>> +static
>> +void armv7m_nvic_clear_pending(void *opaque, int irq)
>> +{
>> +    nvic_state *s = (nvic_state *)opaque;
>> +    vec_info *I;
>> +
>> +    assert(irq >= 0);
>> +    assert(irq < NVIC_MAX_VECTORS);
>> +
>> +    I = &s->vectors[irq];
>> +    if (I->pending) {
>> +        I->pending = 0;
>> +        nvic_irq_update(s, 0);
>> +    }
>> +}
>> +
>>  void armv7m_nvic_set_pending(void *opaque, int irq)
>>  {
>>      nvic_state *s = (nvic_state *)opaque;
>> -    if (irq >= 16)
>> -        irq += 16;
>> -    gic_set_pending_private(&s->gic, 0, irq);
>> +    CPUARMState *env = &s->cpu->env;
>> +    vec_info *I;
>> +    int active = s->cpu->env.v7m.exception;
>> +
>> +    assert(irq > 0);
>> +    assert(irq < NVIC_MAX_VECTORS);
>> +
>> +    I = &s->vectors[irq];
>> +
>> +    if (irq < ARMV7M_EXCP_SYSTICK && irq != ARMV7M_EXCP_DEBUG) {
> 
> This will include NMI, which is wrong (NMI doesn't escalate
> to HardFault because it's already higher priority than HardFault).
> It also includes PendSV, which is classified as an interrupt
> (like SysTick) and so also doesn't get escalated.

Yup, I was mis-reading the part about using NMI to recover from the unrecoverable.

> Also worth noting in a comment somewhere that for QEMU
> BusFault is always synchronous and so we have no asynchronous
> faults. (Async faults don't escalate.)

Done.

>> +        int runnable = armv7m_excp_unmasked(s->cpu);
> 
> "running_prio" might be a better name for this variable, since
> it's the current execution (running) priority.

This was an intentional, but confusing, distinction I was making (runnable==running-1).  This goes away.

>> +        /* test for exception escalation for vectors other than:
>> +         * Debug (12), SysTick (15), and all external IRQs (>=16)
>> +         */
> 
> This isn't really getting the DebugMonitor fault case right:
> DebugMonitor exceptions caused by executing a BKPT insn must be
> escalated if the running priority is too low; other DebugMonitor
> exceptions are just ignored (*not* set Pending).

Fixed.

>> +        unsigned escalate = 0;
>> +        if (I->active) {
>> +            /* trying to pend an active fault (possibly nested).
>> +             * eg. UsageFault in UsageFault handler
>> +             */
>> +            escalate = 1;
>> +            DPRINTF(0, " Escalate, active\n");
> 
> You don't need to explicitly check for this case, because it
> will be caught by the "is the running priority too high" check
> (the current running priority must be at least as high as the
> priority of an active fault handler). If you look at the ARM ARM
> section on priority escalation you'll see that "undef in a
> UsageFault handler" is listed in the "examples of things that
> cause priority escalation" bullet list, not the "definition of
> what causes escalation" list.

Good point.  On re-reading this I think I understand better how priority changes take effect (immediately).  I've move this test last and made it a hw_error() since it should only be hit if some bug results in inconsistency between the NVIC and ARMCPU priorities fields.

>> +        } else if (!I->enabled) {
>> +            /* trying to pend a disabled fault
>> +             * eg. UsageFault while USGFAULTENA in SHCSR is clear.
>> +             */
>> +            escalate = 1;
>> +            DPRINTF(0, " Escalate, not enabled\n");
>> +        } else if (I->prio_group > runnable) {
> 
> This should be <= : (a) equal priority to current execution
> priority gets escalated and (b) prio values are "low numbers
> are higher priorities".

Fixed

>> +            /* trying to pend a fault which is not immediately
>> +             * runnable due to masking by PRIMASK, FAULTMASK, BASEPRI,
>> +             * or the priority of the active exception
>> +             */
>> +            DPRINTF(0, " Escalate, mask %d >= %d\n",
>> +                    I->prio_group, runnable);
> 
> The condition printed in the debug log doesn't match the
> condition tested by the code.

Fixed

>> +            escalate = 1;
>> +        }
>> +
>> +        if (escalate) {
>> +#ifdef DEBUG_NVIC
>> +            int oldirq = irq;
>> +#endif
>> +            if (runnable < -1) {
>> +                /* TODO: actual unrecoverable exception actions */
>> +                cpu_abort(&s->cpu->parent_obj,
>> +                          "%d in %d escalates to unrecoverable exception\n",
>> +                          irq, active);
>> +            } else {
>> +                irq = ARMV7M_EXCP_HARD;
>> +            }
>> +            I = &s->vectors[irq];
>> +
>> +            DPRINTF(0, "Escalate %d to %d\n", oldirq, irq);
> 
> Faults escalated to HardFault retain the ReturnAddress
> behaviour of the original fault (ie what return-address
> is saved to the stack as part of the exception stacking and
> so whether we resume execution on the faulting insn or the
> next one). So it's not sufficient to just say "treat it
> exactly as if it were a HardFault" like this.

I'm confused.  From my testing it seems like the PC has already been adjusted by this point and no further changes are needed.  Am I missing something?

>> +        }
>> +    }
>> +
>> +    I->pending = 1;
>> +    if (I->enabled && (I->prio_group < env->v7m.pending_prio)) {
>> +        env->v7m.pending_prio = I->prio_group;
>> +        env->v7m.pending = irq;
>> +        qemu_set_irq(s->excpout, irq > 0);
>> +    }
>> +    DPRINTF(0, "Pending %d at %d%s runnable %d\n",
>> +            irq, I->prio_group,
>> +            env->v7m.pending == irq ? " (highest)" : "",
>> +            armv7m_excp_unmasked(s->cpu));
>>  }
> 
> thanks
> -- PMM
> 
