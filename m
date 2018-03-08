Received: by 10.28.91.67 with SMTP id p64csp1553811wmb;
        Thu, 8 Mar 2018 10:38:02 -0800 (PST)
X-Google-Smtp-Source: AG47ELtXlZVo6rvm8j8xNFkmB7AIeGTE4Rr24RKIpuRm6sPC7qxO7vyxP9LMcAFaB7eya+PI6Og3
X-Received: by 10.129.157.86 with SMTP id u83mr18003842ywg.118.1520534282044;
        Thu, 08 Mar 2018 10:38:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520534282; cv=none;
        d=google.com; s=arc-20160816;
        b=PJtNwWtW9IqwqfB13S3OoWMl2JL3KCgyRCbMymWISmU7wOnTzaDaKyjGy995CS5C05
         2NVMqDdZ4FTVkKGrsTqLOVxBZhEXWnh4UUeNoN9mAGHzrYFOTCYtedIXsPQ6w5jAjWHW
         XUrQH0oYx3Rw5+wdkyfv1lTOeug8c5+QynJW1WrIS7lffNwQpeBABWRU32LnGCaOJ29l
         1EdjENXN3CScE6JDwAtZSwRvqC+X18aoNP1x5JMbsQ948Y9/YiPupqKlUMYE8/hs9H+e
         Z9g516oGk4pWKMOUcKVlseQS2cqWEEq+jKIUv2dgp31c6c7zUl0ymTykmgPlpiAcU7rm
         Jj9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=/0axNlab5RAcppC953TaxNdWjPxRoD0LkPJGmtZfWDM=;
        b=OKI91Nx8tBbZ7sY7EoWKX3Uk1mOCH40vX8anY5aco5j55dc+DNd61VGFojUD8/hbGU
         CNXAiXeLxMBZwiHXv/vek96gaRnmbZQXy6VPin69dVxu2Qgq24M0mchSQNRxE8fnyC/9
         h5Rv7RF+MdpQX7R53l9hsWs17SByi2ReIDVZZEfdOF8YeORyVsAqxlHqKZMk7xh0Ch+U
         YMn5TtqRqTz1/r86K33FjLTN/X85S4Bgb5PuFRPh33bwBa0Rhhtppd7pGXVhwMn+AW4H
         SgeRYeQcHfrU9LyDl0GkN+w+2eMYs1xRmEYKBGCAeXGA1QNnr81XWftfM1tXWtfypHV0
         BKuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jsjlrXVb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x33si3569099ywj.576.2018.03.08.10.38.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Mar 2018 10:38:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jsjlrXVb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40898 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eu0QT-0000zB-GP
	for alex.bennee@linaro.org; Thu, 08 Mar 2018 13:38:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50468)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eu0QK-0000yX-8Y
	for qemu-arm@nongnu.org; Thu, 08 Mar 2018 13:37:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eu0QI-0006bZ-MQ
	for qemu-arm@nongnu.org; Thu, 08 Mar 2018 13:37:52 -0500
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:37964)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eu0QI-0006bG-Fd
	for qemu-arm@nongnu.org; Thu, 08 Mar 2018 13:37:50 -0500
Received: by mail-ot0-x241.google.com with SMTP id 95so6347991ote.5
	for <qemu-arm@nongnu.org>; Thu, 08 Mar 2018 10:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/0axNlab5RAcppC953TaxNdWjPxRoD0LkPJGmtZfWDM=;
	b=jsjlrXVbNm/2/UAArLDuhOpo+Xn92LNmSM97TmhMuNmYyr0+w2qDqscmeXBM+8SuWy
	1zN6d4Bcv0aM2yek2Tz5GWVEVzADWyIWJk4xrHaP6dPJ+fMwGruRoL9gAH4DeCvP1Y+j
	wv724Qxpv0bF8vgdD4fv6ubOQryVunRtchd2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/0axNlab5RAcppC953TaxNdWjPxRoD0LkPJGmtZfWDM=;
	b=Mm79uyzCIcG8+3q8zrBQJqIWiL79zAIxE9z6uuiLUvKDTFK/zqxm53NsUOPNFWAwb+
	tMbYUJx5b/VNmojiIWHAgY/OasXvbsJCs8GWMpY5FKjOZxI1T/6pbmAFMlf9hIRKYyMt
	u6XFs3kOKw4Cekk4XDObgt2FSj2pfOTO1W8fwHlhufHXq0zx+miNdiDL1KT3tgpB+uOR
	ruWz0z7TYXkljTlSE4QrhSY72M6vlLpc63zBTkYVdEGyljoIyYcFQWFzwBY4Dx0R6qDy
	EW2N1VNjyuDJBxxfq00oCCGbHvrEYs3ajeYXVBP8zZEHW+WNGBBD57ze/mEWxns91a8Z
	mh7A==
