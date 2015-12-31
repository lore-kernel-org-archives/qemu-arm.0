Received: by 10.182.158.201 with SMTP id ww9csp8298001obb;
        Wed, 30 Dec 2015 19:21:03 -0800 (PST)
X-Received: by 10.140.220.136 with SMTP id q130mr94436034qhb.24.1451532063304;
        Wed, 30 Dec 2015 19:21:03 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h33si18762316qge.30.2015.12.30.19.21.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 Dec 2015 19:21:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54506 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aETnS-0008UI-TL
	for alex.bennee@linaro.org; Wed, 30 Dec 2015 22:21:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55080)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aETnP-0008PV-4k
	for qemu-arm@nongnu.org; Wed, 30 Dec 2015 22:21:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aETnN-0005Jr-9l
	for qemu-arm@nongnu.org; Wed, 30 Dec 2015 22:20:59 -0500
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d]:34287)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aETnI-0005Hb-EB; Wed, 30 Dec 2015 22:20:52 -0500
Received: by mail-wm0-x22d.google.com with SMTP id u188so55651640wmu.1;
	Wed, 30 Dec 2015 19:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=h+HE1B2hI5Hfk3AV75FZ/L82jlbQwUIszjX4jXK0cbI=;
	b=ECKcm3AOpuTdc26tmbB8LTDiHOTY5U7cDIdlQZH76DxLrs/qVy+tTxrvxFYcKi+CA+
	bDyFdWCOQVlTIHLsTgk/2c7TRwb3SLG3+ZEkL4jEWUlG2U38Q/8loMjtDuGpplbGusim
	M/m6zSovg5LvijpbFpkN/PSRMJctl+FlpflvRHM4TRNY2HRYzQeBQ/AeTwMj7xpWraHz
	DM3YOH/xGgtqcqbzPdfk0ccK0yBKvjVumJuZH/bK7ZXvo/7HHiHPzHPK4yyjd1ubfVKF
	w0yBnubJdQr6dhSuhM+ClCi3xEmTNiC78CKV4B9UcIoA6fxLKPgoefIfMGOXdZeuoOvk
	0Bpg==
MIME-Version: 1.0
X-Received: by 10.194.120.226 with SMTP id lf2mr73089902wjb.108.1451532051781; 
	Wed, 30 Dec 2015 19:20:51 -0800 (PST)
Received: by 10.28.91.143 with HTTP; Wed, 30 Dec 2015 19:20:51 -0800 (PST)
In-Reply-To: <1450916731-5968-6-git-send-email-Andrew.Baumann@microsoft.com>
References: <1450916731-5968-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1450916731-5968-6-git-send-email-Andrew.Baumann@microsoft.com>
Date: Wed, 30 Dec 2015 19:20:51 -0800
Message-ID: <CAPokK=qbYVaQN=6RxJmfDWVnEwOPjr370sMr77R-dTh5obEV4w@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22d
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v2 5/7] bcm2836_control: add bcm2836 ARM
	control logic
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
X-TUID: vF9/EYzH3DDc

