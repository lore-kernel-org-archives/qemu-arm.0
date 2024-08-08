Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp379880njc;
        Wed, 7 Aug 2024 22:00:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWA11MvMTmocFVHD8hKZuPStLwBnVZndq1si6PARfdou6f08gozZXCRrlikHutVhOK/0I6VntjBFCHhxiTgMRIiF35F7VcE
X-Received: by 2002:a05:600c:1f93:b0:426:647b:1bf7 with SMTP id 5b1f17b1804b1-4290af18b73mr6033305e9.32.1723093240038;
        Wed, 07 Aug 2024 22:00:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723093240; cv=none;
        d=google.com; s=arc-20160816;
        b=gHdvopPd3ch8QOb0EYRyrUU5J935l/i8ICsV5sVQa8cK/wEVP0aoCLqJaO+Iu4mwds
         LcXLXCq8PNTsNQHoGqVOm1bAdXlnv4GQ9tGYYfJmv3WrnxK1FGR/1b4ar/wSW0xAQuYM
         ReU9wJKrnK5psY4RMSN+BEaPt21kVx/jtPuxkxa5g8Gu9nnZ6QFGzq44fUDEYpTSNN7E
         o8myo6oi7OJoogVlsuFjvDvLdka6jbZLsJAUtReglLIx48c+mZVlxlEYI5KTtPEhlXqi
         cK+qmB6TWsqIoChASRBH4HHlWgNALqnwcw6wU45B4qLRjwMAWeMsuoyjwiNpqJ52wBIq
         g50Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Pcdi8R26zt657R9UpVDv8pTBgxJ5QG4D4fumGY+HeUs=;
        fh=MNKYq+FmmkkVy0vmCpf6J9affwdIpdmvsAbAoql//nM=;
        b=ihMcfNyHyDHFinB98c19S1TMfT6PDBTP7Jau9KsHtCtiWa0Bf/p8PN3I8fbmAbFIvd
         q4Pnok38ZWYqnsnk1nQ1mMkyi4X9hICwIbFrC2LHFT6X13vdGEDDThxHMSYV8KLxJHtK
         QT9CS7CGsB+n7zw6C138hN57SKeYOC6K1jIYc1nf43g6ldEFJGP9KGVV43dj1p80yK8O
         5yhhXryPENOk3ekCJyzftNSjMRUb8n/C70go3gqylhOio9Pu487+8I4iTywDdOk9uLK8
         UgJrORhxyWWR/pB5i1RF/gSjDfuCmD0PzvDHy+vEeu+rxRMPRIMzOBa5A5oDQ0QmZwpU
         nLVA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gy+hH1RI;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-429058085a9sor6328735e9.13.2024.08.07.22.00.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 Aug 2024 22:00:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gy+hH1RI;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723093239; x=1723698039; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pcdi8R26zt657R9UpVDv8pTBgxJ5QG4D4fumGY+HeUs=;
        b=Gy+hH1RI9XdlrXHpXk7k/ymPI+xb6M4Rs5/Elm2EeYkpjbe3cXXQPp0aKA2O1MOUPK
         sGo5uAIAgrTd1qmvmpBw7wO2oB7YNI/hAXHooZjR/GySp/mzXnFzqQQIVSfVkE+zu9HF
         DNF0Ugnvlprx1yViKeAtxn98SRbkTZSUwQ9vLICfiGd11iEvFJiEDCEPmwRu+fi7QuSl
         SwL47o393u35LIq90YH5pXxvhO9UoF8thMB5sVF17nASvOi61WR5PgvDZ0ciGXGV1dN4
         0dXmR4qX8V4WZqQdOhSKc+eRmEnezSYEMviFYG44Kg4BG/g8mYKaRtqTQ6sJGR8iHzon
         vPfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723093239; x=1723698039;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pcdi8R26zt657R9UpVDv8pTBgxJ5QG4D4fumGY+HeUs=;
        b=c0s9ZToa3tw9EyE3FAUqA/xLixKRBBwb9LQPS2spJD4c/1lEWp3qY71jdWjjWDN8AO
         aLiTVhar3pJHQ8bPW2AkUJ7mmiQNdas9Nps4Jd+SWoUabxxOMG2Py9iOBHZ2EvygRTLW
         vri6Mjp2t6gi30K2rqmsXtp1+Y1blHKHOmGfRqlZRx3uIWQvT5j0GkBj0tvaLR5p+HQc
         qIFCv5iv/O+s8oTz0qSgR/H5ZL08UxhvsHc/6u2/i7lj7pNlWJhvHNs0oZwINkjVgZLB
         iWPHHpXZC+gWoSvg/s/c6V5rbUqh72nZKgPEt30cVSdjnM/S0kYdpf1IHWz0NcH+XeQn
         6HpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMOgyAGHwL4r9IKTgkdOiNeqGjBHMBZehsYQuXAIEaB35wyO+mcl4h4uFhS4VZ/90mfJrqtLQUKBUXED/cCNpwMpEIE4G/
