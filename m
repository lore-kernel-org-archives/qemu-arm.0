Received: by 10.182.158.201 with SMTP id ww9csp8289056obb;
        Wed, 30 Dec 2015 18:54:08 -0800 (PST)
X-Received: by 10.140.40.37 with SMTP id w34mr16046273qgw.85.1451530448523;
        Wed, 30 Dec 2015 18:54:08 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k88si36624295qgf.120.2015.12.30.18.54.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 Dec 2015 18:54:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54469 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aETNQ-00049u-9d
	for alex.bennee@linaro.org; Wed, 30 Dec 2015 21:54:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39194)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aETNM-00045I-Bs
	for qemu-arm@nongnu.org; Wed, 30 Dec 2015 21:54:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aETNJ-0007XT-Qv
	for qemu-arm@nongnu.org; Wed, 30 Dec 2015 21:54:04 -0500
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:36089)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aETNE-0007UN-0P; Wed, 30 Dec 2015 21:53:56 -0500
Received: by mail-wm0-x244.google.com with SMTP id l65so38953788wmf.3;
	Wed, 30 Dec 2015 18:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=trcpqfkZDXlN0CVG8FBQxfBvm4L+GQ1XWH+KVsF1mso=;
	b=XdekUxJS2uytON0wbsp1RUPwZLLsZOQTixRu+JIokhKeoOVvnCQkgVouAnMd7hJ3jb
	xN8iqw3vWEP+4BGQ2xSfgzLzQ+d/ISdfqQnxHLiHq0Rgi6EkuMrul8PZgNjl/Tv+Ebih
	tcw/cY1aGhDfLt1PWw0ff2nFuFClhnfPIQEacFa4t3HmhGw/r+wOcBMrFRDaKw/j3Suf
	d8bOYrZZ0dsJ68Ef8OGwS/p4UyVI+ATub1fDnMti1MwikTypPxX6+Trx3xJ0txVpzIgP
	QmW0D6qdjgpwoS809s/JKzwpGm5wRJjnAWGBcGA6cerrPXXOH6PEEd8UsiktZDdrIZga
	7ARg==
MIME-Version: 1.0
X-Received: by 10.28.63.22 with SMTP id m22mr52914966wma.59.1451530434940;
	Wed, 30 Dec 2015 18:53:54 -0800 (PST)
Received: by 10.28.91.143 with HTTP; Wed, 30 Dec 2015 18:53:54 -0800 (PST)
In-Reply-To: <1450916731-5968-5-git-send-email-Andrew.Baumann@microsoft.com>
References: <1450916731-5968-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1450916731-5968-5-git-send-email-Andrew.Baumann@microsoft.com>
Date: Wed, 30 Dec 2015 18:53:54 -0800
Message-ID: <CAPokK=pA9CFqkk5=hAqcqf=fV2Mx7PX_QtruyLESaT6Z07Ds+Q@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>, 
	Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::244
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v2 4/7] bcm2835_peripherals: add rollup
	device for bcm2835 peripherals
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
X-TUID: F2mTayM5kPrg

On Wed, Dec 23, 2015 at 4:25 PM, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
> This device maintains all the non-CPU peripherals on bcm2835 (Pi1)
> which are also present on bcm2836 (Pi2). It also implements the
> private address space used for DMA.
>
> Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
> ---
>
> Notes:
>     v2 changes:
>      * adapted to use common SDHCI emulation
>
>  hw/arm/Makefile.objs                 |   1 +
>  hw/arm/bcm2835_peripherals.c         | 198 +++++++++++++++++++++++++++++++++++
>  include/hw/arm/bcm2835_peripherals.h |  42 ++++++++
>  include/hw/arm/raspi_platform.h      | 161 ++++++++++++++++++++++++++++
>  4 files changed, 402 insertions(+)
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
> index 0000000..deb6336
> --- /dev/null
> +++ b/hw/arm/bcm2835_peripherals.c
> @@ -0,0 +1,198 @@
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
> +/* Capabilities for SD controller: no DMA, high-speed, default clocks etc. */
> +#define BCM2835_SDHC_CAPAREG 0x52034b4
> +
> +static void bcm2835_peripherals_init(Object *obj)
> +{
> +    BCM2835PeripheralState *s = BCM2835_PERIPHERALS(obj);
> +
> +    /* Memory region for peripheral devices, which we export to our parent */
> +    memory_region_init_io(&s->peri_mr, OBJECT(s), NULL, s,
> +                          "bcm2835_peripherals", 0x1000000);
> +    object_property_add_child(obj, "peripheral_io", OBJECT(&s->peri_mr), NULL);

s/_/-, here and below. The names of child devices are user-exposed via
QOM canonical paths.

> +    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->peri_mr);
> +
> +    /* Internal memory region for peripheral bus addresses (not exported) */
> +    memory_region_init_io(&s->gpu_bus_mr, OBJECT(s), NULL, s, "bcm2835_gpu_bus",
> +                          (uint64_t)1 << 32);

