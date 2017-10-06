Received: by 10.223.197.9 with SMTP id q9csp1706002wrf;
        Fri, 6 Oct 2017 07:23:55 -0700 (PDT)
X-Received: by 10.237.35.244 with SMTP id k49mr3403922qtc.44.1507299835661;
        Fri, 06 Oct 2017 07:23:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507299835; cv=none;
        d=google.com; s=arc-20160816;
        b=tU7aWgURefY19K+aC21nnIQ2ZKR1t96T2+Z0xTDNYIA3ade2ZjVD2KG8Dsw4uHPL4T
         5ly3fjF983E63Oh8kes6F2zYfRyRxjjmq/6e563OUvDz13LBUrqh221sN49uBEWebWlx
         LN0Ikdo2Khb7uk46go5aruSbFVuUYEu6L0eVJrU/slTnOKsYccV58bZ+Qmu0lwuQhnPH
         Exo4H4P5Xa0dXEaRxX963cDitAbje36KE8gZsi1f45TPaoFT+w0y8GgX0SnWQ0X+mNNE
         D5C5ji3QIhMVBSN8DQnourK0VBN/en5IrU0jDZCPvnoD8nGEOpW3X5DjdfnjwCQdrddH
         hHUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=ih6TyIeGyOH7TGI5NapO9PCCJFHGvg7PoCtceS2XISU=;
        b=eF1oBWdoeDAXPP3aZKnmjpY1LnrNjwUy265/TyL94r9v5o/s9M8qIHNeSvJaR9qTHQ
         C26zc3fQ1oEi9TLiuVzuTZovbFw37iJUfpwrk5XjjCoY8sM9X6N5pezoVsB6SSbhe7QN
         JxD3h3yOkl5YdNSMx491PxtQIBIcZ6zrgFBdNNZw+gGgLGF95XSgusgn9fVpvHhwLMFJ
         9NckeRIlLQcvfg1BMLyZoQuodg6snwaeLtLOI8fCu9qUiDSG16gW+qSGKHQ99kPLNdzN
         SZmwWfpeqcoyjqT5/R2Q9+OKluhsmU2gBmzDmwbMsCMjY5hqm5CEw57D0Grhc/f/cQOP
         6/Gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=P6u72cqb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j61si292620qtb.385.2017.10.06.07.23.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 Oct 2017 07:23:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=P6u72cqb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45240 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e0TXf-0000c1-6Z
	for alex.bennee@linaro.org; Fri, 06 Oct 2017 10:23:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53625)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e0TWk-0000GR-NX
	for qemu-devel@nongnu.org; Fri, 06 Oct 2017 10:23:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e0TWj-0006mS-Ep
	for qemu-devel@nongnu.org; Fri, 06 Oct 2017 10:22:58 -0400
Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230]:46576)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e0TWj-0006l1-3x
	for qemu-devel@nongnu.org; Fri, 06 Oct 2017 10:22:57 -0400
Received: by mail-wm0-x230.google.com with SMTP id m72so7952682wmc.1
	for <qemu-devel@nongnu.org>; Fri, 06 Oct 2017 07:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ih6TyIeGyOH7TGI5NapO9PCCJFHGvg7PoCtceS2XISU=;
	b=P6u72cqb/lCps4GV2q5tZNZzmS/feNIbKloZ5/lE7kpn+NdbgoAOa6xZ7TsoUYjGoC
	oDVWeesrE5GOsSNcyIKPFXiHjT0h8tuL5GymCCqPzRJ/1fbYmBKrXfy/SgjHYc/bCDaI
	IHGrsS4opc6iC9IJJ0pC8QAjrWlmUDW4OHHvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ih6TyIeGyOH7TGI5NapO9PCCJFHGvg7PoCtceS2XISU=;
	b=OZJe+SywC+2yExxawNqL04iSMR3NWgSzXoTQJQfvXgji5TwBbpJWOw4wQlnJlt/X27
	jD1qba67og/qO6i5/vk0JmqcvzaDzwjG6rrjNv1iK4H0qJw5kTdhOzwzLLqGbMF95Sru
	ugvscpSgYiiT/1P5MOH5MSopl4mj/EQVgpdeC/GDIHbZHUkGEDjC9tveTaL0WISrmFiw
	tvNiMcJ2aVQ8kkb6ANAsdnly+QfJttRIP18DSZVssVMxtSQgx4KFCkVq6MAHxzWjb3Zz
	tnTkwQPlAYNwoZaHGK19hsCwvFqxTrfkqFqsS5fmnWrPyRgq035j5D6YSBFOF+uDEXL8
	/vJA==
X-Gm-Message-State: AMCzsaUZufhEDvrZ2wEImGlRAvE0+6zrbH8evp4T0xiQaJ8tUVST9DRD
	5yWhQstlcBfX4H9yMJ+Y+zvdF/TcchLW6VUWBw8pYg==
X-Google-Smtp-Source: AOwi7QAzPZqj/dI8SWQWl4IMYfHZAZtEGovQ3yLWpr85y0+rZ/+RwC+I1GBtq1TRlk/WpWxQ/sofL2VKqMuZ1vhaN0I=
X-Received: by 10.28.236.203 with SMTP id h72mr2025802wmi.147.1507299775914;
	Fri, 06 Oct 2017 07:22:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Fri, 6 Oct 2017 07:22:35 -0700 (PDT)
In-Reply-To: <20170918195100.17593-14-andrew.smirnov@gmail.com>
References: <20170918195100.17593-1-andrew.smirnov@gmail.com>
	<20170918195100.17593-14-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Oct 2017 15:22:35 +0100
