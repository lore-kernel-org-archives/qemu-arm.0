Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp381843njc;
        Wed, 7 Aug 2024 22:11:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUW/OdZ3DWephFpqsyaCxsmmw7DbEs2e04BtJHR7ULOiaHbA+ZD9Z7/Rd19+fwe+8IAcDjQD9SQs0v87GmHVhr5qMoDr6bQ
X-Received: by 2002:a05:6402:34d4:b0:5a1:a7cb:8f86 with SMTP id 4fb4d7f45d1cf-5bbb1f10caemr538459a12.0.1723093867369;
        Wed, 07 Aug 2024 22:11:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723093867; cv=none;
        d=google.com; s=arc-20160816;
        b=B1cXQkeeuN84YftzfhOFXuCTkdu0+wyq+RGP6q+K+i6EWoIyFGhVim5N1PUvOZ0r6U
         AQ63rJ7V7K+7G0NcFJJ9T40mevJW5Rw6vCX4IRVsi8XX1W+X1ud3njrhPm7Bj2B22SKB
         2zzx3iGzGVslOxJ67oRsyUMemyg93I8W7zTWOFdd+bxGOLklTKKACuh/rFFH8xx6fx4d
         5JfuuJqXBdKko+Oy/5fNJdyO1iwBVWg6oTd79hkgRTfQL105YYgpDLSkKiWD7RiYV+md
         mYZ4heKEcxrvfyAvQWsebMLG9sPE357BaTApbhyzL4ZJDFVSaLP6PEmkv/z3ClYyq/a3
         hD5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=IbgS08jcantuzwD6OHecJnagaADBbuT6IhfJSPyck1E=;
        fh=RWU6F0VCdJB2C4c4p/lU6C0nrQco/EbalNC0SfQXAaA=;
        b=YZadIriyQbZEtV07WL7OirBxJXgi87N74+/Qm5ZYEmyJkl/T+ypEzRz54uXg1CVw7u
         L5AyG8vq63mcSUmNfIgUd/tJ5P0bIVtDtnH//fx1yF+ass51VVy+gVB7O+hIOjiRBwlQ
         CfSkp/u8n/33ReMxUTGUn5LucVlo8QwdjGNdwRVld9dLdGFCazgbeVh1GSp1qkJZUkE9
         FU7yGN7Ih+xMN3hqWKIYH7GSuM7+Tm/wPlw8TTabeWW85zwsqv/267RCN6hJ6C4DctBR
         Y31FFW/Wq716JoAM4wAwfeAq3S5keGBtd6dtyPNEgWjRlv2nbUJ3HdT8i7vVHA658f8A
         FYsQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L+YAPV1U;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5bbb2bf941fsor119954a12.3.2024.08.07.22.11.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 Aug 2024 22:11:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L+YAPV1U;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723093867; x=1723698667; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IbgS08jcantuzwD6OHecJnagaADBbuT6IhfJSPyck1E=;
        b=L+YAPV1Uu02qe409/bq/glmN4M4kP3++lmRTGvpF5XLv3Ss6HkafngHQNDPukg4/pR
         n/m2eWV1v2cK5GhvV6btQs1G8HrU2Pn4sh5QutlEFJp6u/5JFJ1J5BUkrFshA1cHTO5w
         aapYrZjzIE8U8wAVdBdE6j+wuN/8VzrREkIjlTXKYzqgjeoaPCAI9+EvXlSOvqpQ5SpT
         5e30qkoPfxi4SH4/y1VOlwTbhxJsbKTsg4nDVKYpgZIVxpeRnxiqAQypJrrWkkUHaeUs
         TlLumouLhUmkkcUVQ4YETYZADE7hXZ863/ycf6T5Xlva8OepZFdWL5zdWMKs1IoXcnwL
         +diA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723093867; x=1723698667;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IbgS08jcantuzwD6OHecJnagaADBbuT6IhfJSPyck1E=;
        b=QYAsW43jefheZm4n5EtG8wKunG6cUQuttEWsL2QX6uLUSduYwkZ7nN7BuDmkHsV9D+
         80vLuzpBWxoBjgTM3QAmqfMdgu/EIShHCUdIm7t9gsR0jxtKBszknHnm28LqzU40VOlT
         eEf0PwIDwLuN3JIPJCAvLmjpsQJ/eynafGw7lVRW9E2DSugYuUu98zxhcDSY4SPFR88u
         ozskHwGz//joOkbB9rDYZPYZuJG9+oqrEBosfXQnJaHZiB4fWF9m5c3Idf2w3qCzvPkq
         DL8C8YTOdVdjMMTEWjwres0x+8GOkBE+7YzNwSs7p4PuwEE18IU2qRqAlsnifV0ae8LM
         fxmw==
