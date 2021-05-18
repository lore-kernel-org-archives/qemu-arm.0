Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp542006lfm;
        Tue, 18 May 2021 08:59:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzeayB/auhPPYGsiJQSrXOF8EmG6nALQsfucSHY7FBXLml+AME5EU6LRI/ym3z7OVJZwgf
X-Received: by 2002:a05:6e02:1067:: with SMTP id q7mr4767184ilj.75.1621353550226;
        Tue, 18 May 2021 08:59:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621353550; cv=none;
        d=google.com; s=arc-20160816;
        b=Zwf6TAVz0D/fN4wDFP3aXjb5YCUFgdskd9iJCQRQkAwfwh1vdFIvpRSw7tB0gTFtpw
         SUFBvrGWJzM3z2iuT9RIuz9lpdcvCeaeQ9TziiBiOknxpFAlakZECcIhJ6NOwmhnHi+l
         5+AgFkO5EPDcgSdbL3CrIUvfJsJOJdPqPoCiYNnFy74vI8osqY2Xjh2t1SUM39sBVB8l
         m3qtLfOS6dpKdjrKDtGdjDW4OPhwir6KHF6C/PKlncAuFjRlZdXVWVBvGqzIfClnwUU4
         wz6m+cpMualQaEA7GoTbDRywKdE8XRXXTYApZKZc4q7xyO7kROsBknO4AcX5/FndtHuo
         tRJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R/hdlsVpjmzcWnU07XucMjZ5sAkI2JYQ9nis2tIoq4g=;
        b=pE/TQBY90TvebRvJPdm4jZE8lQja0cWp0le0FN7aj4WVqpER3ESkktwzjXMVzd8EOb
         sURS1q3JDW6SUwR+GY/rZXdGThujA8kCk/rj4TEg/WMY72vygG8e8Y/W62BChUxyFFLZ
         JV9ArchBnPD6LUahuKBf4PJQ49AhLs+yR/YGmS+ihNkEqKFm4LQ5BtxEjdu3M8yCrgmL
         fsSLGdO/L4ZnP1g+5yoxs0pX7Wm2C3C6Q796RPGAWUvEvassmJJ3I2fi/4rWaiViBZ6A
         uDA4cBo/eD0rEa/ql353GdA9N9hqc/3JyliuF7azkhbZD5BibeouSiDKltgyVJxwZUfG
         Hw1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uE23TwbT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b5si9976027ile.22.2021.05.18.08.59.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 May 2021 08:59:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uE23TwbT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lj27h-0003q1-HQ
	for alex.bennee@linaro.org; Tue, 18 May 2021 11:59:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lj27H-0003nH-A8
 for qemu-arm@nongnu.org; Tue, 18 May 2021 11:58:43 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:42942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lj27F-00070P-4g
 for qemu-arm@nongnu.org; Tue, 18 May 2021 11:58:42 -0400
Received: by mail-ej1-x62c.google.com with SMTP id lg14so15376032ejb.9
 for <qemu-arm@nongnu.org>; Tue, 18 May 2021 08:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R/hdlsVpjmzcWnU07XucMjZ5sAkI2JYQ9nis2tIoq4g=;
 b=uE23TwbTb8WL14zcSUDeDP/0PhNnR1Y7pXiSXZRPAK056yy/IX+hMnCWANsAoPE018
 ZGNZxYB4/h0MdJV8Ij5WRnmQvPXFNLO3o1uLIMYIf47OOo8OZsxfy+QI+lfuY10RGMjj
 aABIY66HWmax1eZGkNBmYwMsS0OimdQvzXBcygotdRqFzn9PentaC08AB/XQYXMiTvnY
 gVV54Cd8pPsU75iHwP6aqhXvq18H3UFz7FU8/k344Uq8vevooyhduZjy9rigGdgJSXSB
 Fj1k8LuNylXeNXY+CnuCGeYo/qHIJPHFUtjPAC4SUYrKcR971rr2ndCzoDusPA+r5PkH
 fL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R/hdlsVpjmzcWnU07XucMjZ5sAkI2JYQ9nis2tIoq4g=;
 b=R0hCp3MdTGK3iyzZ2OKmqG54kjnb6Rje5tzpu1GQEjboA0B87FWTOaYR41jyq8mkHq
 YBjeE7blVsDCShxXNtJY20DpkSzIdRVldeFiHfdB4sihN3nbCK928oQzIsLETIQddB9S
 /YXhEkAQDK1jO83N2uqfS8ckkq+7QF3nYf+tWpPTFVXOqqO6nsbVmx9jCF1oGwSZz9wF
 9KNP1f3/1+RnhmP8SaFuzz4o0PG2I0QYxQGJySByDFd3gaCZJ8sOPGCKZJhyz/7rpAsV
 HURBK8u03C6L2M7dOad2x2WdaX2PdGmQ30HGiozKFoiUl2QTB9FRqx457gWSPIjnfiH6
 VwkA==
