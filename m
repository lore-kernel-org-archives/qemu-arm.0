Received: by 10.25.159.19 with SMTP id i19csp278574lfe;
        Mon, 11 Jan 2016 19:57:01 -0800 (PST)
X-Received: by 10.140.219.136 with SMTP id p130mr176693708qhb.80.1452571021086;
        Mon, 11 Jan 2016 19:57:01 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d9si34348672qkb.119.2016.01.11.19.57.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jan 2016 19:57:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57925 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aIq4q-0006w0-Nv
	for alex.bennee@linaro.org; Mon, 11 Jan 2016 22:57:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57298)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aIq4n-0006sm-HF
	for qemu-arm@nongnu.org; Mon, 11 Jan 2016 22:56:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aIq4l-0001L9-Sf
	for qemu-arm@nongnu.org; Mon, 11 Jan 2016 22:56:57 -0500
Received: from mail-pa0-x244.google.com ([2607:f8b0:400e:c03::244]:33135)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aIq4f-0001JO-NL; Mon, 11 Jan 2016 22:56:49 -0500
Received: by mail-pa0-x244.google.com with SMTP id pv5so26312119pac.0;
	Mon, 11 Jan 2016 19:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=11FJsCKyC1vd40S+0REl/FnIq7C0H2xhj2+AahAfIm4=;
	b=Aj14BN7DL9/yJRjz9xzVZDT0OUlNS4pgeR5zHmfr9rzznwR907r2eNLebhPaiE8/ON
	VwATajzxRroWSBfQIPiw+QFgnZCy5i9gu3z5MVyQL5bMm3rFAHPMBq8X/EPGJ8jheSDR
	0b0mjn2VzCO9fp9A1uR8jPV4CwXDggweLqXjw1yc8A8xujWlq3BlqEsPGAZdIPCK61+J
	esoSal5EE/WW4GsAuUbLR4JHjWVNbwBP/JXloyPwsEOnp5lwvzzUhdBF9qW4uagMNK7A
	6rI8dKhQzq3iW3B38tE51qT7dGe3F9JQgCNfH7f7Gw65U45d1YIWMI1M0qQsXwlJAYcy
	ER4A==
X-Received: by 10.66.252.102 with SMTP id zr6mr100640951pac.66.1452571009152; 
	Mon, 11 Jan 2016 19:56:49 -0800 (PST)
Received: from pcrost-box (c-73-70-184-119.hsd1.ca.comcast.net.
	[73.70.184.119]) by smtp.gmail.com with ESMTPSA id
	m87sm26370988pfi.47.2016.01.11.19.56.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jan 2016 19:56:48 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Mon, 11 Jan 2016 19:56:45 -0800
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Message-ID: <20160112035645.GC3308@pcrost-box>
References: <1451608294-16432-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1451608294-16432-7-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1451608294-16432-7-git-send-email-Andrew.Baumann@microsoft.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::244
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?iso-8859-1?Q?Gr=E9gory?= ESTRADE <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v3 6/7] bcm2836: add bcm2836 soc device
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
X-TUID: t8d4A5BUcNSn

