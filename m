Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp2145445lfb;
        Thu, 29 Apr 2021 16:40:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNwVQbsP/lLiLCVF+j10WXLxPVgicKyn6bBBYWRAAj2ZnMrbKwGk+fZGamwUOyHCVMCwwC
X-Received: by 2002:aca:df55:: with SMTP id w82mr8829633oig.25.1619739634695;
        Thu, 29 Apr 2021 16:40:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619739634; cv=none;
        d=google.com; s=arc-20160816;
        b=VX7tB4WFq30pVUhnhg2J+chhrdDRmH2FeCPfqWZ31detWSlLoMWqJ9tCTcaxbekyJI
         eo7JumQs3pQA607RB87ag9l924IOPm3IyVJg6D2sPlQlnDby1dz9Cs5/KmrecZV2Jhkd
         G7bdnsknDGoYY3rJqjFLg8009voC0SHaDrasNHS+QGneRd3vGWKdRXuQs8SoBNBX3dAJ
         S/DzoGkg92i7/bJat7ZLXWcRJh29SQp9tsDQrudRnZ+AAA0vNMXbVi0MbwfosfoQp9AS
         X1WRhEfLZZqlgBFHwXH2w3DRgx1qeR00R7hdT53VdApXt+Rzth4LtszBX2JDZDLMptqA
         28hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:date:to:from:subject:message-id
         :dkim-signature;
        bh=2nTJRUHDZ7+k/8NYx0aCvynDedCdlApFadmMYuEyup4=;
        b=zNLCG+rXkSk4BJ5grIvrm+mCnfjHJZYLjQa56h44b8dd7Db1lQYFrhYYw5T1Rnhp+Q
         szCkKj2talYtqUPDaZi9qgOqOL32AFxgDZ0hEX6ckinmZI3TP6A/NGD2tN1kDmu47TfM
         UxRmbEe/tD3Tj0bq9Xbe2Inol1UnfDjcACNdXSXkd69o2pXvBhdM2/ZFciujTtf6Rgrz
         lLu4dhqLGyJvAOnW8GPH6hq0GHWwzrEPk8Vt811/mIgBP79zp5YWGuvK41OwepLg0ANQ
         wC+fbt6xmyAoeUq9RLNSIzAPhWDjT4VcJD3kgxM8YjxJySq7Gb3ajGZZGJC5nTiPoz44
         WqeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JJyk6hzE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n131si1177699oia.83.2021.04.29.16.40.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Apr 2021 16:40:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JJyk6hzE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcGGn-0004Su-Rh
	for alex.bennee@linaro.org; Thu, 29 Apr 2021 19:40:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lcGGZ-0004RF-5p
 for qemu-arm@nongnu.org; Thu, 29 Apr 2021 19:40:19 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:45847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lcGGW-0003P0-G9
 for qemu-arm@nongnu.org; Thu, 29 Apr 2021 19:40:18 -0400
Received: by mail-qk1-x730.google.com with SMTP id d19so33325860qkk.12
 for <qemu-arm@nongnu.org>; Thu, 29 Apr 2021 16:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2nTJRUHDZ7+k/8NYx0aCvynDedCdlApFadmMYuEyup4=;
 b=JJyk6hzEmxQTYNijXWGMiwokH+usQap7KjanMR3XvrdOpR8vIeGeNjpNT4DyplOc5X
 nnXp/RZwNWuhDFpHcF2g9fhnzEZcOMQmVDeuRrlS96oOp1UsSolnF/6U8g1ETZe9WDU4
 pPwPjMIjL9hJQJAVQCSW1RugcouJakjcuuH03jZ+hNAEuKqXD/weXDZR0nfwpsedaqdq
 pqpV3Qu/lldNNO3BD/RxC5olq1xtl08ZcVH93zD6Kl9k6cNPl0cEMXjab97S8PRDKHEx
 9W70P/J/GaiUNrJTZMUsce2Rx/bWI9l2L2BFsCBFYSZ5uvoUV1Hn5CUau48Jte3kC44d
 7OwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2nTJRUHDZ7+k/8NYx0aCvynDedCdlApFadmMYuEyup4=;
 b=JzoPFX3agPlKBSAw+KNeXTKbTfuailAoeW/Up8PI+jglHj5Qp968q3NCtcq/TS0CNv
 UDQIs1hhKMdx65oVTbfpjjjXeQhivzdN+X6M8cXPSwSqIMeCKM/+k+Dd1OoFvfRXsFds
 qYZz9PPzzL170/6k4WQZRxSkipikkxYhuvGiTDAnqfEQgqoh31fAmyK7y2jH8+MkJw9K
 vnPSQvD/Hi+KkwRbVu7TXTn6+Qn/U+VDBHTXiZFE9CL6nOmjB6KT1Gk9bUupZpMYaqTg
 XqoQyxCkrKXQUloDhiY33ixiLsZGUrZ5ZwR0a0vs5+P+EkYJJT2bGHLtbghqa8X2KRKh
 7O9w==
