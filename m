Received: by 2002:a17:906:cd17:b0:9b2:89ee:1eb8 with SMTP id oz23csp2125670ejb;
        Mon, 9 Oct 2023 10:41:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8UVBaZXYzs2bbr0gjv2xQHQIwvQ5VpK0YeroG5L14153tZAUkZSnhRCGEPvff1HDAkKHr
X-Received: by 2002:a25:d352:0:b0:d7b:9372:a35a with SMTP id e79-20020a25d352000000b00d7b9372a35amr13790444ybf.30.1696873319222;
        Mon, 09 Oct 2023 10:41:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696873319; cv=none;
        d=google.com; s=arc-20160816;
        b=BQzT2IULvGxD5UlwBo+5JNgKP4EtYSlySA6cLMsCs+F8VONEYzmzgMq0iZNmexroPP
         H1k7Q+jo8zDF236KLv6muBlz1g/r0w66m87tc0I0ZYq0kZtYKG2AR3nkXURnq4zZP4w9
         66FowCnIszAqbWTdSqwA8X3Wyp9jeU4+xAXxBiWSWTFWhNop5ZEfuVh34povejt/GZED
         /knXl5LEdrpYX9qQ/vltXyRqq7QvXH/bLzZOigUCXpKDq7bPsD2UEr2NT0axIJzCaDPN
         SfhvxP6DQXLbr8QYXviXogFni7djM53ne8iHV+z0keyVjhm/qcSGvag3TRtzeOlL2Kd/
         pSWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=jP5OUX+uO77L4bHDyJ8k5kqv4t/x7SsjU46Z2AB+iTs=;
        fh=qShmx9hl1ph34ulEBOCe1Wl+bd1jf8hIEJWbXZnp4xc=;
        b=j6TufdWA4b/wE7rxFzp6lqJZCwgIpmbsGoiBWYqZLlA3URMsqipjXxdrGqeDc035yu
         VJWIHbozwZyeqfYxI7uiRz6j7fee+D8GdN+tTNF9AGqmBZykbuZJR5KiOInvt5QYIBjF
         JqrnB/0vVRhS0vqYFnlGzPRLBWsUkafZFSG/86v15/wgdDvbnPn3KrhHa8Y2B/CtDocQ
         XzCi36Es/eaMWoSpAbfoHDg3EZme0M1T5iBuvpbI/0Scv15QdU70LIPafvkdkPjWLIHA
         +Busl2C0IFh04XAi07LrdFVHXgePl0Rumo+LkPhX1MNJQmV2D2ruXOElXbNWxIxwjYZw
         KdTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=ALiqv7JD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h2-20020a0cf442000000b0063f7aae913asi6408801qvm.19.2023.10.09.10.41.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Oct 2023 10:41:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=ALiqv7JD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qpuGJ-0006Hd-Km; Mon, 09 Oct 2023 13:41:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1qpuGI-0006HK-Io; Mon, 09 Oct 2023 13:41:46 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1qpuGF-00072F-SS; Mon, 09 Oct 2023 13:41:46 -0400
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 399HU3fS032020; Mon, 9 Oct 2023 17:41:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=jP5OUX+uO77L4bHDyJ8k5kqv4t/x7SsjU46Z2AB+iTs=;
 b=ALiqv7JDS3xSVbEE9X1nSedQ1TrFJ57irp3rbBcVNRQIwXZbIF1R+8VYJ0+gVoQiwktA
 rZbmiagzLQEn4ej+FvRfYG8d1qqdADGd/opuVLXc/4AIInPmGIaM6SQ+wcbyN/7RfBxw
 jJh4IxdInNX48H2vft9Q4Ge17pdg2h1cy1aQkst0gQ0nZuUHlcIaBat/WSzkMZiULajp
 bgpttifUaDZE5dDp+PISiYWRc4ZndPMqhZ6YMEwCL3w0oQ2AKu0H2lu/CYgvSl06QYgc
 gNTcoFeVYZy9IOEhZFDcoESQ9czQuWDJ6rM+uDXeML5R2Dh8vfhvnz+7GFmOq+kbxxDP wA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tmnykrcvk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Oct 2023 17:41:28 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 399HV8hp006617;
 Mon, 9 Oct 2023 17:41:26 GMT
Received: from ppma13.dal12v.mail.ibm.com
 (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tmnykrck8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Oct 2023 17:41:26 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
 by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 399G3VIc001146; Mon, 9 Oct 2023 17:36:49 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
 by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tkkvjj8er-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Oct 2023 17:36:49 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com
 [10.241.53.101])
 by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 399HancT58065298
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Oct 2023 17:36:49 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D45958051;
 Mon,  9 Oct 2023 17:36:49 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CAEFC5805A;
 Mon,  9 Oct 2023 17:36:48 +0000 (GMT)
