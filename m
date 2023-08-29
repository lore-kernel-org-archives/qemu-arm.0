Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3671720ejc;
        Tue, 29 Aug 2023 06:39:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0U6jBaunDCqcJdbU2d6YziQBahVwEaMvBjniwmbv6+/DbuX06oX4+TlZQ5XNXRhW+pAfZ
X-Received: by 2002:ac8:7dd3:0:b0:40a:fc6a:e87b with SMTP id c19-20020ac87dd3000000b0040afc6ae87bmr40172110qte.22.1693316399060;
        Tue, 29 Aug 2023 06:39:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693316399; cv=none;
        d=google.com; s=arc-20160816;
        b=I5VYPBb0zRr0KDate2shpeFIHs9+/FdQtekDCIEHTKjQCjllCI3ybmE2mj8+DorBZd
         zT+UBJNTKTYTlTGp5GPIaeQ1cGHo52OwH+5FFnRfBTVcO3BkQ0riLI4ZCryXRUpclpDw
         2KYs8IjhMaNYo5Lor3kiZzrGogn7UK9naRJfDOtpT2FE3kHigZiZCtvysr62/FpugmXk
         E3u3T5qxFkZzNgyWpjGqvEp7O/OX4zEALnWsLRuNSoOMeHV/pdOSuneLB6gyFfNu2E8U
         u/6GrR4JCjPg4g5JSLtXEl2Hd06441nfqcjZdnK+7XGkxwOumbdRtLkOEr1ATPL63otj
         dfPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ZybND9jMl8rRrhea433W0rcVzCOrgMbPA7TF7ZRIb44=;
        fh=HXFIYFUTPsIGoWOOaxJIIObVrQwOW75f30cUG330MvM=;
        b=0lNYj41HAsXpYDECMltyRpP5yv98of4uAKSwZ6bz3loQizmps2pI9NgzVC222VOpAR
         V/MTaCkd4g2/IJ3nY/jkQtigzhmH+8diCfKKx5i1MClM78DNa8P0cNysGHOSluZJ7cBy
         h6Lzbk0MyasyC6LZF8QOQ3M/44raquCdjLIXCkTdntHqp1E0HNzkIPxqhYz1t1KpcAXQ
         PxRoXiqwJhqZ9ovCHXJrPUB3j7uFtzjT9wMSQBt1tMaXcnaYnvAy6bmJLHEuZjGIs40j
         ROEGdpE6zrJo7QJVFSlvxA34KN/9+5NLtArdnKL0ptSfPLi2rNAGPXPRPBKp6R6b7Urm
         iXfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=jhiNu0FJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l19-20020a05622a051300b00403397c9074si3209459qtx.744.2023.08.29.06.39.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Aug 2023 06:39:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=jhiNu0FJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qaywi-0001xF-D2; Tue, 29 Aug 2023 09:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1qaywh-0001uR-A4; Tue, 29 Aug 2023 09:39:51 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1qaywd-0002At-DQ; Tue, 29 Aug 2023 09:39:51 -0400
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37TDbxAb009489; Tue, 29 Aug 2023 13:39:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ZybND9jMl8rRrhea433W0rcVzCOrgMbPA7TF7ZRIb44=;
 b=jhiNu0FJOPKqIldqzFcm6HZKc/Mf0YqUXFSql5YPx6rIgMXN/BgoNYFsYUttt6o8Hfc7
 6o1T9mp3nTOeGo3ooHEK2p3mBob+0TzBpBAoqH0ezMr4tvyjmPb5FCJoVnIhD1QtTKxB
 lKpP3X0BZLYyZLGemGrFsyW5dC2xgIAqMlVsY+giZKy4Wgr4Rgy7/udqw+iJE5aQFK2o
 oU1M7BIGlOk6Xm9V/SkUqMKuRgAavKj3SIopZoNkQ2s55TOZUQLPEB5h8p/ZbAMW5/iw
 xD4sRnaq6i+HBXMBZ4iw0lBeR+K61zfGw5KcMunlY3tpkWc1N+bXfqLPXkzWTTu9VEUP Jw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ssf7tmr34-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Aug 2023 13:39:34 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37TDcAWm011133;
 Tue, 29 Aug 2023 13:39:33 GMT
Received: from ppma12.dal12v.mail.ibm.com
 (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ssf7tmr2n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Aug 2023 13:39:33 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
 by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 37TBhBKq004891; Tue, 29 Aug 2023 13:39:32 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
 by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3squqsm2qf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Aug 2023 13:39:32 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com
 [10.241.53.101])
 by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 37TDdW6B852590
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Aug 2023 13:39:32 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 496F15805A;
 Tue, 29 Aug 2023 13:39:32 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B66F858051;
 Tue, 29 Aug 2023 13:39:31 +0000 (GMT)
Received: from [9.61.30.201] (unknown [9.61.30.201])
 by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 29 Aug 2023 13:39:31 +0000 (GMT)
