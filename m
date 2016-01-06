Received: by 10.182.158.201 with SMTP id ww9csp11505943obb;
        Tue, 5 Jan 2016 18:14:35 -0800 (PST)
X-Received: by 10.140.221.17 with SMTP id r17mr85821098qhb.94.1452046475134;
        Tue, 05 Jan 2016 18:14:35 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p190si66437963qha.63.2016.01.05.18.14.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Jan 2016 18:14:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52233 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aGdcQ-0006cD-PJ
	for alex.bennee@linaro.org; Tue, 05 Jan 2016 21:14:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57742)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1aGdcO-0006Zd-N2
	for qemu-arm@nongnu.org; Tue, 05 Jan 2016 21:14:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1aGdcN-0002Wt-8m
	for qemu-arm@nongnu.org; Tue, 05 Jan 2016 21:14:32 -0500
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:36069)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1aGdcK-0002WI-G5; Tue, 05 Jan 2016 21:14:28 -0500
Received: by mail-oi0-x244.google.com with SMTP id o124so26567819oia.3;
	Tue, 05 Jan 2016 18:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=kchflBEODjSr/KtemiHCjHlZwAS+Kw7d1jH/gZi0+Yg=;
	b=SGkJXpuG5pCKIJInzXW16awSDKszDQmgfzJ0NXS7/h6leX5EyMHjEAJ3ct9NQkHCgU
	kg8h1vhdj9VDIdxfytwnd1LDaWZNg1MGW743FuYtHMKGHsytE8UJlUaKHbFuuioLXxKA
	xwCkC/wgjplhuiwrpUGHklQi0KNuOeCyjOp/9uXCasK+5FU6UHE09DPvuL4vpXpPP6K9
	fHzTFf6km96vh4SO++LkcgzXKJGCjl8a0heug2waxDDYghWnnLIDwnZvrAaZCe0gF4An
	yhb1DTcn9S1z70ux25Oe6nzPwmtv1VdnzqRXT7328EvkaeWJda+QmhXv4PiagGYC2z2z
	Mlsw==
X-Received: by 10.202.180.66 with SMTP id d63mr65454070oif.76.1452046467873;
	Tue, 05 Jan 2016 18:14:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.49.199 with HTTP; Tue, 5 Jan 2016 18:13:40 -0800 (PST)
In-Reply-To: <1451608294-16432-5-git-send-email-Andrew.Baumann@microsoft.com>
References: <1451608294-16432-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1451608294-16432-5-git-send-email-Andrew.Baumann@microsoft.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 5 Jan 2016 18:13:40 -0800
Message-ID: <CAKmqyKNhzTUAvexC-N+mxekuWgcteEoujg6fQo2vL+tHsHw=Og@mail.gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::244
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
	=?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 4/7] bcm2835_peripherals: add
 rollup device for bcm2835 peripherals
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uGNJ88GYvmOQ

