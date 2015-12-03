Received: by 10.182.158.201 with SMTP id ww9csp3409970obb;
        Wed, 2 Dec 2015 16:12:22 -0800 (PST)
X-Received: by 10.140.159.206 with SMTP id f197mr8110540qhf.72.1449101542865;
        Wed, 02 Dec 2015 16:12:22 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u75si6120996qki.94.2015.12.02.16.12.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Dec 2015 16:12:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro-org.20150623.gappssmtp.com
Received: from localhost ([::1]:60888 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4HVW-0002RI-LU
	for alex.bennee@linaro.org; Wed, 02 Dec 2015 19:12:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34356)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a4HVA-0002AI-86
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:12:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a4HV8-0008Jh-Jh
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:12:00 -0500
Received: from mail-vk0-x232.google.com ([2607:f8b0:400c:c05::232]:35648)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a4HV8-0008JE-EV
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:11:58 -0500
Received: by vkha189 with SMTP id a189so35577648vkh.2
	for <qemu-devel@nongnu.org>; Wed, 02 Dec 2015 16:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=KgwHF7dBtxLhxEtcPQMkMQIJyk5DhpWDCaKhFIEAnFk=;
	b=Kopo4e+Mgs03WtM3LCUMBx7p0QzomC3J1UT0SYmSCyfcfMo2/DhtKZgdv545c7ghiA
	rMCVhEUJkm3CjYVaJy+9pJI4yvH9pPhEUnXw/Mze4N5KkhrqePJ40Mj06v+PUeql7/fS
	NgnXpFmITOXOQgtsCbvOxwGmZyKwtCaTw3t+5o+obFO0i8wMCpON5/CmLGjD1To+NQUJ
	qVEA5pUvSq9EzynafXJ8RfK5DFCemjTHq+EvYZ9mjzr36oBoYeHprsqoAW2pcBK2s1CY
	TIGAfxUGcw/nlDgGKURwHg29OnbluwB3e4qSxmldE7KDAJjrK6SCLwUzXEYSVorHlb3X
	1RwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=KgwHF7dBtxLhxEtcPQMkMQIJyk5DhpWDCaKhFIEAnFk=;
	b=EBhYI4acMM43z/GXwHbXTJ7XDWCZW6OT+C71DNxnHQNTXobCS6YInTi8SWp25w45l3
	/5GLmvhNTYoS+iM0HSDR53nuLkRsIKVk78E+lo4b2c9fs38Sj/fgUbkxwTBouITxB86S
	zlg6q12jL4a4Y43P3h2cSly2+0s58lJS5Cnx907dKf7mCkHLQlfKpxuFhMsB7NFDeyHE
	j2vEJwGiRDXjs3W8sj6QsYea/tUiJbrBS8uZu3KE1+w9ENHLWvuXL6u6KPf1mDt2YLFF
	bRT27Ncbeu3D3ZQFhksLea+EL9GLjgi6HNjjn8zfpe/waTp7lWXBQQ73smekGOA/I9O2
	LfIg==
X-Gm-Message-State: ALoCoQmcUJruwdjb8DO5kQd08aN+UsnPnCRUWFJDpRVavVQBI3px+HDp8J1zj/WyjQA8ViSPm2k5
X-Received: by 10.31.16.214 with SMTP id 83mr3732466vkq.139.1449101517801;
	Wed, 02 Dec 2015 16:11:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Wed, 2 Dec 2015 16:11:38 -0800 (PST)
In-Reply-To: <565F7C2F.1020708@gmail.com>
References: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
	<1447031505-12477-7-git-send-email-mdavidsaver@gmail.com>
	<CAFEAcA-kjyt2qVjrMN-3+aEapb4u0tRqy62+=8j5EsrNVUSc6Q@mail.gmail.com>
	<565F7C2F.1020708@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Dec 2015 00:11:38 +0000
Message-ID: <CAFEAcA86Oo6CUiAt5nqonpGsCkfvtuLWUgrUQgOx62ejWFyzNA@mail.gmail.com>
To: Michael Davidsaver <mdavidsaver@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::232
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-devel] [PATCH 06/18] armv7m: new NVIC utility functions
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: tO6V2zZOj4YJ

