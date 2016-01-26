Received: by 10.25.159.19 with SMTP id i19csp1642241lfe;
        Mon, 25 Jan 2016 22:14:33 -0800 (PST)
X-Received: by 10.140.174.2 with SMTP id u2mr28310853qhu.62.1453788873835;
        Mon, 25 Jan 2016 22:14:33 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 184si28887462qhu.75.2016.01.25.22.14.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jan 2016 22:14:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42099 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aNwtc-0007LG-WB
	for alex.bennee@linaro.org; Tue, 26 Jan 2016 01:14:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44499)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aNwtZ-0007Fq-4r
	for qemu-arm@nongnu.org; Tue, 26 Jan 2016 01:14:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aNwtW-0000S4-Vi
	for qemu-arm@nongnu.org; Tue, 26 Jan 2016 01:14:28 -0500
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:35864)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aNwtS-0000Rp-AK; Tue, 26 Jan 2016 01:14:22 -0500
Received: by mail-wm0-x244.google.com with SMTP id l65so15412116wmf.3;
	Mon, 25 Jan 2016 22:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=RR0iY3Fd8rzIr3t/uSUADeLv/Pd8RRpLTO9EnG2ZMxU=;
	b=yTMgKdqkpiH1PN9zns3zDYtzc+DSckQ2uv2mvRY17WIrR3zq1v9L9YXFhae0hvEnar
	VJ3KqoCoM2yTXyy4QbRuJvLEsjrcGK0z6DyZQyjkcFAU7HZqpuTMabtzfN8aADMH/hrb
	LgmYCblJNxweBxpy/UlPcAkbUir12+1aXMx0w1i+ny6RPhGLFaZH8aKRu42Y5Cq1I4a+
	SlJV3bLmp5/IXkdsvjryJc6a6k0eOktj5oktO50TpTkTQdX8UNu+6cIIR2C/eLqlfpUM
	DwsYwIFJg7IXHcT4iuW+kFKp2GGQgoUAMzfjDmK6G9qUgJZge1axFfocVZsNT6oreDt7
	ciFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=RR0iY3Fd8rzIr3t/uSUADeLv/Pd8RRpLTO9EnG2ZMxU=;
	b=m7gy0zI0qag2zY6a76v/WufUcqJIjTMcqYy13BsWYnBuPlb1q3Ucnp2KbnFCRgDxC8
	rL9UKWuGE3huOQmFB7ooCK6CTKjdnqMasW+Q0X5XH+wXbQkAz2zlSWVybmvyb0yWb1c7
	tCmj/FUmL5XrNsDrQdXLRleTyoUY25fQKrDUYMiYhf/B4g6/SFvU4cnTjFSE+NdaMQMs
	mcbS/XNzMqfPhbC1/kI32yXmTc8pDah1VSAa8aw+rK6czFhfvIE5HciCb5cieZtTTZjU
	xWMdcNv3q0MqLdUF4SirpN67kQlbB9brELeHWLwd4XkDACa9XE3+aOj4H7CnwNGpDfhq
	VgLw==
X-Gm-Message-State: AG10YOQB3VDkHxuN1kCSyS+yeAVeEhWuEqvajCa+sqB68zIxQZELDQ+PmrXE39Tyhe72ElOxuIzqYLfmzRk6Tw==
MIME-Version: 1.0
X-Received: by 10.28.216.134 with SMTP id p128mr20696516wmg.59.1453788861653; 
	Mon, 25 Jan 2016 22:14:21 -0800 (PST)
Received: by 10.28.91.143 with HTTP; Mon, 25 Jan 2016 22:14:21 -0800 (PST)
In-Reply-To: <1452902337-13844-5-git-send-email-Andrew.Baumann@microsoft.com>
References: <1452902337-13844-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1452902337-13844-5-git-send-email-Andrew.Baumann@microsoft.com>
Date: Mon, 25 Jan 2016 22:14:21 -0800
Message-ID: <CAPokK=qp6vgfLPD+iai2-quyXD3ODPtNQgZLS1Kfwgn-ZCYMRw@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::244
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Rob Herring <robh@kernel.org>
Subject: Re: [Qemu-arm] [PATCH v4 4/8] bcm2835_peripherals: add rollup
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
X-TUID: dA2FsP161XuH

On Fri, Jan 15, 2016 at 3:58 PM, Andrew Baumann
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
>     v2:
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

Should this just be normal memory_region_init?

> +    object_property_add_child(obj, "peripheral-io", OBJECT(&s->peri_mr), NULL);

This seems like a weird parenting, to have the SoC as child to an
object it just created. Is the problem you need a parent before others
can parent to you?

Otherwise,

Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>

