Received: by 10.182.158.201 with SMTP id ww9csp1582213obb;
        Sat, 5 Dec 2015 21:19:47 -0800 (PST)
X-Received: by 10.140.98.117 with SMTP id n108mr29040842qge.56.1449379187903;
        Sat, 05 Dec 2015 21:19:47 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 200si21921128qhm.3.2015.12.05.21.19.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 05 Dec 2015 21:19:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48731 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a5Rjf-0001Nk-DH
	for alex.bennee@linaro.org; Sun, 06 Dec 2015 00:19:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54412)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1a5Rjb-0001IL-Kj
	for qemu-arm@nongnu.org; Sun, 06 Dec 2015 00:19:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1a5RjZ-0002OH-V9
	for qemu-arm@nongnu.org; Sun, 06 Dec 2015 00:19:43 -0500
Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a]:35312)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1a5RjW-0002NP-20; Sun, 06 Dec 2015 00:19:38 -0500
Received: by wmuu63 with SMTP id u63so104869565wmu.0;
	Sat, 05 Dec 2015 21:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=c30CcedlSrHc+MbuVNsfH5M8X63gqAF/P1A19nOd9tY=;
	b=vvVl2s5P9qGZK53DOwlxHQkYWSNlDVuDahofqD91y6cCEBJVT4WST+U2sk1FjGHWrl
	V8PGFYpip5oADAneeyKa3k/pQp2luHuV+U6koov3WFhKHLStvWrLSe+sY9kMiECS2LCG
	NFypK8UwCj5dai2SbF0vgbWQotdRqZUh4fHgdo8NapMCTWT2FGgeyupwXg/PPh5GTEWm
	qsXgJuQ2uJOuQbQOafZCDdXhHBH92Tt3brQNzy+PUHSyT6Cqktnh3tkFqFDt60K6eFwy
	PMh9CIcr3bf8eKY6lz3zQTNq+dkNrfoq+RvLqsOgw4IJnJyGJN/+cP7D7qxyUTvBPjYn
	uFtg==
MIME-Version: 1.0
X-Received: by 10.194.204.166 with SMTP id kz6mr1570980wjc.174.1449379176930; 
	Sat, 05 Dec 2015 21:19:36 -0800 (PST)
Received: by 10.28.88.11 with HTTP; Sat, 5 Dec 2015 21:19:36 -0800 (PST)
In-Reply-To: <1449208887-9564-3-git-send-email-Andrew.Baumann@microsoft.com>
References: <1449187263-4604-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1449208887-9564-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1449208887-9564-3-git-send-email-Andrew.Baumann@microsoft.com>
Date: Sat, 5 Dec 2015 21:19:36 -0800
Message-ID: <CAPokK=r_c4yK3C8yp7mmqAsBKUrnA-3fLgKyp2eHKJyWy9HC9w@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22a
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH 3/8] bcm2835_ic: add bcm2835 interrupt
	controller
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
X-TUID: pNs+9uxWF6vo

On Thu, Dec 3, 2015 at 10:01 PM, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
> Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
> ---
>  hw/intc/Makefile.objs        |   1 +
>  hw/intc/bcm2835_ic.c         | 234 +++++++++++++++++++++++++++++++++++++++++++
>  include/hw/intc/bcm2835_ic.h |  26 +++++
>  3 files changed, 261 insertions(+)
>  create mode 100644 hw/intc/bcm2835_ic.c
>  create mode 100644 include/hw/intc/bcm2835_ic.h
>
> diff --git a/hw/intc/Makefile.objs b/hw/intc/Makefile.objs
> index 004b0c2..2ad1204 100644
> --- a/hw/intc/Makefile.objs
> +++ b/hw/intc/Makefile.objs
> @@ -24,6 +24,7 @@ obj-$(CONFIG_GRLIB) += grlib_irqmp.o
>  obj-$(CONFIG_IOAPIC) += ioapic.o
>  obj-$(CONFIG_OMAP) += omap_intc.o
>  obj-$(CONFIG_OPENPIC_KVM) += openpic_kvm.o
> +obj-$(CONFIG_RASPI) += bcm2835_ic.o

We are trying to encourage -'s for the separators in new file names,
although admittedly is does seem that intc/ is lagging here.