Received: from [9.61.164.107] (unknown [9.61.164.107])
 by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Mon,  9 Oct 2023 17:36:48 +0000 (GMT)
Message-ID: <565bf568-9dc9-4cb3-8ae5-eabe1bb80430@linux.ibm.com>
Date: Mon, 9 Oct 2023 12:36:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/10] hw/fsi: Introduce IBM's scratchpad
Content-Language: en-US
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 thuth@redhat.com, philmd@linaro.org, lvivier@redhat.com
Cc: qemu-arm@nongnu.org
References: <20230908222859.3381003-1-ninad@linux.ibm.com>
 <20230908222859.3381003-3-ninad@linux.ibm.com>
 <b40b9fd5-7fbb-92c6-747f-839a1ca2a0c1@kaod.org>
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <b40b9fd5-7fbb-92c6-747f-839a1ca2a0c1@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FFc_2etOzNZoe7ANyCrSGl4S35FLt7jS
X-Proofpoint-GUID: COyrz0KzZikObbjkwlevtARjoOvKChMW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-09_15,2023-10-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=957 malwarescore=0 lowpriorityscore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310090144
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
X-TUID: McCLGsbRoqCc

Hello Cedric,

On 9/11/23 07:19, Cédric Le Goater wrote:
> On 9/9/23 00:28, Ninad Palsule wrote:
>> This is a part of patchset where IBM's Flexible Service Interface is
>> introduced.
>>
>> The LBUS device is embeded inside the scratchpad. The scratchpad
>> provides a non-functional registers. There is a 1-1 relation between
>> scratchpad and LBUS devices. Each LBUS device has 1K memory mapped in
>> the LBUS.
>
>
> The commit log is a bit confusing.

I have improved it in my next patch. Please check and let me know.

Thanks for the review.

~Ninad