X-Gm-Message-State: AOJu0Yz9MXmCke+a5A8huEoGRKetbGrqyYneL7BzD+NjEQQoUt0kBJgS
	dYBdOPAo8KNrIReDKAh65eqNXxkyVQ/TgwsglJdD6APFqO7jfFrjXN/RY2noNvNN2Q==
X-Google-Smtp-Source: AGHT+IG+7Zfz1plga8zUj4Gkl4DC2F/IoY7CRHshz2XWZs7PjnkPVd0u5KNwhnxDdyg6fjTCJpT4+A==
X-Received: by 2002:a05:600c:1c27:b0:426:6f5f:9da6 with SMTP id 5b1f17b1804b1-4290af0a023mr4845555e9.27.1723093239101;
        Wed, 07 Aug 2024 22:00:39 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.187.212.120])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36d272290d4sm589085f8f.106.2024.08.07.22.00.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Aug 2024 22:00:38 -0700 (PDT)
Message-ID: <92a31c3d-f9f7-42ae-a008-667945b3561a@linaro.org>
Date: Thu, 8 Aug 2024 07:00:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 21/23] hw/misc: add support for RT500 reset controller
To: Octavian Purdila <tavip@google.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com,
 alex.bennee@linaro.org, thuth@redhat.com, peter.maydell@linaro.org,
 marcandre.lureau@redhat.com, alistair@alistair23.me, berrange@redhat.com,
 jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com
References: <20240805201719.2345596-1-tavip@google.com>
 <20240805201719.2345596-22-tavip@google.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240805201719.2345596-22-tavip@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 3KH1Z9s4oRBx

Hi Octavian,

On 5/8/24 22:17, Octavian Purdila wrote:
> The RT500 reset controller has two instances that have the same
> register layout but with different fields for some registers.
> 
> The model only provides set and clear functionality for the various
> reset lines which is common for both instances. Because of that only
> one type is implemented for both controllers.
> 
> Signed-off-by: Octavian Purdila <tavip@google.com>
> ---
>   hw/arm/svd/meson.build         |   8 ++
>   hw/misc/Kconfig                |   3 +
>   hw/misc/meson.build            |   1 +
>   hw/misc/rt500_rstctl.c         | 219 +++++++++++++++++++++++++++++++++
>   hw/misc/trace-events           |   4 +
>   include/hw/misc/rt500_rstctl.h |  38 ++++++
>   6 files changed, 273 insertions(+)
>   create mode 100644 hw/misc/rt500_rstctl.c
>   create mode 100644 include/hw/misc/rt500_rstctl.h


> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> index 68929949a6..5e2728e982 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -160,3 +160,4 @@ system_ss.add(when: 'CONFIG_LASI', if_true: files('lasi.c'))
>   system_ss.add(when: 'CONFIG_FLEXCOMM', if_true: files('flexcomm.c'))
>   system_ss.add(when: 'CONFIG_RT500_CLKCTL0', if_true: files('rt500_clkctl0.c'))
>   system_ss.add(when: 'CONFIG_RT500_CLKCTL1', if_true: files('rt500_clkctl1.c'))
> +system_ss.add(when: 'CONFIG_RT500_RSTCTL', if_true: files('rt500_rstctl.c'))
> diff --git a/hw/misc/rt500_rstctl.c b/hw/misc/rt500_rstctl.c
> new file mode 100644
> index 0000000000..2806a94150
> --- /dev/null
> +++ b/hw/misc/rt500_rstctl.c
> @@ -0,0 +1,219 @@
> +/*
> + * QEMU model for RT500 Reset Controller
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
> +#include "hw/irq.h"
> +#include "hw/qdev-properties.h"
> +#include "qemu/log.h"
> +#include "qemu/module.h"
> +#include "exec/address-spaces.h"
> +#include "hw/regs.h"
> +#include "hw/misc/rt500_rstctl.h"
> +
> +#include "trace.h"
> +
> +/*
> + * There are two intances for RSTCTL with the same register names but
> + * with different fields.
> + */
> +#define reg(field) offsetof(RT500_RSTCTL0_Type, field)
> +#define regi(x) (reg(x) / sizeof(uint32_t))
> +#define REG_NO (sizeof(RT500_RSTCTL0_Type) / sizeof(uint32_t))
> +
> +#define RSTCTL_SYSRSTSTAT_WMASK (BITS(7, 4) | BIT(0))
> +#define RSTCL0_PRSCTL0_WMASK (BITS(30, 26) | BITS(24, 20) | BIT(18) | \
> +                              BIT(16) | BITS(12, 8) | BIT(3) | BIT(1))
> +#define RSTCL0_PRSCTL1_WMASK (BIT(24) | BITS(16, 15) | BITS(3, 2))
> +#define RSTCL0_PRSCTL2_WMASK (BITS(1, 0))
> +#define RSTCL1_PRSCTL0_WMASK (BIT(29) | BIT(27) |  BITS(25, 8))
> +#define RSTCL1_PRSCTL1_WMASK (BIT(31) | BITS(29, 28) | BITS(24, 23) | \
> +                              BIT(16) | BITS(7, 0))
> +#define RSTCL1_PRSCTL2_WMASK (BITS(31, 30) | BITS(17, 16) | BIT(10) | \
> +                              BIT(8) | BITS(4, 0))
> +
> +static RT500_RSTCTL0_REGISTER_NAMES_ARRAY(reg_names);
> +
> +static MemTxResult rt500_rstctl_read(void *opaque, hwaddr addr,
> +                                     uint64_t *data, unsigned size,
> +                                     MemTxAttrs attrs)
> +{
> +    RT500RstCtlState *s = opaque;
> +    MemTxResult ret = MEMTX_OK;
> +
> +    if (s->num > 1 || !reg32_aligned_access(addr, size)) {

IIUC s->num is a model property set when the device is created,
and can not be changed by the guest. We want to check it
in rt500_rstctl_realize() so we can return an error when out
of range.

> +        ret = MEMTX_ERROR;
> +        goto out;
> +    }
> +
> +    switch (addr) {
> +    case reg(SYSRSTSTAT):
> +    case reg(PRSTCTL0):
> +    case reg(PRSTCTL1):
> +    case reg(PRSTCTL2):
> +        *data = reg32_read(&s->regs.ctl0, addr);
> +        break;
> +    default:
> +        ret = MEMTX_ERROR;
> +    }
> +
> +out:
> +    trace_rt500_rstctl_reg_read(DEVICE(s)->id, reg_names[addr], addr, *data);
> +    return ret;
> +}
> +
> +static MemTxResult rt500_rstctl_write(void *opaque, hwaddr addr,
> +                                      uint64_t value, unsigned size,
> +                                      MemTxAttrs attrs)
> +{
> +    RT500RstCtlState *s = opaque;
> +    static uint32_t mask0[REG_NO] = {

const

> +        [regi(SYSRSTSTAT)] = RSTCTL_SYSRSTSTAT_WMASK,
> +        [regi(PRSTCTL0)] = RSTCL0_PRSCTL0_WMASK,
> +        [regi(PRSTCTL1)] = RSTCL0_PRSCTL1_WMASK,
> +        [regi(PRSTCTL2)] = RSTCL0_PRSCTL2_WMASK,
> +        [regi(PRSTCTL0_SET)] = RSTCL0_PRSCTL0_WMASK,
> +        [regi(PRSTCTL1_SET)] = RSTCL0_PRSCTL1_WMASK,
> +        [regi(PRSTCTL2_SET)] = RSTCL0_PRSCTL2_WMASK,
> +        [regi(PRSTCTL0_CLR)] = RSTCL0_PRSCTL0_WMASK,
> +        [regi(PRSTCTL1_CLR)] = RSTCL0_PRSCTL1_WMASK,
> +        [regi(PRSTCTL2_CLR)] = RSTCL0_PRSCTL2_WMASK,
> +    };
> +    static uint32_t mask1[REG_NO] = {
> +        [regi(SYSRSTSTAT)] = RSTCTL_SYSRSTSTAT_WMASK,
> +        [regi(PRSTCTL0)] = RSTCL1_PRSCTL0_WMASK,
> +        [regi(PRSTCTL1)] = RSTCL1_PRSCTL1_WMASK,
> +        [regi(PRSTCTL2)] = RSTCL1_PRSCTL2_WMASK,
> +        [regi(PRSTCTL0_SET)] = RSTCL1_PRSCTL0_WMASK,
> +        [regi(PRSTCTL1_SET)] = RSTCL1_PRSCTL1_WMASK,
> +        [regi(PRSTCTL2_SET)] = RSTCL1_PRSCTL2_WMASK,
> +        [regi(PRSTCTL0_CLR)] = RSTCL1_PRSCTL0_WMASK,
> +        [regi(PRSTCTL1_CLR)] = RSTCL1_PRSCTL1_WMASK,
> +        [regi(PRSTCTL2_CLR)] = RSTCL1_PRSCTL2_WMASK,
> +    };

Possibly better, have a common abstract TYPE_RT500_RSTCTL class
and 2 TYPE_RT500_RSTCTL[01] concrete classes, wmask being set for
each rt500_rstctl[01]_class_init(). Then you don't need the "num"
property. See how hw/arm/raspi.c is modelled.

> +    uint32_t mask;
> +
> +    trace_rt500_rstctl_reg_write(DEVICE(s)->id, reg_names[addr], addr, value);
> +
> +    if (s->num > 1 || !reg32_aligned_access(addr, size)) {
> +        return MEMTX_ERROR;
> +    }
> +
> +    if (s->num == 0) {
> +        mask = mask0[addr / sizeof(uint32_t)];
> +    } else {
> +        mask = mask1[addr / sizeof(uint32_t)];
> +    }
> +
> +    switch (addr) {
> +    case reg(SYSRSTSTAT):
> +    {
> +        /* write 1 to clear bits */
> +        s->regs.ctl0.SYSRSTSTAT &= ~(value & mask);
> +        break;
> +    }
> +    case reg(PRSTCTL0):
> +    case reg(PRSTCTL1):
> +    case reg(PRSTCTL2):
> +    {
> +        uint32_t idx = addr / sizeof(uint32_t);
> +
> +        s->regs.raw[idx] = (value & mask);
> +        break;
> +    }
> +    case reg(PRSTCTL0_SET):
> +    case reg(PRSTCTL1_SET):
> +    case reg(PRSTCTL2_SET):
> +    {
> +        uint32_t idx;
> +
> +        idx = (reg(PRSTCTL0) + (addr - reg(PRSTCTL0_SET))) / sizeof(uint32_t);
> +        s->regs.raw[idx] |= (value & mask);
> +        break;
> +    }
> +    case reg(PRSTCTL0_CLR):
> +    case reg(PRSTCTL1_CLR):
> +    case reg(PRSTCTL2_CLR):
> +    {
> +        uint32_t idx;
> +
> +        idx = (reg(PRSTCTL0) + (addr - reg(PRSTCTL0_CLR))) / sizeof(uint32_t);
> +        s->regs.raw[idx] &= ~(value & mask);
> +        break;
> +    }
> +    }
> +
> +    return MEMTX_OK;
> +}
> +
> +
> +static const MemoryRegionOps rt500_rstctl_ops = {
> +    .read_with_attrs = rt500_rstctl_read,
> +    .write_with_attrs = rt500_rstctl_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +};
> +
> +static Property rt500_rstctl_properties[] = {
> +    DEFINE_PROP_UINT32("num", RT500RstCtlState, num, 0),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void rt500_rstctl_reset(DeviceState *dev)
> +{
> +    RT500RstCtlState *s = RT500_RSTCTL(dev);
> +
> +    memset(&s->regs, 0, sizeof(s->regs));
> +
> +    switch (s->num) {
> +    case 0:
> +        rt500_rstctl0_reset_registers(&s->regs.ctl0);
> +        break;
> +    case 1:
> +        rt500_rstctl1_reset_registers(&s->regs.ctl1);
> +        break;
> +    }
> +}
> +
> +static void rt500_rstctl_init(Object *obj)
> +{
> +    RT500RstCtlState *s = RT500_RSTCTL(obj);
> +
> +    memory_region_init_io(&s->mmio, obj, &rt500_rstctl_ops, s,
> +                          TYPE_RT500_RSTCTL, sizeof(s->regs));
> +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
> +}
> +
> +static void rt500_rstctl_realize(DeviceState *dev, Error **errp)
> +{
> +}
> +
> +static void rt500_rstctl_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->reset = rt500_rstctl_reset;
> +    device_class_set_props(dc, rt500_rstctl_properties);
> +    dc->realize = rt500_rstctl_realize;
> +}
> +
> +static const TypeInfo rt500_rstctl_info = {
> +    .name          = TYPE_RT500_RSTCTL,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(RT500RstCtlState),
> +    .instance_init = rt500_rstctl_init,
> +    .class_init    = rt500_rstctl_class_init,
> +};