You already have obj for the OBJECT casted version of s.

Why do you us memory_region_init_io though instead of
memory_region_init? This looks like a container MR which is what
unqualified memory_region_init provides.

> +    object_property_add_child(obj, "gpu_bus", OBJECT(&s->gpu_bus_mr), NULL);
> +
> +    /* Internal memory region for communication of mailbox channel data */
> +    memory_region_init_io(&s->mbox_mr, OBJECT(s), NULL, s, "bcm2835_mbox",
> +                          MBOX_CHAN_COUNT << 4);
> +

Same here. Although this container seems to have only one subregion at
offset 0 (the property device). Long term, will this MR have more
stuff in it or will always be just the property?

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
> +    object_property_add_const_link(OBJECT(&s->mboxes), "mbox_mr",
> +                                   OBJECT(&s->mbox_mr), &error_abort);
> +
> +    /* Property channel */
> +    object_initialize(&s->property, sizeof(s->property), TYPE_BCM2835_PROPERTY);
> +    object_property_add_child(obj, "property", OBJECT(&s->property), NULL);
> +    qdev_set_parent_bus(DEVICE(&s->property), sysbus_get_default());
> +
> +    object_property_add_const_link(OBJECT(&s->property), "dma_mr",
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
> +    MemoryRegion *ram;
> +    Error *err = NULL;
> +    uint32_t ram_size;
> +    int n;
> +
> +    /* Map peripherals and RAM into the GPU address space. */
> +    memory_region_init_alias(&s->peri_mr_alias, OBJECT(s),
> +                             "bcm2835_peripherals", &s->peri_mr, 0,
> +                             memory_region_size(&s->peri_mr));
> +
> +    memory_region_add_subregion_overlap(&s->gpu_bus_mr, BCM2835_VC_PERI_BASE,
> +                                        &s->peri_mr_alias, 1);
> +
> +    /* XXX: assume that RAM is contiguous and mapped at system address zero */
> +    ram = memory_region_find(get_system_memory(), 0, 1).mr;

Not sure about this. Alistair (from Xilinx) has a similar problem
where the SoC needed to do a complex split of the single DDR into
multiple system address regions. I cc'd you on a patch. Following
Alistair's patch in the Xiinx ep108/zynqmp work, the system_memory
region is now fully owned by the SoC level and disused by the
machine/board level. I would suggest something similar here. The board
is responsible for creating (and mainly sizing) the RAM, and links (or
const-link's) the RAM to the SoC where it can be subregioned as-is
without this search. As you already have SoC level memory regions for
your multiple address spaces, you may actually end up with
system_memory being completely unused (and that is OK).

> +    assert(ram != NULL && memory_region_size(ram) >= 128 * 1024 * 1024);

What is is the significance of the 128MB lower clamp? This should
probably be a weaker error than assert. Depending on the reason for
the error, it could be located in a number of different places. If the
SoC cannot function without 128MB for some reason this is the right
place.

If it is for forcing the user to not pass something to -m because that
is simply not what is on the board, then it should be done on the
board level. I'm thinking it would be reasonable to defeature -m for
these fixed boards as it does make less and less sense.

> +    ram_size = memory_region_size(ram);
> +
> +    /* RAM is aliased four times (different cache configurations) on the GPU */
> +    for (n = 0; n < 4; n++) {
> +        memory_region_init_alias(&s->ram_alias[n], OBJECT(s),
> +                                 "bcm2835_gpu_ram_alias[*]", ram, 0, ram_size);
> +        memory_region_add_subregion_overlap(&s->gpu_bus_mr, (hwaddr)n << 30,
> +                                            &s->ram_alias[n], 0);
> +    }
> +
> +    /* Interrupt Controller */
> +    object_property_set_bool(OBJECT(&s->ic), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
> +    memory_region_add_subregion(&s->peri_mr, ARMCTRL_IC_OFFSET,
> +                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->ic), 0));
> +    sysbus_pass_irq(SYS_BUS_DEVICE(s), SYS_BUS_DEVICE(&s->ic));
> +
> +    /* UART0 */
> +    object_property_set_bool(OBJECT(s->uart0), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
> +    memory_region_add_subregion(&s->peri_mr, UART0_OFFSET,
> +                                sysbus_mmio_get_region(s->uart0, 0));
> +    sysbus_connect_irq(s->uart0, 0,
> +        qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
> +                               INTERRUPT_VC_UART));
> +
> +    /* Mailboxes */
> +    object_property_set_bool(OBJECT(&s->mboxes), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
> +    memory_region_add_subregion(&s->peri_mr, ARMCTRL_0_SBM_OFFSET,
> +                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->mboxes), 0));
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->mboxes), 0,
> +        qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_ARM_IRQ,
> +                               INTERRUPT_ARM_MAILBOX - ARM_IRQ0_BASE));
> +
> +    /* Mailbox-addressable peripherals use the private mbox_mr address space
> +     * and pseudo-irqs to dispatch requests and responses. */

