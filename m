Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp487954ejb;
        Sat, 21 Oct 2023 13:22:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHh4VNsrSW403R2hedQjqS2u71nm0Xmj4PaJsF6cJIIsjwM+AgSUFFCJ7vPXXyoRHJkWoan
X-Received: by 2002:a05:622a:14c6:b0:412:c81:eff3 with SMTP id u6-20020a05622a14c600b004120c81eff3mr11530232qtx.15.1697919745315;
        Sat, 21 Oct 2023 13:22:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697919745; cv=none;
        d=google.com; s=arc-20160816;
        b=YGbGg4YW5FkRTK5N2dp9bclJUm53qtQPF1GNXuDdzo5MZ3/Fk9rvt6MivOkszXFzwu
         wDIVS6/pocd0t6CSB055ZXSnbN2AahzAxBQPpu555tfeJFIm1oeQAUwzN7oj4+dnCKwT
         iMypxxWSTa4tqla1k8NtmKXeZ2EN4x4gqq0oFJfxuIFCOCxWNGPTvT4QkmOgGIpVuG31
         Ms0cqndMeWxEo57aAhaCtN3qyefC2quiEIgmSazJjHu98PlNm6NdWlQM+gCypMr2MViU
         JWwTrKqKKUBaRoiGrl5CWTjBD0CQ6TbRseWVMPUVou41aS1h4JZtmWTuGYmwYWfKAEdN
         Dwyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=CqtXiDDtt8oM/cOp66bvjvmLFD/Jwosmj4GO5XQTP7c=;
        fh=qShmx9hl1ph34ulEBOCe1Wl+bd1jf8hIEJWbXZnp4xc=;
        b=Z34Ay8L0KRJguK41b/2rU9OQRmJpbTNwU+pt9IelAtVNNdDwONxjaIRso196jZQjQ3
         4NHR10iUEbTwqtBfhUh/eVOPJjZZ1VOOvNalZrQ8nyEESbzLSTIONID0gImAWvtcoQRl
         oUDyrS6dmU/b4Astgqaxlk/JD9pUPCUhKoDFbQujq3xNBi6O33Ev3RgGY+tePwNq05Qx
         6pyu82Jk85i5OVVNQYzOESzG5E+BnX3LzeVsHQjdnzYVvyODoamPFj1rboENdPsxF62/
         /N3zd9GmHSggWjRaAZmMmI0fIp86cvmEzyr3XXP4sbF5L/U29mr1oHbQzHubegyN7wY8
         mrbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=mFRJtEAY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n13-20020a05622a11cd00b004165130b594si3388595qtk.530.2023.10.21.13.22.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Oct 2023 13:22:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=mFRJtEAY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1quIU9-0003Tt-NE; Sat, 21 Oct 2023 16:22:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1quIU8-0003Sn-ER; Sat, 21 Oct 2023 16:22:12 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1quIU4-0001dn-AI; Sat, 21 Oct 2023 16:22:12 -0400
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39LKA6uS023736; Sat, 21 Oct 2023 20:21:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=CqtXiDDtt8oM/cOp66bvjvmLFD/Jwosmj4GO5XQTP7c=;
 b=mFRJtEAYvqao0XtOSQFO0ybs9Iu9QY6+SRm/fzqBTaksf04XvyRwZ5w6eDGX8Os1+6Hq
 5aaDl25FY4oWqzAPL/l9kSI7P6u+SQBBSusZ/jIoOTgNw67pgng0MKqApmjZe8jTCa/Q
 D/+LKe0MxZwC8igzWYBsOFhHFGVnI6gE2uM0dfM9YVMNRb0OhoBxuCZAbVaOcXp0c+G0
 cSQQIQjpBxp5GTQAUuzoHILwonRIg0DlCRaKDkb4p2od7P/2Ai02UfBWjPf8LIqr6xI9
 uLA9m0O/SwyVsb4shVk9WleQz62BNURIr1cAZU/IrWcIUHcQOU8BPMvBAkfUkasIEzUg wg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tvneh871g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 21 Oct 2023 20:21:54 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39LKAg4Q024386;
 Sat, 21 Oct 2023 20:21:54 GMT
