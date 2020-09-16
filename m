Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp176441lfq;
        Tue, 15 Sep 2020 22:51:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyn36azRLUbuzh6aUhNEgG97+RTDhsa/ObSHD9PXjK1qPwYIBlpht7QjnpRHQufBd4XzHRq
X-Received: by 2002:a5b:ace:: with SMTP id a14mr5241548ybr.441.1600235496769;
        Tue, 15 Sep 2020 22:51:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600235496; cv=none;
        d=google.com; s=arc-20160816;
        b=L6sqsgpgfQ49vaD3JeOQcLtpR+8RMsWi/96PjencK4AS33Uh8Y8xyFPU41paWDPxX/
         hARYsYWaiZcUzoYpRvvN3xjJ5Px3PuhHRbfBK4vpJbZa5Nl6JwrZNNSMl/NPCdmwiscr
         UVuIJCmuZVVHPYfVVd3lnDmMkvdJxUEW9rNGERNo+qYJnK06v+qQVCFzRuEvNLMWA16G
         xxWq5/ihVlrjtHNdBJYvHDfDiqAQE+PzE1eVywbMFYWmfm5nZmURiSnTouY9nRrE4O19
         5Ptbr140KEbnb4HGSxS8vEZSSK6+EdwxNEyETcL1MyDOHfZpCgoh++Tbvh2BmqHAS6+h
         z12w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=XPvwjfG7OoNsdq2AwIy0Qsg9GkUiCuvaO9lP8p9pb7o=;
        b=XCJMjXn9/BSt35ean2uKoaUxMLbbRO5kIQnEt7rA8KeGVFGdrjWsDmSpAmPBnWzUIU
         elWU5IXq2Tr3fbYI/Z7QErr6eeWuREmsDMno2oE3uCi4GK61POsVQCFhyVU8rnhgeZCD
         LFvO6cnN5maY5jvyKbrTC4FxUOvGpXmXtniBvlE80bIHv63UECEW+aJkOzYHuvI09Tke
         IlsTjbQuEbSNzK39Pkmc9I2oOFonnK/WZPEG3WwUgcO5UcMFIOwmA5trDLDd0sIMtakC
         iur26iQteTHwZJKkjIsdVkYff3FnwpSoGTqbekZL5YCNjIWO06ZKuhh1l/6RZ0wpUTow
         Yq+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w8si15767510ybw.299.2020.09.15.22.51.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Sep 2020 22:51:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kIQLw-0001aL-6F
	for alex.bennee@linaro.org; Wed, 16 Sep 2020 01:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kIQLj-0001Zv-Bg; Wed, 16 Sep 2020 01:51:23 -0400
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:45127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kIQLf-0003UY-L4; Wed, 16 Sep 2020 01:51:23 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.108])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 6F9EE62142D3;
 Wed, 16 Sep 2020 07:51:08 +0200 (CEST)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 16 Sep
 2020 07:51:07 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006f62c1393-4430-41ca-b1fd-b82882e93c8a,
 282F6B8BB580550643A9CB45D70726BD5CC915E6) smtp.auth=clg@kaod.org
Subject: Re: [PATCH] hw/arm/aspeed: Map the UART5 device unconditionally
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 <qemu-devel@nongnu.org>
References: <20200905212415.760452-1-f4bug@amsat.org>
 <e640309b-b694-e815-d64d-40dd453e52ef@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <5e27c1f9-6d11-fa62-ba71-0020ce9d595b@kaod.org>
Date: Wed, 16 Sep 2020 07:51:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <e640309b-b694-e815-d64d-40dd453e52ef@amsat.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: a58f799c-3962-4c12-8c8b-e0285d6d319b
X-Ovh-Tracer-Id: 12090757628491369254
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrtddugdelgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejhedtveeihffguefgveejieevfeevtddvhefhjeeludevjeeifefhfeefteefueenucffohhmrghinhepohiilhgrsghsrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehfgegsuhhgsegrmhhsrghtrdhorhhg
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 01:51:09
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lGXv7rX2l4tQ

On 9/15/20 7:23 PM, Philippe Mathieu-Daudé wrote:
> ping?

It's reviewed : 

  http://patchwork.ozlabs.org/project/qemu-devel/patch/20200905212415.760452-1-f4bug@amsat.org/

I will send a PR when I have more patches.

Thanks,

C. 

> On 9/5/20 11:24 PM, Philippe Mathieu-Daudé wrote:
>> The UART5 is present on the machine regardless there is a
>> character device connected to it. Map it unconditionally.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  hw/arm/aspeed_ast2600.c | 8 +++-----
>>  hw/arm/aspeed_soc.c     | 8 +++-----
>>  2 files changed, 6 insertions(+), 10 deletions(-)
>>
>> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
>> index 9d95e421435..1450bde7cf2 100644
>> --- a/hw/arm/aspeed_ast2600.c
>> +++ b/hw/arm/aspeed_ast2600.c
>> @@ -325,11 +325,9 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>>      }
>>  
>>      /* UART - attach an 8250 to the IO space as our UART5 */
>> -    if (serial_hd(0)) {
>> -        qemu_irq uart5 = aspeed_soc_get_irq(s, ASPEED_DEV_UART5);
>> -        serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
>> -                       uart5, 38400, serial_hd(0), DEVICE_LITTLE_ENDIAN);
>> -    }
>> +    serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
>> +                   aspeed_soc_get_irq(s, ASPEED_DEV_UART5),
>> +                   38400, serial_hd(0), DEVICE_LITTLE_ENDIAN);
>>  
>>      /* I2C */
>>      object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr),
>> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
>> index 35be126db6f..7eefd54ac07 100644
>> --- a/hw/arm/aspeed_soc.c
>> +++ b/hw/arm/aspeed_soc.c
>> @@ -283,11 +283,9 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>>      }
>>  
>>      /* UART - attach an 8250 to the IO space as our UART5 */
>> -    if (serial_hd(0)) {
>> -        qemu_irq uart5 = aspeed_soc_get_irq(s, ASPEED_DEV_UART5);
>> -        serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
>> -                       uart5, 38400, serial_hd(0), DEVICE_LITTLE_ENDIAN);
>> -    }
>> +    serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
>> +                   aspeed_soc_get_irq(s, ASPEED_DEV_UART5), 38400,
>> +                   serial_hd(0), DEVICE_LITTLE_ENDIAN);
>>  
>>      /* I2C */
>>      object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr),
>>

