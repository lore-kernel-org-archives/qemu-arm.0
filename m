Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp2145166lfb;
        Thu, 29 Apr 2021 16:40:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVr/1qEz2Q0K7sf5wxdGHtIMmDdRlHx8LvZs+8kWkmAgXuqxxF5mOFcb2g4+I1KlbPRgnu
X-Received: by 2002:aca:ea8b:: with SMTP id i133mr1819427oih.37.1619739609246;
        Thu, 29 Apr 2021 16:40:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619739609; cv=none;
        d=google.com; s=arc-20160816;
        b=n5u7oHcWhaCLn574Kz3AppUoamA0Gc1QgbGqAK0QXicO1hW5wor8BW/kT6m/zElwcG
         f4RxENnw/arDLrFVDtvhU/CkeSp/CcJpyvDRai2V+xUGdfYHZ5dBQxjQMn0SFzsPVHgF
         HKeMYx0vzQyV77zIiQ1NZBsj28j+ek0n9AaAzn3cAE5sb/Jco1qVhMXSJLoJ28ponPEy
         kBDgWycNLK4Fhteccb17SluHRruSUFxXEZmOEpoNnOcJi0qtHOwC4b3BeHaLxBPkDG0B
         BzY3K9El9co1Wi3qnOHvy05mery8Oa7hoRaMNH4Y+JcNFXnhSb8S3nYfiZ3R+nxNDYxd
         w0ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:date:to:from:subject:message-id
         :dkim-signature;
        bh=1WjyilCHrOCoe9btRhUkYLzDH7J/V+a56/cnVBX3G5A=;
        b=lgs7CvkS1alq/TkxiMlSZsU22VARNTDM/LCNsU+Gb2Mnvb7oNpx73M8Z/jfe1Yuj75
         H2qSESHe3+KV5MKenS9SOHxWnIfRG7YyhY1o0EgGmJ504BLrsUEMT3tRku5ZPMVlHE9S
         z+m8haN0xHeFGVqoaqBtmbGdNNY8jeazltn2EY/WfSpQRbbS8iw7gnbyYAAR/sJu8OTj
         pmuM1jG5JejkFd0LPa0zJjrOkhJCmMnbB9qIVXU5VXdlONv4T3KLm880YK7VWT2J8JKT
         GvXWrTzTn9cWnqw91J+SIzy8chewjkvyOQD6ORvMht+B9fYrOHbvCwMsY8xI8k2UivTa
         93Jg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Rh+HLeGg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t11si1760683oth.119.2021.04.29.16.40.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Apr 2021 16:40:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Rh+HLeGg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcGGO-0003zx-H9
	for alex.bennee@linaro.org; Thu, 29 Apr 2021 19:40:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lcGFW-0003yI-Ri
 for qemu-arm@nongnu.org; Thu, 29 Apr 2021 19:39:14 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:46021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lcGFU-0002yg-Ax
 for qemu-arm@nongnu.org; Thu, 29 Apr 2021 19:39:14 -0400
Received: by mail-qt1-x82f.google.com with SMTP id l1so10707831qtr.12
 for <qemu-arm@nongnu.org>; Thu, 29 Apr 2021 16:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1WjyilCHrOCoe9btRhUkYLzDH7J/V+a56/cnVBX3G5A=;
 b=Rh+HLeGg+qIfhjUWrk/kr+lwnbjpAV21O8XxRJf169qFchSYzghlH7pl8EJ4pAddPv
 Y4xF/pWliVy525BupkyP0gS7JXvHX6tHregq8DxWMWtP3KHzqw5XqcJmyKvbZZ4jGoru
 qoIgwjyXN5NT7iseofnfACRB31kedDvGWyMkkAhHSHagZZiLewAogyibcTFr2K/BVoUL
 GnlY4+n3vtxmOVSH7CVXII/iH8SyzyqaNi7XfqA4ugjLLYMUqhhZfeEW5aSyp20HyuD5
 FuyatYqDlFwBo2hLyjjxg4ZuwrGGEUv2PNqSnaorW4YyQ7AjXijN+oC+Id0CSldZNIur
 2IyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1WjyilCHrOCoe9btRhUkYLzDH7J/V+a56/cnVBX3G5A=;
 b=BzRyq9w0ytZzjdL4nqQuqO8CvHh/837N1nbWI9t6f95sKz47DRJ9+HfqP/v1vrwQrs
 ysZODpA0Ul1JILxHe/0tWSWxB9+dsQOuBuVi7l+9jhWIeqr8V3HOLdSa8LOJ41lUoMDr
 vSrglJd7hfvbPx64FoJ/l+lMSajeWV1xATchx/PbVve80u41znpZQb+7fy5PIuf9tNbC
 Laux9EaTmb+cy1VoMBbqYYjMyf7QgfAi6tQml96dTi8WcHjT3TpjVE8IbLD8KbfAYzOe
 x+LgWQheeaoCZcVL1k3/GT6c5gqWnZeywU5Lw14/0RTkwpikpYb5/wKuDdNBLVUJGQXn
 Cq+Q==
