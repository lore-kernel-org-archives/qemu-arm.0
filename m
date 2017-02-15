Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id p49sm5097958wrb.10.2017.02.15.06.15.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Feb 2017 06:15:49 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 35F183E00FA;
	Wed, 15 Feb 2017 14:15:49 +0000 (GMT)
References: <1486065742-28639-1-git-send-email-peter.maydell@linaro.org> <1486065742-28639-7-git-send-email-peter.maydell@linaro.org>
User-agent: mu4e 0.9.19; emacs 25.2.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org, Michael Davidsaver <mdavidsaver@gmail.com>, Liviu Ionescu <ilg@livius.net>
Subject: Re: [PATCH 6/9] armv7m: Escalate exceptions to HardFault if necessary
In-reply-to: <1486065742-28639-7-git-send-email-peter.maydell@linaro.org>
Date: Wed, 15 Feb 2017 14:15:49 +0000
Message-ID: <87h93vv8tm.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: VbTL2OYftnt5


Peter Maydell <peter.maydell@linaro.org> writes:

> From: Michael Davidsaver <mdavidsaver@gmail.com>
>
> The v7M exception architecture requires that if a synchronous
> exception cannot be taken immediately (because it is disabled
> or at too low a priority) then it should be escalated to
> HardFault (and the HardFault exception is then taken).
> Implement this escalation logic.
>
> Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
> [PMM: extracted from another patch]
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

> ---
>  hw/intc/armv7m_nvic.c | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/helper.c   |  2 --
>  2 files changed, 53 insertions(+), 2 deletions(-)
>
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 3d77cbf..2eaac3d 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -334,6 +334,59 @@ void armv7m_nvic_set_pending(void *opaque, int irq)
>
>      vec = &s->vectors[irq];
>      trace_nvic_set_pending(irq, vec->enabled, vec->prio);
> +
> +
> +    if (irq >= ARMV7M_EXCP_HARD && irq < ARMV7M_EXCP_PENDSV) {
> +        /* If a synchronous exception is pending then it may be
> +         * escalated to HardFault if:
> +         *  * it is equal or lower priority to current execution
> +         *  * it is disabled
> +         * (ie we need to take it immediately but we can't do so).
> +         * Asynchronous exceptions (and interrupts) simply remain pending.
> +         *
> +         * For QEMU, we don't have any imprecise (asynchronous) faults,
> +         * so we can assume that PREFETCH_ABORT and DATA_ABORT are always
> +         * synchronous.
> +         * Debug exceptions are awkward because only Debug exceptions
> +         * resulting from the BKPT instruction should be escalated,
> +         * but we don't currently implement any Debug exceptions other
> +         * than those that result from BKPT, so we treat all debug exceptions
> +         * as needing escalation.
> +         *
> +         * This all means we can identify whether to escalate based only on
> +         * the exception number and don't (yet) need the caller to explicitly
> +         * tell us whether this exception is synchronous or not.
> +         */
> +        int running = nvic_exec_prio(s);
> +        bool escalate = false;
> +
> +        if (vec->prio >= running) {
> +            trace_nvic_escalate_prio(irq, vec->prio, running);
> +            escalate = true;
> +        } else if (!vec->enabled) {
> +            trace_nvic_escalate_disabled(irq);
> +            escalate = true;
> +        }
> +
> +        if (escalate) {
> +            if (running < 0) {
> +                /* We want to escalate to HardFault but we can't take a
> +                 * synchronous HardFault at this point either. This is a
> +                 * Lockup condition due to a guest bug. We don't model
> +                 * Lockup, so report via cpu_abort() instead.
> +                 */
> +                cpu_abort(&s->cpu->parent_obj,
> +                          "Lockup: can't escalate %d to HardFault "
> +                          "(current priority %d)\n", irq, running);
> +            }
> +
> +            /* We can do the escalation, so we take HardFault instead */
> +            irq = ARMV7M_EXCP_HARD;
> +            vec = &s->vectors[irq];
> +            s->cpu->env.v7m.hfsr |= R_V7M_HFSR_FORCED_MASK;
> +        }
> +    }
> +
>      if (!vec->pending) {
>          vec->pending = 1;
>          nvic_irq_update(s);
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index c23df1b..6c86eac 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6067,8 +6067,6 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
>
>      /* For exceptions we just mark as pending on the NVIC, and let that
>         handle it.  */
> -    /* TODO: Need to escalate if the current priority is higher than the
> -       one we're raising.  */
>      switch (cs->exception_index) {
>      case EXCP_UDEF:
>          armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE);


--
Alex Bennée
