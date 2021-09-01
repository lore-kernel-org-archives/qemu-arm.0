Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp669542lfb;
        Wed, 1 Sep 2021 09:44:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEfOxu/U0jizuYDg0Z2zNQMSzZ50zalYAmdkhxWh/c6n9tWibvY9GJl5hFvVVpgw/+yMua
X-Received: by 2002:a05:6102:222c:: with SMTP id d12mr200096vsb.22.1630514645751;
        Wed, 01 Sep 2021 09:44:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630514645; cv=none;
        d=google.com; s=arc-20160816;
        b=0kRLB/Ks26VOWSo066/1uDLBoZtAo7lUbcIwVwifrQmtawHmhg5PdzqpWUL5wE/EO9
         B2GLRY7ZVzhdjTdjDK2mTuSFtPtfHluxbzWo6bFs8d5YFmkH74D5PbJ2Hj9ob5MkGrTY
         8dtWih7QpK+hWd8LCWz5KH9qa3wjry2roQHnhReg1FBoH8xdHHy1IodETWfPKIzPNqKc
         Qq7SdAbV3MEzsAvOksTpAMeu/2nv4ugu6unI3rei83IRcUqSzx2Tm7sYmvKNKzJuSQsq
         7XD62mcQHnGuKSgJ7AKDhfRIAeab6BIUBsHo+mRDGyfl9IAQGKd+GXlflHIBEpn/iE3a
         hXjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=LKeJN9ulKlSkwOJFmXYrcduuBewChKmdjN41M8pm/4E=;
        b=0KpPj+7daCqAEimpM71zcJODE50YyXzKu5fZMPrO6kg4FK32He+JXx31iJRfRbX5tD
         DaIO8+ZprF0ObOrbBIUGdXOCT4lngOxclOsXQZPM6NO/lFTXV1w9pmjaGiZkyhq2KZ+m
         s9fPsfkgwbv/fnlTXqce8evzzmXsHSmNur6M5dbJ0F63/UneG6tzhA9Knehefjf0T7dw
         kM/25pzxnLmEe7m6JJme5iylglvQmz7W6U+E6d5fh7RNxgOlSjGtB66GmGsXWnhm7xsj
         Xt+kk8kLbkRmOJ6sqEI/o3MDeZzT1Kz6iUSAIHDfwRgFDA50HK/ztwMo9uLsSq8iI5OD
         f+6A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c22si221905vsu.89.2021.09.01.09.44.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Sep 2021 09:44:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLTLJ-0001hu-0m
	for alex.bennee@linaro.org; Wed, 01 Sep 2021 12:44:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mLTKz-0001fa-2Z
 for qemu-arm@nongnu.org; Wed, 01 Sep 2021 12:43:45 -0400
Received: from 9.mo52.mail-out.ovh.net ([87.98.180.222]:32975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mLTKv-0006O7-Oi
 for qemu-arm@nongnu.org; Wed, 01 Sep 2021 12:43:44 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.68])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 775792952D9;
 Wed,  1 Sep 2021 18:43:36 +0200 (CEST)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 1 Sep
 2021 18:43:35 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R0023692a728-bd14-4947-9e4a-82a37454aebf,
 5EBA00A5E723AF1D17FBD8632F6684B6834AEADC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v2 1/1] hw/arm/aspeed: Allow machine to set UART default
To: Peter Delevoryas <pdel@fb.com>
References: <20210901153615.2746885-1-pdel@fb.com>
 <20210901153615.2746885-2-pdel@fb.com>
 <d7c98ab7-1ebd-d18c-8d49-a7429fc7940a@kaod.org>
 <C390CCCB-A1C0-4B5E-8197-F417F7D5849E@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <49202e96-8c92-d699-8b68-465e896e640d@kaod.org>