X-Gm-Message-State: AElRT7HbzVnwo/z8fhv5fP/HftcDRVg8S23Ek1NutGKtGFnbRsU+fYa5
	IsEeWO3ZvJVSqTsNGpCbyg7rZ0c/KJckVGUxJTinkQ==
X-Received: by 10.157.69.152 with SMTP id x24mr18049551ote.126.1520534269524; 
	Thu, 08 Mar 2018 10:37:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Thu, 8 Mar 2018 10:37:28 -0800 (PST)
In-Reply-To: <1518893216-9983-8-git-send-email-eric.auger@redhat.com>
References: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
	<1518893216-9983-8-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Mar 2018 18:37:28 +0000
Message-ID: <CAFEAcA9d30THtJPihHAm1dRRLr8a2kg2UqMmxJv-p1Zvjj2PgA@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
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
X-TUID: DFFbWrzHKami

On 17 February 2018 at 18:46, Eric Auger <eric.auger@redhat.com> wrote:
> Now we have relevant helpers for queue and irq
> management, let's implement MMIO write operations.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
>
> v7 -> v8:
> - precise in the commit message invalidation commands
>   are not yet treated.
> - use new queue helpers
> - do not decode unhandled commands at this stage
> ---
>  hw/arm/smmuv3-internal.h |  24 +++++++---
>  hw/arm/smmuv3.c          | 111 +++++++++++++++++++++++++++++++++++++++++++++--
>  hw/arm/trace-events      |   6 +++
>  3 files changed, 132 insertions(+), 9 deletions(-)
>
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index c0771ce..5af97ae 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -152,6 +152,25 @@ static inline uint64_t smmu_read64(uint64_t r, unsigned offset,
>      return extract64(r, offset << 3, 32);
>  }
>
> +static inline void smmu_write64(uint64_t *r, unsigned offset,
> +                                unsigned size, uint64_t value)
> +{
> +    if (size == 8 && !offset) {
> +        *r  = value;
> +    }
> +
> +    /* 32 bit access */
> +
> +    if (offset && offset != 4)  {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "SMMUv3 MMIO write: bad offset/size %u/%u\n",
> +                      offset, size);
> +        return ;
> +    }
> +
> +    *r = deposit64(*r, offset << 3, 32, value);

Similar remarks apply to this helper as to smmu_read64 in the earlier patch.