X-Gm-Message-State: AOAM5327Cahh+H5DA3+2UfRyNHpDcRUV25pOtGK78ApBFynFF0zE2ZVw
 zwZIDHOfmFNxigWHJjaWTgCIPg==
X-Received: by 2002:ac8:5d52:: with SMTP id g18mr2002080qtx.380.1619739549796; 
 Thu, 29 Apr 2021 16:39:09 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-23-174-92-28-28.dsl.bell.ca. [174.92.28.28])
 by smtp.gmail.com with ESMTPSA id v19sm131997qkp.65.2021.04.29.16.39.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 16:39:09 -0700 (PDT)
Message-ID: <1e49836d3b2d0525ee69053ec50c98ace1cd35db.camel@linaro.org>
Subject: Re: [PATCH v2 5/8] hw/intc: GICv3 ITS Feature enablement
From: shashi.mallela@linaro.org
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Apr 2021 19:39:08 -0400
In-Reply-To: <CAFEAcA_ppzeWMaViry4LrLCVjJVHwChTu3d5J3bZLxZ7wK8TRg@mail.gmail.com>
References: <20210401024152.203896-1-shashi.mallela@linaro.org>
 <20210401024152.203896-6-shashi.mallela@linaro.org>
 <CAFEAcA_ppzeWMaViry4LrLCVjJVHwChTu3d5J3bZLxZ7wK8TRg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-14.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qt1-x82f.google.com
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
X-TUID: sa7T+QA6qnub

