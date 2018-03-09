Received: by 10.28.91.67 with SMTP id p64csp827216wmb;
        Fri, 9 Mar 2018 06:04:00 -0800 (PST)
X-Google-Smtp-Source: AG47ELv2ASJDoqJ9bJqZKk98Oy20MNM+8JX/hN4MNYeK2jD4infUwbnhOoI/MlsDiqcsVfytcu+9
X-Received: by 2002:a25:9a02:: with SMTP id x2-v6mr18364441ybn.517.1520604240527;
        Fri, 09 Mar 2018 06:04:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520604240; cv=none;
        d=google.com; s=arc-20160816;
        b=Yvs2noc5VGIEW/ymVP+fXGfyYI6/d3UP7rlV9BCshWkPZvdo/Dp21M/OgI+DdPXi42
         LEglv2ayB1ZB4y20Tez8HFQ2RA/4hyteVP/9qnnAb87K3j9u0wty1s9UFPOazNGhfODX
         iux95Y6XpR8SP7yyE7IVj/aDQUVMeXUcoJZDjef2kRYs8hFU27X3kJqRZy0oRpx4+39/
         tocMM1D3+LUrE8xraXYHn3jQkS/M9uvdv3yqF6+nY3uEHMYX9JUmoBNvWSyRmzYoT4J3
         EgeX9jd4yHIioIPKWAfsTvgHHvktbpBF4lTZdWFHnJ124Mgbd/D8vt54+guyZxRbscoM
         vk/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=IQgJyrCluMkPM+D1J5uEehq3sp2hAx1Q/dXTObLWyrw=;
        b=LfvYvLQC2oLZrGVy6s7Ab8QOQ7AQEEx5BmCW7vENIDxFa0STLnwKpIYpXTL85ZkpNy
         NomYKkTdtWOrAhR3YQDK6WbHyg+Q87BfM+2w40xJFsmwXC6pa+CWCSQPKp7jVinWUl5Q
         nMZMc6a1RsvEH7EzIIrwrVnl4BCPjES28YqZYTHU9dS3JDTI6zOV3ghHqCKivxgO6/yJ
         1INdIJcCNl1araZMdaExHrwiUIqxDJjaC4yICEOiiJlDpeSJQ5PIz1CIsEBg/VYXVqoV
         ZDgSiFiHlzyy0UXWOqFcs4TT5sxna2EXi7W7kUL90bX/eZDv33bh/DvIefDUnjDNkOcH
         +f6g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y2-v6si166599ybj.575.2018.03.09.06.04.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Mar 2018 06:04:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45496 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1euIcq-0001jJ-0c
	for alex.bennee@linaro.org; Fri, 09 Mar 2018 09:04:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55049)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1euIci-0001it-KJ
	for qemu-arm@nongnu.org; Fri, 09 Mar 2018 09:03:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1euIcd-0005vw-Fm
	for qemu-arm@nongnu.org; Fri, 09 Mar 2018 09:03:52 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:39048 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1euIcd-0005ve-BF; Fri, 09 Mar 2018 09:03:47 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AC83E4129340;
	Fri,  9 Mar 2018 14:03:42 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD8C52026DFD;
	Fri,  9 Mar 2018 14:03:35 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
	<1518893216-9983-6-git-send-email-eric.auger@redhat.com>
	<CAFEAcA_4ANVq-Rd63R7BOhd2axy7_Jn-BchzAksKR6g7JbjnTA@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <2d530201-d5f3-1b02-17a9-1c2ed9e2d5e2@redhat.com>
Date: Fri, 9 Mar 2018 15:03:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_4ANVq-Rd63R7BOhd2axy7_Jn-BchzAksKR6g7JbjnTA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Fri, 09 Mar 2018 14:03:42 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Fri, 09 Mar 2018 14:03:42 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
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
X-TUID: n5OicxZPjOR1

Hi Peter,