>  obj-$(CONFIG_SH4) += sh_intc.o
>  obj-$(CONFIG_XICS) += xics.o
>  obj-$(CONFIG_XICS_KVM) += xics_kvm.o
> diff --git a/hw/intc/bcm2835_ic.c b/hw/intc/bcm2835_ic.c
> new file mode 100644
> index 0000000..2419575
> --- /dev/null
> +++ b/hw/intc/bcm2835_ic.c
> @@ -0,0 +1,234 @@
> +/*
> + * Raspberry Pi emulation (c) 2012 Gregory Estrade
> + * This code is licensed under the GNU GPLv2 and later.
> + */
> +
> +/* Heavily based on pl190.c, copyright terms below. */
> +
> +/*

You can just make this one header comment rather than stop and start
block comments again.

> + * Arm PrimeCell PL190 Vector Interrupt Controller
> + *
> + * Copyright (c) 2006 CodeSourcery.
> + * Written by Paul Brook
> + *
> + * This code is licensed under the GPL.
> + */
> +
> +#include "hw/intc/bcm2835_ic.h"
> +
> +#define IR_B 2

IR_B should move down. Although some of my following comment may
obsolete this def anyway.

> +#define IR_1 0
> +#define IR_2 1
> +
> +/* Update interrupts.  */
> +static void bcm2835_ic_update(BCM2835IcState *s)
> +{
> +    int set;
> +    int i;
> +
> +    set = 0;
> +    if (s->fiq_enable) {
> +        set = s->level[s->fiq_select >> 5] & (1u << (s->fiq_select & 0x1f));
> +    }
> +    qemu_set_irq(s->fiq, set);
> +
> +    set = 0;
> +    for (i = 0; i < 3; i++) {
> +        set |= (s->level[i] & s->irq_enable[i]);
> +    }
> +    qemu_set_irq(s->irq, set);
> +
> +}
> +
> +static void bcm2835_ic_set_irq(void *opaque, int irq, int level)
> +{
> +    BCM2835IcState *s = (BCM2835IcState *)opaque;
> +
> +    if (irq >= 0 && irq <= 71) {

I assume the 72 comes from 64 GPU interrupts +8 ARM interrupts.
Looking at the TRM, these seem to be different enumeration schemes and
not considered one interrupt list. You should use named GPIOs to split
it into the two named sets "GPU" and "ARM", I notice in patch 5 you
have:

+#define ARM_IRQ0_BASE                  64

To convert the ARM IRQ indexing scheme to the GPU one. This would go
away with the separate name sets.

> +        if (level) {
> +                s->level[irq >> 5] |= 1u << (irq & 0x1f);

It also means you can have a single uint64_t (perhaps named
"gpu_level") in the state to hold the full GPU interrupt list,
avoiding the need for the >> 5 ... & 0x1f logic that you need a few
times. The ARM interrupts then become their own separate uint8_t
(arm_level?).

> +        } else {
> +                s->level[irq >> 5] &= ~(1u << (irq & 0x1f));
> +        }

So these 5 lines will reduce to:

s->gpu_level = deposit64(s->gpu_level, index, 1, !!level);

> +    } else {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +            "bcm2835_ic_set_irq: Bad irq %d\n", irq);

As you explicitly define the length of the interrupts list at 72, this
would be fatal and should g_assert_not_reached(). But I would drip the
if-else (and the check) altogether as the GPIO API should be doing its
own checking.

> +    }
> +
> +    bcm2835_ic_update(s);
> +}
> +
> +static const int irq_dups[] = { 7, 9, 10, 18, 19, 53, 54, 55, 56, 57, 62, -1 };
> +
> +static uint64_t bcm2835_ic_read(void *opaque, hwaddr offset,
> +    unsigned size)
> +{
> +    BCM2835IcState *s = (BCM2835IcState *)opaque;

Cast unneeded.

> +    int i;
> +    int p = 0;
> +    uint32_t res = 0;
> +
> +    switch (offset) {
> +    case 0x00:  /* IRQ basic pending */

Rather than commenting the hex, define macros for the register map
that are then used for both read and write switches.

> +        /* bits 0-7 - ARM irqs */
> +        res = (s->level[IR_B] & s->irq_enable[IR_B]) & 0xff;
> +        for (i = 0; i < 64; i++) {
> +            if (i == irq_dups[p]) {
> +                /* bits 10-20 - selected GPU irqs */
> +                if (s->level[i >> 5] & s->irq_enable[i >> 5]
> +                    & (1u << (i & 0x1f))) {
> +                    res |= (1u << (10 + p));

This will get simpler with the unit64_t GPU interrupt list.

> +                }
> +                p++;
> +            } else {
> +                /* bits 8-9 - one or more bits set in pending registers 1-2 */
> +                if (s->level[i >> 5] & s->irq_enable[i >> 5]
> +                    & (1u << (i & 0x1f))) {

The common subexpression

s->level[i >> 5] & s->irq_enable[i >> 5] & (1u << (i & 0x1f))

can be avoided with a local variable (bool irq_pending).

> +                    res |= (1u << (8 + (i >> 5)));

A nit, but i /32 better documents the intent of the shift.

> +                }
> +            }
> +        }
> +        break;
> +    case 0x04:  /* IRQ pending 1 */
> +        res = s->level[IR_1] & s->irq_enable[IR_1];

extract64 with a case-fallthrough would be usable for getting the two
halves from a uint64_t:

something like:

case 0x08:
    shift = 32;
   /* fallthrough */
case 0x04:
    res = extract64(s->gpu_level, shift, 32) &
extract64(s->gpu_irq_enable, shift, 32);
    break;

> +        break;
> +    case 0x08:  /* IRQ pending 2 */
> +        res = s->level[IR_2] & s->irq_enable[IR_2];
> +        break;
> +    case 0x0C:  /* FIQ register */
> +        res = (s->fiq_enable << 7) | s->fiq_select;
> +        break;
> +    case 0x10:  /* Interrupt enable register 1 */
> +        res = s->irq_enable[IR_1];

irq_enable would also be split to gpu_irq_enable and arm_irq_enable
separate variables under split GPIO namespace implementation.

> +        break;
> +    case 0x14:  /* Interrupt enable register 2 */
> +        res = s->irq_enable[IR_2];
> +        break;
> +    case 0x18:  /* Base interrupt enable register */
> +        res = s->irq_enable[IR_B];
> +        break;
> +    case 0x1C:  /* Interrupt disable register 1 */
> +        res = ~s->irq_enable[IR_1];
> +        break;
> +    case 0x20:  /* Interrupt disable register 2 */
> +        res = ~s->irq_enable[IR_2];
> +        break;
> +    case 0x24:  /* Base interrupt disable register */
> +        res = ~s->irq_enable[IR_B];
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +            "bcm2835_ic_read: Bad offset %x\n", (int)offset);

%s __func__ for the function name component. This guards against the
message going stale if the function is renamed.

Use HWADDR_PRIx rather than cast the offset.

> +        return 0;
> +    }
> +
> +    return res;
> +}
> +
> +static void bcm2835_ic_write(void *opaque, hwaddr offset,
> +    uint64_t val, unsigned size)

