Received: by 10.182.158.201 with SMTP id ww9csp3064834obb;
        Mon, 21 Dec 2015 14:51:17 -0800 (PST)
X-Received: by 10.140.20.144 with SMTP id 16mr29252524qgj.45.1450738277477;
        Mon, 21 Dec 2015 14:51:17 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 97si31480360qkt.81.2015.12.21.14.51.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Dec 2015 14:51:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47704 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aB9IT-0007lq-7b
	for alex.bennee@linaro.org; Mon, 21 Dec 2015 17:51:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51979)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aB9Gd-0005P6-R2
	for qemu-devel@nongnu.org; Mon, 21 Dec 2015 17:49:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aB9GZ-0005dc-T2
	for qemu-devel@nongnu.org; Mon, 21 Dec 2015 17:49:23 -0500
Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231]:36427)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aB9GZ-0005dV-Fg; Mon, 21 Dec 2015 17:49:19 -0500
Received: by mail-wm0-x231.google.com with SMTP id p187so87258463wmp.1;
	Mon, 21 Dec 2015 14:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=k0IKtjj11YLZSsDerHPRN7BGCDliYOVh7sj53rWDlIA=;
	b=P8Dw9sZIHV3e/CgAZSoANKcIalYZgG3BDY+pLm3rNDMfZlDjw5eTcv1ZhMb4hW9rRY
	UxOzN1JyWIhgDm2o9/PuZZy6WeVV231dZkZi15XKK5LTMoCKwKoYYshpe9s1goleXMOa
	d6g6nDvbcGJPejZTzvDbre0Buxjsmzyz8N9LyxO+Z1vqJvdotnP+2R8v3q7nkqJ/TdnH
	sbfv9SO5CrRLeFgb+JCGufHNAG48H1pk/EQt8tYAu7KkFg/i3UJSRSRf6QoVU7EuGfrZ
	OtfIKkv88ub+8BH9nlb/pc7sn+mGptOi48OpoxmoWD0CIe6RvOhRyHakBCQYF9X94ifX
	jNGQ==
MIME-Version: 1.0
X-Received: by 10.28.65.193 with SMTP id o184mr2935268wma.15.1450738158696;
	Mon, 21 Dec 2015 14:49:18 -0800 (PST)
Received: by 10.28.88.11 with HTTP; Mon, 21 Dec 2015 14:49:18 -0800 (PST)
In-Reply-To: <1449208887-9564-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1449187263-4604-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1449208887-9564-1-git-send-email-Andrew.Baumann@microsoft.com>
Date: Mon, 21 Dec 2015 14:49:18 -0800
Message-ID: <CAPokK=rGg5pG_XFL0c6C-i-Mkobzd+D-KgrUE1bdt1RBsD3bGg@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::231
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 1/8] bcm2835_sbm: add BCM2835 mailboxes
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
X-TUID: rRvdLo/H6aU7

On Thu, Dec 3, 2015 at 10:01 PM, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
> This adds the system mailboxes which are used to communicate with a
> number of GPU peripherals on Pi/Pi2.
>
> Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
> ---
>  default-configs/arm-softmmu.mak      |   1 +
>  hw/misc/Makefile.objs                |   1 +
>  hw/misc/bcm2835_sbm.c                | 280 ++++++++++++++++++++

>  include/hw/arm/bcm2835_arm_control.h | 481 +++++++++++++++++++++++++++++++++++

Do we need this file as of this patch?

>  include/hw/arm/bcm2835_mbox.h        |  19 ++
>  include/hw/misc/bcm2835_sbm.h        |  37 +++
>  6 files changed, 819 insertions(+)
>  create mode 100644 hw/misc/bcm2835_sbm.c
>  create mode 100644 include/hw/arm/bcm2835_arm_control.h
>  create mode 100644 include/hw/arm/bcm2835_mbox.h
>  create mode 100644 include/hw/misc/bcm2835_sbm.h
>
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index d9b90a5..a9f82a1 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -79,6 +79,7 @@ CONFIG_TUSB6010=y
>  CONFIG_IMX=y
>  CONFIG_MAINSTONE=y
>  CONFIG_NSERIES=y
> +CONFIG_RASPI=y
>  CONFIG_REALVIEW=y
>  CONFIG_ZAURUS=y
>  CONFIG_ZYNQ=y
> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> index aeb6b7d..b9379f2 100644
> --- a/hw/misc/Makefile.objs
> +++ b/hw/misc/Makefile.objs
> @@ -34,6 +34,7 @@ obj-$(CONFIG_OMAP) += omap_gpmc.o
>  obj-$(CONFIG_OMAP) += omap_l4.o
>  obj-$(CONFIG_OMAP) += omap_sdrc.o
>  obj-$(CONFIG_OMAP) += omap_tap.o
> +obj-$(CONFIG_RASPI) += bcm2835_sbm.o
>  obj-$(CONFIG_SLAVIO) += slavio_misc.o
>  obj-$(CONFIG_ZYNQ) += zynq_slcr.o
>  obj-$(CONFIG_ZYNQ) += zynq-xadc.o
> diff --git a/hw/misc/bcm2835_sbm.c b/hw/misc/bcm2835_sbm.c
> new file mode 100644
> index 0000000..a5c9324
> --- /dev/null
> +++ b/hw/misc/bcm2835_sbm.c
> @@ -0,0 +1,280 @@
> +/*
> + * Raspberry Pi emulation (c) 2012 Gregory Estrade
> + * This code is licensed under the GNU GPLv2 and later.
> + */
> +
> +#include "hw/misc/bcm2835_sbm.h"
> +#include "hw/arm/bcm2835_arm_control.h"
> +
> +static void mbox_update_status(BCM2835Mbox *mb)
> +{
> +    if (mb->count == 0) {
> +        mb->status |= ARM_MS_EMPTY;
> +    } else {
> +        mb->status &= ~ARM_MS_EMPTY;
> +    }
> +    if (mb->count == MBOX_SIZE) {
> +        mb->status |= ARM_MS_FULL;
> +    } else {
> +        mb->status &= ~ARM_MS_FULL;
> +    }

The start-from-scratch approach makes this shorter:

mb->status &= ~(ARM_MS_EMPTY | ARM_MS_FULL);
if (mb->count == 0) {
    mb->status |= ARM_MS_EMPTY;
}
if (mb->count == MBOX_SIZE) {
    mb->status |= ARM_MS_FULL;
}

> +}
> +
> +static void mbox_init(BCM2835Mbox *mb)

This looks like a reset function.

> +{
> +    int n;

Blank line here.

> +    mb->count = 0;
> +    mb->config = 0;
> +    for (n = 0; n < MBOX_SIZE; n++) {
> +        mb->reg[n] = MBOX_INVALID_DATA;
> +    }
> +    mbox_update_status(mb);
> +}
> +
> +static uint32_t mbox_pull(BCM2835Mbox *mb, int index)
> +{
> +    int n;
> +    uint32_t val;
> +
> +    assert(mb->count > 0);
> +    assert(index < mb->count);
> +
> +    val = mb->reg[index];
> +    for (n = index + 1; n < mb->count; n++) {
> +        mb->reg[n - 1] = mb->reg[n];
> +    }
> +    mb->count--;
> +    mb->reg[mb->count] = MBOX_INVALID_DATA;
> +
> +    mbox_update_status(mb);
> +
> +    return val;
> +}
> +
> +static void mbox_push(BCM2835Mbox *mb, uint32_t val)
> +{
> +    assert(mb->count < MBOX_SIZE);
> +    mb->reg[mb->count++] = val;
> +    mbox_update_status(mb);
> +}
> +
> +static void bcm2835_sbm_update(BCM2835SbmState *s)

