Received: by 10.28.91.67 with SMTP id p64csp3830092wmb;
        Tue, 6 Mar 2018 07:01:59 -0800 (PST)
X-Google-Smtp-Source: AG47ELvgupLVm6ShGAJl4sM/ZicqnLiPHux5OA03CVIEut1Ihh69kPOM/DnFLIKHNXHl6GrEP0by
X-Received: by 2002:a25:a2cd:: with SMTP id c13-v6mr5011391ybn.281.1520348518959;
        Tue, 06 Mar 2018 07:01:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520348518; cv=none;
        d=google.com; s=arc-20160816;
        b=gNXQ27GvuhubIKpcECS8XI8YS8BcY8n+XHnwUWcAuGc8TX5aUFL0dZEqPbOmxIL+eI
         L03eEHDtr/lyxrg0T8MDvAesrI4oe+DHSYHfFA0z7YQrwh2EVhSn/4/1qOeXgrv+UMtb
         bgppY8Uj0FTr8jot2yTyUMS4eY7LYXZD9F5ssVjKmRuIvOLwUrupAd8rfQW7CGDCDMDQ
         ZtkNhcN8d0Ggt6M5cDZ/Z1tutkh0vZ9IcTya4/sLhxJyKzuRWptUB+MP+v0GNdOXPO5j
         vGFYwZO3uJ+E+T2jW2QTDOuYm3D/inhlLvsfpzugy7Nz3Q7cTNityDuYUZ9o73ou5ZGK
         uQVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=zcFmJmjKF4kHDgwW8/9gBReFbz3c7KUTx+fsPLdBmEo=;
        b=su4+r0tN75kQ532yMg4FjxMUt10w8M7PEpwbVI6YD0YoHVyqlr40IPLBo994gnv6Sy
         sl7es932Nfu1dkvrQTmQdz+XARUofXQjGhDfCR/cYxisC5x0p+XQrj6+AAJ0AEdITECJ
         JeJ+B+vduW4vogct0tuVDF6Q7dwX0zcUSPPZdaVukYRw3dHQn5G1udlkDKRfKMni3S+z
         v/2wlZwUG1Ee50rrD62AvgcXIf6/runXl29LRvJ7J7mJg0t6WV+TW1Hntk6Pccy4LDu8
         3Ma/EjHQfgjO3yIbLyQJrnka9LK2zykAQ7CthvpvfpI847Iwrr9GpkbdCFihPE0ulzvp
         pxXg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a135si1792396ywe.528.2018.03.06.07.01.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Mar 2018 07:01:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56309 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1etE6I-00087V-CB
	for alex.bennee@linaro.org; Tue, 06 Mar 2018 10:01:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41602)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1etE5x-00083R-9f
	for qemu-arm@nongnu.org; Tue, 06 Mar 2018 10:01:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1etE5r-0008Di-72
	for qemu-arm@nongnu.org; Tue, 06 Mar 2018 10:01:37 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:52836 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1etE5r-0008DR-14; Tue, 06 Mar 2018 10:01:31 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6886F84222;
	Tue,  6 Mar 2018 15:01:30 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B45AA111F3DE;
	Tue,  6 Mar 2018 15:01:22 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
	<1518893216-9983-2-git-send-email-eric.auger@redhat.com>
	<CAFEAcA8pdpA1MUAyKNyAdM9QH6_n2NBvZPYdiFKK20N9FG2z1g@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <27acd12a-31c5-8139-256e-f002aa5ca43a@redhat.com>
Date: Tue, 6 Mar 2018 16:01:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8pdpA1MUAyKNyAdM9QH6_n2NBvZPYdiFKK20N9FG2z1g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Tue, 06 Mar 2018 15:01:30 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Tue, 06 Mar 2018 15:01:30 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v9 01/14] hw/arm/smmu-common:
 smmu base device and datatypes
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Tomasz Nowicki <tn@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Prem Mallappa <prem.mallappa@gmail.com>, linuc.decode@gmail.com,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: awjjDBDE5JVZ

Hi Peter,

