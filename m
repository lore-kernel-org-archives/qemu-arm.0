Received: by 10.28.91.67 with SMTP id p64csp1502433wmb;
        Thu, 8 Mar 2018 09:50:15 -0800 (PST)
X-Google-Smtp-Source: AG47ELt54qHtNKQdhuneb6COuLzAUmzn++kQTXLwrh19I9avqJoybQ+b3yG1haZpM3GjoVcSMRw3
X-Received: by 2002:a25:1d7:: with SMTP id 206-v6mr5680474ybb.347.1520531414917;
        Thu, 08 Mar 2018 09:50:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520531414; cv=none;
        d=google.com; s=arc-20160816;
        b=NBv2fZLmTCr4lDlPhOPAzn1LM+ecHcD/TMP5bQ55HmYfqCvmuh8s1vhKiqTp9vxxT9
         OFGelDiV4ZoGrT66LOM1sqm/w3pCmlJHcJE9zFTWqX/gI2fEnj0SznHZxPGq7shE5+Na
         jm8dhBwjpDTmrrDgw1nYOW8j2ey5BuvnUK/6kOHLwEMlnIJ91PtHtLJgI6NlKJbQE9e0
         cjW84nfbHmehpsUsUJD6O1Hin1E+779pBJyL/7BwLiS89QWiagX5kH8VDFC31ofDQu71
         8tUdELtb4GPrRsadQnbvAKpdX+eDgbOedlhW7Ghe7bV1lOpCJ5tFrk/ekR/yTNiyntlr
         WOng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=0M8U+IKc7V+vyVfApKwuYt6uF76efeJCaxWUC5x/MH0=;
        b=Nf/SIBs1ccDBcu8J/OaRBHNf3GM55sXYlwzZYdgJkCFT006/c/x8B8m90caZrLMFl0
         W0KJ3rGNTL6FcUvnOuhp19oCoCPLh1BukF8dUV97pml4ZlgZ0vjOfA+vWiOjPLaD05LY
         m0KCIbJDEsj1Zbz6KtKUptkleJqmxgbOiG0DgmjHwjgeDtEbxUJIWkG15QPx6axCJKx4
         vTJPZE40dZQAoa+0aue/0S7IkyZyfTueqxfRyMsN0k9j8ZpvQGBBCm9w4b4Hh1HppYwS
         q1s9Dia2TfoEp3JOBGk0k6y8dFTwDEK0zZ44CYYeZbhhYTz3D4Y2MM3nc0ij0UNbX2ua
         om7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LmeHGz61;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u189si3507564ywb.349.2018.03.08.09.50.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Mar 2018 09:50:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LmeHGz61;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40583 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1etzgE-00075n-8b
	for alex.bennee@linaro.org; Thu, 08 Mar 2018 12:50:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35087)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1etzfy-00072K-7j
	for qemu-arm@nongnu.org; Thu, 08 Mar 2018 12:50:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1etzfx-00053V-1O
	for qemu-arm@nongnu.org; Thu, 08 Mar 2018 12:49:58 -0500
Received: from mail-ot0-x231.google.com ([2607:f8b0:4003:c0f::231]:37211)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1etzfw-00052x-PX
	for qemu-arm@nongnu.org; Thu, 08 Mar 2018 12:49:56 -0500
Received: by mail-ot0-x231.google.com with SMTP id t2so6203671otj.4
	for <qemu-arm@nongnu.org>; Thu, 08 Mar 2018 09:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0M8U+IKc7V+vyVfApKwuYt6uF76efeJCaxWUC5x/MH0=;
	b=LmeHGz61NNtz7MSxs/y3Pdl+tXnf+oACkIPDAekVbhVGqE95gaXaGWXzgWiZdvJPeB
	1U8dQ6wi8h3QJn201nJPGnfL9Wix6HB7yYEGUYdMP9aGJ5u1/wrx74oPCQTRbOBH8l5Q
	IAj1ApJb+F08eCLGarOMGnBqAUOuG7uDurjpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0M8U+IKc7V+vyVfApKwuYt6uF76efeJCaxWUC5x/MH0=;
	b=uWiRQ1hjrCvunCnY0ge8Bz5l6U4i3gEezghEdRFOGqeag7Akk/LDR3lNun4dZiLIvy
	jFkFvco/inyZwHXS+FdG9UqVM5Gh21w7ALSWaISys7boYbjVGVHHDz79UmuugpXTpuSq
	2E4DvpAimWIxMZHUB2MYFQUJ6n0l2qeaFxTIMttosH1Z0AKjDTyJqhkPIXY4X3wihvAL
	RUAqgIrqTuKnJ4FPvYIoiB2Ia8FmSlW/I8gfZCt8xlds3oYXMZUvB2Gdf1r4yY4lcgs9
	Bfk6hrAT+OAmfKUqDySFb0Jtl/BjoF8VbBrO3bRedXq+Aa364eyCmO07qwvHxRhnEKYR
	H3qA==
