Received: by 10.28.71.27 with SMTP id u27csp7870wma;
        Wed, 31 Jan 2018 09:08:33 -0800 (PST)
X-Google-Smtp-Source: AH8x227+PdL/MM4pQkSqysqLVGRee34JTrNeteCo6Ir5wKTPTjZEWsySoWmksqK1Jv5ovCGhgYKT
X-Received: by 10.129.165.11 with SMTP id c11mr22576945ywh.311.1517418513471;
        Wed, 31 Jan 2018 09:08:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517418513; cv=none;
        d=google.com; s=arc-20160816;
        b=sCLxIlSbQiFLoQR11w4NiMM8XjFS+TI9NJVaCBakUyyeD2bjlHuBlbbRjuAuFEA8ac
         Qx9NbiLwpksp34tvmMv6xFcQINALw7+nTf+RGRATtj0DxbvMrNEH9TOVMFe/vyAFXG5Q
         8HZZCuZWqAVI/w4FYwzhl6iVkSs1chtvpr8C7gF8KktNwUfpyc0uLAGQcm4tUnkZpx0S
         BcGGgpPMBQ3PX/XaltFP/aoZUncH7GHUpXYWI/Ulmj5nZ9qsGlXBVdsuWsMKhCuDBigd
         kkhPPNT9FCqFNDjAAbjuRCgut9uImkODpCOVR9EUs3TL3+m5e2pGuMbf+4Ls/YEhZoyF
         Fbzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=+Cp4el9akJNpHKULlvddX+j7iA2/udGNL+Ynby3KXvM=;
        b=cCKCpmYaz3JgJf/wr0f9UXcMLED0ThkeJHAFexuUQM7+7BldvKZ7SS7TljXZLUiFGc
         joku0/HIHJKdZsKhx66oS/lne6ORhYzu2oSMBC/UeCrV5u7eTMWH1dPAfgPhegypXmIg
         +O32MuUQ283hNaFc5Wwg/aLDPVAJuvC69c2L3cGOuVj2fnEDO9kdgi7Sl9BfmfMmBr4A
         l8zDNah7bsuF0c06xoZnGYTbw+ZRMgCbCPrGqrkS11xJ+SYWAxDVgVZ7muM6VsAlxpKg
         e5PTToA/gf2eN/uQpzVmYETLkkJZQqid4oMkQs9f+kBivOdj3/Nt324+YkhvUWOr9Sf6
         d0gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BloZ0q5l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l40si3299331ywa.181.2018.01.31.09.08.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 31 Jan 2018 09:08:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BloZ0q5l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45367 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1egvs8-0006Tv-Sn
	for alex.bennee@linaro.org; Wed, 31 Jan 2018 12:08:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33216)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1egvrs-0006Oh-Sa
	for qemu-arm@nongnu.org; Wed, 31 Jan 2018 12:08:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1egvrn-0008Tz-RQ
	for qemu-arm@nongnu.org; Wed, 31 Jan 2018 12:08:16 -0500
Received: from mail-qk0-x22e.google.com ([2607:f8b0:400d:c09::22e]:40313)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1egvrX-0008Ob-7P; Wed, 31 Jan 2018 12:07:55 -0500
Received: by mail-qk0-x22e.google.com with SMTP id d18so15643820qke.7;
	Wed, 31 Jan 2018 09:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=+Cp4el9akJNpHKULlvddX+j7iA2/udGNL+Ynby3KXvM=;
	b=BloZ0q5lwczIeelh3reuKwopTBz+g4Wbs7qeeUii0s/7S5HGzVERpQ7c+gvJrgNJxG
	6LC9wvOqEoKevFSwsgs3wIHzknIwTd1Iwl7l6H7+9l4CNTkD6J5DTgfnRAGWIm9HVbvY
	LEmCPymVOkp8uimp0tGEG99hNG32AnzWmmRKH/Yv+6bl5/UVK5LQuH4wOz4f07Nz0TkK
	iLwvlcHtz5yH3zFZyl3CE5CftOtsayYHmMmXqLPIKG9N7JwbsjtV3y5JhB4yi4qDP26y
	YJ+Zg+XDUH9Cy/2VxtORe9EOZY5lqVCzbnO/7y9qHjX3reBzyKi6A1MJNGJHUg6Knf9/
	HIKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=+Cp4el9akJNpHKULlvddX+j7iA2/udGNL+Ynby3KXvM=;
	b=GorM2e6IjmAu+9eLBLzKsf1VgfhVJ5L4M529O89p9FXPLwsh5Fs/ChC+RpjRAsCg1U
	i017W7B8yT6rGIx3doqojkebmr8ROXZesvwdDEdM82CUaPqzO2l11zp3bCaARDgG9XIw
	4O8Tjvsd1wXcoCU7Nugx9bI5YIJO4cA+21kNBojYiPCqIyjJY5FqJRtH65FVMcir9267
	cVdq9hAqGUSzuS1vu4XJrU9fN49qzJSbpJ97OYFejwSW2k7ji8/zl2RcaqP3jk22L5u0
	l3eNIQs5JtTATEIl1Fc/PFF59JzhfrNJ5TjiOqS5giaSXxsF+wRrAF8vkfw9zyeuYgKT
	Wvrg==
X-Gm-Message-State: AKwxyteuqqlHgStQcmD+IvH3BNt7rrlx5xhyGua3ZY3voeOxnFaJH0jL
	0rA46ormFaldLKxFLPJTW6c=
X-Received: by 10.55.143.5 with SMTP id r5mr47739541qkd.357.1517418474783;
	Wed, 31 Jan 2018 09:07:54 -0800 (PST)
Received: from [10.17.0.157] ([190.210.239.69])
	by smtp.gmail.com with ESMTPSA id
	k2sm14096530qtk.60.2018.01.31.09.07.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Jan 2018 09:07:54 -0800 (PST)
To: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org
References: <20180116013709.13830-1-andrew.smirnov@gmail.com>
	<20180116013709.13830-5-andrew.smirnov@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ec9fd964-d572-c1b2-82f9-8257975166d1@amsat.org>
Date: Wed, 31 Jan 2018 14:07:51 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180116013709.13830-5-andrew.smirnov@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22e
Subject: Re: [Qemu-arm] [PATCH v4 04/14] i.MX: Add code to emulate i.MX2
 watchdog IP block
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 45isP31VynPS

On 01/15/2018 10:36 PM, Andrey Smirnov wrote:
> Add enough code to emulate i.MX2 watchdog IP block so it would be
> possible to reboot the machine running Linux Guest.
> 
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  hw/misc/Makefile.objs      |  1 +
>  hw/misc/imx2_wdt.c         | 89 ++++++++++++++++++++++++++++++++++++++++++++++
>  include/hw/misc/imx2_wdt.h | 33 +++++++++++++++++
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
> index 0000000000..76bb98a525
> --- /dev/null
> +++ b/hw/misc/imx2_wdt.c
> @@ -0,0 +1,89 @@
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
> +#include "qemu/bitops.h"
> +#include "qemu/osdep.h"
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

Maybe you can just drop the .read entry and imx2_wdt_read().

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
