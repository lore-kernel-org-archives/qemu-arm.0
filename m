Received: by 10.223.188.70 with SMTP id a6csp289464wrh;
        Tue, 29 Aug 2017 20:50:13 -0700 (PDT)
X-Received: by 10.200.38.183 with SMTP id 52mr192448qto.237.1504065013817;
        Tue, 29 Aug 2017 20:50:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504065013; cv=none;
        d=google.com; s=arc-20160816;
        b=KILs54/7D6Kr8CMLVmQyGRnNv/owRpbEEFFSAPz1HMJqkVT9DvSHMB7Hu01/izLzsr
         1+R3Q35W6MffR8SfygHtEEwPe/x29Fn9mxm866wf+ObRCt2XsntbtG3lESEwRDAJCndQ
         1VLn8B5bWJSl6Ir6QbC4PqC/b/fbvcJ0mFmK+9G8woBjUOH5rySLezNCy8e+H4941Q1L
         /zR6yMibLBSCGH5dw6QxjNaow/Efm0dNbXBB+4xBkutCCv0HbEBhtOfwr2rZaNiTlJiN
         PI1lJrLj26M4MaBPhS4mS9yXbop1QJd9lGyRR4P3p/vbPqUpOl36YoPynlsET7cXNrFq
         ZEkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=ULGkTRG04Xj0pQe6afiUOVE9EwNdSsVrO7OyjfZuH7w=;
        b=K7l1OhRUrjAjRtOHCEX8TmleDA13Jj+KLaQexKt9OWxqJKOrKfIdpoxbI90VINxvzw
         RMPS2W9OVK7eKWgVzVQLKchqycjjiRB+TgfkJgxrkzv502lDOfnGjJXsfpQTEFIiuDzm
         rA18hXzuCuJEYY76pKFCx3e4UvRKXtg/wbJG2g6ep1+enU4UjLHncTyRE4fbiA9V0id1
         meEHwiNCqukMHFmcOSJnAGaV67JJaj9wrmG/feQARrdXGBtpkPCxT+T5EWNal2v0Iyre
         /Nc3z9TodE2V4lZUOQb9uloNZ53RIDFgs+R20+yz3KjBDtu8vcAEXh3+c7B76f5GL+zK
         9OVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PsNhI05O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k127si4383226qkf.151.2017.08.29.20.50.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Aug 2017 20:50:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PsNhI05O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47971 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dmu15-0003yw-FK
	for alex.bennee@linaro.org; Tue, 29 Aug 2017 23:50:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40687)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dmu0q-0003wg-E9
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 23:50:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dmu0k-0001Yz-G8
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 23:49:56 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:32991)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dmu0k-0001Yj-B2; Tue, 29 Aug 2017 23:49:50 -0400
Received: by mail-qt0-x243.google.com with SMTP id q53so4363983qtq.0;
	Tue, 29 Aug 2017 20:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ULGkTRG04Xj0pQe6afiUOVE9EwNdSsVrO7OyjfZuH7w=;
	b=PsNhI05OTaT2YUHAAWJMoDIvsupTSSWN/aMXf3zVcZM5IbFpIjhNuHQku2vwKDtE7i
	yKLZbHszgeIpY5CRud1ypp1d2wicPm0rPtbETDF5OsYs4T2xZgAOsKS2opLUnlkwXZCd
	QUjAhaREyhb0ezlo5HB4/iefYPlxyo/qm78pN25oNESpb2gmptIVQKZS4vkqZenSfyNP
	9JXmx1t2DeNw2IiRh4xCWMoIGQPjMoNGisqI3m2JSx+DWG5X8L03gETn/L+yh+hqKkuU
	3A3A11uxa1Bcz7NvyvlWCCurNwvrgrDlr+evIG4NK6oNKbCsYIogNzNBHUW5ztyavrCI
	QYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ULGkTRG04Xj0pQe6afiUOVE9EwNdSsVrO7OyjfZuH7w=;
	b=AiGi/VBZ48ane8Y7yjdPpnm3Mcd5K5UYuAjhXhMzDEwYGO/PBqSWU5Vmsq1NhfQ2k3
	7wV45vTHTCRjyhvsI3HKxvHWc1aALMohqUodkblIgAZLgPJmAPOs3kVcj9KGnxCXstaw
	aweG4HQ9eS0+pqAbNfox/3hFGf/yTOQjxEtNDQYSHhfiZS3J7N5+g9HwK+FR8pwDCqu9
	YDJSmngr40BbTMjnYd46tqZzJZjpFQWLDbeOlGxImBSyI4rUF1sjVv0028oIHmaIErxk
	gRXcLYbPll7GlIARrbyxlSeLID4JtFuVROiyuu8Y8KWNHWH8yDfuVHE6SBqkqgzkMDHG
	pMKQ==
X-Gm-Message-State: AHYfb5jUaHMZ28PYda3YCRRUoyhFN9nfNZO12VGTHmY+MXel6BHj8/Xp
	2zMV+803T6EbMA==
X-Received: by 10.237.62.173 with SMTP id n42mr265987qtf.72.1504064989706;
	Tue, 29 Aug 2017 20:49:49 -0700 (PDT)
Received: from [192.168.43.33] ([170.51.33.248])
	by smtp.gmail.com with ESMTPSA id
	e67sm2990018qkb.67.2017.08.29.20.49.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Aug 2017 20:49:49 -0700 (PDT)
