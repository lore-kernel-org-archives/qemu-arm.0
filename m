Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp489563ejb;
        Sat, 21 Oct 2023 13:28:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAi36eazYikd3vomkfBJsbO9O4+JoO1aZjmTl/1wn420obL4JCWjquJPZzeBOoBUZubqZB
X-Received: by 2002:a05:620a:191a:b0:775:7be2:8c8 with SMTP id bj26-20020a05620a191a00b007757be208c8mr5794671qkb.61.1697920104040;
        Sat, 21 Oct 2023 13:28:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697920104; cv=none;
        d=google.com; s=arc-20160816;
        b=PAKftzD1aO7EckmW80Yf8PFlqwqAzMS+vsk3hJ0Jk1V6h6OTHmI4IP7LkI34yhKEV4
         x+vFJScdiqbyhipUGqRScufQmd+r+TMKax6GVgMrfmgLIMCayzS8lv4lDhj4KI7vRlUd
         vpgwoZrkPH/wxOggB6hU7RYVK9j0LAugLCcb5zJASmJZNZlRpgXA/5MhS8AaOu0EkSbo
         Nx1tLTtpOqnidvSR600Cgobrp46xYJaHFG4CtkVxAEXL2D+dxZAPzJ/OjHya6Oiw4pZF
         N+yz2lXbOYDq6Y9t0T8khQfUjDaFejECu3SBZgn2N+/crRoEDA6RI0ae++MUW0LZDQNC
         iyDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=O50qqfo6QD8uNVJj3012uG2scRq5ObTZtLo3AhfF7B4=;
        fh=Y43JBb6jcKtYvC/4w1QxT1Qv8P0QwDYHs39CE4MrX14=;
        b=OJoxB/sTEwQ/yxJ5n6Y8yblzXsGe/DvYUraDwt4FweU1uxD/TNgbyiKE7r7+6dcJJm
         /FbM9kxYbS8V2QRMpFXYib24Sdeyru8ANGzrGqIakR/CPbjUfyU6fwThUqt1D1tRupas
         sMiWRyDxAdZs6eempBeoZHcXrzz4M20VxwZV/3ACbb7ELKBgSGYASrOGl/QtvJQidqea
         EQB8XxFZXwIcZ4pUrU3UQUIoRdR+Ph2FzydcViPzRikJPYIxa1yPwibkSqjibQU1qUt1
         dEAHLf7YkXq8ZM1gAj+YbFY+P0FbOHDYLBk4/Cty4ec6hWQiiUNv5Sy9WtpqBaN2GJ2o
         JnoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=TmUtC9ba;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bi19-20020a05620a319300b00778b15897bbsi2200640qkb.516.2023.10.21.13.28.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Oct 2023 13:28:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=TmUtC9ba;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1quIZh-0005cT-Ct; Sat, 21 Oct 2023 16:27:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1quIZg-0005cG-M0; Sat, 21 Oct 2023 16:27:56 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1quIZe-00037m-MW; Sat, 21 Oct 2023 16:27:56 -0400
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39LKPLMD020584; Sat, 21 Oct 2023 20:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=O50qqfo6QD8uNVJj3012uG2scRq5ObTZtLo3AhfF7B4=;
 b=TmUtC9badfaGOZU9/3Mq0/JgymBA3HTgeT2RMSf6pC3Sy4Mlc5ZA8A2Df9LmQdmilTva
 +wtuiFihc0QlQFL1t/vvwB2xD+EALowxfGRWsU9Gg/PR1oe/5GnHq48EMNiosnWVwdGT
 8Qwy4sb/+HsiFjQRyPl2ZzNKVZmKLZZU8aLZCse2+TJCYZzqrvqEYeZVmo7iLNcyRMmf
 z07sXPAVpR72EHOpdZj1F1RTU70VWCZd19rLY2aIldtL/HjqVxxAjJfsILdOoVO8Rz1R
 RZGp68t5jKbD/JHysmlc0ocTZoH+HnEWmPRzi/pZFJ0aYeUhaxJTuh4Mii8FtqyeFwFv pw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tvnnhr159-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 21 Oct 2023 20:27:39 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39LKPGaJ020500;
 Sat, 21 Oct 2023 20:27:38 GMT
Received: from ppma13.dal12v.mail.ibm.com
 (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tvnnhr151-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 21 Oct 2023 20:27:38 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
 by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 39LKPVZG007095; Sat, 21 Oct 2023 20:27:38 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
 by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tuc27w65q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 21 Oct 2023 20:27:38 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com
 [10.241.53.105])
 by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 39LKRb5057147770
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 21 Oct 2023 20:27:37 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1825F58055;
 Sat, 21 Oct 2023 20:27:37 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6C74E58043;
 Sat, 21 Oct 2023 20:27:35 +0000 (GMT)
