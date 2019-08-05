Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4056141wrv;
        Mon, 5 Aug 2019 07:31:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyjzpSRHz1QWbaz61tGV93Jlb0CArXkRMnhh0VLrhqFTZpE6SQMUYDPF4ld/VZqHWw5fONp
X-Received: by 2002:ac8:7a9a:: with SMTP id x26mr108179935qtr.251.1565015507620;
        Mon, 05 Aug 2019 07:31:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565015507; cv=none;
        d=google.com; s=arc-20160816;
        b=AJxnCV7iHotrE0yHbLcqGU3nEJ0YoiSPB1MOHM/U/9GAOpPWRR/zD/B7Jywx2Dx60x
         nAEE9xKJSiCLGMeWO7F5a7+xYEoYurJ1/OVeU6GJgw1AH8Fa56deSMbsiS+g9vGxTBr5
         s/eTixkrDruBZiDSKlXPMyps9pfLsLL9EbKnBa2/HysTaV2mVZUzwjp8n8OeHX/K3mc1
         AyT6qqJZqU9maiPIqXlkZfj3FmWJyQ3AxSL4i18HLs8p7TBfilAWczdd7hvSvwjzuXLh
         o5if+0L6bzvI3qYIWahj9tZXc++LOjhh7qN21PeiBan87NJPwIrN/eHeYoS5o2F0fe/W
         ODoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=REf++QO9sOMOf9rohtTPS6NVP1pMO7uGAun3iA5N9b8=;
        b=gz8wivUukHPl+zOO1qcPD6a6bSda1WjIWmrinJAzr3CwqRPFk9kut5U15hNXJifyIB
         24XYKsvSE+pHYyMxpfxfpmUTZO4/G9bsnRCdOnzTE80v9S33KKAMMax3HVRuqM6BLvdC
         neCcNHOkXgLLasxaWb/7IP5g9MvkfYlgTwvKzxykNT6A0ZssDemg05/PZJ9BXxkyZx8A
         syWh6KfkBaliHkvGS7RMwKC3fI+2JT9WefcvdpYHH/lA7llXc2nHFoIy0nWykkEY3BVC
         RVKcasNlIENmY1rB0Eyl9g5Nw49bDtuXCs8X8d2bocWRX3dkJ7NTcolRReyoafNXz4Ie
         DMCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jxHrr0RL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a190si45487516qke.379.2019.08.05.07.31.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Aug 2019 07:31:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jxHrr0RL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hue1b-0001NA-72
	for alex.bennee@linaro.org; Mon, 05 Aug 2019 10:31:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37987)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hue1U-0001MV-Sx
 for qemu-arm@nongnu.org; Mon, 05 Aug 2019 10:31:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hue1R-0004r5-Nr
 for qemu-arm@nongnu.org; Mon, 05 Aug 2019 10:31:40 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:35929)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hue1P-0004ob-26
 for qemu-arm@nongnu.org; Mon, 05 Aug 2019 10:31:37 -0400
Received: by mail-ot1-x341.google.com with SMTP id r6so85439111oti.3
 for <qemu-arm@nongnu.org>; Mon, 05 Aug 2019 07:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=REf++QO9sOMOf9rohtTPS6NVP1pMO7uGAun3iA5N9b8=;
 b=jxHrr0RLPaNrfWYfXnnpQj4/SaxWvILx5qj5bjp0zhP9MvgkWte50XdqjGDLzDS9qj
 i8ixgowxxstcIfI/IL9Oe08+4A3KbUIEYSt7cz9MtI6OkvJcyXgbWz9e1VJ6x/GvigHY
 HvXpeWJCgq7Daa2KGBj8q1cB60uSPwlMz+yNN8LHcTfipYrCXRw5vtNZ/mGrGlYM+sJM
 MPvBKP4Yay+AqPpKagzsLB1Dovqqhm3IRdA2axeDYoYWxV8Af42JWFDJlT6jCKw1kxZ1
 2k+AW4QLjQjyz94/Z8ArONyX3ZTGG+AowCh2U5mxV9d7oQA5v5JjUqgUZPfKBStpnt50
 0Uzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=REf++QO9sOMOf9rohtTPS6NVP1pMO7uGAun3iA5N9b8=;
 b=f5jvURs1yNkQr52/daw0bw6UXPYr4EwjxIfa6hycThGIb2WhtcYd/Yc9ZbBdTVZ5yI
 ZciZTr3IMFlISSa9TA0exZZglB7q+GCV2NkvEHdEpQIVa/9ICcgdcATfy9uPJr7CYXfO
 6uigj/Pl0lSn4SpTIkD057/bjSXW2R12Lfv3Njxsyva191KCTtLhhvVjKnWyv69Km98m
 QtMT84s5FwhGD0a2Grs45IiGGS8Hxw58578TXvR2naZR4aKtl7lg5tI1vsS4p/rLQB8e
 omFDI64zVBaxtrHhcFN/LykQzxZV5Z+yVIFq+oJAgfWcHKZvUWkbLiLo4zD9X3HobJCq
 xGbw==