Indentation of continued argument lists should indent to one past the
"(" which started the list:

static void bcm2835_ic_write(void *opaque, hwaddr offset,
                             uint64_t val, unsigned size)

> +{
> +    BCM2835IcState *s = (BCM2835IcState *)opaque;

Cast unneeded.

> +
> +    switch (offset) {
> +    case 0x0C:  /* FIQ register */
> +        s->fiq_select = (val & 0x7f);
> +        s->fiq_enable = (val >> 7) & 0x1;
> +        break;
> +    case 0x10:  /* Interrupt enable register 1 */
> +        s->irq_enable[IR_1] |= val;
> +        break;
> +    case 0x14:  /* Interrupt enable register 2 */
> +        s->irq_enable[IR_2] |= val;
> +        break;
> +    case 0x18:  /* Base interrupt enable register */
> +        s->irq_enable[IR_B] |= (val & 0xff);
> +        break;
> +    case 0x1C:  /* Interrupt disable register 1 */
> +        s->irq_enable[IR_1] &= ~val;
> +        break;
> +    case 0x20:  /* Interrupt disable register 2 */
> +        s->irq_enable[IR_2] &= ~val;
> +        break;
> +    case 0x24:  /* Base interrupt disable register */
> +        s->irq_enable[IR_B] &= (~val & 0xff);
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +            "bcm2835_ic_write: Bad offset %x\n", (int)offset);
> +        return;
> +    }
> +    bcm2835_ic_update(s);
> +}
> +
> +static const MemoryRegionOps bcm2835_ic_ops = {
> +    .read = bcm2835_ic_read,
> +    .write = bcm2835_ic_write,

You do not handle anything that is not a word access so you should add
the min_access_size and max_access_size definitions.

> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +};
> +
> +static void bcm2835_ic_reset(DeviceState *d)
> +{
> +    BCM2835IcState *s = BCM2835_IC(d);
> +    int i;
> +
> +    for (i = 0; i < 3; i++) {
> +        s->irq_enable[i] = 0;
> +    }
> +    s->fiq_enable = 0;
> +    s->fiq_select = 0;
> +}
> +
> +static void bcm2835_ic_init(Object *obj)
> +{
> +    BCM2835IcState *s = BCM2835_IC(obj);
> +
> +    memory_region_init_io(&s->iomem, obj, &bcm2835_ic_ops, s, TYPE_BCM2835_IC,
> +                          0x200);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
> +
> +    qdev_init_gpio_in(DEVICE(s), bcm2835_ic_set_irq, 72);

This is where the split would happen:

qdev_init_gpio_in_named(DEVICE(s), bcm2835_ic_set_irq, BCM2835_IC_GPU_IRQ, 64);
qdev_init_gpio_in_named(DEVICE(s), bcm2835_ic_set_irq, BCM2835_IC_ARM_IRQ, 8);

Where the two macros are something like "gpu-irq" and "arm-irq".

> +    sysbus_init_irq(SYS_BUS_DEVICE(s), &s->irq);
> +    sysbus_init_irq(SYS_BUS_DEVICE(s), &s->fiq);
> +}
> +
> +static void bcm2835_ic_realize(DeviceState *dev, Error **errp)
> +{
> +}

