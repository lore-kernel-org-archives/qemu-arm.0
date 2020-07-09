Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1581616lfm;
        Thu, 9 Jul 2020 09:30:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylYRTQmgaF/gThdBZbNyByFhvar7vQ6cZXpBLPYny045KduGu226IubVELAOEXeOP49+Hi
X-Received: by 2002:a25:8449:: with SMTP id r9mr34181056ybm.194.1594312204851;
        Thu, 09 Jul 2020 09:30:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594312204; cv=none;
        d=google.com; s=arc-20160816;
        b=LwDnB3PWQMSN23aJUnU92o7F4hXCYqywXXvvJbNWUJWAIPOYS5B2F74MMa5kGemWgk
         ZLezCjV4DmB6uHXIqXkyye44/fHh+ilPYyK2sqhjc5qv4MvRdAgs2kyGhPKl53ltfd1t
         I2DzGvji1TAoUVA9CWIT977n9nOSLPRTC5L4kKcDrT4B7LJqqe64ZQZFfU0yWarjFWVA
         GOzUFP3THykkwEtohH0tnXqckYtVogVd9BftgfeYi1GVAjy3Z0Wi6js3tZ22D521WVqN
         ZCJHxfHfV//8jwdVT3LB9T6QS4q6pUcpIBbT/XlV8ntGCNzWernvGYymrnoECtD5f0HK
         C/PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=xy20egUaig+47K89bTTfB+c8ZhTNxbJO3uIx7oBQuAs=;
        b=rnK16TsQD05WLbjk9lWjZLbv/7bI3+4wz7Yw0VMDtmVJNT49FXzNiqgHFDi8mKfKmC
         rm6BHKAwZ1BckM5mOMkLNo4muevnrMxPwM9FgG0k/597GNXcrWxxWc/QfGid7d7JEEaH
         F4lO27pHFdMUP4W/+CIk6j86MShGcBT1Zockw4oMwrw7FnWYedZMGWUMSEGn8ULTTxEU
         6ySJSbzQ+HVorZhzyOrXhIYpKtPehaM1lSiEuUCsteg8QiyfpUBPf9I4QmAckV0uIFxR
         dHFWMOWQwrj/QbQJ6jNh8LUR1OMUBUP7ityQkbwMmGLkMjabynv/AqwydTgwGPFTMMbp
         UFbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=T9RtJ7pY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p205si3014196yba.114.2020.07.09.09.30.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jul 2020 09:30:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=T9RtJ7pY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:38702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtZQy-0007Gl-7k
	for alex.bennee@linaro.org; Thu, 09 Jul 2020 12:30:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jtZQq-0007Ga-JZ; Thu, 09 Jul 2020 12:29:56 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:55808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jtZQo-0005D2-V4; Thu, 09 Jul 2020 12:29:56 -0400
Received: by mail-wm1-x341.google.com with SMTP id g75so2543728wme.5;
 Thu, 09 Jul 2020 09:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xy20egUaig+47K89bTTfB+c8ZhTNxbJO3uIx7oBQuAs=;
 b=T9RtJ7pYUZbWoimf9AE33aHTU6qBBAc9yxCSx9zE6F4ocbfudCJeLHtCTHd8B0Ice3
 jLbrxLmwDl3iWQHdHexir0bphBBtvkaniM0lesxPM4+P+FOuLiiEnLxYD0mcuFfirB0F
 m8GBcVY81EcLGs17pIAk3xyVwOVclJAmNf5tsLrHviX9lFpjCSm7e+kI8av40hYVVZTG
 PpCG1QvC+WgvxnwqA9ylGdDaKBlaK9YmL1BIh4Cw9RoKIbpvb3uxImLpq4kTupdS78O/
 tqszERDEpNZ1uHYcm8o5FGo/c/lmXDA8vSgYtxTnkjHvqfTNhQ7zGEXzsSxh51oCB3Uk
 wBXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xy20egUaig+47K89bTTfB+c8ZhTNxbJO3uIx7oBQuAs=;
 b=EJ5cS50B6pO0TrYqIibQqtfoQn4CUeNUfRZWtTB+2VO9DI5c9EyTU2tOr9bBnrB7IY
 i7sCqVZ8HiYk2F/BQ2Ps8HNSipwM0XgvZc+ASYv/4wt4DClPG9x2MRQQAX9q91/Ez0hb
 w+uOhuCik/DGFTL9BVDGCRFxfAlJvpzUuwGSDnhz4qHsXf4nBfoEtIpNe50OotzQfPrM
 pDB32nkiSdXvc9Rnpk8RqufRx3XYMvDYx9nFugCxqFYmTCwA9sGIxP8Xt1hwqyLOLMTV
 fYP4GuRJPqW9+8pf5nW3h2egQtu2VnaZ18+Y/iMU+lGYUeZVCDkvQ2u1seYzLzXjxFyY
 +MRQ==