X-Forwarded-Encrypted: i=1; AJvYcCXud0AUZYxnbf9BZF0Ked5S4lJdgS10it5N57p76v2GROuvvQiZV/YBc3RiG48Gk36U3aNPQdJ5TTHetzWPsm24juMvTlUu
X-Gm-Message-State: AOJu0YxzA7U5tGlDD+e0uK0kbht8U0glRWnprrhBIDwuc2gPfHF4h332
	y4MxsZI7cgUVkrBuCGRU5zKcBYMlpC0lRld6KzuqqlGkFE8QFPDSd7lvk++u2iSmFA==
X-Google-Smtp-Source: AGHT+IFkPjIelM7L1sY/EWS3L+Ujj1+gt8n9iOmUXk/n447CQP9R+8DwNTO+DC6ITGsQOUNm0xEhsw==
X-Received: by 2002:a05:6402:3484:b0:5b9:3846:8bab with SMTP id 4fb4d7f45d1cf-5bbb21a3b5bmr647148a12.14.1723093866635;
        Wed, 07 Aug 2024 22:11:06 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.187.212.120])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2e5e6f6sm253161a12.89.2024.08.07.22.11.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Aug 2024 22:11:06 -0700 (PDT)
Message-ID: <d31e1020-ce8d-40d9-ac8c-1dd8a0294073@linaro.org>
Date: Thu, 8 Aug 2024 07:11:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 20/23] hw/ssi: add support for flexspi
To: Octavian Purdila <tavip@google.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com,
 alex.bennee@linaro.org, thuth@redhat.com, peter.maydell@linaro.org,
 marcandre.lureau@redhat.com, alistair@alistair23.me, berrange@redhat.com,
 jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com
References: <20240805201719.2345596-1-tavip@google.com>
 <20240805201719.2345596-21-tavip@google.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240805201719.2345596-21-tavip@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 9GDUPu0uCYUN

Hi Octavian,

On 5/8/24 22:17, Octavian Purdila wrote:
> This is mostly a stub which completes SPI transactions as noops
> by masking out the error interrupts and never clearing the IPCMDDONE
> interrupt.
> 
> Although incomplete, this allows software that uses NXP's mcuxpresso
> SDK to run the SDK board initialization functions.
> 
> It also supports AHB memory access, aka XIP, for now as simple RAM
> memory regions.
> 
> Signed-off-by: Octavian Purdila <tavip@google.com>
> ---
>   hw/arm/svd/meson.build   |   4 +
>   hw/ssi/Kconfig           |   4 +
>   hw/ssi/flexspi.c         | 216 +++++++++++++++++++++++++++++++++++++++
>   hw/ssi/meson.build       |   1 +
>   hw/ssi/trace-events      |   4 +
>   include/hw/ssi/flexspi.h |  34 ++++++
>   6 files changed, 263 insertions(+)
>   create mode 100644 hw/ssi/flexspi.c
>   create mode 100644 include/hw/ssi/flexspi.h


