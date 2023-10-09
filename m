Received: by 2002:a17:906:cd17:b0:9b2:89ee:1eb8 with SMTP id oz23csp2025127ejb;
        Mon, 9 Oct 2023 07:58:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVXlIylhf5PsuqUjo9idgI1LNMGe0nGpm1HVgDfDkPo8FxeEotNp018dVKfvzY9v+Mdtc0
X-Received: by 2002:ac8:5ccb:0:b0:412:309f:c0fa with SMTP id s11-20020ac85ccb000000b00412309fc0famr15078010qta.64.1696863535397;
        Mon, 09 Oct 2023 07:58:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696863535; cv=none;
        d=google.com; s=arc-20160816;
        b=Fq41RSOzO5dmu89Gxp4ahNTvnSyfU0MrLXRldjFigrl9LkAnT2NqyNOzyVopSb+7H+
         6HWYwXaytT8k1wEiJLM/z/ltdFPQbL2C9duoqRY752q0aWBLUEtlSK8WZYlYc64jcjXO
         KYfk7dB80IqWdQnsuoGuF6oLkd8Cy8oLqn2SDCPv14Kumpql6agOvtXObhekojv6f/e4
         CiQwIzQCIocQE4WW2vyq6IBHVB8o88F/WyrwdES3cUSxTv70l6DL71fi5a1dPxVMDuCZ
         JY7DNoTsB5m9DB0YRS5j5g6ct2EA+Pq4hTEDE753CuoJZKJiHLxo5sYK3vFnaQIcY8Rx
         F6rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=AQrPXPlSdwmy/h1FWrgClK+E0VJstRQEC9V8v0rNkqg=;
        fh=qShmx9hl1ph34ulEBOCe1Wl+bd1jf8hIEJWbXZnp4xc=;
        b=r1W5gm7vszXZuAEYMCGqdyJ48DWcsMFgsLXnLtZ7aUt/69EALbwAqi8chftBceO1js
         LwZmqWKAcPWzN9VKdNZN6IPxNqp2BIj4WqYss3BIz/V4wPQ84osIrfc4nKsXK49BToFa
         n8jNK9gZDDXJ4EU13Vy0X/jGBrA7ptwx944yFrM/5CDuqC8dw0ZLiBslsX19uIDuMWb+
         HRGaSeNG8Q75f6cmZjnFf9fq+H+uyAgLDl9OrYB0sTrYiWFxyi0WnqJcDI4TNJKm0ZcA
         MgDbBjH0tZT/CWf4rt1XPtaDfyJM/Fn5RlblCxDj9ZAI6zPxzVncXSMixnvDT1Yh1KYp
         shng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=Wo4pt+hl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w14-20020ac87e8e000000b004196273dbbbsi6249222qtj.267.2023.10.09.07.58.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Oct 2023 07:58:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=Wo4pt+hl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qpriG-0001Tn-QR; Mon, 09 Oct 2023 10:58:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1qpriE-0001Rk-0f; Mon, 09 Oct 2023 10:58:26 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1qpriB-0006lB-PF; Mon, 09 Oct 2023 10:58:25 -0400
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 399Eqsfr020247; Mon, 9 Oct 2023 14:58:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=AQrPXPlSdwmy/h1FWrgClK+E0VJstRQEC9V8v0rNkqg=;
 b=Wo4pt+hlS4Dc/Dna6xMyX5xKtGxsNw1rXUmIrq4jRmlxz7Id53YxhCWm6E8nCA/XsAZf
 JSuF80rMNLG4mTE5c7OAWenenRyI30jTP8+HH6pFYqK9a7HV4Wtvz5gABz2gYU1UkQjm
 s4LOaPM1KWU+86AhWbMCU8FVKkd7xtG6V9WKzZyDn9lq0NT3T+/k4yy1zivwyCFLW664
 n/tZFMuudXfxsxdXSeGJgOEdW/6t60sqwRLKvqNJpEU9tYtfTjtizCRkhEW6BH8bSsil
 VtcOxmUzJwFQpbmPAgse5i23ac3Es3WwqXyz+CwS54CeYel0Qqi9ivI9USdpO1YB+05c 9A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tmknr83h4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Oct 2023 14:58:03 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 399ErdNx023754;
 Mon, 9 Oct 2023 14:58:00 GMT
