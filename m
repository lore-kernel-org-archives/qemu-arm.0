Received: by 10.223.161.27 with SMTP id o27csp726416wro;
        Fri, 27 Oct 2017 06:13:53 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+SGMhnkMtHXww+HE0qKWdmFo6tLYY32wPTJBqsS4V5o/yIat36qGFzfNCMgpyCF092qq3di
X-Received: by 10.13.223.20 with SMTP id i20mr291541ywe.199.1509110033337;
        Fri, 27 Oct 2017 06:13:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509110033; cv=none;
        d=google.com; s=arc-20160816;
        b=E+Z5DmMhW3/NJhAUYWq6I9De9M9eX9sO3Db5d9z2sHl+PY9Onnh+mW9ZaPO5aOwLBU
         7cQutcjJnCZP6HJn4yNd3HR+ZIxrLhFZ+yYDdfoyH1r15q5fLWBV2bbW3wRVQE0AP7O9
         TFCS1Yit7VAM7+sfmTn6Rv0QfAr+uPTqmgDfjGO/lOsLD9+I8irfc8ZlGouR+ncsiU6q
         eT3YOoyXKYUu410y8Td+2S8e12Z/Z518TxGfz4kVBWkMuI3luL0IQKw2wjkbvtM9jNbQ
         DTRVfAwj8lRItGcBYRnMVOAmG7u5wl37aOBkLuHUVh6rWhdFj0zakCFX7YxbpQ0wGrWS
         tTPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=eq8hZx4Lz08dntT4A1jAGbqLLPcljPST8WEUV1n8hzA=;
        b=PCoEkHL+RkqXpN5cvH7v6JSGm7/MrNNbnBqhqCg2sCMDAxnEu1q8Xvq75bwBPDmmbC
         5UascC0qPcm67ox9gPFbmpG/dHzBOGmXvWakFaflzTn3WmqMXPo4JVR15scGmaazXe6P
         JRlbigXiEbnXRJ2iGElb25Iy8DyxfQRE0upemNpERBu79ikCefodJOZYr0d4faEho5yF
         oR3rAZom9rjD2QDR1BKOYrt01DHEVAUKGAGawMQkDiz5I1z/742NX3WOS1/1hlG74s2p
         0azqm8eiycdbicwx4ql6I9Kq2JjHjIX30CBJQYt5K4sxFkFnHVYbjkN8Ko6GC/DAvMUd
         s3Cw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q128si1148419ybc.272.2017.10.27.06.13.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Oct 2017 06:13:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57288 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e84SO-0002xO-M6
	for alex.bennee@linaro.org; Fri, 27 Oct 2017 09:13:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45767)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <frederic.konrad@adacore.com>) id 1e84SB-0002vq-8j
	for qemu-arm@nongnu.org; Fri, 27 Oct 2017 09:13:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <frederic.konrad@adacore.com>) id 1e84S6-0005Jk-7d
	for qemu-arm@nongnu.org; Fri, 27 Oct 2017 09:13:39 -0400
Received: from mel.act-europe.fr ([194.98.77.210]:57170
	helo=smtp.eu.adacore.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <frederic.konrad@adacore.com>)
	id 1e84S5-0005GU-PC; Fri, 27 Oct 2017 09:13:34 -0400
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id C5659822E8;
	Fri, 27 Oct 2017 15:13:31 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at eu.adacore.com
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dyIVwOzjYvNe; Fri, 27 Oct 2017 15:13:31 +0200 (CEST)
Received: from localhost.localdomain (unknown [IPv6:2a02:2ab8:224:100::1000])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
	bits)) (No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id A547C81F5E;
	Fri, 27 Oct 2017 15:13:30 +0200 (CEST)
To: Gabriel Costa <gabriel291075@gmail.com>
References: <1509014053-28134-1-git-send-email-costa@advantech.ca>
	<1509014053-28134-2-git-send-email-costa@advantech.ca>
From: KONRAD Frederic <frederic.konrad@adacore.com>
Message-ID: <0b80890b-be8a-a632-35aa-16f76f30d068@adacore.com>
Date: Fri, 27 Oct 2017 15:13:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1509014053-28134-2-git-send-email-costa@advantech.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 194.98.77.210
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 1/5]arm: kinetis_k64_mcg
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	f4bug@amsat.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FnysI2Qc01O+


On 10/26/2017 12:34 PM, Gabriel Costa wrote:
> From: Gabriel Augusto Costa <gabriel291075@gmail.com>
> 
> This Patch include kinetis_k64_mcg.c and .h
> mcg means Multipurpose Clock Generator (MCG)
> More information about this peripheral can be found at:
> pag 579, K64P144M120SF5RM.pdf.
> 
> Signed-off-by: Gabriel Augusto Costa <gabriel291075@gmail.com>
> ---
>   hw/misc/kinetis_k64_mcg.c         | 208 ++++++++++++++++++++++++++++++++++++++
>   include/hw/misc/kinetis_k64_mcg.h |  43 ++++++++
>   2 files changed, 251 insertions(+)
>   create mode 100644 hw/misc/kinetis_k64_mcg.c
>   create mode 100644 include/hw/misc/kinetis_k64_mcg.h
> 
> diff --git a/hw/misc/kinetis_k64_mcg.c b/hw/misc/kinetis_k64_mcg.c
> new file mode 100644
> index 0000000..654f96b
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
> +        }
> +        if ((s->C1 & 0x80) && (value >> 6 == 0)) {
> +            s->S |= 1 << 2; /*11 Enconding 3 - Output of the PLL is selected*/
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
> +        break;
> +    case 0x05:
> +        s->C6 = value;
> +        if (s->C6 & 1 << 6) { /*PLLS*/
> +            s->S |= 1 << 5;  /*PLLST*/
> +        }
> +        break;
> +    case 0x06:
> +        s->S = value;
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
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                "kinetis_k64_mcg: write at bad offset 0x%x\n", (int)offset);

I'd use HWADDR_PRIX here instead of %x.

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
> +                "kinetis_k64_mcg: read at bad offset 0x%x\n", (int)offset);

The same.

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

typedef struct kinetis_k64_mcg_state {

Fred

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
> +
> +    qemu_irq irq;
> +} kinetis_k64_mcg_state;
> +
> +#endif
> 
