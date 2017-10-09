Received: by 10.223.197.9 with SMTP id q9csp2590621wrf;
        Mon, 9 Oct 2017 08:55:12 -0700 (PDT)
X-Received: by 10.55.27.25 with SMTP id b25mr9688738qkb.144.1507564512291;
        Mon, 09 Oct 2017 08:55:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507564512; cv=none;
        d=google.com; s=arc-20160816;
        b=MuX5XOqrnMrunLkDCl/RtPUQlD94FBADKNEm+K2HSyakw7SnwM0GZDZq1AiItmRdgq
         5GN/XXgx+VnmyRzemhglo/d7a/tte6XdI6zzlYCZSK56ril3D5pQj5TwiJl1KooOG4Jf
         aXqgvsk+YKinQAQex+UbXtEHHVt7r6lwOmsEXAiPrlyWE9KMNJSR1bUB2pU+32KklL/C
         iCNhoOzrEWfYj/qjLbzW37avYoyEYbRvH6t0t38zjGUTAjkAJYz3/8LCbPsQY3FgiBbp
         /PsVTlwAIArWNtZEsjYCOt8O4rG3G6NBXnPMsW6x6cN3ZL4546ZMDXn2NtW+hmoJdk7/
         YNOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=6bTF9/l82dJ67/GliEMwI7oCMcU3hDHePuA7s+I0Cqo=;
        b=aqGuqDI6gYNgn26A8RNDu7PIAL40L2LpBP9wHUklqeOw/Ouhb65i6uH+anjmUkivHM
         SOvcmE4+TgxfOpoia3GaMSyatff17aSLi1c1mqoHOnYB7us3ZGKWBYZ/3URmh9WvrY40
         3c3wn/+oVzAHKHF1ebF1UrYf8Tqo04r/VgSY/pdvcUxMapjpNU6T62ZAQcpwrlVyKVv8
         /37R5sZEJKFV7QbKAy960zNks0qpJJ8aCNxysPrRJ/Cwgl6L9uQOaVy0gP1kEw7s4zPP
         09PfFyPsTskjYqnjg8AuGSkZ1WySYwMDtZfeRmvdc/BbW83ypIJwNDH5yJqoPQRuCoOO
         wypQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=b1zyBRay;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u1si6447882qkh.136.2017.10.09.08.55.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Oct 2017 08:55:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=b1zyBRay;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58497 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1aOd-0008CL-OJ
	for alex.bennee@linaro.org; Mon, 09 Oct 2017 11:55:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50856)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e1aOR-000894-7v
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 11:55:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e1aOQ-0006Jl-3N
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 11:54:59 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:38026)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1e1aOP-0006Iq-Ts; Mon, 09 Oct 2017 11:54:58 -0400
Received: by mail-qk0-x241.google.com with SMTP id 17so9675592qkq.5;
	Mon, 09 Oct 2017 08:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6bTF9/l82dJ67/GliEMwI7oCMcU3hDHePuA7s+I0Cqo=;
	b=b1zyBRayN7XupBikKg5DiOOj8KbpBqKmEQxUWAL75hQKGfycssKNtxwFohPXG7B2f/
	3DNkGIxpNaWAgs1YD58X69VuT3wyOU6BXUgqyXQI54PV1boc9/1nbebdw1GGoolcp9SA
	+oD8TtdaMK2ZhccEk1uq8VljbcmZiBqCQvAestsOQLwS1BTK/vZTdOD7ONyoECr9n4U2
	YmfUOe/geh3drjtN3TGPjCdWKnVrY6cPsBoh0IGtb0p//8g3ymTm1yY/xnS+wNBEAjlC
	WE1/BS3HS9Pbnw70vUslyzpqPoPgtWsiOJc2OPFZmDpjkh6AXE0ZjhTiYBDNE+nbjh4q
	81tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6bTF9/l82dJ67/GliEMwI7oCMcU3hDHePuA7s+I0Cqo=;
	b=lhlSi23XHjtUGrYkdejOK33gHFIaKAMzL7smB0R6i5Y2Ke9Q/XdMwBJ7y5XQHn5HJ6
	M4q4nAA66phpWb32qimyzXOuf7LN6XNJAbgtvgUKNrFj/klvKQWVAtKJ8pVrSvJ5gjih
	jxh32bYBC9JEslFWcLj5erMSTJkupu1yl4zjw2eyVtcEgVcb4OJ/EAljB68o4iSRXOdU
	7stJln4NnZ42t3dbLx+u9rLiljeNtoBEpGROVu+wMuaW+9/WnahzI6rUHZoxOW/MDIjK
	i8UxyAc8/p+kPbRbvGn2nFF6N68mrpUC9n6xVl550hPajsLRW5WEF9c4c7zj8MX5C7UF
	pyGQ==