On Thu, Dec 31, 2015 at 4:31 PM, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
> This device maintains all the non-CPU peripherals on bcm2835 (Pi1)
> which are also present on bcm2836 (Pi2). It also implements the
> private address spaces used for DMA and mailboxes.
>
> Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
> ---
>
> Notes:
>     v3:
>      * clean up raspi_platform.h
>      * s/_/-/ in type/property/child names
>      * use memory_region_init where appropriate rather than memory_region_init_io
>      * pass ram as link property
>
>     v2 changes:
>      * adapted to use common SDHCI emulation
>
>  hw/arm/Makefile.objs                 |   1 +
>  hw/arm/bcm2835_peripherals.c         | 205 +++++++++++++++++++++++++++++++++++
>  include/hw/arm/bcm2835_peripherals.h |  42 +++++++
>  include/hw/arm/raspi_platform.h      | 128 ++++++++++++++++++++++
>  4 files changed, 376 insertions(+)
>  create mode 100644 hw/arm/bcm2835_peripherals.c
>  create mode 100644 include/hw/arm/bcm2835_peripherals.h
>  create mode 100644 include/hw/arm/raspi_platform.h
>
> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> index 2195b60..82cc142 100644
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -11,6 +11,7 @@ obj-y += armv7m.o exynos4210.o pxa2xx.o pxa2xx_gpio.o pxa2xx_pic.o
>  obj-$(CONFIG_DIGIC) += digic.o
>  obj-y += omap1.o omap2.o strongarm.o
>  obj-$(CONFIG_ALLWINNER_A10) += allwinner-a10.o cubieboard.o
> +obj-$(CONFIG_RASPI) += bcm2835_peripherals.o
>  obj-$(CONFIG_STM32F205_SOC) += stm32f205_soc.o
>  obj-$(CONFIG_XLNX_ZYNQMP) += xlnx-zynqmp.o xlnx-ep108.o
>  obj-$(CONFIG_FSL_IMX25) += fsl-imx25.o imx25_pdk.o
> diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
> new file mode 100644
> index 0000000..879a41d
> --- /dev/null
> +++ b/hw/arm/bcm2835_peripherals.c
> @@ -0,0 +1,205 @@
> +/*
> + * Raspberry Pi emulation (c) 2012 Gregory Estrade
> + * Upstreaming code cleanup [including bcm2835_*] (c) 2013 Jan Petrous
> + *
> + * Rasperry Pi 2 emulation and refactoring Copyright (c) 2015, Microsoft
> + * Written by Andrew Baumann
> + *
> + * This code is licensed under the GNU GPLv2 and later.
> + */
> +
> +#include "hw/arm/bcm2835_peripherals.h"
> +#include "hw/misc/bcm2835_mbox_defs.h"
> +#include "hw/arm/raspi_platform.h"
> +
> +/* Peripheral base address on the VC (GPU) system bus */
> +#define BCM2835_VC_PERI_BASE 0x7e000000
> +
> +/* Capabilities for SD controller: no DMA, high-speed, default clocks etc. */
> +#define BCM2835_SDHC_CAPAREG 0x52034b4
> +
> +static void bcm2835_peripherals_init(Object *obj)
> +{
> +    BCM2835PeripheralState *s = BCM2835_PERIPHERALS(obj);
> +
> +    /* Memory region for peripheral devices, which we export to our parent */
> +    memory_region_init_io(&s->peri_mr, obj, NULL, s, "bcm2835-peripherals",
> +                          0x1000000);
> +    object_property_add_child(obj, "peripheral-io", OBJECT(&s->peri_mr), NULL);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->peri_mr);
> +
> +    /* Internal memory region for peripheral bus addresses (not exported) */
> +    memory_region_init(&s->gpu_bus_mr, obj, "bcm2835-gpu", (uint64_t)1 << 32);
> +    object_property_add_child(obj, "gpu-bus", OBJECT(&s->gpu_bus_mr), NULL);
> +
> +    /* Internal memory region for request/response communication with
> +     * mailbox-addressable peripherals (not exported)
> +     */
> +    memory_region_init(&s->mbox_mr, obj, "bcm2835-mbox",
> +                       MBOX_CHAN_COUNT << MBOX_AS_CHAN_SHIFT);
> +
> +    /* Interrupt Controller */
> +    object_initialize(&s->ic, sizeof(s->ic), TYPE_BCM2835_IC);
> +    object_property_add_child(obj, "ic", OBJECT(&s->ic), NULL);
> +    qdev_set_parent_bus(DEVICE(&s->ic), sysbus_get_default());
> +
> +    /* UART0 */
> +    s->uart0 = SYS_BUS_DEVICE(object_new("pl011"));
> +    object_property_add_child(obj, "uart0", OBJECT(s->uart0), NULL);
> +    qdev_set_parent_bus(DEVICE(s->uart0), sysbus_get_default());
> +
> +    /* Mailboxes */
> +    object_initialize(&s->mboxes, sizeof(s->mboxes), TYPE_BCM2835_MBOX);
> +    object_property_add_child(obj, "mbox", OBJECT(&s->mboxes), NULL);
> +    qdev_set_parent_bus(DEVICE(&s->mboxes), sysbus_get_default());
> +
> +    object_property_add_const_link(OBJECT(&s->mboxes), "mbox-mr",
> +                                   OBJECT(&s->mbox_mr), &error_abort);
> +
> +    /* Property channel */
> +    object_initialize(&s->property, sizeof(s->property), TYPE_BCM2835_PROPERTY);
> +    object_property_add_child(obj, "property", OBJECT(&s->property), NULL);
> +    qdev_set_parent_bus(DEVICE(&s->property), sysbus_get_default());
> +
> +    object_property_add_const_link(OBJECT(&s->property), "dma-mr",
> +                                   OBJECT(&s->gpu_bus_mr), &error_abort);
> +
> +    /* Extended Mass Media Controller */
> +    object_initialize(&s->sdhci, sizeof(s->sdhci), TYPE_SYSBUS_SDHCI);
> +    object_property_add_child(obj, "sdhci", OBJECT(&s->sdhci), NULL);
> +    qdev_set_parent_bus(DEVICE(&s->sdhci), sysbus_get_default());
> +}
> +
> +static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
> +{
> +    BCM2835PeripheralState *s = BCM2835_PERIPHERALS(dev);
> +    Object *obj;
> +    MemoryRegion *ram;
> +    Error *err = NULL;
> +    uint32_t ram_size;
> +    int n;
> +
> +    obj = object_property_get_link(OBJECT(dev), "ram", &err);
> +    if (obj == NULL) {
> +        error_setg(errp, "%s: required ram link not found: %s",
> +                   __func__, error_get_pretty(err));
> +        return;
> +    }

I only had a quick read of this patch, but this RAM linking looks fine
to me. Out of curiosity is there a reason you use
object_property_get_link() instead of object_property_add_link() in
the init?

Thanks,

Alistair
