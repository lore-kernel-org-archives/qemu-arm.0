Received: by 10.223.161.27 with SMTP id o27csp733097wro;
        Fri, 27 Oct 2017 06:20:34 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+RP/bw57GzMQVn30rD1u9nwZL+d2Hhuffq5ru3vuQoAhrdlF7vEZMkDG54zyJHoPrxcPgP4
X-Received: by 10.37.56.195 with SMTP id f186mr316520yba.207.1509110434552;
        Fri, 27 Oct 2017 06:20:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509110434; cv=none;
        d=google.com; s=arc-20160816;
        b=B447uLbmo0wigCL9i3dTBotPWfnJ/wenmSozGS6bASanoU/EZioAtQBiyc1uM/YwSx
         X8f8P5Lwq8e0mRYGpmdnS9JhqTmql06sT6brWEOt7vbevew0klWAat8KRzgEN5zEqFo1
         814OcsqetPxTqc5AeIRIJNPFq7ooj7fFNHMvjc02JXIiFH9NZL6h2kSbbGAT64MCbFvm
         4Uur3HbF5/ZqhqQFj5eUwlXWG3ckScxOGvGD4AMOJim+5uXIwxULmhBNQhtnb4HUpf03
         zmruD2wrsESuf3UCJY5cUVqkOhW/E5puiI/n6Jzc41bYKJiRyyy+88I6n3ykvmyVqigs
         sDlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=kUUSXxnWEeJD+u6anTwxZlWWUh9f/D70H0HD/GtGcJ4=;
        b=fMMKIvpK9bJTX7omEJs+lVHbuKdt1SLvCYGDw59+p87M7tZvRiSUTkZjfM+00K5oyH
         eNVR/Zv6i3Jcm6myQ4Gy5DVHSoon52NTd6uz2rd7Q20rdCf6DK0BxImOq8/uhwAO8g6m
         Ho1l3rl4VUcnu6QW+0DmQfM5lOvWvY4UFx2VBl7/zQLzHdstaK5L44LUr1ha8srYFlSn
         XA7U1OIZAlm73Ti6ZWcM5DSaoJvLy1oK9TrH++TBWmGQTQpArrdAaR+/Bf1PDcaJBch7
         G2rb9vk1NmSGaR67+OiRVniXWoNZUPEaah18LBf0ZSyncOvoWbA/GyfdvYYBdSSZ/duM
         B8xg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 129si221193ybu.737.2017.10.27.06.20.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Oct 2017 06:20:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57320 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e84Yr-0007ZU-Q4
	for alex.bennee@linaro.org; Fri, 27 Oct 2017 09:20:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47833)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <frederic.konrad@adacore.com>) id 1e84Yd-0007XP-Mc
	for qemu-arm@nongnu.org; Fri, 27 Oct 2017 09:20:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <frederic.konrad@adacore.com>) id 1e84YZ-000730-HL
	for qemu-arm@nongnu.org; Fri, 27 Oct 2017 09:20:19 -0400
Received: from mel.act-europe.fr ([194.98.77.210]:57779
	helo=smtp.eu.adacore.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <frederic.konrad@adacore.com>)
	id 1e84YY-00070S-P6; Fri, 27 Oct 2017 09:20:15 -0400
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 4EDB0822E5;
	Fri, 27 Oct 2017 15:20:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at eu.adacore.com
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KwiaOTg5t-DF; Fri, 27 Oct 2017 15:20:13 +0200 (CEST)
Received: from localhost.localdomain (unknown [IPv6:2a02:2ab8:224:100::1000])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
	bits)) (No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id E8C98822E1;
	Fri, 27 Oct 2017 15:20:12 +0200 (CEST)
To: Gabriel Costa <gabriel291075@gmail.com>
References: <1509014053-28134-1-git-send-email-costa@advantech.ca>
	<1509014053-28134-4-git-send-email-costa@advantech.ca>
From: KONRAD Frederic <frederic.konrad@adacore.com>
Message-ID: <0fd6630d-3627-e195-534a-67fc40839062@adacore.com>
Date: Fri, 27 Oct 2017 15:20:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1509014053-28134-4-git-send-email-costa@advantech.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 194.98.77.210
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 3/5]arm: kinetis_k64_system
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
X-TUID: aNGlxNdrfBGK