X-Gm-Message-State: APf1xPANwUYTMknVkuvxUXu+RCu4UUgujE89GmShNjAgYa0oBLMbQFQi
	fE0pvrrOaEPhmMhoF9MfTa04SstO6c4nd88mPd0m/A==
X-Received: by 10.157.72.231 with SMTP id a36mr19640815otj.308.1520531395758; 
	Thu, 08 Mar 2018 09:49:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Thu, 8 Mar 2018 09:49:35 -0800 (PST)
In-Reply-To: <1518893216-9983-6-git-send-email-eric.auger@redhat.com>
References: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
	<1518893216-9983-6-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Mar 2018 17:49:35 +0000
Message-ID: <CAFEAcA_4ANVq-Rd63R7BOhd2axy7_Jn-BchzAksKR6g7JbjnTA@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::231
Subject: Re: [Qemu-arm] [PATCH v9 05/14] hw/arm/smmuv3: Wired IRQ and GERROR
 helpers
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Tomasz Nowicki <tn@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	linuc.decode@gmail.com, Bharat Bhushan <bharat.bhushan@nxp.com>,
	Prem Mallappa <prem.mallappa@gmail.com>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Mh6MWaVju3O2

On 17 February 2018 at 18:46, Eric Auger <eric.auger@redhat.com> wrote:
> We introduce some helpers to handle wired IRQs and especially
> GERROR interrupt. SMMU writes GERROR register on GERROR event
> and SW acks GERROR interrupts by setting GERRORn.
>
> The Wired interrupts are edge sensitive hence the pulse usage.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
>
> v7 -> v8:
> - remove SMMU_PENDING_GERRORS macro
> - properly toggle gerror
> - properly sanitize gerrorn write
> ---
>  hw/arm/smmuv3-internal.h | 10 ++++++++
>  hw/arm/smmuv3.c          | 64 ++++++++++++++++++++++++++++++++++++++++++++++++
>  hw/arm/trace-events      |  3 +++
>  3 files changed, 77 insertions(+)
>
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index 5be8303..40b39a1 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -152,4 +152,14 @@ static inline uint64_t smmu_read64(uint64_t r, unsigned offset,
>      return extract64(r, offset << 3, 32);
>  }
>
> +/* Interrupts */
> +
> +#define smmuv3_eventq_irq_enabled(s)                   \
> +    (FIELD_EX32(s->irq_ctrl, IRQ_CTRL, EVENTQ_IRQEN))
> +#define smmuv3_gerror_irq_enabled(s)                  \
> +    (FIELD_EX32(s->irq_ctrl, IRQ_CTRL, GERROR_IRQEN))

These are only ever used in smmuv3.c, so you can just move them
to there (and make them inline functions, ideally).

> +
> +void smmuv3_trigger_irq(SMMUv3State *s, SMMUIrq irq, uint32_t gerror_mask);
> +void smmuv3_write_gerrorn(SMMUv3State *s, uint32_t gerrorn);

I guess these are global to avoid the compiler complaining about
unused static functions at this point? If so, add a comment
saying so, and flip them back to being static functions when
their callers get added. (Or just add the callers here, if they're
not too complicated.)