Date: Wed, 1 Sep 2021 18:43:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <C390CCCB-A1C0-4B5E-8197-F417F7D5849E@fb.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: e667a356-d06e-428d-aaa1-44dcbbf1b60d
X-Ovh-Tracer-Id: 12517755165518433132
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddvfedguddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehpuggvlhesfhgsrdgtohhm
Received-SPF: pass client-ip=87.98.180.222; envelope-from=clg@kaod.org;
 helo=9.mo52.mail-out.ovh.net
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) NICE_REPLY_A=-1.029,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "andrew@aj.id.au" <andrew@aj.id.au>, "f4bug@amsat.org" <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "patrick@stwcx.xyz" <patrick@stwcx.xyz>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "joel@jms.id.au" <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FszsOO45PR30

On 9/1/21 6:38 PM, Peter Delevoryas wrote:
> 
>> On Sep 1, 2021, at 9:19 AM, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> ﻿On 9/1/21 5:36 PM, pdel@fb.com wrote:
>>> From: Peter Delevoryas <pdel@fb.com>
>>>
>>> When you run QEMU with an Aspeed machine and a single serial device
>>> using stdio like this:
>>>
>>>    qemu -machine ast2600-evb -drive ... -serial stdio
>>>
>>> The guest OS can read and write to the UART5 registers at 0x1E784000 and
>>> it will receive from stdin and write to stdout. The Aspeed SoC's have a
>>> lot more UART's though (AST2500 has 5, AST2600 has 13) and depending on
>>> the board design, may be using any of them as the serial console. (See
>>> "stdout-path" in a DTS to check which one is chosen).
>>>
>>> Most boards, including all of those currently defined in
>>> hw/arm/aspeed.c, just use UART5, but some use UART1. This change adds
>>> some flexibility for different boards without requiring users to change
>>> their command-line invocation of QEMU.
>>>
>>> I tested this doesn't break existing code by booting an AST2500 OpenBMC
>>> image and an AST2600 OpenBMC image, each using UART5 as the console.
>>>
>>> Then I tested switching the default to UART1 and booting an AST2600
>>> OpenBMC image that uses UART1, and that worked too.
>>>
>>> Signed-off-by: Peter Delevoryas <pdel@fb.com>
>>
>> One comment, any how 
>>
>> Reviewed-by: Cédric Le Goater <clg@kaod.org>
>>
>>> ---
>>> hw/arm/aspeed.c             | 3 +++
>>> hw/arm/aspeed_ast2600.c     | 8 ++++----
>>> hw/arm/aspeed_soc.c         | 9 ++++++---
>>> include/hw/arm/aspeed.h     | 1 +
>>> include/hw/arm/aspeed_soc.h | 1 +
>>> 5 files changed, 15 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>>> index 9d43e26c51..a81e90c539 100644
>>> --- a/hw/arm/aspeed.c
>>> +++ b/hw/arm/aspeed.c
>>> @@ -350,6 +350,8 @@ static void aspeed_machine_init(MachineState *machine)
>>>         object_property_set_int(OBJECT(&bmc->soc), "hw-prot-key",
>>>                                 ASPEED_SCU_PROT_KEY, &error_abort);
>>>     }
>>> +    qdev_prop_set_uint32(DEVICE(&bmc->soc), "uart-default",
>>> +                         amc->uart_default);
>>>     qdev_realize(DEVICE(&bmc->soc), NULL, &error_abort);
>>>
>>>     memory_region_add_subregion(get_system_memory(),
>>> @@ -804,6 +806,7 @@ static void aspeed_machine_class_init(ObjectClass *oc, void *data)
>>>     mc->no_parallel = 1;
>>>     mc->default_ram_id = "ram";
>>>     amc->macs_mask = ASPEED_MAC0_ON;
>>> +    amc->uart_default = ASPEED_DEV_UART5;
>>>
>>>     aspeed_machine_class_props_init(oc);
>>> }
>>> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
>>> index e3013128c6..b07fcf10a0 100644
>>> --- a/hw/arm/aspeed_ast2600.c
>>> +++ b/hw/arm/aspeed_ast2600.c
>>> @@ -322,10 +322,10 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>>>         sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), i, irq);
>>>     }
>>>
>>> -    /* UART - attach an 8250 to the IO space as our UART5 */
>>> -    serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
>>> -                   aspeed_soc_get_irq(s, ASPEED_DEV_UART5),
>>> -                   38400, serial_hd(0), DEVICE_LITTLE_ENDIAN);
>>> +    /* UART - attach an 8250 to the IO space as our UART */
>>> +    serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
>>> +                   aspeed_soc_get_irq(s, s->uart_default), 38400,
>>> +                   serial_hd(0), DEVICE_LITTLE_ENDIAN);
>>>
>>>     /* I2C */
>>>     object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr),
>>> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
>>> index 3ad6c56fa9..09c0f83710 100644
>>> --- a/hw/arm/aspeed_soc.c
>>> +++ b/hw/arm/aspeed_soc.c
>>> @@ -287,9 +287,9 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>>>         sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), i, irq);
>>>     }
>>>
>>> -    /* UART - attach an 8250 to the IO space as our UART5 */
>>> -    serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
>>> -                   aspeed_soc_get_irq(s, ASPEED_DEV_UART5), 38400,
>>> +    /* UART - attach an 8250 to the IO space as our UART */
>>> +    serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
>>> +                   aspeed_soc_get_irq(s, s->uart_default), 38400,
>>>                    serial_hd(0), DEVICE_LITTLE_ENDIAN);
>>>
>>>     /* I2C */
>>> @@ -439,6 +439,8 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>>> static Property aspeed_soc_properties[] = {
>>>     DEFINE_PROP_LINK("dram", AspeedSoCState, dram_mr, TYPE_MEMORY_REGION,
>>>                      MemoryRegion *),
>>> +    DEFINE_PROP_UINT32("uart-default", AspeedSoCState, uart_default,
>>> +                       ASPEED_DEV_UART5),
>>>     DEFINE_PROP_END_OF_LIST(),
>>> };
>>>
>>> @@ -449,6 +451,7 @@ static void aspeed_soc_class_init(ObjectClass *oc, void *data)
>>>     dc->realize = aspeed_soc_realize;
>>>     /* Reason: Uses serial_hds and nd_table in realize() directly */
>>>     dc->user_creatable = false;
>>> +
>>
>> Unneeded change,
>>
>> Thanks,
>>
>> C. 
> 
> Dang it, yeah I noticed that just after I sent the patch, my bad. I’ll remove it, I’m just away from my computer, so probably won’t get it in time for you guys to review over in your timeline.

