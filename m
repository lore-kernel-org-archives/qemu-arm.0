Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp4600912ejq;
        Fri, 12 May 2023 00:06:11 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ48ywWrCQpDEM69vCO8j/sVKZ4mIaf/Iak82oHFz6ohF6HPiHCkctIeqdczYVr46tSRdVI+
X-Received: by 2002:a7b:c8d4:0:b0:3f4:447d:f74a with SMTP id f20-20020a7bc8d4000000b003f4447df74amr7070293wml.26.1683875171661;
        Fri, 12 May 2023 00:06:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683875171; cv=none;
        d=google.com; s=arc-20160816;
        b=IR6Pu/RUjeY6ZZhdbu2e9X//cxwpLUSxYFwWvbOj0BtXy9+v1elRo14lDHrbsx/c2v
         RVASESbMPsOS0k83GVqBrHUlAXUEXYaeXsY1jD/SvQO8AatUUjI5vH16yR8J9yIftOmN
         Wd8PLH+XgDP4Je4zEIK2LX6GCNfiC8+EKwcC8XreO/xzMOzKrqgGr5YY2DB3xlTNMUJl
         ocE2H6rlAb9fhF4xbiCWUnHgihOUUv34gjzwYmxMCvZkvv+wKLKZcPLzhShubS+sKIKU
         6M2q+jARCHuurT2/FPaApqNI1PvdlyaCTwy+7MRSMOsywUA1C2Gr90AS62skaclGkHPT
         +WTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=DDZ0qu08mH2ay7aTWFQDIo4aRnS4FH7beV+mP3EQW0c=;
        b=JAsHUsP25bZrPc8YSP0iP1YjZAnJQHQVk91bZVJcYS1K5veROIYsvf1szMWIcfkYaD
         mS3pKnicHUnp/wVFWBoYmWQ1ibq2LpvGA9rjPzYEpwtDlBRwjXk0C7DYJuMdxTUWrZDT
         UhqV7XmIJp74Dyq3/vLE/m1p70SxRs4ws+oWnMiOsSZzOgmr2b/w/tsozEbH4JiTG9Z7
         bXJirH+zo1jadXj8auQGcOIrsxDEvLXg4etQR1c7NCF1+TyudzatluEI5/1LXona9E9f
         nDvFB6EogQ3NHNhYyWBSo7izEwX1LLHIAYaIFNfIWbCCtv0O/K7iVBjmvdWWccxOgux3
         DYZA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of clg@kaod.org designates 188.165.59.253 as permitted sender) smtp.mailfrom=clg@kaod.org
Return-Path: <clg@kaod.org>
Received: from 7.mo552.mail-out.ovh.net (7.mo552.mail-out.ovh.net. [188.165.59.253])
        by mx.google.com with ESMTPS id f17-20020adffcd1000000b0030472a1d943si10410017wrs.2.2023.05.12.00.06.11
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 00:06:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of clg@kaod.org designates 188.165.59.253 as permitted sender) client-ip=188.165.59.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of clg@kaod.org designates 188.165.59.253 as permitted sender) smtp.mailfrom=clg@kaod.org
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.76])
	by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 6CAA02C8B9;
	Fri, 12 May 2023 07:06:10 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 12 May
 2023 09:06:08 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-101G004c4f41579-9ad1-4258-8ab6-cdecf6981807,
                    4B091FD28FA57C32BD8EB216DEE262B02F305603) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <54172d97-f80b-0ced-38d3-48423f37228d@kaod.org>
Date: Fri, 12 May 2023 09:06:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 04/16] aspeed/smc: Cache AspeedSMCClass
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
	<qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
	Alistair Francis <alistair@alistair23.me>, <qemu-block@nongnu.org>,
	=?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20221025152042.278287-1-clg@kaod.org>
 <20221025152042.278287-5-clg@kaod.org>
 <93d8146b-1490-a0ae-29b3-3b36d89ed64a@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <93d8146b-1490-a0ae-29b3-3b36d89ed64a@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: dc5aac8a-dd3e-4a41-957c-204c76b710cc
X-Ovh-Tracer-Id: 16528492107622419308
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrfeegledgudduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfefgkeetkeegleehueejgefhteekteelieduueffkeetgfekheeuffehveevkeejnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtuddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphhhihhlmhgusehlihhnrghrohdrohhrghdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdhjohgvlhesjhhmshdrihgurdgruhdprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgvpdhqvghmuhdqsghlohgtkhesnhhonhhgnhhurdhorhhgpdgrlh
 gvgidrsggvnhhnvggvsehlihhnrghrohdrohhrghdpoffvtefjohhsthepmhhoheehvddpmhhouggvpehsmhhtphhouhht