Received: from ppma12.dal12v.mail.ibm.com
 (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tmknr83bc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Oct 2023 14:57:59 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
 by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 399DxcxG024498; Mon, 9 Oct 2023 14:57:43 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
 by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tkhnsa16h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Oct 2023 14:57:42 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com
 [10.241.53.101])
 by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 399EvgkT3080846
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Oct 2023 14:57:42 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB7575805A;
 Mon,  9 Oct 2023 14:57:41 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A84C58051;
 Mon,  9 Oct 2023 14:57:41 +0000 (GMT)
Received: from [9.61.164.107] (unknown [9.61.164.107])
 by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Mon,  9 Oct 2023 14:57:41 +0000 (GMT)
Message-ID: <82889381-02aa-4558-950e-e76c2878afe5@linux.ibm.com>
Date: Mon, 9 Oct 2023 09:57:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/10] hw/fsi: Introduce IBM's Local bus
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 thuth@redhat.com, philmd@linaro.org, lvivier@redhat.com
Cc: qemu-arm@nongnu.org
References: <20230908222859.3381003-1-ninad@linux.ibm.com>
 <20230908222859.3381003-2-ninad@linux.ibm.com>
 <e25d0310-72f0-8bb0-2538-dad86f407e01@kaod.org>
Content-Language: en-US
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <e25d0310-72f0-8bb0-2538-dad86f407e01@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5Lyj2Jw2Kh-bsRhqH-fiOgo2dtwi4nTH
X-Proofpoint-ORIG-GUID: uVX9YrTKM6zCA38L0pWyZgvNt8mAEkam
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-09_13,2023-10-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=999 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1011 mlxscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310090124
Received-SPF: pass client-ip=148.163.156.1; envelope-from=ninad@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qNQAgxU0u/F4

Hello Cederic,