Np. I fixed it inline. We are all ready for the Fuji machine now. 
I will send a PR after that.

Thanks,

C.

> 
> Sent from my iPhone
> 
>>
>>>     device_class_set_props(dc, aspeed_soc_properties);
>>> }
>>>
>>> diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
>>> index c9747b15fc..cbeacb214c 100644
>>> --- a/include/hw/arm/aspeed.h
>>> +++ b/include/hw/arm/aspeed.h
>>> @@ -38,6 +38,7 @@ struct AspeedMachineClass {
>>>     uint32_t num_cs;
>>>     uint32_t macs_mask;
>>>     void (*i2c_init)(AspeedMachineState *bmc);
>>> +    uint32_t uart_default;
>>> };
>>>
>>>
>>> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
>>> index d9161d26d6..87d76c9259 100644
>>> --- a/include/hw/arm/aspeed_soc.h
>>> +++ b/include/hw/arm/aspeed_soc.h
>>> @@ -65,6 +65,7 @@ struct AspeedSoCState {
>>>     AspeedSDHCIState sdhci;
>>>     AspeedSDHCIState emmc;
>>>     AspeedLPCState lpc;
>>> +    uint32_t uart_default;
>>> };
>>>
>>> #define TYPE_ASPEED_SOC "aspeed-soc"
>>>
>>

