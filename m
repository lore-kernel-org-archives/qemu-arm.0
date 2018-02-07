Received: by 10.28.71.27 with SMTP id u27csp782868wma;
        Wed, 7 Feb 2018 06:26:46 -0800 (PST)
X-Google-Smtp-Source: AH8x226cpMQO/Va20tLSJfgd8E/DIbla/uzNkYR/+4lA8Gwn5COlBoU/GRplBsoyGuOjbSjxw2ed
X-Received: by 10.129.16.134 with SMTP id 128mr3936026ywq.366.1518013606871;
        Wed, 07 Feb 2018 06:26:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518013606; cv=none;
        d=google.com; s=arc-20160816;
        b=mDDT31Gt7HpTGhjd1RlYVuUCajm21H1HSVDAcnsHYoAtw2L/w1Y46BybfF3liXiKnL
         TS/iuNzExm+eQmqW5JaRtedjO239ln2wlj5MH4UZMNN9TO18gRA91NttYXJsevCn/atD
         XYQAFxdZcoq+WjC/zVaSOhtcH9AiF/YrOcWRFocgS4k4BXfp0qG5QB4MIrQZsj79X8Pc
         Q7VBmjqcLojna1U/z6HgqXYDtsacjzbDvJiWZ8SDhrbQZB5bNsxHZkdtyWNsc3yNyJc+
         O9V9UkADbRQoeFsJ/67wf4lS9oxrh5Ie9yCmjhRKYmfIQO63xevDrH78fIIbFuW/69QD
         YjrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=AmjFt+MI21oRHx8k3tMZi+F3bsmXpf1IcpzNSjIg0fg=;
        b=htETAcXooJHgiMMsFRW364HX5GOKrSQb7GRt1Nkt/7hbava2PAxzSWyOWf11Ll8u77
         brvyrERBw/Rw7a91fsg9pozPFJqCGu68z8gDOYrxdG9urv63i6DufD6c+g+QxAA0oAaE
         8Tf09zI8GMZ+zJ2xuSim14I8nLQ7OefPChUkXkFEGkcpsn9FVH20+/nwgdu0MocCP19P
         8EKEDVOeSWtNfUK7xB2WwId6VySqWOV6kGsE9jZY+ENgpwA3Jf3tbvJNktupG7Eu5bdD
         wU+x9kRq5tKJFFFDnJ/7MNsPHj8AG20azl8WqmkHQYwiXwVwhzA4d1ap1p2NGfXmYfaI
         ornQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iKlfKOXx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u15si285655ybj.430.2018.02.07.06.26.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Feb 2018 06:26:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iKlfKOXx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44966 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejQgQ-0000Aa-AO
	for alex.bennee@linaro.org; Wed, 07 Feb 2018 09:26:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55045)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejQg2-000092-BA
	for qemu-devel@nongnu.org; Wed, 07 Feb 2018 09:26:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejQfw-0001cg-1u
	for qemu-devel@nongnu.org; Wed, 07 Feb 2018 09:26:22 -0500
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:40145)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejQfv-0001cb-SW; Wed, 07 Feb 2018 09:26:15 -0500
Received: by mail-qk0-x244.google.com with SMTP id e20so1277980qkm.7;
	Wed, 07 Feb 2018 06:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=AmjFt+MI21oRHx8k3tMZi+F3bsmXpf1IcpzNSjIg0fg=;
	b=iKlfKOXxQVX0C6iHVxWa9gYjNl23wT7oO3pHy1bodwvxiB+QXOF5g7BTFHROiO78dU
	Mvc+lMLpIRF3BO2lVoekLqdC5E38V0te6HvGQMHp9qOLQUL2+nCtP3qh6vkFAd6Xd/Tg
	FwCXvo6160frhflI0YF7VKsNMjujz0enkaDjydZCeJY7kJqUd7H2l2MDoNECEnLCUKBX
	uioTFT9VWXoMDjBnzkIvKbDQdYPRuvY6zTxORTUOUH9ZosI4YO1ASrYlezVzzo47MxCy
	5yh3Qh6f7OzxMLY0rttnTUgbBWa3L3E9SmUtanUN7vk+HQJY3coPaol3MswGcFOyL1MI
	sn+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=AmjFt+MI21oRHx8k3tMZi+F3bsmXpf1IcpzNSjIg0fg=;
	b=pDUiaQ/q9xQ1V9DQT/5Cj0Kf3W0/JIcYrDRgikIHOGXGodj0S0Fmt1SG2ztdP/YXhO
	6E5NC6E6z76b6hQDk18XSSlxDz7aPSxPkh6dKSTgsLZz/w8N0SVrBH8x/YTVoanyVqeo
	vprqx+I0cSpOTs+sQe6+5Pz6oBioZmVqURVKJ9gblt8sSnWjdpzqjktN4HQ6U6nKblPV
	XTYzMpq93jIiwd3wA6eAaAwQ3MRoaZ96k579AcGz9xfJUmHQPu/prEiy6E69HgmkoGrs
	bMjaqv4JxyJjviXMJx+tcrRwa9cLJAOJdHLshUwU3T19NGMS9qMI1pp/3N2Spi6yEjPo
	v2tw==
X-Gm-Message-State: APf1xPAleUYTvSLZdoL9wXFFvUrxD4cm+Zust1eOWpL7teBscY2RN932
	VeLjpOyyp1GdchMrBtfwOfk=
