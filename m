Received: by 10.223.159.82 with SMTP id f18csp759827wrg;
        Tue, 21 Nov 2017 06:39:06 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZ/5hLa6PzfyFZe+AI/ZzkuNKkem3m/3T2Wn+YefSt8xcbMI72RsLTJeJK4MHFAAdqFcpSV
X-Received: by 10.129.129.67 with SMTP id r64mr11565950ywf.338.1511275146224;
        Tue, 21 Nov 2017 06:39:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511275146; cv=none;
        d=google.com; s=arc-20160816;
        b=N2qDA7oc9Dg2v0uJw+Lukvy/D9Y2d1X33gXlzamVGEOA7sG5HKhoSAGIMhnfHd4lk9
         RXpi8/sUYdFJovVk5GRRBb4ueUwCvzJaOzZcPub5wilUoJHjIblul1psfyl4VtB78Xoo
         I5zQHQ14vz28M00JtmuU3UXysQIQWJHq3Q8Bl5S3xQzAdtdu8wlAcYVnmqK/sjYnrS+y
         SUpjq0eqZWvQ4nZEaH2yI/1O29DgvCLUhmv1a68VoKc31AHYzNH4GetZJ5Hp/Az2AVRf
         663W1YFz+AssE6MvvrXiLyclPI8IN6sXF1o9K+bd5pRAq0hRjedGqzLSIrqc8WR0Lu+q
         aVNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=86/tIBDcCgxiEPrKCIPGZqYkJRDIrSN9h3O1G2cU3OU=;
        b=noO4Jv12+0MVo5LT4jKvpg0HNLnq7oeiFEdujqPwkBgmw4omqpieJCykU3aMNh70NN
         HiKqTkmgyjqKJ9aQWhhY66rQO+pBLmr2bfMo/VDXztAnEUvLtIk9G+gSxPRsc1QXtljk
         2jrE0kVVH7SyGCpELxFgdyDDooB8JwTASlGfW83sAs7s5yEz3vNtu1xL0e5RR2nMlQqp
         So32jScEKKwJoyZ0UF6RP2Ky1mtoosruZKK8WLxns4xD1GVaHXR42kPAg3aFqBUbiE2W
         Px9dFmH9AOhfRFkJu81SlSySKOQ88xvfpOasUAQdJgXak6Q0LzyYyxgigezhbyOHb/eQ
         a5LA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RgJ0c/Yu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d20si2917064ywb.188.2017.11.21.06.39.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Nov 2017 06:39:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RgJ0c/Yu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34796 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eH9hZ-0001Rj-KA
	for alex.bennee@linaro.org; Tue, 21 Nov 2017 09:39:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52272)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eH9hM-0001Od-O3
	for qemu-arm@nongnu.org; Tue, 21 Nov 2017 09:38:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eH9hG-00065F-7c
	for qemu-arm@nongnu.org; Tue, 21 Nov 2017 09:38:52 -0500
Received: from mail-ot0-x235.google.com ([2607:f8b0:4003:c0f::235]:42708)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eH9hF-00064z-Vg
	for qemu-arm@nongnu.org; Tue, 21 Nov 2017 09:38:46 -0500
Received: by mail-ot0-x235.google.com with SMTP id 18so10687150oty.9
	for <qemu-arm@nongnu.org>; Tue, 21 Nov 2017 06:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=86/tIBDcCgxiEPrKCIPGZqYkJRDIrSN9h3O1G2cU3OU=;
	b=RgJ0c/YumI9sEBP8IeMkkV0577upgIP1/n3YppSTEJltKp2eVdP9CXRf/nv24r0j6s
	iukD/IvI2X3tBBLyBY4Cdtrc63Mmn6RNBXF/n14jF/n+yTHi0FfAPJKM15UoYXnLtFZt
	xYDl3FIVXYx7ChSzULqxRMbDrAxeVHjS690Vc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=86/tIBDcCgxiEPrKCIPGZqYkJRDIrSN9h3O1G2cU3OU=;
	b=IEhJDS4BgC6vtIrZlDD3nDgk1WSlfA1DSDj5I5phe5i0RMXmdvJybg3AzNzj69con1
	sNR1WNKYadDiO+/4SAgfQQ+ylk1uxzOl3BUIlHC9xqea7NPmmgIERT6tCjom+vVUTqZC
	TyE963ZkJuUi3pA7s4uTiu7Y81ftp5ReoF/d+RkuYSAaZlEa/hlx2TWA7A+myh5KcL2b
	57KRWjkKEvEIiPbfOZP3VeBBdDjCDxlXrkmPn7XGcroQHhS9kD7dYbimBLZJCmqI9irF
	xQOnNSVpf18qXP5/5POuEbO19jT0Q8VZGuB2zX8TTrBot5bh9shgX2SR059eEHTt7tgg
	JMzw==