X-Gm-Message-State: AOAM531yLEzzTaVyFWePymP3gu7cJWpwHwEBi2EA1eJ3NuA0mOdWSJsW
 z2ZP5eUo89eaIyq5N/e1syq9Ar0U9Y5Wpo11i6uX6A==
X-Received: by 2002:a17:906:bcd6:: with SMTP id
 lw22mr6911730ejb.250.1621353519103; 
 Tue, 18 May 2021 08:58:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210429234201.125565-1-shashi.mallela@linaro.org>
 <20210429234201.125565-6-shashi.mallela@linaro.org>
In-Reply-To: <20210429234201.125565-6-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 May 2021 16:58:22 +0100
Message-ID: <CAFEAcA8RRR04N4k0s1XEXDQVNa4r_n2T=Z4B00HHyJ5EPzD+tw@mail.gmail.com>
Subject: Re: [PATCH v3 5/8] hw/intc: GICv3 ITS Feature enablement
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
X-TUID: EqXTB4PQwqTb

On Fri, 30 Apr 2021 at 00:42, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Added properties to enable ITS feature and define qemu system
> address space memory in gicv3 common,setup distributor and
> redistributor registers to indicate LPI support.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---
>  hw/intc/arm_gicv3_common.c         | 13 +++++++++++++
>  hw/intc/arm_gicv3_dist.c           | 21 +++++++++++++++++++--
>  hw/intc/arm_gicv3_redist.c         | 30 +++++++++++++++++++++++++-----
>  hw/intc/gicv3_internal.h           | 17 +++++++++++++++++
>  include/hw/intc/arm_gicv3_common.h |  1 +
>  5 files changed, 75 insertions(+), 7 deletions(-)
>
> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
> index 58ef65f589..a55e91071a 100644
> --- a/hw/intc/arm_gicv3_common.c
> +++ b/hw/intc/arm_gicv3_common.c
> @@ -381,6 +381,16 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
>              (1 << 24) |
>              (i << 8) |
>              (last << 4);
> +
> +        if (s->lpi_enable) {
> +            s->cpu[i].gicr_typer |= GICR_TYPER_PLPIS;
> +
> +            if (!s->dma) {
> +                error_setg(errp,
> +                    "Redist-ITS: Guest 'sysmem' reference link not set");
> +                return;
> +            }
> +        }

Can you put the "if (s->lpi_enable && !s->dma)" error-exit further
up in the function with all the other error-checks, please? That way
we do all our error-handling before we start allocating memory and
doing other things.