What does Sbm stand for? If it is acronym is should be all caps in camel case.

> +{
> +    int set;

bool.

> +    int done, n;
> +    uint32_t value;
> +
> +    /* Avoid unwanted recursive calls */
> +    s->mbox_irq_disabled = 1;
> +
> +    /* Get pending responses and put them in the vc->arm mbox */
> +    done = 0;
> +    while (!done) {
> +        done = 1;
> +        if (s->mbox[0].status & ARM_MS_FULL) {
> +            /* vc->arm mbox full, exit */

break here.

> +        } else {

so you can drop the else and get back a level of indent.

> +            for (n = 0; n < MBOX_CHAN_COUNT; n++) {
> +                if (s->available[n]) {
> +                    value = ldl_phys(&s->mbox_as, n<<4);
> +                    if (value != MBOX_INVALID_DATA) {
> +                        mbox_push(&s->mbox[0], value);
> +                    } else {
> +                        /* Hmmm... */

Needs more comment :)

> +                    }
> +                    done = 0;
> +                    break;
> +                }
> +            }
> +        }
> +    }
> +
> +    /* Try to push pending requests from the arm->vc mbox */
> +    /* TODO (?) */
> +
> +    /* Re-enable calls from the IRQ routine */
> +    s->mbox_irq_disabled = 0;
> +
> +    /* Update ARM IRQ status */
> +    set = 0;
> +    if (s->mbox[0].status & ARM_MS_EMPTY) {
> +        s->mbox[0].config &= ~ARM_MC_IHAVEDATAIRQPEND;

This can also be reduced to just if (no else), by always clearing
ARM_MC_IHAVEDATAIRQPEND. This makes it consistent with the way you
handle set.

> +    } else {
> +        s->mbox[0].config |= ARM_MC_IHAVEDATAIRQPEND;
> +        if (s->mbox[0].config & ARM_MC_IHAVEDATAIRQEN) {
> +            set = 1;
> +        }
> +    }
> +    qemu_set_irq(s->arm_irq, set);
> +}
> +
> +static void bcm2835_sbm_set_irq(void *opaque, int irq, int level)
> +{
> +    BCM2835SbmState *s = (BCM2835SbmState *)opaque;

Blank line. No cast needed.

> +    s->available[irq] = level;
> +    if (!s->mbox_irq_disabled) {

I don't think you need this. IO devices are not thread safe and
core-code knows it. So you don't need to worry about interruption and
re-entry of your IRQ handler.

> +        bcm2835_sbm_update(s);
> +    }
> +}
> +
> +static uint64_t bcm2835_sbm_read(void *opaque, hwaddr offset,
> +                           unsigned size)
> +{
> +    BCM2835SbmState *s = (BCM2835SbmState *)opaque;

cast.

> +    uint32_t res = 0;
> +
> +    offset &= 0xff;
> +
> +    switch (offset) {
> +    case 0x80:  /* MAIL0_READ */
> +    case 0x84:
> +    case 0x88:
> +    case 0x8c:

case 0x80..0x8c

> +        if (s->mbox[0].status & ARM_MS_EMPTY) {
> +            res = MBOX_INVALID_DATA;
> +        } else {
> +            res = mbox_pull(&s->mbox[0], 0);
> +        }
> +        break;
> +    case 0x90:  /* MAIL0_PEEK */
> +        res = s->mbox[0].reg[0];
> +        break;
> +    case 0x94:  /* MAIL0_SENDER */
> +        break;
> +    case 0x98:  /* MAIL0_STATUS */
> +        res = s->mbox[0].status;
> +        break;
> +    case 0x9c:  /* MAIL0_CONFIG */
> +        res = s->mbox[0].config;
> +        break;
> +    case 0xb8:  /* MAIL1_STATUS */
> +        res = s->mbox[1].status;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +            "bcm2835_sbm_read: Bad offset %x\n", (int)offset);
> +        return 0;
> +    }
> +
> +    bcm2835_sbm_update(s);
> +
> +    return res;
> +}
> +
> +static void bcm2835_sbm_write(void *opaque, hwaddr offset,
> +                        uint64_t value, unsigned size)
> +{
> +    int ch;
> +
> +    BCM2835SbmState *s = (BCM2835SbmState *)opaque;
> +
> +    offset &= 0xff;
> +
> +    switch (offset) {
> +    case 0x94:  /* MAIL0_SENDER */
> +        break;
> +    case 0x9c:  /* MAIL0_CONFIG */
> +        s->mbox[0].config &= ~ARM_MC_IHAVEDATAIRQEN;
> +        s->mbox[0].config |= value & ARM_MC_IHAVEDATAIRQEN;
> +        break;
> +    case 0xa0:
> +    case 0xa4:
> +    case 0xa8:
> +    case 0xac:

case ...

> +        if (s->mbox[1].status & ARM_MS_FULL) {
> +            /* Guest error */

LOG_GUEST_ERROR.

> +        } else {
> +            ch = value & 0xf;
> +            if (ch < MBOX_CHAN_COUNT) {
> +                if (ldl_phys(&s->mbox_as, (ch<<4) + 4)) {

What is significance of memory offset +4? Can you have some macros for
this for some hints as to what the functionality is?

> +                    /* Push delayed, push it in the arm->vc mbox */
> +                    mbox_push(&s->mbox[1], value);
> +                } else {
> +                    stl_phys(&s->mbox_as, ch<<4, value);
> +                }
> +            } else {
> +                /* Invalid channel number */

LOG_GUEST_ERROR.

> +            }
> +        }
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +            "bcm2835_sbm_write: Bad offset %x\n", (int)offset);
> +        return;
> +    }
> +
> +    bcm2835_sbm_update(s);
> +}
> +
> +static const MemoryRegionOps bcm2835_sbm_ops = {
> +    .read = bcm2835_sbm_read,
> +    .write = bcm2835_sbm_write,

Add access restrictions.

> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +};
> +
> +static const VMStateDescription vmstate_bcm2835_sbm = {
> +    .name = TYPE_BCM2835_SBM,
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .minimum_version_id_old = 1,
> +    .fields      = (VMStateField[]) {

Is the state missing?

> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void bcm2835_sbm_init(Object *obj)
> +{
> +    BCM2835SbmState *s = BCM2835_SBM(obj);
> +    memory_region_init_io(&s->iomem, obj, &bcm2835_sbm_ops, s,
> +                          TYPE_BCM2835_SBM, 0x400);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
> +    sysbus_init_irq(SYS_BUS_DEVICE(s), &s->arm_irq);
> +    qdev_init_gpio_in(DEVICE(s), bcm2835_sbm_set_irq, MBOX_CHAN_COUNT);
> +}
> +
> +static void bcm2835_sbm_realize(DeviceState *dev, Error **errp)
> +{
> +    int n;
> +    BCM2835SbmState *s = BCM2835_SBM(dev);
> +    Object *obj;
> +    Error *err = NULL;
> +
> +    obj = object_property_get_link(OBJECT(dev), "mbox_mr", &err);
> +    if (err || obj == NULL) {
> +        error_setg(errp, "bcm2835_sbm: required mbox_mr link not found");

Propagate the original error along with this new mesage. %s with
error_get_pretty(err) can do this.

> +        return;
> +    }
> +
> +    s->mbox_mr = MEMORY_REGION(obj);
> +    address_space_init(&s->mbox_as, s->mbox_mr, NULL);
> +
> +    mbox_init(&s->mbox[0]);
> +    mbox_init(&s->mbox[1]);
> +    s->mbox_irq_disabled = 0;
> +    for (n = 0; n < MBOX_CHAN_COUNT; n++) {
> +        s->available[n] = 0;
> +    }

This looks like reset behaviour, and should be moved into dc->reset callback.

> +}
> +
> +static void bcm2835_sbm_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->realize = bcm2835_sbm_realize;
> +    dc->vmsd = &vmstate_bcm2835_sbm;
> +}
> +
> +static TypeInfo bcm2835_sbm_info = {
> +    .name          = TYPE_BCM2835_SBM,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(BCM2835SbmState),
> +    .class_init    = bcm2835_sbm_class_init,
> +    .instance_init = bcm2835_sbm_init,
> +};
> +
> +static void bcm2835_sbm_register_types(void)
> +{
> +    type_register_static(&bcm2835_sbm_info);
> +}
> +
> +type_init(bcm2835_sbm_register_types)
> diff --git a/include/hw/arm/bcm2835_arm_control.h b/include/hw/arm/bcm2835_arm_control.h
> new file mode 100644
> index 0000000..28acba8
> --- /dev/null
> +++ b/include/hw/arm/bcm2835_arm_control.h
> @@ -0,0 +1,481 @@
> +/*
> + *  linux/arch/arm/mach-bcm2708/arm_control.h
> + *
> + *  Copyright (C) 2010 Broadcom
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
> +#ifndef BCM2708_ARM_CONTROL_H_
> +#define BCM2708_ARM_CONTROL_H_
> +
> +/*
> + * Definitions and addresses for the ARM CONTROL logic
> + * This file is manually generated.
> + */
> +
> +#define ARM_BASE  0x7E00B000
> +
> +/* Basic configuration */
> +#define ARM_CONTROL0  HW_REGISTER_RW(ARM_BASE+0x000)
> +#define ARM_C0_SIZ128M   0x00000000
> +#define ARM_C0_SIZ256M   0x00000001
> +#define ARM_C0_SIZ512M   0x00000002
> +#define ARM_C0_SIZ1G     0x00000003
> +#define ARM_C0_BRESP0    0x00000000
> +#define ARM_C0_BRESP1    0x00000004
> +#define ARM_C0_BRESP2    0x00000008
> +#define ARM_C0_BOOTHI    0x00000010
> +#define ARM_C0_UNUSED05  0x00000020 /* free */
> +#define ARM_C0_FULLPERI  0x00000040
> +#define ARM_C0_UNUSED78  0x00000180 /* free */
> +#define ARM_C0_JTAGMASK  0x00000E00
> +#define ARM_C0_JTAGOFF   0x00000000
> +#define ARM_C0_JTAGBASH  0x00000800 /* Debug on GPIO off */
> +#define ARM_C0_JTAGGPIO  0x00000C00 /* Debug on GPIO on */
> +#define ARM_C0_APROTMSK  0x0000F000
> +#define ARM_C0_DBG0SYNC  0x00010000 /* VPU0 halt sync */
> +#define ARM_C0_DBG1SYNC  0x00020000 /* VPU1 halt sync */
> +#define ARM_C0_SWDBGREQ  0x00040000 /* HW debug request */
> +#define ARM_C0_PASSHALT  0x00080000 /* ARM halt passed to debugger */
> +#define ARM_C0_PRIO_PER  0x00F00000 /* per priority mask */
> +#define ARM_C0_PRIO_L2   0x0F000000
> +#define ARM_C0_PRIO_UC   0xF0000000
> +
> +#define ARM_C0_APROTPASS  0x0000A000 /* Translate 1:1 */
> +#define ARM_C0_APROTUSER  0x00000000 /* Only user mode */
> +#define ARM_C0_APROTSYST  0x0000F000 /* Only system mode */
> +
> +
> +#define ARM_CONTROL1  HW_REGISTER_RW(ARM_BASE+0x440)
> +#define ARM_C1_TIMER     0x00000001 /* re-route timer IRQ  to VC */
> +#define ARM_C1_MAIL      0x00000002 /* re-route Mail IRQ   to VC */
> +#define ARM_C1_BELL0     0x00000004 /* re-route Doorbell 0 to VC */
> +#define ARM_C1_BELL1     0x00000008 /* re-route Doorbell 1 to VC */
> +#define ARM_C1_PERSON    0x00000100 /* peripherals on */
> +#define ARM_C1_REQSTOP   0x00000200 /* ASYNC bridge request stop */
> +
> +#define ARM_STATUS    HW_REGISTER_RW(ARM_BASE+0x444)
> +#define ARM_S_ACKSTOP    0x80000000 /* Bridge stopped */
> +#define ARM_S_READPEND   0x000003FF /* pending reads counter */
> +#define ARM_S_WRITPEND   0x000FFC00 /* pending writes counter */
> +
> +#define ARM_ERRHALT   HW_REGISTER_RW(ARM_BASE+0x448)
> +#define ARM_EH_PERIBURST  0x00000001 /* Burst write seen on peri bus */
> +#define ARM_EH_ILLADDRS1  0x00000002 /* Address bits 25-27 error */
> +#define ARM_EH_ILLADDRS2  0x00000004 /* Address bits 31-28 error */
> +#define ARM_EH_VPU0HALT   0x00000008 /* VPU0 halted & in debug mode */
> +#define ARM_EH_VPU1HALT   0x00000010 /* VPU1 halted & in debug mode */
> +#define ARM_EH_ARMHALT    0x00000020 /* ARM in halted debug mode */
> +
> +#define ARM_ID_SECURE HW_REGISTER_RW(ARM_BASE+0x00C)
> +#define ARM_ID        HW_REGISTER_RW(ARM_BASE+0x44C)
> +#define ARM_IDVAL        0x364D5241
> +
> +/* Translation memory */
> +#define ARM_TRANSLATE HW_REGISTER_RW(ARM_BASE+0x100)
> +/* 32 locations: 0x100.. 0x17F */
> +/* 32 spare means we CAN go to 64 pages.... */
> +
> +
> +/* Interrupts */
> +#define ARM_IRQ_PEND0 HW_REGISTER_RW(ARM_BASE+0x200)        /* Top IRQ bits */
> +#define ARM_I0_TIMER    0x00000001 /* timer IRQ */
> +#define ARM_I0_MAIL     0x00000002 /* Mail IRQ */
> +#define ARM_I0_BELL0    0x00000004 /* Doorbell 0 */
> +#define ARM_I0_BELL1    0x00000008 /* Doorbell 1 */
> +#define ARM_I0_BANK1    0x00000100 /* Bank1 IRQ */
> +#define ARM_I0_BANK2    0x00000200 /* Bank2 IRQ */
> +
> +#define ARM_IRQ_PEND1 HW_REGISTER_RW(ARM_BASE+0x204) /* All bank1 IRQ bits */
> +/* todo: all I1_interrupt sources */
> +#define ARM_IRQ_PEND2 HW_REGISTER_RW(ARM_BASE+0x208) /* All bank2 IRQ bits */
> +/* todo: all I2_interrupt sources */
> +
> +#define ARM_IRQ_FAST  HW_REGISTER_RW(ARM_BASE+0x20C) /* FIQ control */
> +#define ARM_IF_INDEX    0x0000007F     /* FIQ select */
> +#define ARM_IF_ENABLE   0x00000080     /* FIQ enable */
> +#define ARM_IF_VCMASK   0x0000003F     /* FIQ = (index from VC source) */
> +#define ARM_IF_TIMER    0x00000040     /* FIQ = ARM timer */
> +#define ARM_IF_MAIL     0x00000041     /* FIQ = ARM Mail */
> +#define ARM_IF_BELL0    0x00000042     /* FIQ = ARM Doorbell 0 */
> +#define ARM_IF_BELL1    0x00000043     /* FIQ = ARM Doorbell 1 */
> +#define ARM_IF_VP0HALT  0x00000044     /* FIQ = VPU0 Halt seen */
> +#define ARM_IF_VP1HALT  0x00000045     /* FIQ = VPU1 Halt seen */
> +#define ARM_IF_ILLEGAL  0x00000046     /* FIQ = Illegal access seen */
> +
> +#define ARM_IRQ_ENBL1 HW_REGISTER_RW(ARM_BASE+0x210) /* Bank1 enable bits */
> +#define ARM_IRQ_ENBL2 HW_REGISTER_RW(ARM_BASE+0x214) /* Bank2 enable bits */
> +#define ARM_IRQ_ENBL3 HW_REGISTER_RW(ARM_BASE+0x218) /* ARM irqs enable bits */
> +#define ARM_IRQ_DIBL1 HW_REGISTER_RW(ARM_BASE+0x21C) /* Bank1 disable bits */
> +#define ARM_IRQ_DIBL2 HW_REGISTER_RW(ARM_BASE+0x220) /* Bank2 disable bits */
> +#define ARM_IRQ_DIBL3 HW_REGISTER_RW(ARM_BASE+0x224) /* ARM irqs disable bits */
> +#define ARM_IE_TIMER    0x00000001     /* Timer IRQ */
> +#define ARM_IE_MAIL     0x00000002     /* Mail IRQ */
> +#define ARM_IE_BELL0    0x00000004     /* Doorbell 0 */
> +#define ARM_IE_BELL1    0x00000008     /* Doorbell 1 */
> +#define ARM_IE_VP0HALT  0x00000010     /* VPU0 Halt */
> +#define ARM_IE_VP1HALT  0x00000020     /* VPU1 Halt */
> +#define ARM_IE_ILLEGAL  0x00000040     /* Illegal access seen */
> +
> +/* Timer */
> +/* For reg. fields see sp804 spec. */
> +#define ARM_T_LOAD    HW_REGISTER_RW(ARM_BASE+0x400)
> +#define ARM_T_VALUE   HW_REGISTER_RW(ARM_BASE+0x404)
> +#define ARM_T_CONTROL HW_REGISTER_RW(ARM_BASE+0x408)
> +#define ARM_T_IRQCNTL HW_REGISTER_RW(ARM_BASE+0x40C)
> +#define ARM_T_RAWIRQ  HW_REGISTER_RW(ARM_BASE+0x410)
> +#define ARM_T_MSKIRQ  HW_REGISTER_RW(ARM_BASE+0x414)
> +#define ARM_T_RELOAD  HW_REGISTER_RW(ARM_BASE+0x418)
> +#define ARM_T_PREDIV  HW_REGISTER_RW(ARM_BASE+0x41c)
> +#define ARM_T_FREECNT HW_REGISTER_RW(ARM_BASE+0x420)
> +
> +#define TIMER_CTRL_ONESHOT  (1 << 0)
> +#define TIMER_CTRL_32BIT    (1 << 1)
> +#define TIMER_CTRL_DIV1     (0 << 2)
> +#define TIMER_CTRL_DIV16    (1 << 2)
> +#define TIMER_CTRL_DIV256   (2 << 2)
> +#define TIMER_CTRL_IE       (1 << 5)
> +#define TIMER_CTRL_PERIODIC (1 << 6)
> +#define TIMER_CTRL_ENABLE   (1 << 7)
> +#define TIMER_CTRL_DBGHALT  (1 << 8)
> +#define TIMER_CTRL_ENAFREE  (1 << 9)
> +#define TIMER_CTRL_FREEDIV_SHIFT 16)
> +#define TIMER_CTRL_FREEDIV_MASK  0xff
> +
> +/* Semaphores, Doorbells, Mailboxes */
> +#define ARM_SBM_OWN0  (ARM_BASE+0x800)
> +#define ARM_SBM_OWN1  (ARM_BASE+0x900)
> +#define ARM_SBM_OWN2  (ARM_BASE+0xA00)
> +#define ARM_SBM_OWN3  (ARM_BASE+0xB00)
> +
> +/* MAILBOXES
> + * Register flags are common across all
> + * owner registers. See end of this section
> + *
> + * Semaphores, Doorbells, Mailboxes Owner 0
> + *
> + */
> +
> +#define ARM_0_SEMS       HW_REGISTER_RW(ARM_SBM_OWN0+0x00)
> +#define ARM_0_SEM0       HW_REGISTER_RW(ARM_SBM_OWN0+0x00)
> +#define ARM_0_SEM1       HW_REGISTER_RW(ARM_SBM_OWN0+0x04)
> +#define ARM_0_SEM2       HW_REGISTER_RW(ARM_SBM_OWN0+0x08)
> +#define ARM_0_SEM3       HW_REGISTER_RW(ARM_SBM_OWN0+0x0C)
> +#define ARM_0_SEM4       HW_REGISTER_RW(ARM_SBM_OWN0+0x10)
> +#define ARM_0_SEM5       HW_REGISTER_RW(ARM_SBM_OWN0+0x14)
> +#define ARM_0_SEM6       HW_REGISTER_RW(ARM_SBM_OWN0+0x18)
> +#define ARM_0_SEM7       HW_REGISTER_RW(ARM_SBM_OWN0+0x1C)

When you have a regular structure like this, you should collapse it
down using some arithmatic:

#define ARM_0_SEM(x) HW_REGISTER_RW(ARM_SBM_OWN0 + 0x4 * (x))

> +#define ARM_0_BELL0      HW_REGISTER_RW(ARM_SBM_OWN0+0x40)
> +#define ARM_0_BELL1      HW_REGISTER_RW(ARM_SBM_OWN0+0x44)
> +#define ARM_0_BELL2      HW_REGISTER_RW(ARM_SBM_OWN0+0x48)
> +#define ARM_0_BELL3      HW_REGISTER_RW(ARM_SBM_OWN0+0x4C)

Here as well.

> +/* MAILBOX 0 access in Owner 0 area */
> +/* Some addresses should ONLY be used by owner 0 */
> +#define ARM_0_MAIL0_WRT \
> +        HW_REGISTER_RW(ARM_SBM_OWN0+0x80)  /* .. 0x8C (4 locations) */
> +#define ARM_0_MAIL0_RD \
> +        HW_REGISTER_RW(ARM_SBM_OWN0+0x80)  /* .. 0x8C (4 locs) Normal read */
> +#define ARM_0_MAIL0_POL \
> +        HW_REGISTER_RW(ARM_SBM_OWN0+0x90)  /* none-pop read */
> +#define ARM_0_MAIL0_SND \
> +        HW_REGISTER_RW(ARM_SBM_OWN0+0x94)  /* Sender read (only LS 2 bits) */
> +#define ARM_0_MAIL0_STA \
> +        HW_REGISTER_RW(ARM_SBM_OWN0+0x98)  /* Status read */
> +#define ARM_0_MAIL0_CNF \
> +        HW_REGISTER_RW(ARM_SBM_OWN0+0x9C)  /* Config read/write */
> +/* MAILBOX 1 access in Owner 0 area */
> +/* Owner 0 should only WRITE to this mailbox */
> +#define ARM_0_MAIL1_WRT \
> +        HW_REGISTER_RW(ARM_SBM_OWN0+0xA0)   /* .. 0xAC (4 locations) */
> +/*#define ARM_0_MAIL1_RD \
> +        HW_REGISTER_RW(ARM_SBM_OWN0+0xA0) */ /* DO NOT USE THIS !!!!! */
> +/*#define ARM_0_MAIL1_POL \
> +        HW_REGISTER_RW(ARM_SBM_OWN0+0xB0) */ /* DO NOT USE THIS !!!!! */
> +/*#define ARM_0_MAIL1_SND \
> +        HW_REGISTER_RW(ARM_SBM_OWN0+0xB4) */ /* DO NOT USE THIS !!!!! */
> +#define ARM_0_MAIL1_STA \
> +        HW_REGISTER_RW(ARM_SBM_OWN0+0xB8)   /* Status read */
> +/*#define ARM_0_MAIL1_CNF \
> +        HW_REGISTER_RW(ARM_SBM_OWN0+0xBC) */ /* DO NOT USE THIS !!!!! */
> +/* General SEM, BELL, MAIL config/status */
> +#define ARM_0_SEMCLRDBG \
> +        HW_REGISTER_RW(ARM_SBM_OWN0+0xE0)  /* semaphore clear/debug register */
> +#define ARM_0_BELLCLRDBG \
> +        HW_REGISTER_RW(ARM_SBM_OWN0+0xE4)  /* Doorbells clear/debug register */
> +#define ARM_0_ALL_IRQS \
> +        HW_REGISTER_RW(ARM_SBM_OWN0+0xF8)  /* ALL interrupts */
> +#define ARM_0_MY_IRQS \
> +        HW_REGISTER_RW(ARM_SBM_OWN0+0xFC)  /* IRQS pending for owner 0 */
> +
> +/* Semaphores, Doorbells, Mailboxes Owner 1 */
> +#define ARM_1_SEMS       HW_REGISTER_RW(ARM_SBM_OWN1+0x00)
> +#define ARM_1_SEM0       HW_REGISTER_RW(ARM_SBM_OWN1+0x00)
> +#define ARM_1_SEM1       HW_REGISTER_RW(ARM_SBM_OWN1+0x04)
> +#define ARM_1_SEM2       HW_REGISTER_RW(ARM_SBM_OWN1+0x08)
> +#define ARM_1_SEM3       HW_REGISTER_RW(ARM_SBM_OWN1+0x0C)
> +#define ARM_1_SEM4       HW_REGISTER_RW(ARM_SBM_OWN1+0x10)
> +#define ARM_1_SEM5       HW_REGISTER_RW(ARM_SBM_OWN1+0x14)
> +#define ARM_1_SEM6       HW_REGISTER_RW(ARM_SBM_OWN1+0x18)
> +#define ARM_1_SEM7       HW_REGISTER_RW(ARM_SBM_OWN1+0x1C)
> +#define ARM_1_BELL0      HW_REGISTER_RW(ARM_SBM_OWN1+0x40)
> +#define ARM_1_BELL1      HW_REGISTER_RW(ARM_SBM_OWN1+0x44)
> +#define ARM_1_BELL2      HW_REGISTER_RW(ARM_SBM_OWN1+0x48)
> +#define ARM_1_BELL3      HW_REGISTER_RW(ARM_SBM_OWN1+0x4C)

You have large repeitition between ARM_0 and ARM_1, should also be
collapased using Macros args. It is however generally rare to need to
have the individual defs for each window of a regular structure, as
the switch case logic that implements the functionality, is also
usually regular and just uses math on addresses to figure out what to
index, rather than fully defining the address map.

> +/* MAILBOX 0 access in Owner 0 area */
> +/* Owner 1 should only WRITE to this mailbox */
> +#define ARM_1_MAIL0_WRT \
> +        HW_REGISTER_RW(ARM_SBM_OWN1+0x80)  /* .. 0x8C (4 locations) */
> +/*#define ARM_1_MAIL0_RD \
> +        HW_REGISTER_RW(ARM_SBM_OWN1+0x80) */ /* DO NOT USE THIS !!!!! */
> +/*#define ARM_1_MAIL0_POL \
> +        HW_REGISTER_RW(ARM_SBM_OWN1+0x90) */ /* DO NOT USE THIS !!!!! */
> +/*#define ARM_1_MAIL0_SND \
> +        HW_REGISTER_RW(ARM_SBM_OWN1+0x94) */ /* DO NOT USE THIS !!!!! */
> +#define ARM_1_MAIL0_STA \
> +        HW_REGISTER_RW(ARM_SBM_OWN1+0x98)  /* Status read */
> +/*#define ARM_1_MAIL0_CNF \
> +        HW_REGISTER_RW(ARM_SBM_OWN1+0x9C) */ /* DO NOT USE THIS !!!!! */
> +/* MAILBOX 1 access in Owner 0 area */
> +#define ARM_1_MAIL1_WRT \
> +        HW_REGISTER_RW(ARM_SBM_OWN1+0xA0)  /* .. 0xAC (4 locations) */
> +#define ARM_1_MAIL1_RD \
> +        HW_REGISTER_RW(ARM_SBM_OWN1+0xA0)  /* .. 0xAC (4 locs) Normal read */
> +#define ARM_1_MAIL1_POL \
> +        HW_REGISTER_RW(ARM_SBM_OWN1+0xB0)  /* none-pop read */
> +#define ARM_1_MAIL1_SND \
> +        HW_REGISTER_RW(ARM_SBM_OWN1+0xB4)  /* Sender read (only LS 2 bits) */
> +#define ARM_1_MAIL1_STA \
> +        HW_REGISTER_RW(ARM_SBM_OWN1+0xB8)  /* Status read */
> +#define ARM_1_MAIL1_CNF \
> +        HW_REGISTER_RW(ARM_SBM_OWN1+0xBC)
> +/* General SEM, BELL, MAIL config/status */
> +#define ARM_1_SEMCLRDBG \
> +        HW_REGISTER_RW(ARM_SBM_OWN1+0xE0)  /* semaphore clear/debug register */
> +#define ARM_1_BELLCLRDBG \
> +        HW_REGISTER_RW(ARM_SBM_OWN1+0xE4)  /* Doorbells clear/debug register */
> +#define ARM_1_MY_IRQS \
> +        HW_REGISTER_RW(ARM_SBM_OWN1+0xFC)  /* IRQS pending for owner 1 */
> +#define ARM_1_ALL_IRQS \
> +        HW_REGISTER_RW(ARM_SBM_OWN1+0xF8)  /* ALL interrupts */
> +
> +/* Semaphores, Doorbells, Mailboxes Owner 2 */
> +#define ARM_2_SEMS       HW_REGISTER_RW(ARM_SBM_OWN2+0x00)
> +#define ARM_2_SEM0       HW_REGISTER_RW(ARM_SBM_OWN2+0x00)
> +#define ARM_2_SEM1       HW_REGISTER_RW(ARM_SBM_OWN2+0x04)
> +#define ARM_2_SEM2       HW_REGISTER_RW(ARM_SBM_OWN2+0x08)
> +#define ARM_2_SEM3       HW_REGISTER_RW(ARM_SBM_OWN2+0x0C)
> +#define ARM_2_SEM4       HW_REGISTER_RW(ARM_SBM_OWN2+0x10)
> +#define ARM_2_SEM5       HW_REGISTER_RW(ARM_SBM_OWN2+0x14)
> +#define ARM_2_SEM6       HW_REGISTER_RW(ARM_SBM_OWN2+0x18)
> +#define ARM_2_SEM7       HW_REGISTER_RW(ARM_SBM_OWN2+0x1C)
> +#define ARM_2_BELL0      HW_REGISTER_RW(ARM_SBM_OWN2+0x40)
> +#define ARM_2_BELL1      HW_REGISTER_RW(ARM_SBM_OWN2+0x44)
> +#define ARM_2_BELL2      HW_REGISTER_RW(ARM_SBM_OWN2+0x48)
> +#define ARM_2_BELL3      HW_REGISTER_RW(ARM_SBM_OWN2+0x4C)
> +/* MAILBOX 0 access in Owner 2 area */
> +/* Owner 2 should only WRITE to this mailbox */
> +#define ARM_2_MAIL0_WRT \
> +        HW_REGISTER_RW(ARM_SBM_OWN2+0x80)   /* .. 0x8C (4 locations) */
> +/*#define ARM_2_MAIL0_RD \
> +        HW_REGISTER_RW(ARM_SBM_OWN2+0x80)  */ /* DO NOT USE THIS !!!!! */
> +/*#define ARM_2_MAIL0_POL \
> +        HW_REGISTER_RW(ARM_SBM_OWN2+0x90)  */ /* DO NOT USE THIS !!!!! */
> +/*#define ARM_2_MAIL0_SND \
> +        HW_REGISTER_RW(ARM_SBM_OWN2+0x94)  */ /* DO NOT USE THIS !!!!! */
> +#define ARM_2_MAIL0_STA \
> +        HW_REGISTER_RW(ARM_SBM_OWN2+0x98)   /* Status read */
> +/*#define ARM_2_MAIL0_CNF \
> +        HW_REGISTER_RW(ARM_SBM_OWN2+0x9C)  */ /* DO NOT USE THIS !!!!! */
> +/* MAILBOX 1 access in Owner 2 area */
> +/* Owner 2 should only WRITE to this mailbox */
> +#define ARM_2_MAIL1_WRT \
> +        HW_REGISTER_RW(ARM_SBM_OWN2+0xA0)   /* .. 0xAC (4 locations) */
> +/*#define ARM_2_MAIL1_RD \
> +        HW_REGISTER_RW(ARM_SBM_OWN2+0xA0) */ /* DO NOT USE THIS !!!!! */
> +/*#define ARM_2_MAIL1_POL \
> +        HW_REGISTER_RW(ARM_SBM_OWN2+0xB0) */ /* DO NOT USE THIS !!!!! */
> +/*#define ARM_2_MAIL1_SND \
> +        HW_REGISTER_RW(ARM_SBM_OWN2+0xB4) */ /* DO NOT USE THIS !!!!! */
> +#define ARM_2_MAIL1_STA \
> +        HW_REGISTER_RW(ARM_SBM_OWN2+0xB8)   /* Status read */
> +/*#define ARM_2_MAIL1_CNF \
> +        HW_REGISTER_RW(ARM_SBM_OWN2+0xBC) */ /* DO NOT USE THIS !!!!! */
> +/* General SEM, BELL, MAIL config/status */
> +#define ARM_2_SEMCLRDBG \
> +        HW_REGISTER_RW(ARM_SBM_OWN2+0xE0)  /* semaphore clear/debug register */
> +#define ARM_2_BELLCLRDBG \
> +        HW_REGISTER_RW(ARM_SBM_OWN2+0xE4)  /* Doorbells clear/debug register */
> +#define ARM_2_MY_IRQS \
> +        HW_REGISTER_RW(ARM_SBM_OWN2+0xFC)  /* IRQS pending for owner 2 */
> +#define ARM_2_ALL_IRQS \
> +        HW_REGISTER_RW(ARM_SBM_OWN2+0xF8)  /* ALL interrupts */
> +
> +/* Semaphores, Doorbells, Mailboxes Owner 3 */
> +#define ARM_3_SEMS       HW_REGISTER_RW(ARM_SBM_OWN3+0x00)
> +#define ARM_3_SEM0       HW_REGISTER_RW(ARM_SBM_OWN3+0x00)
> +#define ARM_3_SEM1       HW_REGISTER_RW(ARM_SBM_OWN3+0x04)
> +#define ARM_3_SEM2       HW_REGISTER_RW(ARM_SBM_OWN3+0x08)
> +#define ARM_3_SEM3       HW_REGISTER_RW(ARM_SBM_OWN3+0x0C)
> +#define ARM_3_SEM4       HW_REGISTER_RW(ARM_SBM_OWN3+0x10)
> +#define ARM_3_SEM5       HW_REGISTER_RW(ARM_SBM_OWN3+0x14)
> +#define ARM_3_SEM6       HW_REGISTER_RW(ARM_SBM_OWN3+0x18)
> +#define ARM_3_SEM7       HW_REGISTER_RW(ARM_SBM_OWN3+0x1C)
> +#define ARM_3_BELL0      HW_REGISTER_RW(ARM_SBM_OWN3+0x40)
> +#define ARM_3_BELL1      HW_REGISTER_RW(ARM_SBM_OWN3+0x44)
> +#define ARM_3_BELL2      HW_REGISTER_RW(ARM_SBM_OWN3+0x48)
> +#define ARM_3_BELL3      HW_REGISTER_RW(ARM_SBM_OWN3+0x4C)
> +/* MAILBOX 0 access in Owner 3 area */
> +/* Owner 3 should only WRITE to this mailbox */
> +#define ARM_3_MAIL0_WRT \
> +        HW_REGISTER_RW(ARM_SBM_OWN3+0x80)   /* .. 0x8C (4 locations) */
> +/*#define ARM_3_MAIL0_RD \
> +        HW_REGISTER_RW(ARM_SBM_OWN3+0x80)  */ /* DO NOT USE THIS !!!!! */
> +/*#define ARM_3_MAIL0_POL \
> +        HW_REGISTER_RW(ARM_SBM_OWN3+0x90)  */ /* DO NOT USE THIS !!!!! */
> +/*#define ARM_3_MAIL0_SND \
> +        HW_REGISTER_RW(ARM_SBM_OWN3+0x94)  */ /* DO NOT USE THIS !!!!! */
> +#define ARM_3_MAIL0_STA \
> +        HW_REGISTER_RW(ARM_SBM_OWN3+0x98)    /* Status read */
> +/*#define ARM_3_MAIL0_CNF \
> +        HW_REGISTER_RW(ARM_SBM_OWN3+0x9C)  */ /* DO NOT USE THIS !!!!! */
> +/* MAILBOX 1 access in Owner 3 area */
> +/* Owner 3 should only WRITE to this mailbox */
> +#define ARM_3_MAIL1_WRT \
> +        HW_REGISTER_RW(ARM_SBM_OWN3+0xA0)   /* .. 0xAC (4 locations) */
> +/*#define ARM_3_MAIL1_RD \
> +        HW_REGISTER_RW(ARM_SBM_OWN3+0xA0) */ /* DO NOT USE THIS !!!!! */
> +/*#define ARM_3_MAIL1_POL \
> +        HW_REGISTER_RW(ARM_SBM_OWN3+0xB0) */ /* DO NOT USE THIS !!!!! */
> +/*#define ARM_3_MAIL1_SND \
> +        HW_REGISTER_RW(ARM_SBM_OWN3+0xB4) */ /* DO NOT USE THIS !!!!! */
> +#define ARM_3_MAIL1_STA \
> +        HW_REGISTER_RW(ARM_SBM_OWN3+0xB8)   /* Status read */
> +/*#define ARM_3_MAIL1_CNF \
> +        HW_REGISTER_RW(ARM_SBM_OWN3+0xBC) */ /* DO NOT USE THIS !!!!! */
> +/* General SEM, BELL, MAIL config/status */
> +#define ARM_3_SEMCLRDBG \
> +        HW_REGISTER_RW(ARM_SBM_OWN3+0xE0)  /* semaphore clear/debug register */
> +#define ARM_3_BELLCLRDBG \
> +        HW_REGISTER_RW(ARM_SBM_OWN3+0xE4)  /* Doorbells clear/debug register */
> +#define ARM_3_MY_IRQS \
> +        HW_REGISTER_RW(ARM_SBM_OWN3+0xFC)  /* IRQS pending for owner 3 */
> +#define ARM_3_ALL_IRQS \
> +        HW_REGISTER_RW(ARM_SBM_OWN3+0xF8)  /* ALL interrupts */
> +
> +/*  Mailbox flags. Valid for all owners */
> +
> +/* Mailbox status register (...0x98) */
> +#define ARM_MS_FULL       0x80000000
> +#define ARM_MS_EMPTY      0x40000000
> +#define ARM_MS_LEVEL      0x400000FF /* Max. value depends on mailbox depth */
> +
> +/* MAILBOX config/status register (...0x9C) */
> +/* ANY write to this register clears the error bits! */
> +#define ARM_MC_IHAVEDATAIRQEN    0x00000001 /* mbox irq enable:  has data */
> +#define ARM_MC_IHAVESPACEIRQEN   0x00000002 /* mbox irq enable:  has space */
> +#define ARM_MC_OPPISEMPTYIRQEN   0x00000004 /* mbox irq enable: Opp is empty */
> +#define ARM_MC_MAIL_CLEAR        0x00000008 /* mbox clear write 1, then  0 */
> +#define ARM_MC_IHAVEDATAIRQPEND  0x00000010 /* mbox irq pending:  has space */
> +#define ARM_MC_IHAVESPACEIRQPEND 0x00000020 /* mbox irq pending: Opp is empty */
> +#define ARM_MC_OPPISEMPTYIRQPEND 0x00000040 /* mbox irq pending */
> +/* Bit 7 is unused */
> +#define ARM_MC_ERRNOOWN   0x00000100 /* error : none owner read from mailbox */
> +#define ARM_MC_ERROVERFLW 0x00000200 /* error : write to fill mailbox */
> +#define ARM_MC_ERRUNDRFLW 0x00000400 /* error : read from empty mailbox */
> +
> +/* Semaphore clear/debug register (...0xE0) */
> +#define ARM_SD_OWN0      0x00000003  /* Owner of sem 0 */
> +#define ARM_SD_OWN1      0x0000000C  /* Owner of sem 1 */
> +#define ARM_SD_OWN2      0x00000030  /* Owner of sem 2 */
> +#define ARM_SD_OWN3      0x000000C0  /* Owner of sem 3 */
> +#define ARM_SD_OWN4      0x00000300  /* Owner of sem 4 */
> +#define ARM_SD_OWN5      0x00000C00  /* Owner of sem 5 */
> +#define ARM_SD_OWN6      0x00003000  /* Owner of sem 6 */
> +#define ARM_SD_OWN7      0x0000C000  /* Owner of sem 7 */

Regular structure.

> +#define ARM_SD_SEM0      0x00010000  /* Status of sem 0 */
> +#define ARM_SD_SEM1      0x00020000  /* Status of sem 1 */
> +#define ARM_SD_SEM2      0x00040000  /* Status of sem 2 */
> +#define ARM_SD_SEM3      0x00080000  /* Status of sem 3 */
> +#define ARM_SD_SEM4      0x00100000  /* Status of sem 4 */
> +#define ARM_SD_SEM5      0x00200000  /* Status of sem 5 */
> +#define ARM_SD_SEM6      0x00400000  /* Status of sem 6 */
> +#define ARM_SD_SEM7      0x00800000  /* Status of sem 7 */
> +

Regular structure. More below.

> +/* Doorbells clear/debug register (...0xE4) */
> +#define ARM_BD_OWN0      0x00000003  /* Owner of doorbell 0 */
> +#define ARM_BD_OWN1      0x0000000C  /* Owner of doorbell 1 */
> +#define ARM_BD_OWN2      0x00000030  /* Owner of doorbell 2 */
> +#define ARM_BD_OWN3      0x000000C0  /* Owner of doorbell 3 */
> +#define ARM_BD_BELL0     0x00000100  /* Status of doorbell 0 */
> +#define ARM_BD_BELL1     0x00000200  /* Status of doorbell 1 */
> +#define ARM_BD_BELL2     0x00000400  /* Status of doorbell 2 */
> +#define ARM_BD_BELL3     0x00000800  /* Status of doorbell 3 */
> +
> +/* MY IRQS register (...0xF8) */
> +#define ARM_MYIRQ_BELL   0x00000001  /* This owner has a doorbell IRQ */
> +#define ARM_MYIRQ_MAIL   0x00000002  /* This owner has a mailbox  IRQ */
> +
> +/* ALL IRQS register (...0xF8) */
> +#define ARM_AIS_BELL0 0x00000001  /* Doorbell 0 IRQ pending */
> +#define ARM_AIS_BELL1 0x00000002  /* Doorbell 1 IRQ pending */
> +#define ARM_AIS_BELL2 0x00000004  /* Doorbell 2 IRQ pending */
> +#define ARM_AIS_BELL3 0x00000008  /* Doorbell 3 IRQ pending */
> +#define ARM_AIS0_HAVEDATA 0x00000010  /* MAIL 0 has data IRQ pending */
> +#define ARM_AIS0_HAVESPAC 0x00000020  /* MAIL 0 has space IRQ pending */
> +#define ARM_AIS0_OPPEMPTY 0x00000040  /* MAIL 0 opposite is empty IRQ */
> +#define ARM_AIS1_HAVEDATA 0x00000080  /* MAIL 1 has data IRQ pending */
> +#define ARM_AIS1_HAVESPAC 0x00000100  /* MAIL 1 has space IRQ pending */
> +#define ARM_AIS1_OPPEMPTY 0x00000200  /* MAIL 1 opposite is empty IRQ */
> +/* Note   that bell-0, bell-1 and MAIL0 IRQ go only to the ARM */
> +/* Whilst that bell-2, bell-3 and MAIL1 IRQ go only to the VC */
> +/* */
> +/* ARM JTAG BASH */
> +/* */
> +#define AJB_BASE 0x7e2000c0
> +
> +#define AJBCONF HW_REGISTER_RW(AJB_BASE+0x00)
> +#define   AJB_BITS0    0x000000
> +#define   AJB_BITS4    0x000004
> +#define   AJB_BITS8    0x000008
> +#define   AJB_BITS12   0x00000C
> +#define   AJB_BITS16   0x000010
> +#define   AJB_BITS20   0x000014
> +#define   AJB_BITS24   0x000018
> +#define   AJB_BITS28   0x00001C
> +#define   AJB_BITS32   0x000020
> +#define   AJB_BITS34   0x000022
> +#define   AJB_OUT_MS   0x000040
> +#define   AJB_OUT_LS   0x000000
> +#define   AJB_INV_CLK  0x000080
> +#define   AJB_D0_RISE  0x000100
> +#define   AJB_D0_FALL  0x000000
> +#define   AJB_D1_RISE  0x000200
> +#define   AJB_D1_FALL  0x000000
> +#define   AJB_IN_RISE  0x000400
> +#define   AJB_IN_FALL  0x000000
> +#define   AJB_ENABLE   0x000800
> +#define   AJB_HOLD0    0x000000
> +#define   AJB_HOLD1    0x001000
> +#define   AJB_HOLD2    0x002000
> +#define   AJB_HOLD3    0x003000
> +#define   AJB_RESETN   0x004000
> +#define   AJB_CLKSHFT  16
> +#define   AJB_BUSY     0x80000000
> +#define AJBTMS HW_REGISTER_RW(AJB_BASE+0x04)
> +#define AJBTDI HW_REGISTER_RW(AJB_BASE+0x08)
> +#define AJBTDO HW_REGISTER_RW(AJB_BASE+0x0c)
> +
> +#endif
> diff --git a/include/hw/arm/bcm2835_mbox.h b/include/hw/arm/bcm2835_mbox.h
> new file mode 100644
> index 0000000..78ab814
> --- /dev/null
> +++ b/include/hw/arm/bcm2835_mbox.h
> @@ -0,0 +1,19 @@
> +/*
> + * Raspberry Pi emulation (c) 2012 Gregory Estrade
> + * This code is licensed under the GNU GPLv2 and later.
> + */
> +
> +#ifndef BCM2835_MBOX_H
> +#define BCM2835_MBOX_H
> +
> +/* Constants shared with the ARM identifying separate mailbox channels */
> +#define MBOX_CHAN_POWER    0 /* for use by the power management interface */
> +#define MBOX_CHAN_FB       1 /* for use by the frame buffer */
> +#define MBOX_CHAN_VCHIQ    3 /* for use by the VCHIQ interface */
> +#define MBOX_CHAN_PROPERTY 8 /* for use by the property channel */
> +#define MBOX_CHAN_COUNT    9
> +
> +#define MBOX_SIZE          32
> +#define MBOX_INVALID_DATA  0x0f
> +
> +#endif /* BCM2835_MBOX_H */
> diff --git a/include/hw/misc/bcm2835_sbm.h b/include/hw/misc/bcm2835_sbm.h
> new file mode 100644
> index 0000000..da36fbe
> --- /dev/null
> +++ b/include/hw/misc/bcm2835_sbm.h
> @@ -0,0 +1,37 @@
> +/*
> + * Raspberry Pi emulation (c) 2012 Gregory Estrade
> + * This code is licensed under the GNU GPLv2 and later.
> + */
> +
> +#ifndef BCM2835_SBM_H
> +#define BCM2835_SBM_H
> +
> +#include "hw/sysbus.h"
> +#include "exec/address-spaces.h"
> +#include "hw/arm/bcm2835_mbox.h"
> +
> +#define TYPE_BCM2835_SBM "bcm2835_sbm"
> +#define BCM2835_SBM(obj) \
> +        OBJECT_CHECK(BCM2835SbmState, (obj), TYPE_BCM2835_SBM)
> +
> +typedef struct {
> +    MemoryRegion *mbox_mr;
> +    AddressSpace mbox_as;

I can't see where these two fields are used. A quick scan shows that
the SbmState's copy is uses for all DMA ops. If these are needed,
mbox_init should pass a pointer to the the SbmState then this saves
the pointer and navigates as needed back to the container structure to
get the AS.

> +    uint32_t reg[MBOX_SIZE];
> +    int count;
> +    uint32_t status;
> +    uint32_t config;
> +} BCM2835Mbox;
> +
> +typedef struct {

/*< private >*/

> +    SysBusDevice busdev;

/*< public >*/

Regards,
Peter

> +    MemoryRegion *mbox_mr;
> +    AddressSpace mbox_as;
> +    MemoryRegion iomem;
> +    int mbox_irq_disabled;
> +    qemu_irq arm_irq;
> +    int available[MBOX_CHAN_COUNT];
> +    BCM2835Mbox mbox[2];
> +} BCM2835SbmState;
> +
> +#endif
> --
> 2.5.3
>