On 08/03/18 18:49, Peter Maydell wrote:
> On 17 February 2018 at 18:46, Eric Auger <eric.auger@redhat.com> wrote:
>> We introduce some helpers to handle wired IRQs and especially
>> GERROR interrupt. SMMU writes GERROR register on GERROR event
>> and SW acks GERROR interrupts by setting GERRORn.
>>
>> The Wired interrupts are edge sensitive hence the pulse usage.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> v7 -> v8:
>> - remove SMMU_PENDING_GERRORS macro
>> - properly toggle gerror
>> - properly sanitize gerrorn write
>> ---
>>  hw/arm/smmuv3-internal.h | 10 ++++++++
>>  hw/arm/smmuv3.c          | 64 ++++++++++++++++++++++++++++++++++++++++++++++++
>>  hw/arm/trace-events      |  3 +++
>>  3 files changed, 77 insertions(+)
>>
>> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
>> index 5be8303..40b39a1 100644
>> --- a/hw/arm/smmuv3-internal.h
>> +++ b/hw/arm/smmuv3-internal.h
>> @@ -152,4 +152,14 @@ static inline uint64_t smmu_read64(uint64_t r, unsigned offset,
>>      return extract64(r, offset << 3, 32);
>>  }
>>
>> +/* Interrupts */
>> +
>> +#define smmuv3_eventq_irq_enabled(s)                   \
>> +    (FIELD_EX32(s->irq_ctrl, IRQ_CTRL, EVENTQ_IRQEN))
>> +#define smmuv3_gerror_irq_enabled(s)                  \
>> +    (FIELD_EX32(s->irq_ctrl, IRQ_CTRL, GERROR_IRQEN))
> 
> These are only ever used in smmuv3.c, so you can just move them
> to there (and make them inline functions, ideally).
smmuv3-internal.h contains helpers, macros which are only used by
smmuv3.c . I though this could avoid putting too much code in smmuv3.c
and would help in the readability.

what is the exact benefit of transforming those into inline functions
instead of macros. Not meaning I don't want to take this into account
but to improve my coding style ;-)
> 
>> +
>> +void smmuv3_trigger_irq(SMMUv3State *s, SMMUIrq irq, uint32_t gerror_mask);
>> +void smmuv3_write_gerrorn(SMMUv3State *s, uint32_t gerrorn);
> 
> I guess these are global to avoid the compiler complaining about
> unused static functions at this point? If so, add a comment
> saying so, and flip them back to being static functions when
> their callers get added. (Or just add the callers here, if they're
> not too complicated.)

