Received: by 2002:a17:505:1e8b:b0:1be9:327d:8ee3 with SMTP id mw11csp1245056njb;
        Tue, 6 Aug 2024 07:51:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUEHXBpYPRxCx+QO2cogbxHUefxMaR6tbJXX0vDpVjFM0e0SzQHNY2mC/LlFm/c7oEwxIi/SM/jZLHQUyinkfYPE+HICnRF
X-Received: by 2002:a05:6512:1189:b0:52c:daa7:8975 with SMTP id 2adb3069b0e04-530bb39788fmr11385585e87.18.1722955898092;
        Tue, 06 Aug 2024 07:51:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722955898; cv=none;
        d=google.com; s=arc-20160816;
        b=qrMbOnybbmdikL/UmJc5rKK0pfrVZuCkDH+371Nfqh5OTObbWVl8vtu1apam1syDy9
         BRWruMPmWONFxKqRek439kBNEvUGrBGsni/t+E23M81IBmSKAjEZx5mHdNn0OS5LU9Ka
         2nujKewqkSlkdvs5CFnY6Eomcdzk1lum1c36ervTSJeX/93zGM6XK8amZpwxWGPzRAVq
         9F/SYFhJ0VMRjv3NwUkd4MuuK66qQFKQ2TSYKpllxKjOquD1i8BGloD5+jL3aOmZE52Q
         fJFXfHu3oB4FFj8DYZ/h3qJWBRWHgh2/3dgKCt/Tg4gQZmFwooUf4KW39vChbWWiXeWx
         KXZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=iXESy4XjNfOB5fDZVIQB6FXyT4kJ4xMiItE1SCk6V2A=;
        fh=kUKh5WTq4jRbYbzjr+Xeyu8vIoe0abU/ZtzVDoTJB/k=;
        b=mFcN+KmApsjz0kLADjmThZVEV0RndJMS99Z1PZC8GCZEP8WRiD2gKo52l15POGKL7w
         5UX2YOISj1joP6c3o1A/XI1q/sXIApDfNA5DZZD3oxol69Qvmx9RP6caprW/1mf26C9H
         Rm7cBAxhOeRX3RrD+EBwJsqbXA90OGSxMQ+3ic0KCKAO3PCoVe1hNMGM2yS24ReLGlKo
         7sVvT15sqELxdTcaBI3b/hlyjWTchmz6Llf2uukJT1e3ydXcGtj+zyL6r4qMJqXEopYK
         tlzV29o48IXn00HiPLWzFtpJhjhuXUhI26i+IdLRUP/LicJK/doWOYFBx8ubSCwPtQ4X
         HSIw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ici5dMkW;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-530bba29a5csor2534484e87.23.2024.08.06.07.51.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 06 Aug 2024 07:51:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ici5dMkW;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722955897; x=1723560697; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iXESy4XjNfOB5fDZVIQB6FXyT4kJ4xMiItE1SCk6V2A=;
        b=ici5dMkWdm4c9Tvl8mlk8Nz45psaO0ezm/E/qZbi2sSd2EHTDdUpB1Wyq8vTc+Wj0w
         FfT7cbSK0pL0s10TfJOLCDL65z9OjWqPozLflMtUhkNchlycUWnb64I+get8t1eJCJFo
         c11ovFEjhndeEkPX66gRCsT7YlAnIlMT0Xl+DRP2ast/Mqr17Um/og6hmWCtWrTBK5Zj
         hL55XhmhngCDlM3TJk4btIPCg0iwygnmiCMl9ecouTmvLtf09ttw3Tw6PpwnU08y9O2G
         rm3l8chQtwV7dIIlhAelWT6NNXmvAom4mbTGJZypAT1WEI/j+fkzT6ob7OlDBi8ZjtQA
         Bxxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722955897; x=1723560697;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iXESy4XjNfOB5fDZVIQB6FXyT4kJ4xMiItE1SCk6V2A=;
        b=THJRFh80+KlLtQl7BebI/9nj+lN6i7ets6aexykb04p+6l/0a2zDzHPsTlFrnVLIO7
         yU6N396tYKZjpMTmXX/p6IvZY3Iyj3AQinpr57YaJ72xF0OsmTQm0BN2U9R/QIB5X3+9
         n0ax0N7m2YPy8WIPi1Vx44bVtR8Y3gJfJFO3WMelUSFU/SPCaSKTsR1KB7wGqwzoJRan
         cJ/e4s+SQoOL4zUYIeXpGIXgICELPBRoKcB2GexaMlY2j8tcHR44HxVQW126lNFWaOPs
         HaGtqPoL5psxo5J4gHsuVEpsgbC/jjfsDEkphx+YlzF1Pq02o64uitdiBNNTza/1UcXO
         txvg==
