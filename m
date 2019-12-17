Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5651191lff;
        Mon, 16 Dec 2019 23:46:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqx2jON1kqWsQJ18CvA0j768/TPJlcQh3CbHFysCBdDOA3NbFXM6195BmBN3xVtxFhE464nV
X-Received: by 2002:a9d:6251:: with SMTP id i17mr37083650otk.14.1576568800228;
        Mon, 16 Dec 2019 23:46:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576568800; cv=none;
        d=google.com; s=arc-20160816;
        b=IhfR3uPp9KImFGATjrW5a84zf6oCOWk3si+LNBzmuCN+Yw8hc8a6XOiezTS9jAbMI7
         co+a5/SN1ssduwk+0wAzFcZyNu5voDZOSgEPBmN/MgouY9WgGNyViDl6LDRyKDM+19QM
         l8Dwk3RRuEmrx0HZr604knPyihRntQx6A933ZDdv3kf6dnmFNdkEr60asXtTmp1pfV1K
         yO/YJUQ9ZOumPhMnXjOa3RzjW7HE2Zf/YOlQ9HI79F4+XLGcB6ireJVC1KaBOPY8IK4V
         6UPySaSFeGfnclRFTbnU4W8pjjejICy6zhh7ycagDsnrgrNz9hPA3RLqFiu9jG+cHnLh
         jWcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=clSXWJ465oCl5xsvLZl6nzcStl9K5YUiLH0doqBfb6E=;
        b=vVzNRmpTH5zfXojqOqceiRJ157wk6lJ92P03/k8yZX6vkXoNSoSI/Ze72MgXVuxIt2
         CdR9cCf4gCjUzWbkFm7d3ZxbUJPIPLK/QTsMBhqb0AhJ671OreoR4SCjvw2UHKeCBm6K
         QyvxAN/v8RgMafqBZY6Foqcdfib88lEAuyOT1Iem/zo5aCm6iXl+IZJSGRVVp9RKJ5YU
         aaIZmU7gmIjPCYjgDJAqoASm2DbztdmCZz/HLBK65ht4MeHz5eWR0AOatUxoUM9x7mQW
         nizSPwVvbbb8p1QJhSawkITPHR6FAPSH5LSL/fzudt8fCmoCBrvSjMKe1xn8G/Y8wGbq
         ftPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QkVwET0A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f23si11668703oto.205.2019.12.16.23.46.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Dec 2019 23:46:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QkVwET0A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ih7Z1-0005Vo-Dy
	for alex.bennee@linaro.org; Tue, 17 Dec 2019 02:46:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41927)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ih7Y4-000508-Ro
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 02:45:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ih7Y2-0001fH-Hf
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 02:45:40 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:29874
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ih7Y2-0001e9-CH
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 02:45:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576568737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=clSXWJ465oCl5xsvLZl6nzcStl9K5YUiLH0doqBfb6E=;
 b=QkVwET0A5kDOZRAaXHHXCzutWQSEWgxBFfwf9e0GG9CmbOetpi7LyHf4m1SAEUSzyJm6Nd
 KhpfyGMOHhAhOV+zPNwsG8P9aG66tz9Ne85Tw8SRNgCfzBR7R72KMSPQ7LC2qZtv15L5YY
 /lRoDUqSEc6XsHVa9/STGOxQZTNQTnE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-besaBpp0O6CbU6eNkvgPVg-1; Tue, 17 Dec 2019 02:45:35 -0500
Received: by mail-wr1-f70.google.com with SMTP id z10so1892517wrt.21
 for <qemu-devel@nongnu.org>; Mon, 16 Dec 2019 23:45:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=clSXWJ465oCl5xsvLZl6nzcStl9K5YUiLH0doqBfb6E=;
 b=nEp/BzMeGzPO19tWMLxyAIhH6YK0GIiaOVeiXld5bm9l0tiNJUATNnoZU9y4eTy8Dm
 sTrUPck9UxAqfg57z2e19viV9dCuksxcKnwT9JraF7OUzXALVP9gUEtUF6GcN+5DlfWM
 yTr7fDpR7sF7MCG4mDE2fuaMte+pW1OVprkkhLHU7WMNSxq8um1UvfR94UyCEFbXX4Ic
 /o8XNGg01IvV2RWvWR5R3KxW25oG3kvFqzu7+W6r6y7Wo2nVl79Pd3p3vKufWL6ZQykA
 AJ75e/WbO9hx2Z7VQ1e1HHXwRc9eo2F3+gAGdv9dwdMfNa/BUQHzcDxz/IDjfir9iICB
 Y8Jw==
