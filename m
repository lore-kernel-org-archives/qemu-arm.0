Received: by 10.25.0.6 with SMTP id 6csp525049lfa;
        Fri, 26 May 2017 17:00:47 -0700 (PDT)
X-Received: by 10.55.43.93 with SMTP id r90mr4792902qkh.196.1495843247728;
        Fri, 26 May 2017 17:00:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495843247; cv=none;
        d=google.com; s=arc-20160816;
        b=LYKDPEdScUI17FGKt8Y+pzjdXimzuxPR2bH9dVAPNH0ugRww9VprLS1GwS46fAhT7O
         pJTQTOXWsUwkqRcWdyts+wG4yMhlXrIIy32kDIdhNMGOmK7ukICV4PVf+ytwdOnpH771
         MgZiT3+FmwlBl3MiaAGpTwLmi75Bd4H7O08r1ocr2eX2b8AcEqiWUwqH+T+AWyCpNhL+
         PoH4YBkjgPa0wrftiddn4T6Va2uCUKyhSzJt0iRYByFNhbNcteO/g54J1nY3lEkY0SE8
         jOQ4b6njoPigRSSg2rbUvuUxxFppLk01GdF6mQyhRQFyc5QNZ1SbXkIzXjUoP6WGW7nV
         eh1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=qqpJw1OIIzsZ5wdm8WhabN3iETKz9xvclzYgSbnSjeQ=;
        b=i5fieKvSkGFb4uinDA+eZnhfkPayHELoqKQzCn+o/NM6NxJiCNK16rccBbGaYsk3pT
         Q+Ey5k0Q4i7F8ifSRo1LA86jpRMG36oAs1ScMOSXTH0H7wEtW9971XmkZ1xo5daKI6JX
         LtVNJkQ2aLuNzTpNk02qfMpoLXYl3B0swst2w4qAmEVL3WQFqnxhxnLPDUJLWOQZcyAv
         I3t6kmhzXjrvDNQa4K4mUYZLWiCadHx8v72jp+rKeZ7MFzOM49IAaURhs2arW2mb4vVo
         vnq+YUi9FDltU/7Q0dUl9cVcA6iuCahy4+dXu9amyHlqT2YZcvFbJNcIZ5dkLsKFsR3B
         IK0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u44si2162383qth.5.2017.05.26.17.00.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 May 2017 17:00:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38941 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dEP9z-00012R-7Q
	for alex.bennee@linaro.org; Fri, 26 May 2017 20:00:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35015)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dEP9o-00010r-2z
	for qemu-arm@nongnu.org; Fri, 26 May 2017 20:00:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dEP9m-00084X-Qo
	for qemu-arm@nongnu.org; Fri, 26 May 2017 20:00:36 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:35452)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dEP9j-00083m-UP; Fri, 26 May 2017 20:00:32 -0400
Received: by mail-oi0-x244.google.com with SMTP id v80so3957069oie.2;
	Fri, 26 May 2017 17:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qqpJw1OIIzsZ5wdm8WhabN3iETKz9xvclzYgSbnSjeQ=;
	b=ah7htupm2XCNXbWVYVK4Al74PggMKEV46uiMFX7PEjA2Li9ETxW0zpXchazPIFIK7M
	qqa0BFS2YaCaHxJ1iHTrEf//P+6w+IiVjGhn/WfksGxgQWKCaxJEvGeyO+OoJEi+oryQ
	EpuN9ROsoclQFOm4czLrzo11lUMnp9/0TnboWHKBVXniHcxge9KMQ1dck5U7PwgIWMdP
	2bSqKldfGxs4xbFLXyKlIw0thR5Y3Z+GBCaNVNY6CISoXNZupo/Jwad/OQg45uJCiXHR
	HZU1fQPPdH1dyj27QntNRrEakG4qGoLLOZ1K/zeBh4xcJ6s7ziRqjwRs3u24DD3tBY4U
	BoGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qqpJw1OIIzsZ5wdm8WhabN3iETKz9xvclzYgSbnSjeQ=;
	b=VCXDq7+WTh60jhtT1B93A131cgSPnZZSX8nrf6LnE905/wUo5lUreQqd5pSRed6aFl
	qEXqZ+Ftw5DyPy2yQS1dAIRn6XYM1Z4tbksVHwoR42vknQRch3zMeqdANc3uUXM7Rzzj
	qvkSKRpQlZJQJxb0JC0QLYg0/k1Hzqkd4AajYC7CLGR3vLKkcX0L5j2xLE8HledfExb/
	F1paYZ7teS2RB/szEHAx7OEYeM/cU+RSSlCdA9KQXCmSP5b9JtzzV3IxUvuBaRL7Yt+H
	RvpH/JsyNs7AbIlwQfooPDT1n9zKcE/JOAiYF2wlaGMfWb3cwQXcxXYp9T0A60JSwBLj
	GBWg==