X-Gm-Message-State: AOAM5324I9/ZT+Tc7wNwgdAOOqltMjW06n5mDW4NMmgp/N01eqep1dKk
 j9WES2eluPO4Kyqr6gMgRJisbQ==
X-Received: by 2002:a37:de0e:: with SMTP id h14mr2290181qkj.465.1619739615419; 
 Thu, 29 Apr 2021 16:40:15 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-23-174-92-28-28.dsl.bell.ca. [174.92.28.28])
 by smtp.gmail.com with ESMTPSA id a3sm1039211qto.2.2021.04.29.16.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 16:40:15 -0700 (PDT)
Message-ID: <37bc65348ddfd15d18e53f0064eed072bc345d22.camel@linaro.org>
Subject: Re: [PATCH v2 6/8] hw/intc: GICv3 redistributor ITS processing
From: shashi.mallela@linaro.org
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Apr 2021 19:40:14 -0400
In-Reply-To: <89852279ad379f2e50563dd47eb67376262355c0.camel@linaro.org>
References: <20210401024152.203896-1-shashi.mallela@linaro.org>
 <20210401024152.203896-7-shashi.mallela@linaro.org>
 <CAFEAcA-bPmPRSLdXOxTHxJ2m1H11pPggwvyCdLFM-hK8U+Qq7A@mail.gmail.com>
 <89852279ad379f2e50563dd47eb67376262355c0.camel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-14.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x730.google.com
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
X-TUID: WSgGTryDxD/3