On Wed, Dec 23, 2015 at 4:25 PM, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
> This module is specific to the bcm2836 (Pi2). It implements the top
> level interrupt controller, and mailboxes used for inter-processor
> synchronisation.
>
> Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
> ---
>  hw/intc/Makefile.objs             |   2 +-
>  hw/intc/bcm2836_control.c         | 338 ++++++++++++++++++++++++++++++++++++++
>  include/hw/intc/bcm2836_control.h |  51 ++++++
>  3 files changed, 390 insertions(+), 1 deletion(-)
>  create mode 100644 hw/intc/bcm2836_control.c
>  create mode 100644 include/hw/intc/bcm2836_control.h
>
> diff --git a/hw/intc/Makefile.objs b/hw/intc/Makefile.objs
> index 2ad1204..6a13a39 100644
> --- a/hw/intc/Makefile.objs
> +++ b/hw/intc/Makefile.objs
> @@ -24,7 +24,7 @@ obj-$(CONFIG_GRLIB) += grlib_irqmp.o
>  obj-$(CONFIG_IOAPIC) += ioapic.o
>  obj-$(CONFIG_OMAP) += omap_intc.o
>  obj-$(CONFIG_OPENPIC_KVM) += openpic_kvm.o
> -obj-$(CONFIG_RASPI) += bcm2835_ic.o
> +obj-$(CONFIG_RASPI) += bcm2835_ic.o bcm2836_control.o
>  obj-$(CONFIG_SH4) += sh_intc.o
>  obj-$(CONFIG_XICS) += xics.o
>  obj-$(CONFIG_XICS_KVM) += xics_kvm.o
> diff --git a/hw/intc/bcm2836_control.c b/hw/intc/bcm2836_control.c
> new file mode 100644
> index 0000000..d68b4d9
> --- /dev/null
> +++ b/hw/intc/bcm2836_control.c
> @@ -0,0 +1,338 @@
> +/*
> + * Rasperry Pi 2 emulation ARM control logic module.
> + * Copyright (c) 2015, Microsoft
> + * Written by Andrew Baumann
> + *
> + * At present, only implements interrupt routing, and mailboxes (i.e.,
> + * not local timer, PMU interrupt, or AXI counters).
> + *
> + * Ref:
> + * https://www.raspberrypi.org/documentation/hardware/raspberrypi/bcm2836/QA7_rev3.4.pdf

This looks like an mpcore. Check hw/cpu/a9mpcore and friends to see
how those are implemented. I think this is architecturally OK for the
moment, although if you intend to expand this with Timers etc. it
should be in hw/cpu/ and containerised. I think the containerisation
can happen later but should be put it in hw/cpu/ straight up?

> + *
> + * Based on bcm2835_ic.c, terms below...
> + */
> +
> +/*
> + * Raspberry Pi emulation (c) 2012 Gregory Estrade
> + * This code is licensed under the GNU GPLv2 and later.
> + */
> +
> +/* Heavily based on pl190.c, copyright terms below. */
> +

I don't think we need to recursively explode all the copyrights
everytime a sysbus device is used as a template. I think it is
reasonable to call this new code.