This comment location seems odd. Should it just go with the definition
of mbox_mr? It could possibly be a top level comment too.

Space before  */

> +
> +    /* Property channel */

These are all self-documented by the already-well-named s-> fields, so
you can drop these comments indicating what you are realizing.

> +    object_property_set_int(OBJECT(&s->property), ram_size, "ram-size", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
> +    object_property_set_bool(OBJECT(&s->property), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
> +    memory_region_add_subregion(&s->mbox_mr,
> +                MBOX_CHAN_PROPERTY << MBOX_AS_CHAN_SHIFT,
> +                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->property), 0));
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->property), 0,
> +                      qdev_get_gpio_in(DEVICE(&s->mboxes), MBOX_CHAN_PROPERTY));
> +
> +    /* Extended Mass Media Controller */
> +    object_property_set_int(OBJECT(&s->sdhci), BCM2835_SDHC_CAPAREG, "capareg",
> +                            &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
> +    object_property_set_bool(OBJECT(&s->sdhci), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
> +    memory_region_add_subregion(&s->peri_mr, EMMC_OFFSET,
> +                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->sdhci), 0));
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdhci), 0,
> +        qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
> +                               INTERRUPT_VC_ARASANSDIO));
> +}
> +
> +static void bcm2835_peripherals_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    dc->realize = bcm2835_peripherals_realize;
> +}
> +
> +static const TypeInfo bcm2835_peripherals_type_info = {
> +    .name = TYPE_BCM2835_PERIPHERALS,
> +    .parent = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(BCM2835PeripheralState),
> +    .instance_init = bcm2835_peripherals_init,
> +    .class_init = bcm2835_peripherals_class_init,
> +};
> +
> +static void bcm2835_peripherals_register_types(void)
> +{
> +    type_register_static(&bcm2835_peripherals_type_info);
> +}
> +
> +type_init(bcm2835_peripherals_register_types)
> diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm2835_peripherals.h
> new file mode 100644
> index 0000000..b3ba574
> --- /dev/null
> +++ b/include/hw/arm/bcm2835_peripherals.h
> @@ -0,0 +1,42 @@
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
> +#ifndef BCM2835_PERIPHERALS_H
> +#define BCM2835_PERIPHERALS_H
> +
> +#include "qemu-common.h"
> +#include "exec/address-spaces.h"
> +#include "hw/sysbus.h"
> +#include "hw/intc/bcm2835_ic.h"
> +#include "hw/misc/bcm2835_property.h"
> +#include "hw/misc/bcm2835_mbox.h"
> +#include "hw/sd/sdhci.h"
> +
> +#define TYPE_BCM2835_PERIPHERALS "bcm2835_peripherals"
> +#define BCM2835_PERIPHERALS(obj) \
> +    OBJECT_CHECK(BCM2835PeripheralState, (obj), TYPE_BCM2835_PERIPHERALS)
> +
> +typedef struct BCM2835PeripheralState {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +    /*< public >*/
> +
> +    MemoryRegion peri_mr, peri_mr_alias, gpu_bus_mr, mbox_mr;
> +    MemoryRegion ram_alias[4];
> +    qemu_irq irq, fiq;
> +
> +    SysBusDevice *uart0;
> +    BCM2835ICState ic;
> +    BCM2835PropertyState property;
> +    BCM2835MboxState mboxes;
> +    SDHCIState sdhci;
> +} BCM2835PeripheralState;
> +
> +#endif /* BCM2835_PERIPHERALS_H */
> diff --git a/include/hw/arm/raspi_platform.h b/include/hw/arm/raspi_platform.h
> new file mode 100644
> index 0000000..8386949
> --- /dev/null
> +++ b/include/hw/arm/raspi_platform.h
> @@ -0,0 +1,161 @@
> +/*
> + * bcm2708 aka bcm2835/2836 aka Raspberry Pi/Pi2 SoC platform defines
> + *
> + * These definitions are derived from those in Linux at
> + * arch/arm/mach-{bcm2708,bcm2709}/include/mach/platform.h

I think this is in the same basket as the header from P1. We should
cherry pick out the defs that we care about (or are likely to care
about in near term follow up). I'm guessing this is sourced from the
same Linux fork as before?

> + * where they carry the following notice:
> + */
> +
> +/*
> + * arch/arm/mach-bcm2708/include/mach/platform.h
> + *
> + * Copyright (C) 2010 Broadcom
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write to the Free Software
> + * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
> + */
> +
> +/* Peripheral base address on the VC (GPU) system bus */
> +#define BCM2835_VC_PERI_BASE 0x7e000000
> +
> +/* Peripheral base addresses seen by the CPU: Pi1 and Pi2 differ */
> +#define BCM2835_PERI_BASE       0x20000000
> +#define BCM2836_PERI_BASE       0x3F000000
> +