On 9/9/23 03:25, Cédric Le Goater wrote:
> On 9/9/23 00:28, Ninad Palsule wrote:
>> This is a part of patchset where IBM's Flexible Service Interface is
>> introduced.
>>
>> The LBUS is modelled to maintain the qdev bus hierarchy and to take
>> advantage of the object model to automatically generate the CFAM
>> configuration block. The configuration block presents engines in the
>> order they are attached to the CFAM's LBUS. Engine implementations
>> should subclass the LBusDevice and set the 'config' member of
>> LBusDeviceClass to match the engine's type.
>>
>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
>> ---
>> v2:
>> - Incorporated Joel's review comments.
>> ---
>
>
> It is nice to have the header files upfront.
>
>   orderFile = /path/to/qemu/scripts/git.orderfile
ok, Done. Thanks. I wasn't aware of this.
>
>
>>   hw/Kconfig            |  1 +
>>   hw/fsi/Kconfig        |  2 +
>>   hw/fsi/lbus.c         | 94 +++++++++++++++++++++++++++++++++++++++++++
>>   hw/fsi/meson.build    |  1 +
>>   hw/meson.build        |  1 +
>>   include/hw/fsi/lbus.h | 48 ++++++++++++++++++++++
>>   include/qemu/bitops.h |  6 +++
>>   7 files changed, 153 insertions(+)
>>   create mode 100644 hw/fsi/Kconfig
>>   create mode 100644 hw/fsi/lbus.c
>>   create mode 100644 hw/fsi/meson.build
>>   create mode 100644 include/hw/fsi/lbus.h
>>
>> diff --git a/hw/Kconfig b/hw/Kconfig
>> index ba62ff6417..2ccb73add5 100644
>> --- a/hw/Kconfig
>> +++ b/hw/Kconfig
>> @@ -9,6 +9,7 @@ source core/Kconfig
>>   source cxl/Kconfig
>>   source display/Kconfig
>>   source dma/Kconfig
>> +source fsi/Kconfig
>>   source gpio/Kconfig
>>   source hyperv/Kconfig
>>   source i2c/Kconfig
>> diff --git a/hw/fsi/Kconfig b/hw/fsi/Kconfig
>> new file mode 100644
>> index 0000000000..687449e14e
>> --- /dev/null
>> +++ b/hw/fsi/Kconfig
>> @@ -0,0 +1,2 @@
>> +config LBUS
>> +    bool
>> diff --git a/hw/fsi/lbus.c b/hw/fsi/lbus.c
>> new file mode 100644
>> index 0000000000..afb26ef7ea
>> --- /dev/null
>> +++ b/hw/fsi/lbus.c
>> @@ -0,0 +1,94 @@
>> +/*
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + * Copyright (C) 2023 IBM Corp.
>> + *
>> + * IBM Local bus where FSI slaves are connected
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +
>> +#include "qapi/error.h"
>> +#include "qemu/log.h"
>> +
>> +#include "hw/fsi/lbus.h"
>> +
>> +#include "hw/qdev-properties.h"
>> +
>> +static void lbus_realize(BusState *bus, Error **errp)
>> +{
>> +    LBusNode *node;
>> +    LBus *lbus = LBUS(bus);
>> +
>> +    memory_region_init(&lbus->mr, OBJECT(lbus), TYPE_LBUS,
>> +                       (2 * 1024 * 1024) - 0x400);
>
> please use some define
Added defines.
>
>> +
>> +    QLIST_FOREACH(node, &lbus->devices, next) {
>> +        memory_region_add_subregion(&lbus->mr, node->ldev->address,
>> + &node->ldev->iomem);
>> +    }
>> +}
>> +
>> +static void lbus_init(Object *o)
>> +{
>> +}
>> +
>
> please remove if unused
Removed.
>
>
>> +static void lbus_class_init(ObjectClass *klass, void *data)
>> +{
>> +    BusClass *k = BUS_CLASS(klass);
>> +    k->realize = lbus_realize;
>> +}
>> +
>> +static const TypeInfo lbus_info = {
>> +    .name = TYPE_LBUS,
>> +    .parent = TYPE_BUS,
>> +    .instance_init = lbus_init,
>> +    .instance_size = sizeof(LBus),
>> +    .class_init = lbus_class_init,
>> +};
>> +
>> +static Property lbus_device_props[] = {
>> +    DEFINE_PROP_UINT32("address", LBusDevice, address, 0),
>> +    DEFINE_PROP_END_OF_LIST(),
>> +};
>> +
>> +DeviceState *lbus_create_device(LBus *bus, const char *type, 
>> uint32_t addr)
>> +{
>> +    DeviceState *dev;
>> +    LBusNode *node;
>> +
>> +    dev = qdev_new(type);
>> +    qdev_prop_set_uint8(dev, "address", addr);
>> +    qdev_realize_and_unref(dev, &bus->bus, &error_fatal);
>
>  BUS(bus) ?
Fixed
>
>> +
>> +    /* Move to post_load */
>> +    node = g_malloc(sizeof(struct LBusNode));
>> +    node->ldev = LBUS_DEVICE(dev);
>> +    QLIST_INSERT_HEAD(&bus->devices, node, next);
>
> This list looks useless to me.
This list is used to add new devices. Keeping it for now.
>
>> +    return dev;
>> +}
>> +
>> +static void lbus_device_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>> +
>> +    dc->bus_type = TYPE_LBUS;
>> +    device_class_set_props(dc, lbus_device_props);
>> +}
>> +
>> +static const TypeInfo lbus_device_type_info = {
>> +    .name = TYPE_LBUS_DEVICE,
>> +    .parent = TYPE_DEVICE,
>> +    .instance_size = sizeof(LBusDevice),
>> +    .abstract = true,
>> +    .class_init = lbus_device_class_init,
>> +    .class_size = sizeof(LBusDeviceClass),
>> +};
>> +
>> +static void lbus_register_types(void)
>> +{
>> +    type_register_static(&lbus_info);
>> +    type_register_static(&lbus_device_type_info);
>> +}
>> +
>> +type_init(lbus_register_types);
>> diff --git a/hw/fsi/meson.build b/hw/fsi/meson.build
>> new file mode 100644
>> index 0000000000..e1007d5fea
>> --- /dev/null
>> +++ b/hw/fsi/meson.build
>> @@ -0,0 +1 @@
>> +system_ss.add(when: 'CONFIG_LBUS', if_true: files('lbus.c'))
>> diff --git a/hw/meson.build b/hw/meson.build
>> index c7ac7d3d75..6c71ee9cfa 100644
>> --- a/hw/meson.build
>> +++ b/hw/meson.build
>> @@ -43,6 +43,7 @@ subdir('virtio')
>>   subdir('watchdog')
>>   subdir('xen')
>>   subdir('xenpv')
>> +subdir('fsi')
>>     subdir('alpha')
>>   subdir('arm')
>> diff --git a/include/hw/fsi/lbus.h b/include/hw/fsi/lbus.h
>> new file mode 100644
>> index 0000000000..fafc065178
>> --- /dev/null
>> +++ b/include/hw/fsi/lbus.h
>> @@ -0,0 +1,48 @@
>> +/*
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + * Copyright (C) 2023 IBM Corp.
>> + *
>> + * IBM Local bus and connected device structures.
>> + */
>> +#ifndef FSI_LBUS_H
>> +#define FSI_LBUS_H
>> +
>> +#include "exec/memory.h"
>> +#include "hw/qdev-core.h"
>> +
>> +#define TYPE_LBUS_DEVICE "lbus.device"
>> +OBJECT_DECLARE_TYPE(LBusDevice, LBusDeviceClass, LBUS_DEVICE)
>>
>
> Using an "fsi/FSI"  prefix for all definitions seems like a good idea
> to avoid namespace conflicts.
Added FSI prefix.
>
>> +typedef struct LBusDevice {
>> +    DeviceState parent;
>> +
>> +    MemoryRegion iomem;
>> +    uint32_t address;
>> +} LBusDevice;
>> +
>> +typedef struct LBusDeviceClass {
>> +    DeviceClass parent;
>> +
>> +    uint32_t config;
>> +} LBusDeviceClass;
>> +
>> +typedef struct LBusNode {
>> +    LBusDevice *ldev;
>> +
>> +    QLIST_ENTRY(LBusNode) next;
>> +} LBusNode;
>> +
>> +#define TYPE_LBUS "lbus"
>> +OBJECT_DECLARE_SIMPLE_TYPE(LBus, LBUS)
>> +
>> +typedef struct LBus {
>> +    BusState bus;
>> +
>> +    MemoryRegion mr;
>> +
>> +    QLIST_HEAD(, LBusNode) devices;
>
> BusState already has a list. I think this needs to be reworked.
The list in BusState is for the buses. This list is for devices.
>
>
>> +} LBus;
>> +
>> +DeviceState *lbus_create_device(LBus *bus, const char *type, 
>> uint32_t addr);
>> +int lbus_add_device(LBus *bus, LBusDevice *dev);
>> +#endif /* FSI_LBUS_H */
>> diff --git a/include/qemu/bitops.h b/include/qemu/bitops.h
>> index cb3526d1f4..e12496f619 100644
>> --- a/include/qemu/bitops.h
>> +++ b/include/qemu/bitops.h
>> @@ -618,4 +618,10 @@ static inline uint64_t half_unshuffle64(uint64_t x)
>>       return x;
>>   }
>>   +/* Bitwise operations at the word level. */
>> +#define BE_BIT(x)                          BIT(31 - (x))
>> +#define GENMASK(t, b) \
>> +    (((1ULL << ((t) + 1)) - 1) & ~((1ULL << (b)) - 1))
>> +#define BE_GENMASK(t, b)                   GENMASK(BE_BIT(t), 
>> BE_BIT(b))
>
> I think we should rework the code to make these macro local to the fsi
> subsystem, in the fsi.h file, or even better get rid of them.

OK, Removed it from bitops.h

Thanks for the review.

~ Ninad

>
> Thanks,
>
> C.
>
>
>>   #endif
>
