Received: by 10.28.91.67 with SMTP id p64csp1043895wmb;
        Fri, 9 Mar 2018 09:30:33 -0800 (PST)
X-Google-Smtp-Source: AG47ELsV+K4ULbD3ISERa7Hp4xuBL3XftUFzqRz5abtcFW4xxB/tq/MOeIF40T+UWR7QtGolV6vJ
X-Received: by 10.129.65.71 with SMTP id f7mr20450994ywk.208.1520616632944;
        Fri, 09 Mar 2018 09:30:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520616632; cv=none;
        d=google.com; s=arc-20160816;
        b=VaFSpi9UqRj+MWXf0IuMr/V6+NgBxAP7GW1yE06uDFmZt65FPcIts2MYHCvPCHDfKX
         6oQ4In8RClYt9YkpYhPYlqMTqpt6GgPF8Z1FfZDiq1j+IA6iaIyboEXl/Vf3isy0jc8G
         YykP7BeHrY9ZOnRzDwCZCXiAWlcP5IiiQf4Jt4pz+ICWao2IjDThTD06us7SpFfN0khx
         KGLNUaSUiDuIceZgfEpC+jsxRDi/01iF0AymhMQhka5nkedB9ZMK1mmakZ1PJd6t4X5d
         jJLOcHiGK1b/VYCFt7NcugfVY6DUWsU9zTCnty8sA47r6vkG3A+Or+YV5x/QtpaHnRwk
         x24w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=Spa7FD3tVSQtu5TjqR/pjCcYyFRgCYnEyy3XbP+Delg=;
        b=mPY8rPv5IOQWZCx7iap1ZR3/oO6aP3y5BUuwxM2ESVI9uZX3spVC232sLlRWQC1h/A
         eCoy9qL8YljT1RL8KQng73J83ndGQzx5K/oDbIqCz923xmMKi9qyv1I1KOVzfU94U1os
         Qii7pj8QWzp3R+qo9i46PL5tocPu+nvDkZ3qLktwLHavEbFfm621Pg7s8LVLaxCryR9X
         GqjbPIFfXawZTVxTl5MSH4KJkGodneAJxPNYQ5L6+kmKzcJJY2a+LoeuP/rm2Fu4EkYy
         4f9/Snp53gAffooXsEm5wDalCb55NdLT1FYHDkCBzlurlCwpRxjbXxbFFmu/UKSjhESC
         ybaw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v1-v6si249333ybc.705.2018.03.09.09.30.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Mar 2018 09:30:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46815 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1euLqh-0003WW-Ib
	for alex.bennee@linaro.org; Fri, 09 Mar 2018 12:30:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39687)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1euL6p-0004C8-N9
	for qemu-arm@nongnu.org; Fri, 09 Mar 2018 11:43:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1euL6k-0001YR-R5
	for qemu-arm@nongnu.org; Fri, 09 Mar 2018 11:43:07 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:45438 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1euL6k-0001Y4-Kz; Fri, 09 Mar 2018 11:43:02 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1945F813F699;
	Fri,  9 Mar 2018 16:43:02 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47CE1215CDAA;
	Fri,  9 Mar 2018 16:42:59 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
	<1518893216-9983-8-git-send-email-eric.auger@redhat.com>
	<CAFEAcA9d30THtJPihHAm1dRRLr8a2kg2UqMmxJv-p1Zvjj2PgA@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <26abf1b6-5748-1aa7-7fc2-cdfd18bad7f0@redhat.com>
Date: Fri, 9 Mar 2018 17:42:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9d30THtJPihHAm1dRRLr8a2kg2UqMmxJv-p1Zvjj2PgA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Fri, 09 Mar 2018 16:43:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Fri, 09 Mar 2018 16:43:02 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v9 07/14] hw/arm/smmuv3: Implement MMIO write
 operations
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
X-TUID: A1Zpa6eEc5ER

Hi Peter,