> +/*
> + * Arm PrimeCell PL190 Vector Interrupt Controller
> + *
> + * Copyright (c) 2006 CodeSourcery.
> + * Written by Paul Brook
> + *
> + * This code is licensed under the GPL.
> + */
> +
> +#include "hw/intc/bcm2836_control.h"
> +
> +#define ROUTE_CORE(x) ((x) & 0x3)
> +#define ROUTE_FIQ(x)  (((x) & 0x4) != 0)
> +
> +#define IRQ_BIT(cntrl, num) (((cntrl) & (1 << (num))) != 0)
> +#define FIQ_BIT(cntrl, num) (((cntrl) & (1 << ((num) + 4))) != 0)
> +
> +#define IRQ_CNTPSIRQ    0
> +#define IRQ_CNTPNSIRQ   1
> +#define IRQ_CNTHPIRQ    2
> +#define IRQ_CNTVIRQ     3
> +#define IRQ_MAILBOX0    4
> +#define IRQ_MAILBOX1    5
> +#define IRQ_MAILBOX2    6
> +#define IRQ_MAILBOX3    7
> +#define IRQ_GPU         8
> +#define IRQ_PMU         9
> +#define IRQ_AXI         10
> +#define IRQ_TIMER       11
> +#define IRQ_MAX         IRQ_TIMER
> +
> +/* Update interrupts.  */
> +static void bcm2836_control_update(BCM2836ControlState *s)
> +{
> +    int i, j;
> +
> +    /*
> +     * reset pending IRQs/FIQs
> +     */

Collapse to single line comment, here and below.

> +
> +    for (i = 0; i < BCM2836_NCORES; i++) {
> +        s->irqsrc[i] = s->fiqsrc[i] = 0;
> +    }
> +
> +    /*
> +     * apply routing logic, update status regs
> +     */
> +
> +    if (s->gpu_irq) {
> +        assert(s->route_gpu_irq < BCM2836_NCORES);
> +        s->irqsrc[s->route_gpu_irq] |= (uint32_t)1 << IRQ_GPU;
> +    }
> +
> +    if (s->gpu_fiq) {
> +        assert(s->route_gpu_fiq < BCM2836_NCORES);
> +        s->fiqsrc[s->route_gpu_fiq] |= (uint32_t)1 << IRQ_GPU;
> +    }
> +
> +    for (i = 0; i < BCM2836_NCORES; i++) {
> +        /* handle local interrupts for this core */
> +        if (s->localirqs[i]) {
> +            assert(s->localirqs[i] < (1 << IRQ_MAILBOX0));

Curious, what is the source of this limitation?

> +            for (j = 0; j < IRQ_MAILBOX0; j++) {
> +                if ((s->localirqs[i] & (1 << j)) != 0) {
> +                    /* local interrupt j is set */
> +                    if (FIQ_BIT(s->timercontrol[i], j)) {
> +                        /* deliver a FIQ */
> +                        s->fiqsrc[i] |= (uint32_t)1 << j;
> +                    } else if (IRQ_BIT(s->timercontrol[i], j)) {
> +                        /* deliver an IRQ */

Overcommented.

> +                        s->irqsrc[i] |= (uint32_t)1 << j;
> +                    } else {
> +                        /* the interrupt is masked */
> +                    }
> +                }
> +            }
> +        }
> +
> +        /* handle mailboxes for this core */
> +        for (j = 0; j < BCM2836_MBPERCORE; j++) {
> +            if (s->mailboxes[i * BCM2836_MBPERCORE + j] != 0) {
> +                /* mailbox j is set */
> +                if (FIQ_BIT(s->mailboxcontrol[i], j)) {
> +                    /* deliver a FIQ */
> +                    s->fiqsrc[i] |= (uint32_t)1 << (j + IRQ_MAILBOX0);
> +                } else if (IRQ_BIT(s->mailboxcontrol[i], j)) {
> +                    /* deliver an IRQ */
> +                    s->irqsrc[i] |= (uint32_t)1 << (j + IRQ_MAILBOX0);
> +                } else {
> +                    /* the interrupt is masked */
> +                }
> +            }
> +        }
> +    }
> +
> +    /*
> +     * call set_irq appropriately for each output
> +     */
> +
> +    for (i = 0; i < BCM2836_NCORES; i++) {
> +        qemu_set_irq(s->irq[i], s->irqsrc[i] != 0);
> +        qemu_set_irq(s->fiq[i], s->fiqsrc[i] != 0);
> +    }
> +}
> +
> +static void bcm2836_control_set_local_irq(void *opaque, int core, int local_irq,
> +                                          int level)
> +{
> +    BCM2836ControlState *s = opaque;
> +
> +    assert(core >= 0 && core < BCM2836_NCORES);
> +    assert(local_irq >= 0 && local_irq <= IRQ_CNTVIRQ);
> +
> +    if (level) {
> +        s->localirqs[core] |= 1 << local_irq;
> +    } else {
> +        s->localirqs[core] &= ~((uint32_t)1 << local_irq);
> +    }
> +
> +    bcm2836_control_update(s);
> +}
> +
> +/* XXX: the following wrapper functions are a kludgy workaround,
> + * needed because I can't seem to pass useful information in the "irq"
> + * parameter when using named interrupts. Feel free to clean this up!
> + */

Yep. Known issue. The lack of opaque data other than the device itself
to qemu_irq definitions. Fine as-is until that core code is fixed, or
you could resort to some ## magic.