These two should be defined by their resp. socs.

> +/* "QA7" (Pi2) interrupt controller and mailboxes etc. */
> +#define BCM2836_CONTROL_BASE    0x40000000
> +
> +#define MCORE_OFFSET            0x0000   /* Fake frame buffer device
> +                                          * (the multicore sync block) */
> +#define IC0_OFFSET              0x2000
> +#define ST_OFFSET               0x3000   /* System Timer */
> +#define MPHI_OFFSET             0x6000   /* Message-based Parallel Host Intf. */
> +#define DMA_OFFSET              0x7000   /* DMA controller, channels 0-14 */
> +#define ARM_OFFSET              0xB000   /* BCM2708 ARM control block */
> +#define ARMCTRL_OFFSET          (ARM_OFFSET + 0x000)
> +#define ARMCTRL_IC_OFFSET       (ARM_OFFSET + 0x200) /* Interrupt controller */
> +#define ARMCTRL_TIMER0_1_OFFSET (ARM_OFFSET + 0x400) /* Timer 0 and 1 */
> +#define ARMCTRL_0_SBM_OFFSET    (ARM_OFFSET + 0x800) /* User 0 (ARM) Semaphores
> +                                                      * Doorbells & Mailboxes */
> +#define PM_OFFSET               0x100000 /* Power Management, Reset controller
> +                                          * and Watchdog registers */
> +#define PCM_CLOCK_OFFSET        0x101098 /* PCM Clock */
> +#define RNG_OFFSET              0x104000 /* Hardware RNG */
> +#define GPIO_OFFSET             0x200000 /* GPIO */
> +#define UART0_OFFSET            0x201000 /* Uart 0 */

Trailing comments that don't add anything should be dropped.

