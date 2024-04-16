Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp450289ejd;
        Tue, 16 Apr 2024 08:31:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXJkGq5ILT3lEHPMFhhgQ15mWCYT1fcjpNNVIK6CppoKaI20yd4md++Xwzl/ZiHqkTuAlSBpKB/pWf76Cc0NVXzEFmQdZDo
X-Google-Smtp-Source: AGHT+IE8TXJT3Um0Icia/DnefkW8BThoV4W2Ra3eAmG3EKEacJgAXb4m7D0/lKxv3PwVsEYy71qR
X-Received: by 2002:a05:6102:3ed4:b0:47b:5f23:bf51 with SMTP id n20-20020a0561023ed400b0047b5f23bf51mr13450342vsv.12.1713281460746;
        Tue, 16 Apr 2024 08:31:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713281460; cv=none;
        d=google.com; s=arc-20160816;
        b=E7yD9nvm4IlP97g2EWvdNn4v+3qoKRk/4X6tgym4j9Ue0s7ZnTMb+wLyXFm++H/YN8
         yJBh6aRiUDDvHCh8yb+v4RzKgKUYnq3VqG/gpU7f1d7w7dn7/gZlazlDmZ0Jp04yaa4x
         h+Lr85EqZCDx1/vuNKRzuNdtOs2cI/0kWYAPR64WK2NV/Ux3d1zKCOowEvU2bX0ct3d6
         j0+pxDbUxb5lyb/+/LjJtumUPnqo77f7AtThbCZun9R05fWQwxAG7hG2HRohSfXm+tHy
         OCCoX2ci9ngCyVsW76+Iy+f0n6aZ2+cq121Iy4vK++V0HHEF66HGcCYcySiO/d9cgL9i
         RQcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=avA3rtkG+5nMbJp/Ire0XOQtiDhpgPaOri+p58AFhK0=;
        fh=dkl4W7Ty5DQDYblIuR6iwQV8rfkW6Bl5VLJjLin9mSc=;
        b=Mvi9g1dYPRH2CRb40bxUeYxPKQcS1YNpwkykcFQPaTEqNPE6gpVxik5E86FH33ujDf
         gwgwpJZ/eef9KudLCJBQyyQT3srr7jFLVuVjoGRMlvk1ubdaNv86s0kBZx3EDki+NGVx
         9ZdL/DrZSrVUpyxGgX9MdelKw1RPeb/T+h5y4FMUXar78jPlqix3M1/3EepIGU2xq3lM
         MFXCPs/6b62qbEDZUiWts+/O00hronW25sSqczRDmRPdp1GRxLB+aoqVrUs/i/EDx5Ub
         K8MF7seX/7wwWoHcHsrN7PBxu4YEFrYlYqpgBPZJfKtg5LaAq5bsTzcDDYoTPiHasyem
         sNUQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m14-20020a05610206ce00b0047b995540c3si300799vsg.138.2024.04.16.08.31.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Apr 2024 08:31:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rwklc-0000VN-7j; Tue, 16 Apr 2024 11:30:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=29bf=LV=kaod.org=clg@ozlabs.org>)
 id 1rwklP-0000UV-2A; Tue, 16 Apr 2024 11:30:29 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=29bf=LV=kaod.org=clg@ozlabs.org>)
 id 1rwklK-0001bv-QO; Tue, 16 Apr 2024 11:30:26 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4VJnzX3bw4z4wyk;
 Wed, 17 Apr 2024 01:30:16 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4VJnzR05Mtz4wcC;
 Wed, 17 Apr 2024 01:29:51 +1000 (AEST)
Message-ID: <5ef85c12-a248-4084-81c0-201e057f0123@kaod.org>
Date: Tue, 16 Apr 2024 17:29:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/16] aspeed/sli: Add AST2700 support
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20240416091904.935283-1-jamin_lin@aspeedtech.com>
 <20240416091904.935283-3-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240416091904.935283-3-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=29bf=LV=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: l0iAiLCN80wr

Hello Jamin,