On 06/03/18 13:09, Peter Maydell wrote:
> On 17 February 2018 at 18:46, Eric Auger <eric.auger@redhat.com> wrote:
>> The patch introduces the smmu base device and class for the ARM
>> smmu. Devices for specific versions will be derived from this
>> base device.
>>
>> We also introduce some important datatypes.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
>>
> 
>> + * Author: Prem Mallappa <pmallapp@broadcom.com>
>> + *
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "sysemu/sysemu.h"
>> +#include "exec/address-spaces.h"
>> +#include "trace.h"
>> +#include "exec/target_page.h"
>> +#include "qom/cpu.h"
>> +#include "hw/qdev-properties.h"
>> +#include "qapi/error.h"
>> +
>> +#include "qemu/error-report.h"
>> +#include "hw/arm/smmu-common.h"
>> +
>> +static void smmu_base_realize(DeviceState *dev, Error **errp)
>> +{
>> +    SMMUState *s = ARM_SMMU(dev);
>> +
>> +    s->configs = g_hash_table_new_full(NULL, NULL, NULL, g_free);
>> +    s->iotlb = g_hash_table_new_full(NULL, NULL, NULL, g_free);
> 
> Shouldn't we also invoke the parent_realize ?
Yes will fix that.

note that those hash tables are not yet used. However I kept those in
this series to illustrate the split between the generic and smmuv3 part.
configs will be used to cache config data whereas iotlb will be used to
cache IOTLB entries. I can remove them at the moment and keep the
realize function void.
> 
>> +}
>> +
>> +static void smmu_base_reset(DeviceState *dev)
>> +{
>> +    SMMUState *s = ARM_SMMU(dev);
>> +
>> +    g_hash_table_remove_all(s->configs);
>> +    g_hash_table_remove_all(s->iotlb);
>> +}
>> +
>> +static Property smmu_dev_properties[] = {
>> +    DEFINE_PROP_UINT8("bus_num", SMMUState, bus_num, 0),
>> +    DEFINE_PROP_LINK("primary-bus", SMMUState, primary_bus, "PCI", PCIBus *),
>> +    DEFINE_PROP_END_OF_LIST(),
>> +};
>> +
>> +static void smmu_base_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>> +    SMMUBaseClass *sbc = ARM_SMMU_CLASS(klass);
>> +
>> +    dc->props = smmu_dev_properties;
>> +    sbc->parent_realize = dc->realize;
>> +    dc->realize = smmu_base_realize;
> 
> There's a device_class_set_parent_realize() in the tree now that
> we should probably use instead of these 2 lines:
>        device_class_set_parent_realize(dc, smmu_base_realize,
>                                        &sbc->parent_realize);
OK. Will do that as well for smmuv3 class. I used the fellow reset
setter but not that one.
> 
>> +    dc->reset = smmu_base_reset;
>> +}
>> +
>> +static const TypeInfo smmu_base_info = {
>> +    .name          = TYPE_ARM_SMMU,
>> +    .parent        = TYPE_SYS_BUS_DEVICE,
>> +    .instance_size = sizeof(SMMUState),
>> +    .class_data    = NULL,
>> +    .class_size    = sizeof(SMMUBaseClass),
>> +    .class_init    = smmu_base_class_init,
>> +    .abstract      = true,
>> +};
>> +
>> +static void smmu_base_register_types(void)
>> +{
>> +    type_register_static(&smmu_base_info);
>> +}
>> +
>> +type_init(smmu_base_register_types)
>> +
>> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
>> new file mode 100644
>> index 0000000..8a9d931
>> --- /dev/null
>> +++ b/include/hw/arm/smmu-common.h
>> @@ -0,0 +1,124 @@
>> +/*
>> + * ARM SMMU Support
>> + *
>> + * Copyright (C) 2015-2016 Broadcom Corporation
>> + * Copyright (c) 2017 Red Hat, Inc.
>> + * Written by Prem Mallappa, Eric Auger
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + */
>> +
>> +#ifndef HW_ARM_SMMU_COMMON_H
>> +#define HW_ARM_SMMU_COMMON_H
>> +
>> +#include <hw/sysbus.h>
> 
> QEMU headers should be included using "", not <>.
> 
>> +#include "hw/pci/pci.h"
>> +
>> +#define SMMU_PCI_BUS_MAX      256
>> +#define SMMU_PCI_DEVFN_MAX    256
>> +
>> +#define SMMU_MAX_VA_BITS      48
>> +
>> +/*
>> + * Page table walk error types
>> + */
>> +typedef enum {
>> +    SMMU_PTW_ERR_NONE,
>> +    SMMU_PTW_ERR_WALK_EABT,   /* Translation walk external abort */
>> +    SMMU_PTW_ERR_TRANSLATION, /* Translation fault */
>> +    SMMU_PTW_ERR_ADDR_SIZE,   /* Address Size fault */
>> +    SMMU_PTW_ERR_ACCESS,      /* Access fault */
>> +    SMMU_PTW_ERR_PERMISSION,  /* Permission fault */
>> +} SMMUPTWEventType;
>> +
>> +typedef struct SMMUPTWEventInfo {
>> +    SMMUPTWEventType type;
>> +    dma_addr_t addr; /* fetched address that induced an abort, if any */
>> +} SMMUPTWEventInfo;
>> +
>> +typedef struct SMMUTransTableInfo {
>> +    bool disabled;             /* is the translation table disabled? */
>> +    uint64_t ttb;              /* TT base address */
>> +    uint8_t tsz;               /* input range, ie. 2^(64 -tsz)*/
>> +    uint8_t granule_sz;        /* granule page shift */
>> +    uint8_t initial_level;     /* initial lookup level */
>> +} SMMUTransTableInfo;
>> +
>> +/*
>> + * Generic structure populated by derived SMMU devices
>> + * after decoding the configuration information and used as
>> + * input to the page table walk
>> + */
>> +typedef struct SMMUTransCfg {
>> +    int      stage;            /* translation stage */
>> +    bool     aa64;             /* arch64 or aarch32 translation table */
>> +    bool     disabled;         /* smmu is disabled */
>> +    bool     bypassed;         /* translation is bypassed */
>> +    bool     aborted;          /* translation is aborted */
>> +    uint64_t ttb;              /* TT base address */
>> +    uint8_t oas;               /* output address width */
>> +    uint8_t  tbi;              /* Top Byte Ignore */
>> +    uint16_t asid;
>> +    SMMUTransTableInfo tt[2];
> 
> Can you be consistent about either lining up the field names or not doing so,
> please? (I would suggest going for 'not'.)
OK
> 
>> +} SMMUTransCfg;
> 
> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
thanks!

Eric
> 
> thanks
> -- PMM
> 