X-Gm-Message-State: AJaThX7xl55DwFTjGviqS9bxdUfzV8cfGVun1Wf/znCQgo/81HyeNMbf
	N/FD2mQqMQqwhOoEdXW+jqQcRUJCruai4r4mGzG/wA==
X-Received: by 10.157.13.168 with SMTP id 37mr11509614ots.197.1511275124909;
	Tue, 21 Nov 2017 06:38:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Tue, 21 Nov 2017 06:38:24 -0800 (PST)
In-Reply-To: <1509107055-21978-3-git-send-email-costa@advantech.ca>
References: <1509107055-21978-1-git-send-email-costa@advantech.ca>
	<1509107055-21978-3-git-send-email-costa@advantech.ca>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Nov 2017 14:38:24 +0000
Message-ID: <CAFEAcA86ehHUQ7aKQLx9ZMu_jDOXv_mT6y5vwmAhohEikt+kJw@mail.gmail.com>
To: Gabriel Costa <gabriel291075@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::235
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 2/5] arm: kinetis_k64_mcg
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
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xz9M/F5UDVu/

On 27 October 2017 at 13:24, Gabriel Costa <gabriel291075@gmail.com> wrote:
> This Patch include kinetis_k64_mcg.c/.h
> mcg means Multipurpose Clock Generator (MCG)
> More information about this peripheral can be found at:
> pag 579, K64P144M120SF5RM.pdf.

"page"

