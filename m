Received: by 10.25.159.19 with SMTP id i19csp277715lfe;
        Mon, 11 Jan 2016 19:53:49 -0800 (PST)
X-Received: by 10.140.239.87 with SMTP id k84mr181164335qhc.87.1452570829417;
        Mon, 11 Jan 2016 19:53:49 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t73si13077643qkt.17.2016.01.11.19.53.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jan 2016 19:53:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57911 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aIq1l-0005MG-3i
	for alex.bennee@linaro.org; Mon, 11 Jan 2016 22:53:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56716)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aIq1Q-00055V-5I
	for qemu-devel@nongnu.org; Mon, 11 Jan 2016 22:53:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aIq1L-0000Mk-PR
	for qemu-devel@nongnu.org; Mon, 11 Jan 2016 22:53:27 -0500
Received: from mail-pa0-x242.google.com ([2607:f8b0:400e:c03::242]:34784)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aIq1L-0000Mf-G5; Mon, 11 Jan 2016 22:53:23 -0500
Received: by mail-pa0-x242.google.com with SMTP id yy13so25296059pab.1;
	Mon, 11 Jan 2016 19:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Si4ziYUVy/lffGGBcxlPAJkYLIir/nPQNCoA0jAiGVg=;
	b=fgc6SeWTufUtEnzXAittS8NU2CPWbvx9CLNOJtDgT6jtnjgU2iEN1LyrAyMBQGqmSE
	hPFjbbNsb+lcQpMfTEE4qGfGAPvF8LT44nkNp/wBrvW4FfSZqWYJV1SAdPsxuIPgTBV6
	qJmJdgW8kB2S9Ai63cUBmszmGnkxGtdHYh1vZTnGtgJlMWFJa6jbAjuteAIaZPw7oZzt
	+wMwjgHhDkTT7kZayEvSAHO6ze3ce/b91C6Q6CAZK4dAeh0cpZRyd1jA+uh6J5JH1gEG
	LLLjrkzgkEST852QgobhsXRgoBnGhK3zkRO+w0I7kTV3mqPfJnLUa6K40xLpyEEqrePd
	qPPA==
X-Received: by 10.66.235.162 with SMTP id un2mr34392712pac.17.1452570802579;
	Mon, 11 Jan 2016 19:53:22 -0800 (PST)
Received: from pcrost-box (c-73-70-184-119.hsd1.ca.comcast.net.
	[73.70.184.119]) by smtp.gmail.com with ESMTPSA id
	xv2sm20372326pab.10.2016.01.11.19.53.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jan 2016 19:53:21 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Mon, 11 Jan 2016 19:53:19 -0800
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Message-ID: <20160112035319.GA3308@pcrost-box>
References: <1451608294-16432-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1451608294-16432-3-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1451608294-16432-3-git-send-email-Andrew.Baumann@microsoft.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::242
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?iso-8859-1?Q?Gr=E9gory?= ESTRADE <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v3 2/7] bcm2835_property: add bcm2835
	property channel
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
X-TUID: keZpY3XUiG3H

On Thu, Dec 31, 2015 at 04:31:29PM -0800, Andrew Baumann wrote:
> This sits behind the mailbox interface, and implements
> request/response queries for system properties. The
> framebuffer-related properties will be added in a later patch.
> 
> Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
> ---
>  hw/misc/Makefile.objs              |   1 +
>  hw/misc/bcm2835_property.c         | 277 +++++++++++++++++++++++++++++++++++++
>  include/hw/misc/bcm2835_property.h |  29 ++++
>  3 files changed, 307 insertions(+)
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
> index 0000000..2385be4
> --- /dev/null
> +++ b/hw/misc/bcm2835_property.c
> @@ -0,0 +1,277 @@
> +/*
> + * Raspberry Pi emulation (c) 2012 Gregory Estrade
> + * This code is licensed under the GNU GPLv2 and later.
> + */
> +
> +#include "hw/misc/bcm2835_property.h"
> +#include "hw/misc/bcm2835_mbox_defs.h"
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
> +
> +        case 0x00010001: /* Get board model */

You are not populating a response here so should this LOG_UNIMP?

> +            resplen = 4;
> +            break;
> +        case 0x00010002: /* Get board revision */
> +            resplen = 4;
> +            break;
> +        case 0x00010003: /* Get board MAC address */

Tricky, as QEMU has support for setting MAC addresses on NICs I
think. Should this LOG_UNIMP for the moment and later when we have
network we revisit? Can still return the dummy value with the unimp.

> +            /* write the first four bytes of the 6-byte MAC */
> +            stl_phys(&s->dma_as, value + 12, 0xB827EBD0);
> +            /* write the last two bytes, avoid any write past the buffer end */
> +            stb_phys(&s->dma_as, value + 16, 0xEE);
> +            stb_phys(&s->dma_as, value + 17, 0xDF);

Can you just use:

dma_memory_write(&s->dma_as, value + 12, mac_addr, 6);

Where mac_addr is uint8_t[6] with the mac address?

> +            resplen = 6;
> +            break;
> +        case 0x00010004: /* Get board serial */
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

UNIMP

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

UNIMP

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
> +        if (!s->pending) {
> +            s->pending = true;
> +            bcm2835_property_mbox_push(s, value);
> +            qemu_set_irq(s->mbox_irq, 1);
> +        }

So if it already is pending, the new data is dropped? Should this be a
GUEST_ERROR?

> +        break;
> +
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
> +                      __func__, offset);
> +        return;
> +    }
> +
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
> +    .minimum_version_id_old = 1,
> +    .fields      = (VMStateField[]) {
> +        VMSTATE_UINT32(addr, BCM2835PropertyState),
> +        VMSTATE_BOOL(pending, BCM2835PropertyState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void bcm2835_property_init(Object *obj)
> +{
> +    BCM2835PropertyState *s = BCM2835_PROPERTY(obj);

blank line.

Regards,
Peter

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
> index 0000000..d7a9856
> --- /dev/null
> +++ b/include/hw/misc/bcm2835_property.h
> @@ -0,0 +1,29 @@
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
> +    uint32_t ram_size;
> +    uint32_t addr;
> +    bool pending;
> +} BCM2835PropertyState;
> +
> +#endif
> -- 
> 2.5.3
> 
