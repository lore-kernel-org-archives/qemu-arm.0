Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp50142lfm;
        Thu, 20 May 2021 04:02:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrmJcP0BkzoYVLpdNXn27QVrngeE2KSPYazKBuvY2BfE3VP4bM4JljNJE5vVa/1usCgUE/
X-Received: by 2002:a17:906:6c96:: with SMTP id s22mr4160000ejr.468.1621508558475;
        Thu, 20 May 2021 04:02:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621508558; cv=none;
        d=google.com; s=arc-20160816;
        b=OYhNIJvDHNnDm6D9F8R1a4KXioFg7EIbu7nA5ktqsOjM/edvJ07N1PF332/4SONLw8
         REx1PTC843zKTw42WWIS0u2LXHzsR/NsCndC+gvVP7N/O8/bCncTLTc1rP1W7rJ+Ucx9
         zNYHAQQUUUSzJHkpiR62zv7Su8fj8UoZaQ2ddbHykZdOGCtIhkF37mZykP+yjBSgohBz
         aNH6Tvhss007nvwbR5QH+cpT4DipYkzsthFrSvhfDw4AQEzPVn10e6WaD8hq7zdHRERq
         4NdGQQuTyQ1pqw8oCoCBXOORkK1T7vAleqi/AkiTFdIVjefHBBgJUF0i+cNaVDh/4krf
         MSmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ki0+fKc+qYhCu/umnU5E1TG7SbsImF6Iy9aOHQKz2q8=;
        b=Hu0DJcOBxx+p4FeULzQ1q771LXtvCrQkhR/ZhYrBKl+esGiuSo9vRWNfGa+pEXoNnz
         eVLP51zqm5jtJHzxGhnH2iAZMXOoqgK8d0VHX7xzl7TX43ieaRfr7KILZkI0YHe8mXuS
         6aDud3Rlmj4S1OkQ2TrnW2jHUxBrWZDtktYKPZqcH0VPhdw6U/R5hg+KMS/QoPs3vKV7
         IXqyvpGRzMVJqj/B4SSYSge7oaEBRWADwQyEhHwPKcmas7w7GZEyYYbZwcv0trjCsMSx
         mZQDX3fe8pdd53HMA0sz/dFeuOGMCDwNaLbpNMgYzl+i6/htvFrOPzhoc2lstP1lbZGL
         P8XA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CBgTfNWJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id co2si1987121edb.402.2021.05.20.04.02.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 May 2021 04:02:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CBgTfNWJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ljgRp-0006um-Gn
	for alex.bennee@linaro.org; Thu, 20 May 2021 07:02:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljgRF-0006ql-5G
 for qemu-arm@nongnu.org; Thu, 20 May 2021 07:02:01 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:39588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljgRC-0008Cz-N5
 for qemu-arm@nongnu.org; Thu, 20 May 2021 07:02:00 -0400