Yes they becomes static in "hw/arm/smmuv3: Implement MMIO write
operations". Added a comment
> 
>> +
>>  #endif
>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>> index dc03c9e..8779d3f 100644
>> --- a/hw/arm/smmuv3.c
>> +++ b/hw/arm/smmuv3.c
>> @@ -30,6 +30,70 @@
>>  #include "hw/arm/smmuv3.h"
>>  #include "smmuv3-internal.h"
>>
>> +/**
>> + * smmuv3_trigger_irq - pulse @irq if enabled and update
>> + * GERROR register in case of GERROR interrupt
>> + *
>> + * @irq: irq type
>> + * @gerror_mask: mask of gerrors to toggle (relevant if @irq is GERROR)
>> + */
>> +void smmuv3_trigger_irq(SMMUv3State *s, SMMUIrq irq, uint32_t gerror_mask)
>> +{
>> +
>> +    bool pulse = false;
>> +
>> +    switch (irq) {
>> +    case SMMU_IRQ_EVTQ:
>> +        pulse = smmuv3_eventq_irq_enabled(s);
>> +        break;
>> +    case SMMU_IRQ_PRIQ:
>> +        error_setg(&error_fatal, "PRI not supported");
> 
> This should either assert() if it would be a bug in the rest
> of the smmu code, or LOG_UNIMP if the guest can trigger it.
replaced by LOG_UNIMP
> 
>> +        break;
>> +    case SMMU_IRQ_CMD_SYNC:
>> +        pulse = true;
>> +        break;
>> +    case SMMU_IRQ_GERROR:
>> +    {
>> +        uint32_t pending = s->gerror ^ s->gerrorn;
>> +        uint32_t new_gerrors = ~pending & gerror_mask;
>> +
>> +        if (!new_gerrors) {
>> +            /* only toggle non pending errors */
>> +            return;
>> +        }
>> +        s->gerror ^= new_gerrors;
>> +        trace_smmuv3_write_gerror(new_gerrors, s->gerror);
>> +
>> +        /* pulse the GERROR irq only if all previous gerrors were acked */
> 
> It's not entirely clear to me that this is correct; should
> we generate only one pulse if the implementation raises error A,
> and then later raises error B before software acknowledges A ?
> There's some language in 3.18 about the SMMU implementation
> being able to coalesce events and identical interrupts, but
> I think that would mean that we could skip raising the first
> pulse for error A if error B arrived sufficiently quickly after it.
> (Not something we're going to care about for a s/w model.)
I don't implement event merging atm.
> 
> I think the right behaviour is probably that we should pulse
> the interrupt if there are any new gerrors, which is to
> say to drop this !pending test:
I agree with your interpretation.


> 
>> +        pulse = smmuv3_gerror_irq_enabled(s) && !pending;
>> +        break;
>> +    }
>> +    }
>> +    if (pulse) {
>> +            trace_smmuv3_trigger_irq(irq);
>> +            qemu_irq_pulse(s->irq[irq]);
>> +    }
>> +}
>> +
>> +void smmuv3_write_gerrorn(SMMUv3State *s, uint32_t new_gerrorn)
>> +{
>> +    uint32_t pending = s->gerror ^ s->gerrorn;
>> +    uint32_t toggled = s->gerrorn ^ new_gerrorn;
>> +    uint32_t acked;
>> +
>> +    if (toggled & ~pending) {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "guest toggles non pending errors = 0x%x\n",
>> +                      toggled & ~pending);
>> +    }
>> +
>> +    /* Make sure SW does not toggle irqs that are not active */
>> +    acked = toggled & pending;
>> +    s->gerrorn ^= acked;
>> +
> 
> I don't think this behaviour is correct. From the hardware's
> perspective, we should just take the value the user writes
> to SMMU_GERRORN and put it in the register (and update the
> status of the irq accordingly).

OK
> 
> It is CONSTRAINED UNPREDICTABLE whether we actually raise an
> interrupt if the guest toggles a field that corresponds to an
> inactive error, so we should just do whatever is easiest.
OK: nothing except reporting a LOG_GUEST_ERROR ;-)

Thanks

Eric
> 
>> +    trace_smmuv3_write_gerrorn(acked, s->gerrorn);
>> +}
>> +
>>  static void smmuv3_init_regs(SMMUv3State *s)
>>  {
>>      /**
>> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
>> index 64d2b9b..2ddae40 100644
>> --- a/hw/arm/trace-events
>> +++ b/hw/arm/trace-events
>> @@ -15,3 +15,6 @@ smmu_get_pte(uint64_t baseaddr, int index, uint64_t pteaddr, uint64_t pte) "base
>>
>>  #hw/arm/smmuv3.c
>>  smmuv3_read_mmio(hwaddr addr, uint64_t val, unsigned size) "addr: 0x%"PRIx64" val:0x%"PRIx64" size: 0x%x"
>> +smmuv3_trigger_irq(int irq) "irq=%d"
>> +smmuv3_write_gerror(uint32_t toggled, uint32_t gerror) "toggled=0x%x, new gerror=0x%x"
>> +smmuv3_write_gerrorn(uint32_t acked, uint32_t gerrorn) "acked=0x%x, new gerrorn=0x%x"
> 
> Capitalizing names of registers like GERROR in trace messages would
> make them match the convention in the SMMUv3 spec.
done

Thanks

Eric
> 
>> --
>> 2.5.5
>>
> 
> thanks
> -- PMM
> 