> +
> +static void bcm2836_control_set_local_irq0(void *opaque, int core, int level)
> +{
> +    bcm2836_control_set_local_irq(opaque, core, 0, level);
> +}
> +
> +static void bcm2836_control_set_local_irq1(void *opaque, int core, int level)
> +{
> +    bcm2836_control_set_local_irq(opaque, core, 1, level);
> +}
> +
> +static void bcm2836_control_set_local_irq2(void *opaque, int core, int level)
> +{
> +    bcm2836_control_set_local_irq(opaque, core, 2, level);
> +}
> +
> +static void bcm2836_control_set_local_irq3(void *opaque, int core, int level)
> +{
> +    bcm2836_control_set_local_irq(opaque, core, 3, level);
> +}
> +
> +static void bcm2836_control_set_gpu_irq(void *opaque, int irq, int level)
> +{
> +    BCM2836ControlState *s = opaque;
> +
> +    s->gpu_irq = level;
> +
> +    bcm2836_control_update(s);
> +}
> +
> +static void bcm2836_control_set_gpu_fiq(void *opaque, int irq, int level)
> +{
> +    BCM2836ControlState *s = opaque;
> +
> +    s->gpu_fiq = level;
> +
> +    bcm2836_control_update(s);
> +}
> +
> +static uint64_t bcm2836_control_read(void *opaque, hwaddr offset, unsigned size)
> +{
> +    BCM2836ControlState *s = opaque;
> +
> +    if (offset == 0xc) {
> +        /* GPU interrupt routing */
> +        assert(s->route_gpu_fiq < BCM2836_NCORES
> +               && s->route_gpu_irq < BCM2836_NCORES);
> +        return ((uint32_t)s->route_gpu_fiq << 2) | s->route_gpu_irq;
> +    } else if (offset >= 0x40 && offset < 0x50) {
> +        /* Timer interrupt control registers */
> +        return s->timercontrol[(offset - 0x40) >> 2];
> +    } else if (offset >= 0x50 && offset < 0x60) {
> +        /* Mailbox interrupt control registers */
> +        return s->mailboxcontrol[(offset - 0x50) >> 2];
> +    } else if (offset >= 0x60 && offset < 0x70) {
> +        /* IRQ source registers */
> +        return s->irqsrc[(offset - 0x60) >> 2];
> +    } else if (offset >= 0x70 && offset < 0x80) {
> +        /* FIQ source registers */
> +        return s->fiqsrc[(offset - 0x70) >> 2];
> +    } else if (offset >= 0xc0 && offset < 0x100) {
> +        /* Mailboxes */
> +        return s->mailboxes[(offset - 0xc0) >> 2];
> +    } else {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
> +                      __func__, offset);
> +        return 0;
> +    }
> +}
> +
> +static void bcm2836_control_write(void *opaque, hwaddr offset,
> +                                  uint64_t val, unsigned size)
> +{
> +    BCM2836ControlState *s = opaque;
> +
> +    if (offset == 0xc) {
> +        /* GPU interrupt routing */
> +        s->route_gpu_irq = val & 0x3;
> +        s->route_gpu_fiq = (val >> 2) & 0x3;
> +    } else if (offset >= 0x40 && offset < 0x50) {
> +        /* Timer interrupt control registers */
> +        s->timercontrol[(offset - 0x40) >> 2] = val & 0xff;
> +    } else if (offset >= 0x50 && offset < 0x60) {
> +        /* Mailbox interrupt control registers */
> +        s->mailboxcontrol[(offset - 0x50) >> 2] = val & 0xff;
> +    } else if (offset >= 0x80 && offset < 0xc0) {
> +        /* Mailbox set registers */
> +        s->mailboxes[(offset - 0x80) >> 2] |= val;
> +    } else if (offset >= 0xc0 && offset < 0x100) {
> +        /* Mailbox clear registers */
> +        s->mailboxes[(offset - 0xc0) >> 2] &= ~val;
> +    } else {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
> +                      __func__, offset);
> +        return;
> +    }
> +
> +    bcm2836_control_update(s);
> +}
> +
> +static const MemoryRegionOps bcm2836_control_ops = {
> +    .read = bcm2836_control_read,
> +    .write = bcm2836_control_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +};
> +
> +static void bcm2836_control_reset(DeviceState *d)
> +{
> +    BCM2836ControlState *s = BCM2836_CONTROL(d);
> +    int i;
> +
> +    s->route_gpu_irq = s->route_gpu_fiq = 0;
> +
> +    for (i = 0; i < BCM2836_NCORES; i++) {
> +        s->timercontrol[i] = 0;
> +        s->mailboxcontrol[i] = 0;
> +    }
> +
> +    for (i = 0; i < BCM2836_NCORES * BCM2836_MBPERCORE; i++) {
> +        s->mailboxes[i] = 0;
> +    }
> +}
> +
> +static void bcm2836_control_init(Object *obj)
> +{
> +    BCM2836ControlState *s = BCM2836_CONTROL(obj);
> +    DeviceState *dev = DEVICE(obj);
> +
> +    memory_region_init_io(&s->iomem, obj, &bcm2836_control_ops, s,
> +                          TYPE_BCM2836_CONTROL, 0x100);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
> +
> +    /* inputs from each CPU core */
> +    qdev_init_gpio_in_named(dev, bcm2836_control_set_local_irq0, "cntpsirq",
> +                            BCM2836_NCORES);
> +    qdev_init_gpio_in_named(dev, bcm2836_control_set_local_irq1, "cntpnsirq",
> +                            BCM2836_NCORES);
> +    qdev_init_gpio_in_named(dev, bcm2836_control_set_local_irq2, "cnthpirq",
> +                            BCM2836_NCORES);
> +    qdev_init_gpio_in_named(dev, bcm2836_control_set_local_irq3, "cntvirq",
> +                            BCM2836_NCORES);
> +    /* qdev_init_gpio_in_named(dev, bcm2836_control_set_pmu_irq, "pmuirq",
> +                            BCM2836_NCORES); */
> +
> +    /* IRQ and FIQ inputs from upstream bcm2835 controller */
> +    qdev_init_gpio_in_named(dev, bcm2836_control_set_gpu_irq, "gpu_irq", 1);
> +    qdev_init_gpio_in_named(dev, bcm2836_control_set_gpu_fiq, "gpu_fiq", 1);
> +
> +    /* outputs to CPU cores */
> +    qdev_init_gpio_out_named(dev, s->irq, "irq", BCM2836_NCORES);
> +    qdev_init_gpio_out_named(dev, s->fiq, "fiq", BCM2836_NCORES);
> +}
> +
> +static const VMStateDescription vmstate_bcm2836_control = {
> +    .name = TYPE_BCM2836_CONTROL,
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32_ARRAY(mailboxes, BCM2836ControlState,
> +                             BCM2836_NCORES * BCM2836_MBPERCORE),
> +        VMSTATE_UINT8(route_gpu_irq, BCM2836ControlState),
> +        VMSTATE_UINT8(route_gpu_fiq, BCM2836ControlState),
> +        VMSTATE_UINT32_ARRAY(timercontrol, BCM2836ControlState, BCM2836_NCORES),
> +        VMSTATE_UINT32_ARRAY(mailboxcontrol, BCM2836ControlState,
> +                             BCM2836_NCORES),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void bcm2836_control_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->reset = bcm2836_control_reset;
> +    dc->vmsd = &vmstate_bcm2836_control;
> +}
> +
> +static TypeInfo bcm2836_control_info = {
> +    .name          = TYPE_BCM2836_CONTROL,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(BCM2836ControlState),
> +    .class_init    = bcm2836_control_class_init,
> +    .instance_init = bcm2836_control_init,
> +};
> +
> +static void bcm2836_control_register_types(void)
> +{
> +    type_register_static(&bcm2836_control_info);
> +}
> +
> +type_init(bcm2836_control_register_types)
> diff --git a/include/hw/intc/bcm2836_control.h b/include/hw/intc/bcm2836_control.h
> new file mode 100644
> index 0000000..8a9a2f2
> --- /dev/null
> +++ b/include/hw/intc/bcm2836_control.h
> @@ -0,0 +1,51 @@
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
> +#ifndef BCM2836_CONTROL_H
> +#define BCM2836_CONTROL_H
> +
> +#include "hw/sysbus.h"
> +
> +/* 4 mailboxes per core, for 16 total */
> +#define BCM2836_NCORES 4
> +#define BCM2836_MBPERCORE 4
> +
> +#define TYPE_BCM2836_CONTROL "bcm2836_control"
> +#define BCM2836_CONTROL(obj) \
> +    OBJECT_CHECK(BCM2836ControlState, (obj), TYPE_BCM2836_CONTROL)
> +
> +typedef struct BCM2836ControlState {
> +    /*< private >*/
> +    SysBusDevice busdev;
> +    /*< public >*/
> +    MemoryRegion iomem;
> +
> +    /* interrupt status registers (not directly visible to user) */
> +    bool gpu_irq, gpu_fiq;
> +    uint32_t localirqs[BCM2836_NCORES];
> +
> +    /* mailboxes */
> +    uint32_t mailboxes[BCM2836_NCORES * BCM2836_MBPERCORE];
> +
> +    /* interrupt routing/control registers */
> +    uint8_t route_gpu_irq, route_gpu_fiq;
> +    uint32_t timercontrol[BCM2836_NCORES];
> +    uint32_t mailboxcontrol[BCM2836_NCORES];
> +
> +    /* interrupt source registers, post-routing (visible) */
> +    uint32_t irqsrc[BCM2836_NCORES];
> +    uint32_t fiqsrc[BCM2836_NCORES];
> +
> +    /* outputs to CPU cores */
> +    qemu_irq irq[BCM2836_NCORES];
> +    qemu_irq fiq[BCM2836_NCORES];
> +} BCM2836ControlState;
> +
> +#endif
> --
> 2.5.3
>