X-Gm-Message-State: APjAAAWvIEXoFCSmSHt3gYRMgV9yWP4ur3IgOmgbBFKzpUQ+aY6pPwev
 jqVUcC4hSd0ml2O6Cis6+8sU9cLfU/vw2DgCZgKjEQ==
X-Received: by 2002:a9d:6a0f:: with SMTP id g15mr84992994otn.135.1565015493125; 
 Mon, 05 Aug 2019 07:31:33 -0700 (PDT)
MIME-Version: 1.0
References: <1561574604-1204-1-git-send-email-eajames@linux.ibm.com>
In-Reply-To: <1561574604-1204-1-git-send-email-eajames@linux.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Aug 2019 15:31:22 +0100
Message-ID: <CAFEAcA8W44gYFgU7qP9wOUSwZ7xFqqZ+2eWr=0hjKps=qvQMnw@mail.gmail.com>
To: Eddie James <eajames@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH] hw/sd/aspeed_sdhci: New device
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NHfX7urFTFnt

On Wed, 26 Jun 2019 at 19:43, Eddie James <eajames@linux.ibm.com> wrote:
>
> The Aspeed SOCs have two SD/MMC controllers. Add a device that
> encapsulates both of these controllers and models the Aspeed-specific
> registers and behavior.
>
> Both controllers use a single HW interrupt. In order to trigger that
> interrupt, a function pointer was added to the generic SDHCI structure.
> This function (if the pointer is set) is called when the SDHCI model
> changes it's interrupt status, allowing the user (the Aspeed SDHCI
> model in this case) to set it's own interrupt.
>
> This goes on top of Cedric's set of Aspeed changes.
>
> Tested, booted, and read from /dev/mmcblk0 and /dev/mmcblk1:
> ./arm-softmmu/qemu-system-arm -M ast2500-evb -nographic \
>  -drive file=flash-romulus,format=raw,if=mtd \
>  -drive file=<some file>,format=raw,if=sd \
>  -drive file=<some file>,format=raw,if=sd \
>  -kernel zImage \
>  -dtb aspeed-ast2500-evb.dtb \
>  -initrd romulus.cpio.lzma \
>  -d trace:sdhci* -no-reboot
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

(Apologies for the rather delayed review -- combination of the
4.1 release work, and hoping one of the other Aspeed developers
would get to it.)


>  #define aspeed_soc_ast2500_irqmap aspeed_soc_ast2400_irqmap
> @@ -378,6 +381,16 @@ static void aspeed_soc_init(Object *obj)
>          sysbus_init_child_obj(obj, "fsi[*]", OBJECT(&s->fsi[0]),
>                                sizeof(s->fsi[0]), TYPE_ASPEED_FSI);
>      }
> +
> +    sysbus_init_child_obj(obj, "sdhci", OBJECT(&s->sdhci), sizeof(s->sdhci),
> +                          TYPE_ASPEED_SDHCI);
> +
> +    for (i = 0; i < ASPEED_SDHCI_NUM_SLOTS; ++i) {
> +        sysbus_init_child_obj(obj, "sdhci_slot[*]",
> +                              OBJECT(&s->sdhci.slots[i].sdhci),
> +                              sizeof(s->sdhci.slots[i].sdhci),
> +                              TYPE_SYSBUS_SDHCI);
> +    }