Regards,
Peter

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
> +
> +    ram = MEMORY_REGION(obj);
> +    ram_size = memory_region_size(ram);
> +
> +    /* Map peripherals and RAM into the GPU address space. */
> +    memory_region_init_alias(&s->peri_mr_alias, OBJECT(s),
> +                             "bcm2835-peripherals", &s->peri_mr, 0,
> +                             memory_region_size(&s->peri_mr));
> +
> +    memory_region_add_subregion_overlap(&s->gpu_bus_mr, BCM2835_VC_PERI_BASE,
> +                                        &s->peri_mr_alias, 1);
> +
> +    /* RAM is aliased four times (different cache configurations) on the GPU */
> +    for (n = 0; n < 4; n++) {
> +        memory_region_init_alias(&s->ram_alias[n], OBJECT(s),
> +                                 "bcm2835-gpu-ram-alias[*]", ram, 0, ram_size);
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
> +                               INTERRUPT_UART));
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
> +                               INTERRUPT_ARM_MAILBOX));
> +
> +    /* Property channel */
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
> +                               INTERRUPT_ARASANSDIO));
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
> index 0000000..5d888dc
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
> +#define TYPE_BCM2835_PERIPHERALS "bcm2835-peripherals"
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
> index 0000000..6467e88
> --- /dev/null
> +++ b/include/hw/arm/raspi_platform.h
> @@ -0,0 +1,128 @@
> +/*
> + * bcm2708 aka bcm2835/2836 aka Raspberry Pi/Pi2 SoC platform defines
> + *
> + * These definitions are derived from those in Raspbian Linux at
> + * arch/arm/mach-{bcm2708,bcm2709}/include/mach/platform.h
> + * where they carry the following notice:
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
> +#define PCM_CLOCK_OFFSET        0x101098
> +#define RNG_OFFSET              0x104000
> +#define GPIO_OFFSET             0x200000
> +#define UART0_OFFSET            0x201000
> +#define MMCI0_OFFSET            0x202000
> +#define I2S_OFFSET              0x203000
> +#define SPI0_OFFSET             0x204000
> +#define BSC0_OFFSET             0x205000 /* BSC0 I2C/TWI */
> +#define UART1_OFFSET            0x215000
> +#define EMMC_OFFSET             0x300000
> +#define SMI_OFFSET              0x600000
> +#define BSC1_OFFSET             0x804000 /* BSC1 I2C/TWI */
> +#define USB_OFFSET              0x980000 /* DTC_OTG USB controller */
> +#define DMA15_OFFSET            0xE05000 /* DMA controller, channel 15 */
> +
> +/* GPU interrupts */
> +#define INTERRUPT_TIMER0               0
> +#define INTERRUPT_TIMER1               1
> +#define INTERRUPT_TIMER2               2
> +#define INTERRUPT_TIMER3               3
> +#define INTERRUPT_CODEC0               4
> +#define INTERRUPT_CODEC1               5
> +#define INTERRUPT_CODEC2               6
> +#define INTERRUPT_JPEG                 7
> +#define INTERRUPT_ISP                  8
> +#define INTERRUPT_USB                  9
> +#define INTERRUPT_3D                   10
> +#define INTERRUPT_TRANSPOSER           11
> +#define INTERRUPT_MULTICORESYNC0       12
> +#define INTERRUPT_MULTICORESYNC1       13
> +#define INTERRUPT_MULTICORESYNC2       14
> +#define INTERRUPT_MULTICORESYNC3       15
> +#define INTERRUPT_DMA0                 16
> +#define INTERRUPT_DMA1                 17
> +#define INTERRUPT_DMA2                 18
> +#define INTERRUPT_DMA3                 19
> +#define INTERRUPT_DMA4                 20
> +#define INTERRUPT_DMA5                 21
> +#define INTERRUPT_DMA6                 22
> +#define INTERRUPT_DMA7                 23
> +#define INTERRUPT_DMA8                 24
> +#define INTERRUPT_DMA9                 25
> +#define INTERRUPT_DMA10                26
> +#define INTERRUPT_DMA11                27
> +#define INTERRUPT_DMA12                28
> +#define INTERRUPT_AUX                  29
> +#define INTERRUPT_ARM                  30
> +#define INTERRUPT_VPUDMA               31
> +#define INTERRUPT_HOSTPORT             32
> +#define INTERRUPT_VIDEOSCALER          33
> +#define INTERRUPT_CCP2TX               34
> +#define INTERRUPT_SDC                  35
> +#define INTERRUPT_DSI0                 36
> +#define INTERRUPT_AVE                  37
> +#define INTERRUPT_CAM0                 38
> +#define INTERRUPT_CAM1                 39
> +#define INTERRUPT_HDMI0                40
> +#define INTERRUPT_HDMI1                41
> +#define INTERRUPT_PIXELVALVE1          42
> +#define INTERRUPT_I2CSPISLV            43
> +#define INTERRUPT_DSI1                 44
> +#define INTERRUPT_PWA0                 45
> +#define INTERRUPT_PWA1                 46
> +#define INTERRUPT_CPR                  47
> +#define INTERRUPT_SMI                  48
> +#define INTERRUPT_GPIO0                49
> +#define INTERRUPT_GPIO1                50
> +#define INTERRUPT_GPIO2                51
> +#define INTERRUPT_GPIO3                52
> +#define INTERRUPT_I2C                  53
> +#define INTERRUPT_SPI                  54
> +#define INTERRUPT_I2SPCM               55
> +#define INTERRUPT_SDIO                 56
> +#define INTERRUPT_UART                 57
> +#define INTERRUPT_SLIMBUS              58
> +#define INTERRUPT_VEC                  59
> +#define INTERRUPT_CPG                  60
> +#define INTERRUPT_RNG                  61
> +#define INTERRUPT_ARASANSDIO           62
> +#define INTERRUPT_AVSPMON              63
> +
> +/* ARM CPU IRQs use a private number space */
> +#define INTERRUPT_ARM_TIMER            0
> +#define INTERRUPT_ARM_MAILBOX          1
> +#define INTERRUPT_ARM_DOORBELL_0       2
> +#define INTERRUPT_ARM_DOORBELL_1       3
> +#define INTERRUPT_VPU0_HALTED          4
> +#define INTERRUPT_VPU1_HALTED          5
> +#define INTERRUPT_ILLEGAL_TYPE0        6
> +#define INTERRUPT_ILLEGAL_TYPE1        7
> --
> 2.5.3
>