> +
>  #endif
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index dc03c9e..8779d3f 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -30,6 +30,70 @@
>  #include "hw/arm/smmuv3.h"
>  #include "smmuv3-internal.h"
>
> +/**
> + * smmuv3_trigger_irq - pulse @irq if enabled and update
> + * GERROR register in case of GERROR interrupt
> + *
> + * @irq: irq type
> + * @gerror_mask: mask of gerrors to toggle (relevant if @irq is GERROR)
> + */
> +void smmuv3_trigger_irq(SMMUv3State *s, SMMUIrq irq, uint32_t gerror_mask)
> +{
> +
> +    bool pulse = false;
> +
> +    switch (irq) {
> +    case SMMU_IRQ_EVTQ:
> +        pulse = smmuv3_eventq_irq_enabled(s);
> +        break;
> +    case SMMU_IRQ_PRIQ:
> +        error_setg(&error_fatal, "PRI not supported");

This should either assert() if it would be a bug in the rest
of the smmu code, or LOG_UNIMP if the guest can trigger it.

> +        break;
> +    case SMMU_IRQ_CMD_SYNC:
> +        pulse = true;
> +        break;
> +    case SMMU_IRQ_GERROR:
> +    {
> +        uint32_t pending = s->gerror ^ s->gerrorn;
> +        uint32_t new_gerrors = ~pending & gerror_mask;
> +
> +        if (!new_gerrors) {
> +            /* only toggle non pending errors */
> +            return;
> +        }
> +        s->gerror ^= new_gerrors;
> +        trace_smmuv3_write_gerror(new_gerrors, s->gerror);
> +
> +        /* pulse the GERROR irq only if all previous gerrors were acked */

It's not entirely clear to me that this is correct; should
we generate only one pulse if the implementation raises error A,
and then later raises error B before software acknowledges A ?
There's some language in 3.18 about the SMMU implementation
being able to coalesce events and identical interrupts, but
I think that would mean that we could skip raising the first
pulse for error A if error B arrived sufficiently quickly after it.
(Not something we're going to care about for a s/w model.)

I think the right behaviour is probably that we should pulse
the interrupt if there are any new gerrors, which is to
say to drop this !pending test:

> +        pulse = smmuv3_gerror_irq_enabled(s) && !pending;
> +        break;
> +    }
> +    }
> +    if (pulse) {
> +            trace_smmuv3_trigger_irq(irq);
> +            qemu_irq_pulse(s->irq[irq]);
> +    }
> +}
> +
> +void smmuv3_write_gerrorn(SMMUv3State *s, uint32_t new_gerrorn)
> +{
> +    uint32_t pending = s->gerror ^ s->gerrorn;
> +    uint32_t toggled = s->gerrorn ^ new_gerrorn;
> +    uint32_t acked;
> +
> +    if (toggled & ~pending) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "guest toggles non pending errors = 0x%x\n",
> +                      toggled & ~pending);
> +    }
> +
> +    /* Make sure SW does not toggle irqs that are not active */
> +    acked = toggled & pending;
> +    s->gerrorn ^= acked;
> +

I don't think this behaviour is correct. From the hardware's
perspective, we should just take the value the user writes
to SMMU_GERRORN and put it in the register (and update the
status of the irq accordingly).

It is CONSTRAINED UNPREDICTABLE whether we actually raise an
interrupt if the guest toggles a field that corresponds to an
inactive error, so we should just do whatever is easiest.

> +    trace_smmuv3_write_gerrorn(acked, s->gerrorn);
> +}
> +
>  static void smmuv3_init_regs(SMMUv3State *s)
>  {
>      /**
> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> index 64d2b9b..2ddae40 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -15,3 +15,6 @@ smmu_get_pte(uint64_t baseaddr, int index, uint64_t pteaddr, uint64_t pte) "base
>
>  #hw/arm/smmuv3.c
>  smmuv3_read_mmio(hwaddr addr, uint64_t val, unsigned size) "addr: 0x%"PRIx64" val:0x%"PRIx64" size: 0x%x"
> +smmuv3_trigger_irq(int irq) "irq=%d"
> +smmuv3_write_gerror(uint32_t toggled, uint32_t gerror) "toggled=0x%x, new gerror=0x%x"
> +smmuv3_write_gerrorn(uint32_t acked, uint32_t gerrorn) "acked=0x%x, new gerrorn=0x%x"

Capitalizing names of registers like GERROR in trace messages would
make them match the convention in the SMMUv3 spec.

> --
> 2.5.5
>

thanks
-- PMM