Received: from [9.67.95.215] (unknown [9.67.95.215])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Sat, 21 Oct 2023 20:27:35 +0000 (GMT)
Message-ID: <fac5f695-b959-468a-9fea-e0c03f560022@linux.ibm.com>
Date: Sat, 21 Oct 2023 15:27:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/10] hw/fsi: Introduce IBM's scratchpad
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, clg@kaod.org, peter.maydell@linaro.org,
 andrew@aj.id.au, joel@jms.id.au, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, thuth@redhat.com, philmd@linaro.org,
 lvivier@redhat.com, qemu-arm@nongnu.org
References: <20231011151339.2782132-1-ninad@linux.ibm.com>
 <20231011151339.2782132-3-ninad@linux.ibm.com> <ZTDmtBUkuvYNkFlQ@redhat.com>
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <ZTDmtBUkuvYNkFlQ@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XtJiSPsVNrEQjKNCexeFM96e4l9H2P1I
X-Proofpoint-GUID: DjALCfApYCrr_OlELopVKz8__3dBUZPO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-21_12,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011
 lowpriorityscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310170001 definitions=main-2310210187
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
X-TUID: tDamLNDUiU7T

Hello Daniel,

On 10/19/23 03:20, Daniel P. Berrangé wrote:
> On Wed, Oct 11, 2023 at 10:13:31AM -0500, Ninad Palsule wrote:
>> This is a part of patchset where scratchpad is introduced.
>>
>> The scratchpad provides a set of non-functional registers. The firmware
>> is free to use them, hardware does not support any special management
>> support. The scratchpad registers can be read or written from LBUS
>> slave.
>>
>> In this model, The LBUS device is parent for the scratchpad.
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
>>   include/hw/fsi/engine-scratchpad.h | 33 ++++++++++
>>   hw/fsi/engine-scratchpad.c         | 99 ++++++++++++++++++++++++++++++
>>   hw/fsi/Kconfig                     |  4 ++
>>   hw/fsi/meson.build                 |  1 +
>>   hw/fsi/trace-events                |  2 +
>>   5 files changed, 139 insertions(+)
>>   create mode 100644 include/hw/fsi/engine-scratchpad.h
>>   create mode 100644 hw/fsi/engine-scratchpad.c
>>   create mode 100644 hw/fsi/trace-events
>>
>> diff --git a/include/hw/fsi/engine-scratchpad.h b/include/hw/fsi/engine-scratchpad.h
>> new file mode 100644
>> index 0000000000..17e9570c5c
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
>> +#define ENGINE_CONFIG_NEXT              BE_BIT(0)
>> +#define ENGINE_CONFIG_VPD               BE_BIT(1)
>> +#define ENGINE_CONFIG_SLOTS             BE_GENMASK(8, 15)
>> +#define ENGINE_CONFIG_VERSION           BE_GENMASK(16, 19)
>> +#define ENGINE_CONFIG_TYPE              BE_GENMASK(20, 27)
>> +#define   ENGINE_CONFIG_TYPE_PEEK       (0x02 << 4)
>> +#define   ENGINE_CONFIG_TYPE_FSI        (0x03 << 4)
>> +#define   ENGINE_CONFIG_TYPE_SCRATCHPAD (0x06 << 4)
>> +#define ENGINE_CONFIG_CRC              BE_GENMASK(28, 31)
>> +
>> +#define TYPE_SCRATCHPAD "scratchpad"
>> +#define SCRATCHPAD(obj) OBJECT_CHECK(ScratchPad, (obj), TYPE_SCRATCHPAD)
>> +
>> +typedef struct ScratchPad {
>> +        FSILBusDevice parent;
>> +
>> +        uint32_t reg;
>> +} ScratchPad;
>> +
>> +#endif /* FSI_ENGINE_SCRATCHPAD_H */
>> diff --git a/hw/fsi/engine-scratchpad.c b/hw/fsi/engine-scratchpad.c
>> new file mode 100644
>> index 0000000000..60f678eec4
>> --- /dev/null
>> +++ b/hw/fsi/engine-scratchpad.c
>> @@ -0,0 +1,99 @@
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
>> +#include "trace.h"
>> +
>> +#include "hw/fsi/engine-scratchpad.h"
>> +
>> +static uint64_t scratchpad_read(void *opaque, hwaddr addr, unsigned size)
>> +{
>> +    ScratchPad *s = SCRATCHPAD(opaque);
>> +
>> +    trace_scratchpad_read(addr, size);
>> +
>> +    if (addr) {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "%s: Out of bounds read: 0x%"HWADDR_PRIx" for %u\n",
>> +                      __func__, addr, size);
> We already have a trace point in the line above. I don't think we should
> be unconditionally logging errors like this, as this becomes a guest
> triggerable denial of service on the host log collector for the guest.
> eg it could flood the logfile connected to stderr with unlimited data
> by repeatedly doing bad reads/writes.
Make sense. We can catch it using the existing traces. I have removed it 
from read and write function.
>
>> +        return 0;
>> +    }
>> +
>> +    return s->reg;
>> +}
>> +
>> +static void scratchpad_write(void *opaque, hwaddr addr, uint64_t data,
>> +                                 unsigned size)
>> +{
>> +    ScratchPad *s = SCRATCHPAD(opaque);
>> +
>> +    trace_scratchpad_write(addr, size, data);
>> +
>> +    if (addr) {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "%s: Out of bounds write: 0x%"HWADDR_PRIx" for %u\n",
>> +                      __func__, addr, size);
>> +        return;
>> +    }
>> +
>> +    s->reg = data;
>> +}
>> +
>> +static const struct MemoryRegionOps scratchpad_ops = {
>> +    .read = scratchpad_read,
>> +    .write = scratchpad_write,
>> +    .endianness = DEVICE_BIG_ENDIAN,
>> +};
>> +
>> +static void scratchpad_realize(DeviceState *dev, Error **errp)
>> +{
>> +    FSILBusDevice *ldev = FSI_LBUS_DEVICE(dev);
>> +
>> +    memory_region_init_io(&ldev->iomem, OBJECT(ldev), &scratchpad_ops,
>> +                          ldev, TYPE_SCRATCHPAD, 0x400);
>> +}
>> +
>> +static void scratchpad_reset(DeviceState *dev)
>> +{
>> +    ScratchPad *s = SCRATCHPAD(dev);
>> +
>> +    s->reg = 0;
>> +}
>> +
>> +static void scratchpad_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>> +    FSILBusDeviceClass *ldc = FSI_LBUS_DEVICE_CLASS(klass);
>> +
>> +    dc->realize = scratchpad_realize;
>> +    dc->reset = scratchpad_reset;
>> +
>> +    ldc->config =
>> +          ENGINE_CONFIG_NEXT            /* valid */
>> +        | 0x00010000                    /* slots */
>> +        | 0x00001000                    /* version */
>> +        | ENGINE_CONFIG_TYPE_SCRATCHPAD /* type */
>> +        | 0x00000007;                   /* crc */
> More common QEMU style would be for the "|" to be on the end
> of line rather than start.
>
> End of line:
>
> $ git grep '.*\s|\s*$' "*.c" | wc -l
> 5381
>
> Start of line:
>
> $ git grep '^\s*|\s.*' "*.c" | wc -l
> 581