X-Forwarded-Encrypted: i=1; AJvYcCXTnH/UTYGHlVc2vepl7NCud977uJ8W1/cyLCS6KYpRLUSn2O/t51wBgOoYhUD8q7DBefAzP19C44TWvrDwgSCC9PPyehDV
X-Gm-Message-State: AOJu0Ywxlr1ZbnaZcg/yUfvgiAPTx5YJhQy0UqaZ49aJhWyLmnp5gMBN
	jys+oBSCCMf/mv7OQ3SLmgRS0mhrpQvGk+z3qXzb2DHth/YuFKbNakXpYUn+gmi6Cg==
X-Google-Smtp-Source: AGHT+IGSw/bY6cCR7X9UuHUO1HoWRwm1HQO3qraDU7xKg640AteB+QezKCbASF/jZrGlCWb8Up6q5w==
X-Received: by 2002:a05:6512:131e:b0:52c:952a:67da with SMTP id 2adb3069b0e04-530bb4d6d4fmr10164447e87.55.1722955897220;
        Tue, 06 Aug 2024 07:51:37 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (cor91-h02-176-184-30-206.dsl.sta.abo.bbox.fr. [176.184.30.206])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9ec7173sm550750666b.204.2024.08.06.07.51.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 07:51:36 -0700 (PDT)
Message-ID: <a37a5291-5917-45e6-8697-08defb97ac29@linaro.org>
Date: Tue, 6 Aug 2024 16:51:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 22/23] hw/arm: add basic support for the RT500 SoC
To: Octavian Purdila <tavip@google.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com,
 alex.bennee@linaro.org, thuth@redhat.com, peter.maydell@linaro.org,
 marcandre.lureau@redhat.com, alistair@alistair23.me, berrange@redhat.com,
 jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com
References: <20240805201719.2345596-1-tavip@google.com>
 <20240805201719.2345596-23-tavip@google.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240805201719.2345596-23-tavip@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: hx1kpfncInuZ

Hi Octavian,

Few comments inlined.

On 5/8/24 22:17, Octavian Purdila wrote:
> Add basic support for the RT500 SoC. It supports enough peripherals to
> run the NXP's microXpresso SDK hello world example.
> 
> Signed-off-by: Octavian Purdila <tavip@google.com>
> ---
>   hw/arm/Kconfig         |   8 +
>   hw/arm/meson.build     |   1 +
>   hw/arm/rt500.c         | 348 +++++++++++++++++++++++++++++++++++++++++
>   hw/arm/svd/meson.build |   6 +
>   include/hw/arm/rt500.h |  49 ++++++
>   5 files changed, 412 insertions(+)
>   create mode 100644 hw/arm/rt500.c
>   create mode 100644 include/hw/arm/rt500.h

If possible please setup scripts/git.orderfile, it help to
review.

> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 1ad60da7aa..7ffece3dec 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -712,3 +712,11 @@ config ARMSSE
>       select UNIMP
>       select SSE_COUNTER
>       select SSE_TIMER
> +
> +config RT500
> +    bool
> +    select FLEXCOMM
> +    select RT500_CLKCTL0
> +    select RT500_CLKCTL1
> +    select FLEXSPI
> +    select RT500_RSTCTL
> diff --git a/hw/arm/meson.build b/hw/arm/meson.build
> index eb604d00cf..7d827d512c 100644
> --- a/hw/arm/meson.build
> +++ b/hw/arm/meson.build
> @@ -59,6 +59,7 @@ arm_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmuv3.c'))
>   arm_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-evk.c'))
>   arm_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
>   arm_ss.add(when: 'CONFIG_XEN', if_true: files('xen_arm.c'))
> +arm_ss.add(when: 'CONFIG_RT500', if_true: files('rt500.c'))
>   
>   system_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c'))
>   system_ss.add(when: 'CONFIG_CHEETAH', if_true: files('palm.c'))
> diff --git a/hw/arm/rt500.c b/hw/arm/rt500.c
> new file mode 100644
> index 0000000000..0866ef3ef6
> --- /dev/null
> +++ b/hw/arm/rt500.c
> @@ -0,0 +1,348 @@
> +/*
> + * i.MX RT500 platforms.
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
> +#include "qapi/error.h"
> +#include "hw/sysbus.h"
> +#include "hw/arm/boot.h"
> +#include "hw/boards.h"
> +#include "hw/irq.h"
> +#include "qemu/log.h"
> +#include "qemu/datadir.h"
> +#include "exec/address-spaces.h"
> +#include "sysemu/reset.h"
> +#include "sysemu/runstate.h"
> +#include "sysemu/sysemu.h"
> +#include "hw/arm/armv7m.h"
> +#include "hw/loader.h"
> +#include "hw/qdev-clock.h"
> +#include "hw/misc/unimp.h"
> +#include "hw/arm/rt500.h"
> +#include "hw/arm/svd/rt500.h"
> +
> +#define MMAP_SRAM_CODE_BASE   (0x0)
> +#define MMAP_SRAM_DATA_BASE   (0x20000000)
> +#define MMAP_SRAM_SIZE        (5 * MiB)
> +#define MMAP_BOOT_ROM_BASE    (0x03000000)
> +#define MMAP_BOOT_ROM_SIZE    (192 * KiB)
> +#define MMAP_SDMA_RAM_BASE    (0x24100000)
> +#define MMAP_SDMA_RAM_SIZE    (32 * KiB)
> +#define MMAP_FLEXSPI0_BASE    (0x08000000)
> +#define MMAP_FLEXSPI0_SIZE    (128 * MiB)
> +#define MMAP_FLEXSPI1_BASE    (0x28000000)
> +#define MMAP_FLEXSPI1_SIZE    (128 * MiB)
> +
> +#define SECURE_OFFSET    (0x10000000)
> +
> +typedef enum MemInfoType {
> +    MEM_RAM,
> +    MEM_ROM,
> +    MEM_ALIAS
> +} MemInfoType;
> +
> +static void do_sys_reset(void *opaque, int n, int level)
> +{
> +    if (level) {
> +        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
> +    }
> +}
> +
> +static void rt500_init(Object *obj)
> +{
> +    RT500State *s = RT500(obj);
> +    int i;
> +
> +    /* Add ARMv7-M device */
> +    object_initialize_child(obj, "armv7m", &s->armv7m, TYPE_ARMV7M);
> +
> +    for (i = 0; i < RT500_FLEXCOMM_NUM; i++) {
> +        char id[] = "flexcommXX";
> +
> +        snprintf(id, sizeof(id), "flexcomm%d", i);
> +        object_initialize_child(obj, id, &s->flexcomm[i], TYPE_FLEXCOMM);
> +        DEVICE(&s->flexcomm[i])->id = g_strdup(id);

Directly g_strdup_printf().

> +    }
> +
> +    object_initialize_child(obj, "clkctl0", &s->clkctl0, TYPE_RT500_CLKCTL0);
> +    object_initialize_child(obj, "clkctl1", &s->clkctl1, TYPE_RT500_CLKCTL1);
> +
> +    /* Initialize clocks */
> +    s->sysclk = qdev_init_clock_in(DEVICE(s), "sysclk", NULL, NULL, 0);
> +    s->refclk = qdev_init_clock_in(DEVICE(s), "refclk", NULL, NULL, 0);
> +
> +    for (i = 0; i < RT500_FLEXSPI_NUM; i++) {
> +        char id[] = "flexspiXX";
> +
> +        snprintf(id, sizeof(id), "flexspi%d", i);
> +        object_initialize_child(obj, id, &s->flexspi[i], TYPE_FLEXSPI);
> +        DEVICE(&s->flexspi[i])->id = g_strdup(id);
> +    }
> +
> +    for (i = 0; i < RT500_RSTCTL_NUM; i++) {
> +        char id[] = "rstctlX";
> +
> +        snprintf(id, sizeof(id), "rstctl%d", i);
> +        object_initialize_child(obj, id, &s->rstctl[i],
> +                                TYPE_RT500_RSTCTL);
> +        DEVICE(&s->rstctl[i])->id = g_strdup(id);
> +    }
> +}
> +
> +static void rt500_realize_memory(RT500State *s, Error **errp)
> +{

static

> +    const struct {
> +        const char *name;
> +        hwaddr base;
> +        size_t size;
> +        MemInfoType type;
> +        int alias_for;
> +    } mem_info[] = {
> +        {
> +            .name = "SRAM (code bus)",
> +            .base = MMAP_SRAM_CODE_BASE,
> +            .size = MMAP_SRAM_SIZE,
> +            .type = MEM_RAM,
> +        },
> +        {
> +            .name = "BOOT-ROM",
> +            .base = MMAP_BOOT_ROM_BASE,
> +            .size = MMAP_BOOT_ROM_SIZE,
> +            .type = MEM_ROM,
> +        },
> +        {
> +            .name = "Smart DMA RAM",
> +            .base = MMAP_SDMA_RAM_BASE,
> +            .size = MMAP_SDMA_RAM_SIZE,
> +            .type = MEM_RAM,
> +        },
> +        {
> +            .name = "SRAM (data bus)",
> +            .base = MMAP_SRAM_DATA_BASE,
> +            .size = MMAP_SRAM_SIZE,
> +            .type = MEM_ALIAS,
> +            .alias_for = 0
> +        },
> +    };
> +    int i;
> +
> +    s->mem = g_malloc_n(2 * ARRAY_SIZE(mem_info), sizeof(MemoryRegion));
> +    for (i = 0; i < ARRAY_SIZE(mem_info); i++) {
> +        const char *name = mem_info[i].name;
> +        int size = mem_info[i].size;
> +        int type = mem_info[i].type;
> +        int alias_for = mem_info[i].alias_for;
> +        MemoryRegion *mem = &s->mem[i];
> +        uint32_t base = mem_info[i].base;
> +        MemoryRegion *sec_mem;
> +        char sec_name[256];
> +
> +        switch (type) {
> +        case MEM_RAM:
> +            memory_region_init_ram(mem, OBJECT(s), name, size, errp);
> +            break;
> +        case MEM_ROM:
> +            memory_region_init_rom(mem, OBJECT(s), name, size, errp);
> +            break;
> +        case MEM_ALIAS:
> +        {
> +            MemoryRegion *orig = &s->mem[alias_for];
> +
> +            memory_region_init_alias(mem, OBJECT(s), name, orig, 0, size);
> +            break;
> +        }
> +        default:
> +            g_assert_not_reached();
> +        }
> +
> +        memory_region_add_subregion(get_system_memory(), base, mem);
> +
> +        /* create secure alias */
> +        snprintf(sec_name, sizeof(sec_name), "SECURE %s", name);
> +        sec_mem = &s->mem[ARRAY_SIZE(mem_info) + i];
> +        if (type == MEM_ALIAS) {
> +            mem = &s->mem[alias_for];
> +        }
> +        memory_region_init_alias(sec_mem, OBJECT(s), sec_name, mem, 0, size);
> +        memory_region_add_subregion(get_system_memory(), base + SECURE_OFFSET,
> +                                    sec_mem);
> +
> +        if (mem_info[i].type == MEM_ROM) {
> +            char *fname = qemu_find_file(QEMU_FILE_TYPE_BIOS, "rt500.rom");
> +
> +            if (fname) {
> +                int fsize = get_image_size(fname);
> +                int ret;
> +
> +                if (fsize > size) {
> +                    error_setg(errp, "rom file too big: %d > %d", fsize, size);
> +                } else {
> +                    ret = load_image_targphys(fname, base, size);
> +                    if (ret < 0) {
> +                        error_setg(errp, "could not load rom: %s", fname);
> +                    }
> +                }
> +            }
> +            g_free(fname);
> +        }
> +    }
> +}
> +
> +static void rt500_realize(DeviceState *dev, Error **errp)
> +{
> +    MachineState *ms = MACHINE(qdev_get_machine());
> +    RT500State *s = RT500(dev);
> +    int i;

Preferably reduce iterator variables scope.

> +
> +    rt500_realize_memory(s, errp);
> +
> +    /* Setup ARMv7M CPU */
> +    qdev_prop_set_uint32(DEVICE(&s->armv7m), "num-irq",
> +                         RT500_FLEXCOMM16_IRQn + 1);

Preferably a definition:

#define RT500_NUM_IRQ (RT500_FLEXCOMM16_IRQn + 1)

> +    qdev_prop_set_uint8(DEVICE(&s->armv7m), "num-prio-bits", 3);
> +    qdev_prop_set_string(DEVICE(&s->armv7m), "cpu-type", ms->cpu_type);

Do you plan to add RT500 machines not based on the Cortex-M33?
Otherwise simpler to hardcode the CPU type here.

> +    object_property_set_link(OBJECT(&s->armv7m), "memory",
> +                             OBJECT(get_system_memory()), &error_abort);
> +    if (!ms->kernel_filename) {
> +        qdev_prop_set_uint32(DEVICE(&s->armv7m), "init-nsvtor",
> +                             MMAP_BOOT_ROM_BASE);
> +        qdev_prop_set_uint32(DEVICE(&s->armv7m), "init-svtor",
> +                             MMAP_BOOT_ROM_BASE + SECURE_OFFSET);
> +    }
> +
> +    qdev_connect_clock_in(DEVICE(&s->armv7m), "cpuclk", s->sysclk);
> +    qdev_connect_clock_in(DEVICE(&s->armv7m), "refclk",
> +                     qdev_get_clock_out(DEVICE(&s->clkctl0), "systick_clk"));
> +
> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(&s->armv7m), errp);
> +    qdev_connect_gpio_out_named(DEVICE(&s->armv7m), "SYSRESETREQ", 0,
> +                                qemu_allocate_irq(&do_sys_reset, NULL, 0));
> +
> +    /* Setup FLEXCOMM */
> +    for (i = 0; i < RT500_FLEXCOMM_NUM; i++) {
> +        const uint32_t addr[] = {

static

> +            RT500_FLEXCOMM0_BASE, RT500_FLEXCOMM1_BASE, RT500_FLEXCOMM2_BASE,
> +            RT500_FLEXCOMM3_BASE, RT500_FLEXCOMM4_BASE, RT500_FLEXCOMM5_BASE,
> +            RT500_FLEXCOMM6_BASE, RT500_FLEXCOMM7_BASE, RT500_FLEXCOMM8_BASE,
> +            RT500_FLEXCOMM8_BASE, RT500_FLEXCOMM10_BASE, RT500_FLEXCOMM11_BASE,
> +            RT500_FLEXCOMM12_BASE, RT500_FLEXCOMM13_BASE, RT500_FLEXCOMM14_BASE,
> +            RT500_FLEXCOMM15_BASE, RT500_FLEXCOMM16_BASE
> +        };
> +        const int irq[] = {
> +            RT500_FLEXCOMM0_IRQn, RT500_FLEXCOMM1_IRQn, RT500_FLEXCOMM2_IRQn,
> +            RT500_FLEXCOMM3_IRQn, RT500_FLEXCOMM4_IRQn, RT500_FLEXCOMM5_IRQn,
> +            RT500_FLEXCOMM6_IRQn, RT500_FLEXCOMM7_IRQn, RT500_FLEXCOMM8_IRQn,
> +            RT500_FLEXCOMM9_IRQn, RT500_FLEXCOMM10_IRQn, RT500_FLEXCOMM11_IRQn,
> +            RT500_FLEXCOMM12_IRQn, RT500_FLEXCOMM13_IRQn, RT500_FLEXCOMM14_IRQn,
> +            RT500_FLEXCOMM15_IRQn, RT500_FLEXCOMM16_IRQn
> +        };
> +        const int functions[] = {
> +            FLEXCOMM_FULL, FLEXCOMM_FULL, FLEXCOMM_FULL,
> +            FLEXCOMM_FULL, FLEXCOMM_FULL, FLEXCOMM_FULL,
> +            FLEXCOMM_FULL, FLEXCOMM_FULL, FLEXCOMM_FULL,
> +            FLEXCOMM_FULL, FLEXCOMM_FULL, FLEXCOMM_FULL,
> +            FLEXCOMM_FULL, FLEXCOMM_FULL, FLEXCOMM_HSSPI,
> +            FLEXCOMM_PMICI2C, FLEXCOMM_HSSPI
> +        };
> +        DeviceState *ds = DEVICE(&s->flexcomm[i]);
> +        char id[] = "flexcommXX";
> +
> +        snprintf(id, sizeof(id), "flexcomm%d", i);
> +        qdev_prop_set_uint32(ds, "functions", functions[i]);
> +        qdev_prop_set_chr(ds, "chardev", qemu_chr_find(id));
> +        sysbus_realize_and_unref(SYS_BUS_DEVICE(ds), errp);
> +        sysbus_mmio_map(SYS_BUS_DEVICE(ds), 0, addr[i]);
> +        sysbus_connect_irq(SYS_BUS_DEVICE(ds), 0,
> +                           qdev_get_gpio_in(DEVICE(&s->armv7m), irq[i]));
> +    }
> +
> +    /* Setup CTLCTL0 */
> +    qdev_connect_clock_in(DEVICE(&s->clkctl0), "sysclk", s->sysclk);
> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(DEVICE(&s->clkctl0)), errp);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(DEVICE(&s->clkctl0)), 0, RT500_CLKCTL0_BASE);
> +
> +    /* Setup CTLCTL1 */
> +    qdev_connect_clock_in(DEVICE(&s->clkctl1), "sysclk", s->sysclk);
> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(DEVICE(&s->clkctl1)), errp);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(DEVICE(&s->clkctl1)), 0, RT500_CLKCTL1_BASE);
> +
> +    /* Setup FlexSPI */
> +    for (i = 0; i < RT500_FLEXSPI_NUM; i++) {
> +        const uint32_t addr[] = {

static

> +            RT500_FLEXSPI0_BASE, RT500_FLEXSPI1_BASE
> +        };
> +        const uint32_t mmap_base[] = {
> +            MMAP_FLEXSPI0_BASE, MMAP_FLEXSPI1_BASE
> +        };
> +        const uint32_t mmap_size[] = {
> +            MMAP_FLEXSPI0_SIZE, MMAP_FLEXSPI1_SIZE,
> +        };
> +        DeviceState *ds = DEVICE(&s->flexspi[i]);
> +
> +        qdev_prop_set_uint32(ds, "mmap_base", mmap_base[i]);
> +        qdev_prop_set_uint32(ds, "mmap_size", mmap_size[i]);
> +        sysbus_realize_and_unref(SYS_BUS_DEVICE(ds), errp);
> +        sysbus_mmio_map(SYS_BUS_DEVICE(ds), 0, addr[i]);
> +    }
> +
> +    /* Setup reset controllers */
> +    for (i = 0; i < RT500_RSTCTL_NUM; i++) {
> +        DeviceState *ds = DEVICE(&s->rstctl[i]);
> +
> +        const uint32_t addr[] = {

static

> +            RT500_RSTCTL0_BASE, RT500_RSTCTL1_BASE
> +        };
> +
> +        qdev_prop_set_uint32(ds, "num", i);
> +        sysbus_realize_and_unref(SYS_BUS_DEVICE(ds), errp);
> +        sysbus_mmio_map(SYS_BUS_DEVICE(ds), 0, addr[i]);
> +    }
> +}
> +
> +static void rt500_finalize(Object *obj)
> +{
> +    RT500State *s = RT500(obj);
> +
> +    g_free(s->mem);

Allocated via rt500_realize() -> rt500_realize_memory() so
to be released in a DeviceUnrealize() handler.

> +}
> +
> +static void rt500_reset(DeviceState *ds)
> +{
> +}
> +
> +static Property rt500_properties[] = {

To be filled later?

> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void rt500_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    device_class_set_props(dc, rt500_properties);
> +    dc->realize = rt500_realize;
> +    dc->desc = "RT500 (ARM Cortex-M33)";
> +    dc->reset = rt500_reset;
> +}
> +
> +static const TypeInfo rt500_type_info = {
> +    .name = TYPE_RT500,
> +    .parent = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(RT500State),
> +    .instance_init = rt500_init,
> +    .instance_finalize = rt500_finalize,
> +    .class_init = rt500_class_init,
> +};
> +
> +static void rt500_register_types(void)
> +{
> +    type_register_static(&rt500_type_info);

Preferably use the DEFINE_TYPES() macro.

> +}
> +
> +type_init(rt500_register_types)
> diff --git a/hw/arm/svd/meson.build b/hw/arm/svd/meson.build
> index 72a7421c6f..930a8b7343 100644
> --- a/hw/arm/svd/meson.build
> +++ b/hw/arm/svd/meson.build
> @@ -34,3 +34,9 @@ genh += custom_target('rt500_rstctl1.h',
>                         output: 'rt500_rstctl1.h',
>                         input: 'MIMXRT595S_cm33.xml',
>                         command: [ svd_gen_header, '-i', '@INPUT@', '-o', '@OUTPUT@', '-p', 'RSTCTL1', '-t', 'RT500_RSTCTL1'])
> +genh += custom_target('rt500.h',
> +                      output: 'rt500.h',
> +                      input: 'MIMXRT595S_cm33.xml',
> +                      command: [ svd_gen_header,'-i', '@INPUT@', '-o', '@OUTPUT@', '-s', 'RT500',
> +		                 '-p', 'FLEXCOMM0', '-p', 'CLKCTL0', '-p', 'CLKCTL1',
> +				 '-p', 'FLEXSPI0', '-p', 'FLEXSPI1', '-p', 'RSTCTL0', '-p', 'RSTCTL1'])
> diff --git a/include/hw/arm/rt500.h b/include/hw/arm/rt500.h
> new file mode 100644
> index 0000000000..8ca7972f8a
> --- /dev/null
> +++ b/include/hw/arm/rt500.h
> @@ -0,0 +1,49 @@
> +/*
> + * i.MX RT500 platforms.
> + *
> + * Copyright (c) 2024 Google LLC
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * Contributions after 2012-01-13 are licensed under the terms of the
> + * GNU GPL, version 2 or (at your option) any later version.
> + */
> +
> +#ifndef HW_ARM_RT500_H
> +#define HW_ARM_RT500_H
> +
> +#include "qemu/osdep.h"

