Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp551444lff;
        Sat, 18 Jan 2020 07:22:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqw4wxRsY2WpH3A9iomVZ9EfT04BsoouhXw0joHodM5Kn+8yCl1lRNU3mB1qSf5VuTgpzffS
X-Received: by 2002:a25:5509:: with SMTP id j9mr28225994ybb.361.1579360973659;
        Sat, 18 Jan 2020 07:22:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579360973; cv=none;
        d=google.com; s=arc-20160816;
        b=TyVHpaM0NhQWxSBbPpUMdfsPc+kJLqsFQyjgMoj3u+a26UKu9x+nOqHZIjpxk1riH3
         TPpvPwuugS19CfDWH6fEh75upQ3dSS0P7VBlsrWAZIejS5vG2x+qZt4hPcB6hlK1awk4
         YLoAO/0bbq4LjQAUvpmZpigXhpI/6cNb0kyg3CifvL1uhc9mZ0xfU/u7kWwYcssDhb8m
         SojK0Wzy+UVjN7lbv+xXgxm42KcVqTG9nuzxDsRgF7tB2j8Gec8CqE+1eQi5tsk4BIIA
         2ojGBIibTYS/iEo2whZZA647tZFBvFHxVkUVTaQpJFWin86m/o2xhn5Qk/u2IajgLIAO
         pUDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=rDpchSfdaMh9+4YeQ5mE9t6vaw3BV+l1rHGEIiJ92TM=;
        b=tF7yaatVR9fKOx2ZRRGhJQpfgblmIOrih7e0AvRUzMmTPqkQH+FiO7ICy7JthT+1rB
         w0xz7mHVVCu88H/Sz1gZQXHSkwS9Y4bN46vH4znHASbQrPyQ+2OJRhr/dY1Zf/BAQpzN
         4C8z57l21zS+8gj3lHeSmyBemi2JnsL29k/Z9slr7QvhUhJFt1wfEKuZ0GfeK9Bs0CWG
         Gkw5z1tX/xS25/VeevAe68APVtNjj2rZkQ5JfafVpL6P3nwAqPewMUysIWm3B8AmlS84
         0bpCDR8UCxnpkqheURpX7AJcaYBaYNMw2phJ1DvtkauO6fdw2OWeFcxQVceBHTM8sRx9
         dd/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PF8M2WT6;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id c124si18181932yba.236.2020.01.18.07.22.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 18 Jan 2020 07:22:53 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PF8M2WT6;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579360972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rDpchSfdaMh9+4YeQ5mE9t6vaw3BV+l1rHGEIiJ92TM=;
	b=PF8M2WT65Ndb+9hmpEvvLvcYBbKBa15VkwgTHa3nns6xWSTRCH4SrxGY3hr8qLXr4dHmsx
	8K56/PhxL3VsmnLB565aPmx1Yh/itoQk6ApujrFFiZSNT3vcuQqdNyPG/uZ6gIENZa6Awd
	UBpOUKxzWaoyJ+EGohc6pEmGvVwvsnc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-6373smOwOXSmZ-WDFtLYog-1; Sat, 18 Jan 2020 10:22:51 -0500
Received: by mail-wr1-f72.google.com with SMTP id f15so11945109wrr.2
        for <alex.bennee@linaro.org>; Sat, 18 Jan 2020 07:22:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rDpchSfdaMh9+4YeQ5mE9t6vaw3BV+l1rHGEIiJ92TM=;
        b=rquq2Xx/IaHTrGcH76r25x0NKdbKtTFYf701/btDlsAVjP4UoOkKE4Las4rKmzXzYM
         kxR4tKa81RL6dHv6GgPm5aAOqNdW/6+DYO2WfBG2XwDwWyhlUDeM7bGgtDE7pPCb8m9A
         DQPK2v1CH5LSdET0UuW4v+fPqZ7Ot2lmlKZg3Wg8ajX1Ilj5If4AlBnOESybjMZO6jLU
         3sq41wacBZXlHffAyxW2vEy0eA9o+8AK0zHCINkTpL7pUnBMvOI5/ORcYFjOe9rKPMR2
         tC4RQNkiz+mkfetwhdyHzHJRHzpsc5fuAdHCzKMES6Mg1SWBusabKIuzJePH/OQIB837
         M/hg==
