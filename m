Received: by 10.182.158.201 with SMTP id ww9csp8244075obb;
        Wed, 30 Dec 2015 16:33:46 -0800 (PST)
X-Received: by 10.140.40.37 with SMTP id w34mr15517122qgw.85.1451522026010;
        Wed, 30 Dec 2015 16:33:46 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j133si13007873qhj.106.2015.12.30.16.33.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 Dec 2015 16:33:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54204 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aERBZ-0003Ww-Le
	for alex.bennee@linaro.org; Wed, 30 Dec 2015 19:33:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32785)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aERBW-0003Sh-Rs
	for qemu-arm@nongnu.org; Wed, 30 Dec 2015 19:33:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aERBV-0001RY-2c
	for qemu-arm@nongnu.org; Wed, 30 Dec 2015 19:33:42 -0500
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235]:34654)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aERBR-0001Pc-GU; Wed, 30 Dec 2015 19:33:37 -0500
Received: by mail-wm0-x235.google.com with SMTP id u188so53643466wmu.1;
	Wed, 30 Dec 2015 16:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=djJ4cx6pwVSso/I9E8H1IBEVUpclI8IPm+JftmVJbis=;
	b=DFv3yzzPEnpaY4KDC2bnzXRdm9HHpoLdTJ0saSPBOR+rYws4NpizKOimtRP9oGQtdE
	kWADu9KehW7Uzi2hb5bKYvO8eOZDtruKpt9N01UtatV7QDTWu/7ngK3xvCIasIgjEXxM
	J4LJ8+xUJdPxBBumZ+5GnXSh2817+F0FKfFxoxDCVOqlPncZ2Sj9Xjlob6N+hs0OfPnw
	+XSIIkM1zb7Ad4+RcI6Zy9hfSfo2NxoVEmhVxRGV0H1hnGRC/mFKLkfTzpHw+W69DICO
	uLWNdqZDVcs9NJdlIfXoNr4lxTiGRXKEY8o1ZJsw/UuBBYojtVC5IPF4aSP42Yq+3XL2
	RaXw==
MIME-Version: 1.0
X-Received: by 10.194.112.130 with SMTP id iq2mr60320370wjb.102.1451522016708; 
	Wed, 30 Dec 2015 16:33:36 -0800 (PST)
Received: by 10.28.91.143 with HTTP; Wed, 30 Dec 2015 16:33:36 -0800 (PST)
In-Reply-To: <1450916731-5968-4-git-send-email-Andrew.Baumann@microsoft.com>
References: <1450916731-5968-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1450916731-5968-4-git-send-email-Andrew.Baumann@microsoft.com>
Date: Wed, 30 Dec 2015 16:33:36 -0800
Message-ID: <CAPokK=qES8kJ2m6OiZ5qco877G_0azYXm5tFWyU944BZ8ndK6w@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::235
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v2 3/7] bcm2835_ic: add bcm2835 interrupt
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
X-TUID: I98f9MwXvX6X