> +#define MMCI0_OFFSET            0x202000 /* MMC interface */
> +#define I2S_OFFSET              0x203000 /* I2S */
> +#define SPI0_OFFSET             0x204000 /* SPI0 */
> +#define BSC0_OFFSET             0x205000 /* BSC0 I2C/TWI */
> +#define UART1_OFFSET            0x215000 /* Uart 1 */
> +#define EMMC_OFFSET             0x300000 /* eMMC interface */
> +#define SMI_OFFSET              0x600000 /* SMI */
> +#define BSC1_OFFSET             0x804000 /* BSC1 I2C/TWI */
> +#define USB_OFFSET              0x980000 /* DTC_OTG USB controller */
> +#define DMA15_OFFSET            0xE05000 /* DMA controller, channel 15 */
> +
> +/*
> + * Interrupt assignments
> + */
> +
> +#define ARM_IRQ1_BASE                  0
> +#define INTERRUPT_TIMER0               (ARM_IRQ1_BASE + 0)
> +#define INTERRUPT_TIMER1               (ARM_IRQ1_BASE + 1)
> +#define INTERRUPT_TIMER2               (ARM_IRQ1_BASE + 2)
> +#define INTERRUPT_TIMER3               (ARM_IRQ1_BASE + 3)
> +#define INTERRUPT_CODEC0               (ARM_IRQ1_BASE + 4)
> +#define INTERRUPT_CODEC1               (ARM_IRQ1_BASE + 5)
> +#define INTERRUPT_CODEC2               (ARM_IRQ1_BASE + 6)
> +#define INTERRUPT_VC_JPEG              (ARM_IRQ1_BASE + 7)
> +#define INTERRUPT_ISP                  (ARM_IRQ1_BASE + 8)
> +#define INTERRUPT_VC_USB               (ARM_IRQ1_BASE + 9)
> +#define INTERRUPT_VC_3D                (ARM_IRQ1_BASE + 10)
> +#define INTERRUPT_TRANSPOSER           (ARM_IRQ1_BASE + 11)
> +#define INTERRUPT_MULTICORESYNC0       (ARM_IRQ1_BASE + 12)
> +#define INTERRUPT_MULTICORESYNC1       (ARM_IRQ1_BASE + 13)
> +#define INTERRUPT_MULTICORESYNC2       (ARM_IRQ1_BASE + 14)
> +#define INTERRUPT_MULTICORESYNC3       (ARM_IRQ1_BASE + 15)
> +#define INTERRUPT_DMA0                 (ARM_IRQ1_BASE + 16)
> +#define INTERRUPT_DMA1                 (ARM_IRQ1_BASE + 17)
> +#define INTERRUPT_VC_DMA2              (ARM_IRQ1_BASE + 18)
> +#define INTERRUPT_VC_DMA3              (ARM_IRQ1_BASE + 19)
> +#define INTERRUPT_DMA4                 (ARM_IRQ1_BASE + 20)
> +#define INTERRUPT_DMA5                 (ARM_IRQ1_BASE + 21)
> +#define INTERRUPT_DMA6                 (ARM_IRQ1_BASE + 22)
> +#define INTERRUPT_DMA7                 (ARM_IRQ1_BASE + 23)
> +#define INTERRUPT_DMA8                 (ARM_IRQ1_BASE + 24)
> +#define INTERRUPT_DMA9                 (ARM_IRQ1_BASE + 25)
> +#define INTERRUPT_DMA10                (ARM_IRQ1_BASE + 26)
> +#define INTERRUPT_DMA11                (ARM_IRQ1_BASE + 27)
> +#define INTERRUPT_DMA12                (ARM_IRQ1_BASE + 28)
> +#define INTERRUPT_AUX                  (ARM_IRQ1_BASE + 29)
> +#define INTERRUPT_ARM                  (ARM_IRQ1_BASE + 30)
> +#define INTERRUPT_VPUDMA               (ARM_IRQ1_BASE + 31)
> +
> +#define ARM_IRQ2_BASE                  32

Can you just keep it as one big 64-long list? I don't think we need
the _BASE defs at all anymore.