On Mon, 2021-04-19 at 11:51 +0100, Peter Maydell wrote:
> On Thu, 1 Apr 2021 at 03:41, Shashi Mallela <
> shashi.mallela@linaro.org> wrote:
> > Added properties to enable ITS feature and define qemu system
> > address space memory in gicv3 common,setup distributor and
> > redistributor registers to indicate LPI support.
> > 
> > Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> > ---
> >  hw/intc/arm_gicv3_common.c         | 16 ++++++++++++++++
> >  hw/intc/arm_gicv3_dist.c           | 22 ++++++++++++++++++++--
> >  hw/intc/arm_gicv3_redist.c         | 28 +++++++++++++++++++++++++-
> > --
> >  hw/intc/gicv3_internal.h           | 17 +++++++++++++++++
> >  include/hw/intc/arm_gicv3_common.h |  8 ++++++++
> >  5 files changed, 86 insertions(+), 5 deletions(-)
> > 
> > diff --git a/hw/intc/arm_gicv3_common.c
> > b/hw/intc/arm_gicv3_common.c
> > index 58ef65f589..3bfc52f7fa 100644
> > --- a/hw/intc/arm_gicv3_common.c
> > +++ b/hw/intc/arm_gicv3_common.c
> > @@ -156,6 +156,7 @@ static const VMStateDescription
> > vmstate_gicv3_cpu = {
> >          VMSTATE_UINT32(gicr_waker, GICv3CPUState),
> >          VMSTATE_UINT64(gicr_propbaser, GICv3CPUState),
> >          VMSTATE_UINT64(gicr_pendbaser, GICv3CPUState),
> > +        VMSTATE_BOOL(lpi_outofrange, GICv3CPUState),
> >          VMSTATE_UINT32(gicr_igroupr0, GICv3CPUState),
> >          VMSTATE_UINT32(gicr_ienabler0, GICv3CPUState),
> >          VMSTATE_UINT32(gicr_ipendr0, GICv3CPUState),
> > @@ -227,6 +228,7 @@ static const VMStateDescription vmstate_gicv3 =
> > {
> >      .priority = MIG_PRI_GICV3,
> >      .fields = (VMStateField[]) {
> >          VMSTATE_UINT32(gicd_ctlr, GICv3State),
> > +        VMSTATE_UINT32(gicd_typer, GICv3State),
> >          VMSTATE_UINT32_ARRAY(gicd_statusr, GICv3State, 2),
> >          VMSTATE_UINT32_ARRAY(group, GICv3State, GICV3_BMP_SIZE),
> >          VMSTATE_UINT32_ARRAY(grpmod, GICv3State, GICV3_BMP_SIZE),
> 
> You can't add fields to an existing VMStateDescription like this
> without extra effort to handle migration compatibility.
> What are we trying to achieve with the extra fields?
> GICD_TYPER is read-only, I think.
> I don't think we need an lpi_outofrange flag: we should just
> naturally
> handle this as part of working with the GITR_PROPBASER.IDbits field.
> 
> Removed all fields to VMStateDescription,handled as part of working 
> with GITR_PROPBASER.IDbits field
>
> > @@ -381,6 +383,16 @@ static void
> > arm_gicv3_common_realize(DeviceState *dev, Error **errp)
> >              (1 << 24) |
> >              (i << 8) |
> >              (last << 4);
> > +
> > +        if (s->lpi_enable) {
> > +            s->cpu[i].gicr_typer |= GICR_TYPER_PLPIS;
> > +
> > +            if (!s->sysmem) {
> > +                error_setg(errp,
> > +                    "Redist-ITS: Guest 'sysmem' reference link not
> > set");
> > +                return;
> > +            }
> > +        }
> >      }
> >  }
> > 
> > @@ -406,6 +418,7 @@ static void arm_gicv3_common_reset(DeviceState
> > *dev)
> >          cs->gicr_waker = GICR_WAKER_ProcessorSleep |
> > GICR_WAKER_ChildrenAsleep;
> >          cs->gicr_propbaser = 0;
> >          cs->gicr_pendbaser = 0;
> > +        cs->lpi_outofrange = false;
> >          /* If we're resetting a TZ-aware GIC as if secure firmware
> >           * had set it up ready to start a kernel in non-secure, we
> >           * need to set interrupts to group 1 so the kernel can use
> > them.
> > @@ -494,9 +507,12 @@ static Property arm_gicv3_common_properties[]
> > = {
> >      DEFINE_PROP_UINT32("num-cpu", GICv3State, num_cpu, 1),
> >      DEFINE_PROP_UINT32("num-irq", GICv3State, num_irq, 32),
> >      DEFINE_PROP_UINT32("revision", GICv3State, revision, 3),
> > +    DEFINE_PROP_BOOL("has-lpi", GICv3State, lpi_enable, 0),
> >      DEFINE_PROP_BOOL("has-security-extensions", GICv3State,
> > security_extn, 0),
> >      DEFINE_PROP_ARRAY("redist-region-count", GICv3State,
> > nb_redist_regions,
> >                        redist_region_count, qdev_prop_uint32,
> > uint32_t),
> > +    DEFINE_PROP_LINK("sysmem", GICv3State, sysmem,
> > TYPE_MEMORY_REGION,
> > +                     MemoryRegion *),
> >      DEFINE_PROP_END_OF_LIST(),
> >  };
> > 
> > diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
> > index b65f56f903..96a317a8ef 100644
> > --- a/hw/intc/arm_gicv3_dist.c
> > +++ b/hw/intc/arm_gicv3_dist.c
> > @@ -366,12 +366,15 @@ static MemTxResult gicd_readl(GICv3State *s,
> > hwaddr offset,
> >          return MEMTX_OK;
> >      case GICD_TYPER:
> >      {
> > +        bool lpi_supported = false;
> >          /* For this implementation:
> >           * No1N == 1 (1-of-N SPI interrupts not supported)
> >           * A3V == 1 (non-zero values of Affinity level 3
> > supported)
> >           * IDbits == 0xf (we support 16-bit interrupt identifiers)
> >           * DVIS == 0 (Direct virtual LPI injection not supported)
> > -         * LPIS == 0 (LPIs not supported)
> > +         * LPIS == 1 (LPIs are supported if affinity routing is
> > enabled)
> > +         * num_LPIs == 0b00000 (bits [15:11],Number of LPIs as
> > indicated
> > +         *                      by GICD_TYPER.IDbits)
> 
> We support LPIs, but we have none ? That doesn't sound right, and
> it's
> not what the code below reports.
> The interpretation as per spec here is that number of LPIs indication
> comes from GICD_TYPER.IDbits with bits being set to 0b00000
> 
> >           * MBIS == 0 (message-based SPIs not supported)
> >           * SecurityExtn == 1 if security extns supported
> >           * CPUNumber == 0 since for us ARE is always 1
> > @@ -385,8 +388,23 @@ static MemTxResult gicd_readl(GICv3State *s,
> > hwaddr offset,
> >           */
> >          bool sec_extn = !(s->gicd_ctlr & GICD_CTLR_DS);
> > 
> > +        /*
> > +         * With securityextn on,LPIs are supported when affinity
> > routing
> 
> (missing space after comma)
> 
> > +         * is enabled for non-secure state and if off LPIs are
> > supported
> > +         * when affinity routing is enabled.
> > +         */
> > +        if (s->lpi_enable) {
> > +            if (sec_extn) {
> > +                lpi_supported = (s->gicd_ctlr & GICD_CTLR_ARE_NS);
> > +            } else {
> > +                lpi_supported = (s->gicd_ctlr & GICD_CTLR_ARE);
> > +            }
> > +        }
> > +
> >          *data = (1 << 25) | (1 << 24) | (sec_extn << 10) |
> > -            (0xf << 19) | itlinesnumber;
> > +            (lpi_supported << GICD_TYPER_LPIS_OFFSET) |
> > (GICD_TYPER_IDBITS <<
> > +            GICD_TYPER_IDBITS_OFFSET) | itlinesnumber;
> > +        s->gicd_typer = *data;
> >          return MEMTX_OK;
> >      }
> >      case GICD_IIDR:
> > diff --git a/hw/intc/arm_gicv3_redist.c
> > b/hw/intc/arm_gicv3_redist.c
> > index 8645220d61..325b974e70 100644
> > --- a/hw/intc/arm_gicv3_redist.c
> > +++ b/hw/intc/arm_gicv3_redist.c
> > @@ -248,10 +248,16 @@ static MemTxResult gicr_writel(GICv3CPUState
> > *cs, hwaddr offset,
> >      case GICR_CTLR:
> >          /* For our implementation, GICR_TYPER.DPGS is 0 and so all
> >           * the DPG bits are RAZ/WI. We don't do anything
> > asynchronously,
> > -         * so UWP and RWP are RAZ/WI. And GICR_TYPER.LPIS is 0 (we
> > don't
> > -         * implement LPIs) so Enable_LPIs is RES0. So there are no
> > writable
> > -         * bits for us.
> > +         * so UWP and RWP are RAZ/WI. GICR_TYPER.LPIS is 1 (we
> > +         * implement LPIs) so Enable_LPIs is programmable.
> >           */
> > +        if (cs->gicr_typer & GICR_TYPER_PLPIS) {
> > +            if (value & GICR_CTLR_ENABLE_LPIS) {
> > +                cs->gicr_ctlr |= GICR_CTLR_ENABLE_LPIS;
> > +            } else {
> > +                cs->gicr_ctlr &= ~GICR_CTLR_ENABLE_LPIS;
> > +            }
> > +        }
> >          return MEMTX_OK;
> >      case GICR_STATUSR:
> >          /* RAZ/WI for our implementation */
> > @@ -275,6 +281,14 @@ static MemTxResult gicr_writel(GICv3CPUState
> > *cs, hwaddr offset,
> >          cs->gicr_waker = value;
> >          return MEMTX_OK;
> >      case GICR_PROPBASER:
> > +        if (FIELD_EX64(value, GICR_PROPBASER, IDBITS) <
> > +            GICR_PROPBASER_IDBITS_THRESHOLD) {
> > +            cs->lpi_outofrange = true;
> 
> I don't think you should need to special case this. It just means
> "turns out
> that the LPI table is effectively zero length". When code doing LPI
> table
> lookups calculates the LPI table size (which it needs to do anyway)
> it can
> just catch the "turns out to be negative" case then.
> 
> > +        }
> > +        if (FIELD_EX64(value, GICR_PROPBASER, IDBITS) >
> > GICD_TYPER_IDBITS) {
> > +            value &= ~R_GICR_PROPBASER_IDBITS_MASK;
> > +            value |= GICD_TYPER_IDBITS;
> > +        }
> 
> This isn't what the spec says happens. It says that if the value the
> guest writes
> in this field is larger than GICD_TYPER.IDbits, then the
> GICD_TYPER.IDBits value
> applies. That doesn't mean the value reads back as GICD_TYPER.IDBits.
> 
> How you want to handle this depends on what's going on, but it
> probably mostly
> looks like "code that cares about GICR_PROPBASER.IDBits will do
> MIN(field_value, GICD_TYPER_IDBITS) to find the effective value of
> the field".
> 
> >          cs->gicr_propbaser = deposit64(cs->gicr_propbaser, 0, 32,
> > value);
> >          return MEMTX_OK;
> >      case GICR_PROPBASER + 4:
> > @@ -397,6 +411,14 @@ static MemTxResult gicr_writell(GICv3CPUState
> > *cs, hwaddr offset,
> >  {
> >      switch (offset) {
> >      case GICR_PROPBASER:
> > +        if (FIELD_EX64(value, GICR_PROPBASER, IDBITS) <
> > +            GICR_PROPBASER_IDBITS_THRESHOLD) {
> > +            cs->lpi_outofrange = true;
> > +        }
> > +        if (FIELD_EX64(value, GICR_PROPBASER, IDBITS) >
> > GICD_TYPER_IDBITS) {
> > +            value &= ~R_GICR_PROPBASER_IDBITS_MASK;
> > +            value |= GICD_TYPER_IDBITS;
> > +        }
> 
> Same comments as above.
> 
> >          cs->gicr_propbaser = value;
> >          return MEMTX_OK;
> >      case GICR_PENDBASER:
> > diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
> > index e9f9aa6722..a2718704d4 100644
> > --- a/hw/intc/gicv3_internal.h
> > +++ b/hw/intc/gicv3_internal.h
> > @@ -68,6 +68,9 @@
> >  #define GICD_CTLR_E1NWF             (1U << 7)
> >  #define GICD_CTLR_RWP               (1U << 31)
> > 
> > +#define GICD_TYPER_LPIS_OFFSET         17
> > +#define GICD_TYPER_IDBITS_OFFSET       19
> > +#define GICD_TYPER_IDBITS_MASK       0x1f
> >  /* 16 bits EventId */
> >  #define GICD_TYPER_IDBITS            0xf
> > 
> > @@ -126,6 +129,20 @@
> >  #define GICR_WAKER_ProcessorSleep    (1U << 1)
> >  #define GICR_WAKER_ChildrenAsleep    (1U << 2)
> > 
> > +FIELD(GICR_PROPBASER, IDBITS, 0, 5)
> > +FIELD(GICR_PROPBASER, INNERCACHE, 7, 3)
> > +FIELD(GICR_PROPBASER, SHAREABILITY, 10, 2)
> > +FIELD(GICR_PROPBASER, PHYADDR, 12, 40)
> > +FIELD(GICR_PROPBASER, OUTERCACHE, 56, 3)
> > +
> > +#define GICR_PROPBASER_IDBITS_THRESHOLD          0xd
> > +
> > +FIELD(GICR_PENDBASER, INNERCACHE, 7, 3)
> > +FIELD(GICR_PENDBASER, SHAREABILITY, 10, 2)
> > +FIELD(GICR_PENDBASER, PHYADDR, 16, 36)
> > +FIELD(GICR_PENDBASER, OUTERCACHE, 56, 3)
> > +FIELD(GICR_PENDBASER, PTZ, 62, 1)
> > +
> >  #define ICC_CTLR_EL1_CBPR           (1U << 0)
> >  #define ICC_CTLR_EL1_EOIMODE        (1U << 1)
> >  #define ICC_CTLR_EL1_PMHE           (1U << 6)
> > diff --git a/include/hw/intc/arm_gicv3_common.h
> > b/include/hw/intc/arm_gicv3_common.h
> > index 3a710592a9..db3989484d 100644
> > --- a/include/hw/intc/arm_gicv3_common.h
> > +++ b/include/hw/intc/arm_gicv3_common.h
> > @@ -175,6 +175,13 @@ struct GICv3CPUState {
> >      uint32_t gicr_nsacr;
> >      uint8_t gicr_ipriorityr[GIC_INTERNAL];
> > 
> > +    /*
> > +     * flag to indicate LPIs are out of range
> > +     * since IDbits from GICR_PROPBASER is less
> > +     * than 0b1101
> > +     */
> > +    bool lpi_outofrange;
> > +
> >      /* CPU interface */
> >      uint64_t icc_sre_el1;
> >      uint64_t icc_ctlr_el1[2];
> > @@ -221,6 +228,7 @@ struct GICv3State {
> >      uint32_t num_cpu;
> >      uint32_t num_irq;
> >      uint32_t revision;
> > +    bool lpi_enable;
> >      bool security_extn;
> >      bool irq_reset_nonsecure;
> >      bool gicd_no_migration_shift_bug;
> 
> thanks
> -- PMM