(Some of the remarks about commit message phrasing for the UART
patch apply here too, though in this case it is worth
explaining what MCG stands for.


> Signed-off-by: Gabriel Augusto Costa <gabriel291075@gmail.com>
> ---
>  hw/misc/kinetis_k64_mcg.c         | 208 ++++++++++++++++++++++++++++++++++++++
>  include/hw/misc/kinetis_k64_mcg.h |  43 ++++++++
>  2 files changed, 251 insertions(+)
>  create mode 100644 hw/misc/kinetis_k64_mcg.c
>  create mode 100644 include/hw/misc/kinetis_k64_mcg.h
>
> diff --git a/hw/misc/kinetis_k64_mcg.c b/hw/misc/kinetis_k64_mcg.c
> new file mode 100644
> index 0000000..37f4201
> --- /dev/null
> +++ b/hw/misc/kinetis_k64_mcg.c
> @@ -0,0 +1,208 @@
> +/*
> + * Kinetis K64 peripheral microcontroller emulation.
> + *
> + * Copyright (c) 2017 Advantech Wireless
> + * Written by Gabriel Costa <gabriel291075@gmail.com>
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License version 2 or
> + *  (at your option) any later version.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/sysbus.h"
> +#include "qemu/log.h"
> +#include "hw/misc/kinetis_k64_mcg.h"
> +
> +static const VMStateDescription vmstate_kinetis_k64_mcg = {
> +    .name = TYPE_KINETIS_K64_MCG,
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT8(C1, kinetis_k64_mcg_state),
> +        VMSTATE_UINT8(C2, kinetis_k64_mcg_state),
> +        VMSTATE_UINT8(C3, kinetis_k64_mcg_state),
> +        VMSTATE_UINT8(C4, kinetis_k64_mcg_state),
> +        VMSTATE_UINT8(C5, kinetis_k64_mcg_state),
> +        VMSTATE_UINT8(C6, kinetis_k64_mcg_state),
> +        VMSTATE_UINT8(S, kinetis_k64_mcg_state),
> +        VMSTATE_UINT8(SC, kinetis_k64_mcg_state),
> +        VMSTATE_UINT8(ATCVH, kinetis_k64_mcg_state),
> +        VMSTATE_UINT8(ATCVL, kinetis_k64_mcg_state),
> +        VMSTATE_UINT8(C7, kinetis_k64_mcg_state),
> +        VMSTATE_UINT8(C8, kinetis_k64_mcg_state),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void kinetis_k64_mcg_reset(DeviceState *dev)
> +{
> +    kinetis_k64_mcg_state *s = KINETIS_K64_MCG(dev);
> +
> +    s->C1 = 0x04;
> +    s->C2 = 0x80;
> +    s->C3 = 0x00;
> +    s->C4 = 0x00;
> +    s->C5 = 0x00;
> +    s->C6 = 0x00;
> +    s->S = 0x10;

This is how the hardware resets, but the QEMU implementation
doesn't have to worry about the complexities of slow hardware
initialization or gaining and losing PLL locks. So you can also
set bits 6 and 1 here, indicating that we have instantaneously
initialized the oscillator and gained lock.

> +    s->SC = 0x02;
> +    s->ATCVH = 0x00;
> +    s->ATCVL = 0x00;
> +    s->C7 = 0x00;
> +    s->C8 = 0x80;
> +}
> +
> +static void kinetis_k64_mcg_write(void *opaque, hwaddr offset, uint64_t value,
> +        unsigned size)
> +{
> +    kinetis_k64_mcg_state *s = (kinetis_k64_mcg_state *)opaque;
> +
> +    value &= 0xFF;
> +
> +    switch (offset) {
> +    case 0x00:
> +        if (value & 1 << 2) { /*IREFS*/
> +            s->S = 0;
> +            s->S |= 1 << 3; /*10 Enconding 2 - External ref clk is selected*/

"Encoding". Spaces around the text inside /* */, please.

Why clear s->S to 0 and then OR something into it?

Surely we should just be changing the bits in s->S that we
need to affect, not touching all the others?

> +        }
> +        if ((s->C1 & 0x80) && (value >> 6 == 0)) {

Should we really be looking at the old value of C1 here,
rather than the one that's beeing written?

> +            s->S |= 1 << 2; /*11 Enconding 3 - Output of the PLL is selected*/

This will go wrong if some of the bits in this field of
s->S are already set.

What you want to do here is copy bit 2 of C1 into bit 4
of S, and copy bits [7:6] of C1 into bits [3:2] of S.
There are two ways to do that:

old fashioned way with bit ops:
   s->S &= ~c0;
   s->S |= (value >> 4);

better, more comprehensible way (these functions are declared
and documented in include/qemu/bitops.h):
   clks = extract32(value, 6, 2);
   s->S = deposit32(s->S, 2, 2, clks);

I don't object to using raw bitwise logic ops, but if you
want to do it that way you need to get it right...

Strongly consider using the REG32 and FIELD macros from
hw/registerfields.h as a way to define some symbolic
constants so you don't need to use hardcoded numbers for
bit positions and field widths.

> +        }
> +        s->C1 = value;
> +        break;
> +    case 0x01:
> +        s->C2 = value;
> +        break;
> +    case 0x02:
> +        s->C3 = value;
> +        break;
> +    case 0x03:
> +        s->C4 = value;
> +        break;
> +    case 0x04:
> +        s->C5 = value;
> +        if (s->C5 & 1 << 6) { /*PLLCLKEN0*/
> +            s->S |= 1 << 6;  /*LOCK0*/
> +        }

Please be consistent about whether you write the value to
the s->whatever field first and then update the status register,
or whether you update s->S based on value and then write
to s->whatever afterwards.

> +        break;
> +    case 0x05:
> +        s->C6 = value;
> +        if (s->C6 & 1 << 6) { /*PLLS*/
> +            s->S |= 1 << 5;  /*PLLST*/
> +        }
> +        break;
> +    case 0x06:
> +        s->S = value;

The data sheet says this register is read-only!

> +        break;
> +    case 0x08:
> +        s->SC = value;
> +        break;
> +    case 0x0A:
> +        s->ATCVH = value;
> +        break;
> +    case 0x0B:
> +        s->ATCVL = value;
> +        break;
> +    case 0x0C:
> +        s->C7 = value;
> +        break;
> +    case 0x0D:
> +        s->C8 = value;
> +        break;

Many of the bits in C7 and C8 are not writeable. Please check the
datasheet...

> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +            "kinetis_k64_mcg: write at bad offset %"HWADDR_PRIx"\n", offset);
> +    }
> +}
> +
> +static uint64_t kinetis_k64_mcg_read(void *opaque, hwaddr offset, unsigned size)
> +{
> +    kinetis_k64_mcg_state *s = (kinetis_k64_mcg_state *)opaque;
> +    uint8_t value;
> +
> +    switch (offset) {
> +    case 0x00:
> +        value = s->C1;
> +        break;
> +    case 0x01:
> +        value = s->C2;
> +        break;
> +    case 0x02:
> +        value = s->C3;
> +        break;
> +    case 0x03:
> +        value = s->C4;
> +        break;
> +    case 0x04:
> +        value = s->C5;
> +        break;
> +    case 0x05:
> +        value = s->C6;
> +        break;
> +    case 0x06:
> +        value = s->S;
> +        break;
> +    case 0x08:
> +        value = s->SC;
> +        break;
> +    case 0x0A:
> +        value = s->ATCVH;
> +        break;
> +    case 0x0B:
> +        value = s->ATCVL;
> +        break;
> +    case 0x0C:
> +        value = s->C7;
> +        break;
> +    case 0x0D:
> +        value = s->C8;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +            "kinetis_k64_mcg: read at bad offset %"HWADDR_PRIx"\n", offset);
> +        return 0;
> +    }
> +    return value;
> +}
> +
> +static const MemoryRegionOps kinetis_k64_mcg_ops = {
> +    .read = kinetis_k64_mcg_read,
> +    .write = kinetis_k64_mcg_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +};
> +
> +static void kinetis_k64_mcg_init(Object *obj)
> +{
> +    kinetis_k64_mcg_state *s = KINETIS_K64_MCG(obj);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> +
> +    memory_region_init_io(&s->iomem, obj, &kinetis_k64_mcg_ops, s,
> +            TYPE_KINETIS_K64_MCG, 0x1000);
> +    sysbus_init_mmio(sbd, &s->iomem);
> +    sysbus_init_irq(sbd, &s->irq);

You create an interrupt line here but never do anything with it.
What is it for?

> +}
> +
> +static void kinetis_k64_mcg_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->vmsd = &vmstate_kinetis_k64_mcg;
> +    dc->reset = kinetis_k64_mcg_reset;
> +    dc->desc = "Kinetis K64 series MCG";
> +}
> +
> +static const TypeInfo kinetis_k64_mcg_info = {
> +    .name          = TYPE_KINETIS_K64_MCG,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(kinetis_k64_mcg_state),
> +    .instance_init = kinetis_k64_mcg_init,
> +    .class_init    = kinetis_k64_mcg_class_init,
> +};
> +
> +static void kinetis_k64_mcg_register_types(void)
> +{
> +    type_register_static(&kinetis_k64_mcg_info);
> +}
> +
> +type_init(kinetis_k64_mcg_register_types)
> diff --git a/include/hw/misc/kinetis_k64_mcg.h b/include/hw/misc/kinetis_k64_mcg.h
> new file mode 100644
> index 0000000..3f105c5
> --- /dev/null
> +++ b/include/hw/misc/kinetis_k64_mcg.h
> @@ -0,0 +1,43 @@
> +/*
> + * Kinetis K64 peripheral microcontroller emulation.
> + *
> + * Copyright (c) 2017 Advantech Wireless
> + * Written by Gabriel Costa <gabriel291075@gmail.com>
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License version 2 or
> + *  (at your option) any later version.
> + */
> +
> +#ifndef KINETIS_MCG_H
> +#define KINETIS_MCG_H
> +
> +#include "hw/sysbus.h"
> +#include "hw/hw.h"
> +
> +#define TYPE_KINETIS_K64_MCG "kinetis_k64_mcg"
> +#define KINETIS_K64_MCG(obj) \
> +    OBJECT_CHECK(kinetis_k64_mcg_state, (obj), TYPE_KINETIS_K64_MCG)
> +
> +typedef struct {
> +    SysBusDevice parent_obj;
> +
> +    MemoryRegion iomem;
> +
> +    uint8_t C1;
> +    uint8_t C2;
> +    uint8_t C3;
> +    uint8_t C4;
> +    uint8_t C5;
> +    uint8_t C6;
> +    uint8_t S;
> +    uint8_t SC;
> +    uint8_t ATCVH;
> +    uint8_t ATCVL;
> +    uint8_t C7;
> +    uint8_t C8;

These should all be in lower case I think.

> +
> +    qemu_irq irq;
> +} kinetis_k64_mcg_state;

Structure and type names should be in CamelCase. Please check
the CODING_STYLE file.

> +
> +#endif
> --
> 2.1.4

thanks
-- PMM
