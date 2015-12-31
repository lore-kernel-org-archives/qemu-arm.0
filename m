Received: by 10.182.158.201 with SMTP id ww9csp8236959obb;
        Wed, 30 Dec 2015 16:13:19 -0800 (PST)
X-Received: by 10.140.231.137 with SMTP id b131mr70430859qhc.63.1451520799804;
        Wed, 30 Dec 2015 16:13:19 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r71si34863901qha.23.2015.12.30.16.13.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 Dec 2015 16:13:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54172 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aEQrm-0008WO-Ri
	for alex.bennee@linaro.org; Wed, 30 Dec 2015 19:13:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51909)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aEQrR-0008Ec-6w
	for qemu-devel@nongnu.org; Wed, 30 Dec 2015 19:12:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aEQrO-0007bW-RA
	for qemu-devel@nongnu.org; Wed, 30 Dec 2015 19:12:57 -0500
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:33808)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aEQrO-0007b9-Hv; Wed, 30 Dec 2015 19:12:54 -0500
Received: by mail-wm0-x244.google.com with SMTP id b14so8365044wmb.1;
	Wed, 30 Dec 2015 16:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=KNAcbxW3DRX39dcbdO3Uhu1I3EXhc2Mjbrav1PMJsfw=;
	b=vXxwqQNTNsmSP2yA031e9RU8cp/HevylPgmLXpyG3atPHW5hPAgTYZaj5TZIPTUCt1
	WV12Kd6PtAMk6jE7i2TLUvOnlNI4sm8tJhGZm5aC7ypYW7wXRvsYQPtn1fZgTQ8lzILe
	Rzws8/9GG3EkeD6qVSSv+7HnzAZ5dJxGf1BvrWmF5pWwD0h2o81s8wezgzYvcMfgSkFo
	Je2MwAKxqAzOH7wqxBcB2XLFy/F/d7FPqWnUYhIeZ/tlAnZkhWQCCDN2eFCA5VLILtyk
	O2+Dzxbya/4MylBJ8uvZW8LgXpZ8JJywWIpIcwBQ7GxXOo+2YermFaXfu6/NFGaOK6F/
	w7Ww==
MIME-Version: 1.0
X-Received: by 10.28.184.136 with SMTP id i130mr52614454wmf.96.1451520773889; 
	Wed, 30 Dec 2015 16:12:53 -0800 (PST)
Received: by 10.28.91.143 with HTTP; Wed, 30 Dec 2015 16:12:53 -0800 (PST)
In-Reply-To: <1450916731-5968-2-git-send-email-Andrew.Baumann@microsoft.com>
References: <1450916731-5968-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1450916731-5968-2-git-send-email-Andrew.Baumann@microsoft.com>
Date: Wed, 30 Dec 2015 16:12:53 -0800
Message-ID: <CAPokK=q+G=MsgZG0J-H_72VFjPiSbt91ViDd4S-mi_3CLCi_WA@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::244
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v2 1/7] bcm2835_mbox: add BCM2835 mailboxes
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
X-TUID: bwgD/vqLqNeX

On Wed, Dec 23, 2015 at 4:25 PM, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
> This adds the system mailboxes which are used to communicate with a
> number of GPU peripherals on Pi/Pi2.
>
> Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
> ---
>
> Notes:
>     v2:
>      * renamed bcm2835_sbm to bcm2835_mbox
>      * dropped bcm2835_arm_control.h (needed defs moved to bcm2835_mbox.c)
>      * documented use of private address space through defines in bcm2835_mbox_defs.h
>      * remove unused fields from BCM2835Mbox
>      * s/int/bool/ where appropriate
>      * cleaned up logic in _update and _mbox_update_status for clarity/simplicity
>      * added vmstate
>      * misc cleanup
>
>  default-configs/arm-softmmu.mak     |   1 +
>  hw/misc/Makefile.objs               |   1 +
>  hw/misc/bcm2835_mbox.c              | 323 ++++++++++++++++++++++++++++++++++++
>  include/hw/misc/bcm2835_mbox.h      |  37 +++++
>  include/hw/misc/bcm2835_mbox_defs.h |  26 +++
>  5 files changed, 388 insertions(+)
>  create mode 100644 hw/misc/bcm2835_mbox.c
>  create mode 100644 include/hw/misc/bcm2835_mbox.h
>  create mode 100644 include/hw/misc/bcm2835_mbox_defs.h
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
> index aeb6b7d..e36f2ee 100644
> --- a/hw/misc/Makefile.objs
> +++ b/hw/misc/Makefile.objs
> @@ -34,6 +34,7 @@ obj-$(CONFIG_OMAP) += omap_gpmc.o
>  obj-$(CONFIG_OMAP) += omap_l4.o
>  obj-$(CONFIG_OMAP) += omap_sdrc.o
>  obj-$(CONFIG_OMAP) += omap_tap.o
> +obj-$(CONFIG_RASPI) += bcm2835_mbox.o
>  obj-$(CONFIG_SLAVIO) += slavio_misc.o
>  obj-$(CONFIG_ZYNQ) += zynq_slcr.o
>  obj-$(CONFIG_ZYNQ) += zynq-xadc.o
> diff --git a/hw/misc/bcm2835_mbox.c b/hw/misc/bcm2835_mbox.c
> new file mode 100644
> index 0000000..69b8e2a
> --- /dev/null
> +++ b/hw/misc/bcm2835_mbox.c
> @@ -0,0 +1,323 @@
> +/*
> + * Raspberry Pi emulation (c) 2012 Gregory Estrade

Should we change this to "Broadcom SoC emulation"?

> + * This code is licensed under the GNU GPLv2 and later.
> + *
> + * This file models the system mailboxes, which are used for
> + * communication with low-bandwidth GPU peripherals. Refs:
> + *   https://github.com/raspberrypi/firmware/wiki/Mailboxes
> + *   https://github.com/raspberrypi/firmware/wiki/Accessing-mailboxes
> + */
> +
> +#include "hw/misc/bcm2835_mbox.h"
> +
> +/* Mailbox status register (...0x98) */