>      }
>  }
>
> @@ -494,9 +504,12 @@ static Property arm_gicv3_common_properties[] = {
>      DEFINE_PROP_UINT32("num-cpu", GICv3State, num_cpu, 1),
>      DEFINE_PROP_UINT32("num-irq", GICv3State, num_irq, 32),
>      DEFINE_PROP_UINT32("revision", GICv3State, revision, 3),
> +    DEFINE_PROP_BOOL("has-lpi", GICv3State, lpi_enable, 0),
>      DEFINE_PROP_BOOL("has-security-extensions", GICv3State, security_extn, 0),
>      DEFINE_PROP_ARRAY("redist-region-count", GICv3State, nb_redist_regions,
>                        redist_region_count, qdev_prop_uint32, uint32_t),
> +    DEFINE_PROP_LINK("sysmem", GICv3State, dma, TYPE_MEMORY_REGION,
> +                     MemoryRegion *),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
> index b65f56f903..43e0ea4367 100644
> --- a/hw/intc/arm_gicv3_dist.c
> +++ b/hw/intc/arm_gicv3_dist.c
> @@ -366,12 +366,15 @@ static MemTxResult gicd_readl(GICv3State *s, hwaddr offset,
>          return MEMTX_OK;
>      case GICD_TYPER:
>      {
> +        bool lpi_supported = false;
>          /* For this implementation:
>           * No1N == 1 (1-of-N SPI interrupts not supported)
>           * A3V == 1 (non-zero values of Affinity level 3 supported)
>           * IDbits == 0xf (we support 16-bit interrupt identifiers)
>           * DVIS == 0 (Direct virtual LPI injection not supported)
> -         * LPIS == 0 (LPIs not supported)
> +         * LPIS == 1 (LPIs are supported if affinity routing is enabled)
> +         * num_LPIs == 0b00000 (bits [15:11],Number of LPIs as indicated
> +         *                      by GICD_TYPER.IDbits)
>           * MBIS == 0 (message-based SPIs not supported)
>           * SecurityExtn == 1 if security extns supported
>           * CPUNumber == 0 since for us ARE is always 1
> @@ -385,8 +388,22 @@ static MemTxResult gicd_readl(GICv3State *s, hwaddr offset,
>           */
>          bool sec_extn = !(s->gicd_ctlr & GICD_CTLR_DS);
>
> +        /*
> +         * With securityextn on, LPIs are supported when affinity routing
> +         * is enabled for non-secure state and if off LPIs are supported
> +         * when affinity routing is enabled.
> +         */
> +        if (s->lpi_enable) {
> +            if (sec_extn) {
> +                lpi_supported = (s->gicd_ctlr & GICD_CTLR_ARE_NS);
> +            } else {
> +                lpi_supported = (s->gicd_ctlr & GICD_CTLR_ARE);
> +            }
> +        }

For our implementation, affinity routing is always enabled, so you
don't need to make a distinction between s->lpi_enable and
lpi_supported.

> +
>          *data = (1 << 25) | (1 << 24) | (sec_extn << 10) |
> -            (0xf << 19) | itlinesnumber;
> +            (lpi_supported << GICD_TYPER_LPIS_OFFSET) | (GICD_TYPER_IDBITS <<
> +            GICD_TYPER_IDBITS_OFFSET) | itlinesnumber;

Don't break the line after << like this, please; it's much easier to read
if you break after '|' instead, because then the (...) bracketed
expression stays on one line rather than being split.

>          return MEMTX_OK;
>      }
>      case GICD_IIDR:
> diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
> index 8645220d61..7604ccdc83 100644
> --- a/hw/intc/arm_gicv3_redist.c
> +++ b/hw/intc/arm_gicv3_redist.c
> @@ -244,14 +244,22 @@ static MemTxResult gicr_readl(GICv3CPUState *cs, hwaddr offset,
>  static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
>                                 uint64_t value, MemTxAttrs attrs)
>  {
> +    uint64_t data;
> +
>      switch (offset) {
>      case GICR_CTLR:
>          /* For our implementation, GICR_TYPER.DPGS is 0 and so all
>           * the DPG bits are RAZ/WI. We don't do anything asynchronously,
> -         * so UWP and RWP are RAZ/WI. And GICR_TYPER.LPIS is 0 (we don't
> -         * implement LPIs) so Enable_LPIs is RES0. So there are no writable
> -         * bits for us.
> +         * so UWP and RWP are RAZ/WI. GICR_TYPER.LPIS is 1 (we
> +         * implement LPIs) so Enable_LPIs is programmable.
>           */
> +        if (cs->gicr_typer & GICR_TYPER_PLPIS) {
> +            if (value & GICR_CTLR_ENABLE_LPIS) {
> +                cs->gicr_ctlr |= GICR_CTLR_ENABLE_LPIS;
> +            } else {
> +                cs->gicr_ctlr &= ~GICR_CTLR_ENABLE_LPIS;
> +            }
> +        }
>          return MEMTX_OK;
>      case GICR_STATUSR:
>          /* RAZ/WI for our implementation */
> @@ -275,7 +283,12 @@ static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
>          cs->gicr_waker = value;
>          return MEMTX_OK;
>      case GICR_PROPBASER:
> -        cs->gicr_propbaser = deposit64(cs->gicr_propbaser, 0, 32, value);
> +        data = value;
> +        if (FIELD_EX64(data, GICR_PROPBASER, IDBITS) > GICD_TYPER_IDBITS) {
> +            data &= ~R_GICR_PROPBASER_IDBITS_MASK;
> +            data |= GICD_TYPER_IDBITS;
> +        }
> +        cs->gicr_propbaser = deposit64(cs->gicr_propbaser, 0, 32, data);

This is still wrong. On v2 I said:

# This isn't what the spec says happens. It says that if the value the
guest writes
# in this field is larger than GICD_TYPER.IDbits, then the
GICD_TYPER.IDBits value
# applies. That doesn't mean the value reads back as GICD_TYPER.IDBits.
#
# How you want to handle this depends on what's going on, but it probably mostly
# looks like "code that cares about GICR_PROPBASER.IDBits will do
# MIN(field_value, GICD_TYPER_IDBITS) to find the effective value of the field".

>          return MEMTX_OK;
>      case GICR_PROPBASER + 4:
>          cs->gicr_propbaser = deposit64(cs->gicr_propbaser, 32, 32, value);
> @@ -395,9 +408,16 @@ static MemTxResult gicr_readll(GICv3CPUState *cs, hwaddr offset,
>  static MemTxResult gicr_writell(GICv3CPUState *cs, hwaddr offset,
>                                  uint64_t value, MemTxAttrs attrs)
>  {
> +    uint64_t data;
> +
>      switch (offset) {
>      case GICR_PROPBASER:
> -        cs->gicr_propbaser = value;
> +        data = value;
> +        if (FIELD_EX64(data, GICR_PROPBASER, IDBITS) > GICD_TYPER_IDBITS) {
> +            data &= ~R_GICR_PROPBASER_IDBITS_MASK;
> +            data |= GICD_TYPER_IDBITS;
> +        }
> +        cs->gicr_propbaser = data;

Ditto.

thanks
-- PMM
