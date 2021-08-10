Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp1073886lff;
        Tue, 10 Aug 2021 00:36:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzX/KInf023nLzErpat4iuhZBe3ywqVRF7ORMzxS5vdY26gN2ukZBK5ePswSBTeW9YrXUWG
X-Received: by 2002:a5d:9304:: with SMTP id l4mr25967ion.167.1628580984710;
        Tue, 10 Aug 2021 00:36:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628580984; cv=none;
        d=google.com; s=arc-20160816;
        b=aWD1gQQk6kjgAQaz6nrfoFrsSfLqypZ8Z8RvOCASPG0Pw7fbEKnNF4z3Uln7AJaImV
         56QeF1aXG7GysmJYninXIq6FNocyTglX7FxuZbtCJKpJrMcZfwwu4GlXbB+Y8OaSykDI
         8ZZ1oOXJPhVUr6d/pcwhgSNt7nZ/uYrLQA+K93u69uHosZsKmSxAPP0GTWWc2TVVOgCr
         gMSnJYbWKV5ZLJbDoHwdK9N+/sXI4oWpmSA9P5puf6wnM8hfJetpLzrmVnr2zV0bF2a5
         Z1DYy0khQ+1+qD9m5I5DD1zGtxyIBSdqFseB6uKW17xMX7BUjvbzwI8y/wy5re9fuCGy
         iDcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:from:references:to:subject:dkim-signature;
        bh=KdXFc4zYqCH+H/MWQi4jvBQ/Zs5FgysBeyhgkrXeGFg=;
        b=SPFSz+uICsIP05tejZVsQrEwBd3D/CIqkpcN+aKjbq3/8/IB/37P4gj+iK58IieB/R
         AE4n84gL04hxoiUST8KZ0eSC9yRrda146kVqzoC95NY8+wtN1MLCRF/Nq/jAGeBWbBKK
         mHbsCN7hmOOcFUhsMqO2N+78EpX74R41WZtm/rNfWLqhPOWCTQj7vC4PKr/i5mx5apn9
         3L6rdiruZrtZxQy178E62YZolFwwyWep1tnNXO8odhv/y14aYIhg6/X/MB2K4Yld0yFU
         OQROl2mn4q0x1EOL2rX3g5ohCLReTx32DeBMLGZtMTi+EIpw+hvFV9Dsb+AKZewReQ4Z
         wv0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@baylibre-com.20150623.gappssmtp.com header.s=20150623 header.b=RmvwskPG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p6si23153947ilo.37.2021.08.10.00.36.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Aug 2021 00:36:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@baylibre-com.20150623.gappssmtp.com header.s=20150623 header.b=RmvwskPG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mDMJD-0001w1-SP
	for alex.bennee@linaro.org; Tue, 10 Aug 2021 03:36:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <narmstrong@baylibre.com>)
 id 1mDMIe-0001q7-Dt
 for qemu-arm@nongnu.org; Tue, 10 Aug 2021 03:35:49 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:40922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <narmstrong@baylibre.com>)
 id 1mDMIb-0005Fu-6R
 for qemu-arm@nongnu.org; Tue, 10 Aug 2021 03:35:48 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 k38-20020a05600c1ca6b029025af5e0f38bso1218504wms.5
 for <qemu-arm@nongnu.org>; Tue, 10 Aug 2021 00:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KdXFc4zYqCH+H/MWQi4jvBQ/Zs5FgysBeyhgkrXeGFg=;
 b=RmvwskPGJk4UWzfKeH5GF+xgjDYSlsyti8gdb3PyE1F+QgY0itVxm1mY7qs1yG0M1K
 6+DNu4dcPqpS9bN6xBBKjIpvlRV1fFSMdb/tfUerMHaC18+OyRZBNkJ5KK40GpjkOZWB
 wswRHI+TRfF8dtUNavutefc4We+DjGYHLNdbgqw+civI7qqaM9ax6Ey1SPe6DOZM0sFR
 alaah2UxkVHBpFP3qJ1nzonM0zfSRtD/8XlBh+acq1lxUy+U2qjB9wNuIt70CFX/nbej
 QA6huxr/5jOxxzuxU6SsKscRwZfYiB2zOaHDs1YEy3oM2oUJVor1HHstSNgHjfz8AqXk
 k/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=KdXFc4zYqCH+H/MWQi4jvBQ/Zs5FgysBeyhgkrXeGFg=;
 b=JZrZRJ+89TQeYkSb5JYFw18mWkIcXja/lavLPzQHfxVWjo/lcyYHh8YPf7JIHbEi5d
 ummAJQdcRKTVIAor2Ocjp/tj0p/fhe/GVr1mUtDjYRATS+pEvtlehWhgW76nuTXIbCxN
 Ywx0kgQTxnuxq5sH9q+2/7zfCJTMvEuPeYwJf7F0cvPLnWr4zeXaO1S46bAYAiTqnnCN
 6HWYvxHV6ZTKrW6C0IHBg1fvQw8ym2appafpEze+BdlKkn7EyK71owjs8Qcyt5st5zHo
 o1DFy1uqgUNPdjuvVRSQqJUUkyHCtiLRm8+slyTjIplwXcZjD3VIOwZLBJjXmCqzSapK
 BRKQ==
