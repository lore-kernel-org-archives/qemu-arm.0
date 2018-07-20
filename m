Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2832498wru;
        Fri, 20 Jul 2018 07:22:06 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpf4QvG+6tgz/ku3+JsbB0PKz1DINxTpIydF2N+W3yI83zoxwkW8yuxxH3S5jVcx42+9yUxW
X-Received: by 2002:a37:210a:: with SMTP id h10-v6mr1931508qkh.263.1532096526526;
        Fri, 20 Jul 2018 07:22:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532096526; cv=none;
        d=google.com; s=arc-20160816;
        b=fdy9vu8E8jU78MAWTOVuHVHHWNjqnSqKO9Qc6OeWRcOJ8FK+rTgfAQ1Dp2OugrJxWe
         LZF08VZeteFbDHCI1C+huEko+9gc9gjdDmjthD1BpQuVfaLI1RYmKmrpyNxlWXgkDw0W
         AukfIYfHTWn6byVkVMr+XhPeA9wHSxV+rg9Zcu8kteIEgCbjSNeTQsPTBEBi+nlamkL3
         WI71SkvUoig9T0/TwLz2MI/geCXvLPGRpNiPaSszYeP66Hb0PeooscsrEFKyCgqr7PF/
         9DA+N1f2AOxdbDjS7JbUD8x7AIS+J6q65KYQdrKlYb6DTqrLW9kHTkY7ka+yn3w3bxLx
         fxkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=nrl/01+fWbxLhnz9Bo6KKG8ucMWrXNJUPymUB+T/v/8=;
        b=s3Q9XsCxk5zmTPHPoD+m1oRbOe16yr4/cY263uO07auPto3ukbuTO28FhxhOJ+Qwps
         lbugB6vauEAFYLa2bLqbjj7rbM9CE1LquXVu1r6605RU4jm16GpveuSMpMHarkQVGINI
         rHZEeCE9L8tEUZRiBPc+GtHs6bA09LiMU5uOInzQhl6AaTu2fHugAg85zd52TB2R+/6y
         sfX0cUdYq7i9KphrHjzvTLQ2vgO4U6Prdn+xjIYo5PudLNyJHyCtU7cZI0FgM+Ia/6kQ
         uRIp057aR3UzVzO8wMQVbwJq0+YVcoMui5qER2FffroukvqDQljs0/PC4hBYwYXaFphu
         pJ1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=k0L0LgGO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k85-v6si2027556qkh.357.2018.07.20.07.22.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Jul 2018 07:22:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=k0L0LgGO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48391 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fgWIH-0000BR-Vj
	for alex.bennee@linaro.org; Fri, 20 Jul 2018 10:22:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41878)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fgWI6-0000BB-3m
	for qemu-arm@nongnu.org; Fri, 20 Jul 2018 10:21:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fgWI4-0006P3-Gh
	for qemu-arm@nongnu.org; Fri, 20 Jul 2018 10:21:54 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:33740)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fgWI4-0006Om-7u
	for qemu-arm@nongnu.org; Fri, 20 Jul 2018 10:21:52 -0400
Received: by mail-oi0-x242.google.com with SMTP id l10-v6so21657604oii.0
	for <qemu-arm@nongnu.org>; Fri, 20 Jul 2018 07:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nrl/01+fWbxLhnz9Bo6KKG8ucMWrXNJUPymUB+T/v/8=;
	b=k0L0LgGOIleFVIY+8SACIys80EC304+dDgxgwdqgTVuuo69AbJ1lSNrb7jjwE6nDFK
	ReeIYJdIjRR9fc7XAFEj7PfDrcYmDzNn6BZnBB74D0LkxfJhZest6LHX2LgwRV53xC4j
	30g/PN6KwfRv//3U66EP38W9oOYMSvEcF9+lc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nrl/01+fWbxLhnz9Bo6KKG8ucMWrXNJUPymUB+T/v/8=;
	b=Bzutq3RKF3SLO+VABEXtZ5OES+iaK1JOZLDdOKvhnRECEBUyu4qdz3ajVIZO2U8C9U
	MXqyeslJ0Vzck+AUiaVxm5ei2ZVGzUplHg/+Zjo8lIL3yKTNwjeyTv4AidNcW0HTq0n5
	yZr4sFEVeFn2aU+BFhLnk36I8WFWdVXB6RGL3PBfncstEXJmcNnqarP5B+CyR+XXiwC8
	mZVH7vvOyL3VN9bzl0yd+Ll3OlmC8h16KRTlVY/tF8QgpW3ciEhE36UwveAaKRwamWgk
	FyiJLuxQnTfeeMX4/gBLNyhqcrRWg8mAHbkMmtMe3vL1WalXFi5geowOcs5DMsFOMLRZ
	T4jQ==
X-Gm-Message-State: AOUpUlFa+1zk7LYocIVf2NHpor1KM1CRvk1buMUz8AOVSU0YqcdVU6Qy
	ULnbPTMiKHlrRSC+dui+3C+8iPr5kYWYmG1rRoe0LA==
X-Received: by 2002:aca:f5d1:: with SMTP id
	t200-v6mr2403319oih.12.1532096511357; 
	Fri, 20 Jul 2018 07:21:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Fri, 20 Jul 2018 07:21:30
	-0700 (PDT)
In-Reply-To: <f2c6cd9a-0136-5a4c-64d8-854661f4278d@greensocs.com>
References: <20180714171601.5734-1-luc.michel@greensocs.com>
	<20180714171601.5734-13-luc.michel@greensocs.com>
	<CAFEAcA9dQEaONA3AkqnyY3PnkMHNcjc=MiBwoF99oHp-BJuRFA@mail.gmail.com>
	<f2c6cd9a-0136-5a4c-64d8-854661f4278d@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Jul 2018 15:21:30 +0100
