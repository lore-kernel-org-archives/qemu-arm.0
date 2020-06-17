Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp744461lfm;
        Wed, 17 Jun 2020 09:07:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMU3sgGbZSv7a119gDjJzNq61Ixh25okI3l0OdUxk/eprg/86UI1sfLYPipEboQ/w3h8Jk
X-Received: by 2002:ab0:2559:: with SMTP id l25mr6448891uan.143.1592410056472;
        Wed, 17 Jun 2020 09:07:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592410056; cv=none;
        d=google.com; s=arc-20160816;
        b=viINCv25bvmxpsnQ5oavZ1EjCsB1TUgmyLNGxkxRXeKXfTw7E9G2QJvW0elp85LKFR
         7Ql5KTYEzmi/KR5NZDKhfQ9+q0VHUgIPGqxlDVlU0+Ok/QlKAHjj/3LBIkUShEIbE5id
         2cPftZvaFHeB+hQRJleVf++ADQOjf8YQjp8nUvoRPDXOUkxhPw4HJh2Z+t7bPopEZmSE
         BWMKo1a1aOXDLK8Uhs5QVXCzOUv0omcZUnb0chDLCIes8mI0T6YDuMMnvs3VSX3+sMzg
         u0+w3uF2pwTUxj9gWLDe15MwzBosaRt0eG+oSxE1n4xh7+n3DDoK+XsZX9i5wHhhcMgA
         NizQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=t8pYdZFhxG6qs3t9heIGKv4+TjKgCOMKFxFE6HSAUvw=;
        b=lEkfdOrZBcgCRUQkqBiuus+QogGZ2qPoeknu234MftMnrVozXqHsh6YuY+uLykdlME
         nHDXuKqXPXm1ek0SFXeS5jkxRPPXVyMPKO+6L/iYK85ZAE3B76T+YJdaModjNuKPG0yj
         +7z2LXzTrZygNJU5g7X/+/Z9uOH19Afm+peCe9ulbLUZ2rWcjT8nM3zgk7R4lPZ/6xuf
         ivPYbkRceurDVwKYcs7Eg32NFDVJRFVaZh29gr/hzMWZ0Fo8A388XOc7nXkKQ8y9zxWM
         pZnsyL7ne0p62RX4tvKAXG7LNiTnStsZYu5B8nAWkyc2KqB/3eXrnnIHs7bL5MskWmQS
         Vs9g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g16si87296vsa.74.2020.06.17.09.07.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 09:07:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlab9-0005D1-Mv
	for alex.bennee@linaro.org; Wed, 17 Jun 2020 12:07:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jlaaz-00057W-2z
 for qemu-arm@nongnu.org; Wed, 17 Jun 2020 12:07:25 -0400
Received: from 9.mo179.mail-out.ovh.net ([46.105.76.148]:35059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jlaau-00082d-LH
 for qemu-arm@nongnu.org; Wed, 17 Jun 2020 12:07:24 -0400
Received: from player761.ha.ovh.net (unknown [10.110.115.238])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 7C93616F618
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 18:07:17 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player761.ha.ovh.net (Postfix) with ESMTPSA id AB1A1137A75BC;
 Wed, 17 Jun 2020 16:07:08 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006e65d12fd-060b-4227-9e75-bb5ee351308c,ABECD89738EEB0C75E5395B338997A57DB3A3EEE)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH v2 09/12] hw/mem: Stubbed out NPCM7xx Memory Controller
 model
To: Havard Skinnemoen <hskinnemoen@google.com>, peter.maydell@linaro.org,
 joel@jms.id.au
References: <20200611223016.259837-1-hskinnemoen@google.com>
 <20200611223016.259837-10-hskinnemoen@google.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <262ce675-d4d8-c78f-eee6-cfdeb09862c1@kaod.org>
Date: Wed, 17 Jun 2020 18:07:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200611223016.259837-10-hskinnemoen@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 4590575398909938601
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudejvddgleejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefffdvtddugeeifeduuefghfejgfeigeeigeeltedthefgieeiveeuiefhgeefgfenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejiedurdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=46.105.76.148; envelope-from=clg@kaod.org;
 helo=9.mo179.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/17 12:07:17
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 Avi.Fishman@nuvoton.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 80/VfbTgZO9f

On 6/12/20 12:30 AM, Havard Skinnemoen wrote:
> This just implements the bare minimum to cause the boot block to skip
> memory intialization.

initialization

> 
> Change-Id: I26fd5f3b2af5d07a24911e7e58789f7b52f78d71

you should drop these tags.

> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

> ---
>  MAINTAINERS                 |  2 +
>  hw/arm/npcm7xx.c            | 11 +++++
>  hw/mem/Makefile.objs        |  1 +
>  hw/mem/npcm7xx_mc.c         | 83 +++++++++++++++++++++++++++++++++++++
>  include/hw/arm/npcm7xx.h    |  2 +
>  include/hw/mem/npcm7xx_mc.h | 35 ++++++++++++++++
>  6 files changed, 134 insertions(+)
>  create mode 100644 hw/mem/npcm7xx_mc.c
>  create mode 100644 include/hw/mem/npcm7xx_mc.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9814e7b4c4..9a289366ba 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -727,10 +727,12 @@ M: Tyrone Ting <kfting@nuvoton.com>
>  L: qemu-arm@nongnu.org
>  S: Supported
>  F: hw/arm/npcm7xx*
> +F: hw/mem/npcm7xx*
>  F: hw/misc/npcm7xx*
>  F: hw/nvram/npcm7xx*
>  F: hw/timer/npcm7xx*
>  F: include/hw/arm/npcm7xx*
> +F: include/hw/mem/npcm7xx*
>  F: include/hw/misc/npcm7xx*
>  F: include/hw/nvram/npcm7xx*
>  F: include/hw/timer/npcm7xx*