X-Gm-Message-State: AODbwcCZPHQ4Z0ikNXAtmY3rqi+xxBTsyS8xv3QETp8QTz73S4ladoN7
	W1az8xsORs9XQB+hfr3qRu6nfB21qA==
X-Received: by 10.202.170.12 with SMTP id t12mr2286217oie.44.1495843230863;
	Fri, 26 May 2017 17:00:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.2.37 with HTTP; Fri, 26 May 2017 17:00:00 -0700 (PDT)
In-Reply-To: <1494949133-2202-6-git-send-email-sundeep.lkml@gmail.com>
References: <1494949133-2202-1-git-send-email-sundeep.lkml@gmail.com>
	<1494949133-2202-6-git-send-email-sundeep.lkml@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 26 May 2017 17:00:00 -0700
Message-ID: <CAKmqyKPwRaXsgcuGC28x_pA9CYA-tcCnSBGNX1Qv3d3cXX8rsg@mail.gmail.com>
To: Subbaraya Sundeep <sundeep.lkml@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [Qemu devel v5 PATCH 5/5] msf2: Add Emcraft's
 Smartfusion2 SOM kit.
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nAQi8899dCkp

On Tue, May 16, 2017 at 8:38 AM, Subbaraya Sundeep
<sundeep.lkml@gmail.com> wrote:
> Emulated Emcraft's Smartfusion2 System On Module starter
> kit.
>
> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> ---
>  hw/arm/Makefile.objs |  1 +
>  hw/arm/msf2-som.c    | 89 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 90 insertions(+)
>  create mode 100644 hw/arm/msf2-som.c
>
> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> index c828061..4b02093 100644
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -5,6 +5,7 @@ obj-y += omap_sx1.o palm.o realview.o spitz.o stellaris.o
>  obj-y += tosa.o versatilepb.o vexpress.o virt.o xilinx_zynq.o z2.o
>  obj-$(CONFIG_ACPI) += virt-acpi-build.o
>  obj-y += netduino2.o
> +obj-y += msf2-som.o

This should be obj-$(CONFIG_MSF2).

>  obj-y += sysbus-fdt.o
>
>  obj-y += armv7m.o exynos4210.o pxa2xx.o pxa2xx_gpio.o pxa2xx_pic.o
> diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c
> new file mode 100644
> index 0000000..cd2b759
> --- /dev/null
> +++ b/hw/arm/msf2-som.c
> @@ -0,0 +1,89 @@
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
> +#include "hw/arm/msf2-soc.h"
> +#include "hw/arm/arm.h"
> +#include "exec/address-spaces.h"
> +
> +#define DDR_BASE_ADDRESS      0xA0000000
> +#define DDR_SIZE              (64 * M_BYTE)
> +
> +static void emcraft_sf2_init(MachineState *machine)
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
> +    vmstate_register_ram_global(ddr);
> +    memory_region_add_subregion(sysmem, DDR_BASE_ADDRESS, ddr);

The user can use -m to specify the amount of RAM to create in the
machine. Unless this board only ever includes 64MB of RAM you should
use that option (you will need to sanity check it though). If the
board only ever has 64MB it might be worth printing a warning to the
user if they specify an something. Although there might be a default
if they don't use -m, which makes it hard to print out a warning
message.

> +
> +    dev = qdev_create(NULL, TYPE_MSF2_SOC);
> +    qdev_prop_set_string(dev, "part-name", "M2S010");
> +    qdev_prop_set_uint64(dev, "eNVM-size", M2S010_ENVM_SIZE);
> +    qdev_prop_set_uint64(dev, "eSRAM-size", M2S010_ESRAM_SIZE);
> +
> +    /*
> +     * pclk0 and pclk1 are configurable in Libero.
> +     * Emcraft's SoM kit comes with these settings by default.
> +     */
> +    qdev_prop_set_uint32(dev, "pclk0", 71 * 1000000);
> +    qdev_prop_set_uint32(dev, "pclk1", 71 * 1000000);
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

Can you just set realized instead?

Thanks,
Alistair

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
> +    mc->init = emcraft_sf2_init;
> +}
> +
> +DEFINE_MACHINE("smartfusion2-som", emcraft_sf2_machine_init)
> --
> 2.5.0
>