Received: by mail-ej1-x62d.google.com with SMTP id l1so24588193ejb.6
 for <qemu-arm@nongnu.org>; Thu, 20 May 2021 04:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ki0+fKc+qYhCu/umnU5E1TG7SbsImF6Iy9aOHQKz2q8=;
 b=CBgTfNWJV5LnvMx1N7dNcn5RCOMr6Et2rXB+/XCDQaORL9V/HdvxpgyAYNbBG0VWhf
 POGgcV4FqDuUg3u/yo1Czkotay8tVE7oyyJo/PStQHcfJMJdWdeAsTHSzvGupCWaNpIA
 oIwW/aubVsJzUF4JoF+FPprgFeSPu4rnBogcNvDlP8WlX8AoG02lcBAPhl1pBd10y9wG
 RtD07/YQxkCWJkWivHCD8v1EAHPHQHkjKh+RqnNWO9ZSTNbE/yjent84ZbAu+zqURYT6
 qw/OnSoqNfDX9qwZh0u1wdcpymGxLZ9QeMHiM6sS7Frdrowv4cmg8HXQfMIZKjEddBvm
 p6TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ki0+fKc+qYhCu/umnU5E1TG7SbsImF6Iy9aOHQKz2q8=;
 b=iDRV1YUUkBKptkujFTXjgR2NhUtORXfYldp6M1gpOYfQ33/jtuBcHILGeCAkbsvGa4
 odZH3C1YRlzlCQJPrPeEVb/He8oSeYjEELU39j92nBrZZFsNGwnRptFdfqOdbd6KaD9v
 XoXBqxnMLbTqGv2PKSltsOXvYznc8I2qe71NaKD69Bl3UeDaKanyzjCy7Dvhp9NdUnFu
 SfpFolArWZGDlJDzs1W974fGL5fQesEsOJ1q6yfFa2mHGP07pr3DElgBBkYgG4FNcqaf
 cBMqpNMOXq1g7rwOjeEye/cBBKXxvL6V2YIttBChBW+kArz80IsZIsqshIFaiB2xnRFX
 muzA==
X-Gm-Message-State: AOAM533AMWvfXMONlLY5ULuk6DhY/n5OmfH+5BpxWAPSdasVB5YajGIR
 N6Cy/GF5HYbitw2ouOIoqqk38JyKJwRmQME3Fd/50A==
X-Received: by 2002:a17:906:d1d2:: with SMTP id
 bs18mr4174531ejb.56.1621508516435; 
 Thu, 20 May 2021 04:01:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210429234201.125565-1-shashi.mallela@linaro.org>
 <20210429234201.125565-7-shashi.mallela@linaro.org>
In-Reply-To: <20210429234201.125565-7-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 May 2021 12:01:37 +0100
Message-ID: <CAFEAcA_GhRkfYgNpu+QDZEKr-HNUCx5Zq5JTF+DrWsKLd+p3PA@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] hw/intc: GICv3 redistributor ITS processing
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jT/LKppYEfAh

On Fri, 30 Apr 2021 at 00:42, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Implemented lpi processing at redistributor to get lpi config info
> from lpi configuration table,determine priority,set pending state in
> lpi pending table and forward the lpi to cpuif.Added logic to invoke
> redistributor lpi processing with translated LPI which set/clear LPI
> from ITS device as part of ITS INT,CLEAR,DISCARD command and
> GITS_TRANSLATER processing.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---
>  hw/intc/arm_gicv3.c        |   6 ++
>  hw/intc/arm_gicv3_cpuif.c  |  20 ++++--
>  hw/intc/arm_gicv3_its.c    |  12 ++--
>  hw/intc/arm_gicv3_redist.c | 133 +++++++++++++++++++++++++++++++++++++
>  hw/intc/gicv3_internal.h   |   9 +++
>  5 files changed, 171 insertions(+), 9 deletions(-)
>
> diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
> index 66eaa97198..618fa1af95 100644
> --- a/hw/intc/arm_gicv3.c
> +++ b/hw/intc/arm_gicv3.c
> @@ -166,6 +166,12 @@ static void gicv3_redist_update_noirqset(GICv3CPUState *cs)
>          cs->hppi.grp = gicv3_irq_group(cs->gic, cs, cs->hppi.irq);
>      }
>
> +    if (cs->gic->lpi_enable) {
> +        if (gicv3_redist_update_lpi(cs)) {
> +            seenbetter = true;
> +        }
> +    }
> +

I'm not sure if this call is in the right place. This function
(gicv3_redist_update_noirqset()) is specifically for when state
in the *redistributor* has changed, and it is trying to be a fast
path for "we know that only the redistributor state has changed,
so we might be able to find the new best interrupt by looking only
at the redistributor state". It has a fallback case at the bottom
of the function for "the redistributor state changed such that
we have to actually look at the whole of the GIC state to find
the new best interrupt".