> diff --git a/hw/ssi/flexspi.c b/hw/ssi/flexspi.c
> new file mode 100644
> index 0000000000..305d1a5bac
> --- /dev/null
> +++ b/hw/ssi/flexspi.c
> @@ -0,0 +1,216 @@
> +/*
> + * QEMU model for FLEXSPI
> + *
> + * Copyright (c) 2024 Google LLC
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/mmap-alloc.h"
> +#include "qemu/log.h"
> +#include "qemu/module.h"
> +#include "qemu/units.h"
> +#include "hw/irq.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/qdev-properties-system.h"
> +#include "migration/vmstate.h"
> +#include "exec/address-spaces.h"
> +#include "hw/regs.h"
> +#include "hw/ssi/flexspi.h"
> +#include "hw/arm/svd/flexspi.h"
> +
> +#include "trace.h"
> +
> +#define reg(field) offsetof(FLEXSPI_Type, field)
> +#define regi(x) (reg(x) / sizeof(uint32_t))
> +#define REG_NO (sizeof(FLEXSPI_Type) / sizeof(uint32_t))
> +
> +static FLEXSPI_REGISTER_NAMES_ARRAY(reg_names);
> +
> +static void flexspi_reset(DeviceState *dev)
> +{
> +    FlexSpiState *s = FLEXSPI(dev);
> +
> +    memset(&s->regs, 0, sizeof(s->regs));
> +
> +    flexspi_reset_registers(&s->regs);
> +
> +    /* idle immediately after reset */
> +    s->regs.STS0_b.SEQIDLE = 1;
> +}
> +
> +static MemTxResult flexspi_read(void *opaque, hwaddr addr,
> +                                     uint64_t *data, unsigned size,
> +                                     MemTxAttrs attrs)
> +{
> +    FlexSpiState *s = opaque;
> +    MemTxResult ret = MEMTX_OK;
> +
> +    if (!reg32_aligned_access(addr, size)) {
> +        ret = MEMTX_ERROR;
> +        goto out;
> +    }
> +
> +    switch (addr) {
> +    default:
> +        *data = reg32_read(&s->regs, addr);
> +        break;
> +    }
> +
> +out:
> +    trace_flexspi_reg_read(DEVICE(s)->id, reg_names[addr], addr, *data);
> +    return ret;
> +}
> +
> +static uint32_t wr_mask[REG_NO] = {
> +    [regi(MCR0)] = BITS(31, 14) | BITS(12, 8) | BITS(5, 4) | BITS(1, 0),
> +    [regi(MCR1)] = BITS(31, 0),
> +    [regi(MCR2)] = BITS(31, 24) | BIT(11),
> +    [regi(AHBCR)] = BIT(10) | BITS(7, 2) | BIT(0),
> +    [regi(INTEN)] = BITS(13, 0),
> +    /*
> +     * TODO: once SPI transfers are implemented restore mask to:
> +     *
> +     * [regi(INTR)] = BIT(16) | BITS(12, 0).
> +     *
> +     * In the meantime this INTR mask allows for fake SPI transfers.
> +     */
> +    [regi(INTR)] = BIT(0),
> +    [regi(LUTKEY)] = BITS(31, 0),
> +    [regi(LUTCR)] = BITS(1, 0),
> +    [regi(AHBRXBUF0CR0)] = BIT(31) | BITS(26, 24) | BITS(19, 16) | BITS(7, 0),
> +    [regi(AHBRXBUF1CR0)] = BIT(31) | BITS(26, 24) | BITS(19, 16) | BITS(7, 0),
> +    [regi(AHBRXBUF2CR0)] = BIT(31) | BITS(26, 24) | BITS(19, 16) | BITS(7, 0),
> +    [regi(AHBRXBUF3CR0)] = BIT(31) | BITS(26, 24) | BITS(19, 16) | BITS(7, 0),
> +    [regi(AHBRXBUF4CR0)] = BIT(31) | BITS(26, 24) | BITS(19, 16) | BITS(7, 0),
> +    [regi(AHBRXBUF5CR0)] = BIT(31) | BITS(26, 24) | BITS(19, 16) | BITS(7, 0),
> +    [regi(AHBRXBUF6CR0)] = BIT(31) | BITS(26, 24) | BITS(19, 16) | BITS(7, 0),
> +    [regi(AHBRXBUF7CR0)] = BIT(31) | BITS(26, 24) | BITS(19, 16) | BITS(7, 0),
> +    [regi(FLSHA1CR0)] = BITS(22, 0),
> +    [regi(FLSHA2CR0)] = BITS(22, 0),
> +    [regi(FLSHB1CR0)] = BITS(22, 0),
> +    [regi(FLSHB2CR0)] = BITS(22, 0),
> +    [regi(FLSHCR1A1)] = BITS(31, 0),
> +    [regi(FLSHCR1A2)] = BITS(31, 0),
> +    [regi(FLSHCR1B1)] = BITS(31, 0),
> +    [regi(FLSHCR1B2)] = BITS(31, 0),
> +    [regi(FLSHCR2A1)] = BITS(30, 13) | BITS(11, 5) | BITS(3, 0),
> +    [regi(FLSHCR2A2)] = BITS(30, 13) | BITS(11, 5) | BITS(3, 0),
> +    [regi(FLSHCR2B1)] = BITS(30, 13) | BITS(11, 5) | BITS(3, 0),
> +    [regi(FLSHCR2B2)] = BITS(30, 13) | BITS(11, 5) | BITS(3, 0),
> +    [regi(FLSHCR4)] = BITS(3, 2) | BIT(0),
> +    [regi(IPCR0)] = BITS(31, 0),
> +    [regi(IPCR1)] = BIT(31) | BITS(26, 24) | BITS(19, 0),
> +    [regi(IPCMD)] = BIT(1),
> +    [regi(DLPR)] = BITS(31, 0),
> +    [regi(IPRXFCR)] = BITS(8, 0),
> +    [regi(IPTXFCR)] = BITS(8, 0),
> +    [regi(DLLCRA)] = BITS(14, 8) | BITS(6, 3) | BITS(1, 0),
> +    [regi(DLLCRB)] = BITS(14, 8) | BITS(6, 3) | BITS(1, 0),
> +    [regi(HADDRSTART)] = BITS(31, 12) | BIT(0),
> +    [regi(HADDREND)] = BITS(31, 12),
> +    [regi(HADDROFFSET)] = BITS(31, 12),
> +};
> +
> +static MemTxResult flexspi_write(void *opaque, hwaddr addr,
> +                                      uint64_t value, unsigned size,
> +                                      MemTxAttrs attrs)
> +{
> +    FlexSpiState *s = opaque;
> +    MemTxResult ret = MEMTX_OK;
> +
> +    trace_flexspi_reg_write(DEVICE(s)->id, reg_names[addr], addr, value);
> +
> +    if (!reg32_aligned_access(addr, size)) {
> +        ret = MEMTX_ERROR;
> +        goto out;
> +    }
> +
> +    switch (addr) {
> +    case reg(MCR0):
> +    {
> +        reg32_write(&s->regs, addr, value, wr_mask);
> +
> +        if (s->regs.MCR0_b.SWRESET) {
> +            s->regs.MCR0_b.SWRESET = 0;
> +        }
> +        break;
> +    }
> +
> +    default:
> +        reg32_write(&s->regs, addr, value, wr_mask);
> +        break;
> +    }
> +
> +out:
> +    return ret;
> +}
> +
> +static const MemoryRegionOps flexspi_ops = {
> +    .read_with_attrs = flexspi_read,
> +    .write_with_attrs = flexspi_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,

I'm not a fan of your reg32_aligned_access() method, I'd rather
use the generic path with:

     .valid = {
         .max_access_size = 4,
         .min_access_size = 4,
         .unaligned = false
     },

> +};
> +
> +static Property flexspi_properties[] = {
> +    DEFINE_PROP_UINT32("mmap_base", FlexSpiState, mmap_base, 0),
> +    DEFINE_PROP_UINT32("mmap_size", FlexSpiState, mmap_size, 0),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void flexspi_init(Object *obj)
> +{
> +    FlexSpiState *s = FLEXSPI(obj);
> +
> +    memory_region_init_io(&s->mmio, obj, &flexspi_ops, s, TYPE_FLEXSPI,
> +                          sizeof(FLEXSPI_Type));
> +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
> +}
> +
> +static void flexspi_realize(DeviceState *dev, Error **errp)
> +{
> +    FlexSpiState *s = FLEXSPI(dev);
> +
> +    if (s->mmap_size) {
> +        memory_region_init_ram(&s->mem, OBJECT(s), DEVICE(s)->id, s->mmap_size,
> +                               NULL);
> +        memory_region_add_subregion(get_system_memory(), s->mmap_base, &s->mem);

Where is this region used?

> +    }
> +}
> +
> +static void flexspi_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->reset = flexspi_reset;
> +    dc->realize = flexspi_realize;
> +    device_class_set_props(dc, flexspi_properties);
> +}
> +
> +static const TypeInfo flexspi_info = {
> +    .name          = TYPE_FLEXSPI,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(FlexSpiState),
> +    .instance_init = flexspi_init,
> +    .class_init    = flexspi_class_init,
> +};
> +
> +static void flexspi_register_types(void)
> +{
> +    int i;
> +
> +    for (i = 0; i < 32; i++) {
> +        wr_mask[regi(TFDR[i])] = BITS(31, 0);
> +    }
> +    for (i = 0; i < 64; i++) {
> +        wr_mask[regi(LUT[i])] = BITS(31, 0);
> +    }
> +
> +    type_register_static(&flexspi_info);
> +}
> +
> +type_init(flexspi_register_types)
> diff --git a/hw/ssi/meson.build b/hw/ssi/meson.build
> index 57d3e14727..c5b7e0a6e2 100644
> --- a/hw/ssi/meson.build
> +++ b/hw/ssi/meson.build
> @@ -13,3 +13,4 @@ system_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_spi.c'))
>   system_ss.add(when: 'CONFIG_IBEX', if_true: files('ibex_spi_host.c'))
>   system_ss.add(when: 'CONFIG_BCM2835_SPI', if_true: files('bcm2835_spi.c'))
>   system_ss.add(when: 'CONFIG_FLEXCOMM', if_true: files('flexcomm_spi.c'))
> +system_ss.add(when: 'CONFIG_FLEXSPI', if_true: files('flexspi.c'))
> diff --git a/hw/ssi/trace-events b/hw/ssi/trace-events
> index 5caa1c17ac..d623022a79 100644
> --- a/hw/ssi/trace-events
> +++ b/hw/ssi/trace-events
> @@ -40,3 +40,7 @@ flexcomm_spi_fifostat(const char *id, uint32_t fifostat, uint32_t fifoinstat) "%
>   flexcomm_spi_irq(const char *id, bool irq, bool fifoirqs, bool perirqs, bool enabled) "%s: %d %d %d %d"
>   flexcomm_spi_chr_rx_space(const char *id, uint32_t rx) "%s: %d"
>   flexcomm_spi_chr_rx(const char *id) "%s"
> +
> +# flexspi.c
> +flexspi_reg_read(const char *id, const char *reg_name, uint32_t addr, uint32_t val) " %s: %s[0x%04x] -> 0x%08x"
> +flexspi_reg_write(const char *id, const char *reg_name, uint32_t addr, uint32_t val) "%s: %s[0x%04x] <- 0x%08x"
> diff --git a/include/hw/ssi/flexspi.h b/include/hw/ssi/flexspi.h
> new file mode 100644
> index 0000000000..f5fea9dee9
> --- /dev/null
> +++ b/include/hw/ssi/flexspi.h
> @@ -0,0 +1,34 @@
> +/*
> + * QEMU model for FLEXSPI
> + *
> + * Copyright (c) 2024 Google LLC
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef HW_RT500_FLEXSPI_H
> +#define HW_RT500_FLEXSPI_H
> +
> +#include "hw/sysbus.h"
> +#include "hw/ssi/ssi.h"
> +#include "hw/arm/svd/flexspi.h"
> +
> +#define TYPE_FLEXSPI "flexspi"
> +#define FLEXSPI(obj) OBJECT_CHECK(FlexSpiState, (obj), TYPE_FLEXSPI)
> +
> +typedef struct {
> +    /* <private> */
> +    SysBusDevice parent_obj;
> +
> +    /* <public> */
> +    MemoryRegion mmio;
> +    FLEXSPI_Type regs;
> +    MemoryRegion mem;
> +    uint32_t mmap_base;
> +    uint32_t mmap_size;

We usually use uint64_t for MR base/size. I.e., althought your SoC
address space is 32-bit, this model could be use in another one,
mapped at a 64-bit base.

> +} FlexSpiState;
> +
> +#endif /* HW_RT500_FLEXSPI_H */
