Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1297070lfy;
        Wed, 12 Aug 2020 03:32:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLCYGcHnaMI/7YpqubtNvhvLOB//iT3YH7ZLjHno6gi2b1i6sMWswc0ALzxrrY+F1ur6Kn
X-Received: by 2002:a25:cfcc:: with SMTP id f195mr53807844ybg.390.1597228324440;
        Wed, 12 Aug 2020 03:32:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597228324; cv=none;
        d=google.com; s=arc-20160816;
        b=ecd93kl0B1+31YRLCIPucfe6xF3yvUs23QVl0y+yPo5kEUKvNmxU+lVs4Fx7NPPiSB
         2xerp4ztYKt5yE4wHLSQqiR1/KBZzov99GQVhPpclhKTntiOqtXKXPsDTs59j0yfdCEc
         3FYA4/GQf/bZXt4zDFUFKDe7/xjX1typgUNj67AckIU8zuZ6KZwvrw9EGMQXpeizZxXk
         VgQ6o+nrcIoRYMqbeI/iA9MKODVH1vArEBKpMDvz05EFZuI2LI8//W88Cy9ejxqR/weE
         ziMS93U+8gmryzMWyn3iYoOkVSXkt2ayWSTl2+HeCik4J046AcA284sIallLpcF9jmjj
         lGgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ScfobHQJDFjFUJ+xo4RJsyde1sz0FSswHatF+EvBWJA=;
        b=Ib/cBvs2gm00Nj9KPEnCG1/L7GKVHy2vRPYA5b1KKO+8aYHfsggvtcsjotSE+BDvYQ
         InwNddPvN2GS2z5KaBts/50+kUgHGCJ4DZq+cZQdEwfUA95vRIgCWWqh06UJXGv4e+w9
         b0/+R2x0o5iGS+cwwaj5qfDvou0yKJu+JEMACGefcO2Zj+rA43ecFgXnvBuXN5Tc8nqE
         2ovVfK+nBfgAhe34GN4mhD+V2D1Kp3KYsiAhYFIciGQFI7+VGPZMlDwnqMOxnMZ7UAIZ
         Cu+uX08ZC3KxnFFOxKnBSV5hwdyOBrRrg//RGnJfr9fna013wWXOr1F3baxVX1KC0Kgx
         A2SQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eUfljrbj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x2si1747440ybs.364.2020.08.12.03.32.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Aug 2020 03:32:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eUfljrbj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:43494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k5o39-0008Aw-PC
	for alex.bennee@linaro.org; Wed, 12 Aug 2020 06:32:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k5o30-00089h-Qw; Wed, 12 Aug 2020 06:31:54 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:36774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k5o2z-0005Fn-1z; Wed, 12 Aug 2020 06:31:54 -0400
Received: by mail-wr1-x442.google.com with SMTP id 88so1538752wrh.3;
 Wed, 12 Aug 2020 03:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ScfobHQJDFjFUJ+xo4RJsyde1sz0FSswHatF+EvBWJA=;
 b=eUfljrbjb+vTqtxLDoq1KGxmivo3KzzofzAA29uu96czutTKuZ6eGe4mK/W2OLJ5Nk
 uiptW6knJ/6Ad/hYB/YoIMcNXSWIz6luMoRXkbgZbPeKcNpGvbYkDNv0ptEYzuQHqgBO
 e90jQ40wBM3zh0W73F8WQPGzrDUXZqxQZ+415cx96/5lsjaOKS6++pHfDfa2fIQZzuXZ
 ApAAYhyFgLHagMleqECiSt4XKIOR9m1KiDRssMLV3bGiyOZmXiyjZ8kMWWMUj+cJMrYJ
 dIT6RxfV6qqzEpQdDP+4fhnE3Vdsysb4/SY4O9sseAvlnDwE0E6fTVd/frIJ/Q0KbQY3
 EGdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ScfobHQJDFjFUJ+xo4RJsyde1sz0FSswHatF+EvBWJA=;
 b=c7t57nJ3M94Af0kRp0J5unJeLCmfBknsFeScHa0BVvtYXsVAAAKEsLG7sVMZi0ik55
 FkyFGj7llWSJMZjZnI7QOg6hhMvv9LEUBZsf44PR5bSzTEQlYpIw+PCu06HkdXRcOv4a
 9pNxXJJYCmywAGIvJl3N5Pjutu00mhTR4nXK/lmYRuOZrjH5UIohwoPXQ9tZZ0uONky1
 jeupucRbUFLZEPRimovV+nr/Lo14nqxKXinamZzigw/3Y+jLn3250cySwIIta+oABSgu
 KUdujtuji2jvdBUamyO4G8wI2U9C6agsYcdVKhGy9b3AmKzd7aCUr8cpbABSQShWxOv3
 7xHg==
X-Gm-Message-State: AOAM530s20GVt7Y518fym9m0vA/TJv4/P1As+/CmM5dU4aujSXEBYF7q
 fnmdqFo1Fsqng0uRS7psFFM=