X-Gm-Message-State: AOAM530YQxe2uYuzc5YoMwikFK3B2/pGH1F0Jw/u3NOEb03FThUIYGp8
 nvXQVXjwczUIkD9y5JQ95ZE=
X-Received: by 2002:a05:600c:2253:: with SMTP id
 a19mr804627wmm.136.1594312192596; 
 Thu, 09 Jul 2020 09:29:52 -0700 (PDT)
Received: from [192.168.1.37] (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id x18sm6194491wrq.13.2020.07.09.09.29.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2020 09:29:51 -0700 (PDT)
Subject: Re: [PATCH v5 08/11] hw/mem: Stubbed out NPCM7xx Memory Controller
 model
To: Havard Skinnemoen <hskinnemoen@google.com>, peter.maydell@linaro.org
References: <20200709003608.3834629-1-hskinnemoen@google.com>
 <20200709003608.3834629-9-hskinnemoen@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4e8bb765-3b71-b514-6e6c-e4cb775db84a@amsat.org>
Date: Thu, 9 Jul 2020 18:29:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200709003608.3834629-9-hskinnemoen@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
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
Cc: kfting@nuvoton.com, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TPdXXwN6eIxq

On 7/9/20 2:36 AM, Havard Skinnemoen wrote:
> This just implements the bare minimum to cause the boot block to skip
> memory initialization.
> 
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
> ---
>  include/hw/arm/npcm7xx.h    |  2 +
>  include/hw/mem/npcm7xx_mc.h | 36 ++++++++++++++++
>  hw/arm/npcm7xx.c            |  6 +++
>  hw/mem/npcm7xx_mc.c         | 84 +++++++++++++++++++++++++++++++++++++
>  hw/mem/Makefile.objs        |  1 +
>  5 files changed, 129 insertions(+)
>  create mode 100644 include/hw/mem/npcm7xx_mc.h
>  create mode 100644 hw/mem/npcm7xx_mc.c
> 
> diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
> index 0fd4ae4133..3ae9e5dca2 100644
> --- a/include/hw/arm/npcm7xx.h
> +++ b/include/hw/arm/npcm7xx.h
> @@ -18,6 +18,7 @@
>  
>  #include "hw/boards.h"
>  #include "hw/cpu/a9mpcore.h"
> +#include "hw/mem/npcm7xx_mc.h"
>  #include "hw/misc/npcm7xx_clk.h"
>  #include "hw/misc/npcm7xx_gcr.h"
>  #include "hw/nvram/npcm7xx_otp.h"
> @@ -71,6 +72,7 @@ typedef struct NPCM7xxState {
>      NPCM7xxTimerCtrlState tim[3];
>      NPCM7xxOTPState     key_storage;
>      NPCM7xxOTPState     fuse_array;
> +    NPCM7xxMCState      mc;
>  } NPCM7xxState;
>  
>  #define TYPE_NPCM7XX    "npcm7xx"
> diff --git a/include/hw/mem/npcm7xx_mc.h b/include/hw/mem/npcm7xx_mc.h
> new file mode 100644
> index 0000000000..7ed38be243
> --- /dev/null
> +++ b/include/hw/mem/npcm7xx_mc.h
> @@ -0,0 +1,36 @@
> +/*
> + * Nuvoton NPCM7xx Memory Controller stub
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
> +#ifndef NPCM7XX_MC_H
> +#define NPCM7XX_MC_H
> +
> +#include "exec/memory.h"
> +#include "hw/sysbus.h"
> +
> +/**
> + * struct NPCM7xxMCState - Device state for the memory controller.
> + * @parent: System bus device.
> + * @mmio: Memory region through which registers are accessed.
> + */
> +typedef struct NPCM7xxMCState {
> +    SysBusDevice parent;
> +
> +    MemoryRegion mmio;
> +} NPCM7xxMCState;
> +
> +#define TYPE_NPCM7XX_MC "npcm7xx-mc"
> +#define NPCM7XX_MC(obj) OBJECT_CHECK(NPCM7xxMCState, (obj), TYPE_NPCM7XX_MC)
> +
> +#endif /* NPCM7XX_MC_H */
> diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
> index 70eaa2347f..4d227bb74b 100644
> --- a/hw/arm/npcm7xx.c
> +++ b/hw/arm/npcm7xx.c
> @@ -42,6 +42,7 @@
>  #define NPCM7XX_CPUP_BA         (0xf03fe000)
>  #define NPCM7XX_GCR_BA          (0xf0800000)
>  #define NPCM7XX_CLK_BA          (0xf0801000)
> +#define NPCM7XX_MC_BA           (0xf0824000)
>  
>  /* Internal AHB SRAM */
>  #define NPCM7XX_RAM3_BA         (0xc0008000)
> @@ -165,6 +166,7 @@ static void npcm7xx_init(Object *obj)
>                              TYPE_NPCM7XX_KEY_STORAGE);
>      object_initialize_child(obj, "otp2", &s->fuse_array,
>                              TYPE_NPCM7XX_FUSE_ARRAY);
> +    object_initialize_child(obj, "mc", &s->mc, TYPE_NPCM7XX_MC);
>  
>      for (i = 0; i < ARRAY_SIZE(s->tim); i++) {
>          object_initialize_child(obj, "tim[*]", &s->tim[i], TYPE_NPCM7XX_TIMER);
> @@ -230,6 +232,10 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->fuse_array), 0, NPCM7XX_OTP2_BA);
>      npcm7xx_init_fuses(s);
>  
> +    /* Fake Memory Controller (MC) */
> +    sysbus_realize(SYS_BUS_DEVICE(&s->mc), &error_abort);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->mc), 0, NPCM7XX_MC_BA);
> +
>      /* Timer Modules (TIM) */
>      QEMU_BUILD_BUG_ON(ARRAY_SIZE(npcm7xx_tim_addr) != ARRAY_SIZE(s->tim));
>      for (i = 0; i < ARRAY_SIZE(s->tim); i++) {
> diff --git a/hw/mem/npcm7xx_mc.c b/hw/mem/npcm7xx_mc.c
> new file mode 100644
> index 0000000000..0435d06ab4
> --- /dev/null
> +++ b/hw/mem/npcm7xx_mc.c
> @@ -0,0 +1,84 @@
> +/*
> + * Nuvoton NPCM7xx Memory Controller stub
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
> +
> +#include "qemu/osdep.h"
> +
> +#include "hw/mem/npcm7xx_mc.h"
> +#include "qapi/error.h"
> +#include "qemu/log.h"
> +#include "qemu/module.h"
> +#include "qemu/units.h"
> +
> +#define NPCM7XX_MC_REGS_SIZE (4 * KiB)
> +
> +static uint64_t npcm7xx_mc_read(void *opaque, hwaddr addr, unsigned int size)
> +{
> +    /*
> +     * If bits 8..11 @ offset 0 are not zero, the boot block thinks the memory
> +     * controller has already been initialized and will skip DDR training.
> +     */
> +    if (addr == 0) {
> +        return 0x100;

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +    }
> +
> +    qemu_log_mask(LOG_UNIMP, "%s: mostly unimplemented\n", __func__);
> +
> +    return 0;
> +}
> +
> +static void npcm7xx_mc_write(void *opaque, hwaddr addr, uint64_t v,
> +                             unsigned int size)
> +{
> +    qemu_log_mask(LOG_UNIMP, "%s: mostly unimplemented\n", __func__);
> +}
> +
> +static const MemoryRegionOps npcm7xx_mc_ops = {
> +    .read = npcm7xx_mc_read,
> +    .write = npcm7xx_mc_write,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +    .valid = {
> +        .min_access_size = 4,
> +        .max_access_size = 4,
> +        .unaligned = false,
> +    },
> +};
> +
> +static void npcm7xx_mc_realize(DeviceState *dev, Error **errp)
> +{
> +    NPCM7xxMCState *s = NPCM7XX_MC(dev);
> +
> +    memory_region_init_io(&s->mmio, OBJECT(s), &npcm7xx_mc_ops, s, "regs",
> +                          NPCM7XX_MC_REGS_SIZE);
> +    sysbus_init_mmio(&s->parent, &s->mmio);
> +}
> +
> +static void npcm7xx_mc_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->desc = "NPCM7xx Memory Controller stub";
> +    dc->realize = npcm7xx_mc_realize;
> +}
> +
> +static const TypeInfo npcm7xx_mc_types[] = {
> +    {
> +        .name = TYPE_NPCM7XX_MC,
> +        .parent = TYPE_SYS_BUS_DEVICE,
> +        .instance_size = sizeof(NPCM7xxMCState),
> +        .class_init = npcm7xx_mc_class_init,
> +    },
> +};
> +DEFINE_TYPES(npcm7xx_mc_types);
> diff --git a/hw/mem/Makefile.objs b/hw/mem/Makefile.objs
> index 56345befd0..9a33ef7b35 100644
> --- a/hw/mem/Makefile.objs
> +++ b/hw/mem/Makefile.objs
> @@ -1,3 +1,4 @@
>  common-obj-$(CONFIG_DIMM) += pc-dimm.o
>  common-obj-y += memory-device.o
> +common-obj-$(CONFIG_NPCM7XX) += npcm7xx_mc.o
>  common-obj-$(CONFIG_NVDIMM) += nvdimm.o
> 
