Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1709686lff;
        Sun, 19 Jan 2020 10:01:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqzTiXphMi6gGcmgrIkfLEN5i5qDVT2xU6Eua8Z2qdwIdsLrFWzMtVmuiSnP62+DNbUjisPt
X-Received: by 2002:a17:906:ff01:: with SMTP id zn1mr16482692ejb.323.1579456916271;
        Sun, 19 Jan 2020 10:01:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579456916; cv=none;
        d=google.com; s=arc-20160816;
        b=TnbKmCXRqo3QPD33WaQOjWfEhIqSHV6HT91d0j0SR8ZafNfXcCdCvw89qeMZk4kJUV
         GWxS/Fo5Ad1urM7kBXruRQ2H3/SqO4MhPNxS1Y3zLCjRGir2VMoh9kzea5zieU/Lym4v
         BrBUwTvUBspr5h2DTE7amZKmqd9kzkoUMqMjMa32wamTvw5MSupjLtANU+sZUxVEa6lC
         RBuAq4WZQzVfjbpetrw75uyRUi3/DWpqWw2G7ZvK4lqhTdjmVPbb4CdFtDXeV6yDc9xC
         OK54p8d7QsKaQajGLrd5LRMR/brbTXAlqfJVlM5qdVadAggdqFc9IMnKMneh+2fNGimc
         m+dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=0fYdg8dLyxvlHYMd2xbFaSS2iaPxPMYADKdleZisWIc=;
        b=T3rxr1jzFac8zMjNO8KZCUW2OClfYsAbPoEt8S6BKYd9dkNqvRNtiMK/hvUwbeuTXQ
         OjOmwUSM7wZRCrpUgzzhXU4pMl2LCRE35TohypqrIICiw34vcQRqIHR5Z//9jW913LJB
         K8JrT6KMPYYZhbtx/mnb/uocYurYuCaolOUVHYYw5tKoSGYMArdPvsqoF3U+rQkVGKo4
         33T4qTj3uQy4UqvQm47mZOmxDVjMNWVYpomi3ZPssofpW41XrU169GnAyj7WudYDkibY
         DS0mWOtXFXB3BUfWZryN+Cj1Vy6jj182O4xy7RI3IrQ5pW5eQB22Nmr/kj5TV3eutCLU
         YFuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="S0vUm1/j";
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id s17si19934690ejz.456.2020.01.19.10.01.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 19 Jan 2020 10:01:56 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="S0vUm1/j";
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579456915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0fYdg8dLyxvlHYMd2xbFaSS2iaPxPMYADKdleZisWIc=;
	b=S0vUm1/jus/nx8mvDtyI1VynMP9n02g/a+h8h1C1gE/ky4Z6PFyyZH4+I5IzVt07StVZzh
	X0VmzUqPr3Iia/fRQQ04lVZk6fu7avxebW8JwoVfGdgT94kwSAxuB0Eox0xdT0XvlNWL19
	RPzs/P/vF+7EpoHBGxCxXK1MWqjAovA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-Xp8Ya0WjN2CKvZpQHCe2UA-1; Sun, 19 Jan 2020 13:01:53 -0500
Received: by mail-wr1-f69.google.com with SMTP id j4so13011293wrs.13
        for <alex.bennee@linaro.org>; Sun, 19 Jan 2020 10:01:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TUW57475OYuqKWcpi9arSRvy73esT1xx7Hq4YZSKnrQ=;
        b=mVm45DDBGrRknYMp83Qs5xSktZDUXbCuqEo7Nhzmk1OQWGYB9v2Tcxb0Hcmaq4GVrW
         93pzeCQB/rRB8urmcMpJiOw079VMj4uMX6j2vzfC2PW7qPTOVnydkhLHM5HQr/099IVX
         oVPCc4UzsgyPg7vbeLNjcJsfaGh61bpnfMQKPsPosvq9C5NVYz1C0zP2pH220jSE72KQ
         TQGfJ8x0fNdW0aK+T2lrLeM5STuQIdYI7oH7a40v9pJZ8JrtRe8QCExSV2Uke+evzB5c
         T/hNiA3iF0SadG4eow9fYGxs9ua0SXq4i0NbboF3lhBgZRxmxJJE+slZPJumq6zq53EK
         K9hA==