On Thu, Dec 31, 2015 at 04:31:33PM -0800, Andrew Baumann wrote:
> This is the SoC for Raspberry Pi 2.
> 
> Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
> ---
> The use of smp_cpus is dubious here. Ideally it should be passed as a
> property from the board, but I found that simply initialising (and not
> later realizing) an ARM cpu had unintended side-effects. Is it ok to
> defer the object_initialize call to the realize method, when we know
> how many CPUs are configured?
> 
>  hw/arm/Makefile.objs     |   2 +-
>  hw/arm/bcm2836.c         | 155 +++++++++++++++++++++++++++++++++++++++++++++++
>  include/hw/arm/bcm2836.h |  33 ++++++++++
>  3 files changed, 189 insertions(+), 1 deletion(-)
>  create mode 100644 hw/arm/bcm2836.c
>  create mode 100644 include/hw/arm/bcm2836.h
> 
> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> index 82cc142..f55f8d2 100644
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -11,7 +11,7 @@ obj-y += armv7m.o exynos4210.o pxa2xx.o pxa2xx_gpio.o pxa2xx_pic.o
>  obj-$(CONFIG_DIGIC) += digic.o
>  obj-y += omap1.o omap2.o strongarm.o
>  obj-$(CONFIG_ALLWINNER_A10) += allwinner-a10.o cubieboard.o
> -obj-$(CONFIG_RASPI) += bcm2835_peripherals.o
> +obj-$(CONFIG_RASPI) += bcm2835_peripherals.o bcm2836.o
>  obj-$(CONFIG_STM32F205_SOC) += stm32f205_soc.o
>  obj-$(CONFIG_XLNX_ZYNQMP) += xlnx-zynqmp.o xlnx-ep108.o
>  obj-$(CONFIG_FSL_IMX25) += fsl-imx25.o imx25_pdk.o
> diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
> new file mode 100644
> index 0000000..bec7667
> --- /dev/null
> +++ b/hw/arm/bcm2836.c
> @@ -0,0 +1,155 @@
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
> +#include "hw/arm/bcm2836.h"
> +#include "hw/arm/raspi_platform.h"
> +#include "hw/sysbus.h"
> +#include "sysemu/sysemu.h" /* for smp_cpus */
> +#include "exec/address-spaces.h"
> +
> +/* Peripheral base address seen by the CPU */
> +#define BCM2836_PERI_BASE       0x3F000000
> +
> +/* "QA7" (Pi2) interrupt controller and mailboxes etc. */
> +#define BCM2836_CONTROL_BASE    0x40000000
> +
> +static void bcm2836_init(Object *obj)
> +{
> +    BCM2836State *s = BCM2836(obj);
> +    int n;
> +
> +    /* TODO: probably shouldn't be using smp_cpus here */

I agree. I have started ignoring smp_cpus completely for new ARM SoCs,
as if you change the number of CPUs for a SoC, it is not that SoC
anymore. The virt platform is suitable for CPU scalability, whereas
with ARM SoCs, cpu # variation is invalid.

> +    assert(smp_cpus <= BCM2836_NCPUS);
> +    for (n = 0; n < smp_cpus; n++) {

So can we just use BCM2836_NCPUS here as the loop bound? Any
conditionals out there check the existance of CPUs can be removed or
promoted to assert() as a BCM2836 must always have 4 CPUs.

> +        object_initialize(&s->cpus[n], sizeof(s->cpus[n]),
> +                          "cortex-a15-" TYPE_ARM_CPU);
> +        object_property_add_child(obj, "cpu[*]", OBJECT(&s->cpus[n]),
> +                                  &error_abort);
> +    }
> +
> +    object_initialize(&s->ic, sizeof(s->ic), TYPE_BCM2836_CONTROL);
> +    object_property_add_child(obj, "ic", OBJECT(&s->ic), NULL);

Why "ic"? The TYPE_ and the field name are inconsistent. Is it specifically
and interrupt controller or is it generic controller? (My scan of the doc
made me think its a home-grown mpcore). Maybe the field name and string name
should be "cntl"?

> +    qdev_set_parent_bus(DEVICE(&s->ic), sysbus_get_default());
> +
> +    object_initialize(&s->peripherals, sizeof(s->peripherals),
> +                      TYPE_BCM2835_PERIPHERALS);
> +    object_property_add_child(obj, "peripherals", OBJECT(&s->peripherals),
> +                              &error_abort);
> +    qdev_set_parent_bus(DEVICE(&s->peripherals), sysbus_get_default());
> +}
> +
> +static void bcm2836_realize(DeviceState *dev, Error **errp)
> +{
> +    BCM2836State *s = BCM2836(dev);
> +    Object *obj;
> +    Error *err = NULL;
> +    int n;
> +
> +    /* common peripherals from bcm2835 */

Blank line here (otherwise the comment looks like it only applies to up to
the next line-break whereas this goes further).

> +    obj = object_property_get_link(OBJECT(dev), "ram", &err);
> +    if (obj == NULL) {
> +        error_setg(errp, "%s: required ram link not found: %s",
> +                   __func__, error_get_pretty(err));
> +        return;
> +    }
> +
> +    object_property_add_const_link(OBJECT(&s->peripherals), "ram", obj, &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
> +    object_property_set_bool(OBJECT(&s->peripherals), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
> +    sysbus_mmio_map_overlap(SYS_BUS_DEVICE(&s->peripherals), 0,
> +                            BCM2836_PERI_BASE, 1);
> +
> +    /* bcm2836 interrupt controller (and mailboxes, etc.) */
> +    object_property_set_bool(OBJECT(&s->ic), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->ic), 0, BCM2836_CONTROL_BASE);
> +
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->peripherals), 0,
> +                       qdev_get_gpio_in_named(DEVICE(&s->ic), "gpu_irq", 0));
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->peripherals), 1,
> +                       qdev_get_gpio_in_named(DEVICE(&s->ic), "gpu_fiq", 0));
> +
> +    /* TODO: probably shouldn't be using smp_cpus here */
> +    assert(smp_cpus <= BCM2836_NCPUS);
> +    for (n = 0; n < smp_cpus; n++) {
> +        /* Mirror bcm2836, which has clusterid set to 0xf */
> +        s->cpus[n].mp_affinity = 0xF00 | n;
> +

This is probably ok for the moment, but the correct solution is to propertyify
mp_affinity for ARM CPUs and then set via prop as for the reset-cbar below.

There is some stuff in target-arm that sets the higher order affinities based
on CPU numbers on a fixed wrap-around scheme, but that needs to go away, and
be push up to the virt machine. Then virt uses the same property setter to
implement that wrap-around while SoC can get their affinity right.

The Highbank machine has the same problem, and SMP linux boot is blocked by
the same.

> +        /* set periphbase/CBAR value for CPU-local registers */
> +        object_property_set_int(OBJECT(&s->cpus[n]),
> +                                BCM2836_PERI_BASE + MCORE_OFFSET,
> +                                "reset-cbar", &err);
> +        if (err) {
> +            error_report_err(err);
> +            exit(1);

You should just propagate as-above. Original report-and-exit is probably from
machine-model code where there is no-one to propagate too.

> +        }
> +
> +        object_property_set_bool(OBJECT(&s->cpus[n]), true, "realized", &err);
> +        if (err) {
> +            error_report_err(err);

propagate.

Regards,
Peter

> +            exit(1);
> +        }
> +
> +        /* Connect irq/fiq outputs from the interrupt controller. */
> +        qdev_connect_gpio_out_named(DEVICE(&s->ic), "irq", n,
> +                                    qdev_get_gpio_in(DEVICE(&s->cpus[n]),
> +                                                     ARM_CPU_IRQ));
> +        qdev_connect_gpio_out_named(DEVICE(&s->ic), "fiq", n,
> +                                    qdev_get_gpio_in(DEVICE(&s->cpus[n]),
> +                                                     ARM_CPU_FIQ));
> +
> +        /* Connect timers from the CPU to the interrupt controller */
> +        s->cpus[n].gt_timer_outputs[GTIMER_PHYS]
> +            = qdev_get_gpio_in_named(DEVICE(&s->ic), "cntpsirq", 0);
> +        s->cpus[n].gt_timer_outputs[GTIMER_VIRT]
> +            = qdev_get_gpio_in_named(DEVICE(&s->ic), "cntvirq", 0);
> +    }
> +}
> +
> +static void bcm2836_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    dc->realize = bcm2836_realize;
> +
> +    /*
> +     * Reason: creates an ARM CPU, thus use after free(), see
> +     * arm_cpu_class_init()
> +     */
> +    dc->cannot_destroy_with_object_finalize_yet = true;
> +}
> +
> +static const TypeInfo bcm2836_type_info = {
> +    .name = TYPE_BCM2836,
> +    .parent = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(BCM2836State),
> +    .instance_init = bcm2836_init,
> +    .class_init = bcm2836_class_init,
> +};
> +
> +static void bcm2836_register_types(void)
> +{
> +    type_register_static(&bcm2836_type_info);
> +}
> +
> +type_init(bcm2836_register_types)
> diff --git a/include/hw/arm/bcm2836.h b/include/hw/arm/bcm2836.h
> new file mode 100644
> index 0000000..a78e919
> --- /dev/null
> +++ b/include/hw/arm/bcm2836.h
> @@ -0,0 +1,33 @@
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
> +#ifndef BCM2836_H
> +#define BCM2836_H
> +
> +#include "hw/arm/arm.h"
> +#include "hw/arm/bcm2835_peripherals.h"
> +#include "hw/intc/bcm2836_control.h"
> +
> +#define TYPE_BCM2836 "bcm2836"
> +#define BCM2836(obj) OBJECT_CHECK(BCM2836State, (obj), TYPE_BCM2836)
> +
> +#define BCM2836_NCPUS 4
> +
> +typedef struct BCM2836State {
> +    /*< private >*/
> +    DeviceState parent_obj;
> +    /*< public >*/
> +
> +    ARMCPU cpus[BCM2836_NCPUS];
> +    BCM2836ControlState ic;
> +    BCM2835PeripheralState peripherals;
> +} BCM2836State;
> +
> +#endif /* BCM2836_H */
> -- 
> 2.5.3
> 