So the reg offsets could be MACRO defined here to avoid having to to
comment 0x98 (and 0x9c) is two places.

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
> +static void mbox_update_status(BCM2835Mbox *mb)
> +{
> +    mb->status &= ~(ARM_MS_EMPTY | ARM_MS_FULL);
> +    if (mb->count == 0) {
> +        mb->status |= ARM_MS_EMPTY;
> +    } else if (mb->count == MBOX_SIZE) {
> +        mb->status |= ARM_MS_FULL;
> +    }
> +}
> +
> +static void mbox_init(BCM2835Mbox *mb)

mbox_reset

> +{
> +    int n;
> +
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

mbox_update can call mbox_push with val == a DMA value, which usually
suggests that this may be a guest controllable (and a guest error
rather than an assert). Is the mbox AS guest accessible? (I had a look
at the later patches, and the MBox AS seems private but can values be
set via the guest indirectly?).

> +    mb->reg[mb->count++] = val;
> +    mbox_update_status(mb);
> +}
> +
> +static void bcm2835_mbox_update(BCM2835MboxState *s)
> +{
> +    uint32_t value;
> +    bool set;
> +    int n;
> +
> +    /* Avoid unwanted recursive calls */

You should really only need to comment this idea the once. The one
below is more informative so you can drop this.

> +    s->mbox_irq_disabled = true;
> +
> +    /* Get pending responses and put them in the vc->arm mbox,
> +     * as long as it's not full */
> +    for (n = 0; n < MBOX_CHAN_COUNT; n++) {
> +        while (s->available[n] && !(s->mbox[0].status & ARM_MS_FULL)) {
> +            value = ldl_phys(&s->mbox_as, n << MBOX_AS_CHAN_SHIFT);
> +            if (value == MBOX_INVALID_DATA) {
> +                /* Interrupt pending, but there's no data. Hmmm... */
> +                hw_error("%s: spurious interrupt on channel %d", __func__, n);

hw_error should be avoided, it should be an assert for something if
this is a QEMU code error, or LOG_GUEST_ERROR or LOG_UNIMP.

> +            }
> +            mbox_push(&s->mbox[0], value);
> +        }
> +    }
> +
> +    /* Try to push pending requests from the arm->vc mbox */
> +    /* TODO (?) */
> +
> +    /* Re-enable calls from the IRQ routine */
> +    s->mbox_irq_disabled = false;
> +
> +    /* Update ARM IRQ status */
> +    set = false;
> +    s->mbox[0].config &= ~ARM_MC_IHAVEDATAIRQPEND;
> +    if (!(s->mbox[0].status & ARM_MS_EMPTY)) {
> +        s->mbox[0].config |= ARM_MC_IHAVEDATAIRQPEND;
> +        if (s->mbox[0].config & ARM_MC_IHAVEDATAIRQEN) {
> +            set = true;
> +        }
> +    }
> +    qemu_set_irq(s->arm_irq, set);
> +}
> +
> +static void bcm2835_mbox_set_irq(void *opaque, int irq, int level)
> +{
> +    BCM2835MboxState *s = opaque;
> +
> +    s->available[irq] = level;
> +
> +    /* avoid recursively calling bcm2835_mbox_update when the interrupt
> +     * status changes due to the ldl_phys call within that function */

Space before */

> +    if (!s->mbox_irq_disabled) {
> +        bcm2835_mbox_update(s);
> +    }
> +}
> +
> +static uint64_t bcm2835_mbox_read(void *opaque, hwaddr offset, unsigned size)
> +{
> +    BCM2835MboxState *s = opaque;
> +    uint32_t res = 0;
> +
> +    offset &= 0xff;
> +
> +    switch (offset) {
> +    case 0x80 ... 0x8c:  /* MAIL0_READ */
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

Blank line here (you seem to logically break the switches below in the
write handler).

> +    case 0xb8:  /* MAIL1_STATUS */
> +        res = s->mbox[1].status;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
> +                      __func__, offset);
> +        return 0;
> +    }
> +
> +    bcm2835_mbox_update(s);
> +
> +    return res;
> +}
> +
> +static void bcm2835_mbox_write(void *opaque, hwaddr offset,
> +                               uint64_t value, unsigned size)
> +{
> +    BCM2835MboxState *s = opaque;
> +    hwaddr childaddr;
> +    uint8_t ch;
> +
> +    offset &= 0xff;
> +
> +    switch (offset) {
> +    case 0x94:  /* MAIL0_SENDER */
> +        break;
> +
> +    case 0x9c:  /* MAIL0_CONFIG */
> +        s->mbox[0].config &= ~ARM_MC_IHAVEDATAIRQEN;
> +        s->mbox[0].config |= value & ARM_MC_IHAVEDATAIRQEN;
> +        break;
> +
> +    case 0xa0 ... 0xac:
> +        if (s->mbox[1].status & ARM_MS_FULL) {
> +            /* Mailbox full */
> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: mailbox full\n", __func__);
> +        } else {
> +            ch = value & 0xf;
> +            if (ch < MBOX_CHAN_COUNT) {
> +                childaddr = ch << MBOX_AS_CHAN_SHIFT;
> +                if (ldl_phys(&s->mbox_as, childaddr + MBOX_AS_PENDING)) {
> +                    /* Child busy, push delayed. Push it in the arm->vc mbox */
> +                    mbox_push(&s->mbox[1], value);
> +                } else {
> +                    /* Push it directly to the child device */
> +                    stl_phys(&s->mbox_as, childaddr, value);
> +                }
> +            } else {
> +                /* Invalid channel number */
> +                qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid channel %u\n",
> +                              __func__, ch);
> +            }
> +        }
> +        break;
> +
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
> +                      __func__, offset);
> +        return;
> +    }
> +
> +    bcm2835_mbox_update(s);
> +}
> +
> +static const MemoryRegionOps bcm2835_mbox_ops = {
> +    .read = bcm2835_mbox_read,
> +    .write = bcm2835_mbox_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .valid.min_access_size = 4,
> +    .valid.max_access_size = 4,
> +};
> +
> +/* vmstate of a single mailbox */
> +static const VMStateDescription vmstate_bcm2835_mbox_box = {
> +    .name = TYPE_BCM2835_MBOX "_box",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32_ARRAY(reg, BCM2835Mbox, MBOX_SIZE),
> +        VMSTATE_UINT32(count, BCM2835Mbox),
> +        VMSTATE_UINT32(status, BCM2835Mbox),
> +        VMSTATE_UINT32(config, BCM2835Mbox),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +/* vmstate of the entire device */
> +static const VMStateDescription vmstate_bcm2835_mbox = {
> +    .name = TYPE_BCM2835_MBOX,
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .minimum_version_id_old = 1,
> +    .fields      = (VMStateField[]) {
> +        VMSTATE_BOOL_ARRAY(available, BCM2835MboxState, MBOX_CHAN_COUNT),
> +        VMSTATE_STRUCT_ARRAY(mbox, BCM2835MboxState, 2, 1,
> +                             vmstate_bcm2835_mbox_box, BCM2835Mbox),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void bcm2835_mbox_init(Object *obj)
> +{
> +    BCM2835MboxState *s = BCM2835_MBOX(obj);

Blank line here.

> +    memory_region_init_io(&s->iomem, obj, &bcm2835_mbox_ops, s,
> +                          TYPE_BCM2835_MBOX, 0x400);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
> +    sysbus_init_irq(SYS_BUS_DEVICE(s), &s->arm_irq);
> +    qdev_init_gpio_in(DEVICE(s), bcm2835_mbox_set_irq, MBOX_CHAN_COUNT);
> +}
> +
> +static void bcm2835_mbox_reset(DeviceState *dev)
> +{
> +    BCM2835MboxState *s = BCM2835_MBOX(dev);
> +    int n;
> +
> +    mbox_init(&s->mbox[0]);
> +    mbox_init(&s->mbox[1]);
> +    s->mbox_irq_disabled = false;
> +    for (n = 0; n < MBOX_CHAN_COUNT; n++) {
> +        s->available[n] = false;
> +    }
> +}
> +
> +static void bcm2835_mbox_realize(DeviceState *dev, Error **errp)
> +{
> +    BCM2835MboxState *s = BCM2835_MBOX(dev);
> +    Object *obj;
> +    Error *err = NULL;
> +
> +    obj = object_property_get_link(OBJECT(dev), "mbox_mr", &err);

Link property should be - rather than _.

> +    if (obj == NULL) {
> +        error_setg(errp, "%s: required mbox_mr link not found: %s",
> +                   __func__, error_get_pretty(err));
> +        return;
> +    }
> +
> +    s->mbox_mr = MEMORY_REGION(obj);
> +    address_space_init(&s->mbox_as, s->mbox_mr, NULL);
> +    bcm2835_mbox_reset(dev);
> +}
> +
> +static void bcm2835_mbox_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->realize = bcm2835_mbox_realize;
> +    dc->reset = bcm2835_mbox_reset;
> +    dc->vmsd = &vmstate_bcm2835_mbox;
> +}
> +
> +static TypeInfo bcm2835_mbox_info = {
> +    .name          = TYPE_BCM2835_MBOX,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(BCM2835MboxState),
> +    .class_init    = bcm2835_mbox_class_init,
> +    .instance_init = bcm2835_mbox_init,
> +};
> +
> +static void bcm2835_mbox_register_types(void)
> +{
> +    type_register_static(&bcm2835_mbox_info);
> +}
> +
> +type_init(bcm2835_mbox_register_types)
> diff --git a/include/hw/misc/bcm2835_mbox.h b/include/hw/misc/bcm2835_mbox.h
> new file mode 100644
> index 0000000..f24560c
> --- /dev/null
> +++ b/include/hw/misc/bcm2835_mbox.h
> @@ -0,0 +1,37 @@
> +/*
> + * Raspberry Pi emulation (c) 2012 Gregory Estrade
> + * This code is licensed under the GNU GPLv2 and later.
> + */
> +
> +#ifndef BCM2835_MBOX_H
> +#define BCM2835_MBOX_H
> +
> +#include "bcm2835_mbox_defs.h"
> +#include "hw/sysbus.h"
> +#include "exec/address-spaces.h"
> +
> +#define TYPE_BCM2835_MBOX "bcm2835_mbox"

Type name should be - separated not _. With machine configs and device
hotplug, typenames and properties have backwards compatibility issues
so we want to get them straight from the start.

> +#define BCM2835_MBOX(obj) \
> +        OBJECT_CHECK(BCM2835MboxState, (obj), TYPE_BCM2835_MBOX)
> +
> +typedef struct {
> +    uint32_t reg[MBOX_SIZE];
> +    uint32_t count;
> +    uint32_t status;
> +    uint32_t config;
> +} BCM2835Mbox;
> +
> +typedef struct {
> +    /*< private >*/
> +    SysBusDevice busdev;
> +    /*< public >*/
> +    MemoryRegion *mbox_mr;
> +    AddressSpace mbox_as;
> +    MemoryRegion iomem;
> +    bool mbox_irq_disabled;
> +    qemu_irq arm_irq;

I would move this one-up to before irq_disabled to avoid mixing io and
internal state defs.

> +    bool available[MBOX_CHAN_COUNT];
> +    BCM2835Mbox mbox[2];
> +} BCM2835MboxState;
> +
> +#endif
> diff --git a/include/hw/misc/bcm2835_mbox_defs.h b/include/hw/misc/bcm2835_mbox_defs.h
> new file mode 100644
> index 0000000..48d8ee4
> --- /dev/null
> +++ b/include/hw/misc/bcm2835_mbox_defs.h
> @@ -0,0 +1,26 @@
> +/*
> + * Raspberry Pi emulation (c) 2012 Gregory Estrade
> + * This code is licensed under the GNU GPLv2 and later.
> + */
> +
> +#ifndef BCM2835_MBOX_DEFS_H
> +#define BCM2835_MBOX_DEFS_H
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
> +/* Layout of the private address space used for communication between
> + * the mbox device emulation, and child devices: each channel occupies
> + * 16 bytes of address space, but only two registers are presently defined. */

Space before */

Regards,
Peter

> +#define MBOX_AS_CHAN_SHIFT 4
> +#define MBOX_AS_DATA       0 /* request / response data (RW at offset 0) */
> +#define MBOX_AS_PENDING    4 /* pending response status (RO at offset 4) */
> +
> +#endif /* BCM2835_MBOX_DEFS_H */
> --
> 2.5.3
>