Fixed as per you suggestion.

Thanks for the review.

Regards,

Ninad

>
>> +}
>> +
>> +static const TypeInfo scratchpad_info = {
>> +    .name = TYPE_SCRATCHPAD,
>> +    .parent = TYPE_FSI_LBUS_DEVICE,
>> +    .instance_size = sizeof(ScratchPad),
>> +    .class_init = scratchpad_class_init,
>> +    .class_size = sizeof(FSILBusDeviceClass),
>> +};
>> +
>> +static void scratchpad_register_types(void)
>> +{
>> +    type_register_static(&scratchpad_info);
>> +}
>> +
>> +type_init(scratchpad_register_types);
>> diff --git a/hw/fsi/Kconfig b/hw/fsi/Kconfig
>> index e650c660f0..f7c7fd1b28 100644
>> --- a/hw/fsi/Kconfig
>> +++ b/hw/fsi/Kconfig
>> @@ -1,2 +1,6 @@
>> +config FSI_SCRATCHPAD
>> +    bool
>> +    select FSI_LBUS
>> +
>>   config FSI_LBUS
>>       bool
>> diff --git a/hw/fsi/meson.build b/hw/fsi/meson.build
>> index 4074d3a7d2..d45a98c223 100644
>> --- a/hw/fsi/meson.build
>> +++ b/hw/fsi/meson.build
>> @@ -1 +1,2 @@
>>   system_ss.add(when: 'CONFIG_FSI_LBUS', if_true: files('lbus.c'))
>> +system_ss.add(when: 'CONFIG_FSI_SCRATCHPAD', if_true: files('engine-scratchpad.c'))
>> diff --git a/hw/fsi/trace-events b/hw/fsi/trace-events
>> new file mode 100644
>> index 0000000000..97fd070354
>> --- /dev/null
>> +++ b/hw/fsi/trace-events
>> @@ -0,0 +1,2 @@
>> +scratchpad_read(uint64_t addr, uint32_t size) "@0x%" PRIx64 " size=%d"
>> +scratchpad_write(uint64_t addr, uint32_t size, uint64_t data) "@0x%" PRIx64 " size=%d value=0x%"PRIx64
>> -- 
>> 2.39.2
>>
> With regards,
> Daniel