X-Gm-Message-State: AOAM532jVyR2cOoN51vsu4D3xxyDronzUGH0LFp6CnJwODorLpjJ3dlP
 Ys4rLOHRZpLTwG0Pmbyx7YC5rw==
X-Received: by 2002:a05:600c:210d:: with SMTP id
 u13mr11403638wml.57.1628580943011; 
 Tue, 10 Aug 2021 00:35:43 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:b710:2b6e:27aa:f0a0?
 ([2001:861:44c0:66c0:b710:2b6e:27aa:f0a0])
 by smtp.gmail.com with ESMTPSA id l41sm21954331wmp.23.2021.08.10.00.35.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 00:35:42 -0700 (PDT)
Subject: Re: [PATCH v7 05/10] hw/intc: GICv3 ITS Feature enablement
To: Shashi Mallela <shashi.mallela@linaro.org>, peter.maydell@linaro.org,
 leif@nuviainc.com, rad@semihalf.com, mst@redhat.com, imammedo@redhat.com
References: <20210805223002.144855-1-shashi.mallela@linaro.org>
 <20210805223002.144855-6-shashi.mallela@linaro.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <571784fd-cf1e-00f4-2822-172663029ac9@baylibre.com>
Date: Tue, 10 Aug 2021 09:35:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210805223002.144855-6-shashi.mallela@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=narmstrong@baylibre.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /bjxX8hSnnvt

On 06/08/2021 00:29, Shashi Mallela wrote:
> Added properties to enable ITS feature and define qemu system
> address space memory in gicv3 common,setup distributor and
> redistributor registers to indicate LPI support.
> 
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/arm_gicv3_common.c         | 12 ++++++++++++
>  hw/intc/arm_gicv3_dist.c           |  5 ++++-
>  hw/intc/arm_gicv3_redist.c         | 12 +++++++++---
>  hw/intc/gicv3_internal.h           |  2 ++
>  include/hw/intc/arm_gicv3_common.h |  1 +
>  5 files changed, 28 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
> index 58ef65f589..53dea2a775 100644
> --- a/hw/intc/arm_gicv3_common.c
> +++ b/hw/intc/arm_gicv3_common.c
> @@ -345,6 +345,11 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>  
> +    if (s->lpi_enable && !s->dma) {
> +        error_setg(errp, "Redist-ITS: Guest 'sysmem' reference link not set");
> +        return;
> +    }
> +
>      s->cpu = g_new0(GICv3CPUState, s->num_cpu);
>  
>      for (i = 0; i < s->num_cpu; i++) {
> @@ -381,6 +386,10 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
>              (1 << 24) |
>              (i << 8) |
>              (last << 4);
> +
> +        if (s->lpi_enable) {
> +            s->cpu[i].gicr_typer |= GICR_TYPER_PLPIS;
> +        }
>      }
>  }
>  
> @@ -494,9 +503,12 @@ static Property arm_gicv3_common_properties[] = {
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
> index b65f56f903..43128b376d 100644
> --- a/hw/intc/arm_gicv3_dist.c
> +++ b/hw/intc/arm_gicv3_dist.c
> @@ -371,7 +371,9 @@ static MemTxResult gicd_readl(GICv3State *s, hwaddr offset,
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
> @@ -386,6 +388,7 @@ static MemTxResult gicd_readl(GICv3State *s, hwaddr offset,
>          bool sec_extn = !(s->gicd_ctlr & GICD_CTLR_DS);
>  
>          *data = (1 << 25) | (1 << 24) | (sec_extn << 10) |
> +            (s->lpi_enable << GICD_TYPER_LPIS_SHIFT) |
>              (0xf << 19) | itlinesnumber;
>          return MEMTX_OK;
>      }
> diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
> index 53da703ed8..2108abfe9c 100644
> --- a/hw/intc/arm_gicv3_redist.c
> +++ b/hw/intc/arm_gicv3_redist.c
> @@ -248,10 +248,16 @@ static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
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
> diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
> index 1966444790..530d1c1789 100644
> --- a/hw/intc/gicv3_internal.h
> +++ b/hw/intc/gicv3_internal.h
> @@ -68,6 +68,8 @@
>  #define GICD_CTLR_E1NWF             (1U << 7)
>  #define GICD_CTLR_RWP               (1U << 31)
>  
> +#define GICD_TYPER_LPIS_SHIFT          17
> +
>  /* 16 bits EventId */
>  #define GICD_TYPER_IDBITS            0xf
>  
> diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
> index 0715b0bc2a..c1348cc60a 100644
> --- a/include/hw/intc/arm_gicv3_common.h
> +++ b/include/hw/intc/arm_gicv3_common.h
> @@ -221,6 +221,7 @@ struct GICv3State {
>      uint32_t num_cpu;
>      uint32_t num_irq;
>      uint32_t revision;
> +    bool lpi_enable;
>      bool security_extn;
>      bool irq_reset_nonsecure;
>      bool gicd_no_migration_shift_bug;
> 


Tested with in-review Zephyr ITS implementation at https://github.com/zephyrproject-rtos/zephyr/pull/37506

Tested-by: Neil Armstrong <narmstrong@baylibre.com>