>
> C.
>
>
>>
>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
>> ---
>> v2:
>> - Incorporated Joel's review comments.
>> ---
>>   hw/fsi/Kconfig                     |   4 ++
>>   hw/fsi/engine-scratchpad.c         | 100 +++++++++++++++++++++++++++++
>>   hw/fsi/meson.build                 |   1 +
>>   include/hw/fsi/engine-scratchpad.h |  33 ++++++++++
>>   4 files changed, 138 insertions(+)
>>   create mode 100644 hw/fsi/engine-scratchpad.c
>>   create mode 100644 include/hw/fsi/engine-scratchpad.h
>>
>> diff --git a/hw/fsi/Kconfig b/hw/fsi/Kconfig
>> index 687449e14e..2a9c49f2c9 100644
>> --- a/hw/fsi/Kconfig
>> +++ b/hw/fsi/Kconfig
>> @@ -1,2 +1,6 @@
>> +config SCRATCHPAD
>> +    bool
>> +    select LBUS
>> +
>>   config LBUS
>>       bool
>> diff --git a/hw/fsi/engine-scratchpad.c b/hw/fsi/engine-scratchpad.c
>> new file mode 100644
>> index 0000000000..15a8f8cc66
>> --- /dev/null
>> +++ b/hw/fsi/engine-scratchpad.c
>> @@ -0,0 +1,100 @@
>> +/*
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + * Copyright (C) 2023 IBM Corp.
>> + *
>> + * IBM scratchpad engine
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +
>> +#include "qapi/error.h"
>> +#include "qemu/log.h"
>> +
>> +#include "hw/fsi/engine-scratchpad.h"
>> +
>> +static uint64_t scratchpad_read(void *opaque, hwaddr addr, unsigned 
>> size)
>> +{
>> +    ScratchPad *s = SCRATCHPAD(opaque);
>> +
>> +    qemu_log_mask(LOG_UNIMP, "%s: read @0x%" HWADDR_PRIx " size=%d\n",
>> +                  __func__, addr, size);
>> +
>> +    if (addr) {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "%s: Out of bounds read: 0x%"HWADDR_PRIx" for 
>> %u\n",
>> +                      __func__, addr, size);
>> +        return 0;
>> +    }
>> +
>> +    return s->reg;
>> +}
>> +
>> +static void scratchpad_write(void *opaque, hwaddr addr, uint64_t data,
>> +                                 unsigned size)
>> +{
>> +    ScratchPad *s = SCRATCHPAD(opaque);
>> +
>> +    qemu_log_mask(LOG_UNIMP, "%s: write @0x%" HWADDR_PRIx " size=%d "
>> +                  "value=%"PRIx64"\n", __func__, addr, size, data);
>> +
>> +    if (addr) {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "%s: Out of bounds write: 0x%"HWADDR_PRIx" for 
>> %u\n",
>> +                      __func__, addr, size);
>> +        return;
>> +    }
>> +
>> +    s->reg = data;
>> +}
>> +
>> +static const struct MemoryRegionOps scratchpad_ops = {
>> +    .read = scratchpad_read,
>> +    .write = scratchpad_write,
>> +    .endianness = DEVICE_BIG_ENDIAN,
>> +};
>> +
>> +static void scratchpad_realize(DeviceState *dev, Error **errp)
>> +{
>> +    LBusDevice *ldev = LBUS_DEVICE(dev);
>> +
>> +    memory_region_init_io(&ldev->iomem, OBJECT(ldev), &scratchpad_ops,
>> +                          ldev, TYPE_SCRATCHPAD, 0x400);
>> +}
>> +
>> +static void scratchpad_reset(DeviceState *dev)
>> +{
>> +    ScratchPad *s = SCRATCHPAD(dev);
>> +
>> +    s->reg = 0;
>> +}
>> +
>> +static void scratchpad_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>> +    LBusDeviceClass *ldc = LBUS_DEVICE_CLASS(klass);
>> +
>> +    dc->realize = scratchpad_realize;
>> +    dc->reset = scratchpad_reset;
>> +
>> +    ldc->config =
>> +          ENGINE_CONFIG_NEXT            /* valid */
>> +        | 0x00010000                    /* slots */
>> +        | 0x00001000                    /* version */
>> +        | ENGINE_CONFIG_TYPE_SCRATCHPAD /* type */
>> +        | 0x00000007;                   /* crc */
>> +}
>> +
>> +static const TypeInfo scratchpad_info = {
>> +    .name = TYPE_SCRATCHPAD,
>> +    .parent = TYPE_LBUS_DEVICE,
>> +    .instance_size = sizeof(ScratchPad),
>> +    .class_init = scratchpad_class_init,
>> +    .class_size = sizeof(LBusDeviceClass),
>> +};
>> +
>> +static void scratchpad_register_types(void)
>> +{
>> +    type_register_static(&scratchpad_info);
>> +}
>> +
>> +type_init(scratchpad_register_types);
>> diff --git a/hw/fsi/meson.build b/hw/fsi/meson.build
>> index e1007d5fea..f90e09ddab 100644
>> --- a/hw/fsi/meson.build
>> +++ b/hw/fsi/meson.build
>> @@ -1 +1,2 @@
>>   system_ss.add(when: 'CONFIG_LBUS', if_true: files('lbus.c'))
>> +system_ss.add(when: 'CONFIG_SCRATCHPAD', if_true: 
>> files('engine-scratchpad.c'))
>> diff --git a/include/hw/fsi/engine-scratchpad.h 
>> b/include/hw/fsi/engine-scratchpad.h
>> new file mode 100644
>> index 0000000000..63bf89ac5a
>> --- /dev/null
>> +++ b/include/hw/fsi/engine-scratchpad.h
>> @@ -0,0 +1,33 @@
>> +/*
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + * Copyright (C) 2023 IBM Corp.
>> + *
>> + * IBM scratchpad engne
>> + */
>> +#ifndef FSI_ENGINE_SCRATCHPAD_H
>> +#define FSI_ENGINE_SCRATCHPAD_H
>> +
>> +#include "qemu/bitops.h"
>> +
>> +#include "hw/fsi/lbus.h"
>> +
>> +#define ENGINE_CONFIG_NEXT              BE_BIT(0)
>> +#define ENGINE_CONFIG_VPD               BE_BIT(1)
>> +#define ENGINE_CONFIG_SLOTS             BE_GENMASK(8, 15)
>> +#define ENGINE_CONFIG_VERSION           BE_GENMASK(16, 19)
>> +#define ENGINE_CONFIG_TYPE              BE_GENMASK(20, 27)
>> +#define   ENGINE_CONFIG_TYPE_PEEK       (0x02 << 4)
>> +#define   ENGINE_CONFIG_TYPE_FSI        (0x03 << 4)
>> +#define   ENGINE_CONFIG_TYPE_SCRATCHPAD (0x06 << 4)
>> +#define ENGINE_CONFIG_CRC              BE_GENMASK(28, 31)
>> +
>> +#define TYPE_SCRATCHPAD "scratchpad"
>> +#define SCRATCHPAD(obj) OBJECT_CHECK(ScratchPad, (obj), 
>> TYPE_SCRATCHPAD)
>> +
>> +typedef struct ScratchPad {
>> +        LBusDevice parent;
>> +
>> +        uint32_t reg;
>> +} ScratchPad;
>> +
>> +#endif /* FSI_ENGINE_SCRATCHPAD_H */
>