No osdep.h in header.

> +#include "qemu/units.h"

Not used (move to source).

> +#include "hw/arm/boot.h"

Not used.

> +#include "hw/arm/armv7m.h"
> +#include "hw/misc/flexcomm.h"
> +#include "hw/misc/rt500_clkctl0.h"
> +#include "hw/misc/rt500_clkctl1.h"
> +#include "hw/ssi/flexspi.h"
> +#include "hw/misc/rt500_rstctl.h"
> +
> +#define TYPE_RT500 "rt500"
> +#define RT500(obj) OBJECT_CHECK(RT500State, (obj), TYPE_RT500)
> +
> +#define RT500_FLEXCOMM_NUM (17)
> +#define RT500_FLEXSPI_NUM (2)
> +#define RT500_RSTCTL_NUM (2)
> +
> +typedef struct RT500State {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +
> +    /*< public >*/

Please drop private/public comments.

> +    ARMv7MState armv7m;
> +    MemoryRegion *mem;
> +    FlexcommState flexcomm[RT500_FLEXCOMM_NUM];
> +    RT500ClkCtl0State clkctl0;
> +    RT500ClkCtl1State clkctl1;
> +    FlexSpiState flexspi[RT500_FLEXSPI_NUM];
> +    RT500RstCtlState rstctl[RT500_RSTCTL_NUM];
> +
> +    Clock *sysclk;
> +    Clock *refclk;
> +} RT500State;
> +
> +#endif /* HW_ARM_RT500_H */

LGTM,

Phil.
