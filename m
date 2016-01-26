Received: by 10.25.159.19 with SMTP id i19csp1638583lfe;
        Mon, 25 Jan 2016 22:04:02 -0800 (PST)
X-Received: by 10.140.106.69 with SMTP id d63mr25425368qgf.88.1453788242814;
        Mon, 25 Jan 2016 22:04:02 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f38si20175799qkf.31.2016.01.25.22.04.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jan 2016 22:04:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42075 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aNwjS-0005lH-Bb
	for alex.bennee@linaro.org; Tue, 26 Jan 2016 01:04:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42596)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aNwjP-0005i2-Lt
	for qemu-arm@nongnu.org; Tue, 26 Jan 2016 01:04:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aNwjN-0006zY-VC
	for qemu-arm@nongnu.org; Tue, 26 Jan 2016 01:03:59 -0500
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:32978)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aNwjK-0006zG-4W; Tue, 26 Jan 2016 01:03:54 -0500
Received: by mail-wm0-x241.google.com with SMTP id u188so15413224wmu.0;
	Mon, 25 Jan 2016 22:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ozqQVDtbZqT1MVgtOAivWDj0ZdB5K7oItxJhKIU16uY=;
	b=jBbhLAs0T7vGYCh9V1fY3exvIgw+TuU7FhhfZLn4UraYfuV8U8GKvk7056NfSl4okc
	DdvWPe5lGXFcyWfjemAh+5AWOe4uC0/rBPpckVprGMSQecLTSIhXQIMO6wQIGFXBN+SN
	KxCI8+P39OL4pUFxwr3h8HCP2hNcWJ3yrAXsGulZEM4bq5016amhW2lK2xeVE5UMQyUX
	Q4ilPfbz/sQ0Jq64yxZpFF271/uDy74PGKbVnvVmV4uqXi3O91za7v92eT1rXeirOqjG
	0W6rSxALbBJTRrw3iaEUjw/PxoA3joBT5xsF4MAanBohtH1kXHglxuqcbinnVkJU3hC9
	ijdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=ozqQVDtbZqT1MVgtOAivWDj0ZdB5K7oItxJhKIU16uY=;
	b=nEluclzaE5qeZywpo2pCivN/1At3gG/MYS4X2J5G5TSw4Q89l7N6BJ5OtgjJcMYgRu
	euNs57ImkCuyagt3GyEbzLWjLcKEy0Z4ijFtGsbxukyh1BstgKbVbYuXhD4hTJxLuAS7
	ig2M+s5cT7LASv4m+4EUikfaASmppB44fRiVJinlfrYLdvjO9gljNxkZo5Xjchlntym0
	r9BQZZzQLXpq4TwmfP09fwdDrFC4wI4x8Q9aM3UVTrDgftXegQKBbCnUmqI8ItmFdJLp
	z4J7Igi9OLJQHDMv+9sJj0fLK80dr4HbdI3ysBsxDC9R0yVdNq1XQiZ6nTU6wdU2nrKE
	R0Ug==
X-Gm-Message-State: AG10YOR/3UESwSKs+qolUzJ3+YTFPLOhV29CFlJlRPtR7BimMYavEcHMIhdJURZSVbcXnFVo8sbLoVMVpDcJyA==
MIME-Version: 1.0
X-Received: by 10.194.22.132 with SMTP id d4mr21434633wjf.174.1453788233426;
	Mon, 25 Jan 2016 22:03:53 -0800 (PST)
Received: by 10.28.91.143 with HTTP; Mon, 25 Jan 2016 22:03:53 -0800 (PST)
In-Reply-To: <1452902337-13844-3-git-send-email-Andrew.Baumann@microsoft.com>
References: <1452902337-13844-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1452902337-13844-3-git-send-email-Andrew.Baumann@microsoft.com>
Date: Mon, 25 Jan 2016 22:03:53 -0800
Message-ID: <CAPokK=pXY73DpnnoV4MN6gMxJvYHjR-0DTWZC=zFkou9Wy8gqw@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::241
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Rob Herring <robh@kernel.org>
Subject: Re: [Qemu-arm] [PATCH v4 2/8] bcm2835_property: add bcm2835
	property channel
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
X-TUID: eiRI9gl9V3uI