X-Gm-Message-State: AMCzsaVD9tANKddDIb7694ElMNK4vMxin0LhJaYIdcztzFoG7DpJRKx8
	97K8n/xwMW3pPgQ4NBNwcBDon7iTDY1i13P+Xiw=
X-Google-Smtp-Source: AOwi7QCU/Y/cNRG4zY+vlmk2HHzx3u3RdvN+xCCmyANjGjRt5nnkwGpDjpXLJhej1Po6J9tvXRrbSAWuks4dtEGfHH8=
X-Received: by 10.55.10.18 with SMTP id 18mr9053565qkk.184.1507564497077; Mon,
	09 Oct 2017 08:54:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.165 with HTTP; Mon, 9 Oct 2017 08:54:56 -0700 (PDT)
In-Reply-To: <CAFEAcA-WWzrcRHQZK4oXxz30hcOMuRpr+om7r=+reg7OysX3hA@mail.gmail.com>
References: <20170918195100.17593-1-andrew.smirnov@gmail.com>
	<20170918195100.17593-14-andrew.smirnov@gmail.com>
	<CAFEAcA-WWzrcRHQZK4oXxz30hcOMuRpr+om7r=+reg7OysX3hA@mail.gmail.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Mon, 9 Oct 2017 08:54:56 -0700
Message-ID: <CAHQ1cqEvjvCM0UT7ZndTZiuHAMMAH2TSZ-B+cEbL8M62F3JFwQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-arm] [PATCH 13/17] i.MX: Add code to emulate i.MX2
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6e3DDiuoTs6f