On 4/16/24 11:18, Jamin Lin wrote:
> AST2700 SLI engine is designed to accelerate the
> throughput between cross-die connections.
> It have CPU_SLI at CPU die and IO_SLI at IO die.
> 
> Introduce dummy AST2700 SLI and SLIIO models.
> 
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   hw/misc/aspeed_sli.c         | 178 +++++++++++++++++++++++++++++++++++
>   hw/misc/meson.build          |   3 +-
>   hw/misc/trace-events         |   7 ++
>   include/hw/misc/aspeed_sli.h |  31 ++++++
>   4 files changed, 218 insertions(+), 1 deletion(-)
>   create mode 100644 hw/misc/aspeed_sli.c
>   create mode 100644 include/hw/misc/aspeed_sli.h
> 
> diff --git a/hw/misc/aspeed_sli.c b/hw/misc/aspeed_sli.c
> new file mode 100644
> index 0000000000..e84fd6a4ca
> --- /dev/null
> +++ b/hw/misc/aspeed_sli.c
> @@ -0,0 +1,178 @@
> +/*
> + * ASPEED SLI Controller
> + *
> + * Copyright (C) 2024 ASPEED Technology Inc.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "qemu/error-report.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/misc/aspeed_sli.h"
> +#include "qapi/error.h"
> +#include "migration/vmstate.h"
> +#include "trace.h"
> +
> +#define SLI_REGION_SIZE 0x500
> +#define TO_REG(addr) ((addr) >> 2)
> +
> +static uint64_t aspeed_sli_read(void *opaque, hwaddr addr, unsigned int size)
> +{
> +    AspeedSLIState *s = ASPEED_SLI(opaque);
> +    int reg = TO_REG(addr);
> +
> +    if (reg >= ARRAY_SIZE(s->regs)) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Out-of-bounds read at offset 0x%" HWADDR_PRIx "\n",
> +                      __func__, addr);
> +        return 0;
> +    }
> +
> +    trace_aspeed_sli_read(addr, size, s->regs[reg]);
> +    return s->regs[reg];
> +}
> +
> +static void aspeed_sli_write(void *opaque, hwaddr addr, uint64_t data,
> +                              unsigned int size)
> +{
> +    AspeedSLIState *s = ASPEED_SLI(opaque);
> +    int reg = TO_REG(addr);
> +
> +    if (reg >= ARRAY_SIZE(s->regs)) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Out-of-bounds write at offset 0x%" HWADDR_PRIx "\n",
> +                      __func__, addr);
> +        return;
> +    }
> +
> +    trace_aspeed_sli_write(addr, size, data);
> +    s->regs[reg] = data;
> +}
> +
> +static uint64_t aspeed_sliio_read(void *opaque, hwaddr addr, unsigned int size)
> +{
> +    AspeedSLIState *s = ASPEED_SLI(opaque);
> +    int reg = TO_REG(addr);
> +
> +    if (reg >= ARRAY_SIZE(s->regs)) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Out-of-bounds read at offset 0x%" HWADDR_PRIx "\n",
> +                      __func__, addr);
> +        return 0;
> +    }
> +
> +    trace_aspeed_sliio_read(addr, size, s->regs[reg]);
> +    return s->regs[reg];
> +}
> +
> +static void aspeed_sliio_write(void *opaque, hwaddr addr, uint64_t data,
> +                              unsigned int size)
> +{
> +    AspeedSLIState *s = ASPEED_SLI(opaque);
> +    int reg = TO_REG(addr);
> +
> +    if (reg >= ARRAY_SIZE(s->regs)) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Out-of-bounds write at offset 0x%" HWADDR_PRIx "\n",
> +                      __func__, addr);
> +        return;
> +    }
> +
> +    trace_aspeed_sliio_write(addr, size, data);
> +    s->regs[reg] = data;
> +}
> +
> +static const MemoryRegionOps aspeed_sli_ops = {
> +    .read = aspeed_sli_read,
> +    .write = aspeed_sli_write,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +    .valid = {
> +        .min_access_size = 1,
> +        .max_access_size = 4,
> +    },
> +};
> +
> +static const MemoryRegionOps aspeed_sliio_ops = {
> +    .read = aspeed_sliio_read,
> +    .write = aspeed_sliio_write,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +    .valid = {
> +        .min_access_size = 1,
> +        .max_access_size = 4,
> +    },
> +};
> +
> +static void aspeed_sli_realize(DeviceState *dev, Error **errp)
> +{
> +    AspeedSLIState *s = ASPEED_SLI(dev);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> +
> +    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_sli_ops, s,
> +                          TYPE_ASPEED_SLI, SLI_REGION_SIZE);
> +    sysbus_init_mmio(sbd, &s->iomem);
> +}
> +
> +static void aspeed_sliio_realize(DeviceState *dev, Error **errp)
> +{
> +    AspeedSLIState *s = ASPEED_SLI(dev);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> +
> +    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_sliio_ops, s,
> +                          TYPE_ASPEED_SLI, SLI_REGION_SIZE);
> +    sysbus_init_mmio(sbd, &s->iomem);
> +}
> +
> +static void aspeed_sli_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->desc = "Aspeed SLI Controller";
> +    dc->realize = aspeed_sli_realize;
> +}
> +
> +static const TypeInfo aspeed_sli_info = {
> +    .name          = TYPE_ASPEED_SLI,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(AspeedSLIState),
> +    .class_init    = aspeed_sli_class_init,
> +    .class_size    = sizeof(AspeedSLIClass),
> +    .abstract      = true,
> +};
> +
> +static void aspeed_2700_sli_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->desc = "AST2700 SLI Controller";
> +}
> +
> +static void aspeed_2700_sliio_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->desc = "AST2700 I/O SLI Controller";
> +    dc->realize = aspeed_sliio_realize;
> +}
> +
> +static const TypeInfo aspeed_2700_sli_info = {
> +    .name           = TYPE_ASPEED_2700_SLI,
> +    .parent         = TYPE_ASPEED_SLI,
> +    .class_init     = aspeed_2700_sli_class_init,
> +};
> +
> +static const TypeInfo aspeed_2700_sliio_info = {
> +    .name           = TYPE_ASPEED_2700_SLIIO,
> +    .parent         = TYPE_ASPEED_SLI,
> +    .class_init     = aspeed_2700_sliio_class_init,
> +};
> +
> +static void aspeed_sli_register_types(void)
> +{
> +    type_register_static(&aspeed_sli_info);
> +    type_register_static(&aspeed_2700_sli_info);
> +    type_register_static(&aspeed_2700_sliio_info);
> +}
> +
> +type_init(aspeed_sli_register_types);
> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> index 86596a3888..2ca8717be2 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -136,7 +136,8 @@ system_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
>     'aspeed_sbc.c',
>     'aspeed_sdmc.c',
>     'aspeed_xdma.c',
> -  'aspeed_peci.c'))
> +  'aspeed_peci.c',
> +  'aspeed_sli.c'))
>   
>   system_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-sysreg.c'))
>   system_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_rng.c'))
> diff --git a/hw/misc/trace-events b/hw/misc/trace-events
> index 5d241cb40a..e13b648221 100644
> --- a/hw/misc/trace-events
> +++ b/hw/misc/trace-events
> @@ -351,3 +351,10 @@ djmemc_write(int reg, uint64_t value, unsigned int size) "reg=0x%x value=0x%"PRI
>   # iosb.c
>   iosb_read(int reg, uint64_t value, unsigned int size) "reg=0x%x value=0x%"PRIx64" size=%u"
>   iosb_write(int reg, uint64_t value, unsigned int size) "reg=0x%x value=0x%"PRIx64" size=%u"
> +
> +# aspeed_sli.c
> +aspeed_sli_write(uint64_t offset, unsigned int size, uint32_t data) "To 0x%" PRIx64 " of size %u: 0x%" PRIx32
> +aspeed_sli_read(uint64_t offset, unsigned int size, uint32_t data) "To 0x%" PRIx64 " of size %u: 0x%" PRIx32
> +aspeed_sliio_write(uint64_t offset, unsigned int size, uint32_t data) "To 0x%" PRIx64 " of size %u: 0x%" PRIx32
> +aspeed_sliio_read(uint64_t offset, unsigned int size, uint32_t data) "To 0x%" PRIx64 " of size %u: 0x%" PRIx32
> +
> diff --git a/include/hw/misc/aspeed_sli.h b/include/hw/misc/aspeed_sli.h
> new file mode 100644
> index 0000000000..2329002b84
> --- /dev/null
> +++ b/include/hw/misc/aspeed_sli.h
> @@ -0,0 +1,31 @@
> +/*
> + * ASPEED SLI Controller
> + *
> + * Copyright (C) 2024 ASPEED Technology Inc.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#ifndef ASPEED_SLI_H
> +#define ASPEED_SLI_H
> +
> +#include "hw/sysbus.h"
> +
> +#define TYPE_ASPEED_SLI "aspeed.sli"
> +#define TYPE_ASPEED_2700_SLI TYPE_ASPEED_SLI "-ast2700"
> +#define TYPE_ASPEED_2700_SLIIO TYPE_ASPEED_SLI "io" "-ast2700"
> +OBJECT_DECLARE_TYPE(AspeedSLIState, AspeedSLIClass, ASPEED_SLI)
> +
> +#define ASPEED_SLI_NR_REGS  (0x500 >> 2)
> +
> +struct AspeedSLIState {
> +    SysBusDevice parent;
> +    MemoryRegion iomem;
> +
> +    uint32_t regs[ASPEED_SLI_NR_REGS];
> +};
> +
> +struct AspeedSLIClass {
> +    SysBusDeviceClass parent_class;
> +};

May be use OBJECT_DECLARE_SIMPLE_TYPE() to avoid the empty class.

Anyhow,


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