X-Gm-Message-State: APjAAAUtlyDvUOgG1BRLI6VhP8pKdXZwQyMYSg60a5/vB5KZ4I/WmLlV
 reWBx7asX8LUViALC71ySLMDrYq5ihML8+4OXrCWvRkUa4RjZClK+Vo/mW1CElBr4adzrP69Rwf
 4he9z3XbE97dEt4o=
X-Received: by 2002:a1c:e91a:: with SMTP id q26mr3755215wmc.59.1576568734300; 
 Mon, 16 Dec 2019 23:45:34 -0800 (PST)
X-Received: by 2002:a1c:e91a:: with SMTP id q26mr3755174wmc.59.1576568733871; 
 Mon, 16 Dec 2019 23:45:33 -0800 (PST)
Received: from [192.168.1.35] (34.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.34])
 by smtp.gmail.com with ESMTPSA id p15sm1919624wma.40.2019.12.16.23.45.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2019 23:45:33 -0800 (PST)
Subject: Re: [PATCH v2 08/10] arm: allwinner-h3: add Security Identifier device
To: Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-devel@nongnu.org
References: <20191216233519.29030-1-nieklinnenbank@gmail.com>
 <20191216233519.29030-9-nieklinnenbank@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7153b766-4c3b-5272-3c3e-33e973e74e8f@redhat.com>
Date: Tue, 17 Dec 2019 08:45:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191216233519.29030-9-nieklinnenbank@gmail.com>
Content-Language: en-US
X-MC-Unique: besaBpp0O6CbU6eNkvgPVg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EfA2SN1vstVG

Hi Niek,

