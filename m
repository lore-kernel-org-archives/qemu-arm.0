Received: by 10.223.159.82 with SMTP id f18csp772191wrg;
        Tue, 21 Nov 2017 06:50:56 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZY6XbWY8NZmrscVzKoCa5wsD9tSb8Y2m82qevwD6sYWFL9HFu8dEARxCnNdiygRN8soPlG
X-Received: by 10.13.199.133 with SMTP id j127mr8383611ywd.459.1511275855972;
        Tue, 21 Nov 2017 06:50:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511275855; cv=none;
        d=google.com; s=arc-20160816;
        b=SbaEQPZuqXUP9vf+Gbu7ZHKQkOgNg5BCL9tLCtYl+nwsRyXp6KA6RrI4K0xUhnApQN
         8W/1Me9SrAv8VSrXHlsmax03s6ZjeKyoGBgJgMb+GiCEZdpZGQiLY+dR3L/RM1l7liR7
         5boNBaxh/uDBXpAP3CKdXVOMqie+37ALrm1YlVlaGJgYkIyi7Fn7xwwsI824CmWAB+Y2
         0N5okHPEqtlwlw3n8IEaHkUQgkcDmdwOQHgwETJJbDc1YKYu2EuDN+H5MbU5UpEefNFj
         k2UIRJYvh+DkYPJUb738MVQMTaIrVZAztcWi0LR/rJcEQ/g5rH0bU+mEhFa3lHgVw/eE
         8a3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Ckjt+JFFQhDIB1E1hLZZAZ9pk3Ke88R1RIfdNy8YC9k=;
        b=F1IDRCN6BD9MNRswcIKHBBZmB7cpOK4idtLEdFyAFB02UlMmR5BA8IfdRot/vD+cMo
         2vsmT8LCiljOvrjaZJWwoFNENOD4NaWPhfMz7ZJIK2ymqEi+bRKo+NwUyUvWrpgrlv6N
         wWdeOCXT2lF/OCYttIj6ULXJ+RZW0muu+TPA4ReteeTvnwYwp6ZBtOpRw//yNeIVaS1Y
         Pg/ElG3SQNOpSS6mBG4RG798B+oKH5oaULdraHrLunEEMRqpOEBXHCKq/odo8kF5yldf
         9/JhsvxitKiqHSJu8gt63QvJv0wmYrFOfuBc6XAIUpt4ZrGzgzrCvOAbapwXR8ALQL22
         3HOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M/0SFI5S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y189si2815623ybc.106.2017.11.21.06.50.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Nov 2017 06:50:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M/0SFI5S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34889 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eH9t1-0003bZ-BT
	for alex.bennee@linaro.org; Tue, 21 Nov 2017 09:50:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57228)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eH9sp-0003Zg-KC
	for qemu-arm@nongnu.org; Tue, 21 Nov 2017 09:50:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eH9so-0003ST-9I
	for qemu-arm@nongnu.org; Tue, 21 Nov 2017 09:50:43 -0500
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:35087)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eH9so-0003S1-29
	for qemu-arm@nongnu.org; Tue, 21 Nov 2017 09:50:42 -0500
Received: by mail-oi0-x243.google.com with SMTP id e142so8690325oih.2
	for <qemu-arm@nongnu.org>; Tue, 21 Nov 2017 06:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ckjt+JFFQhDIB1E1hLZZAZ9pk3Ke88R1RIfdNy8YC9k=;
	b=M/0SFI5SgEHnX10cfAgS2Dtt0P0AIzFPgsbKNSagWRLoclFtge2dQtMFg9GFO5l1aX
	qk0myICa0PO6P8aZVUn2WxkbXrI7LDyaSBa3IoxVXVWEKw3S8RENNDvdD4OrWTFdTlAr
	QMPZq1T86uzglDLDHdVePas+o+0c6qmgibaXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ckjt+JFFQhDIB1E1hLZZAZ9pk3Ke88R1RIfdNy8YC9k=;
	b=lowOvSNXQok6cEm2sUYV2MIn/SE+yTJt/iuNgvdx3UcLIRlMxFGH1H5rEgsfPw4CdE
	jQsRapMIV440W2jZFNqWnzmsgp8ldUw275novBOFby329nphTAZwgSTZzBOvNI1IyMt7
	VPKXjDxThPV3A42UpUp8Hm605J/lx6WBbwCWr8pB+sMyGwBj0Fpzazokk4Lzd/SS/5Xz
	UPRzjod87Kpq7/6y2OmOKeU+xTv5iI3G0RTE63BZ7eDaN2O11IAuwjLnhD0fn+ePZ6/b
	xiL6nd7av6HFlW+R1KrhQvAWNFH9Cn0lh0s9eYSqkWdPCDXioUT8O/a/Hs6+jPto2Dsi
	JxQQ==