X-Received: by 2002:adf:f247:: with SMTP id b7mr35066581wrp.128.1597228310716; 
 Wed, 12 Aug 2020 03:31:50 -0700 (PDT)
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id o124sm3287375wmb.2.2020.08.12.03.31.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2020 03:31:49 -0700 (PDT)
Subject: Re: [PATCH v7 02/13] hw/misc: Add NPCM7xx Clock Controller device
 model
To: Havard Skinnemoen <hskinnemoen@google.com>, peter.maydell@linaro.org,
 clg@kaod.org, joel@jms.id.au
References: <20200811004607.2133149-1-hskinnemoen@google.com>
 <20200811004607.2133149-3-hskinnemoen@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8693d89d-0515-caba-613f-771db0659a0b@amsat.org>
Date: Wed, 12 Aug 2020 12:31:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200811004607.2133149-3-hskinnemoen@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: kfting@nuvoton.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Avi.Fishman@nuvoton.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HEft3x6e0rE0

On 8/11/20 2:45 AM, Havard Skinnemoen wrote:
> Enough functionality to boot the Linux kernel has been implemented. This
> includes:
> 
>   - Correct power-on reset values so the various clock rates can be
>     accurately calculated.
>   - Clock enables stick around when written.
> 
> In addition, a best effort attempt to implement SECCNT and CNTR25M was
> made even though I don't think the kernel needs them.
> 
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
> ---
>  hw/misc/Makefile.objs         |   1 +
>  hw/misc/npcm7xx_clk.c         | 234 ++++++++++++++++++++++++++++++++++
>  hw/misc/trace-events          |   4 +
>  include/hw/misc/npcm7xx_clk.h |  72 +++++++++++
>  4 files changed, 311 insertions(+)
>  create mode 100644 hw/misc/npcm7xx_clk.c
>  create mode 100644 include/hw/misc/npcm7xx_clk.h
> 
> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> index e00b839f03..9a73c1f77f 100644
> --- a/hw/misc/Makefile.objs
> +++ b/hw/misc/Makefile.objs
> @@ -51,6 +51,7 @@ common-obj-$(CONFIG_IMX) += imx_rngc.o
>  common-obj-$(CONFIG_MILKYMIST) += milkymist-hpdmc.o
>  common-obj-$(CONFIG_MILKYMIST) += milkymist-pfpu.o
>  common-obj-$(CONFIG_MAINSTONE) += mst_fpga.o
> +common-obj-$(CONFIG_NPCM7XX) += npcm7xx_clk.o
>  common-obj-$(CONFIG_NPCM7XX) += npcm7xx_gcr.o
>  common-obj-$(CONFIG_OMAP) += omap_clk.o
>  common-obj-$(CONFIG_OMAP) += omap_gpmc.o
> diff --git a/hw/misc/npcm7xx_clk.c b/hw/misc/npcm7xx_clk.c
> new file mode 100644
> index 0000000000..55beecc06f
> --- /dev/null
> +++ b/hw/misc/npcm7xx_clk.c
[...]
> +static void npcm7xx_clk_init(Object *obj)
> +{
> +    NPCM7xxCLKState *s = NPCM7XX_CLK(obj);
> +
> +    memory_region_init_io(&s->iomem, obj, &npcm7xx_clk_ops, s,
> +                          TYPE_NPCM7XX_CLK, 4 * KiB);
> +    sysbus_init_mmio(&s->parent, &s->iomem);
> +}
> +
> +static const VMStateDescription vmstate_npcm7xx_clk = {
> +    .name = "npcm7xx-clk",
> +    .version_id = 0,
> +    .minimum_version_id = 0,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32_ARRAY(regs, NPCM7xxCLKState, NPCM7XX_CLK_NR_REGS),

I wonder if this won't be a migration problem later if you add more
entries to NPCM7xxCLKRegisters...

> +        VMSTATE_INT64(ref_ns, NPCM7xxCLKState),
> +        VMSTATE_END_OF_LIST(),
> +    },
> +};
> +
> +static void npcm7xx_clk_class_init(ObjectClass *klass, void *data)
> +{
> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->desc = "NPCM7xx Clock Control Registers";
> +    dc->vmsd = &vmstate_npcm7xx_clk;
> +    rc->phases.enter = npcm7xx_clk_enter_reset;
> +}
> +
> +static const TypeInfo npcm7xx_clk_info = {
> +    .name               = TYPE_NPCM7XX_CLK,
> +    .parent             = TYPE_SYS_BUS_DEVICE,
> +    .instance_size      = sizeof(NPCM7xxCLKState),
> +    .instance_init      = npcm7xx_clk_init,
> +    .class_init         = npcm7xx_clk_class_init,
> +};
> +
> +static void npcm7xx_clk_register_type(void)
> +{
> +    type_register_static(&npcm7xx_clk_info);
> +}
> +type_init(npcm7xx_clk_register_type);
> diff --git a/hw/misc/trace-events b/hw/misc/trace-events
> index dbf90db8ed..a010699b4f 100644
> --- a/hw/misc/trace-events
> +++ b/hw/misc/trace-events
> @@ -111,6 +111,10 @@ mos6522_set_sr_int(void) "set sr_int"
>  mos6522_write(uint64_t addr, uint64_t val) "reg=0x%"PRIx64 " val=0x%"PRIx64
>  mos6522_read(uint64_t addr, unsigned val) "reg=0x%"PRIx64 " val=0x%x"
>  
> +# npcm7xx_clk.c
> +npcm7xx_clk_read(uint64_t offset, uint32_t value) " offset: 0x%04" PRIx64 " value: 0x%08" PRIx32
> +npcm7xx_clk_write(uint64_t offset, uint32_t value) "offset: 0x%04" PRIx64 " value: 0x%08" PRIx32
> +
>  # npcm7xx_gcr.c
>  npcm7xx_gcr_read(uint64_t offset, uint32_t value) " offset: 0x%04" PRIx64 " value: 0x%08" PRIx32
>  npcm7xx_gcr_write(uint64_t offset, uint32_t value) "offset: 0x%04" PRIx64 " value: 0x%08" PRIx32
> diff --git a/include/hw/misc/npcm7xx_clk.h b/include/hw/misc/npcm7xx_clk.h
> new file mode 100644
> index 0000000000..40ed64ff15
> --- /dev/null
> +++ b/include/hw/misc/npcm7xx_clk.h
> @@ -0,0 +1,72 @@
> +/*
> + * Nuvoton NPCM7xx Clock Control Registers.
> + *
> + * Copyright 2020 Google LLC
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
> + * for more details.
> + */
> +#ifndef NPCM7XX_CLK_H
> +#define NPCM7XX_CLK_H
> +
> +#include "exec/memory.h"
> +#include "hw/sysbus.h"
> +
> +/*
> + * The reference clock frequency for the timer modules, and the SECCNT and
> + * CNTR25M registers in this module, is always 25 MHz.
> + */
> +#define NPCM7XX_TIMER_REF_HZ            (25000000)
> +
> +enum NPCM7xxCLKRegisters {
> +    NPCM7XX_CLK_CLKEN1,
> +    NPCM7XX_CLK_CLKSEL,
> +    NPCM7XX_CLK_CLKDIV1,
> +    NPCM7XX_CLK_PLLCON0,
> +    NPCM7XX_CLK_PLLCON1,
> +    NPCM7XX_CLK_SWRSTR,
> +    NPCM7XX_CLK_IPSRST1         = 0x20 / sizeof(uint32_t),
> +    NPCM7XX_CLK_IPSRST2,
> +    NPCM7XX_CLK_CLKEN2,
> +    NPCM7XX_CLK_CLKDIV2,
> +    NPCM7XX_CLK_CLKEN3,
> +    NPCM7XX_CLK_IPSRST3,
> +    NPCM7XX_CLK_WD0RCR,
> +    NPCM7XX_CLK_WD1RCR,
> +    NPCM7XX_CLK_WD2RCR,
> +    NPCM7XX_CLK_SWRSTC1,
> +    NPCM7XX_CLK_SWRSTC2,
> +    NPCM7XX_CLK_SWRSTC3,
> +    NPCM7XX_CLK_SWRSTC4,
> +    NPCM7XX_CLK_PLLCON2,
> +    NPCM7XX_CLK_CLKDIV3,
> +    NPCM7XX_CLK_CORSTC,
> +    NPCM7XX_CLK_PLLCONG,
> +    NPCM7XX_CLK_AHBCKFI,
> +    NPCM7XX_CLK_SECCNT,
> +    NPCM7XX_CLK_CNTR25M,
> +    NPCM7XX_CLK_NR_REGS,

... it might be simpler to define NPCM7XX_CLK_NR_REGS here, and keep
NPCM7xxCLKRegisters in the source file, eventually adding something
like QEMU_BUILD_BUG_ON(NPCM7XX_CLK_xxx >= NPCM7XX_CLK_NR_REGS).

> +};
> +
> +typedef struct NPCM7xxCLKState {
> +    SysBusDevice parent;
> +
> +    MemoryRegion iomem;
> +
> +    uint32_t regs[NPCM7XX_CLK_NR_REGS];
> +
> +    /* Time reference for SECCNT and CNTR25M, initialized by power on reset */
> +    int64_t ref_ns;
> +} NPCM7xxCLKState;
> +
> +#define TYPE_NPCM7XX_CLK "npcm7xx-clk"
> +#define NPCM7XX_CLK(obj) OBJECT_CHECK(NPCM7xxCLKState, (obj), TYPE_NPCM7XX_CLK)
> +
> +#endif /* NPCM7XX_CLK_H */
> 