X-Gm-Message-State: APjAAAUKooKdh/AqA22Jq1+sjGRnd5v5XzPCEu6rct0nIGDu23fn5gE5
	3M12NWl4Hb3dkOocZ01P1Z9oNoDw+o6+0zHLOyogRwxaYoo/QVrQneM7QQv67ekMTJU6Mp7YVBb
	lprsbjqsbih1dR99u
X-Received: by 2002:a5d:6305:: with SMTP id i5mr14533129wru.399.1579456911791;
        Sun, 19 Jan 2020 10:01:51 -0800 (PST)
X-Received: by 2002:a5d:6305:: with SMTP id i5mr14533101wru.399.1579456911261;
        Sun, 19 Jan 2020 10:01:51 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.113])
        by smtp.gmail.com with ESMTPSA id b17sm45044941wrx.15.2020.01.19.10.01.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jan 2020 10:01:50 -0800 (PST)
Subject: Re: [PATCH v4 01/20] hw/arm: add Allwinner H3 System-on-Chip
To: Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, b.galvani@gmail.com,
 jasowang@redhat.com, alex.bennee@linaro.org, imammedo@redhat.com
References: <20200119005102.3847-1-nieklinnenbank@gmail.com>
 <20200119005102.3847-2-nieklinnenbank@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4aca4ea1-fb06-c0bf-d636-e6b842380a15@redhat.com>
Date: Sun, 19 Jan 2020 19:01:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200119005102.3847-2-nieklinnenbank@gmail.com>
Content-Language: en-US
X-MC-Unique: Xp8Ya0WjN2CKvZpQHCe2UA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: zqXdo5OvTwbF