Message-ID: <CAFEAcA-WWzrcRHQZK4oXxz30hcOMuRpr+om7r=+reg7OysX3hA@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::230
Subject: Re: [Qemu-devel] [PATCH 13/17] i.MX: Add code to emulate i.MX2
 watchdog IP block
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +lVLUf+SJ7zn

On 18 September 2017 at 20:50, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
> Add enough code to emulate i.MX2 watchdog IP block so it would be
> possible to reboot the machine running Linux Guest.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  hw/misc/Makefile.objs      |   1 +
>  hw/misc/imx2_wdt.c         | 117 +++++++++++++++++++++++++++++++++++++++++++++
>  include/hw/misc/imx2_wdt.h |  36 ++++++++++++++
>  3 files changed, 154 insertions(+)
>  create mode 100644 hw/misc/imx2_wdt.c
>  create mode 100644 include/hw/misc/imx2_wdt.h
>
> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> index ac1be05a03..c393a93456 100644
> --- a/hw/misc/Makefile.objs
> +++ b/hw/misc/Makefile.objs
> @@ -35,6 +35,7 @@ obj-$(CONFIG_IMX) += imx25_ccm.o
>  obj-$(CONFIG_IMX) += imx6_ccm.o
>  obj-$(CONFIG_IMX) += imx6_src.o
>  obj-$(CONFIG_IMX) += imx7_ccm.o
> +obj-$(CONFIG_IMX) += imx2_wdt.o
>  obj-$(CONFIG_MILKYMIST) += milkymist-hpdmc.o
>  obj-$(CONFIG_MILKYMIST) += milkymist-pfpu.o
>  obj-$(CONFIG_MAINSTONE) += mst_fpga.o
> diff --git a/hw/misc/imx2_wdt.c b/hw/misc/imx2_wdt.c
> new file mode 100644
> index 0000000000..9d97a19511
> --- /dev/null
> +++ b/hw/misc/imx2_wdt.c
> @@ -0,0 +1,117 @@
> +/*
> + * Copyright (c) 2017, Impinj, Inc.
> + *
> + * i.MX2 Watchdog IP block
> + *
> + * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qemu-common.h"
> +#include "hw/hw.h"
> +#include "exec/memory.h"
> +#include "exec/address-spaces.h"
> +#include "hw/sysbus.h"
> +#include "qemu/log.h"
> +#include "qemu/timer.h"
> +#include "sysemu/sysemu.h"
> +#include "sysemu/watchdog.h"
> +#include "qemu/error-report.h"
> +#include "qemu/sizes.h"

That's an awful lot of includes for a very simple device. Are
you sure they're all needed?

> +
> +#include "hw/misc/imx2_wdt.h"
> +
> +
> +#define IMX2_WDT_WCR_WDA       BIT(5)          /* -> External Reset WDOG_B */
> +#define IMX2_WDT_WCR_SRS       BIT(4)          /* -> Software Reset Signal */
> +
> +static uint64_t imx2_wdt_read(void *opaque, hwaddr addr,
> +                              unsigned int size)
> +{
> +    IMX2WdtState *s = opaque;
> +    const size_t index = addr / sizeof(s->reg[0]);
> +
> +    if (index < ARRAY_SIZE(s->reg))
> +        return s->reg[index];
> +    else
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Bad offset 0x%"HWADDR_PRIx"\n", __func__, addr);
> +
> +    return 0xDEADBEEF;
> +}
> +
> +static void imx2_wdt_write(void *opaque, hwaddr addr,
> +                           uint64_t val64, unsigned int size)
> +{
> +    uint16_t value  = val64;
> +    IMX2WdtState *s = opaque;
> +    const size_t index = addr / sizeof(s->reg[0]);
> +
> +    switch (index) {
> +    case IMX2_WDT_WCR:
> +        if (value & (IMX2_WDT_WCR_WDA | IMX2_WDT_WCR_SRS))
> +            watchdog_perform_action();

Missing "break"?

Also checkpatch should tell you you need more braces.

> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Bad offset 0x%"HWADDR_PRIx"\n", __func__, addr);
> +    }
> +}
> +
> +static const MemoryRegionOps imx2_wdt_ops = {
> +    .read  = imx2_wdt_read,
> +    .write = imx2_wdt_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .valid = {
> +        /*
> +         * Our device would not work correctly if the guest was doing
> +         * unaligned access. This might not be a limitation on the real
> +         * device but in practice there is no reason for a guest to access
> +         * this device unaligned.
> +         */

This sounds like it's perhaps a job for .impl.unaligned
rather than .valid.unaligned ?

> +        .min_access_size = 4,
> +        .max_access_size = 4,
> +        .unaligned = false,
> +    },
> +};
> +
> +static void imx2_wdt_realize(DeviceState *dev, Error **errp)
> +{
> +    IMX2WdtState *s = IMX2_WDT(dev);
> +
> +    memory_region_init_io(&s->mmio, OBJECT(dev),
> +                          &imx2_wdt_ops, s,
> +                          TYPE_IMX2_WDT".mmio", SZ_64K);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
> +}
> +
> +static void imx2_wdt_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->realize = imx2_wdt_realize;
> +
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> +}
> +
> +static const TypeInfo imx2_wdt_info = {
> +    .name          = TYPE_IMX2_WDT,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(IMX2WdtState),
> +    .class_init    = imx2_wdt_class_init,
> +};

This device needs a reset function and vmstate description.

> +
> +static WatchdogTimerModel model = {
> +    .wdt_name = "imx2-watchdog",
> +    .wdt_description = "i.MX2 Watchdog",
> +};
> +
> +static void imx2_wdt_register_type(void)
> +{
> +    watchdog_add_model(&model);
> +    type_register_static(&imx2_wdt_info);
> +}

thanks
-- PMM
