Received: by 10.25.159.19 with SMTP id i19csp278129lfe;
        Mon, 11 Jan 2016 19:55:22 -0800 (PST)
X-Received: by 10.140.201.20 with SMTP id w20mr112855209qha.10.1452570922611;
        Mon, 11 Jan 2016 19:55:22 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p67si16313399qkp.108.2016.01.11.19.55.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jan 2016 19:55:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57919 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aIq3G-0006FI-9b
	for alex.bennee@linaro.org; Mon, 11 Jan 2016 22:55:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56938)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aIq2v-0005xv-1s
	for qemu-devel@nongnu.org; Mon, 11 Jan 2016 22:55:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aIq2q-0000dC-Si
	for qemu-devel@nongnu.org; Mon, 11 Jan 2016 22:55:00 -0500
Received: from mail-pa0-x244.google.com ([2607:f8b0:400e:c03::244]:36664)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aIq2q-0000cU-Jk; Mon, 11 Jan 2016 22:54:56 -0500
Received: by mail-pa0-x244.google.com with SMTP id a20so20202993pag.3;
	Mon, 11 Jan 2016 19:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=OgbbViiSQXivwlWTlzOm8q5Muk32DjWTHzFjJPXLdgo=;
	b=Wl7pB1L1xBAJpnxvUBBK3lsxY6Aktz+aE2aWRSYYF1+6alIHT2J0rB2eOmAwpVdxlb
	tEPnNAgZ+DV43RvXog3/CG5fddWBxzHHfZz4IqShKYLZfL7dGfLn0vZlOdodqFxKJ5TE
	22Jrmdd3/awXQRxk4t6Wtua94K0twtdBGpZRrGqSwrj98gHwCIas+omsFSFXR13kNZ7m
	sd4A9o9T2nhOptdl3WLHA8Goax4epSKy/OjE4V0yHrx5iP/1rWoXSe/IpoQdnAssUq4J
	kvxkA9AGydz+79RE9s1gIhO8j5ZYIWfL6VniVzBTKrfGsK09iJZmM2vNmHJ6RUc141jm
	RfmQ==
X-Received: by 10.66.160.100 with SMTP id xj4mr186369015pab.14.1452570895828; 
	Mon, 11 Jan 2016 19:54:55 -0800 (PST)
Received: from pcrost-box (c-73-70-184-119.hsd1.ca.comcast.net.
	[73.70.184.119]) by smtp.gmail.com with ESMTPSA id
	tm4sm188961681pab.3.2016.01.11.19.54.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jan 2016 19:54:55 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Mon, 11 Jan 2016 19:54:52 -0800
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Message-ID: <20160112035452.GB3308@pcrost-box>
References: <1451608294-16432-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1451608294-16432-6-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1451608294-16432-6-git-send-email-Andrew.Baumann@microsoft.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::244
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?iso-8859-1?Q?Gr=E9gory?= ESTRADE <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v3 5/7] bcm2836_control: add bcm2836 ARM
	control logic
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: FaucIHPks0Ul

On Thu, Dec 31, 2015 at 04:31:32PM -0800, Andrew Baumann wrote:
> This module is specific to the bcm2836 (Pi2). It implements the top
> level interrupt controller, and mailboxes used for inter-processor
> synchronisation.
> 
> Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
> ---
> 
> Notes:
>     v3:
>      * uint8 localirqs
>      * style tweaks
>      * add MR access size limits
> 
>  hw/intc/Makefile.objs             |   2 +-
>  hw/intc/bcm2836_control.c         | 317 ++++++++++++++++++++++++++++++++++++++
>  include/hw/intc/bcm2836_control.h |  51 ++++++
>  3 files changed, 369 insertions(+), 1 deletion(-)
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
> index 0000000..6c93333
> --- /dev/null
> +++ b/hw/intc/bcm2836_control.c
> @@ -0,0 +1,317 @@
> +/*
> + * Rasperry Pi 2 emulation ARM control logic module.
> + * Copyright (c) 2015, Microsoft
> + * Written by Andrew Baumann
> + *
> + * Based on bcm2835_ic.c (Raspberry Pi emulation) (c) 2012 Gregory Estrade
> + * This code is licensed under the GNU GPLv2 and later.
> + *
> + * At present, only implements interrupt routing, and mailboxes (i.e.,
> + * not local timer, PMU interrupt, or AXI counters).
> + *
> + * Ref:
> + * https://www.raspberrypi.org/documentation/hardware/raspberrypi/bcm2836/QA7_rev3.4.pdf
> + */
> +
> +#include "hw/intc/bcm2836_control.h"
> +
> +#define ROUTE_CORE(x) ((x) & 0x3)
> +#define ROUTE_FIQ(x)  (((x) & 0x4) != 0)
> +

Where are these used?

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
> +    /* reset pending IRQs/FIQs */
> +    for (i = 0; i < BCM2836_NCORES; i++) {
> +        s->irqsrc[i] = s->fiqsrc[i] = 0;
> +    }
> +
> +    /* apply routing logic, update status regs */
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
> +            /* sanity check localirqs: mailboxes are handled below */

Remove comment about mailboxes being below (comments about code
that is not in the immediate neighbourhood are hard to maintain).

Is this really generic handling of localirqs or is it timer-specific?

> +            assert(s->localirqs[i] < (1 << IRQ_MAILBOX0));
> +            for (j = 0; j < IRQ_MAILBOX0; j++) {
> +                if ((s->localirqs[i] & (1 << j)) != 0) {
> +                    /* local interrupt j is set */
> +                    if (FIQ_BIT(s->timercontrol[i], j)) {
> +                        /* deliver a FIQ */
> +                        s->fiqsrc[i] |= (uint32_t)1 << j;
> +                    } else if (IRQ_BIT(s->timercontrol[i], j)) {
> +                        /* deliver an IRQ */
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

Can we factor out the repeated if-else for FIQ_BIT and IRQ_BIT?

> +            }
> +        }
> +    }
> +
> +    /* call set_irq appropriately for each output */
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

deposit.

> +
> +    bcm2836_control_update(s);
> +}
> +
> +/* XXX: the following wrapper functions are a kludgy workaround,
> + * needed because I can't seem to pass useful information in the "irq"
> + * parameter when using named interrupts. Feel free to clean this up!
> + */
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

Definately think that this and below is overcommented. Can we just
have macro defs for registers instead?

Here and for write.

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
> +    .valid.min_access_size = 4,
> +    .valid.max_access_size = 4,
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

Why the commented code?

> +
> +    /* IRQ and FIQ inputs from upstream bcm2835 controller */
> +    qdev_init_gpio_in_named(dev, bcm2836_control_set_gpu_irq, "gpu_irq", 1);
> +    qdev_init_gpio_in_named(dev, bcm2836_control_set_gpu_fiq, "gpu_fiq", 1);

s/_/-

GPIO names are QOM names which are in turn user visible.

Regards,
Peter

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
> index 0000000..9dbfc9f
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
> +#define TYPE_BCM2836_CONTROL "bcm2836-control"
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
> +    uint8_t localirqs[BCM2836_NCORES];
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