On 2 December 2015 at 23:18, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
> On 11/20/2015 08:25 AM, Peter Maydell wrote:
>> Hi; I have a lot of review comments on this patch set, but that's
>> really because v7M exception logic is pretty complicated and
>> our current code is a long way away from correct. You might
>> find it helpful to separate out "restructure the NVIC code
>> into its own device" into separate patches from "and now add
>> functionality like exception escalation", perhaps.
>
> I'd certainly find this helpful :) I'm just not sure how to accomplish
> this and still make every patch compile.

The idea would be to have a patch which is just moving (copying)
the old code into the new code structure, so you get the old behaviour
but in the new device. Then you have patches which change the old
behaviour to the desired new behaviour.

>>> Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
>>> ---
>>>  hw/intc/armv7m_nvic.c | 250 +++++++++++++++++++++++++++++++++++++++++++++++---
>>>  1 file changed, 235 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
>>> index 487a09a..ebb4d4e 100644
>>> --- a/hw/intc/armv7m_nvic.c
>>> +++ b/hw/intc/armv7m_nvic.c
>>> @@ -140,36 +140,256 @@ static void systick_reset(nvic_state *s)
>>>      timer_del(s->systick.timer);
>>>  }
>>>
>>> -/* The external routines use the hardware vector numbering, ie. the first
>>> -   IRQ is #16.  The internal GIC routines use #32 as the first IRQ.  */
>>> +/* caller must call nvic_irq_update() after this */
>>> +static
>>> +void set_prio(nvic_state *s, unsigned irq, uint8_t prio)
>>> +{
>>> +    unsigned submask = (1<<(s->prigroup+1))-1;
>>> +
>>> +    assert(irq > 3); /* only use for configurable prios */
>>> +    assert(irq < NVIC_MAX_VECTORS);
>>> +
>>> +    s->vectors[irq].raw_prio = prio;
>>> +    s->vectors[irq].prio_group = (prio>>(s->prigroup+1));
>>> +    s->vectors[irq].prio_sub = irq + (prio&submask)*NVIC_MAX_VECTORS;
>>
>> Precalculating the group priority seems a bit odd, since it
>> will change later anyway if the guest writes to PRIGROUP.
>
> I've kept the pre-calculation as the alternative comparison code is
> no simpler when tie breaking with exception number is done.

Precalculation means you end up either (a) migrating state which
isn't really device state, or (b) having to re-calculate the
precalculations on migration load. (a) isn't really a good idea
since it turns internal details of the implementation into ABI
we might eventually have to support for backward compatibility
of migrations, and (b) is extra code.

>>> +
>>> +    DPRINTF(0, "Set %u priority grp %d sub %u\n", irq,
>>> +            s->vectors[irq].prio_group, s->vectors[irq].prio_sub);
>>> +}
>>> +
>>> +/* recompute highest pending */
>>> +static
>>> +void nvic_irq_update(nvic_state *s, int update_active)
>>> +{
>>> +    unsigned i;
>>> +    int lvl;
>>> +    CPUARMState *env = &s->cpu->env;
>>> +    int16_t act_group = 0x100, pend_group = 0x100;
>>> +    uint16_t act_sub = 0, pend_sub = 0;
>>> +    uint16_t act_irq = 0, pend_irq = 0;
>>> +
>>> +    /* find highest priority */
>>> +    for (i = 1; i < s->num_irq; i++) {
>>> +        vec_info *I = &s->vectors[i];
>>
>> Minor style issue: we prefer lower case for variable names,
>> and CamelCase for structure type names (see CODING_STYLE).
>> So this would be VecInfo *vec; or something similar.
>
> Done.
>
>>> +
>>> +        DPRINTF(2, " VECT %d %d:%u\n", i, I->prio_group, I->prio_sub);
>>> +
>>> +        if (I->active && ((I->prio_group < act_group)
>>> +                || (I->prio_group == act_group && I->prio_sub < act_sub)))
>>
>> Because the group priority and sub priority are just two contiguous
>> parts of the raw priority, you get the same effect here by just
>> doing a comparison on the raw value: "I->raw_prio <  act_raw_prio".
>
> Not quite since it's possible that I->raw_prio == act_raw_prio.  As
> I read the ARM this situation should be avoided by using the exception
> number to break the tie.  This way no two priorities are ever equal.
>  This is the reason that act_sub is "irq + (prio&submask)*NVIC_MAX_VECTORS".

You should use the exception number to break the tie, yes, but
I don't see why that requires you to encode the irq number into
anything, because you can arrange that you get that behaviour
by coding the loop suitably. The code I had isn't quite right,
though...

>> Note however that the running priority is actually only the
>> group priority part (see the pseudocode ExecutionPriority function)
>> and so you want something more like:
>>
>>     highestpri = 0x100;
>>     for (each vector) {
>>         if (vector->active && vector->raw_prio < highestpri) {
>>             highestpri = vector->raw_prio & prigroup_mask;
>>             act_sub = vector->raw_prio & ~prigroup_mask; // if you need it
>>         }
>>     }

...try:

   highestpri = current_running_priority;
   /* find highest priority active vector; this will correctly
    * handle group and subgroup priority fields, and in the case
    * of a tie we'll get the vector with the lowest exception
    * number, because the comparison is '<' and we start from 0.
    */
   for (each vector starting from 0) {
       if (vector->active && vector->raw_prio < highestpri) {
           highestpri = vector->raw_prio;
       }
   }
   if ((highestpri & prigroup_mask) < current_running_priority) {
       /* this interrupt should actually preempt */
   }

(I think we also have similar loop-through-all-interrupts logic in
the "return current running priority" function, though -- we should
only do the calculation in one place if we can.)

>>> +        unsigned escalate = 0;
>>> +        if (I->active) {
>>> +            /* trying to pend an active fault (possibly nested).
>>> +             * eg. UsageFault in UsageFault handler
>>> +             */
>>> +            escalate = 1;
>>> +            DPRINTF(0, " Escalate, active\n");
>>
>> You don't need to explicitly check for this case, because it
>> will be caught by the "is the running priority too high" check
>> (the current running priority must be at least as high as the
>> priority of an active fault handler). If you look at the ARM ARM
>> section on priority escalation you'll see that "undef in a
>> UsageFault handler" is listed in the "examples of things that
>> cause priority escalation" bullet list, not the "definition of
>> what causes escalation" list.
>
> Good point.  On re-reading this I think I understand better how
> priority changes take effect (immediately).  I've move this test
> last and made it a hw_error() since it should only be hit if
> some bug results in inconsistency between the NVIC and ARMCPU
> priorities fields.

It can happen for synchronous exceptions, like the example
case of UsageFault in a UsageFault handler (eg executing an
undefined insn in the handler).

>>> +            escalate = 1;
>>> +        }
>>> +
>>> +        if (escalate) {
>>> +#ifdef DEBUG_NVIC
>>> +            int oldirq = irq;
>>> +#endif
>>> +            if (runnable < -1) {
>>> +                /* TODO: actual unrecoverable exception actions */
>>> +                cpu_abort(&s->cpu->parent_obj,
>>> +                          "%d in %d escalates to unrecoverable exception\n",
>>> +                          irq, active);
>>> +            } else {
>>> +                irq = ARMV7M_EXCP_HARD;
>>> +            }
>>> +            I = &s->vectors[irq];
>>> +
>>> +            DPRINTF(0, "Escalate %d to %d\n", oldirq, irq);
>>
>> Faults escalated to HardFault retain the ReturnAddress
>> behaviour of the original fault (ie what return-address
>> is saved to the stack as part of the exception stacking and
>> so whether we resume execution on the faulting insn or the
>> next one). So it's not sufficient to just say "treat it
>> exactly as if it were a HardFault" like this.
>
> I'm confused.  From my testing it seems like the PC has already
> been adjusted by this point and no further changes are needed.
> Am I missing something?

You're right -- for arm_v7m_cpu_do_interrupt() we expect the
PC to have already been adjusted as required (this is unlike
the A/R profile do_interrupt function which does the adjustment
of the LR according to type of exception, which is why I thought
there was a problem.)

In that case we should just have a comment here that says
that since env->regs[15] has already been adjusted appropriately
for the original fault type we can just change the irq number
here and still get the correct ReturnAddress behaviour for
the original fault.

thanks
-- PMM