>      /* If the best interrupt we just found would preempt whatever
>       * was the previous best interrupt before this update, then
>       * we know it's definitely the best one now.
> diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> index 43ef1d7a84..11b1df5b6b 100644
> --- a/hw/intc/arm_gicv3_cpuif.c
> +++ b/hw/intc/arm_gicv3_cpuif.c
> @@ -899,9 +899,14 @@ static void icc_activate_irq(GICv3CPUState *cs, int irq)
>          cs->gicr_ipendr0 = deposit32(cs->gicr_ipendr0, irq, 1, 0);
>          gicv3_redist_update(cs);
>      } else {
> -        gicv3_gicd_active_set(cs->gic, irq);
> -        gicv3_gicd_pending_clear(cs->gic, irq);
> -        gicv3_update(cs->gic, irq, 1);
> +        if (irq >= GICV3_LPI_INTID_START) {
> +            gicv3_redist_lpi_pending(cs, irq, 0);
> +            gicv3_redist_update(cs);
> +        } else {
> +            gicv3_gicd_active_set(cs->gic, irq);
> +            gicv3_gicd_pending_clear(cs->gic, irq);
> +            gicv3_update(cs->gic, irq, 1);
> +        }

Don't nest this if(), instead write the whole ladder at the same
nesting depth:
    if (irq < GIC_INTERNAL) {
        handle internal irq;
    } else if (irq < GICV3_LPI_INTID_START) {
        handle normal irq;
    } else {
        handle LPI;
    }

>      }
>  }
>
> @@ -1328,7 +1333,8 @@ static void icc_eoir_write(CPUARMState *env, const ARMCPRegInfo *ri,
>          }
>      }
>
> -    if (irq >= cs->gic->num_irq) {
> +    if ((irq >= cs->gic->num_irq) && (!(cs->gic->lpi_enable &&
> +        (irq >= GICV3_LPI_INTID_START)))) {
>          /* This handles two cases:
>           * 1. If software writes the ID of a spurious interrupt [ie 1020-1023]
>           * to the GICC_EOIR, the GIC ignores that write.
> @@ -1348,7 +1354,11 @@ static void icc_eoir_write(CPUARMState *env, const ARMCPRegInfo *ri,
>
>      if (!icc_eoi_split(env, cs)) {
>          /* Priority drop and deactivate not split: deactivate irq now */
> -        icc_deactivate_irq(cs, irq);
> +        if (irq >= GICV3_LPI_INTID_START) {
> +            gicv3_update(cs->gic, irq, 1);

This doesn't look right. You're not actually doing anything here for
an LPI interrupt, so you shouldn't need to call gicv3_update().

> +        } else {
> +            icc_deactivate_irq(cs, irq);
> +        }
>      }
>  }
>
> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> index 98c984dd22..28da2d1d77 100644
> --- a/hw/intc/arm_gicv3_its.c
> +++ b/hw/intc/arm_gicv3_its.c
> @@ -219,6 +219,7 @@ static MemTxResult process_int(GICv3ITSState *s, uint64_t value,
>      bool ite_valid = false;
>      uint64_t cte = 0;
>      bool cte_valid = false;
> +    uint64_t rdbase;
>      uint64_t itel = 0;
>      uint32_t iteh = 0;
>
> @@ -275,10 +276,13 @@ static MemTxResult process_int(GICv3ITSState *s, uint64_t value,
>           * command in the queue
>           */
>      } else {
> -        /*
> -         * Current implementation only supports rdbase == procnum
> -         * Hence rdbase physical address is ignored
> -         */
> +        rdbase = (cte >> 1U) & RDBASE_PROCNUM_MASK;
> +        if ((cmd == CLEAR) || (cmd == DISCARD)) {
> +            gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase], pIntid, 0);
> +        } else {
> +            gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase], pIntid, 1);
> +        }