To: Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
References: <1503938283-12404-1-git-send-email-sundeep.lkml@gmail.com>
	<1503938283-12404-6-git-send-email-sundeep.lkml@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d57d4bab-51ec-901c-7474-20dc5156f795@amsat.org>
Date: Tue, 29 Aug 2017 22:48:59 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1503938283-12404-6-git-send-email-sundeep.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-arm] [Qemu devel v7 PATCH 5/5] msf2: Add Emcraft's
 Smartfusion2 SOM kit
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, alistair23@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x6mL2wVSwYck

Hi Subbaraya,

On 08/28/2017 01:38 PM, Subbaraya Sundeep wrote:
> Emulated Emcraft's Smartfusion2 System On Module starter
> kit.
> 
> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> ---
>   hw/arm/Makefile.objs |  2 +-
>   hw/arm/msf2-som.c    | 94 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 95 insertions(+), 1 deletion(-)
>   create mode 100644 hw/arm/msf2-som.c
> 
> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> index df36a03..e81a7dc 100644
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -19,4 +19,4 @@ obj-$(CONFIG_FSL_IMX31) += fsl-imx31.o kzm.o
>   obj-$(CONFIG_FSL_IMX6) += fsl-imx6.o sabrelite.o
>   obj-$(CONFIG_ASPEED_SOC) += aspeed_soc.o aspeed.o
>   obj-$(CONFIG_MPS2) += mps2.o
> -obj-$(CONFIG_MSF2) += msf2-soc.o
> +obj-$(CONFIG_MSF2) += msf2-soc.o msf2-som.o
> diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c
> new file mode 100644
> index 0000000..fd89ba9
> --- /dev/null
> +++ b/hw/arm/msf2-som.c
> @@ -0,0 +1,94 @@
> +/*
> + * SmartFusion2 SOM starter kit(from Emcraft) emulation.
> + *
> + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "hw/boards.h"
> +#include "hw/arm/arm.h"
> +#include "exec/address-spaces.h"
> +#include "qemu/cutils.h"
> +#include "hw/arm/msf2-soc.h"
> +
> +#define DDR_BASE_ADDRESS      0xA0000000
> +#define DDR_SIZE              (64 * M_BYTE)
> +
> +#define M2S010_ENVM_SIZE      (256 * K_BYTE)
> +#define M2S010_ESRAM_SIZE     (64 * K_BYTE)
> +
> +static void emcraft_sf2_init(MachineState *machine)

Since Emcraft can produce an upgraded SF2 SoC based on a different MCU, 
I prefer you rename it:

static void emcraft_sf2_s2s010_init(MachineState *machine)

> +{
> +    DeviceState *dev;
> +    DeviceState *spi_flash;
> +    MSF2State *soc;
> +    DriveInfo *dinfo = drive_get_next(IF_MTD);
> +    qemu_irq cs_line;
> +    SSIBus *spi_bus;
> +    MemoryRegion *sysmem = get_system_memory();
> +    MemoryRegion *ddr = g_new(MemoryRegion, 1);
> +
> +    memory_region_init_ram(ddr, NULL, "ddr-ram", DDR_SIZE,
> +                           &error_fatal);
> +    memory_region_add_subregion(sysmem, DDR_BASE_ADDRESS, ddr);
> +
> +    dev = qdev_create(NULL, TYPE_MSF2_SOC);
> +    qdev_prop_set_string(dev, "part-name", "M2S010");
> +    qdev_prop_set_uint64(dev, "eNVM-size", M2S010_ENVM_SIZE);
> +    qdev_prop_set_uint64(dev, "eSRAM-size", M2S010_ESRAM_SIZE);
> +
> +    /*
> +     * CPU clock and peripheral clocks(APB0, APB1)are configurable
> +     * in Libero. CPU clock is divided by APB0 and APB1 divisors for
> +     * peripherals. Emcraft's SoM kit comes with these settings by default.
> +     */
> +    qdev_prop_set_uint32(dev, "m3clk", 142 * 1000000);
> +    qdev_prop_set_uint32(dev, "apb0div", 2);
> +    qdev_prop_set_uint32(dev, "apb1div", 2);
> +
> +    object_property_set_bool(OBJECT(dev), true, "realized", &error_fatal);
> +
> +    soc = MSF2_SOC(dev);
> +
> +    /* Attach SPI flash to SPI0 controller */
> +    spi_bus = (SSIBus *)qdev_get_child_bus(dev, "spi0");
> +    spi_flash = ssi_create_slave_no_init(spi_bus, "s25sl12801");
> +    qdev_prop_set_uint8(spi_flash, "spansion-cr2nv", 1);
> +    if (dinfo) {
> +        qdev_prop_set_drive(spi_flash, "drive", blk_by_legacy_dinfo(dinfo),
> +                                    &error_fatal);
> +    }
> +    qdev_init_nofail(spi_flash);
> +    cs_line = qdev_get_gpio_in_named(spi_flash, SSI_GPIO_CS, 0);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&soc->spi[0]), 1, cs_line);
> +
> +    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
> +                       soc->envm_size);
> +}
> +
> +static void emcraft_sf2_machine_init(MachineClass *mc)
> +{
> +    mc->desc = "SmartFusion2 SOM kit from Emcraft";

     mc->desc = "SmartFusion2 SOM kit from Emcraft (M2S010)";

> +    mc->init = emcraft_sf2_init;

     mc->init = emcraft_sf2_s2s010_init;

> +}
> +
> +DEFINE_MACHINE("emcraft-sf2", emcraft_sf2_machine_init)

Good work :)

With the changes:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
