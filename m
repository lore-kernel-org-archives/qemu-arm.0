Received: by 10.182.158.201 with SMTP id ww9csp477538obb;
        Fri, 20 Nov 2015 05:25:32 -0800 (PST)
X-Received: by 10.129.156.79 with SMTP id t76mr14324797ywg.71.1448025932711;
        Fri, 20 Nov 2015 05:25:32 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n203si10500625ywc.150.2015.11.20.05.25.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Nov 2015 05:25:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro-org.20150623.gappssmtp.com
Received: from localhost ([::1]:47301 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zzlgy-0007ky-6Q
	for alex.bennee@linaro.org; Fri, 20 Nov 2015 08:25:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36883)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Zzlgu-0007kJ-Qd
	for qemu-arm@nongnu.org; Fri, 20 Nov 2015 08:25:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Zzlgt-0000As-5G
	for qemu-arm@nongnu.org; Fri, 20 Nov 2015 08:25:28 -0500
Received: from mail-yk0-x229.google.com ([2607:f8b0:4002:c07::229]:36673)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Zzlgs-00009Q-WB
	for qemu-arm@nongnu.org; Fri, 20 Nov 2015 08:25:27 -0500
Received: by ykdr82 with SMTP id r82so160159390ykd.3
	for <qemu-arm@nongnu.org>; Fri, 20 Nov 2015 05:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Bkku26jkhK5k6PEntKUHyY2fpeNJj3HC/5q6PmBt834=;
	b=Id27SGZQ8at8vJkiBTfnNO6dLPsvFicuMJR6c43Xum4klVEUsq2Cy6CL3oYisaV82m
	M1JYMV6HizKq7Ay9ODy3OHJgsD3hw2aGOn2csAy5ItqFPXf+O3dK+tj1I6Xgg3oPtW/7
	N+OD92rI5SqPzMcqwP8kMx4wMhSWfDlrijjUtlK8grnHOBQL5Xv6C3o4f6IaMzsFZdJN
	636qqdNVH76m5cux0IssgNyJUOYZFOYwwB8fMNAbbyElVngCEfL6UUyzP1L/ZaZCTUt4
	uunGvbA6T0zIecwjAWbXVrDVrSKzVhSjxji89InVba9trgHFLpXK+stOGiRusSW0ywgz
	PtWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Bkku26jkhK5k6PEntKUHyY2fpeNJj3HC/5q6PmBt834=;
	b=cyu9AaioGQPphAkCtotRd3OJzTrkcG+jZ4RvyUkak9bcO/PPd+Hpi3uOiUnL4feKe8
	Yhq1q6Gz5NzjC8jmLDT2E/BiD0OU/eivheWVMd1n+WP1yrJA2KwFd6gLebtig4W0k7gh
	7og7FAq/B2Y5uLcW1GTENccSqVKGcwyqVER4RNfH1NEVx/CS8MLaV78bZ9ZEWNWRwMU7
	hk21UODgx/nzBphLh9aVQpq/QrMCYR6JMa00WV27tfCMmJgpdQV8o4W1KVc78GBedsDs
	7//NychnFkSqF9CsxjhxPgMbGBmqcFQUjf6HSUPABoDPMOjgDq5RwRwQUM9vshN140ZP
	L3ew==
X-Gm-Message-State: ALoCoQlE/mslm4BY3sCR/IifJ33S52IxZ6PctFOW5W9JuD05XskcpgJwMyVEgOsDtTz6DGtaMPQ/
X-Received: by 10.129.99.195 with SMTP id x186mr12868685ywb.345.1448025926341; 
	Fri, 20 Nov 2015 05:25:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 20 Nov 2015 05:25:07 -0800 (PST)
In-Reply-To: <1447031505-12477-7-git-send-email-mdavidsaver@gmail.com>
References: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
	<1447031505-12477-7-git-send-email-mdavidsaver@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Nov 2015 13:25:07 +0000
Message-ID: <CAFEAcA-kjyt2qVjrMN-3+aEapb4u0tRqy62+=8j5EsrNVUSc6Q@mail.gmail.com>
To: Michael Davidsaver <mdavidsaver@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4002:c07::229
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
X-TUID: eEJ2DovN4e+d

On 9 November 2015 at 01:11, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
> Internal functions for operations previously done
> by GIC internals.
>
> nvic_irq_update() recalculates highest pending/active
> exceptions.
>
> armv7m_nvic_set_pending() include exception escalation
> logic.
>
> armv7m_nvic_acknowledge_irq() and nvic_irq_update()
> update ARMCPU fields.

Hi; I have a lot of review comments on this patch set, but that's
really because v7M exception logic is pretty complicated and
our current code is a long way away from correct. You might
find it helpful to separate out "restructure the NVIC code
into its own device" into separate patches from "and now add
functionality like exception escalation", perhaps.

> Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
> ---
>  hw/intc/armv7m_nvic.c | 250 +++++++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 235 insertions(+), 15 deletions(-)
>
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 487a09a..ebb4d4e 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -140,36 +140,256 @@ static void systick_reset(nvic_state *s)
>      timer_del(s->systick.timer);
>  }
>
> -/* The external routines use the hardware vector numbering, ie. the first
> -   IRQ is #16.  The internal GIC routines use #32 as the first IRQ.  */
> +/* caller must call nvic_irq_update() after this */
> +static
> +void set_prio(nvic_state *s, unsigned irq, uint8_t prio)
> +{
> +    unsigned submask = (1<<(s->prigroup+1))-1;
> +
> +    assert(irq > 3); /* only use for configurable prios */
> +    assert(irq < NVIC_MAX_VECTORS);
> +
> +    s->vectors[irq].raw_prio = prio;
> +    s->vectors[irq].prio_group = (prio>>(s->prigroup+1));
> +    s->vectors[irq].prio_sub = irq + (prio&submask)*NVIC_MAX_VECTORS;

Precalculating the group priority seems a bit odd, since it
will change later anyway if the guest writes to PRIGROUP.

> +
> +    DPRINTF(0, "Set %u priority grp %d sub %u\n", irq,
> +            s->vectors[irq].prio_group, s->vectors[irq].prio_sub);
> +}
> +
> +/* recompute highest pending */
> +static
> +void nvic_irq_update(nvic_state *s, int update_active)
> +{
> +    unsigned i;
> +    int lvl;
> +    CPUARMState *env = &s->cpu->env;
> +    int16_t act_group = 0x100, pend_group = 0x100;
> +    uint16_t act_sub = 0, pend_sub = 0;
> +    uint16_t act_irq = 0, pend_irq = 0;
> +
> +    /* find highest priority */
> +    for (i = 1; i < s->num_irq; i++) {
> +        vec_info *I = &s->vectors[i];

Minor style issue: we prefer lower case for variable names,
and CamelCase for structure type names (see CODING_STYLE).
So this would be VecInfo *vec; or something similar.

> +
> +        DPRINTF(2, " VECT %d %d:%u\n", i, I->prio_group, I->prio_sub);
> +
> +        if (I->active && ((I->prio_group < act_group)
> +                || (I->prio_group == act_group && I->prio_sub < act_sub)))

Because the group priority and sub priority are just two contiguous
parts of the raw priority, you get the same effect here by just
doing a comparison on the raw value: "I->raw_prio <  act_raw_prio".

Note however that the running priority is actually only the
group priority part (see the pseudocode ExecutionPriority function)
and so you want something more like:

    highestpri = 0x100;
    for (each vector) {
        if (vector->active && vector->raw_prio < highestpri) {
            highestpri = vector->raw_prio & prigroup_mask;
            act_sub = vector->raw_prio & ~prigroup_mask; // if you need it
        }
    }

(this is why it's not worth precalculating the group and
subpriorities -- it's cheap enough to do at this point.)

> +        {
> +            act_group = I->prio_group;
> +            act_sub = I->prio_sub;
> +            act_irq = i;
> +        }
> +
> +        if (I->enabled && I->pending && ((I->prio_group < pend_group)
> +                || (I->prio_group == pend_group && I->prio_sub < pend_sub)))
> +        {
> +            pend_group = I->prio_group;
> +            pend_sub = I->prio_sub;
> +            pend_irq = i;
> +        }
> +    }
> +
> +    env->v7m.pending = pend_irq;
> +    env->v7m.pending_prio = pend_group;
> +
> +    if (update_active) {
> +        env->v7m.exception = act_irq;
> +        env->v7m.exception_prio = act_group;
> +    }
> +
> +    /* Raise NVIC output even if pend_group is masked.
> +     * This is necessary as we get no notification
> +     * when PRIMASK et al. are changed.
> +     * As long as our output is high cpu_exec() will call
> +     * into arm_v7m_cpu_exec_interrupt() frequently, which
> +     * then tests to see if the pending exception
> +     * is permitted.
> +     */

This is bad -- we should instead arrange to update our idea
of the current running priority when PRIMASK &c are updated.
(Also it's not clear why we need to have an outbound qemu_irq
just to tell the core there's a pending exception. I think
we should just be able to call cpu_interrupt().)

> +    lvl = pend_irq > 0;
> +    DPRINTF(1, "highest pending %d %d:%u\n", pend_irq, pend_group, pend_sub);
> +    DPRINTF(1, "highest active  %d %d:%u\n", act_irq, act_group, act_sub);
> +
> +    DPRINTF(0, "IRQ %c highest act %d pend %d\n",
> +            lvl ? 'X' : '_', act_irq, pend_irq);
> +
> +    qemu_set_irq(s->excpout, lvl);
> +}
> +
> +static
> +void armv7m_nvic_clear_pending(void *opaque, int irq)
> +{
> +    nvic_state *s = (nvic_state *)opaque;
> +    vec_info *I;
> +
> +    assert(irq >= 0);
> +    assert(irq < NVIC_MAX_VECTORS);
> +
> +    I = &s->vectors[irq];
> +    if (I->pending) {
> +        I->pending = 0;
> +        nvic_irq_update(s, 0);
> +    }
> +}
> +
>  void armv7m_nvic_set_pending(void *opaque, int irq)
>  {
>      nvic_state *s = (nvic_state *)opaque;
> -    if (irq >= 16)
> -        irq += 16;
> -    gic_set_pending_private(&s->gic, 0, irq);
> +    CPUARMState *env = &s->cpu->env;
> +    vec_info *I;
> +    int active = s->cpu->env.v7m.exception;
> +
> +    assert(irq > 0);
> +    assert(irq < NVIC_MAX_VECTORS);
> +
> +    I = &s->vectors[irq];
> +
> +    if (irq < ARMV7M_EXCP_SYSTICK && irq != ARMV7M_EXCP_DEBUG) {

This will include NMI, which is wrong (NMI doesn't escalate
to HardFault because it's already higher priority than HardFault).
It also includes PendSV, which is classified as an interrupt
(like SysTick) and so also doesn't get escalated.

Also worth noting in a comment somewhere that for QEMU
BusFault is always synchronous and so we have no asynchronous
faults. (Async faults don't escalate.)

> +        int runnable = armv7m_excp_unmasked(s->cpu);

"running_prio" might be a better name for this variable, since
it's the current execution (running) priority.

> +        /* test for exception escalation for vectors other than:
> +         * Debug (12), SysTick (15), and all external IRQs (>=16)
> +         */

This isn't really getting the DebugMonitor fault case right:
DebugMonitor exceptions caused by executing a BKPT insn must be
escalated if the running priority is too low; other DebugMonitor
exceptions are just ignored (*not* set Pending).

> +        unsigned escalate = 0;
> +        if (I->active) {
> +            /* trying to pend an active fault (possibly nested).
> +             * eg. UsageFault in UsageFault handler
> +             */
> +            escalate = 1;
> +            DPRINTF(0, " Escalate, active\n");

You don't need to explicitly check for this case, because it
will be caught by the "is the running priority too high" check
(the current running priority must be at least as high as the
priority of an active fault handler). If you look at the ARM ARM
section on priority escalation you'll see that "undef in a
UsageFault handler" is listed in the "examples of things that
cause priority escalation" bullet list, not the "definition of
what causes escalation" list.

> +        } else if (!I->enabled) {
> +            /* trying to pend a disabled fault
> +             * eg. UsageFault while USGFAULTENA in SHCSR is clear.
> +             */
> +            escalate = 1;
> +            DPRINTF(0, " Escalate, not enabled\n");
> +        } else if (I->prio_group > runnable) {

This should be <= : (a) equal priority to current execution
priority gets escalated and (b) prio values are "low numbers
are higher priorities".

> +            /* trying to pend a fault which is not immediately
> +             * runnable due to masking by PRIMASK, FAULTMASK, BASEPRI,
> +             * or the priority of the active exception
> +             */
> +            DPRINTF(0, " Escalate, mask %d >= %d\n",
> +                    I->prio_group, runnable);

The condition printed in the debug log doesn't match the
condition tested by the code.

> +            escalate = 1;
> +        }
> +
> +        if (escalate) {
> +#ifdef DEBUG_NVIC
> +            int oldirq = irq;
> +#endif
> +            if (runnable < -1) {
> +                /* TODO: actual unrecoverable exception actions */
> +                cpu_abort(&s->cpu->parent_obj,
> +                          "%d in %d escalates to unrecoverable exception\n",
> +                          irq, active);
> +            } else {
> +                irq = ARMV7M_EXCP_HARD;
> +            }
> +            I = &s->vectors[irq];
> +
> +            DPRINTF(0, "Escalate %d to %d\n", oldirq, irq);

Faults escalated to HardFault retain the ReturnAddress
behaviour of the original fault (ie what return-address
is saved to the stack as part of the exception stacking and
so whether we resume execution on the faulting insn or the
next one). So it's not sufficient to just say "treat it
exactly as if it were a HardFault" like this.

> +        }
> +    }
> +
> +    I->pending = 1;
> +    if (I->enabled && (I->prio_group < env->v7m.pending_prio)) {
> +        env->v7m.pending_prio = I->prio_group;
> +        env->v7m.pending = irq;
> +        qemu_set_irq(s->excpout, irq > 0);
> +    }
> +    DPRINTF(0, "Pending %d at %d%s runnable %d\n",
> +            irq, I->prio_group,
> +            env->v7m.pending == irq ? " (highest)" : "",
> +            armv7m_excp_unmasked(s->cpu));
>  }

thanks
-- PMM