On 12/17/19 12:35 AM, Niek Linnenbank wrote:
> The Security Identifier device in Allwinner H3 System on Chip
> gives applications a per-board unique identifier. This commit
> adds support for the Allwinner H3 Security Identifier using
> a 128-bit UUID value as input.
> 
> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> ---
>   include/hw/arm/allwinner-h3.h      |   2 +
>   include/hw/misc/allwinner-h3-sid.h |  40 +++++++
>   hw/arm/allwinner-h3.c              |   7 ++
>   hw/arm/orangepi.c                  |   4 +
>   hw/misc/allwinner-h3-sid.c         | 179 +++++++++++++++++++++++++++++
>   hw/misc/Makefile.objs              |   1 +
>   hw/misc/trace-events               |   4 +
>   7 files changed, 237 insertions(+)
>   create mode 100644 include/hw/misc/allwinner-h3-sid.h
>   create mode 100644 hw/misc/allwinner-h3-sid.c
> 
> diff --git a/include/hw/arm/allwinner-h3.h b/include/hw/arm/allwinner-h3.h
> index 8128ae6131..c98c1972a6 100644
> --- a/include/hw/arm/allwinner-h3.h
> +++ b/include/hw/arm/allwinner-h3.h
> @@ -29,6 +29,7 @@
>   #include "hw/misc/allwinner-h3-clk.h"
>   #include "hw/misc/allwinner-h3-cpucfg.h"
>   #include "hw/misc/allwinner-h3-syscon.h"
> +#include "hw/misc/allwinner-h3-sid.h"
>   #include "target/arm/cpu.h"
>   
>   enum {
> @@ -77,6 +78,7 @@ typedef struct AwH3State {
>       AwH3ClockState ccu;
>       AwH3CpuCfgState cpucfg;
>       AwH3SysconState syscon;
> +    AwH3SidState sid;
>       GICState gic;
>       MemoryRegion sram_a1;
>       MemoryRegion sram_a2;
> diff --git a/include/hw/misc/allwinner-h3-sid.h b/include/hw/misc/allwinner-h3-sid.h
> new file mode 100644
> index 0000000000..79c9a24459
> --- /dev/null
> +++ b/include/hw/misc/allwinner-h3-sid.h
> @@ -0,0 +1,40 @@
> +/*
> + * Allwinner H3 Security ID emulation
> + *
> + * Copyright (C) 2019 Niek Linnenbank <nieklinnenbank@gmail.com>
> + *
> + * This program is free software: you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation, either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef HW_MISC_ALLWINNER_H3_SID_H
> +#define HW_MISC_ALLWINNER_H3_SID_H
> +
> +#include "hw/sysbus.h"
> +#include "qemu/uuid.h"
> +
> +#define TYPE_AW_H3_SID    "allwinner-h3-sid"
> +#define AW_H3_SID(obj)    OBJECT_CHECK(AwH3SidState, (obj), TYPE_AW_H3_SID)
> +
> +typedef struct AwH3SidState {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +    /*< public >*/
> +
> +    MemoryRegion iomem;
> +    uint32_t control;
> +    uint32_t rdkey;
> +    QemuUUID identifier;
> +} AwH3SidState;
> +
> +#endif
> diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
> index 1a9748ab2e..ba34f905cd 100644
> --- a/hw/arm/allwinner-h3.c
> +++ b/hw/arm/allwinner-h3.c
> @@ -196,6 +196,9 @@ static void aw_h3_init(Object *obj)
>   
>       sysbus_init_child_obj(obj, "cpucfg", &s->cpucfg, sizeof(s->cpucfg),
>                             TYPE_AW_H3_CPUCFG);
> +
> +    sysbus_init_child_obj(obj, "sid", &s->sid, sizeof(s->sid),
> +                          TYPE_AW_H3_SID);

Here add a property alias:

        object_property_add_alias(obj, "identifier", OBJECT(&s->sid),
                                  "identifier", &error_abort);

>   }
>   
>   static void aw_h3_realize(DeviceState *dev, Error **errp)
> @@ -332,6 +335,10 @@ static void aw_h3_realize(DeviceState *dev, Error **errp)
>       qdev_init_nofail(DEVICE(&s->cpucfg));
>       sysbus_mmio_map(SYS_BUS_DEVICE(&s->cpucfg), 0, s->memmap[AW_H3_CPUCFG]);
>   
> +    /* Security Identifier */
> +    qdev_init_nofail(DEVICE(&s->sid));
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sid), 0, s->memmap[AW_H3_SID]);
> +
>       /* Universal Serial Bus */
>       sysbus_create_simple(TYPE_AW_H3_EHCI, s->memmap[AW_H3_EHCI0],
>                            qdev_get_gpio_in(DEVICE(&s->gic),
> diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
> index 62cefc8c06..b01c4b4f01 100644
> --- a/hw/arm/orangepi.c
> +++ b/hw/arm/orangepi.c
> @@ -62,6 +62,10 @@ static void orangepi_init(MachineState *machine)
>           exit(1);
>       }
>   
> +    /* Setup SID properties */
> +    qdev_prop_set_string(DEVICE(&s->h3->sid), "identifier",
> +                         "8100c002-0001-0002-0003-000044556677");

And here use the alias:

        qdev_prop_set_string(DEVICE(&s->h3), "identifier",
                             "8100c002-0001-0002-0003-000044556677");

What means this value? Don't you want to be able to set it from command 
line?

>       /* Mark H3 object realized */
>       object_property_set_bool(OBJECT(s->h3), true, "realized", &error_abort);
>       if (error_abort != NULL) {
> diff --git a/hw/misc/allwinner-h3-sid.c b/hw/misc/allwinner-h3-sid.c
> new file mode 100644
> index 0000000000..c472f2bcc6
> --- /dev/null
> +++ b/hw/misc/allwinner-h3-sid.c
> @@ -0,0 +1,179 @@
> +/*
> + * Allwinner H3 Security ID emulation
> + *
> + * Copyright (C) 2019 Niek Linnenbank <nieklinnenbank@gmail.com>
> + *
> + * This program is free software: you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation, either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/units.h"
> +#include "hw/sysbus.h"
> +#include "migration/vmstate.h"
> +#include "qemu/log.h"
> +#include "qemu/module.h"
> +#include "qemu/guest-random.h"
> +#include "qapi/error.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/misc/allwinner-h3-sid.h"
> +#include "trace.h"
> +
> +/* SID register offsets */
> +enum {
> +    REG_PRCTL = 0x40,   /* Control */
> +    REG_RDKEY = 0x60,   /* Read Key */
> +};
> +
> +/* SID register flags */
> +enum {
> +    REG_PRCTL_WRITE   = 0x0002, /* Unknown write flag */
> +    REG_PRCTL_OP_LOCK = 0xAC00, /* Lock operation */
> +};
> +
> +static uint64_t allwinner_h3_sid_read(void *opaque, hwaddr offset,
> +                                      unsigned size)
> +{
> +    const AwH3SidState *s = (AwH3SidState *)opaque;
> +    uint64_t val = 0;
> +
> +    switch (offset) {
> +    case REG_PRCTL:    /* Control */
> +        val = s->control;
> +        break;
> +    case REG_RDKEY:    /* Read Key */
> +        val = s->rdkey;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad read offset 0x%04x\n",
> +                      __func__, (uint32_t)offset);
> +        return 0;
> +    }
> +
> +    trace_allwinner_h3_sid_read(offset, val, size);
> +
> +    return val;
> +}
> +
> +static void allwinner_h3_sid_write(void *opaque, hwaddr offset,
> +                                   uint64_t val, unsigned size)
> +{
> +    AwH3SidState *s = (AwH3SidState *)opaque;
> +
> +    trace_allwinner_h3_sid_write(offset, val, size);
> +
> +    switch (offset) {
> +    case REG_PRCTL:    /* Control */
> +        s->control = val;
> +
> +        if ((s->control & REG_PRCTL_OP_LOCK) &&
> +            (s->control & REG_PRCTL_WRITE)) {
> +            uint32_t id = s->control >> 16;
> +
> +            if (id < sizeof(QemuUUID)) {
> +                s->rdkey = (s->identifier.data[id]) |
> +                           (s->identifier.data[id + 1] << 8) |
> +                           (s->identifier.data[id + 2] << 16) |
> +                           (s->identifier.data[id + 3] << 24);

This is:

                    s->rdkey = ldl_le_p(&s->identifier.data[id]);

> +            }
> +        }
> +        s->control &= ~REG_PRCTL_WRITE;
> +        break;
> +    case REG_RDKEY:    /* Read Key */

Read in a write()?

Maybe we can simply /* fall through */ LOG_GUEST_ERROR?

> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad write offset 0x%04x\n",
> +                      __func__, (uint32_t)offset);
> +        break;
> +    }
> +}
> +
> +static const MemoryRegionOps allwinner_h3_sid_ops = {
> +    .read = allwinner_h3_sid_read,
> +    .write = allwinner_h3_sid_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .valid = {
> +        .min_access_size = 4,
> +        .max_access_size = 4,
> +        .unaligned = false

'false' is the default value, maybe we can omit it?

> +    },
> +    .impl.min_access_size = 4,
> +};
> +
> +static void allwinner_h3_sid_reset(DeviceState *dev)
> +{
> +    AwH3SidState *s = AW_H3_SID(dev);
> +
> +    /* Set default values for registers */
> +    s->control = 0;
> +    s->rdkey = 0;
> +}
> +
> +static void allwinner_h3_sid_realize(DeviceState *dev, Error **errp)
> +{
> +}