X-Gm-Message-State: APjAAAX//gNulVFjVkEmwytH7l7hRxNA/YDx8LTRqMs4paJmtcjFJphv
	XpL140Snr9b9lKxxlFwSuF6hZooF6sOi71CkCOLumfhgaQQuzUD4T78qPmoPp+ZyM9U3dqP7WJH
	C0lBXK15Y8UrvP406
X-Received: by 2002:a05:600c:224a:: with SMTP id a10mr10163511wmm.143.1579360970169;
        Sat, 18 Jan 2020 07:22:50 -0800 (PST)
X-Received: by 2002:a05:600c:224a:: with SMTP id a10mr10163487wmm.143.1579360969796;
        Sat, 18 Jan 2020 07:22:49 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.113])
        by smtp.gmail.com with ESMTPSA id n189sm663578wme.33.2020.01.18.07.22.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Jan 2020 07:22:49 -0800 (PST)
Subject: Re: [PATCH v3 11/17] hw/arm/allwinner-h3: add SDRAM controller device
To: Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20200108200020.4745-1-nieklinnenbank@gmail.com>
 <20200108200020.4745-12-nieklinnenbank@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d8790c24-7d39-87eb-be95-f5ea16e88f17@redhat.com>
Date: Sat, 18 Jan 2020 16:22:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200108200020.4745-12-nieklinnenbank@gmail.com>
Content-Language: en-US
X-MC-Unique: 6373smOwOXSmZ-WDFtLYog-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: uqiFc9qGB1II

Cc'ing Igor and Alex for this one.

