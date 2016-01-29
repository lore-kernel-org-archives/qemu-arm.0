Received: by 10.25.159.19 with SMTP id i19csp744201lfe;
        Thu, 28 Jan 2016 20:50:36 -0800 (PST)
X-Received: by 10.140.133.146 with SMTP id 140mr8313980qhf.99.1454043036091;
        Thu, 28 Jan 2016 20:50:36 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r16si15226890qhb.114.2016.01.28.20.50.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jan 2016 20:50:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59718 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aP111-0001it-MN
	for alex.bennee@linaro.org; Thu, 28 Jan 2016 23:50:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35028)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aP10y-0001f8-Fp
	for qemu-arm@nongnu.org; Thu, 28 Jan 2016 23:50:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aP10w-0005eu-F5
	for qemu-arm@nongnu.org; Thu, 28 Jan 2016 23:50:32 -0500
Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231]:37529)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aP10t-0005dC-1S; Thu, 28 Jan 2016 23:50:27 -0500
Received: by mail-wm0-x231.google.com with SMTP id l66so38625689wml.0;
	Thu, 28 Jan 2016 20:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=vqlaiJtJCAVoR+r27GQVcxL44vkNChvyWUKogE6cB2Q=;
	b=H6/TPwm3mbTVsMPQbTMzqDrF66I+Z4sLu4jOKaH5qZTVnZeuKwSOoaZDhKfdlXV0K9
	1X83hPTJhzLurc3I1Q/WSylLUaNEzliRAw0MyKf67H2hBb3V797whB6215sEY0zhT5d+
	POOrrichfyBEuP4ZYbIAUf61KhHGXCv4dTbnM8YdXK4bnrUFnfaPkSuiFd/NZC6zHgo9
	IzKTPn7TFE71VH4UipOfyPEsy0JFBgZtXqoFp/apYuthQUNli4eZFio/2qQK6pBPJ4aV
	fpeBnv/jkAsdT/k9a+zlnsUSBsqhVTK0mRvd4lb4nMkQpupAPi3mzuQYEzNHbutL4rh0
	v7hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=vqlaiJtJCAVoR+r27GQVcxL44vkNChvyWUKogE6cB2Q=;
	b=D+fBeBIxzYamAckyyVczrgH/hr4vuIMHRt8mTzE5WHcrgPG3UIUW4XstMzLR63AYco
	EbhRz2VDXfdHLUKyGduvYImayO20CVCXR5BPNGeRMrQTx7rEYpvH3NE7QP/W3US5no+T
	IaR0kpfOc1Ehk04LLc34T01l/rAbcs+6K0CT1Htm2C3+p8LoPNMumf9IEefX7Es7w4yX
	qCYbqiHXOT7SEmQRUPVoPjRqqrpQddGETixJKg6arjYCffOuDb+lOlvxeCHT7tz3+mZs
	i//rgxLF2fAXxquVXTTUpvWZ9aVZgU4BXOrV3tZ7+HiyaeNV4JZpQH72J0LOsTcJQDZf
	18lg==
X-Gm-Message-State: AG10YOS/+WlNwo14idiubLREZwL2IrTRk5z10YLsjmPu0uJwESNwswJoB91lGCxIbhJav+qYMNMdc3vOsc/Igg==
MIME-Version: 1.0
X-Received: by 10.194.22.132 with SMTP id d4mr6548643wjf.174.1454043026220;
	Thu, 28 Jan 2016 20:50:26 -0800 (PST)
Received: by 10.28.91.143 with HTTP; Thu, 28 Jan 2016 20:50:26 -0800 (PST)
In-Reply-To: <1452902337-13844-7-git-send-email-Andrew.Baumann@microsoft.com>
References: <1452902337-13844-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1452902337-13844-7-git-send-email-Andrew.Baumann@microsoft.com>
Date: Thu, 28 Jan 2016 20:50:26 -0800
Message-ID: <CAPokK=pH8c2tZKq8W=1ikETQp4qoHDOsz669PchzTR=kxprcNg@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::231
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Rob Herring <robh@kernel.org>
Subject: Re: [Qemu-arm] [PATCH v4 6/8] bcm2836: add bcm2836 soc device
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
X-TUID: XVaqYzTuwZ+m

SoC in subject line.