Message-ID: <CAFEAcA_f_X2hn26EO2ZvmUBKjAkUbL6k9u+2tAMassdoA+3O-g@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [PATCH v4 12/20] intc/arm_gic: Implement
 virtualization extensions in gic_(deactivate|complete_irq)
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
Cc: Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OGJAHjEn8F1z

On 18 July 2018 at 14:22, Luc Michel <luc.michel@greensocs.com> wrote:
>
>
> On 07/17/2018 03:32 PM, Peter Maydell wrote:
>> On 14 July 2018 at 18:15, Luc Michel <luc.michel@greensocs.com> wrote:
>>> Implement virtualization extensions in the gic_deactivate_irq() and
>>> gic_complete_irq() functions.  When a guest tries to deactivat or end an
>>
>> "deactivate"
>>
>>> IRQ that does not exist in the LRs, the EOICount field of the virtual
>>> interface HCR register is incremented by one, and the request is
>>> ignored.
>>>
>>> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
>>> ---
>>>  hw/intc/arm_gic.c | 18 ++++++++++++++++++
>>>  1 file changed, 18 insertions(+)
>>>
>>> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
>>> index be9e2594d9..50cbbfbe24 100644
>>> --- a/hw/intc/arm_gic.c
>>> +++ b/hw/intc/arm_gic.c
>>> @@ -590,6 +590,15 @@ static void gic_deactivate_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
>>>          return;
>>>      }
>>>
>>> +    if (gic_is_vcpu(cpu) && !gic_virq_is_valid(s, irq, cpu)) {
>>> +        /* This vIRQ does not have an LR entry which is either active or
>>> +         * pending and active. Increment EOICount and ignore the write.
>>> +         */
>>> +        int rcpu = gic_get_vcpu_real_id(cpu);
>>> +        s->h_hcr[rcpu] += 1 << R_GICH_HCR_EOICount_SHIFT;
>>> +        return;
>>> +    }
>>
>> It's a bit hard to tell from the amount of context in the diff,
>> but I think this check is being done too late in this function.
>> It needs to happen before we do any operations on the irq we're
>> passed (eg checking which group it is).

> For operations on the IRQ, yes. But there is also the test on the
> EOIMode bit in C_CTLR before that. Writing to C_DIR when EOIMode is 0 is
> unpredictable. I was thinking of keeping the same behaviour we had until
> then, which is to completely ignore the write.

Yes, that's a reasonable choice.

>>> +
>>>      if (gic_cpu_ns_access(s, cpu, attrs) && !group) {
>>>          DPRINTF("Non-secure DI for Group0 interrupt %d ignored\n", irq);
>>>          return;
>>> @@ -604,6 +613,15 @@ static void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
>>>      int group;
>>>
>>>      DPRINTF("EOI %d\n", irq);
>>> +    if (gic_is_vcpu(cpu) && !gic_virq_is_valid(s, irq, cpu)) {
>>> +        /* This vIRQ does not have an LR entry which is either active or
>>> +         * pending and active. Increment EOICount and ignore the write.
>>> +         */
>>> +        int rcpu = gic_get_vcpu_real_id(cpu);
>>> +        s->h_hcr[rcpu] += 1 << R_GICH_HCR_EOICount_SHIFT;
>>> +        return;
>>> +    }
>>
>> This isn't consistent with the deactivate code about whether we
>> do this check before the "irq >= s->num_irq" check or after.
>>
>> I think the correct answer is "before", because the number of
>> physical interrupts in the GIC shouldn't affect the valid
>> range of virtual interrupts.
>>
>> There is also an edge case here: if the VIRQ written to the
>> EOI or DIR registers is a special interrupt number (1020..1023),
>> then should we increment the EOI count or not? The GICv2 spec
>> is not entirely clear on this point, but it does say in the
>> GICH_HCR.EOICount docs that "EOIs that do not clear a bit in
>> the Active Priorities register GICH_APR do not cause an increment",
>> and the GICv3 spec is clear so my recommendation is that for
>> 1020..1023 we should ignore the write and not increment EOICount.
>>
>> That bit about "EOIs that do not clear a bit in GICH_APR do
>> not increment EOICount" also suggests that our logic for DIR
>> and EOI needs to be something like:
>>
>>   if (vcpu) {
>>       if (irq > 1020) {
>>           return;
>>       }
>>       clear GICH_HCR bit;
>>       if (no bit cleared) {
>>           return;
>>       }
>>       if (!gic_virq_is_valid()) {
>>           increment EOICount;
>>           return;
>>       }
>>       clear active bit in LR;
>>   }
>>
>> ?
> I agree for EOIR, but for DIR, it seems weird. A write to DIR never
> causes a bit to be cleared in GICH_APR. It can only change the state of
> the LR corresponding to the given vIRQ. So if we read the specification
> this way, a write to DIR should never cause a EOICount increment.

Yes, I think you're right and I was misreading the spec here,
at least where it regards DIR.

> However the part you quoted:
>
> "EOIs that do not clear a bit in the Active Priorities register GICH_APR
> do not cause an increment"
>
> seems to apply to EOIs only, not to interrupt deactivations.
>
> And in the DIR specification:
> "If the specified Interrupt does not exist in the List registers, the
> GICH_HCR.EOIcount field is incremented"
>
> So I would suggest that we apply your reasoning for EOIR. For DIR, I
> think something like this is sufficient:
>
>    if (vcpu) {
>        if (irq > 1020) {
>            return;
>        }
>        if (!gic_virq_is_valid()) {
>            increment EOICount;
>            return;
>        }
>        clear active bit in LR;
>    }
>
>
> What do you think?

Yes, I think this is right.

thanks
-- PMM