On 08/03/18 19:37, Peter Maydell wrote:
> On 17 February 2018 at 18:46, Eric Auger <eric.auger@redhat.com> wrote:
>> Now we have relevant helpers for queue and irq
>> management, let's implement MMIO write operations.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> v7 -> v8:
>> - precise in the commit message invalidation commands
>>   are not yet treated.
>> - use new queue helpers
>> - do not decode unhandled commands at this stage
>> ---
>>  hw/arm/smmuv3-internal.h |  24 +++++++---
>>  hw/arm/smmuv3.c          | 111 +++++++++++++++++++++++++++++++++++++++++++++--
>>  hw/arm/trace-events      |   6 +++
>>  3 files changed, 132 insertions(+), 9 deletions(-)
>>
>> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
>> index c0771ce..5af97ae 100644
>> --- a/hw/arm/smmuv3-internal.h
>> +++ b/hw/arm/smmuv3-internal.h
>> @@ -152,6 +152,25 @@ static inline uint64_t smmu_read64(uint64_t r, unsigned offset,
>>      return extract64(r, offset << 3, 32);
>>  }
>>
>> +static inline void smmu_write64(uint64_t *r, unsigned offset,
>> +                                unsigned size, uint64_t value)
>> +{
>> +    if (size == 8 && !offset) {
>> +        *r  = value;
>> +    }
>> +
>> +    /* 32 bit access */
>> +
>> +    if (offset && offset != 4)  {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "SMMUv3 MMIO write: bad offset/size %u/%u\n",
>> +                      offset, size);
>> +        return ;
>> +    }
>> +
>> +    *r = deposit64(*r, offset << 3, 32, value);
> 
> Similar remarks apply to this helper as to smmu_read64 in the earlier patch.
removed
> 
>> +}
>> +
>>  /* Interrupts */
>>
>>  #define smmuv3_eventq_irq_enabled(s)                   \
>> @@ -159,9 +178,6 @@ static inline uint64_t smmu_read64(uint64_t r, unsigned offset,
>>  #define smmuv3_gerror_irq_enabled(s)                  \
>>      (FIELD_EX32(s->irq_ctrl, IRQ_CTRL, GERROR_IRQEN))
>>
>> -void smmuv3_trigger_irq(SMMUv3State *s, SMMUIrq irq, uint32_t gerror_mask);
>> -void smmuv3_write_gerrorn(SMMUv3State *s, uint32_t gerrorn);
>> -
>>  /* Queue Handling */
>>
>>  #define LOG2SIZE(q)        extract64((q)->base, 0, 5)
>> @@ -310,6 +326,4 @@ enum { /* Command completion notification */
>>              addr;                                             \
>>          })
>>
>> -int smmuv3_cmdq_consume(SMMUv3State *s);
>> -
>>  #endif
>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>> index 0b57215..fcfdbb0 100644
>> --- a/hw/arm/smmuv3.c
>> +++ b/hw/arm/smmuv3.c
>> @@ -37,7 +37,8 @@
>>   * @irq: irq type
>>   * @gerror_mask: mask of gerrors to toggle (relevant if @irq is GERROR)
>>   */
>> -void smmuv3_trigger_irq(SMMUv3State *s, SMMUIrq irq, uint32_t gerror_mask)
>> +static void smmuv3_trigger_irq(SMMUv3State *s, SMMUIrq irq,
>> +                               uint32_t gerror_mask)
>>  {
>>
>>      bool pulse = false;
>> @@ -75,7 +76,7 @@ void smmuv3_trigger_irq(SMMUv3State *s, SMMUIrq irq, uint32_t gerror_mask)
>>      }
>>  }
>>
>> -void smmuv3_write_gerrorn(SMMUv3State *s, uint32_t new_gerrorn)
>> +static void smmuv3_write_gerrorn(SMMUv3State *s, uint32_t new_gerrorn)
>>  {
>>      uint32_t pending = s->gerror ^ s->gerrorn;
>>      uint32_t toggled = s->gerrorn ^ new_gerrorn;
>> @@ -199,7 +200,7 @@ static void smmuv3_init_regs(SMMUv3State *s)
>>      s->sid_split = 0;
>>  }
>>
>> -int smmuv3_cmdq_consume(SMMUv3State *s)
>> +static int smmuv3_cmdq_consume(SMMUv3State *s)
>>  {
>>      SMMUCmdError cmd_error = SMMU_CERROR_NONE;
>>      SMMUQueue *q = &s->cmdq;
>> @@ -298,7 +299,109 @@ int smmuv3_cmdq_consume(SMMUv3State *s)
>>  static void smmu_write_mmio(void *opaque, hwaddr addr,
>>                              uint64_t val, unsigned size)
>>  {
>> -    /* not yet implemented */
>> +    SMMUState *sys = opaque;
>> +    SMMUv3State *s = ARM_SMMUV3(sys);
>> +
>> +    /* CONSTRAINED UNPREDICTABLE choice to have page0/1 be exact aliases */
>> +    addr &= ~0x10000;
>> +
>> +    if (size != 4 && size != 8) {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "SMMUv3 MMIO write: bad size %u\n", size);
>> +    }
> 
> As with read, this can never happen so you don't need to check for it.
> 
> As with read, probably better to explicitly whitelist the 64-bit
> accessible offsets, and LOG_GUEST_ERROR and write-ignore the others.
done
> 
>> +
>> +    trace_smmuv3_write_mmio(addr, val, size);
>> +
>> +    switch (addr) {
>> +    case A_CR0:
>> +        s->cr[0] = val;
>> +        s->cr0ack = val;
> 
> Spec says "reserved fields in SMMU_CR0 are not reflected in SMMU_CR0ACK",
> so you probably need to mask those out.
OK
> 
>> +        /* in case the command queue has been enabled */
>> +        smmuv3_cmdq_consume(s);
>> +        return;
>> +    case A_CR1:
>> +        s->cr[1] = val;
>> +        return;
>> +    case A_CR2:
>> +        s->cr[2] = val;
>> +        return;
>> +    case A_IRQ_CTRL:
>> +        s->irq_ctrl = val;
>> +        return;
>> +    case A_GERRORN:
>> +        smmuv3_write_gerrorn(s, val);
>> +        /*
>> +         * By acknowledging the CMDQ_ERR, SW may notify cmds can
>> +         * be processed again
>> +         */
>> +        smmuv3_cmdq_consume(s);
>> +        return;
>> +    case A_GERROR_IRQ_CFG0: /* 64b */
>> +        smmu_write64(&s->gerror_irq_cfg0, 0, size, val);
>> +        return;
>> +    case A_GERROR_IRQ_CFG0 + 4:
>> +        smmu_write64(&s->gerror_irq_cfg0, 4, size, val);
>> +        return;
>> +    case A_GERROR_IRQ_CFG1:
>> +        s->gerror_irq_cfg1 = val;
>> +        return;
>> +    case A_GERROR_IRQ_CFG2:
>> +        s->gerror_irq_cfg2 = val;
>> +        return;
>> +    case A_STRTAB_BASE: /* 64b */
>> +        smmu_write64(&s->strtab_base, 0, size, val);
>> +        return;
>> +    case A_STRTAB_BASE + 4:
>> +        smmu_write64(&s->strtab_base, 4, size, val);
>> +        return;
>> +    case A_STRTAB_BASE_CFG:
>> +        s->strtab_base_cfg = val;
>> +        if (FIELD_EX32(val, STRTAB_BASE_CFG, FMT) == 1) {
>> +            s->sid_split = FIELD_EX32(val, STRTAB_BASE_CFG, SPLIT);
>> +            s->features |= SMMU_FEATURE_2LVL_STE;
>> +        }
>> +        return;
>> +    case A_CMDQ_BASE: /* 64b */
>> +        smmu_write64(&s->cmdq.base, 0, size, val);
>> +        return;
>> +    case A_CMDQ_BASE + 4: /* 64b */
>> +        smmu_write64(&s->cmdq.base, 4, size, val);
>> +        return;
>> +    case A_CMDQ_PROD:
>> +        s->cmdq.prod = val;
>> +        smmuv3_cmdq_consume(s);
>> +        return;
>> +    case A_CMDQ_CONS:
>> +        s->cmdq.cons = val;
>> +        return;
>> +    case A_EVENTQ_BASE: /* 64b */
>> +        smmu_write64(&s->eventq.base, 0, size, val);
>> +        return;
>> +    case A_EVENTQ_BASE + 4:
>> +        smmu_write64(&s->eventq.base, 4, size, val);
>> +        return;
>> +    case A_EVENTQ_PROD:
>> +        s->eventq.prod = val;
>> +        return;
>> +    case A_EVENTQ_CONS:
>> +        s->eventq.cons = val;
>> +        return;
>> +    case A_EVENTQ_IRQ_CFG0: /* 64b */
>> +        s->eventq.prod = val;
>> +        smmu_write64(&s->eventq_irq_cfg0, 0, size, val);
>> +        return;
>> +    case A_EVENTQ_IRQ_CFG0 + 4:
>> +        smmu_write64(&s->eventq_irq_cfg0, 4, size, val);
>> +        return;
>> +    case A_EVENTQ_IRQ_CFG1:
>> +        s->eventq_irq_cfg1 = val;
>> +        return;
>> +    case A_EVENTQ_IRQ_CFG2:
>> +        s->eventq_irq_cfg2 = val;
>> +        return;
>> +    default:
>> +        error_report("%s unhandled access at 0x%"PRIx64, __func__, addr);
> 
> Tracepoint or LOG_GUEST_ERROR, not error_report(), please.
OK

Thanks

Eric
> 
>> +    }
>>  }
>>
>>  static uint64_t smmu_read_mmio(void *opaque, hwaddr addr, unsigned size)
>> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
>> index 1c5105d..ed5dce0 100644
>> --- a/hw/arm/trace-events
>> +++ b/hw/arm/trace-events
>> @@ -22,3 +22,9 @@ smmuv3_unhandled_cmd(uint32_t type) "Unhandled command type=%d"
>>  smmuv3_cmdq_consume(uint32_t prod, uint32_t cons, uint8_t prod_wrap, uint8_t cons_wrap) "prod=%d cons=%d prod.wrap=%d cons.wrap=%d"
>>  smmuv3_cmdq_opcode(const char *opcode) "<--- %s"
>>  smmuv3_cmdq_consume_out(uint32_t prod, uint32_t cons, uint8_t prod_wrap, uint8_t cons_wrap) "prod:%d, cons:%d, prod_wrap:%d, cons_wrap:%d "
>> +smmuv3_update(bool is_empty, uint32_t prod, uint32_t cons, uint8_t prod_wrap, uint8_t cons_wrap) "q empty:%d prod:%d cons:%d p.wrap:%d p.cons:%d"
>> +smmuv3_update_check_cmd(int error) "cmdq not enabled or error :0x%x"
>> +smmuv3_write_mmio(hwaddr addr, uint64_t val, unsigned size) "addr: 0x%"PRIx64" val:0x%"PRIx64" size: 0x%x"
>> +smmuv3_write_mmio_idr(hwaddr addr, uint64_t val) "write to RO/Unimpl reg 0x%lx val64:0x%lx"
>> +smmuv3_write_mmio_evtq_cons_bef_clear(uint32_t prod, uint32_t cons, uint8_t prod_wrap, uint8_t cons_wrap) "Before clearing interrupt prod:0x%x cons:0x%x prod.w:%d cons.w:%d"
>> +smmuv3_write_mmio_evtq_cons_after_clear(uint32_t prod, uint32_t cons, uint8_t prod_wrap, uint8_t cons_wrap) "after clearing interrupt prod:0x%x cons:0x%x prod.w:%d cons.w:%d"
> 
> 
> thanks
> -- PMM
> 