> +}
> +
>  /* Interrupts */
>
>  #define smmuv3_eventq_irq_enabled(s)                   \
> @@ -159,9 +178,6 @@ static inline uint64_t smmu_read64(uint64_t r, unsigned offset,
>  #define smmuv3_gerror_irq_enabled(s)                  \
>      (FIELD_EX32(s->irq_ctrl, IRQ_CTRL, GERROR_IRQEN))
>
> -void smmuv3_trigger_irq(SMMUv3State *s, SMMUIrq irq, uint32_t gerror_mask);
> -void smmuv3_write_gerrorn(SMMUv3State *s, uint32_t gerrorn);
> -
>  /* Queue Handling */
>
>  #define LOG2SIZE(q)        extract64((q)->base, 0, 5)
> @@ -310,6 +326,4 @@ enum { /* Command completion notification */
>              addr;                                             \
>          })
>
> -int smmuv3_cmdq_consume(SMMUv3State *s);
> -
>  #endif
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 0b57215..fcfdbb0 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -37,7 +37,8 @@
>   * @irq: irq type
>   * @gerror_mask: mask of gerrors to toggle (relevant if @irq is GERROR)
>   */
> -void smmuv3_trigger_irq(SMMUv3State *s, SMMUIrq irq, uint32_t gerror_mask)
> +static void smmuv3_trigger_irq(SMMUv3State *s, SMMUIrq irq,
> +                               uint32_t gerror_mask)
>  {
>
>      bool pulse = false;
> @@ -75,7 +76,7 @@ void smmuv3_trigger_irq(SMMUv3State *s, SMMUIrq irq, uint32_t gerror_mask)
>      }
>  }
>
> -void smmuv3_write_gerrorn(SMMUv3State *s, uint32_t new_gerrorn)
> +static void smmuv3_write_gerrorn(SMMUv3State *s, uint32_t new_gerrorn)
>  {
>      uint32_t pending = s->gerror ^ s->gerrorn;
>      uint32_t toggled = s->gerrorn ^ new_gerrorn;
> @@ -199,7 +200,7 @@ static void smmuv3_init_regs(SMMUv3State *s)
>      s->sid_split = 0;
>  }
>
> -int smmuv3_cmdq_consume(SMMUv3State *s)
> +static int smmuv3_cmdq_consume(SMMUv3State *s)
>  {
>      SMMUCmdError cmd_error = SMMU_CERROR_NONE;
>      SMMUQueue *q = &s->cmdq;
> @@ -298,7 +299,109 @@ int smmuv3_cmdq_consume(SMMUv3State *s)
>  static void smmu_write_mmio(void *opaque, hwaddr addr,
>                              uint64_t val, unsigned size)
>  {
> -    /* not yet implemented */
> +    SMMUState *sys = opaque;
> +    SMMUv3State *s = ARM_SMMUV3(sys);
> +
> +    /* CONSTRAINED UNPREDICTABLE choice to have page0/1 be exact aliases */
> +    addr &= ~0x10000;
> +
> +    if (size != 4 && size != 8) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "SMMUv3 MMIO write: bad size %u\n", size);
> +    }

As with read, this can never happen so you don't need to check for it.

As with read, probably better to explicitly whitelist the 64-bit
accessible offsets, and LOG_GUEST_ERROR and write-ignore the others.