Received: from ppma13.dal12v.mail.ibm.com
 (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tvneh8716-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 21 Oct 2023 20:21:54 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
 by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 39LKFqeW007102; Sat, 21 Oct 2023 20:21:53 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
 by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tuc27w5df-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 21 Oct 2023 20:21:53 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com
 [10.241.53.105])
 by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 39LKLqLH50790826
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 21 Oct 2023 20:21:52 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 66B0458055;
 Sat, 21 Oct 2023 20:21:52 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0182D58043;
 Sat, 21 Oct 2023 20:21:51 +0000 (GMT)
Received: from [9.67.95.215] (unknown [9.67.95.215])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Sat, 21 Oct 2023 20:21:50 +0000 (GMT)
Message-ID: <6eb57aea-edee-41a5-874b-e2f3d413aa71@linux.ibm.com>
Date: Sat, 21 Oct 2023 15:21:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/10] hw/fsi: Introduce IBM's Local bus
Content-Language: en-US
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 thuth@redhat.com, philmd@linaro.org, lvivier@redhat.com
Cc: qemu-arm@nongnu.org
References: <20231011151339.2782132-1-ninad@linux.ibm.com>
 <20231011151339.2782132-2-ninad@linux.ibm.com>
 <78725dd0-53c3-4b6f-a632-2fed0d383b79@kaod.org>
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <78725dd0-53c3-4b6f-a632-2fed0d383b79@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: KIbUYetNat40r8eoMmNaGaynV6Z6pGTn
X-Proofpoint-GUID: kKSukZm5LiW11c_sGJQEG9SOuYnR4BZQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-21_12,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 mlxscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310170001
 definitions=main-2310210186
Received-SPF: pass client-ip=148.163.158.5; envelope-from=ninad@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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
X-TUID: ohgNBnn0OJnK

Hello Cedric,

On 10/19/23 03:08, Cédric Le Goater wrote:
> On 10/11/23 17:13, Ninad Palsule wrote:
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
>> v5:
>> - Incorporated review comments by Cedric.
>> ---
>>   include/hw/fsi/lbus.h | 51 +++++++++++++++++++++++++
>>   include/qemu/bitops.h |  6 +++
>>   hw/fsi/lbus.c         | 87 +++++++++++++++++++++++++++++++++++++++++++
>>   hw/Kconfig            |  1 +
>>   hw/fsi/Kconfig        |  2 +
>>   hw/fsi/meson.build    |  1 +
>>   hw/meson.build        |  1 +
>>   7 files changed, 149 insertions(+)
>>   create mode 100644 include/hw/fsi/lbus.h
>>   create mode 100644 hw/fsi/lbus.c
>>   create mode 100644 hw/fsi/Kconfig
>>   create mode 100644 hw/fsi/meson.build
>>
>> diff --git a/include/hw/fsi/lbus.h b/include/hw/fsi/lbus.h
>> new file mode 100644
>> index 0000000000..408fe25831
>> --- /dev/null
>> +++ b/include/hw/fsi/lbus.h
>> @@ -0,0 +1,51 @@
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
>> +#define TYPE_FSI_LBUS_DEVICE "fsi.lbus.device"
>> +OBJECT_DECLARE_TYPE(FSILBusDevice, FSILBusDeviceClass, FSI_LBUS_DEVICE)
>> +
>> +#define FSI_LBUS_MEM_REGION_SIZE  (2 * 1024 * 1024)
>> +#define FSI_LBUSDEV_IOMEM_SIZE    0x400
>> +
>> +typedef struct FSILBusDevice {
>> +    DeviceState parent;
>> +
>> +    MemoryRegion iomem;
>> +    uint32_t address;
>> +} FSILBusDevice;
>> +
>> +typedef struct FSILBusDeviceClass {
>> +    DeviceClass parent;
>> +
>> +    uint32_t config;
>> +} FSILBusDeviceClass;
>> +
>> +typedef struct FSILBusNode {
>> +    FSILBusDevice *ldev;
>> +
>> +    QLIST_ENTRY(FSILBusNode) next;
>> +} FSILBusNode;
>> +
>> +#define TYPE_FSI_LBUS "fsi.lbus"
>> +OBJECT_DECLARE_SIMPLE_TYPE(FSILBus, FSI_LBUS)
>> +
>> +typedef struct FSILBus {
>> +    BusState bus;
>> +
>> +    MemoryRegion mr;
>> +
>> +    QLIST_HEAD(, FSILBusNode) devices;
>> +} FSILBus;
>> +
>> +DeviceState *lbus_create_device(FSILBus *bus, const char *type, 
>> uint32_t addr);
>> +int lbus_add_device(FSILBus *bus, FSILBusDevice *dev);
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
>> +
>>   #endif
>
> Oh I forgot. please remove this change above.