On 1/19/20 1:50 AM, Niek Linnenbank wrote:
> The Allwinner H3 is a System on Chip containing four ARM Cortex A7
> processor cores. Features and specifications include DDR2/DDR3 memory,
> SD/MMC storage cards, 10/100/1000Mbit Ethernet, USB 2.0, HDMI and
> various I/O modules. This commit adds support for the Allwinner H3
> System on Chip.
>=20
> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> ---
>   default-configs/arm-softmmu.mak |   1 +
>   include/hw/arm/allwinner-h3.h   | 106 +++++++++++
>   hw/arm/allwinner-h3.c           | 327 ++++++++++++++++++++++++++++++++
>   MAINTAINERS                     |   7 +
>   hw/arm/Kconfig                  |   8 +
>   hw/arm/Makefile.objs            |   1 +
>   6 files changed, 450 insertions(+)
>   create mode 100644 include/hw/arm/allwinner-h3.h
>   create mode 100644 hw/arm/allwinner-h3.c
>=20
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
> index 645e6201bb..36a0e89daa 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -41,3 +41,4 @@ CONFIG_FSL_IMX25=3Dy
>   CONFIG_FSL_IMX7=3Dy
>   CONFIG_FSL_IMX6UL=3Dy
>   CONFIG_SEMIHOSTING=3Dy
> +CONFIG_ALLWINNER_H3=3Dy
> diff --git a/include/hw/arm/allwinner-h3.h b/include/hw/arm/allwinner-h3.=
h
> new file mode 100644
> index 0000000000..2aac9b78ec
> --- /dev/null
> +++ b/include/hw/arm/allwinner-h3.h
> @@ -0,0 +1,106 @@
> +/*
> + * Allwinner H3 System on Chip emulation
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
> +/*
> + * The Allwinner H3 is a System on Chip containing four ARM Cortex A7
> + * processor cores. Features and specifications include DDR2/DDR3 memory=
,
> + * SD/MMC storage cards, 10/100/1000Mbit Ethernet, USB 2.0, HDMI and
> + * various I/O modules.
> + *
> + * This implementation is based on the following datasheet:
> + *
> + *   https://linux-sunxi.org/File:Allwinner_H3_Datasheet_V1.2.pdf
> + *
> + * The latest datasheet and more info can be found on the Linux Sunxi wi=
ki:
> + *
> + *   https://linux-sunxi.org/H3
> + */
> +
> +#ifndef HW_ARM_ALLWINNER_H3_H
> +#define HW_ARM_ALLWINNER_H3_H
> +
> +#include "qom/object.h"
> +#include "hw/arm/boot.h"
> +#include "hw/timer/allwinner-a10-pit.h"
> +#include "hw/intc/arm_gic.h"
> +#include "target/arm/cpu.h"
> +
> +/**
> + * Allwinner H3 device list
> + *
> + * This enumeration is can be used refer to a particular device in the
> + * Allwinner H3 SoC. For example, the physical memory base address for
> + * each device can be found in the AwH3State object in the memmap member
> + * using the device enum value as index.
> + *
> + * @see AwH3State
> + */
> +enum {
> +    AW_H3_SRAM_A1,
> +    AW_H3_SRAM_A2,
> +    AW_H3_SRAM_C,
> +    AW_H3_PIT,
> +    AW_H3_UART0,
> +    AW_H3_UART1,
> +    AW_H3_UART2,
> +    AW_H3_UART3,
> +    AW_H3_GIC_DIST,
> +    AW_H3_GIC_CPU,
> +    AW_H3_GIC_HYP,
> +    AW_H3_GIC_VCPU,
> +    AW_H3_SDRAM
> +};
> +
> +/** Total number of CPU cores in the H3 SoC */
> +#define AW_H3_NUM_CPUS      (4)
> +
> +/**
> + * Allwinner H3 object model
> + * @{
> + */
> +
> +/** Object type for the Allwinner H3 SoC */
> +#define TYPE_AW_H3 "allwinner-h3"
> +
> +/** Convert input object to Allwinner H3 state object */
> +#define AW_H3(obj) OBJECT_CHECK(AwH3State, (obj), TYPE_AW_H3)
> +
> +/** @} */
> +
> +/**
> + * Allwinner H3 object
> + *
> + * This struct contains the state of all the devices
> + * which are currently emulated by the H3 SoC code.
> + */
> +typedef struct AwH3State {
> +    /*< private >*/
> +    DeviceState parent_obj;
> +    /*< public >*/
> +
> +    ARMCPU cpus[AW_H3_NUM_CPUS];
> +    const hwaddr *memmap;
> +    AwA10PITState timer;
> +    GICState gic;
> +    MemoryRegion sram_a1;
> +    MemoryRegion sram_a2;
> +    MemoryRegion sram_c;
> +} AwH3State;
> +
> +#endif /* HW_ARM_ALLWINNER_H3_H */
> diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
> new file mode 100644
> index 0000000000..efe6042af3
> --- /dev/null
> +++ b/hw/arm/allwinner-h3.c
> @@ -0,0 +1,327 @@
> +/*
> + * Allwinner H3 System on Chip emulation
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
> +#include "exec/address-spaces.h"
> +#include "qapi/error.h"
> +#include "qemu/error-report.h"
> +#include "qemu/module.h"
> +#include "qemu/units.h"
> +#include "hw/qdev-core.h"
> +#include "cpu.h"
> +#include "hw/sysbus.h"
> +#include "hw/char/serial.h"
> +#include "hw/misc/unimp.h"
> +#include "sysemu/sysemu.h"
> +#include "hw/arm/allwinner-h3.h"
> +
> +/* Memory map */
> +const hwaddr allwinner_h3_memmap[] =3D {
> +    [AW_H3_SRAM_A1]    =3D 0x00000000,
> +    [AW_H3_SRAM_A2]    =3D 0x00044000,
> +    [AW_H3_SRAM_C]     =3D 0x00010000,
> +    [AW_H3_PIT]        =3D 0x01c20c00,
> +    [AW_H3_UART0]      =3D 0x01c28000,
> +    [AW_H3_UART1]      =3D 0x01c28400,
> +    [AW_H3_UART2]      =3D 0x01c28800,
> +    [AW_H3_UART3]      =3D 0x01c28c00,
> +    [AW_H3_GIC_DIST]   =3D 0x01c81000,
> +    [AW_H3_GIC_CPU]    =3D 0x01c82000,
> +    [AW_H3_GIC_HYP]    =3D 0x01c84000,
> +    [AW_H3_GIC_VCPU]   =3D 0x01c86000,
> +    [AW_H3_SDRAM]      =3D 0x40000000
> +};
> +
> +/* List of unimplemented devices */
> +struct AwH3Unimplemented {
> +    const char *device_name;
> +    hwaddr base;
> +    hwaddr size;
> +} unimplemented[] =3D {
> +    { "d-engine",  0x01000000, 4 * MiB },
> +    { "d-inter",   0x01400000, 128 * KiB },
> +    { "syscon",    0x01c00000, 4 * KiB },
> +    { "dma",       0x01c02000, 4 * KiB },
> +    { "nfdc",      0x01c03000, 4 * KiB },
> +    { "ts",        0x01c06000, 4 * KiB },
> +    { "keymem",    0x01c0b000, 4 * KiB },
> +    { "lcd0",      0x01c0c000, 4 * KiB },
> +    { "lcd1",      0x01c0d000, 4 * KiB },
> +    { "ve",        0x01c0e000, 4 * KiB },
> +    { "mmc0",      0x01c0f000, 4 * KiB },
> +    { "mmc1",      0x01c10000, 4 * KiB },
> +    { "mmc2",      0x01c11000, 4 * KiB },
> +    { "sid",       0x01c14000, 1 * KiB },
> +    { "crypto",    0x01c15000, 4 * KiB },
> +    { "msgbox",    0x01c17000, 4 * KiB },
> +    { "spinlock",  0x01c18000, 4 * KiB },
> +    { "usb0-otg",  0x01c19000, 4 * KiB },
> +    { "usb0",      0x01c1a000, 4 * KiB },
> +    { "usb1",      0x01c1b000, 4 * KiB },
> +    { "usb2",      0x01c1c000, 4 * KiB },
> +    { "usb3",      0x01c1d000, 4 * KiB },
> +    { "smc",       0x01c1e000, 4 * KiB },
> +    { "ccu",       0x01c20000, 1 * KiB },
> +    { "pio",       0x01c20800, 1 * KiB },
> +    { "owa",       0x01c21000, 1 * KiB },
> +    { "pwm",       0x01c21400, 1 * KiB },
> +    { "keyadc",    0x01c21800, 1 * KiB },
> +    { "pcm0",      0x01c22000, 1 * KiB },
> +    { "pcm1",      0x01c22400, 1 * KiB },
> +    { "pcm2",      0x01c22800, 1 * KiB },
> +    { "audio",     0x01c22c00, 2 * KiB },
> +    { "smta",      0x01c23400, 1 * KiB },
> +    { "ths",       0x01c25000, 1 * KiB },
> +    { "uart0",     0x01c28000, 1 * KiB },
> +    { "uart1",     0x01c28400, 1 * KiB },
> +    { "uart2",     0x01c28800, 1 * KiB },
> +    { "uart3",     0x01c28c00, 1 * KiB },
> +    { "twi0",      0x01c2ac00, 1 * KiB },
> +    { "twi1",      0x01c2b000, 1 * KiB },
> +    { "twi2",      0x01c2b400, 1 * KiB },
> +    { "scr",       0x01c2c400, 1 * KiB },
> +    { "emac",      0x01c30000, 64 * KiB },
> +    { "gpu",       0x01c40000, 64 * KiB },
> +    { "hstmr",     0x01c60000, 4 * KiB },
> +    { "dramcom",   0x01c62000, 4 * KiB },
> +    { "dramctl0",  0x01c63000, 4 * KiB },
> +    { "dramphy0",  0x01c65000, 4 * KiB },
> +    { "spi0",      0x01c68000, 4 * KiB },
> +    { "spi1",      0x01c69000, 4 * KiB },
> +    { "csi",       0x01cb0000, 320 * KiB },
> +    { "tve",       0x01e00000, 64 * KiB },
> +    { "hdmi",      0x01ee0000, 128 * KiB },
> +    { "rtc",       0x01f00000, 1 * KiB },
> +    { "r_timer",   0x01f00800, 1 * KiB },
> +    { "r_intc",    0x01f00c00, 1 * KiB },
> +    { "r_wdog",    0x01f01000, 1 * KiB },
> +    { "r_prcm",    0x01f01400, 1 * KiB },
> +    { "r_twd",     0x01f01800, 1 * KiB },
> +    { "r_cpucfg",  0x01f01c00, 1 * KiB },
> +    { "r_cir-rx",  0x01f02000, 1 * KiB },
> +    { "r_twi",     0x01f02400, 1 * KiB },
> +    { "r_uart",    0x01f02800, 1 * KiB },
> +    { "r_pio",     0x01f02c00, 1 * KiB },
> +    { "r_pwm",     0x01f03800, 1 * KiB },
> +    { "core-dbg",  0x3f500000, 128 * KiB },
> +    { "tsgen-ro",  0x3f506000, 4 * KiB },
> +    { "tsgen-ctl", 0x3f507000, 4 * KiB },
> +    { "ddr-mem",   0x40000000, 2 * GiB },
> +    { "n-brom",    0xffff0000, 32 * KiB },
> +    { "s-brom",    0xffff0000, 64 * KiB }
> +};
> +
> +/* Per Processor Interrupts */
> +enum {
> +    AW_H3_GIC_PPI_MAINT     =3D  9,
> +    AW_H3_GIC_PPI_HYPTIMER  =3D 10,
> +    AW_H3_GIC_PPI_VIRTTIMER =3D 11,
> +    AW_H3_GIC_PPI_SECTIMER  =3D 13,
> +    AW_H3_GIC_PPI_PHYSTIMER =3D 14
> +};
> +
> +/* Shared Processor Interrupts */
> +enum {
> +    AW_H3_GIC_SPI_UART0     =3D  0,
> +    AW_H3_GIC_SPI_UART1     =3D  1,
> +    AW_H3_GIC_SPI_UART2     =3D  2,
> +    AW_H3_GIC_SPI_UART3     =3D  3,
> +    AW_H3_GIC_SPI_TIMER0    =3D 18,
> +    AW_H3_GIC_SPI_TIMER1    =3D 19,
> +};
> +
> +/* Allwinner H3 general constants */
> +enum {
> +    AW_H3_GIC_NUM_SPI       =3D 128
> +};
> +
> +static void allwinner_h3_init(Object *obj)
> +{
> +    AwH3State *s =3D AW_H3(obj);
> +
> +    s->memmap =3D allwinner_h3_memmap;
> +
> +    for (int i =3D 0; i < AW_H3_NUM_CPUS; i++) {
> +        object_initialize_child(obj, "cpu[*]", &s->cpus[i], sizeof(s->cp=
us[i]),
> +                                ARM_CPU_TYPE_NAME("cortex-a7"),
> +                                &error_abort, NULL);
> +    }
> +
> +    sysbus_init_child_obj(obj, "gic", &s->gic, sizeof(s->gic),
> +                          TYPE_ARM_GIC);
> +
> +    sysbus_init_child_obj(obj, "timer", &s->timer, sizeof(s->timer),
> +                          TYPE_AW_A10_PIT);
> +    object_property_add_alias(obj, "clk0-freq", OBJECT(&s->timer),
> +                              "clk0-freq", &error_abort);
> +    object_property_add_alias(obj, "clk1-freq", OBJECT(&s->timer),
> +                              "clk1-freq", &error_abort);
> +}
> +
> +static void allwinner_h3_realize(DeviceState *dev, Error **errp)
> +{
> +    AwH3State *s =3D AW_H3(dev);
> +    unsigned i;
> +
> +    /* CPUs */
> +    for (i =3D 0; i < AW_H3_NUM_CPUS; i++) {
> +
> +        /* Provide Power State Coordination Interface */
> +        qdev_prop_set_int32(DEVICE(&s->cpus[i]), "psci-conduit",
> +                            QEMU_PSCI_CONDUIT_HVC);
> +
> +        /* Disable secondary CPUs */
> +        qdev_prop_set_bit(DEVICE(&s->cpus[i]), "start-powered-off",
> +                          i > 0);
> +
> +        /* All exception levels required */
> +        qdev_prop_set_bit(DEVICE(&s->cpus[i]), "has_el3", true);
> +        qdev_prop_set_bit(DEVICE(&s->cpus[i]), "has_el2", true);
> +
> +        /* Mark realized */
> +        qdev_init_nofail(DEVICE(&s->cpus[i]));
> +    }
> +
> +    /* Generic Interrupt Controller */
> +    qdev_prop_set_uint32(DEVICE(&s->gic), "num-irq", AW_H3_GIC_NUM_SPI +
> +                                                     GIC_INTERNAL);
> +    qdev_prop_set_uint32(DEVICE(&s->gic), "revision", 2);
> +    qdev_prop_set_uint32(DEVICE(&s->gic), "num-cpu", AW_H3_NUM_CPUS);
> +    qdev_prop_set_bit(DEVICE(&s->gic), "has-security-extensions", false)=
;
> +    qdev_prop_set_bit(DEVICE(&s->gic), "has-virtualization-extensions", =
true);
> +    qdev_init_nofail(DEVICE(&s->gic));
> +
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gic), 0, s->memmap[AW_H3_GIC_DIST=
]);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gic), 1, s->memmap[AW_H3_GIC_CPU]=
);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gic), 2, s->memmap[AW_H3_GIC_HYP]=
);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gic), 3, s->memmap[AW_H3_GIC_VCPU=
]);
> +
> +    /*
> +     * Wire the outputs from each CPU's generic timer and the GICv3
> +     * maintenance interrupt signal to the appropriate GIC PPI inputs,
> +     * and the GIC's IRQ/FIQ/VIRQ/VFIQ interrupt outputs to the CPU's in=
puts.
> +     */
> +    for (i =3D 0; i < AW_H3_NUM_CPUS; i++) {
> +        DeviceState *cpudev =3D DEVICE(&s->cpus[i]);
> +        int ppibase =3D AW_H3_GIC_NUM_SPI + i * GIC_INTERNAL + GIC_NR_SG=
IS;
> +        int irq;
> +        /*
> +         * Mapping from the output timer irq lines from the CPU to the
> +         * GIC PPI inputs used for this board.
> +         */
> +        const int timer_irq[] =3D {
> +            [GTIMER_PHYS] =3D AW_H3_GIC_PPI_PHYSTIMER,
> +            [GTIMER_VIRT] =3D AW_H3_GIC_PPI_VIRTTIMER,
> +            [GTIMER_HYP]  =3D AW_H3_GIC_PPI_HYPTIMER,
> +            [GTIMER_SEC]  =3D AW_H3_GIC_PPI_SECTIMER,
> +        };
> +
> +        /* Connect CPU timer outputs to GIC PPI inputs */
> +        for (irq =3D 0; irq < ARRAY_SIZE(timer_irq); irq++) {
> +            qdev_connect_gpio_out(cpudev, irq,
> +                                  qdev_get_gpio_in(DEVICE(&s->gic),
> +                                                   ppibase + timer_irq[i=
rq]));
> +        }
> +
> +        /* Connect GIC outputs to CPU interrupt inputs */
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->gic), i,
> +                           qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->gic), i + AW_H3_NUM_CPUS,
> +                           qdev_get_gpio_in(cpudev, ARM_CPU_FIQ));
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->gic), i + (2 * AW_H3_NUM_C=
PUS),
> +                           qdev_get_gpio_in(cpudev, ARM_CPU_VIRQ));
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->gic), i + (3 * AW_H3_NUM_C=
PUS),
> +                           qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
> +
> +        /* GIC maintenance signal */
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->gic), i + (4 * AW_H3_NUM_C=
PUS),
> +                           qdev_get_gpio_in(DEVICE(&s->gic),
> +                                            ppibase + AW_H3_GIC_PPI_MAIN=
T));
> +    }
> +
> +    /* Timer */
> +    qdev_init_nofail(DEVICE(&s->timer));
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->timer), 0, s->memmap[AW_H3_PIT]);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->timer), 0,
> +                       qdev_get_gpio_in(DEVICE(&s->gic), AW_H3_GIC_SPI_T=
IMER0));
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->timer), 1,
> +                       qdev_get_gpio_in(DEVICE(&s->gic), AW_H3_GIC_SPI_T=
IMER1));
> +
> +    /* SRAM */
> +    memory_region_init_ram(&s->sram_a1, OBJECT(dev), "sram A1",
> +                            64 * KiB, &error_abort);
> +    memory_region_init_ram(&s->sram_a2, OBJECT(dev), "sram A2",
> +                            32 * KiB, &error_abort);
> +    memory_region_init_ram(&s->sram_c, OBJECT(dev), "sram C",
> +                            44 * KiB, &error_abort);
> +    memory_region_add_subregion(get_system_memory(), s->memmap[AW_H3_SRA=
M_A1],
> +                                &s->sram_a1);
> +    memory_region_add_subregion(get_system_memory(), s->memmap[AW_H3_SRA=
M_A2],
> +                                &s->sram_a2);
> +    memory_region_add_subregion(get_system_memory(), s->memmap[AW_H3_SRA=
M_C],
> +                                &s->sram_c);
> +
> +    /* UART0. For future clocktree API: All UARTS are connected to APB2_=
CLK. */
> +    serial_mm_init(get_system_memory(), s->memmap[AW_H3_UART0], 2,
> +                   qdev_get_gpio_in(DEVICE(&s->gic), AW_H3_GIC_SPI_UART0=
),
> +                   115200, serial_hd(0), DEVICE_NATIVE_ENDIAN);
> +    /* UART1 */
> +    serial_mm_init(get_system_memory(), s->memmap[AW_H3_UART1], 2,
> +                   qdev_get_gpio_in(DEVICE(&s->gic), AW_H3_GIC_SPI_UART1=
),
> +                   115200, serial_hd(1), DEVICE_NATIVE_ENDIAN);
> +    /* UART2 */
> +    serial_mm_init(get_system_memory(), s->memmap[AW_H3_UART2], 2,
> +                   qdev_get_gpio_in(DEVICE(&s->gic), AW_H3_GIC_SPI_UART2=
),
> +                   115200, serial_hd(2), DEVICE_NATIVE_ENDIAN);
> +    /* UART3 */
> +    serial_mm_init(get_system_memory(), s->memmap[AW_H3_UART3], 2,
> +                   qdev_get_gpio_in(DEVICE(&s->gic), AW_H3_GIC_SPI_UART3=
),
> +                   115200, serial_hd(3), DEVICE_NATIVE_ENDIAN);
> +
> +    /* Unimplemented devices */
> +    for (i =3D 0; i < ARRAY_SIZE(unimplemented); i++) {
> +        create_unimplemented_device(unimplemented[i].device_name,
> +                                    unimplemented[i].base,
> +                                    unimplemented[i].size);
> +    }
> +}
> +
> +static void allwinner_h3_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(oc);
> +
> +    dc->realize =3D allwinner_h3_realize;
> +    /* Reason: uses serial_hds and nd_table */