Message-ID: <11681172-0fe9-4e1d-9f8f-03f57b0b09a2@linux.ibm.com>
Date: Tue, 29 Aug 2023 08:39:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/7] hw/fsi: Introduce IBM's cfam,fsi-slave
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, clg@kaod.org,
 peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 philmd@linaro.org
Cc: qemu-arm@nongnu.org
References: <20230825203046.3692467-1-ninad@linux.ibm.com>
 <20230825203046.3692467-4-ninad@linux.ibm.com>
 <e2a8e6eb-b9fd-8011-32c0-e5c310bf1135@redhat.com>
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <e2a8e6eb-b9fd-8011-32c0-e5c310bf1135@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: SpHqt8-Go87KfVorTpymMN-P3pbyPQ1W
X-Proofpoint-GUID: UsJL8G46y-o3nll84HguB6-reM0bxr7u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_11,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 suspectscore=0 adultscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308290117
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
X-TUID: s7zznZkyXGyT

Hello Thomas,

On 8/28/23 21:03, Thomas Huth wrote:
> On 25/08/2023 22.30, Ninad Palsule wrote:
>> This is a part of patchset where IBM's Flexible Service Interface is
>> introduced.
>>
>> The Common FRU Access Macro (CFAM), an address space containing
>> various "engines" that drive accesses on busses internal and external
>> to the POWER chip. Examples include the SBEFIFO and I2C masters. The
>> engines hang off of an internal Local Bus (LBUS) which is described
>> by the CFAM configuration block.
>>
>> The FSI slave: The slave is the terminal point of the FSI bus for
>> FSI symbols addressed to it. Slaves can be cascaded off of one
>> another. The slave's configuration registers appear in address space
>> of the CFAM to which it is attached.
>>
>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
>> ---
> ...
>> diff --git a/hw/fsi/cfam.c b/hw/fsi/cfam.c
>> new file mode 100644
>> index 0000000000..19256050bd
>> --- /dev/null
>> +++ b/hw/fsi/cfam.c
>> @@ -0,0 +1,235 @@
>> +/*
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + * Copyright (C) 2023 IBM Corp.
>> + *
>> + * IBM Common FRU Access Macro
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +
>> +#include "qapi/error.h"
>> +#include "qemu/log.h"
>> +
>> +#include "hw/fsi/bits.h"
>> +#include "hw/fsi/cfam.h"
>> +#include "hw/fsi/engine-scratchpad.h"
>> +
>> +#include "hw/qdev-properties.h"
>> +
>> +#define TO_REG(x)                          ((x) >> 2)
>> +
>> +#define CFAM_ENGINE_CONFIG                  TO_REG(0x04)
>> +
>> +#define CFAM_CONFIG_CHIP_ID                TO_REG(0x00)
>> +#define CFAM_CONFIG_CHIP_ID_P9             0xc0022d15
>> +#define   CFAM_CONFIG_CHIP_ID_BREAK        0xc0de0000
>> +
>> +static uint64_t cfam_config_read(void *opaque, hwaddr addr, unsigned 
>> size)
>> +{
>> +    CFAMConfig *config;
>> +    CFAMState *cfam;
>> +    LBusNode *node;
>> +    int i;
>> +
>> +    config = CFAM_CONFIG(opaque);
>> +    cfam = container_of(config, CFAMState, config);
>> +
>> +    qemu_log_mask(LOG_UNIMP, "%s: read @0x%" HWADDR_PRIx " size=%d\n",
>> +                  __func__, addr, size);
>> +
>> +    assert(size == 4);
>> +    assert(!(addr & 3));
>> +
>> +    switch (addr) {
>> +    case 0x00:
>> +        return CFAM_CONFIG_CHIP_ID_P9;
>> +    case 0x04:
>> +        return ENGINE_CONFIG_NEXT
>> +            | 0x00010000                    /* slots */
>> +            | 0x00001000                    /* version */
>> +            | ENGINE_CONFIG_TYPE_PEEK   /* type */
>> +            | 0x0000000c;                   /* crc */
>> +    case 0x08:
>> +        return ENGINE_CONFIG_NEXT
>> +            | 0x00010000                    /* slots */
>> +            | 0x00005000                    /* version */
>> +            | ENGINE_CONFIG_TYPE_FSI    /* type */
>> +            | 0x0000000a;                   /* crc */
>> +        break;
>> +    default:
>> +        /* FIXME: Improve this */
>> +        i = 0xc;
>> +        QLIST_FOREACH(node, &cfam->lbus.devices, next) {
>> +            if (i == addr) {
>> +                return LBUS_DEVICE_GET_CLASS(node->ldev)->config;
>> +            }
>> +            i += size;
>> +        }
>> +
>> +        if (i == addr) {
>> +            return 0;
>> +        }
>> +
>> +        return 0xc0de0000;
>
> Can you explain the magic number at least with a comment?
Added comment for the magic number 0xc0de0000
>
> Maybe it would also make sense to add a qemu_log_mask(LOG_GUEST_ERROR, 
> ...) or qemu_log_mask(LOG_UNIMP, ...) statement here?
There is LOG_UNIMP most of the function. I added it in the reset function.
>
>  Thomas
>

Thank you for the review.

Ninad