On Fri, Jan 15, 2016 at 3:58 PM, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
> This is the SoC for Raspberry Pi 2.
>
> Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
> ---
>
> Notes:
>     v4:
>     * s/ic/control/
>     * replace use of smp_cpus with enabled-cpus property
>     * propagate errors rather than exit(1)
>
>  hw/arm/Makefile.objs     |   2 +-
>  hw/arm/bcm2836.c         | 165 +++++++++++++++++++++++++++++++++++++++++++++++
>  include/hw/arm/bcm2836.h |  34 ++++++++++
>  3 files changed, 200 insertions(+), 1 deletion(-)
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
> index 0000000..0fd6118
> --- /dev/null
> +++ b/hw/arm/bcm2836.c
> @@ -0,0 +1,165 @@
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
> +    for (n = 0; n < BCM2836_NCPUS; n++) {
> +        object_initialize(&s->cpus[n], sizeof(s->cpus[n]),
> +                          "cortex-a15-" TYPE_ARM_CPU);
> +        object_property_add_child(obj, "cpu[*]", OBJECT(&s->cpus[n]),
> +                                  &error_abort);
> +    }
> +
> +    object_initialize(&s->control, sizeof(s->control), TYPE_BCM2836_CONTROL);
> +    object_property_add_child(obj, "control", OBJECT(&s->control), NULL);
> +    qdev_set_parent_bus(DEVICE(&s->control), sysbus_get_default());
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
> +
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
> +    object_property_set_bool(OBJECT(&s->control), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->control), 0, BCM2836_CONTROL_BASE);
> +
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->peripherals), 0,
> +        qdev_get_gpio_in_named(DEVICE(&s->control), "gpu-irq", 0));
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->peripherals), 1,
> +        qdev_get_gpio_in_named(DEVICE(&s->control), "gpu-fiq", 0));
> +
> +    for (n = 0; n < BCM2836_NCPUS; n++) {
> +        /* Mirror bcm2836, which has clusterid set to 0xf
> +         * TODO: this should be converted to a property of ARM_CPU
> +         */
> +        s->cpus[n].mp_affinity = 0xF00 | n;
> +
> +        /* set periphbase/CBAR value for CPU-local registers */
> +        object_property_set_int(OBJECT(&s->cpus[n]),
> +                                BCM2836_PERI_BASE + MCORE_OFFSET,
> +                                "reset-cbar", &err);
> +        if (err) {
> +            error_propagate(errp, err);
> +            return;
> +        }
> +
> +        /* start powered off if not enabled */
> +        object_property_set_bool(OBJECT(&s->cpus[n]), n >= s->enabled_cpus,
> +                                 "start-powered-off", &err);
> +        if (err) {
> +            error_propagate(errp, err);
> +            return;
> +        }
> +
> +        object_property_set_bool(OBJECT(&s->cpus[n]), true, "realized", &err);
> +        if (err) {
> +            error_propagate(errp, err);
> +            return;
> +        }
> +
> +        /* Connect irq/fiq outputs from the interrupt controller. */
> +        qdev_connect_gpio_out_named(DEVICE(&s->control), "irq", n,
> +                qdev_get_gpio_in(DEVICE(&s->cpus[n]), ARM_CPU_IRQ));
> +        qdev_connect_gpio_out_named(DEVICE(&s->control), "fiq", n,
> +                qdev_get_gpio_in(DEVICE(&s->cpus[n]), ARM_CPU_FIQ));
> +
> +        /* Connect timers from the CPU to the interrupt controller */
> +        s->cpus[n].gt_timer_outputs[GTIMER_PHYS]
> +            = qdev_get_gpio_in_named(DEVICE(&s->control), "cntpsirq", 0);
> +        s->cpus[n].gt_timer_outputs[GTIMER_VIRT]
> +            = qdev_get_gpio_in_named(DEVICE(&s->control), "cntvirq", 0);

ARM CPU has

    qdev_init_gpio_out(DEVICE(cpu), cpu->gt_timer_outputs,
                       ARRAY_SIZE(cpu->gt_timer_outputs));

So you should be able to use qdev_connect_gpio_out rather than direct
assignment.

> +    }
> +}
> +
> +static Property bcm2836_props[] = {
> +    DEFINE_PROP_UINT32("enabled-cpus", BCM2836State, enabled_cpus, BCM2836_NCPUS),
> +    DEFINE_PROP_END_OF_LIST()
> +};
> +
> +static void bcm2836_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    dc->props = bcm2836_props;
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
> index 0000000..cd0fd02
> --- /dev/null
> +++ b/include/hw/arm/bcm2836.h
> @@ -0,0 +1,34 @@
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
> +    uint32_t enabled_cpus;

blank line here.

Otherwise,

Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>

Regards,
Peter

> +    ARMCPU cpus[BCM2836_NCPUS];
> +    BCM2836ControlState control;
> +    BCM2835PeripheralState peripherals;
> +} BCM2836State;
> +
> +#endif /* BCM2836_H */
> --
> 2.5.3
>