This seems a bit odd. Why does the SoC init the slots[i].sdhci
objects, rather than letting the TYPE_ASPEED_SDHCI object itself
take care of initializing and realizing its own child objects?

>  }
>
>  static void aspeed_soc_realize(DeviceState *dev, Error **errp)
> @@ -699,6 +712,60 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>          sysbus_connect_irq(SYS_BUS_DEVICE(&s->fsi[0]), 0,
>                             aspeed_soc_get_irq(s, ASPEED_FSI1));
>      }
> +
> +    /* SD/SDIO */
> +    for (i = 0; i < ASPEED_SDHCI_NUM_SLOTS; i++) {
> +        hwaddr hci_addr = sc->info->memmap[ASPEED_SDHCI] + (0x100 * (i + 1));
> +        DriveInfo *di;
> +        BlockBackend *blk;
> +        DeviceState *card;
> +
> +        /*
> +         * Compatible with:
> +         * - SD Host Controller Specification Version 2.0
> +         * - SDIO Specification Version 2.0
> +         * - MMC Specification Version 4.3
> +         */
> +        object_property_set_int(OBJECT(&s->sdhci.slots[i].sdhci), 2,
> +                                "sd-spec-version", &err);
> +        if (err) {
> +            error_propagate(errp, err);
> +            return;
> +        }
> +
> +        object_property_set_uint(OBJECT(&s->sdhci.slots[i].sdhci),
> +                                 ASPEED_SDHCI_CAPABILITIES, "capareg", &err);
> +        if (err) {
> +            error_propagate(errp, err);
> +            return;
> +        }
> +
> +        object_property_set_bool(OBJECT(&s->sdhci.slots[i].sdhci), true,
> +                                 "realized", &err);
> +        if (err) {
> +            error_propagate(errp, err);
> +            return;
> +        }
> +
> +        sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdhci.slots[i].sdhci), 0, hci_addr);
> +
> +        di = drive_get_next(IF_SD);
> +        blk = di ? blk_by_legacy_dinfo(di) : NULL;
> +        card = qdev_create(qdev_get_child_bus(DEVICE(&s->sdhci.slots[i].sdhci),
> +                                              "sd-bus"), TYPE_SD_CARD);
> +        qdev_prop_set_drive(card, "drive", blk, &error_fatal);
> +        object_property_set_bool(OBJECT(card), true, "realized", &error_fatal);

Code at the SoC level shouldn't be calling drive_get_next() or
creating SD card objects directly itself -- it should leave this
up to either the board code or to the command line.