On Fri, Oct 6, 2017 at 7:22 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 18 September 2017 at 20:50, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
>> Add enough code to emulate i.MX2 watchdog IP block so it would be
>> possible to reboot the machine running Linux Guest.
>>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: qemu-devel@nongnu.org
>> Cc: qemu-arm@nongnu.org
>> Cc: yurovsky@gmail.com
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>> ---
>>  hw/misc/Makefile.objs      |   1 +
>>  hw/misc/imx2_wdt.c         | 117 +++++++++++++++++++++++++++++++++++++++++++++
>>  include/hw/misc/imx2_wdt.h |  36 ++++++++++++++
>>  3 files changed, 154 insertions(+)
>>  create mode 100644 hw/misc/imx2_wdt.c
>>  create mode 100644 include/hw/misc/imx2_wdt.h
>>
>> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
>> index ac1be05a03..c393a93456 100644
>> --- a/hw/misc/Makefile.objs
>> +++ b/hw/misc/Makefile.objs
>> @@ -35,6 +35,7 @@ obj-$(CONFIG_IMX) += imx25_ccm.o
>>  obj-$(CONFIG_IMX) += imx6_ccm.o
>>  obj-$(CONFIG_IMX) += imx6_src.o
>>  obj-$(CONFIG_IMX) += imx7_ccm.o
>> +obj-$(CONFIG_IMX) += imx2_wdt.o
>>  obj-$(CONFIG_MILKYMIST) += milkymist-hpdmc.o
>>  obj-$(CONFIG_MILKYMIST) += milkymist-pfpu.o
>>  obj-$(CONFIG_MAINSTONE) += mst_fpga.o
>> diff --git a/hw/misc/imx2_wdt.c b/hw/misc/imx2_wdt.c
>> new file mode 100644
>> index 0000000000..9d97a19511
>> --- /dev/null
>> +++ b/hw/misc/imx2_wdt.c
>> @@ -0,0 +1,117 @@
>> +/*
>> + * Copyright (c) 2017, Impinj, Inc.
>> + *
>> + * i.MX2 Watchdog IP block
>> + *
>> + * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "qapi/error.h"
>> +#include "qemu-common.h"
>> +#include "hw/hw.h"
>> +#include "exec/memory.h"
>> +#include "exec/address-spaces.h"
>> +#include "hw/sysbus.h"
>> +#include "qemu/log.h"
>> +#include "qemu/timer.h"
>> +#include "sysemu/sysemu.h"
>> +#include "sysemu/watchdog.h"
>> +#include "qemu/error-report.h"
>> +#include "qemu/sizes.h"
>
> That's an awful lot of includes for a very simple device. Are
> you sure they're all needed?

No, I am not sure. I'll double-check.

>
>> +
>> +#include "hw/misc/imx2_wdt.h"
>> +
>> +
>> +#define IMX2_WDT_WCR_WDA       BIT(5)          /* -> External Reset WDOG_B */
>> +#define IMX2_WDT_WCR_SRS       BIT(4)          /* -> Software Reset Signal */
>> +
>> +static uint64_t imx2_wdt_read(void *opaque, hwaddr addr,
>> +                              unsigned int size)
>> +{
>> +    IMX2WdtState *s = opaque;
>> +    const size_t index = addr / sizeof(s->reg[0]);
>> +
>> +    if (index < ARRAY_SIZE(s->reg))
>> +        return s->reg[index];
>> +    else
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "%s: Bad offset 0x%"HWADDR_PRIx"\n", __func__, addr);
>> +
>> +    return 0xDEADBEEF;
>> +}
>> +
>> +static void imx2_wdt_write(void *opaque, hwaddr addr,
>> +                           uint64_t val64, unsigned int size)
>> +{
>> +    uint16_t value  = val64;
>> +    IMX2WdtState *s = opaque;
>> +    const size_t index = addr / sizeof(s->reg[0]);
>> +
>> +    switch (index) {
>> +    case IMX2_WDT_WCR:
>> +        if (value & (IMX2_WDT_WCR_WDA | IMX2_WDT_WCR_SRS))
>> +            watchdog_perform_action();
>
> Missing "break"?
>

Oops, good catch! Will fix in v2.

> Also checkpatch should tell you you need more braces.
>

Yeah, I definitely forgot to run this through checkpatch, sorry.

>> +    default:
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "%s: Bad offset 0x%"HWADDR_PRIx"\n", __func__, addr);
>> +    }
>> +}
>> +
>> +static const MemoryRegionOps imx2_wdt_ops = {
>> +    .read  = imx2_wdt_read,
>> +    .write = imx2_wdt_write,
>> +    .endianness = DEVICE_NATIVE_ENDIAN,
>> +    .valid = {
>> +        /*
>> +         * Our device would not work correctly if the guest was doing
>> +         * unaligned access. This might not be a limitation on the real
>> +         * device but in practice there is no reason for a guest to access
>> +         * this device unaligned.
>> +         */
>
> This sounds like it's perhaps a job for .impl.unaligned
> rather than .valid.unaligned ?
>

This was a snippet I copied from some already existing emulation
block, so I didn't pay too much attention. But yeah, now that you
suggested it, I think I should've used impl.valid as you suggest. Will
fix in v2.

>> +        .min_access_size = 4,
>> +        .max_access_size = 4,
>> +        .unaligned = false,
>> +    },
>> +};
>> +
>> +static void imx2_wdt_realize(DeviceState *dev, Error **errp)
>> +{
>> +    IMX2WdtState *s = IMX2_WDT(dev);
>> +
>> +    memory_region_init_io(&s->mmio, OBJECT(dev),
>> +                          &imx2_wdt_ops, s,
>> +                          TYPE_IMX2_WDT".mmio", SZ_64K);
>> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
>> +}
>> +
>> +static void imx2_wdt_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>> +
>> +    dc->realize = imx2_wdt_realize;
>> +
>> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>> +}
>> +
>> +static const TypeInfo imx2_wdt_info = {
>> +    .name          = TYPE_IMX2_WDT,
>> +    .parent        = TYPE_SYS_BUS_DEVICE,
>> +    .instance_size = sizeof(IMX2WdtState),
>> +    .class_init    = imx2_wdt_class_init,
>> +};
>
> This device needs a reset function and vmstate description.
>

OK, will fix in v2.

Thanks
Andrey Smirnov