X-Gm-Message-State: AJaThX4enp7oTUXtzpCzUiY1fGJb46U+HfTqnRnUhum9q9stbv4fXFdD
	jMVC/NvsLMRxn1pLeIfw2Gfo7qfRe7iosEiIiPGRCg==
X-Received: by 10.202.199.134 with SMTP id x128mr10749398oif.63.1511275841174; 
	Tue, 21 Nov 2017 06:50:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Tue, 21 Nov 2017 06:50:20 -0800 (PST)
In-Reply-To: <1509107055-21978-4-git-send-email-costa@advantech.ca>
References: <1509107055-21978-1-git-send-email-costa@advantech.ca>
	<1509107055-21978-4-git-send-email-costa@advantech.ca>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Nov 2017 14:50:20 +0000
Message-ID: <CAFEAcA-TBGRDXk=udVPxovMDCw+tC5YUbRzxBK4e1oyEwxoang@mail.gmail.com>
To: Gabriel Costa <gabriel291075@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 3/5] arm: kinetis_k64_pmux
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
X-TUID: YW+08DOgulpf

On 27 October 2017 at 13:24, Gabriel Costa <gabriel291075@gmail.com> wrote:
> This Patch include kinetis_k64_pmux.c/.h
> pmux is refered as Port Control and Interrupts (PORT)
> More information about this peripheral can be found at:
> pag 273, K64P144M120SF5RM.pdf.
>
> Signed-off-by: Gabriel Augusto Costa <gabriel291075@gmail.com>
> ---
>  hw/misc/kinetis_k64_pmux.c         | 158 +++++++++++++++++++++++++++++++++++++
>  include/hw/misc/kinetis_k64_pmux.h |  38 +++++++++
>  2 files changed, 196 insertions(+)
>  create mode 100644 hw/misc/kinetis_k64_pmux.c
>  create mode 100644 include/hw/misc/kinetis_k64_pmux.h
>
> diff --git a/hw/misc/kinetis_k64_pmux.c b/hw/misc/kinetis_k64_pmux.c
> new file mode 100644
> index 0000000..8346ef7
> --- /dev/null
> +++ b/hw/misc/kinetis_k64_pmux.c
> @@ -0,0 +1,158 @@
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
> +#include "hw/misc/kinetis_k64_pmux.h"
> +
> +static const VMStateDescription vmstate_kinetis_k64_pmux = {
> +    .name = TYPE_KINETIS_K64_PMUX,
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32_ARRAY(PCR, kinetis_k64_pmux_state, 32),

Please #define a symbolic constant for the size of this array.

> +        VMSTATE_UINT32(GPCLR, kinetis_k64_pmux_state),
> +        VMSTATE_UINT32(GPCHR, kinetis_k64_pmux_state),
> +        VMSTATE_UINT32(ISFR, kinetis_k64_pmux_state),
> +        VMSTATE_UINT32(DFER, kinetis_k64_pmux_state),
> +        VMSTATE_UINT32(DFCR, kinetis_k64_pmux_state),
> +        VMSTATE_UINT32(DFWR, kinetis_k64_pmux_state),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void kinetis_k64_pmux_reset(DeviceState *dev)
> +{
> +    kinetis_k64_pmux_state *s = KINETIS_K64_PMUX(dev);
> +    uint8_t cnt;
> +
> +    for (cnt = 0; cnt < 32; cnt++) {

"cnt < ARRAY_SIZE(s->PCR)" makes it clear you have
the right loop bound to not overrun the array.

> +        s->PCR[cnt] = 0x00000000;

Just say "0".

> +    }
> +    s->GPCLR = 0x00000000;
> +    s->GPCHR = 0x00000000;
> +    s->ISFR = 0x00000000;
> +    s->DFER = 0x00000000;
> +    s->DFCR = 0x00000000;
> +    s->DFWR = 0x00000000;
> +}
> +
> +static void kinetis_k64_pmux_write(void *opaque, hwaddr offset, uint64_t value,
> +        unsigned size)
> +{
> +    kinetis_k64_pmux_state *s = (kinetis_k64_pmux_state *)opaque;
> +
> +    value &= 0xFFFFFFFF;

This mask is unnecessary, because you are using the default
max_access_size for your MemoryRegionOps, which is 4.

(You should check whether this device permits byte accesses;
if not, consider setting min_access_size.)

> +    switch (offset) {
> +    case 0x00 ... 0x7C:
> +        s->PCR[offset >> 2] = value;

Some of the bits in these registers are read-only.

> +        break;
> +    case 0x80:
> +        s->GPCLR = value;
> +        break;
> +    case 0x84:
> +        s->GPCHR = value;
> +        break;
> +    case 0xA0:
> +        s->ISFR = value;

ISFR is write-1-to-clear, not this behaviour.

(Also, actual implementation of the interrupts seems to be missing.)

> +        break;
> +    case 0xC0:
> +        s->DFER = value;
> +        break;
> +    case 0xC4:
> +        s->DFCR = value;
> +        break;
> +    case 0xC8:
> +        s->DFWR = value;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +            "kinetis_k64_pmux: write at bad offset %"HWADDR_PRIx"\n", offset);
> +    }
> +}
> +
> +static uint64_t kinetis_k64_pmux_read(void *opaque, hwaddr offset,
> +        unsigned size)
> +{
> +    kinetis_k64_pmux_state *s = (kinetis_k64_pmux_state *)opaque;
> +    uint8_t value;
> +
> +    switch (offset) {
> +    case 0x00 ... 0x7C:
> +        value = s->PCR[offset >> 2];
> +        break;
> +    case 0x80:
> +        value = s->GPCLR;

This register is write-only (reads return 0), as is GPCHR. Check
the data sheet.

> +        break;
> +    case 0x84:
> +        value = s->GPCHR;
> +        break;
> +    case 0xA0:
> +        value = s->ISFR;
> +        break;
> +    case 0xC0:
> +        value = s->DFER;
> +        break;
> +    case 0xC4:
> +        value = s->DFCR;
> +        break;
> +    case 0xC8:
> +        value = s->DFWR;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +            "kinetis_k64_pmux: read at bad offset %"HWADDR_PRIx"\n", offset);
> +        return 0;
> +    }
> +    return value;
> +}
> +
> +static const MemoryRegionOps kinetis_k64_pmux_ops = {
> +    .read = kinetis_k64_pmux_read,
> +    .write = kinetis_k64_pmux_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +};
> +
> +static void kinetis_k64_pmux_init(Object *obj)
> +{
> +    kinetis_k64_pmux_state *s = KINETIS_K64_PMUX(obj);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> +
> +    memory_region_init_io(&s->iomem, obj, &kinetis_k64_pmux_ops, s,
> +            TYPE_KINETIS_K64_PMUX, 0x1000);
> +    sysbus_init_mmio(sbd, &s->iomem);
> +    sysbus_init_irq(sbd, &s->irq);

Again, you've defined an interrupt and done nothing with it.

> +}
> +
> +static void kinetis_k64_pmux_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->vmsd = &vmstate_kinetis_k64_pmux;
> +    dc->reset = kinetis_k64_pmux_reset;
> +    dc->desc = "Kinetis K64 series PMUX";
> +}
> +
> +static const TypeInfo kinetis_k64_pmux_info = {
> +    .name          = TYPE_KINETIS_K64_PMUX,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(kinetis_k64_pmux_state),
> +    .instance_init = kinetis_k64_pmux_init,
> +    .class_init    = kinetis_k64_pmux_class_init,
> +};
> +
> +static void kinetis_k64_pmux_register_types(void)
> +{
> +    type_register_static(&kinetis_k64_pmux_info);
> +}
> +
> +type_init(kinetis_k64_pmux_register_types)
> diff --git a/include/hw/misc/kinetis_k64_pmux.h b/include/hw/misc/kinetis_k64_pmux.h
> new file mode 100644
> index 0000000..49359ac
> --- /dev/null
> +++ b/include/hw/misc/kinetis_k64_pmux.h
> @@ -0,0 +1,38 @@
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
> +#ifndef KINETIS_PMUX_H
> +#define KINETIS_PMUX_H
> +
> +#include "hw/sysbus.h"
> +#include "hw/hw.h"
> +
> +#define TYPE_KINETIS_K64_PMUX "kinetis_k64_pmux"
> +#define KINETIS_K64_PMUX(obj) \
> +    OBJECT_CHECK(kinetis_k64_pmux_state, (obj), TYPE_KINETIS_K64_PMUX)
> +
> +typedef struct {
> +    SysBusDevice parent_obj;
> +
> +    MemoryRegion iomem;
> +
> +    uint32_t PCR[32];
> +    uint32_t GPCLR;
> +    uint32_t GPCHR;
> +    uint32_t ISFR;
> +    uint32_t DFER;
> +    uint32_t DFCR;
> +    uint32_t DFWR;
> +
> +    qemu_irq irq;
> +} kinetis_k64_pmux_state;

Same comments about coding style for struct and field names
as for other patches.

> +
> +#endif
> --
> 2.1.4
>

thanks
-- PMM