Maybe use "serial_hd()". Also nd_table is not used yet.

> +    dc->user_creatable =3D false;
> +}
> +
> +static const TypeInfo allwinner_h3_type_info =3D {
> +    .name =3D TYPE_AW_H3,
> +    .parent =3D TYPE_DEVICE,
> +    .instance_size =3D sizeof(AwH3State),
> +    .instance_init =3D allwinner_h3_init,
> +    .class_init =3D allwinner_h3_class_init,
> +};
> +
> +static void allwinner_h3_register_types(void)
> +{
> +    type_register_static(&allwinner_h3_type_info);
> +}
> +
> +type_init(allwinner_h3_register_types)
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 55d3642e6c..225582704d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -481,6 +481,13 @@ F: hw/*/allwinner*
>   F: include/hw/*/allwinner*
>   F: hw/arm/cubieboard.c
>  =20
> +Allwinner-h3
> +M: Niek Linnenbank <nieklinnenbank@gmail.com>
> +L: qemu-arm@nongnu.org
> +S: Maintained
> +F: hw/*/allwinner-h3*
> +F: include/hw/*/allwinner-h3*
> +
>   ARM PrimeCell and CMSDK devices
>   M: Peter Maydell <peter.maydell@linaro.org>
>   L: qemu-arm@nongnu.org
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 3d86691ae0..bb75c1de17 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -295,6 +295,14 @@ config ALLWINNER_A10
>       select SERIAL
>       select UNIMP
>  =20
> +config ALLWINNER_H3
> +    bool
> +    select ALLWINNER_A10_PIT

We should now rename this as ALLWINNER_PIT.

> +    select SERIAL
> +    select ARM_TIMER
> +    select ARM_GIC
> +    select UNIMP
> +
>   config RASPI
>       bool
>       select FRAMEBUFFER
> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> index 336f6dd374..ae577e875f 100644
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -35,6 +35,7 @@ obj-$(CONFIG_DIGIC) +=3D digic.o
>   obj-$(CONFIG_OMAP) +=3D omap1.o omap2.o
>   obj-$(CONFIG_STRONGARM) +=3D strongarm.o
>   obj-$(CONFIG_ALLWINNER_A10) +=3D allwinner-a10.o cubieboard.o
> +obj-$(CONFIG_ALLWINNER_H3) +=3D allwinner-h3.o
>   obj-$(CONFIG_RASPI) +=3D bcm2835_peripherals.o bcm2836.o raspi.o
>   obj-$(CONFIG_STM32F205_SOC) +=3D stm32f205_soc.o
>   obj-$(CONFIG_STM32F405_SOC) +=3D stm32f405_soc.o
>=20

Patch very clean!

Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