> +
> +    trace_smmuv3_write_mmio(addr, val, size);
> +
> +    switch (addr) {
> +    case A_CR0:
> +        s->cr[0] = val;
> +        s->cr0ack = val;

Spec says "reserved fields in SMMU_CR0 are not reflected in SMMU_CR0ACK",
so you probably need to mask those out.

> +        /* in case the command queue has been enabled */
> +        smmuv3_cmdq_consume(s);
> +        return;
> +    case A_CR1:
> +        s->cr[1] = val;
> +        return;
> +    case A_CR2:
> +        s->cr[2] = val;
> +        return;
> +    case A_IRQ_CTRL:
> +        s->irq_ctrl = val;
> +        return;
> +    case A_GERRORN:
> +        smmuv3_write_gerrorn(s, val);
> +        /*
> +         * By acknowledging the CMDQ_ERR, SW may notify cmds can
> +         * be processed again
> +         */
> +        smmuv3_cmdq_consume(s);
> +        return;
> +    case A_GERROR_IRQ_CFG0: /* 64b */
> +        smmu_write64(&s->gerror_irq_cfg0, 0, size, val);
> +        return;
> +    case A_GERROR_IRQ_CFG0 + 4:
> +        smmu_write64(&s->gerror_irq_cfg0, 4, size, val);
> +        return;
> +    case A_GERROR_IRQ_CFG1:
> +        s->gerror_irq_cfg1 = val;
> +        return;
> +    case A_GERROR_IRQ_CFG2:
> +        s->gerror_irq_cfg2 = val;
> +        return;
> +    case A_STRTAB_BASE: /* 64b */
> +        smmu_write64(&s->strtab_base, 0, size, val);
> +        return;
> +    case A_STRTAB_BASE + 4:
> +        smmu_write64(&s->strtab_base, 4, size, val);
> +        return;
> +    case A_STRTAB_BASE_CFG:
> +        s->strtab_base_cfg = val;
> +        if (FIELD_EX32(val, STRTAB_BASE_CFG, FMT) == 1) {
> +            s->sid_split = FIELD_EX32(val, STRTAB_BASE_CFG, SPLIT);
> +            s->features |= SMMU_FEATURE_2LVL_STE;
> +        }
> +        return;
> +    case A_CMDQ_BASE: /* 64b */
> +        smmu_write64(&s->cmdq.base, 0, size, val);
> +        return;
> +    case A_CMDQ_BASE + 4: /* 64b */
> +        smmu_write64(&s->cmdq.base, 4, size, val);
> +        return;
> +    case A_CMDQ_PROD:
> +        s->cmdq.prod = val;
> +        smmuv3_cmdq_consume(s);
> +        return;
> +    case A_CMDQ_CONS:
> +        s->cmdq.cons = val;
> +        return;
> +    case A_EVENTQ_BASE: /* 64b */
> +        smmu_write64(&s->eventq.base, 0, size, val);
> +        return;
> +    case A_EVENTQ_BASE + 4:
> +        smmu_write64(&s->eventq.base, 4, size, val);
> +        return;
> +    case A_EVENTQ_PROD:
> +        s->eventq.prod = val;
> +        return;
> +    case A_EVENTQ_CONS:
> +        s->eventq.cons = val;
> +        return;
> +    case A_EVENTQ_IRQ_CFG0: /* 64b */
> +        s->eventq.prod = val;
> +        smmu_write64(&s->eventq_irq_cfg0, 0, size, val);
> +        return;
> +    case A_EVENTQ_IRQ_CFG0 + 4:
> +        smmu_write64(&s->eventq_irq_cfg0, 4, size, val);
> +        return;
> +    case A_EVENTQ_IRQ_CFG1:
> +        s->eventq_irq_cfg1 = val;
> +        return;
> +    case A_EVENTQ_IRQ_CFG2:
> +        s->eventq_irq_cfg2 = val;
> +        return;
> +    default:
> +        error_report("%s unhandled access at 0x%"PRIx64, __func__, addr);

Tracepoint or LOG_GUEST_ERROR, not error_report(), please.

> +    }
>  }
>
>  static uint64_t smmu_read_mmio(void *opaque, hwaddr addr, unsigned size)
> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> index 1c5105d..ed5dce0 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -22,3 +22,9 @@ smmuv3_unhandled_cmd(uint32_t type) "Unhandled command type=%d"
>  smmuv3_cmdq_consume(uint32_t prod, uint32_t cons, uint8_t prod_wrap, uint8_t cons_wrap) "prod=%d cons=%d prod.wrap=%d cons.wrap=%d"
>  smmuv3_cmdq_opcode(const char *opcode) "<--- %s"
>  smmuv3_cmdq_consume_out(uint32_t prod, uint32_t cons, uint8_t prod_wrap, uint8_t cons_wrap) "prod:%d, cons:%d, prod_wrap:%d, cons_wrap:%d "
> +smmuv3_update(bool is_empty, uint32_t prod, uint32_t cons, uint8_t prod_wrap, uint8_t cons_wrap) "q empty:%d prod:%d cons:%d p.wrap:%d p.cons:%d"
> +smmuv3_update_check_cmd(int error) "cmdq not enabled or error :0x%x"
> +smmuv3_write_mmio(hwaddr addr, uint64_t val, unsigned size) "addr: 0x%"PRIx64" val:0x%"PRIx64" size: 0x%x"
> +smmuv3_write_mmio_idr(hwaddr addr, uint64_t val) "write to RO/Unimpl reg 0x%lx val64:0x%lx"
> +smmuv3_write_mmio_evtq_cons_bef_clear(uint32_t prod, uint32_t cons, uint8_t prod_wrap, uint8_t cons_wrap) "Before clearing interrupt prod:0x%x cons:0x%x prod.w:%d cons.w:%d"
> +smmuv3_write_mmio_evtq_cons_after_clear(uint32_t prod, uint32_t cons, uint8_t prod_wrap, uint8_t cons_wrap) "after clearing interrupt prod:0x%x cons:0x%x prod.w:%d cons.w:%d"


thanks
-- PMM