On Thu, 2021-04-29 at 18:16 -0400, shashi.mallela@linaro.org wrote:
On Mon, 2021-04-19 at 13:44 +0100, Peter Maydell wrote:
> On Thu, 1 Apr 2021 at 03:41, Shashi Mallela <
> shashi.mallela@linaro.org> wrote:
> > Implemented lpi processing at redistributor to get lpi config info
> > from lpi configuration table,determine priority,set pending state
> > in
> > lpi pending table and forward the lpi to cpuif.Added logic to
> > invoke
> > redistributor lpi processing with translated LPI which set/clear
> > LPI
> > from ITS device as part of ITS INT,CLEAR,DISCARD command and
> > GITS_TRANSLATER processing.
> 
> Nit: commas should all have a space following.
> 
> > Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> > ---
> >  hw/intc/arm_gicv3.c        |   6 ++
> >  hw/intc/arm_gicv3_cpuif.c  |  15 +++--
> >  hw/intc/arm_gicv3_its.c    |   9 ++-
> >  hw/intc/arm_gicv3_redist.c | 124
> > +++++++++++++++++++++++++++++++++++++
> >  hw/intc/gicv3_internal.h   |   9 +++
> >  5 files changed, 158 insertions(+), 5 deletions(-)
> > 
> > diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
> > index 66eaa97198..618fa1af95 100644
> > --- a/hw/intc/arm_gicv3.c
> > +++ b/hw/intc/arm_gicv3.c
> > @@ -166,6 +166,12 @@ static void
> > gicv3_redist_update_noirqset(GICv3CPUState *cs)
> >          cs->hppi.grp = gicv3_irq_group(cs->gic, cs, cs->hppi.irq);
> >      }
> > 
> > +    if (cs->gic->lpi_enable) {
> > +        if (gicv3_redist_update_lpi(cs)) {
> > +            seenbetter = true;
> > +        }
> > +    }
> > +
> >      /* If the best interrupt we just found would preempt whatever
> >       * was the previous best interrupt before this update, then
> >       * we know it's definitely the best one now.
> > diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> > index 43ef1d7a84..c225b80f66 100644
> > --- a/hw/intc/arm_gicv3_cpuif.c
> > +++ b/hw/intc/arm_gicv3_cpuif.c
> > @@ -899,9 +899,14 @@ static void icc_activate_irq(GICv3CPUState
> > *cs, int irq)
> >          cs->gicr_ipendr0 = deposit32(cs->gicr_ipendr0, irq, 1, 0);
> >          gicv3_redist_update(cs);
> >      } else {
> > -        gicv3_gicd_active_set(cs->gic, irq);
> > -        gicv3_gicd_pending_clear(cs->gic, irq);
> > -        gicv3_update(cs->gic, irq, 1);
> > +        if (irq >= GICV3_LPI_INTID_START) {
> > +            gicv3_redist_lpi_pending(cs, irq, 0);
> > +            gicv3_redist_update(cs);
> > +        } else {
> > +            gicv3_gicd_active_set(cs->gic, irq);
> > +            gicv3_gicd_pending_clear(cs->gic, irq);
> > +            gicv3_update(cs->gic, irq, 1);
> > +        }
> >      }
> >  }
> > 
> > @@ -1337,7 +1342,9 @@ static void icc_eoir_write(CPUARMState *env,
> > const ARMCPRegInfo *ri,
> >           * valid interrupt value read from the Interrupt
> > Acknowledge
> >           * register" and so this is UNPREDICTABLE. We choose to
> > ignore it.
> >           */
> > -        return;
> > +        if (!(cs->gic->lpi_enable && (irq >=
> > GICV3_LPI_INTID_START))) {
> > +            return;
> > +        }
> 
> This condition is in the wrong place. I think what you are trying to
> do is modify "what is the set of numbers we consider to be valid IRQ
> numbers", in which case you want to be changing the outer
> "if (irq >= cs->gic->num_irq)" condition, not adding an extra one
> inside it.
> 
> More importantly, the thing this condition is guarding is that
> the code below it assumes that IRQ numbers are in range for the
> GIC's own internal non-LPI interrupts. If you allow numbers
> > = cs->gic->num_irq through, then you will get array overruns
> when icc_deactivate_irq() tries to clear its Active bit.
> 
> >      }
> > 
> >      if (icc_highest_active_group(cs) != grp) {
> > diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> > index 0e3f176809..41e1e8b2a8 100644
> > --- a/hw/intc/arm_gicv3_its.c
> > +++ b/hw/intc/arm_gicv3_its.c
> > @@ -226,6 +226,7 @@ static MemTxResult process_int(GICv3ITSState
> > *s, uint64_t value,
> >      bool ite_valid = false;
> >      uint64_t cte = 0;
> >      bool cte_valid = false;
> > +    uint64_t rdbase;
> >      uint8_t buff[ITS_ITT_ENTRY_SIZE];
> >      uint64_t itt_addr;
> > 
> > @@ -278,12 +279,18 @@ static MemTxResult process_int(GICv3ITSState
> > *s, uint64_t value,
> >               * since with a physical address the target address
> > must be
> >               * 64KB aligned
> >               */
> > -
> > +            rdbase = (cte >> 1U) & RDBASE_MASK;
> 
> What's going on here? Shouldn't this be in a previous patch ?
> > 
> No,this part relates to the ITS processing wherein the rdbase is
extracted and used for subsequent redistributor trigger
> > >              /*
> >               * Current implementation only supports rdbase ==
> > procnum
> >               * Hence rdbase physical address is ignored
> >               */
> >          } else {
> > +            rdbase = (cte >> 1U) & RDBASE_PROCNUM_MASK;
> > +            if ((cmd == CLEAR) || (cmd == DISCARD)) {
> > +                gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase],
> > pIntid, 0);
> > +            } else {
> > +                gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase],
> > pIntid, 1);
> > +            }
> > 
> >              if (cmd == DISCARD) {
> >                  /* remove mapping from interrupt translation table
> > */
> > diff --git a/hw/intc/arm_gicv3_redist.c
> > b/hw/intc/arm_gicv3_redist.c
> > index 325b974e70..71c648a616 100644
> > --- a/hw/intc/arm_gicv3_redist.c
> > +++ b/hw/intc/arm_gicv3_redist.c
> > @@ -254,6 +254,8 @@ static MemTxResult gicr_writel(GICv3CPUState
> > *cs, hwaddr offset,
> >          if (cs->gicr_typer & GICR_TYPER_PLPIS) {
> >              if (value & GICR_CTLR_ENABLE_LPIS) {
> >                  cs->gicr_ctlr |= GICR_CTLR_ENABLE_LPIS;
> > +                /* Check for any pending interr in pending table
> > */
> > +                gicv3_redist_update(cs);
> >              } else {
> >                  cs->gicr_ctlr &= ~GICR_CTLR_ENABLE_LPIS;
> >              }
> > @@ -548,6 +550,128 @@ MemTxResult gicv3_redist_write(void *opaque,
> > hwaddr offset, uint64_t data,
> >      return r;
> >  }
> > 
> > +bool gicv3_redist_update_lpi(GICv3CPUState *cs)
> 
> Could we have a comment explaining what this function does, please ?
> 
> > +{
> > +    AddressSpace *as = &cs->gic->sysmem_as;
> > +    uint64_t lpict_baddr, lpipt_baddr;
> > +    uint32_t pendt_size = 0;
> > +    uint8_t lpite;
> > +    uint8_t prio, pend;
> > +    int i;
> > +    bool seenbetter = false;
> > +
> > +    if ((!cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs-
> > >gicr_propbaser ||
> > +        !cs->gicr_pendbaser || cs->lpi_outofrange) {
> > +        return seenbetter;
> > +    }
> > +
> > +    lpict_baddr = FIELD_EX64(cs->gicr_propbaser, GICR_PROPBASER,
> > PHYADDR);
> > +    lpict_baddr <<= R_GICR_PROPBASER_PHYADDR_SHIFT;
> > +
> > +    lpipt_baddr =  FIELD_EX64(cs->gicr_pendbaser, GICR_PENDBASER,
> > PHYADDR);
> > +    lpipt_baddr <<= R_GICR_PENDBASER_PHYADDR_SHIFT;
> > +
> > +    /* Determine the highest priority pending interrupt among LPIs
> > */
> > +    pendt_size = (1UL << (FIELD_EX64(cs->gicr_propbaser,
> > GICR_PROPBASER,
> > +                          IDBITS) - 1));
> 
> This is where you should be handling "actually the table is empty"
> or "table size is capped at the implementation's maximum size".
> 
> > +
> > +    for (i = 0; i < pendt_size; i++) {
> > +        address_space_read(as, lpipt_baddr +
> > +                (((GICV3_LPI_INTID_START + i) / 8) *
> > sizeof(pend)),
> > +                MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
> > +
> > +        if ((1 << ((GICV3_LPI_INTID_START + i) % 8)) & pend) {
> > +            address_space_read(as, lpict_baddr + (i *
> > sizeof(lpite)),
> > +                      MEMTXATTRS_UNSPECIFIED, &lpite,
> > sizeof(lpite));
> > +
> > +            prio = ((lpite >> LPI_CTE_PRIORITY_OFFSET) &
> > +                     LPI_CTE_PRIORITY_MASK);
> > +            prio &= LPI_PRIORITY_MASK;
> > +
> > +            if (prio < cs->hppi.prio) {
> > +                cs->hppi.irq = GICV3_LPI_INTID_START + i;
> > +                cs->hppi.prio = prio;
> > +                /* LPIs are always non-secure Grp1 interrupts */
> > +                cs->hppi.grp = GICV3_G1NS;
> > +                seenbetter = true;
> > +            }
> > +        }
> > +    }
> 
> Oof. How big is an LPI configuration table, typically? I'm not sure
> we want
> to be scanning the entire LPI configuration table in guest memory for
> every
> time gicv3_redist_update() is called if we can avoid it.
> 
> A bit of benchmarking of how much this slows down emulation might
> be interesting.
> 
> The implementation scans the full LPI pending table,but only scans
> the LPI config table entry for which the pending bit is set on
every 
> gicv3_redist_update.
> With preliminary testing on linux guest os and kvm-unit-tests didnt
observe any noticeable delay during the ITS processing
 
> > +    return seenbetter;
> > +}
> > +
> > +void gicv3_redist_lpi_pending(GICv3CPUState *cs, int irq, int
> > level)
> > +{
> > +    AddressSpace *as = &cs->gic->sysmem_as;
> > +    uint64_t lpipt_baddr;
> > +    bool ispend = false;
> > +    uint8_t pend;
> > +
> > +    /*
> > +     * get the bit value corresponding to this irq in the
> > +     * lpi pending table
> > +     */
> > +    lpipt_baddr = FIELD_EX64(cs->gicr_pendbaser, GICR_PENDBASER,
> > PHYADDR);
> > +    lpipt_baddr <<= R_GICR_PENDBASER_PHYADDR_SHIFT;
> > +
> > +    address_space_read(as, lpipt_baddr + ((irq / 8) *
> > sizeof(pend)),
> > +                         MEMTXATTRS_UNSPECIFIED, &pend,
> > sizeof(pend));
> > +    ispend = ((pend >> (irq % 8)) & 0x1);
> > +
> > +    if (ispend) {
> > +        if (!level) {
> > +            /*
> > +             * clear the pending bit and update the lpi pending
> > table
> > +             */
> > +            pend &= ~(1 << (irq % 8));
> > +
> > +            address_space_write(as, lpipt_baddr + ((irq / 8) *
> > sizeof(pend)),
> > +                                 MEMTXATTRS_UNSPECIFIED, &pend,
> > sizeof(pend));
> > +        }
> > +    } else {
> > +        if (level) {
> > +            /*
> > +             * if pending bit is not already set for this
> > irq,turn-on the
> > +             * pending bit and update the lpi pending table
> > +             */
> > +            pend |= (1 << (irq % 8));
> > +
> > +            address_space_write(as, lpipt_baddr + ((irq / 8) *
> > sizeof(pend)),
> > +                                 MEMTXATTRS_UNSPECIFIED, &pend,
> > sizeof(pend));
> > +        }
> > +    }
> > +}
> > 
> > +void gicv3_redist_process_lpi(GICv3CPUState *cs, int irq, int
> > level)
> > +{
> > +    AddressSpace *as = &cs->gic->sysmem_as;
> > +    uint64_t lpict_baddr;
> > +    uint8_t lpite;
> > +
> > +    if ((!cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs-
> > >gicr_propbaser ||
> > +         !cs->gicr_pendbaser || cs->lpi_outofrange) {
> > +        return;
> > +    }
> > +
> > +    lpict_baddr = FIELD_EX64(cs->gicr_propbaser, GICR_PROPBASER,
> > PHYADDR);
> > +    lpict_baddr <<= R_GICR_PROPBASER_PHYADDR_SHIFT;
> > +
> > +    /* get the lpi config table entry corresponding to this irq */
> > +    address_space_read(as, lpict_baddr + ((irq -
> > GICV3_LPI_INTID_START) *
> > +                        sizeof(lpite)), MEMTXATTRS_UNSPECIFIED,
> > +                        &lpite, sizeof(lpite));
> > +
> > +    /* check if this irq is enabled before proceeding further */
> > +    if (!(lpite & LPI_CTE_ENABLED)) {
> > +        return;
> > +    }
> > +
> > +    /* set/clear the pending bit for this irq */
> > +    gicv3_redist_lpi_pending(cs, irq, level);
> > +
> > +    gicv3_redist_update(cs);
> > +}
> > +
> >  void gicv3_redist_set_irq(GICv3CPUState *cs, int irq, int level)
> >  {
> >      /* Update redistributor state for a change in an external PPI
> > input line */
> > diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
> > index a2718704d4..4c97c22850 100644
> > --- a/hw/intc/gicv3_internal.h
> > +++ b/hw/intc/gicv3_internal.h
> > @@ -306,6 +306,12 @@ FIELD(GITS_TYPER, CIL, 36, 1)
> > 
> >  #define L1TABLE_ENTRY_SIZE         8
> > 
> > +#define LPI_CTE_ENABLE_OFFSET      0
> > +#define LPI_CTE_ENABLED          VALID_MASK
> > +#define LPI_CTE_PRIORITY_OFFSET    2
> > +#define LPI_CTE_PRIORITY_MASK     ((1U << 6) - 1)
> > +#define LPI_PRIORITY_MASK         0xfc
> > +
> >  #define GITS_CMDQ_ENTRY_SIZE               32
> >  #define NUM_BYTES_IN_DW                     8
> > 
> > @@ -444,6 +450,9 @@ MemTxResult gicv3_redist_write(void *opaque,
> > hwaddr offset, uint64_t data,
> >                                 unsigned size, MemTxAttrs attrs);
> >  void gicv3_dist_set_irq(GICv3State *s, int irq, int level);
> >  void gicv3_redist_set_irq(GICv3CPUState *cs, int irq, int level);
> > +void gicv3_redist_process_lpi(GICv3CPUState *cs, int irq, int
> > level);
> > +void gicv3_redist_lpi_pending(GICv3CPUState *cs, int irq, int
> > level);
> > +bool gicv3_redist_update_lpi(GICv3CPUState *cs);
> >  void gicv3_redist_send_sgi(GICv3CPUState *cs, int grp, int irq,
> > bool ns);
> >  void gicv3_init_cpuif(GICv3State *s);
> 
> thanks
> -- PMM