> +#define INTERRUPT_HOSTPORT             (ARM_IRQ2_BASE + 0)
> +#define INTERRUPT_VIDEOSCALER          (ARM_IRQ2_BASE + 1)
> +#define INTERRUPT_CCP2TX               (ARM_IRQ2_BASE + 2)
> +#define INTERRUPT_SDC                  (ARM_IRQ2_BASE + 3)
> +#define INTERRUPT_DSI0                 (ARM_IRQ2_BASE + 4)
> +#define INTERRUPT_AVE                  (ARM_IRQ2_BASE + 5)
> +#define INTERRUPT_CAM0                 (ARM_IRQ2_BASE + 6)
> +#define INTERRUPT_CAM1                 (ARM_IRQ2_BASE + 7)
> +#define INTERRUPT_HDMI0                (ARM_IRQ2_BASE + 8)
> +#define INTERRUPT_HDMI1                (ARM_IRQ2_BASE + 9)
> +#define INTERRUPT_PIXELVALVE1          (ARM_IRQ2_BASE + 10)
> +#define INTERRUPT_I2CSPISLV            (ARM_IRQ2_BASE + 11)
> +#define INTERRUPT_DSI1                 (ARM_IRQ2_BASE + 12)
> +#define INTERRUPT_PWA0                 (ARM_IRQ2_BASE + 13)
> +#define INTERRUPT_PWA1                 (ARM_IRQ2_BASE + 14)
> +#define INTERRUPT_CPR                  (ARM_IRQ2_BASE + 15)
> +#define INTERRUPT_SMI                  (ARM_IRQ2_BASE + 16)
> +#define INTERRUPT_GPIO0                (ARM_IRQ2_BASE + 17)
> +#define INTERRUPT_GPIO1                (ARM_IRQ2_BASE + 18)
> +#define INTERRUPT_GPIO2                (ARM_IRQ2_BASE + 19)
> +#define INTERRUPT_GPIO3                (ARM_IRQ2_BASE + 20)
> +#define INTERRUPT_VC_I2C               (ARM_IRQ2_BASE + 21)
> +#define INTERRUPT_VC_SPI               (ARM_IRQ2_BASE + 22)
> +#define INTERRUPT_VC_I2SPCM            (ARM_IRQ2_BASE + 23)
> +#define INTERRUPT_VC_SDIO              (ARM_IRQ2_BASE + 24)
> +#define INTERRUPT_VC_UART              (ARM_IRQ2_BASE + 25)
> +#define INTERRUPT_SLIMBUS              (ARM_IRQ2_BASE + 26)
> +#define INTERRUPT_VEC                  (ARM_IRQ2_BASE + 27)
> +#define INTERRUPT_CPG                  (ARM_IRQ2_BASE + 28)
> +#define INTERRUPT_RNG                  (ARM_IRQ2_BASE + 29)
> +#define INTERRUPT_VC_ARASANSDIO        (ARM_IRQ2_BASE + 30)
> +#define INTERRUPT_AVSPMON              (ARM_IRQ2_BASE + 31)
> +
> +#define ARM_IRQ0_BASE                  64

This 64 shouldn't be needed anymore with the arm_irqs now in their own
enumeration space. It should just count from 0 again (and I think the
only usages you have of these subtract off ARM_IRQ0_BASE).

> +#define INTERRUPT_ARM_TIMER            (ARM_IRQ0_BASE + 0)
> +#define INTERRUPT_ARM_MAILBOX          (ARM_IRQ0_BASE + 1)
> +#define INTERRUPT_ARM_DOORBELL_0       (ARM_IRQ0_BASE + 2)
> +#define INTERRUPT_ARM_DOORBELL_1       (ARM_IRQ0_BASE + 3)
> +#define INTERRUPT_VPU0_HALTED          (ARM_IRQ0_BASE + 4)
> +#define INTERRUPT_VPU1_HALTED          (ARM_IRQ0_BASE + 5)
> +#define INTERRUPT_ILLEGAL_TYPE0        (ARM_IRQ0_BASE + 6)
> +#define INTERRUPT_ILLEGAL_TYPE1        (ARM_IRQ0_BASE + 7)

The defs after here are confusing. Are they for a different SoC? I
thought the SoC was limited to 8 ARM_ irqs?

Regards,
Peter

> +#define INTERRUPT_PENDING1             (ARM_IRQ0_BASE + 8)
> +#define INTERRUPT_PENDING2             (ARM_IRQ0_BASE + 9)
> +#define INTERRUPT_JPEG                 (ARM_IRQ0_BASE + 10)
> +#define INTERRUPT_USB                  (ARM_IRQ0_BASE + 11)
> +#define INTERRUPT_3D                   (ARM_IRQ0_BASE + 12)
> +#define INTERRUPT_DMA2                 (ARM_IRQ0_BASE + 13)
> +#define INTERRUPT_DMA3                 (ARM_IRQ0_BASE + 14)
> +#define INTERRUPT_I2C                  (ARM_IRQ0_BASE + 15)
> +#define INTERRUPT_SPI                  (ARM_IRQ0_BASE + 16)
> +#define INTERRUPT_I2SPCM               (ARM_IRQ0_BASE + 17)
> +#define INTERRUPT_SDIO                 (ARM_IRQ0_BASE + 18)
> +#define INTERRUPT_UART                 (ARM_IRQ0_BASE + 19)
> +#define INTERRUPT_ARASANSDIO           (ARM_IRQ0_BASE + 20)
> --
> 2.5.3
>