maybe simplify with :

  F: hw/*/npcm7xx*
  F: include/hw/*/npcm7xx*

> diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
> index f9e3b5842b..54d84bafa1 100644
> --- a/hw/arm/npcm7xx.c
> +++ b/hw/arm/npcm7xx.c
> @@ -46,6 +46,7 @@
>  #define NPCM7XX_CPUP_BA         (0xF03FE000)
>  #define NPCM7XX_GCR_BA          (0xF0800000)
>  #define NPCM7XX_CLK_BA          (0xF0801000)
> +#define NPCM7XX_MC_BA           (0xF0824000)
>  
>  /* Memory blocks at the end of the address space */
>  #define NPCM7XX_RAM2_BA         (0xFFFD0000)
> @@ -161,6 +162,8 @@ static void npcm7xx_init(Object *obj)
>                            sizeof(s->key_storage), TYPE_NPCM7XX_KEY_STORAGE);
>      sysbus_init_child_obj(obj, "otp2", OBJECT(&s->fuse_array),
>                            sizeof(s->fuse_array), TYPE_NPCM7XX_FUSE_ARRAY);
> +    sysbus_init_child_obj(obj, "mc", OBJECT(&s->mc), sizeof(s->mc),
> +                          TYPE_NPCM7XX_MC);
>  
>      for (i = 0; i < ARRAY_SIZE(s->tim); i++) {
>          sysbus_init_child_obj(obj, "tim[*]", OBJECT(&s->tim[i]),
> @@ -258,6 +261,14 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->fuse_array), 0, NPCM7XX_OTP2_BA);
>      npcm7xx_init_fuses(s);
>  
> +    /* Fake Memory Controller (MC) */
> +    object_property_set_bool(OBJECT(&s->mc), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->mc), 0, NPCM7XX_MC_BA);
> +
>      /* Timer Modules (TIM) */
>      QEMU_BUILD_BUG_ON(ARRAY_SIZE(npcm7xx_tim_addr) != ARRAY_SIZE(s->tim));
>      for (i = 0; i < ARRAY_SIZE(s->tim); i++) {
> diff --git a/hw/mem/Makefile.objs b/hw/mem/Makefile.objs
> index 56345befd0..9a33ef7b35 100644
> --- a/hw/mem/Makefile.objs
> +++ b/hw/mem/Makefile.objs
> @@ -1,3 +1,4 @@
>  common-obj-$(CONFIG_DIMM) += pc-dimm.o
>  common-obj-y += memory-device.o
> +common-obj-$(CONFIG_NPCM7XX) += npcm7xx_mc.o
>  common-obj-$(CONFIG_NVDIMM) += nvdimm.o
> diff --git a/hw/mem/npcm7xx_mc.c b/hw/mem/npcm7xx_mc.c
> new file mode 100644
> index 0000000000..03a7fb53dc
> --- /dev/null
> +++ b/hw/mem/npcm7xx_mc.c
> @@ -0,0 +1,83 @@
> +/*
> + * Nuvoton NPCM7xx Memory Controller stub
> + *
> + * Copyright 2020 Google LLC
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * version 2 as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> + * GNU General Public License for more details.
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
> diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
> index 360cd965a7..8f49f7015c 100644
> --- a/include/hw/arm/npcm7xx.h
> +++ b/include/hw/arm/npcm7xx.h
> @@ -17,6 +17,7 @@
>  
>  #include "hw/boards.h"
>  #include "hw/cpu/a9mpcore.h"
> +#include "hw/mem/npcm7xx_mc.h"
>  #include "hw/misc/npcm7xx_clk.h"
>  #include "hw/misc/npcm7xx_gcr.h"
>  #include "hw/nvram/npcm7xx_otp.h"
> @@ -65,6 +66,7 @@ typedef struct NPCM7xxState {
>      NPCM7xxTimerCtrlState tim[3];
>      NPCM7xxOTPState     key_storage;
>      NPCM7xxOTPState     fuse_array;
> +    NPCM7xxMCState      mc;
>  } NPCM7xxState;
>  
>  #define TYPE_NPCM7XX    "npcm7xx"
> diff --git a/include/hw/mem/npcm7xx_mc.h b/include/hw/mem/npcm7xx_mc.h
> new file mode 100644
> index 0000000000..8781f5c979
> --- /dev/null
> +++ b/include/hw/mem/npcm7xx_mc.h
> @@ -0,0 +1,35 @@
> +/*
> + * Nuvoton NPCM7xx Memory Controller stub
> + *
> + * Copyright 2020 Google LLC
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * version 2 as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> + * GNU General Public License for more details.
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
> 