> +    }
> +
> +    object_property_set_bool(OBJECT(&s->sdhci), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdhci), 0,
> +                    sc->info->memmap[ASPEED_SDHCI]);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdhci), 0,
> +                       aspeed_soc_get_irq(s, ASPEED_SDHCI));
>  }
>  static Property aspeed_soc_properties[] = {
>      DEFINE_PROP_UINT32("num-cpus", AspeedSoCState, num_cpus, 0),
> diff --git a/hw/sd/Makefile.objs b/hw/sd/Makefile.objs
> index 0665727..a884c23 100644
> --- a/hw/sd/Makefile.objs
> +++ b/hw/sd/Makefile.objs
> @@ -8,3 +8,4 @@ obj-$(CONFIG_MILKYMIST) += milkymist-memcard.o
>  obj-$(CONFIG_OMAP) += omap_mmc.o
>  obj-$(CONFIG_PXA2XX) += pxa2xx_mmci.o
>  obj-$(CONFIG_RASPI) += bcm2835_sdhost.o
> +obj-$(CONFIG_ASPEED_SOC) += aspeed_sdhci.o
> diff --git a/hw/sd/aspeed_sdhci.c b/hw/sd/aspeed_sdhci.c
> new file mode 100644
> index 0000000..f684b12
> --- /dev/null
> +++ b/hw/sd/aspeed_sdhci.c
> @@ -0,0 +1,163 @@
> +/*
> + * Aspeed SD Host Controller
> + * Eddie James <eajames@linux.ibm.com>
> + *
> + * Copyright (C) 2019 IBM Corp
> + * SPDX-License-Identifer: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "qemu/error-report.h"
> +#include "hw/sd/aspeed_sdhci.h"
> +#include "qapi/error.h"
> +
> +#define ASPEED_SDHCI_INFO            0x00
> +#define  ASPEED_SDHCI_INFO_RESET     0x00030000
> +#define ASPEED_SDHCI_DEBOUNCE        0x04
> +#define  ASPEED_SDHCI_DEBOUNCE_RESET 0x00000005
> +#define ASPEED_SDHCI_BUS             0x08
> +#define ASPEED_SDHCI_SDIO_140        0x10
> +#define ASPEED_SDHCI_SDIO_148        0x18
> +#define ASPEED_SDHCI_SDIO_240        0x20
> +#define ASPEED_SDHCI_SDIO_248        0x28
> +#define ASPEED_SDHCI_WP_POL          0xec
> +#define ASPEED_SDHCI_CARD_DET        0xf0
> +#define ASPEED_SDHCI_IRQ_STAT        0xfc
> +
> +#define TO_REG(addr) ((addr) / sizeof(uint32_t))
> +
> +static uint64_t aspeed_sdhci_read(void *opaque, hwaddr addr, unsigned int size)
> +{
> +    uint32_t val = 0;
> +    AspeedSDHCIState *sdhci = opaque;
> +
> +    switch (addr) {
> +    case ASPEED_SDHCI_SDIO_140:
> +        val = (uint32_t)sdhci->slots[0].sdhci.capareg;
> +        break;
> +    case ASPEED_SDHCI_SDIO_148:
> +        val = (uint32_t)sdhci->slots[0].sdhci.maxcurr;
> +        break;
> +    case ASPEED_SDHCI_SDIO_240:
> +        val = (uint32_t)sdhci->slots[1].sdhci.capareg;
> +        break;
> +    case ASPEED_SDHCI_SDIO_248:
> +        val = (uint32_t)sdhci->slots[1].sdhci.maxcurr;
> +        break;
> +    default:
> +        if (addr < ASPEED_SDHCI_REG_SIZE) {
> +            val = sdhci->regs[TO_REG(addr)];
> +        }
> +    }
> +
> +    return (uint64_t)val;
> +}
> +
> +static void aspeed_sdhci_write(void *opaque, hwaddr addr, uint64_t val,
> +                               unsigned int size)
> +{
> +    AspeedSDHCIState *sdhci = opaque;
> +
> +    switch (addr) {
> +    case ASPEED_SDHCI_SDIO_140:
> +        sdhci->slots[0].sdhci.capareg = (uint64_t)(uint32_t)val;
> +        break;
> +    case ASPEED_SDHCI_SDIO_148:
> +        sdhci->slots[0].sdhci.maxcurr = (uint64_t)(uint32_t)val;
> +        break;
> +    case ASPEED_SDHCI_SDIO_240:
> +        sdhci->slots[1].sdhci.capareg = (uint64_t)(uint32_t)val;
> +        break;
> +    case ASPEED_SDHCI_SDIO_248:
> +        sdhci->slots[1].sdhci.maxcurr = (uint64_t)(uint32_t)val;
> +        break;
> +    default:
> +        if (addr < ASPEED_SDHCI_REG_SIZE) {
> +            sdhci->regs[TO_REG(addr)] = (uint32_t)val;
> +        }
> +    }
> +}
> +
> +static const MemoryRegionOps aspeed_sdhci_ops = {
> +    .read = aspeed_sdhci_read,
> +    .write = aspeed_sdhci_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .valid.min_access_size = 4,
> +    .valid.max_access_size = 4,
> +};
> +
> +static void aspeed_sdhci_irq_notify(SDHCIState *s, int level)
> +{
> +    AspeedSDHCISlotState *as = container_of(s, AspeedSDHCISlotState, sdhci);
> +    AspeedSDHCIState *sdhci = container_of(as, AspeedSDHCIState,
> +                                           slots[as->slot]);
> +
> +    if (level) {
> +        sdhci->regs[TO_REG(ASPEED_SDHCI_IRQ_STAT)] |= BIT(as->slot);
> +
> +        qemu_irq_raise(sdhci->irq);
> +    } else {
> +        sdhci->regs[TO_REG(ASPEED_SDHCI_IRQ_STAT)] &= ~BIT(as->slot);
> +
> +        qemu_irq_lower(sdhci->irq);
> +    }
> +}
> +
> +static void aspeed_sdhci_realize(DeviceState *dev, Error **errp)
> +{
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> +    AspeedSDHCIState *sdhci = ASPEED_SDHCI(dev);
> +
> +    sysbus_init_irq(sbd, &sdhci->irq);
> +    memory_region_init_io(&sdhci->iomem, OBJECT(sdhci), &aspeed_sdhci_ops,
> +                          sdhci, TYPE_ASPEED_SDHCI, ASPEED_SDHCI_REG_SIZE);
> +    sysbus_init_mmio(sbd, &sdhci->iomem);
> +
> +    sdhci->slots[0].slot = 0;
> +    sdhci->slots[0].sdhci.irq_notify = aspeed_sdhci_irq_notify;
> +
> +    sdhci->slots[1].slot = 1;
> +    sdhci->slots[1].sdhci.irq_notify = aspeed_sdhci_irq_notify;
> +}
> +
> +static void aspeed_sdhci_reset(DeviceState *dev)
> +{
> +    AspeedSDHCIState *sdhci = ASPEED_SDHCI(dev);
> +
> +    memset(sdhci->regs, 0, ASPEED_SDHCI_REG_SIZE);
> +    sdhci->regs[TO_REG(ASPEED_SDHCI_INFO)] = ASPEED_SDHCI_INFO_RESET;
> +    sdhci->regs[TO_REG(ASPEED_SDHCI_DEBOUNCE)] = ASPEED_SDHCI_DEBOUNCE_RESET;
> +}
> +
> +static const VMStateDescription vmstate_aspeed_sdhci = {
> +    .name = TYPE_ASPEED_SDHCI,
> +    .version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32_ARRAY(regs, AspeedSDHCIState, ASPEED_SDHCI_NUM_REGS),
> +        VMSTATE_END_OF_LIST(),
> +    },
> +};
> +
> +static void aspeed_sdhci_class_init(ObjectClass *classp, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(classp);
> +
> +    dc->realize = aspeed_sdhci_realize;
> +    dc->reset = aspeed_sdhci_reset;
> +    dc->vmsd = &vmstate_aspeed_sdhci;
> +}
> +
> +static TypeInfo aspeed_sdhci_info = {
> +    .name          = TYPE_ASPEED_SDHCI,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(AspeedSDHCIState),
> +    .class_init    = aspeed_sdhci_class_init,
> +};
> +
> +static void aspeed_sdhci_register_types(void)
> +{
> +    type_register_static(&aspeed_sdhci_info);
> +}
> +
> +type_init(aspeed_sdhci_register_types)
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index 7b80b1d..51a733b 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -213,7 +213,13 @@ static uint8_t sdhci_slotint(SDHCIState *s)
>
>  static inline void sdhci_update_irq(SDHCIState *s)
>  {
> -    qemu_set_irq(s->irq, sdhci_slotint(s));
> +    int level = sdhci_slotint(s);
> +
> +    qemu_set_irq(s->irq, level);
> +
> +    if (s->irq_notify) {
> +        s->irq_notify(s, level);
> +    }

Rather than doing this, just wire the irq lines from
the SDHCIState device up to your AspeedSDHCIState device,
and then have that update the register state and assert
its own irq lines outbound.

>  }

thanks
-- PMM