You need to check that rdbase is actually within the range of the
number of CPUs here, otherwise you might access the cpu[] array
out of bounds.

> +
>          if (cmd == DISCARD) {
>              /* remove mapping from interrupt translation table */
>              res = update_ite(s, eventid, dte, itel, iteh);
> diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
> index 7604ccdc83..82ca9d71e5 100644
> --- a/hw/intc/arm_gicv3_redist.c
> +++ b/hw/intc/arm_gicv3_redist.c
> @@ -256,6 +256,8 @@ static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
>          if (cs->gicr_typer & GICR_TYPER_PLPIS) {
>              if (value & GICR_CTLR_ENABLE_LPIS) {
>                  cs->gicr_ctlr |= GICR_CTLR_ENABLE_LPIS;
> +                /* Check for any pending interr in pending table */
> +                gicv3_redist_update(cs);
>              } else {
>                  cs->gicr_ctlr &= ~GICR_CTLR_ENABLE_LPIS;
>              }
> @@ -546,6 +548,137 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
>      return r;
>  }
>
> +bool gicv3_redist_update_lpi(GICv3CPUState *cs)
> +{
> +    /*
> +     * This function scans the LPI pending table and for each pending
> +     * LPI, reads the corresponding entry from LPI configuration table
> +     * to extract the priority info and determine if the LPI priority
> +     * is lower than the current high priority interrupt.If yes, update
> +     * high priority pending interrupt to that of LPI.
> +     */

I would still like to see some profiling of whether we spend a significant
amount of time in this function...

> +    AddressSpace *as = &cs->gic->dma_as;
> +    uint64_t lpict_baddr, lpipt_baddr;
> +    uint32_t pendt_size = 0;
> +    uint8_t lpite;
> +    uint8_t prio, pend;
> +    int i;
> +    bool seenbetter = false;
> +
> +    if ((!cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs->gicr_propbaser ||
> +        !cs->gicr_pendbaser || (FIELD_EX64(cs->gicr_propbaser, GICR_PROPBASER,
> +        IDBITS) < GICR_PROPBASER_IDBITS_THRESHOLD)) {
> +        return seenbetter;
> +    }
> +
> +    lpict_baddr = FIELD_EX64(cs->gicr_propbaser, GICR_PROPBASER, PHYADDR);
> +    lpict_baddr <<= R_GICR_PROPBASER_PHYADDR_SHIFT;
> +
> +    lpipt_baddr =  FIELD_EX64(cs->gicr_pendbaser, GICR_PENDBASER, PHYADDR);
> +    lpipt_baddr <<= R_GICR_PENDBASER_PHYADDR_SHIFT;
> +
> +    /* Determine the highest priority pending interrupt among LPIs */
> +    pendt_size = (1UL << (FIELD_EX64(cs->gicr_propbaser, GICR_PROPBASER,
> +                          IDBITS) - 1));
> +
> +    for (i = 0; i < pendt_size; i++) {
> +        address_space_read(as, lpipt_baddr +
> +                (((GICV3_LPI_INTID_START + i) / 8) * sizeof(pend)),
> +                MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
> +
> +        if ((1 << ((GICV3_LPI_INTID_START + i) % 8)) & pend) {
> +            address_space_read(as, lpict_baddr + (i * sizeof(lpite)),
> +                      MEMTXATTRS_UNSPECIFIED, &lpite, sizeof(lpite));
> +
> +            prio = ((lpite >> LPI_CTE_PRIORITY_OFFSET) &
> +                     LPI_CTE_PRIORITY_MASK);
> +            prio &= LPI_PRIORITY_MASK;


The priority field interpretation depends on whether GICD_CTLR.DS is 0 or 1,
(see section 5.1.1 in the GICv3 spec).

> +
> +            if (prio < cs->hppi.prio) {
> +                cs->hppi.irq = GICV3_LPI_INTID_START + i;
> +                cs->hppi.prio = prio;
> +                /* LPIs are always non-secure Grp1 interrupts */
> +                cs->hppi.grp = GICV3_G1NS;
> +                seenbetter = true;
> +            }
> +        }
> +    }
> +    return seenbetter;
> +}
> +
> +void gicv3_redist_lpi_pending(GICv3CPUState *cs, int irq, int level)
> +{
> +    AddressSpace *as = &cs->gic->dma_as;
> +    uint64_t lpipt_baddr;
> +    bool ispend = false;
> +    uint8_t pend;
> +
> +    /*
> +     * get the bit value corresponding to this irq in the
> +     * lpi pending table
> +     */
> +    lpipt_baddr = FIELD_EX64(cs->gicr_pendbaser, GICR_PENDBASER, PHYADDR);
> +    lpipt_baddr <<= R_GICR_PENDBASER_PHYADDR_SHIFT;

You can write
  lpipt_baddr = cs->gicr_pendbaser & R_GICR_PENDBASER_PHYADDR_MASK;

because the register is laid out deliberately so that bits [51:16] in the
register specify bits [51:16] of the address.

> +
> +    address_space_read(as, lpipt_baddr + ((irq / 8) * sizeof(pend)),
> +                         MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
> +    ispend = ((pend >> (irq % 8)) & 0x1);
> +
> +    if (ispend) {
> +        if (!level) {
> +            /*
> +             * clear the pending bit and update the lpi pending table
> +             */
> +            pend &= ~(1 << (irq % 8));
> +
> +            address_space_write(as, lpipt_baddr + ((irq / 8) * sizeof(pend)),
> +                                 MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
> +        }
> +    } else {
> +        if (level) {
> +            /*
> +             * if pending bit is not already set for this irq,turn-on the
> +             * pending bit and update the lpi pending table
> +             */
> +            pend |= (1 << (irq % 8));
> +
> +            address_space_write(as, lpipt_baddr + ((irq / 8) * sizeof(pend)),
> +                                 MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
> +        }
> +    }
> +}
> +
> +void gicv3_redist_process_lpi(GICv3CPUState *cs, int irq, int level)
> +{
> +    AddressSpace *as = &cs->gic->dma_as;
> +    uint64_t lpict_baddr;
> +    uint8_t lpite;
> +
> +    if ((!cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs->gicr_propbaser ||
> +         !cs->gicr_pendbaser || (FIELD_EX64(cs->gicr_propbaser, GICR_PROPBASER,
> +         IDBITS) < GICR_PROPBASER_IDBITS_THRESHOLD)) {
> +        return;
> +    }

Something needs to be checking for "attempt to work with an interrupt
number that is too large according to either GICR_PROPBASER.IDbits or
GICD_TYPER.IDbits". You could do it either in this function or in the
callers; doing it here is probably as good as anywhere.

> +    lpict_baddr = FIELD_EX64(cs->gicr_propbaser, GICR_PROPBASER, PHYADDR);
> +    lpict_baddr <<= R_GICR_PROPBASER_PHYADDR_SHIFT;
> +
> +    /* get the lpi config table entry corresponding to this irq */
> +    address_space_read(as, lpict_baddr + ((irq - GICV3_LPI_INTID_START) *
> +                        sizeof(lpite)), MEMTXATTRS_UNSPECIFIED,
> +                        &lpite, sizeof(lpite));
> +
> +    /* check if this irq is enabled before proceeding further */
> +    if (!(lpite & LPI_CTE_ENABLED)) {
> +        return;
> +    }
> +
> +    /* set/clear the pending bit for this irq */
> +    gicv3_redist_lpi_pending(cs, irq, level);
> +
> +    gicv3_redist_update(cs);
> +}
> +
>  void gicv3_redist_set_irq(GICv3CPUState *cs, int irq, int level)
>  {
>      /* Update redistributor state for a change in an external PPI input line */

thanks
-- PMM