On 10/26/2017 12:34 PM, Gabriel Costa wrote:
> From: Gabriel Augusto Costa <gabriel291075@gmail.com>
> 
> This Patch include kinetis_k64_system.c and .h
> sim means System Integration Module (SIM)
> More information about this peripheral can be found at:
> pag 291, K64P144M120SF5RM.pdf.
> 
> Signed-off-by: Gabriel Augusto Costa <gabriel291075@gmail.com>
> ---
>   hw/misc/kinetis_k64_system.c         | 274 +++++++++++++++++++++++++++++++++++
>   include/hw/misc/kinetis_k64_system.h |  52 +++++++
>   2 files changed, 326 insertions(+)
>   create mode 100644 hw/misc/kinetis_k64_system.c
>   create mode 100644 include/hw/misc/kinetis_k64_system.h
> 
> diff --git a/hw/misc/kinetis_k64_system.c b/hw/misc/kinetis_k64_system.c
> new file mode 100644
> index 0000000..6421153
> --- /dev/null
> +++ b/hw/misc/kinetis_k64_system.c
> @@ -0,0 +1,274 @@
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
> +#include "hw/misc/kinetis_k64_system.h"
> +
> +static const VMStateDescription vmstate_kinetis_k64_sim = {
> +    .name = TYPE_KINETIS_K64_SIM,
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32(SOPT1, kinetis_k64_sim_state),
> +        VMSTATE_UINT32(SOPT1CFG, kinetis_k64_sim_state),
> +        VMSTATE_UINT32(SOPT2, kinetis_k64_sim_state),
> +        VMSTATE_UINT32(SOPT4, kinetis_k64_sim_state),
> +        VMSTATE_UINT32(SOPT5, kinetis_k64_sim_state),
> +        VMSTATE_UINT32(SOPT7, kinetis_k64_sim_state),
> +        VMSTATE_UINT32(SDID, kinetis_k64_sim_state),
> +        VMSTATE_UINT32(SCGC1, kinetis_k64_sim_state),
> +        VMSTATE_UINT32(SCGC2, kinetis_k64_sim_state),
> +        VMSTATE_UINT32(SCGC3, kinetis_k64_sim_state),
> +        VMSTATE_UINT32(SCGC4, kinetis_k64_sim_state),
> +        VMSTATE_UINT32(SCGC5, kinetis_k64_sim_state),
> +        VMSTATE_UINT32(SCGC6, kinetis_k64_sim_state),
> +        VMSTATE_UINT32(SCGC7, kinetis_k64_sim_state),
> +        VMSTATE_UINT32(CLKDIV1, kinetis_k64_sim_state),
> +        VMSTATE_UINT32(CLKDIV2, kinetis_k64_sim_state),
> +        VMSTATE_UINT32(FCFG1, kinetis_k64_sim_state),
> +        VMSTATE_UINT32(FCFG2, kinetis_k64_sim_state),
> +        VMSTATE_UINT32(UIDH, kinetis_k64_sim_state),
> +        VMSTATE_UINT32(UIDMH, kinetis_k64_sim_state),
> +        VMSTATE_UINT32(UIDML, kinetis_k64_sim_state),
> +        VMSTATE_UINT32(UIDL, kinetis_k64_sim_state),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void kinetis_k64_sim_reset(DeviceState *dev)
> +{
> +    kinetis_k64_sim_state *s = KINETIS_K64_SIM(dev);
> +
> +    s->SOPT1 = 0x00008000;
> +    s->SOPT1CFG = 0x00000000;
> +    s->SOPT2 = 0x00001000;
> +    s->SOPT4 = 0x00000000;
> +    s->SOPT5 = 0x00000000;
> +    s->SOPT7 = 0x00000000;
> +    s->SDID = 0x00000000;
> +    s->SCGC1 = 0x00000000;
> +    s->SCGC2 = 0x00000000;
> +    s->SCGC3 = 0x00000000;
> +    s->SCGC4 = 0xF0100030;
> +    s->SCGC5 = 0x00040182;
> +    s->SCGC6 = 0x40000001;
> +    s->SCGC7 = 0x00000006;
> +    s->CLKDIV1 = 0x00000000;
> +    s->CLKDIV2 = 0x00000000;
> +    s->FCFG1 = 0xFF000000;
> +    s->FCFG2 = 0x00000000;
> +    s->UIDH = 0x00000000;
> +    s->UIDMH = 0x00000000;
> +    s->UIDML = 0x00000000;
> +    s->UIDL = 0x00000000;
> +}
> +
> +static void kinetis_k64_sim_write(void *opaque, hwaddr offset, uint64_t value,
> +        unsigned size)
> +{
> +    kinetis_k64_sim_state *s = (kinetis_k64_sim_state *)opaque;
> +
> +    value &= 0xFFFFFFFF;
> +
> +    switch (offset) {
> +    case 0x0000:
> +        s->SOPT1 = value;
> +        break;
> +    case 0x0004:
> +        s->SOPT1CFG = value;
> +        break;
> +    case 0x1004:
> +        s->SOPT2 = value;
> +        break;
> +    case 0x100C:
> +        s->SOPT4 = value;
> +        break;
> +    case 0x1010:
> +        s->SOPT5 = value;
> +        break;
> +    case 0x1018:
> +        s->SOPT7 = value;
> +        break;
> +    case 0x1024:
> +        s->SDID = value;
> +        break;
> +    case 0x1028:
> +        s->SCGC1 = value;
> +        break;
> +    case 0x102C:
> +        s->SCGC2 = value;
> +        break;
> +    case 0x1030:
> +        s->SCGC3 = value;
> +        break;
> +    case 0x1034:
> +        s->SCGC4 = value;
> +        break;
> +    case 0x1013:
> +        s->SCGC5 = value;
> +        break;
> +    case 0x103C:
> +        s->SCGC6 = value;
> +        break;
> +    case 0x1040:
> +        s->SCGC7 = value;
> +        break;
> +    case 0x1044:
> +        s->CLKDIV1 = value;
> +        break;
> +    case 0x1048:
> +        s->CLKDIV2 = value;
> +        break;
> +    case 0x104C:
> +        s->FCFG1 = value;
> +        break;
> +    case 0x1050:
> +        s->FCFG2 = value;
> +        break;
> +    case 0x1054:
> +        s->UIDH = value;
> +        break;
> +    case 0x1058:
> +        s->UIDMH = value;
> +        break;
> +    case 0x105C:
> +        s->UIDML = value;
> +        break;
> +    case 0x1060:
> +        s->UIDL = value;
> +        break;

I suggest you do create one or two arrays here instead of all
thoses single variables and then factor this big switch case in a
default label:

default:
     s->reg[offset] = value;

And on the top of this file eg:

#define UIDH  (0x1054)
#define UIDMH (0x1058)
etc..

The same in the previous patch BTW. I didn't spot it.

Fred

> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                "kinetis_k64_sim: write at bad offset 0x%x\n", (int)offset);
> +    }
> +}
> +
> +static uint64_t kinetis_k64_sim_read(void *opaque, hwaddr offset, unsigned size)
> +{
> +    kinetis_k64_sim_state *s = (kinetis_k64_sim_state *)opaque;
> +    uint32_t value;
> +
> +    switch (offset) {
> +    case 0x0000:
> +        value = s->SOPT1;
> +        break;
> +    case 0x0004:
> +        value = s->SOPT1CFG;
> +        break;
> +    case 0x1004:
> +        value = s->SOPT2;
> +        break;
> +    case 0x100C:
> +        value = s->SOPT4;
> +        break;
> +    case 0x1010:
> +        value = s->SOPT5;
> +        break;
> +    case 0x1018:
> +        value = s->SOPT7;
> +        break;
> +    case 0x1024:
> +        value = s->SDID;
> +        break;
> +    case 0x1028:
> +        value = s->SCGC1;
> +        break;
> +    case 0x102C:
> +        value = s->SCGC2;
> +        break;
> +    case 0x1030:
> +        value = s->SCGC3;
> +        break;
> +    case 0x1034:
> +        value = s->SCGC4;
> +        break;
> +    case 0x1013:
> +        value = s->SCGC5;
> +        break;
> +    case 0x103C:
> +        value = s->SCGC6;
> +        break;
> +    case 0x1040:
> +        value = s->SCGC7;
> +        break;
> +    case 0x1044:
> +        value = s->CLKDIV1;
> +        break;
> +    case 0x1048:
> +        value = s->CLKDIV2;
> +        break;
> +    case 0x104C:
> +        value = s->FCFG1;
> +        break;
> +    case 0x1050:
> +        value = s->FCFG2;
> +        break;
> +    case 0x1054:
> +        value = s->UIDH;
> +        break;
> +    case 0x1058:
> +        value = s->UIDMH;
> +        break;
> +    case 0x105C:
> +        value = s->UIDML;
> +        break;
> +    case 0x1060:
> +        value = s->UIDL;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                "kinetis_k64_sim: read at bad offset 0x%x\n", (int)offset);
> +        return 0;
> +    }
> +    return value;
> +}
> +
> +static const MemoryRegionOps kinetis_k64_sim_ops = {
> +    .read = kinetis_k64_sim_read,
> +    .write = kinetis_k64_sim_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +};
> +
> +static void kinetis_k64_sim_init(Object *obj)
> +{
> +    kinetis_k64_sim_state *s = KINETIS_K64_SIM(obj);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> +
> +    memory_region_init_io(&s->iomem, obj, &kinetis_k64_sim_ops, s,
> +            TYPE_KINETIS_K64_SIM, 0x2000);
> +    sysbus_init_mmio(sbd, &s->iomem);
> +}
> +
> +static void kinetis_k64_sim_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->vmsd = &vmstate_kinetis_k64_sim;
> +    dc->reset = kinetis_k64_sim_reset;
> +    dc->desc = "Kinetis K64 series SIM";
> +}
> +
> +static const TypeInfo kinetis_k64_sim_info = {
> +    .name          = TYPE_KINETIS_K64_SIM,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(kinetis_k64_sim_state),
> +    .instance_init = kinetis_k64_sim_init,
> +    .class_init    = kinetis_k64_sim_class_init,
> +};
> +
> +static void kinetis_k64_sim_register_types(void)
> +{
> +    type_register_static(&kinetis_k64_sim_info);
> +}
> +
> +type_init(kinetis_k64_sim_register_types)
> diff --git a/include/hw/misc/kinetis_k64_system.h b/include/hw/misc/kinetis_k64_system.h
> new file mode 100644
> index 0000000..8774eaa
> --- /dev/null
> +++ b/include/hw/misc/kinetis_k64_system.h
> @@ -0,0 +1,52 @@
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
> +#ifndef KINETIS_SYSTEM_H
> +#define KINETIS_SYSTEM_H
> +
> +#include "hw/sysbus.h"
> +#include "hw/hw.h"
> +
> +#define TYPE_KINETIS_K64_SIM "kinetis_k64_sim"
> +#define KINETIS_K64_SIM(obj) \
> +    OBJECT_CHECK(kinetis_k64_sim_state, (obj), TYPE_KINETIS_K64_SIM)
> +
> +typedef struct {
> +    SysBusDevice parent_obj;
> +
> +    MemoryRegion iomem;
> +
> +    uint32_t SOPT1;
> +    uint32_t SOPT1CFG;
> +    uint32_t SOPT2;
> +    uint32_t SOPT4;
> +    uint32_t SOPT5;
> +    uint32_t SOPT7;
> +    uint32_t SDID;
> +    uint32_t SCGC1;
> +    uint32_t SCGC2;
> +    uint32_t SCGC3;
> +    uint32_t SCGC4;
> +    uint32_t SCGC5;
> +    uint32_t SCGC6;
> +    uint32_t SCGC7;
> +    uint32_t CLKDIV1;
> +    uint32_t CLKDIV2;
> +    uint32_t FCFG1;
> +    uint32_t FCFG2;
> +    uint32_t UIDH;
> +    uint32_t UIDMH;
> +    uint32_t UIDML;
> +    uint32_t UIDL; > +
> +} kinetis_k64_sim_state;
> +
> +#endif
> 