On 1/8/20 9:00 PM, Niek Linnenbank wrote:
> In the Allwinner H3 SoC the SDRAM controller is responsible
> for interfacing with the external Synchronous Dynamic Random
> Access Memory (SDRAM). Types of memory that the SDRAM controller
> supports are DDR2/DDR3 and capacities of up to 2GiB. This commit
> adds emulation support of the Allwinner H3 SDRAM controller.
> 
> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> ---
>   include/hw/arm/allwinner-h3.h        |   5 +
>   include/hw/misc/allwinner-h3-dramc.h | 107 ++++++++
>   hw/arm/allwinner-h3.c                |  19 +-
>   hw/arm/orangepi.c                    |   6 +
>   hw/misc/allwinner-h3-dramc.c         | 358 +++++++++++++++++++++++++++
>   hw/misc/Makefile.objs                |   1 +
>   hw/misc/trace-events                 |  10 +
>   7 files changed, 503 insertions(+), 3 deletions(-)
>   create mode 100644 include/hw/misc/allwinner-h3-dramc.h
>   create mode 100644 hw/misc/allwinner-h3-dramc.c
> 
> diff --git a/include/hw/arm/allwinner-h3.h b/include/hw/arm/allwinner-h3.h
> index 4b66227ac4..d1b3d7ca67 100644
> --- a/include/hw/arm/allwinner-h3.h
> +++ b/include/hw/arm/allwinner-h3.h
> @@ -45,6 +45,7 @@
>   #include "hw/intc/arm_gic.h"
>   #include "hw/misc/allwinner-h3-ccu.h"
>   #include "hw/misc/allwinner-cpucfg.h"
> +#include "hw/misc/allwinner-h3-dramc.h"
>   #include "hw/misc/allwinner-h3-sysctrl.h"
>   #include "hw/misc/allwinner-sid.h"
>   #include "hw/sd/allwinner-sdhost.h"
> @@ -84,6 +85,9 @@ enum {
>       AW_H3_UART2,
>       AW_H3_UART3,
>       AW_H3_EMAC,
> +    AW_H3_DRAMCOM,
> +    AW_H3_DRAMCTL,
> +    AW_H3_DRAMPHY,
>       AW_H3_GIC_DIST,
>       AW_H3_GIC_CPU,
>       AW_H3_GIC_HYP,
> @@ -121,6 +125,7 @@ typedef struct AwH3State {
>       AwA10PITState timer;
>       AwH3ClockCtlState ccu;
>       AwCpuCfgState cpucfg;
> +    AwH3DramCtlState dramc;
>       AwH3SysCtrlState sysctrl;
>       AwSidState sid;
>       AwSdHostState mmc0;
> diff --git a/include/hw/misc/allwinner-h3-dramc.h b/include/hw/misc/allwinner-h3-dramc.h
> new file mode 100644
> index 0000000000..70ab331081
> --- /dev/null
> +++ b/include/hw/misc/allwinner-h3-dramc.h
> @@ -0,0 +1,107 @@
> +/*
> + * Allwinner H3 SDRAM Controller emulation
> + *
> + * Copyright (C) 2019 Niek Linnenbank <nieklinnenbank@gmail.com>
> + *
> + * This program is free software: you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation, either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef HW_MISC_ALLWINNER_H3_DRAMC_H
> +#define HW_MISC_ALLWINNER_H3_DRAMC_H
> +
> +#include "qemu/osdep.h"
> +#include "qom/object.h"
> +#include "hw/sysbus.h"
> +#include "exec/hwaddr.h"
> +
> +/**
> + * Constants
> + * @{
> + */
> +
> +/** Highest register address used by DRAMCOM module */
> +#define AW_H3_DRAMCOM_REGS_MAXADDR  (0x804)
> +
> +/** Total number of known DRAMCOM registers */
> +#define AW_H3_DRAMCOM_REGS_NUM      (AW_H3_DRAMCOM_REGS_MAXADDR / \
> +                                     sizeof(uint32_t))
> +
> +/** Highest register address used by DRAMCTL module */
> +#define AW_H3_DRAMCTL_REGS_MAXADDR  (0x88c)
> +
> +/** Total number of known DRAMCTL registers */
> +#define AW_H3_DRAMCTL_REGS_NUM      (AW_H3_DRAMCTL_REGS_MAXADDR / \
> +                                     sizeof(uint32_t))
> +
> +/** Highest register address used by DRAMPHY module */
> +#define AW_H3_DRAMPHY_REGS_MAXADDR  (0x4)
> +
> +/** Total number of known DRAMPHY registers */
> +#define AW_H3_DRAMPHY_REGS_NUM      (AW_H3_DRAMPHY_REGS_MAXADDR / \
> +                                     sizeof(uint32_t))
> +
> +/** @} */
> +
> +/**
> + * Object model
> + * @{
> + */
> +
> +#define TYPE_AW_H3_DRAMC "allwinner-h3-dramc"
> +#define AW_H3_DRAMC(obj) \
> +    OBJECT_CHECK(AwH3DramCtlState, (obj), TYPE_AW_H3_DRAMC)
> +
> +/** @} */
> +
> +/**
> + * Allwinner H3 SDRAM Controller object instance state.
> + */
> +typedef struct AwH3DramCtlState {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +    /*< public >*/
> +
> +    /** Physical base address for start of RAM */
> +    hwaddr ram_addr;
> +
> +    /** Total RAM size in megabytes */
> +    uint32_t ram_size;
> +
> +    /**
> +     * @name Memory Regions
> +     * @{
> +     */
> +
> +    MemoryRegion row_mirror;       /**< Simulates rows for RAM size detection */
> +    MemoryRegion row_mirror_alias; /**< Alias of the row which is mirrored */
> +    MemoryRegion dramcom_iomem;    /**< DRAMCOM module I/O registers */
> +    MemoryRegion dramctl_iomem;    /**< DRAMCTL module I/O registers */
> +    MemoryRegion dramphy_iomem;    /**< DRAMPHY module I/O registers */
> +
> +    /** @} */
> +
> +    /**
> +     * @name Hardware Registers
> +     * @{
> +     */
> +
> +    uint32_t dramcom[AW_H3_DRAMCOM_REGS_NUM]; /**< Array of DRAMCOM registers */
> +    uint32_t dramctl[AW_H3_DRAMCTL_REGS_NUM]; /**< Array of DRAMCTL registers */
> +    uint32_t dramphy[AW_H3_DRAMPHY_REGS_NUM] ;/**< Array of DRAMPHY registers */
> +
> +    /** @} */
> +
> +} AwH3DramCtlState;
> +
> +#endif /* HW_MISC_ALLWINNER_H3_DRAMC_H */
> diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
> index e7b768ad5b..77b823e7d8 100644
> --- a/hw/arm/allwinner-h3.c
> +++ b/hw/arm/allwinner-h3.c
> @@ -54,6 +54,9 @@ const hwaddr allwinner_h3_memmap[] = {
>       [AW_H3_UART2]      = 0x01c28800,
>       [AW_H3_UART3]      = 0x01c28c00,
>       [AW_H3_EMAC]       = 0x01c30000,
> +    [AW_H3_DRAMCOM]    = 0x01c62000,
> +    [AW_H3_DRAMCTL]    = 0x01c63000,
> +    [AW_H3_DRAMPHY]    = 0x01c65000,
>       [AW_H3_GIC_DIST]   = 0x01c81000,
>       [AW_H3_GIC_CPU]    = 0x01c82000,
>       [AW_H3_GIC_HYP]    = 0x01c84000,
> @@ -108,9 +111,6 @@ struct AwH3Unimplemented {
>       { "scr",       0x01c2c400, 1 * KiB },
>       { "gpu",       0x01c40000, 64 * KiB },
>       { "hstmr",     0x01c60000, 4 * KiB },
> -    { "dramcom",   0x01c62000, 4 * KiB },
> -    { "dramctl0",  0x01c63000, 4 * KiB },
> -    { "dramphy0",  0x01c65000, 4 * KiB },
>       { "spi0",      0x01c68000, 4 * KiB },
>       { "spi1",      0x01c69000, 4 * KiB },
>       { "csi",       0x01cb0000, 320 * KiB },
> @@ -237,6 +237,13 @@ static void allwinner_h3_init(Object *obj)
>   
>       sysbus_init_child_obj(obj, "emac", &s->emac, sizeof(s->emac),
>                             TYPE_AW_SUN8I_EMAC);
> +
> +    sysbus_init_child_obj(obj, "dramc", &s->dramc, sizeof(s->dramc),
> +                          TYPE_AW_H3_DRAMC);
> +    object_property_add_alias(obj, "ram-addr", OBJECT(&s->dramc),
> +                             "ram-addr", &error_abort);
> +    object_property_add_alias(obj, "ram-size", OBJECT(&s->dramc),
> +                              "ram-size", &error_abort);
>   }
>   
>   static void allwinner_h3_realize(DeviceState *dev, Error **errp)
> @@ -424,6 +431,12 @@ static void allwinner_h3_realize(DeviceState *dev, Error **errp)
>                      qdev_get_gpio_in(DEVICE(&s->gic), AW_H3_GIC_SPI_UART3),
>                      115200, serial_hd(3), DEVICE_NATIVE_ENDIAN);
>   
> +    /* DRAMC */
> +    qdev_init_nofail(DEVICE(&s->dramc));
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->dramc), 0, s->memmap[AW_H3_DRAMCOM]);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->dramc), 1, s->memmap[AW_H3_DRAMCTL]);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->dramc), 2, s->memmap[AW_H3_DRAMPHY]);
> +
>       /* Unimplemented devices */
>       for (int i = 0; i < ARRAY_SIZE(unimplemented); i++) {
>           create_unimplemented_device(unimplemented[i].device_name,
> diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
> index b722f49485..6eee40b461 100644
> --- a/hw/arm/orangepi.c
> +++ b/hw/arm/orangepi.c
> @@ -65,6 +65,12 @@ static void orangepi_init(MachineState *machine)
>       /* Setup EMAC properties */
>       object_property_set_int(OBJECT(&s->h3->emac), 1, "phy-addr", &error_abort);
>   
> +    /* DRAMC */
> +    object_property_set_uint(OBJECT(s->h3), s->h3->memmap[AW_H3_SDRAM],
> +                             "ram-addr", &error_abort);
> +    object_property_set_int(OBJECT(s->h3), machine->ram_size / MiB, "ram-size",
> +                            &error_abort);
> +
>       /* Mark H3 object realized */
>       object_property_set_bool(OBJECT(s->h3), true, "realized", &error_abort);
>   
> diff --git a/hw/misc/allwinner-h3-dramc.c b/hw/misc/allwinner-h3-dramc.c
> new file mode 100644
> index 0000000000..06ce1d92f5
> --- /dev/null
> +++ b/hw/misc/allwinner-h3-dramc.c
> @@ -0,0 +1,358 @@
> +/*
> + * Allwinner H3 SDRAM Controller emulation
> + *
> + * Copyright (C) 2019 Niek Linnenbank <nieklinnenbank@gmail.com>
> + *
> + * This program is free software: you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation, either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/units.h"
> +#include "qemu/error-report.h"
> +#include "hw/sysbus.h"
> +#include "migration/vmstate.h"
> +#include "qemu/log.h"
> +#include "qemu/module.h"
> +#include "exec/address-spaces.h"
> +#include "hw/qdev-properties.h"
> +#include "qapi/error.h"
> +#include "hw/misc/allwinner-h3-dramc.h"
> +#include "trace.h"
> +
> +#define REG_INDEX(offset)    (offset / sizeof(uint32_t))
> +
> +/* DRAMCOM register offsets */
> +enum {
> +    REG_DRAMCOM_CR    = 0x0000, /* Control Register */
> +};
> +
> +/* DRAMCTL register offsets */
> +enum {
> +    REG_DRAMCTL_PIR   = 0x0000, /* PHY Initialization Register */
> +    REG_DRAMCTL_PGSR  = 0x0010, /* PHY General Status Register */
> +    REG_DRAMCTL_STATR = 0x0018, /* Status Register */
> +};
> +
> +/* DRAMCTL register flags */
> +enum {
> +    REG_DRAMCTL_PGSR_INITDONE = (1 << 0),
> +};
> +
> +enum {
> +    REG_DRAMCTL_STATR_ACTIVE  = (1 << 0),
> +};
> +
> +static void allwinner_h3_dramc_map_rows(AwH3DramCtlState *s, uint8_t row_bits,
> +                                        uint8_t bank_bits, uint16_t page_size)
> +{
> +    /*
> +     * This function simulates row addressing behavior when bootloader
> +     * software attempts to detect the amount of available SDRAM. In U-Boot
> +     * the controller is configured with the widest row addressing available.
> +     * Then a pattern is written to RAM at an offset on the row boundary size.
> +     * If the value read back equals the value read back from the
> +     * start of RAM, the bootloader knows the amount of row bits.
> +     *
> +     * This function inserts a mirrored memory region when the configured row
> +     * bits are not matching the actual emulated memory, to simulate the
> +     * same behavior on hardware as expected by the bootloader.
> +     */
> +    uint8_t row_bits_actual = 0;
> +
> +    /* Calculate the actual row bits using the ram_size property */
> +    for (uint8_t i = 8; i < 12; i++) {
> +        if (1 << i == s->ram_size) {
> +            row_bits_actual = i + 3;
> +            break;
> +        }
> +    }
> +
> +    if (s->ram_size == (1 << (row_bits - 3))) {
> +        /* When row bits is the expected value, remove the mirror */
> +        memory_region_set_enabled(&s->row_mirror_alias, false);
> +        trace_allwinner_h3_dramc_rowmirror_disable();
> +
> +    } else if (row_bits_actual) {
> +        /* Row bits not matching ram_size, install the rows mirror */
> +        hwaddr row_mirror = s->ram_addr + ((1 << (row_bits_actual +
> +                                                  bank_bits)) * page_size);
> +
> +        memory_region_set_enabled(&s->row_mirror_alias, true);
> +        memory_region_set_address(&s->row_mirror_alias, row_mirror);
> +
> +        trace_allwinner_h3_dramc_rowmirror_enable(row_mirror);
> +    }
> +}
> +
> +static uint64_t allwinner_h3_dramcom_read(void *opaque, hwaddr offset,
> +                                          unsigned size)
> +{
> +    const AwH3DramCtlState *s = AW_H3_DRAMC(opaque);
> +    const uint32_t idx = REG_INDEX(offset);
> +
> +    if (idx >= AW_H3_DRAMCOM_REGS_NUM) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset 0x%04x\n",
> +                      __func__, (uint32_t)offset);
> +        return 0;
> +    }
> +
> +    trace_allwinner_h3_dramcom_read(offset, s->dramcom[idx], size);
> +
> +    return s->dramcom[idx];
> +}
> +
> +static void allwinner_h3_dramcom_write(void *opaque, hwaddr offset,
> +                                       uint64_t val, unsigned size)
> +{
> +    AwH3DramCtlState *s = AW_H3_DRAMC(opaque);
> +    const uint32_t idx = REG_INDEX(offset);
> +
> +    trace_allwinner_h3_dramcom_write(offset, val, size);
> +
> +    if (idx >= AW_H3_DRAMCOM_REGS_NUM) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset 0x%04x\n",
> +                      __func__, (uint32_t)offset);
> +        return;
> +    }
> +
> +    switch (offset) {
> +    case REG_DRAMCOM_CR:   /* Control Register */
> +        allwinner_h3_dramc_map_rows(s, ((val >> 4) & 0xf) + 1,
> +                                       ((val >> 2) & 0x1) + 2,
> +                                       1 << (((val >> 8) & 0xf) + 3));
> +        break;
> +    default:
> +        break;
> +    };
> +
> +    s->dramcom[idx] = (uint32_t) val;
> +}
> +
> +static uint64_t allwinner_h3_dramctl_read(void *opaque, hwaddr offset,
> +                                          unsigned size)
> +{
> +    const AwH3DramCtlState *s = AW_H3_DRAMC(opaque);
> +    const uint32_t idx = REG_INDEX(offset);
> +
> +    if (idx >= AW_H3_DRAMCTL_REGS_NUM) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset 0x%04x\n",
> +                      __func__, (uint32_t)offset);
> +        return 0;
> +    }
> +
> +    trace_allwinner_h3_dramctl_read(offset, s->dramctl[idx], size);
> +
> +    return s->dramctl[idx];
> +}
> +
> +static void allwinner_h3_dramctl_write(void *opaque, hwaddr offset,
> +                                       uint64_t val, unsigned size)
> +{
> +    AwH3DramCtlState *s = AW_H3_DRAMC(opaque);
> +    const uint32_t idx = REG_INDEX(offset);
> +
> +    trace_allwinner_h3_dramctl_write(offset, val, size);
> +
> +    if (idx >= AW_H3_DRAMCTL_REGS_NUM) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset 0x%04x\n",
> +                      __func__, (uint32_t)offset);
> +        return;
> +    }
> +
> +    switch (offset) {
> +    case REG_DRAMCTL_PIR:    /* PHY Initialization Register */
> +        s->dramctl[REG_INDEX(REG_DRAMCTL_PGSR)] |= REG_DRAMCTL_PGSR_INITDONE;
> +        s->dramctl[REG_INDEX(REG_DRAMCTL_STATR)] |= REG_DRAMCTL_STATR_ACTIVE;
> +        break;
> +    default:
> +        break;
> +    }
> +
> +    s->dramctl[idx] = (uint32_t) val;
> +}
> +
> +static uint64_t allwinner_h3_dramphy_read(void *opaque, hwaddr offset,
> +                                          unsigned size)
> +{
> +    const AwH3DramCtlState *s = AW_H3_DRAMC(opaque);
> +    const uint32_t idx = REG_INDEX(offset);
> +
> +    if (idx >= AW_H3_DRAMPHY_REGS_NUM) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset 0x%04x\n",
> +                      __func__, (uint32_t)offset);
> +        return 0;
> +    }
> +
> +    trace_allwinner_h3_dramphy_read(offset, s->dramphy[idx], size);
> +
> +    return s->dramphy[idx];
> +}
> +
> +static void allwinner_h3_dramphy_write(void *opaque, hwaddr offset,
> +                                       uint64_t val, unsigned size)
> +{
> +    AwH3DramCtlState *s = AW_H3_DRAMC(opaque);
> +    const uint32_t idx = REG_INDEX(offset);
> +
> +    trace_allwinner_h3_dramphy_write(offset, val, size);
> +
> +    if (idx >= AW_H3_DRAMPHY_REGS_NUM) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset 0x%04x\n",
> +                      __func__, (uint32_t)offset);
> +        return;
> +    }
> +
> +    s->dramphy[idx] = (uint32_t) val;
> +}
> +
> +static const MemoryRegionOps allwinner_h3_dramcom_ops = {
> +    .read = allwinner_h3_dramcom_read,
> +    .write = allwinner_h3_dramcom_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .valid = {
> +        .min_access_size = 4,
> +        .max_access_size = 4,
> +    },
> +    .impl.min_access_size = 4,
> +};
> +
> +static const MemoryRegionOps allwinner_h3_dramctl_ops = {
> +    .read = allwinner_h3_dramctl_read,
> +    .write = allwinner_h3_dramctl_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .valid = {
> +        .min_access_size = 4,
> +        .max_access_size = 4,
> +    },
> +    .impl.min_access_size = 4,
> +};
> +
> +static const MemoryRegionOps allwinner_h3_dramphy_ops = {
> +    .read = allwinner_h3_dramphy_read,
> +    .write = allwinner_h3_dramphy_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .valid = {
> +        .min_access_size = 4,
> +        .max_access_size = 4,
> +    },
> +    .impl.min_access_size = 4,
> +};
> +
> +static void allwinner_h3_dramc_reset(DeviceState *dev)
> +{
> +    AwH3DramCtlState *s = AW_H3_DRAMC(dev);
> +
> +    /* Set default values for registers */
> +    memset(&s->dramcom, 0, sizeof(s->dramcom));
> +    memset(&s->dramctl, 0, sizeof(s->dramctl));
> +    memset(&s->dramphy, 0, sizeof(s->dramphy));
> +}
> +
> +static void allwinner_h3_dramc_realize(DeviceState *dev, Error **errp)
> +{
> +    AwH3DramCtlState *s = AW_H3_DRAMC(dev);
> +
> +    /* Only power of 2 RAM sizes from 256MiB up to 2048MiB are supported */
> +    for (uint8_t i = 8; i < 13; i++) {
> +        if (1 << i == s->ram_size) {
> +            break;
> +        } else if (i == 12) {
> +            error_report("%s: ram-size %u MiB is not supported",
> +                          __func__, s->ram_size);
> +            exit(1);
> +        }
> +    }
> +
> +    /* Setup row mirror mappings */
> +    memory_region_init_ram(&s->row_mirror, OBJECT(s),
> +                           "allwinner-h3-dramc.row-mirror",
> +                            4 * KiB, &error_abort);
> +    memory_region_add_subregion_overlap(get_system_memory(), s->ram_addr,
> +                                       &s->row_mirror, 10);
> +
> +    memory_region_init_alias(&s->row_mirror_alias, OBJECT(s),
> +                            "allwinner-h3-dramc.row-mirror-alias",
> +                            &s->row_mirror, 0, 4 * KiB);
> +    memory_region_add_subregion_overlap(get_system_memory(),
> +                                        s->ram_addr + 1 * MiB,
> +                                       &s->row_mirror_alias, 10);
> +    memory_region_set_enabled(&s->row_mirror_alias, false);
> +}
> +
> +static void allwinner_h3_dramc_init(Object *obj)
> +{
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> +    AwH3DramCtlState *s = AW_H3_DRAMC(obj);
> +
> +    /* DRAMCOM registers */
> +    memory_region_init_io(&s->dramcom_iomem, OBJECT(s),
> +                          &allwinner_h3_dramcom_ops, s,
> +                           TYPE_AW_H3_DRAMC, 4 * KiB);
> +    sysbus_init_mmio(sbd, &s->dramcom_iomem);
> +
> +    /* DRAMCTL registers */
> +    memory_region_init_io(&s->dramctl_iomem, OBJECT(s),
> +                          &allwinner_h3_dramctl_ops, s,
> +                           TYPE_AW_H3_DRAMC, 4 * KiB);
> +    sysbus_init_mmio(sbd, &s->dramctl_iomem);
> +
> +    /* DRAMPHY registers */
> +    memory_region_init_io(&s->dramphy_iomem, OBJECT(s),
> +                          &allwinner_h3_dramphy_ops, s,
> +                          TYPE_AW_H3_DRAMC, 4 * KiB);
> +    sysbus_init_mmio(sbd, &s->dramphy_iomem);
> +}
> +
> +static Property allwinner_h3_dramc_properties[] = {
> +    DEFINE_PROP_UINT64("ram-addr", AwH3DramCtlState, ram_addr, 0x0),
> +    DEFINE_PROP_UINT32("ram-size", AwH3DramCtlState, ram_size, 256 * MiB),
> +    DEFINE_PROP_END_OF_LIST()
> +};
> +
> +static const VMStateDescription allwinner_h3_dramc_vmstate = {
> +    .name = "allwinner-h3-dramc",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32_ARRAY(dramcom, AwH3DramCtlState, AW_H3_DRAMCOM_REGS_NUM),
> +        VMSTATE_UINT32_ARRAY(dramctl, AwH3DramCtlState, AW_H3_DRAMCTL_REGS_NUM),
> +        VMSTATE_UINT32_ARRAY(dramphy, AwH3DramCtlState, AW_H3_DRAMPHY_REGS_NUM),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void allwinner_h3_dramc_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->reset = allwinner_h3_dramc_reset;
> +    dc->vmsd = &allwinner_h3_dramc_vmstate;
> +    dc->props = allwinner_h3_dramc_properties;
> +    dc->realize = allwinner_h3_dramc_realize;
> +}
> +
> +static const TypeInfo allwinner_h3_dramc_info = {
> +    .name          = TYPE_AW_H3_DRAMC,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_init = allwinner_h3_dramc_init,
> +    .instance_size = sizeof(AwH3DramCtlState),
> +    .class_init    = allwinner_h3_dramc_class_init,
> +};
> +
> +static void allwinner_h3_dramc_register(void)
> +{
> +    type_register_static(&allwinner_h3_dramc_info);
> +}
> +
> +type_init(allwinner_h3_dramc_register)
> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> index 59500d5681..b95b9e5296 100644
> --- a/hw/misc/Makefile.objs
> +++ b/hw/misc/Makefile.objs
> @@ -30,6 +30,7 @@ common-obj-$(CONFIG_IVSHMEM_DEVICE) += ivshmem.o
>   
>   common-obj-$(CONFIG_ALLWINNER_H3) += allwinner-h3-ccu.o
>   obj-$(CONFIG_ALLWINNER_H3) += allwinner-cpucfg.o
> +common-obj-$(CONFIG_ALLWINNER_H3) += allwinner-h3-dramc.o
>   common-obj-$(CONFIG_ALLWINNER_H3) += allwinner-h3-sysctrl.o
>   common-obj-$(CONFIG_ALLWINNER_H3) += allwinner-sid.o
>   common-obj-$(CONFIG_REALVIEW) += arm_sysctl.o
> diff --git a/hw/misc/trace-events b/hw/misc/trace-events
> index 67d8bf493c..c231b4c194 100644
> --- a/hw/misc/trace-events
> +++ b/hw/misc/trace-events
> @@ -5,6 +5,16 @@ allwinner_cpucfg_cpu_reset(uint8_t cpu_id, uint32_t reset_addr) "id %u, reset_ad
>   allwinner_cpucfg_read(uint64_t offset, uint64_t data, unsigned size) "offset 0x%" PRIx64 " data 0x%" PRIx64 " size %" PRIu32
>   allwinner_cpucfg_write(uint64_t offset, uint64_t data, unsigned size) "offset 0x%" PRIx64 " data 0x%" PRIx64 " size %" PRIu32
>   
> +# allwinner-h3-dramc.c
> +allwinner_h3_dramc_rowmirror_disable(void) "Disable row mirror"
> +allwinner_h3_dramc_rowmirror_enable(uint64_t addr) "Enable row mirror: addr 0x%" PRIx64
> +allwinner_h3_dramcom_read(uint64_t offset, uint64_t data, unsigned size) "Read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %" PRIu32
> +allwinner_h3_dramcom_write(uint64_t offset, uint64_t data, unsigned size) "Write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %" PRIu32
> +allwinner_h3_dramctl_read(uint64_t offset, uint64_t data, unsigned size) "Read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %" PRIu32
> +allwinner_h3_dramctl_write(uint64_t offset, uint64_t data, unsigned size) "Write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %" PRIu32
> +allwinner_h3_dramphy_read(uint64_t offset, uint64_t data, unsigned size) "Read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %" PRIu32
> +allwinner_h3_dramphy_write(uint64_t offset, uint64_t data, unsigned size) "write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %" PRIu32
> +
>   # allwinner-sid.c
>   allwinner_sid_read(uint64_t offset, uint64_t data, unsigned size) "offset 0x%" PRIx64 " data 0x%" PRIx64 " size %" PRIu32
>   allwinner_sid_write(uint64_t offset, uint64_t data, unsigned size) "offset 0x%" PRIx64 " data 0x%" PRIx64 " size %" PRIu32
> 