On Fri, Jan 15, 2016 at 3:58 PM, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
> This sits behind the mailbox interface, and implements
> request/response queries for system properties. The
> framebuffer-related properties will be added in a later patch.
>
> Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
> ---
>
> Notes:
>     v4:
>     * added LOG_UNIMP as appropriate
>     * use qemu_macaddr_default_if_unset to allocate a MAC address, and dma_memory_write to write it
>     * assert that we're not pending, rather than dropping a request on the floor
>
>  hw/misc/Makefile.objs              |   1 +
>  hw/misc/bcm2835_property.c         | 286 +++++++++++++++++++++++++++++++++++++
>  include/hw/misc/bcm2835_property.h |  31 ++++
>  3 files changed, 318 insertions(+)
>  create mode 100644 hw/misc/bcm2835_property.c
>  create mode 100644 include/hw/misc/bcm2835_property.h
>
> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> index d0ea105..ea6cd3c 100644
> --- a/hw/misc/Makefile.objs
> +++ b/hw/misc/Makefile.objs
> @@ -37,6 +37,7 @@ obj-$(CONFIG_OMAP) += omap_l4.o
>  obj-$(CONFIG_OMAP) += omap_sdrc.o
>  obj-$(CONFIG_OMAP) += omap_tap.o
>  obj-$(CONFIG_RASPI) += bcm2835_mbox.o
> +obj-$(CONFIG_RASPI) += bcm2835_property.o
>  obj-$(CONFIG_SLAVIO) += slavio_misc.o
>  obj-$(CONFIG_ZYNQ) += zynq_slcr.o
>  obj-$(CONFIG_ZYNQ) += zynq-xadc.o
> diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
> new file mode 100644
> index 0000000..52c9b8d
> --- /dev/null
> +++ b/hw/misc/bcm2835_property.c
> @@ -0,0 +1,286 @@
> +/*
> + * Raspberry Pi emulation (c) 2012 Gregory Estrade
> + * This code is licensed under the GNU GPLv2 and later.
> + */
> +
> +#include "hw/misc/bcm2835_property.h"
> +#include "hw/misc/bcm2835_mbox_defs.h"
> +#include "sysemu/dma.h"
> +
> +/* https://github.com/raspberrypi/firmware/wiki/Mailbox-property-interface */
> +
> +static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
> +{
> +    uint32_t tag;
> +    uint32_t bufsize;
> +    uint32_t tot_len;
> +    size_t resplen;
> +    uint32_t tmp;
> +
> +    value &= ~0xf;
> +
> +    s->addr = value;
> +
> +    tot_len = ldl_phys(&s->dma_as, value);
> +
> +    /* @(addr + 4) : Buffer response code */
> +    value = s->addr + 8;
> +    while (value + 8 <= s->addr + tot_len) {
> +        tag = ldl_phys(&s->dma_as, value);
> +        bufsize = ldl_phys(&s->dma_as, value + 4);
> +        /* @(value + 8) : Request/response indicator */
> +        resplen = 0;
> +        switch (tag) {
> +        case 0x00000000: /* End tag */
> +            break;
> +        case 0x00000001: /* Get firmware revision */
> +            stl_phys(&s->dma_as, value + 12, 346337);
> +            resplen = 4;
> +            break;
> +        case 0x00010001: /* Get board model */
> +            qemu_log_mask(LOG_UNIMP,
> +                          "bcm2835_property: %x get board model NYI\n", tag);
> +            resplen = 4;
> +            break;
> +        case 0x00010002: /* Get board revision */
> +            qemu_log_mask(LOG_UNIMP,
> +                          "bcm2835_property: %x get board revision NYI\n", tag);
> +            resplen = 4;
> +            break;
> +        case 0x00010003: /* Get board MAC address */
> +            resplen = sizeof(s->macaddr.a);
> +            dma_memory_write(&s->dma_as, value + 12, s->macaddr.a, resplen);
> +            break;
> +        case 0x00010004: /* Get board serial */
> +            qemu_log_mask(LOG_UNIMP,
> +                          "bcm2835_property: %x get board serial NYI\n", tag);
> +            resplen = 8;
> +            break;
> +        case 0x00010005: /* Get ARM memory */
> +            /* base */
> +            stl_phys(&s->dma_as, value + 12, 0);
> +            /* size */
> +            stl_phys(&s->dma_as, value + 16, s->ram_size);
> +            resplen = 8;
> +            break;
> +        case 0x00028001: /* Set power state */
> +            /* Assume that whatever device they asked for exists,
> +             * and we'll just claim we set it to the desired state */

blank before */

A grep on "^\+[ \t]*\*.*\*\/$" on the patch series will catch-all.

Otherwise,

Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>

Regards,
Peter

> +            tmp = ldl_phys(&s->dma_as, value + 16);
> +            stl_phys(&s->dma_as, value + 16, (tmp & 1));
> +            resplen = 8;
> +            break;
> +
> +        /* Clocks */
> +
> +        case 0x00030001: /* Get clock state */
> +            stl_phys(&s->dma_as, value + 16, 0x1);
> +            resplen = 8;
> +            break;
> +
> +        case 0x00038001: /* Set clock state */
> +            qemu_log_mask(LOG_UNIMP,
> +                          "bcm2835_property: %x set clock state NYI\n", tag);
> +            resplen = 8;
> +            break;
> +
> +        case 0x00030002: /* Get clock rate */
> +        case 0x00030004: /* Get max clock rate */
> +        case 0x00030007: /* Get min clock rate */
> +            switch (ldl_phys(&s->dma_as, value + 12)) {
> +            case 1: /* EMMC */
> +                stl_phys(&s->dma_as, value + 16, 50000000);
> +                break;
> +            case 2: /* UART */
> +                stl_phys(&s->dma_as, value + 16, 3000000);
> +                break;
> +            default:
> +                stl_phys(&s->dma_as, value + 16, 700000000);
> +                break;
> +            }
> +            resplen = 8;
> +            break;
> +
> +        case 0x00038002: /* Set clock rate */
> +        case 0x00038004: /* Set max clock rate */
> +        case 0x00038007: /* Set min clock rate */
> +            qemu_log_mask(LOG_UNIMP,
> +                          "bcm2835_property: %x set clock rates NYI\n", tag);
> +            resplen = 8;
> +            break;
> +
> +        /* Temperature */
> +
> +        case 0x00030006: /* Get temperature */
> +            stl_phys(&s->dma_as, value + 16, 25000);
> +            resplen = 8;
> +            break;
> +
> +        case 0x0003000A: /* Get max temperature */
> +            stl_phys(&s->dma_as, value + 16, 99000);
> +            resplen = 8;
> +            break;
> +
> +
> +        case 0x00060001: /* Get DMA channels */
> +            /* channels 2-5 */
> +            stl_phys(&s->dma_as, value + 12, 0x003C);
> +            resplen = 4;
> +            break;
> +
> +        case 0x00050001: /* Get command line */
> +            resplen = 0;
> +            break;
> +
> +        default:
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "bcm2835_property: unhandled tag %08x\n", tag);
> +            break;
> +        }
> +
> +        if (tag == 0) {
> +            break;
> +        }
> +
> +        stl_phys(&s->dma_as, value + 8, (1 << 31) | resplen);
> +        value += bufsize + 12;
> +    }
> +
> +    /* Buffer response code */
> +    stl_phys(&s->dma_as, s->addr + 4, (1 << 31));
> +}
> +
> +static uint64_t bcm2835_property_read(void *opaque, hwaddr offset,
> +                                      unsigned size)
> +{
> +    BCM2835PropertyState *s = opaque;
> +    uint32_t res = 0;
> +
> +    switch (offset) {
> +    case MBOX_AS_DATA:
> +        res = MBOX_CHAN_PROPERTY | s->addr;
> +        s->pending = false;
> +        qemu_set_irq(s->mbox_irq, 0);
> +        break;
> +
> +    case MBOX_AS_PENDING:
> +        res = s->pending;
> +        break;
> +
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
> +                      __func__, offset);
> +        return 0;
> +    }
> +
> +    return res;
> +}
> +
> +static void bcm2835_property_write(void *opaque, hwaddr offset,
> +                                   uint64_t value, unsigned size)
> +{
> +    BCM2835PropertyState *s = opaque;
> +
> +    switch (offset) {
> +    case MBOX_AS_DATA:
> +        /* bcm2835_mbox should check our pending status before pushing */
> +        assert(!s->pending);
> +        s->pending = true;
> +        bcm2835_property_mbox_push(s, value);
> +        qemu_set_irq(s->mbox_irq, 1);
> +        break;
> +
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
> +                      __func__, offset);
> +        return;
> +    }
> +}
> +
> +static const MemoryRegionOps bcm2835_property_ops = {
> +    .read = bcm2835_property_read,
> +    .write = bcm2835_property_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .valid.min_access_size = 4,
> +    .valid.max_access_size = 4,
> +};
> +
> +static const VMStateDescription vmstate_bcm2835_property = {
> +    .name = TYPE_BCM2835_PROPERTY,
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields      = (VMStateField[]) {
> +        VMSTATE_MACADDR(macaddr, BCM2835PropertyState),
> +        VMSTATE_UINT32(addr, BCM2835PropertyState),
> +        VMSTATE_BOOL(pending, BCM2835PropertyState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void bcm2835_property_init(Object *obj)
> +{
> +    BCM2835PropertyState *s = BCM2835_PROPERTY(obj);
> +
> +    memory_region_init_io(&s->iomem, OBJECT(s), &bcm2835_property_ops, s,
> +                          TYPE_BCM2835_PROPERTY, 0x10);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
> +    sysbus_init_irq(SYS_BUS_DEVICE(s), &s->mbox_irq);
> +}
> +
> +static void bcm2835_property_reset(DeviceState *dev)
> +{
> +    BCM2835PropertyState *s = BCM2835_PROPERTY(dev);
> +
> +    s->pending = false;
> +}
> +
> +static void bcm2835_property_realize(DeviceState *dev, Error **errp)
> +{
> +    BCM2835PropertyState *s = BCM2835_PROPERTY(dev);
> +    Object *obj;
> +    Error *err = NULL;
> +
> +    obj = object_property_get_link(OBJECT(dev), "dma-mr", &err);
> +    if (obj == NULL) {
> +        error_setg(errp, "%s: required dma-mr link not found: %s",
> +                   __func__, error_get_pretty(err));
> +        return;
> +    }
> +
> +    s->dma_mr = MEMORY_REGION(obj);
> +    address_space_init(&s->dma_as, s->dma_mr, NULL);
> +
> +    /* TODO: connect to MAC address of USB NIC device, once we emulate it */
> +    qemu_macaddr_default_if_unset(&s->macaddr);
> +
> +    bcm2835_property_reset(dev);
> +}
> +
> +static Property bcm2835_property_props[] = {
> +    DEFINE_PROP_UINT32("ram-size", BCM2835PropertyState, ram_size, 0),
> +    DEFINE_PROP_END_OF_LIST()
> +};
> +
> +static void bcm2835_property_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->props = bcm2835_property_props;
> +    dc->realize = bcm2835_property_realize;
> +    dc->vmsd = &vmstate_bcm2835_property;
> +}
> +
> +static TypeInfo bcm2835_property_info = {
> +    .name          = TYPE_BCM2835_PROPERTY,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(BCM2835PropertyState),
> +    .class_init    = bcm2835_property_class_init,
> +    .instance_init = bcm2835_property_init,
> +};
> +
> +static void bcm2835_property_register_types(void)
> +{
> +    type_register_static(&bcm2835_property_info);
> +}
> +
> +type_init(bcm2835_property_register_types)
> diff --git a/include/hw/misc/bcm2835_property.h b/include/hw/misc/bcm2835_property.h
> new file mode 100644
> index 0000000..fcf5f3d
> --- /dev/null
> +++ b/include/hw/misc/bcm2835_property.h
> @@ -0,0 +1,31 @@
> +/*
> + * Raspberry Pi emulation (c) 2012 Gregory Estrade
> + * This code is licensed under the GNU GPLv2 and later.
> + */
> +
> +#ifndef BCM2835_PROPERTY_H
> +#define BCM2835_PROPERTY_H
> +
> +#include "hw/sysbus.h"
> +#include "exec/address-spaces.h"
> +#include "net/net.h"
> +
> +#define TYPE_BCM2835_PROPERTY "bcm2835-property"
> +#define BCM2835_PROPERTY(obj) \
> +        OBJECT_CHECK(BCM2835PropertyState, (obj), TYPE_BCM2835_PROPERTY)
> +
> +typedef struct {
> +    /*< private >*/
> +    SysBusDevice busdev;
> +    /*< public >*/
> +    MemoryRegion *dma_mr;
> +    AddressSpace dma_as;
> +    MemoryRegion iomem;
> +    qemu_irq mbox_irq;
> +    MACAddr macaddr;
> +    uint32_t ram_size;
> +    uint32_t addr;
> +    bool pending;
> +} BCM2835PropertyState;
> +
> +#endif
> --
> 2.5.3
>