If you don't need realize(), just remove it. However maybe we want to 
check if the identifier is null, either warn/abort or generate a random one?

> +
> +static void allwinner_h3_sid_init(Object *obj)
> +{
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> +    AwH3SidState *s = AW_H3_SID(obj);
> +
> +    /* Fill UUID with zeroes by default */
> +    qemu_uuid_parse(UUID_NONE, &s->identifier);

AwH3SidState is zeroed just before this init() call. I think we don't 
need to zeroes the UUID again.

> +
> +    /* Memory mapping */
> +    memory_region_init_io(&s->iomem, OBJECT(s), &allwinner_h3_sid_ops, s,
> +                          TYPE_AW_H3_SID, 1 * KiB);
> +    sysbus_init_mmio(sbd, &s->iomem);
> +}
> +
> +static Property allwinner_h3_sid_properties[] = {
> +    DEFINE_PROP_UUID_NODEFAULT("identifier", AwH3SidState, identifier),
> +    DEFINE_PROP_END_OF_LIST()
> +};
> +
> +static const VMStateDescription allwinner_h3_sid_vmstate = {
> +    .name = "allwinner-h3-sid",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32(control, AwH3SidState),
> +        VMSTATE_UINT32(rdkey, AwH3SidState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void allwinner_h3_sid_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->reset = allwinner_h3_sid_reset;
> +    dc->realize = allwinner_h3_sid_realize;
> +    dc->vmsd = &allwinner_h3_sid_vmstate;
> +    dc->props = allwinner_h3_sid_properties;
> +}
> +
> +static const TypeInfo allwinner_h3_sid_info = {
> +    .name          = TYPE_AW_H3_SID,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_init = allwinner_h3_sid_init,
> +    .instance_size = sizeof(AwH3SidState),
> +    .class_init    = allwinner_h3_sid_class_init,
> +};
> +
> +static void allwinner_h3_sid_register(void)
> +{
> +    type_register_static(&allwinner_h3_sid_info);
> +}
> +
> +type_init(allwinner_h3_sid_register)
> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> index c4ca2ed689..f3620eee4e 100644
> --- a/hw/misc/Makefile.objs
> +++ b/hw/misc/Makefile.objs
> @@ -31,6 +31,7 @@ common-obj-$(CONFIG_IVSHMEM_DEVICE) += ivshmem.o
>   common-obj-$(CONFIG_ALLWINNER_H3) += allwinner-h3-clk.o
>   obj-$(CONFIG_ALLWINNER_H3) += allwinner-h3-cpucfg.o
>   common-obj-$(CONFIG_ALLWINNER_H3) += allwinner-h3-syscon.o
> +common-obj-$(CONFIG_ALLWINNER_H3) += allwinner-h3-sid.o
>   common-obj-$(CONFIG_REALVIEW) += arm_sysctl.o
>   common-obj-$(CONFIG_NSERIES) += cbus.o
>   common-obj-$(CONFIG_ECCMEMCTL) += eccmemctl.o
> diff --git a/hw/misc/trace-events b/hw/misc/trace-events
> index b93089d010..a777844ca3 100644
> --- a/hw/misc/trace-events
> +++ b/hw/misc/trace-events
> @@ -5,6 +5,10 @@ allwinner_h3_cpucfg_cpu_reset(uint8_t cpu_id, uint32_t reset_addr) "H3-CPUCFG: c
>   allwinner_h3_cpucfg_read(uint64_t offset, uint64_t data, unsigned size) "H3-CPUCFG: read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %" PRIu32
>   allwinner_h3_cpucfg_write(uint64_t offset, uint64_t data, unsigned size) "H3-CPUCFG: write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %" PRIu32
>   
> +# allwinner-h3-sid.c
> +allwinner_h3_sid_read(uint64_t offset, uint64_t data, unsigned size) "H3-SID: read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %" PRIu32
> +allwinner_h3_sid_write(uint64_t offset, uint64_t data, unsigned size) "H3-SID: write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %" PRIu32
> +
>   # eccmemctl.c
>   ecc_mem_writel_mer(uint32_t val) "Write memory enable 0x%08x"
>   ecc_mem_writel_mdr(uint32_t val) "Write memory delay 0x%08x"
> 