On Wed, Dec 23, 2015 at 4:25 PM, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
> Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
> ---
>
> Notes:
>     v2 changes:
>      * split inputs to named gpu_irq and arm_irq gpio inputs
>      * use 64-bit gpu_irq and 8-bit arm_irq status rather than 3*32-bit bitfields
>      * added defined names for register offsets
>      * deleted nop realize method
>      * other misc cleanup suggested in review
>
>  hw/intc/Makefile.objs        |   1 +
>  hw/intc/bcm2835_ic.c         | 233 +++++++++++++++++++++++++++++++++++++++++++
>  include/hw/intc/bcm2835_ic.h |  33 ++++++
>  3 files changed, 267 insertions(+)
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
>  obj-$(CONFIG_SH4) += sh_intc.o
>  obj-$(CONFIG_XICS) += xics.o
>  obj-$(CONFIG_XICS_KVM) += xics_kvm.o
> diff --git a/hw/intc/bcm2835_ic.c b/hw/intc/bcm2835_ic.c
> new file mode 100644
> index 0000000..9624e8b
> --- /dev/null
> +++ b/hw/intc/bcm2835_ic.c
> @@ -0,0 +1,233 @@
> +/*
> + * Raspberry Pi emulation (c) 2012 Gregory Estrade
> + * This code is licensed under the GNU GPLv2 and later.
> + * Heavily based on pl190.c, copyright terms below:
> + *
> + * Arm PrimeCell PL190 Vector Interrupt Controller
> + *
> + * Copyright (c) 2006 CodeSourcery.
> + * Written by Paul Brook
> + *

So your own modifications are now heavy enough for you and/or an
affiliation to claim at least co-authorship.

> + * This code is licensed under the GPL.
> + */
> +
> +#include "hw/intc/bcm2835_ic.h"
> +
> +#define GPU_IRQS 64
> +#define ARM_IRQS 8
> +
> +#define IRQ_PENDING_BASIC       0x00 /* IRQ basic pending */
> +#define IRQ_PENDING_1           0x04 /* IRQ pending 1 */
> +#define IRQ_PENDING_2           0x08 /* IRQ pending 2 */
> +#define FIQ_CONTROL             0x0C /* FIQ register */
> +#define IRQ_ENABLE_1            0x10 /* Interrupt enable register 1 */
> +#define IRQ_ENABLE_2            0x14 /* Interrupt enable register 2 */
> +#define IRQ_ENABLE_BASIC        0x18 /* Base interrupt enable register */
> +#define IRQ_DISABLE_1           0x1C /* Interrupt disable register 1 */
> +#define IRQ_DISABLE_2           0x20 /* Interrupt disable register 2 */
> +#define IRQ_DISABLE_BASIC       0x24 /* Base interrupt disable register */
> +
> +/* Update interrupts.  */
> +static void bcm2835_ic_update(BCM2835ICState *s)
> +{
> +    bool set = false;
> +
> +    if (s->fiq_enable) {
> +        if (s->fiq_select >= GPU_IRQS) {
> +            /* ARM IRQ */
> +            set = extract32(s->arm_irq_level, s->fiq_select - GPU_IRQS, 1);
> +        } else {
> +            set = extract64(s->gpu_irq_level, s->fiq_select, 1);
> +        }
> +    }
> +    qemu_set_irq(s->fiq, set);
> +
> +    set = (s->gpu_irq_level & s->gpu_irq_enable)
> +        || (s->arm_irq_level & s->arm_irq_enable);
> +    qemu_set_irq(s->irq, set);
> +
> +}
> +
> +static void bcm2835_ic_set_gpu_irq(void *opaque, int irq, int level)
> +{
> +    BCM2835ICState *s = opaque;

Blank line here.

> +    assert(irq >= 0 && irq < 64);
> +    s->gpu_irq_level = deposit64(s->gpu_irq_level, irq, 1, level != 0);
> +    bcm2835_ic_update(s);
> +}
> +
> +static void bcm2835_ic_set_arm_irq(void *opaque, int irq, int level)
> +{
> +    BCM2835ICState *s = opaque;

Blank line here.

> +    assert(irq >= 0 && irq < 8);
> +    s->arm_irq_level = deposit32(s->arm_irq_level, irq, 1, level != 0);
> +    bcm2835_ic_update(s);
> +}
> +
> +static const int irq_dups[] = { 7, 9, 10, 18, 19, 53, 54, 55, 56, 57, 62 };
> +
> +static uint64_t bcm2835_ic_read(void *opaque, hwaddr offset, unsigned size)
> +{
> +    BCM2835ICState *s = opaque;
> +    uint32_t res = 0;
> +    uint64_t gpu_pending = s->gpu_irq_level & s->gpu_irq_enable;
> +    int i;
> +
> +    switch (offset) {
> +    case IRQ_PENDING_BASIC:
> +        /* bits 0-7: ARM irqs */
> +        res = s->arm_irq_level & s->arm_irq_enable;
> +
> +        /* bits 8 & 9: pending registers 1 & 2 */
> +        res |= (((uint32_t)gpu_pending) != 0) << 8;
> +        res |= ((gpu_pending >> 32) != 0) << 9;
> +
> +        /* bits 10-20: selected GPU IRQs */
> +        for (i = 0; i < ARRAY_SIZE(irq_dups); i++) {
> +            res |= extract64(gpu_pending, irq_dups[i], 1) << (i + 10);
> +        }
> +        break;
> +    case IRQ_PENDING_1:  /* IRQ pending 1 */

Drop trailing comment here and all below.

> +        res = gpu_pending;
> +        break;
> +    case IRQ_PENDING_2:  /* IRQ pending 2 */
> +        res = gpu_pending >> 32;
> +        break;
> +    case FIQ_CONTROL:  /* FIQ register */
> +        res = (s->fiq_enable << 7) | s->fiq_select;
> +        break;
> +    case IRQ_ENABLE_1:  /* Interrupt enable register 1 */
> +        res = s->gpu_irq_enable;
> +        break;
> +    case IRQ_ENABLE_2:  /* Interrupt enable register 2 */
> +        res = s->gpu_irq_enable >> 32;
> +        break;
> +    case IRQ_ENABLE_BASIC:  /* Base interrupt enable register */
> +        res = s->arm_irq_enable;
> +        break;
> +    case IRQ_DISABLE_1:  /* Interrupt disable register 1 */
> +        res = ~s->gpu_irq_enable;
> +        break;
> +    case IRQ_DISABLE_2:  /* Interrupt disable register 2 */
> +        res = ~s->gpu_irq_enable >> 32;
> +        break;
> +    case IRQ_DISABLE_BASIC:  /* Base interrupt disable register */
> +        res = ~s->arm_irq_enable;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
> +                      __func__, offset);
> +        return 0;
> +    }
> +
> +    return res;
> +}
> +
> +static void bcm2835_ic_write(void *opaque, hwaddr offset, uint64_t val,
> +                             unsigned size)
> +{
> +    BCM2835ICState *s = opaque;
> +
> +    switch (offset) {
> +    case FIQ_CONTROL:
> +        s->fiq_select = (val & 0x7f);
> +        s->fiq_enable = (val >> 7) & 0x1;

extract32 for both (my criteria is if there is both a shift and mask
it should extract instead of be manual).

> +        break;
> +    case IRQ_ENABLE_1:
> +        s->gpu_irq_enable |= val;
> +        break;
> +    case IRQ_ENABLE_2:
> +        s->gpu_irq_enable |= val << 32;
> +        break;
> +    case IRQ_ENABLE_BASIC:
> +        s->arm_irq_enable |= val & 0xff;
> +        break;
> +    case IRQ_DISABLE_1:
> +        s->gpu_irq_enable &= ~val;
> +        break;
> +    case IRQ_DISABLE_2:
> +        s->gpu_irq_enable &= ~(val << 32);
> +        break;
> +    case IRQ_DISABLE_BASIC:
> +        s->arm_irq_enable &= ~val & 0xff;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
> +                      __func__, offset);
> +        return;
> +    }
> +    bcm2835_ic_update(s);
> +}
> +
> +static const MemoryRegionOps bcm2835_ic_ops = {
> +    .read = bcm2835_ic_read,
> +    .write = bcm2835_ic_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .valid.min_access_size = 4,
> +    .valid.max_access_size = 4,
> +};
> +
> +static void bcm2835_ic_reset(DeviceState *d)
> +{
> +    BCM2835ICState *s = BCM2835_IC(d);
> +
> +    s->gpu_irq_enable = 0;
> +    s->arm_irq_enable = 0;
> +    s->fiq_enable = false;
> +    s->fiq_select = 0;
> +}
> +
> +static void bcm2835_ic_init(Object *obj)
> +{
> +    BCM2835ICState *s = BCM2835_IC(obj);
> +
> +    memory_region_init_io(&s->iomem, obj, &bcm2835_ic_ops, s, TYPE_BCM2835_IC,
> +                          0x200);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
> +
> +    qdev_init_gpio_in_named(DEVICE(s), bcm2835_ic_set_gpu_irq,
> +                            BCM2835_IC_GPU_IRQ, GPU_IRQS);
> +    qdev_init_gpio_in_named(DEVICE(s), bcm2835_ic_set_arm_irq,
> +                            BCM2835_IC_ARM_IRQ, ARM_IRQS);
> +
> +    sysbus_init_irq(SYS_BUS_DEVICE(s), &s->irq);
> +    sysbus_init_irq(SYS_BUS_DEVICE(s), &s->fiq);
> +}
> +
> +static const VMStateDescription vmstate_bcm2835_ic = {
> +    .name = TYPE_BCM2835_IC,
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT64(gpu_irq_level, BCM2835ICState),
> +        VMSTATE_UINT64(gpu_irq_enable, BCM2835ICState),
> +        VMSTATE_UINT8(arm_irq_level, BCM2835ICState),
> +        VMSTATE_UINT8(arm_irq_enable, BCM2835ICState),
> +        VMSTATE_BOOL(fiq_enable, BCM2835ICState),
> +        VMSTATE_UINT8(fiq_select, BCM2835ICState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void bcm2835_ic_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->reset = bcm2835_ic_reset;
> +    dc->vmsd = &vmstate_bcm2835_ic;
> +}
> +
> +static TypeInfo bcm2835_ic_info = {
> +    .name          = TYPE_BCM2835_IC,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(BCM2835ICState),
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
> index 0000000..d897f44
> --- /dev/null
> +++ b/include/hw/intc/bcm2835_ic.h
> @@ -0,0 +1,33 @@
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

s/_/-

> +#define BCM2835_IC(obj) OBJECT_CHECK(BCM2835ICState, (obj), TYPE_BCM2835_IC)
> +
> +#define BCM2835_IC_GPU_IRQ "gpu-irq"
> +#define BCM2835_IC_ARM_IRQ "arm-irq"
> +
> +typedef struct BCM2835ICState {
> +    /*< private >*/
> +    SysBusDevice busdev;
> +    /*< public >*/
> +
> +    MemoryRegion iomem;
> +
> +    /* 64 GPU IRQs + 8 ARM IRQs = 72 total (GPU first) */
> +    uint64_t gpu_irq_level, gpu_irq_enable;
> +    uint8_t arm_irq_level, arm_irq_enable;
> +    bool fiq_enable;
> +    uint8_t fiq_select;

> +    qemu_irq irq;
> +    qemu_irq fiq;

Move these two up to below iomem to separate IO from internal state.

Otherwise,

Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>

Regards,
Peter

> +} BCM2835ICState;
> +
> +#endif
> --
> 2.5.3
>