Nop realize is not needed. Just leave the callback unset in class_init.

> +
> +static const VMStateDescription vmstate_bcm2835_ic = {
> +    .name = TYPE_BCM2835_IC,
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32_ARRAY(level, BCM2835IcState, 3),
> +        VMSTATE_UINT32_ARRAY(irq_enable, BCM2835IcState, 3),
> +        VMSTATE_INT32(fiq_enable, BCM2835IcState),
> +        VMSTATE_INT32(fiq_select, BCM2835IcState),

fiq_select should be a bool.

> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void bcm2835_ic_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->realize = bcm2835_ic_realize;

So this line can be dropped.

> +    dc->reset = bcm2835_ic_reset;
> +    dc->vmsd = &vmstate_bcm2835_ic;
> +}
> +
> +static TypeInfo bcm2835_ic_info = {
> +    .name          = TYPE_BCM2835_IC,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(BCM2835IcState),
> +    .class_init    = bcm2835_ic_class_init,
> +    .instance_init = bcm2835_ic_init,
> +};
> +
> +static void bcm2835_ic_register_types(void)
> +{
> +    type_register_static(&bcm2835_ic_info);
> +}
> +
> +type_init(bcm2835_ic_register_types)
> diff --git a/include/hw/intc/bcm2835_ic.h b/include/hw/intc/bcm2835_ic.h
> new file mode 100644
> index 0000000..428139d
> --- /dev/null
> +++ b/include/hw/intc/bcm2835_ic.h
> @@ -0,0 +1,26 @@
> +/*
> + * Raspberry Pi emulation (c) 2012 Gregory Estrade
> + * This code is licensed under the GNU GPLv2 and later.
> + */
> +
> +#ifndef BCM2835_IC_H
> +#define BCM2835_IC_H
> +
> +#include "hw/sysbus.h"
> +
> +#define TYPE_BCM2835_IC "bcm2835_ic"
> +#define BCM2835_IC(obj) OBJECT_CHECK(BCM2835IcState, (obj), TYPE_BCM2835_IC)
> +
> +typedef struct BCM2835IcState {

Add the comments:

/*< private >*/

> +    SysBusDevice busdev;

and:

/*< public >*/

As they make some auto-generated documentation nicer.

> +    MemoryRegion iomem;
> +
> +    uint32_t level[3];
> +    uint32_t irq_enable[3];
> +    int fiq_enable;

You migrate this as a uint32_t so it must be a uint32_t here as well.

> +    int fiq_select;
> +    qemu_irq irq;
> +    qemu_irq fiq;
> +} BCM2835IcState;

BCM2835ICState. Acronyms in camel case should be all caps.

Regards,
Peter

> +
> +#endif
> --
> 2.5.3
>