X-TUID: 0ZehRp46FU5o

Hello,

On 5/12/23 06:00, Philippe Mathieu-Daudé wrote:
> Hi Cédric,
> 
> On 25/10/22 17:20, Cédric Le Goater wrote:
>> Store a reference on the AspeedSMC class under the flash object and
>> use it when accessing the flash contents. Avoiding the class cast
>> checkers in these hot paths improves performance by 10% when running
>> the aspeed avocado tests.
> 
> I doubt you still have your benchmark number, but do you remember
> if you were using --enable-qom-cast-debug ?

It is relatively easy to run.

Grab :

	https://github.com/legoater/qemu-aspeed-boot/raw/master/images/ast2500-evb/buildroot-2023.02/flash.img

and run :

	qemu-system-arm -M ast2500-evb,execute-in-place=true -net user -drive file=./flash.img,format=raw,if=mtd -nographic

I tried with and without --enable-qom-cast-debug. It doesn't make
much difference.

C.


> 
>> Message-Id: <20220923084803.498337-7-clg@kaod.org>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   include/hw/ssi/aspeed_smc.h | 2 ++
>>   hw/ssi/aspeed_smc.c         | 9 ++++-----
>>   2 files changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
>> index 2d5f8f3d8f68..8e1dda556b91 100644
>> --- a/include/hw/ssi/aspeed_smc.h
>> +++ b/include/hw/ssi/aspeed_smc.h
>> @@ -30,6 +30,7 @@
>>   #include "qom/object.h"
>>   struct AspeedSMCState;
>> +struct AspeedSMCClass;
>>   #define TYPE_ASPEED_SMC_FLASH "aspeed.smc.flash"
>>   OBJECT_DECLARE_SIMPLE_TYPE(AspeedSMCFlash, ASPEED_SMC_FLASH)
>> @@ -37,6 +38,7 @@ struct AspeedSMCFlash {
>>       SysBusDevice parent_obj;
>>       struct AspeedSMCState *controller;
>> +    struct AspeedSMCClass *asc;
>>       uint8_t cs;
>>       MemoryRegion mmio;
>> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
>> index faed7e0cbe17..22df4be528a7 100644
>> --- a/hw/ssi/aspeed_smc.c
>> +++ b/hw/ssi/aspeed_smc.c
>> @@ -388,7 +388,7 @@ static inline int aspeed_smc_flash_cmd(const AspeedSMCFlash *fl)
>>   static inline int aspeed_smc_flash_addr_width(const AspeedSMCFlash *fl)
>>   {
>>       const AspeedSMCState *s = fl->controller;
>> -    AspeedSMCClass *asc = ASPEED_SMC_GET_CLASS(s);
>> +    AspeedSMCClass *asc = fl->asc;
>>       if (asc->addr_width) {
>>           return asc->addr_width(s);
>> @@ -420,7 +420,7 @@ static uint32_t aspeed_smc_check_segment_addr(const AspeedSMCFlash *fl,
>>                                                 uint32_t addr)
>>   {
>>       const AspeedSMCState *s = fl->controller;
>> -    AspeedSMCClass *asc = ASPEED_SMC_GET_CLASS(s);
>> +    AspeedSMCClass *asc = fl->asc;
>>       AspeedSegments seg;
>>       asc->reg_to_segment(s, s->regs[R_SEG_ADDR0 + fl->cs], &seg);
>> @@ -1234,7 +1234,6 @@ static const TypeInfo aspeed_smc_info = {
>>   static void aspeed_smc_flash_realize(DeviceState *dev, Error **errp)
>>   {
>>       AspeedSMCFlash *s = ASPEED_SMC_FLASH(dev);
>> -    AspeedSMCClass *asc;
>>       g_autofree char *name = g_strdup_printf(TYPE_ASPEED_SMC_FLASH ".%d", s->cs);
>>       if (!s->controller) {
>> @@ -1242,14 +1241,14 @@ static void aspeed_smc_flash_realize(DeviceState *dev, Error **errp)
>>           return;
>>       }
>> -    asc = ASPEED_SMC_GET_CLASS(s->controller);
>> +    s->asc = ASPEED_SMC_GET_CLASS(s->controller);
>>       /*
>>        * Use the default segment value to size the memory region. This
>>        * can be changed by FW at runtime.
>>        */
>>       memory_region_init_io(&s->mmio, OBJECT(s), &aspeed_smc_flash_ops,
>> -                          s, name, asc->segments[s->cs].size);
>> +                          s, name, s->asc->segments[s->cs].size);
>>       sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
>>   }
> 