Fixed. Sorry I should have fixed it last patch.

Thanks for the review.

~Ninad

>
> Thanks,
>
> C.
>
>
>> diff --git a/hw/fsi/lbus.c b/hw/fsi/lbus.c
>> new file mode 100644
>> index 0000000000..d7117d1299
>> --- /dev/null
>> +++ b/hw/fsi/lbus.c
>> @@ -0,0 +1,87 @@
>> +/*
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + * Copyright (C) 2023 IBM Corp.
>> + *
>> + * IBM Local bus where FSI slaves are connected
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "qapi/error.h"
>> +#include "hw/fsi/lbus.h"
>> +
>> +#include "hw/qdev-properties.h"
>> +
>> +static void lbus_realize(BusState *bus, Error **errp)
>> +{
>> +    FSILBusNode *node;
>> +    FSILBus *lbus = FSI_LBUS(bus);
>> +
>> +    memory_region_init(&lbus->mr, OBJECT(lbus), TYPE_FSI_LBUS,
>> +                       FSI_LBUS_MEM_REGION_SIZE - 
>> FSI_LBUSDEV_IOMEM_SIZE);
>> +
>> +    QLIST_FOREACH(node, &lbus->devices, next) {
>> +        memory_region_add_subregion(&lbus->mr, node->ldev->address,
>> + &node->ldev->iomem);
>> +    }
>> +}
>> +
>> +static void lbus_class_init(ObjectClass *klass, void *data)
>> +{
>> +    BusClass *k = BUS_CLASS(klass);
>> +    k->realize = lbus_realize;
>> +}
>> +
>> +static const TypeInfo lbus_info = {
>> +    .name = TYPE_FSI_LBUS,
>> +    .parent = TYPE_BUS,
>> +    .instance_size = sizeof(FSILBus),
>> +    .class_init = lbus_class_init,
>> +};
>> +
>> +static Property lbus_device_props[] = {
>> +    DEFINE_PROP_UINT32("address", FSILBusDevice, address, 0),
>> +    DEFINE_PROP_END_OF_LIST(),
>> +};
>> +
>> +DeviceState *lbus_create_device(FSILBus *bus, const char *type, 
>> uint32_t addr)
>> +{
>> +    DeviceState *dev;
>> +    FSILBusNode *node;
>> +    BusState *state = BUS(bus);
>> +
>> +    dev = qdev_new(type);
>> +    qdev_prop_set_uint8(dev, "address", addr);
>> +    qdev_realize_and_unref(dev, state, &error_fatal);
>> +
>> +    /* Move to post_load */
>> +    node = g_malloc(sizeof(struct FSILBusNode));
>> +    node->ldev = FSI_LBUS_DEVICE(dev);
>> +    QLIST_INSERT_HEAD(&bus->devices, node, next);
>> +
>> +    return dev;
>> +}
>> +
>> +static void lbus_device_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>> +
>> +    dc->bus_type = TYPE_FSI_LBUS;
>> +    device_class_set_props(dc, lbus_device_props);
>> +}
>> +
>> +static const TypeInfo lbus_device_type_info = {
>> +    .name = TYPE_FSI_LBUS_DEVICE,
>> +    .parent = TYPE_DEVICE,
>> +    .instance_size = sizeof(FSILBusDevice),
>> +    .abstract = true,
>> +    .class_init = lbus_device_class_init,
>> +    .class_size = sizeof(FSILBusDeviceClass),
>> +};
>> +
>> +static void lbus_register_types(void)
>> +{
>> +    type_register_static(&lbus_info);
>> +    type_register_static(&lbus_device_type_info);
>> +}
>> +
>> +type_init(lbus_register_types);
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
>> index 0000000000..e650c660f0
>> --- /dev/null
>> +++ b/hw/fsi/Kconfig
>> @@ -0,0 +1,2 @@
>> +config FSI_LBUS
>> +    bool
>> diff --git a/hw/fsi/meson.build b/hw/fsi/meson.build
>> new file mode 100644
>> index 0000000000..4074d3a7d2
>> --- /dev/null
>> +++ b/hw/fsi/meson.build
>> @@ -0,0 +1 @@
>> +system_ss.add(when: 'CONFIG_FSI_LBUS', if_true: files('lbus.c'))
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
>