X-Received: by 10.55.168.80 with SMTP id r77mr9520732qke.157.1518013575307;
	Wed, 07 Feb 2018 06:26:15 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id t7sm1072664qkf.86.2018.02.07.06.26.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Feb 2018 06:26:14 -0800 (PST)
To: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org
References: <20180207042438.15422-1-andrew.smirnov@gmail.com>
	<20180207042438.15422-5-andrew.smirnov@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <202480a7-a417-f973-73a1-19c3a813f1f7@amsat.org>
Date: Wed, 7 Feb 2018 11:26:11 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180207042438.15422-5-andrew.smirnov@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v5 04/14] i.MX: Add code to
 emulate i.MX2 watchdog IP block
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@zoho.com>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4hehqBL1ZLdE

Hi Andrey,

On 02/07/2018 01:24 AM, Andrey Smirnov wrote:
> Add enough code to emulate i.MX2 watchdog IP block so it would be
> possible to reboot the machine running Linux Guest.
> 
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Cc: Marcel Apfelbaum <marcel.apfelbaum@zoho.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  hw/misc/Makefile.objs      |  1 +
>  hw/misc/imx2_wdt.c         | 89 ++++++++++++++++++++++++++++++++++++++++++++++
>  include/hw/misc/imx2_wdt.h | 33 +++++++++++++++++

I recommend you to setup scripts/git.orderfile to ease review.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>  3 files changed, 123 insertions(+)
>  create mode 100644 hw/misc/imx2_wdt.c
>  create mode 100644 include/hw/misc/imx2_wdt.h
> 
> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> index a28e5e49b0..4b2b705a6c 100644
> --- a/hw/misc/Makefile.objs
> +++ b/hw/misc/Makefile.objs
> @@ -34,6 +34,7 @@ obj-$(CONFIG_IMX) += imx25_ccm.o
>  obj-$(CONFIG_IMX) += imx6_ccm.o
>  obj-$(CONFIG_IMX) += imx6_src.o
>  obj-$(CONFIG_IMX) += imx7_ccm.o
> +obj-$(CONFIG_IMX) += imx2_wdt.o
>  obj-$(CONFIG_MILKYMIST) += milkymist-hpdmc.o
>  obj-$(CONFIG_MILKYMIST) += milkymist-pfpu.o
>  obj-$(CONFIG_MAINSTONE) += mst_fpga.o
> diff --git a/hw/misc/imx2_wdt.c b/hw/misc/imx2_wdt.c
> new file mode 100644
> index 0000000000..e47e442592
> --- /dev/null
> +++ b/hw/misc/imx2_wdt.c
> @@ -0,0 +1,89 @@
> +/*
> + * Copyright (c) 2018, Impinj, Inc.
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
> +#include "qemu/bitops.h"
> +#include "sysemu/watchdog.h"
> +
> +#include "hw/misc/imx2_wdt.h"
> +
> +#define IMX2_WDT_WCR_WDA    BIT(5)      /* -> External Reset WDOG_B */
> +#define IMX2_WDT_WCR_SRS    BIT(4)      /* -> Software Reset Signal */
> +
> +static uint64_t imx2_wdt_read(void *opaque, hwaddr addr,
> +                              unsigned int size)
> +{
> +    return 0;
> +}
> +
> +static void imx2_wdt_write(void *opaque, hwaddr addr,
> +                           uint64_t value, unsigned int size)
> +{
> +    if (addr == IMX2_WDT_WCR &&
> +        (value & (IMX2_WDT_WCR_WDA | IMX2_WDT_WCR_SRS))) {
> +        watchdog_perform_action();
> +    }
> +}
> +
> +static const MemoryRegionOps imx2_wdt_ops = {
> +    .read  = imx2_wdt_read,
> +    .write = imx2_wdt_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .impl = {
> +        /*
> +         * Our device would not work correctly if the guest was doing
> +         * unaligned access. This might not be a limitation on the
> +         * real device but in practice there is no reason for a guest
> +         * to access this device unaligned.
> +         */
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
> +                          TYPE_IMX2_WDT".mmio",
> +                          IMX2_WDT_REG_NUM * sizeof(uint16_t));
> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
> +}
> +
> +static void imx2_wdt_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->realize = imx2_wdt_realize;
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> +}
> +
> +static const TypeInfo imx2_wdt_info = {
> +    .name          = TYPE_IMX2_WDT,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(IMX2WdtState),
> +    .class_init    = imx2_wdt_class_init,
> +};
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
> +type_init(imx2_wdt_register_type)
> diff --git a/include/hw/misc/imx2_wdt.h b/include/hw/misc/imx2_wdt.h
> new file mode 100644
> index 0000000000..8afc99a10e
> --- /dev/null
> +++ b/include/hw/misc/imx2_wdt.h
> @@ -0,0 +1,33 @@
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
> +#ifndef IMX2_WDT_H
> +#define IMX2_WDT_H
> +
> +#include "hw/sysbus.h"
> +
> +#define TYPE_IMX2_WDT "imx2.wdt"
> +#define IMX2_WDT(obj) OBJECT_CHECK(IMX2WdtState, (obj), TYPE_IMX2_WDT)
> +
> +enum IMX2WdtRegisters {
> +    IMX2_WDT_WCR     = 0x0000,
> +    IMX2_WDT_REG_NUM = 0x0008 / sizeof(uint16_t) + 1,
> +};
> +
> +
> +typedef struct IMX2WdtState {
> +    /* <private> */
> +    SysBusDevice parent_obj;
> +
> +    MemoryRegion mmio;
> +} IMX2WdtState;
> +
> +#endif /* IMX7_SNVS_H */
> 
