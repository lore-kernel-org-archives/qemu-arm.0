Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp6670513ejb;
        Mon, 2 Jan 2023 04:31:18 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt+IT/5y9QdVcQDf/qOkTNGO9YspsrJwfAKsTjdSgzDNh61lzlpb9bLYqkaZjLxiWr3PNAJ
X-Received: by 2002:a05:622a:5906:b0:3ab:8d12:e281 with SMTP id ga6-20020a05622a590600b003ab8d12e281mr36838895qtb.66.1672662678491;
        Mon, 02 Jan 2023 04:31:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672662678; cv=none;
        d=google.com; s=arc-20160816;
        b=yqF24xLyMJ+kETNnBZ2ygQ6Fed0XpJUKcFq7kQAZjxHKPfherQbedUwetFvHzA0i2J
         g4RLqiWvPQEuEdZKcvUUpPAyaT9qMUTELRe4HLW7VlJPdnSm6tDqkW3VByy2rJMosTjq
         K22stbroEVC6bkEM7hYw+ylSNGQEGaBJctWJ60+PtXwvQlHHpcKNYOU8Tbk0HmZ77NY7
         VCFDWd8kRLcoRo2eX3FoKO1q73PdQW2DDGefDYDnL2JbKgTAjaYoXa+sCgvYnpkSp9cl
         ZkNIMgXSfmf3L1jUkMhFR7Vb3LixdFUNAT8m79h2+Z8+tnv8lP8BW7a0oS39hKR2dQaG
         CeCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=b6aqcLq4XbQA2KdeW3q/Sdl0/oda50eevsHM+LhQPIQ=;
        b=quX/blptEbNTAEHLDOm3EB+tTVPuoRyX/1bDL88IkDqNUPRu0Rm2ploQHxhdpnuWWx
         Kwt45eEMTbTpj5nhcbpI3PEFtdXtwkmcm3ztULhmqK76wNfwi69XDZLN1rfK6e+gKNX2
         yaYdMQsByRO/7xqAgxCEq7TLC7a9b7LNGJutm373L8SzRJMGfrwevX24ia9SLEnghYO2
         BdN+Ywm6knd8Q6WNcbk2Nxs0xr0Rq63dqps6iKIjtOTKhwRRBubwtzBPw3xarnPCpY5S
         Qr+kh56JWRijF+XZ0uIZ5Wwp18p4m1uSkcFIp9xW/jfSz21MWou0zluEdAO6O7euAaae
         HSiw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1-20020ac84d81000000b003a5270c7790si13704989qtw.90.2023.01.02.04.31.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Jan 2023 04:31:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pCJxd-0006Dq-CI; Mon, 02 Jan 2023 07:30:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pCJxb-0006DN-4G
 for qemu-arm@nongnu.org; Mon, 02 Jan 2023 07:30:35 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pCJxY-00023d-7j
 for qemu-arm@nongnu.org; Mon, 02 Jan 2023 07:30:34 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.128])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 472001505269D;
 Mon,  2 Jan 2023 13:30:26 +0100 (CET)
Received: from kaod.org (37.59.142.109) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 2 Jan
 2023 13:30:24 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-109S003702d43f6-3b19-4633-aba7-91176f73f27e,
 EB6D15DD045C308F841A27F8E66F545441276E15) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <55ccb3e8-330e-4dfb-7e9a-4177212dfbf3@kaod.org>
Date: Mon, 2 Jan 2023 13:30:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 01/11] hw/watchdog/wdt_aspeed: Rename MMIO region size
 as 'iosize'
Content-Language: en-US
To: "Dong, Eddie" <eddie.dong@intel.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Joel Stanley <joel@jms.id.au>, Troy Lee <troy_lee@aspeedtech.com>, Beraldo
 Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos
 Santos Moschetta <wainersm@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, Peter Delevoryas
 <peter@pjd.dev>, Steven Lee <steven_lee@aspeedtech.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Peter Delevoryas <pdel@fb.com>, Peter Delevoryas
 <pdel@meta.com>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Cleber Rosa
 <crosa@redhat.com>
References: <20221230113504.37032-1-philmd@linaro.org>
 <20221230113504.37032-2-philmd@linaro.org>
 <BL0PR11MB3042D4D8CA5F740D5EB3D5A08AF19@BL0PR11MB3042.namprd11.prod.outlook.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <BL0PR11MB3042D4D8CA5F740D5EB3D5A08AF19@BL0PR11MB3042.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.109]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 26510ca2-cdb9-45d6-8aef-c2f9da5d8664
X-Ovh-Tracer-Id: 14871167446669232967
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrjedvgdegvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegvugguihgvrdguohhnghesihhnthgvlhdrtghomhdpphguvghlsehmvghtrgdrtghomhdpphguvghlsehfsgdrtghomhdpjhgrmhhinhgplhhinhesrghsphgvvgguthgvtghhrdgtohhmpdhsthgvvhgvnhgplhgvvgesrghsphgvvgguthgvtghhrdgtohhmpdhpvghtvghrsehpjhgurdguvghvpdgthhhinhdqthhinhhgpghkuhhosegrshhpvggvughtvggthhdrtghomhdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdprghnughrvgifsegrjhdrihgurdgruhdpphgvthgvrh
 drmhgrhiguvghllheslhhinhgrrhhordhorhhgpdgslhgvrghlsehrvgguhhgrthdrtghomhdpthhrohihpghlvggvsegrshhpvggvughtvggthhdrtghomhdpjhhovghlsehjmhhsrdhiugdrrghupdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhphhhilhhmugeslhhinhgrrhhordhorhhgpdifrghinhgvrhhsmhesrhgvughhrghtrdgtohhmpdgtrhhoshgrsehrvgguhhgrthdrtghomhdpoffvtefjohhsthepmhhohedvledpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.142,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: bv+cHn3MyvWY

On 12/31/22 23:43, Dong, Eddie wrote:
>>
>> Avoid confusing two different things:
>> - the WDT I/O region size ('iosize')
>> - at which offset the SoC map the WDT ('offset') While it is often the same, we
>> can map smaller region sizes at larger offsets.
>>
>> Here we are interested in the I/O region size, so rename as 'iosize'.
>>
>> Reviewed-by: Peter Delevoryas <peter@pjd.dev>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/arm/aspeed_ast10x0.c          | 2 +-
>>   hw/arm/aspeed_ast2600.c          | 2 +-
>>   hw/arm/aspeed_soc.c              | 2 +-
>>   hw/watchdog/wdt_aspeed.c         | 8 ++++----
>>   include/hw/watchdog/wdt_aspeed.h | 2 +-
>>   5 files changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c index
>> 4d0b9b115f..122b3fd3f3 100644
>> --- a/hw/arm/aspeed_ast10x0.c
>> +++ b/hw/arm/aspeed_ast10x0.c
>> @@ -325,7 +325,7 @@ static void aspeed_soc_ast1030_realize(DeviceState
>> *dev_soc, Error **errp)
>>               return;
>>           }
>>           aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->wdt[i]), 0,
>> -                        sc->memmap[ASPEED_DEV_WDT] + i * awc->offset);
>> +                        sc->memmap[ASPEED_DEV_WDT] + i * awc->iosize);
> 
> 
> How does the specification say here (I didn't find it)?
> I read this is for a case where multiple WDTs are implemented.
> And offset means the distance io registers of WDT[1] are located from WDT[0].

The specs say 'offset'

> Or does the spec explicitly says the io registers of WDT[1] is located right after
> WDT[0] without any gaps in this case, iosize is better)?

The IO regions are contiguous but size/width is larger than the register set.

That said, the model takes some shortcuts and Phil's proposal is a sign that
we need to clarify and distinguish the number of regs, the region width and
the offset where it is mapped in the overall MMIO region of the SoC.


> 
>>       }
>>
>>       /* GPIO */
>> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c index
>> cd75465c2b..a79e05ddbd 100644
>> --- a/hw/arm/aspeed_ast2600.c
>> +++ b/hw/arm/aspeed_ast2600.c
>> @@ -472,7 +472,7 @@ static void aspeed_soc_ast2600_realize(DeviceState
>> *dev, Error **errp)
>>               return;
>>           }
>>           aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->wdt[i]), 0,
>> -                        sc->memmap[ASPEED_DEV_WDT] + i * awc->offset);
>> +                        sc->memmap[ASPEED_DEV_WDT] + i * awc->iosize);

May be, as a clarification, introduce :

   hwaddr wdt_offset = sc->memmap[ASPEED_DEV_WDT] + i * awc->iosize



>>       }
>>
>>       /* RAM */
>> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c index
>> b05b9dd416..2c0924d311 100644
>> --- a/hw/arm/aspeed_soc.c
>> +++ b/hw/arm/aspeed_soc.c
>> @@ -393,7 +393,7 @@ static void aspeed_soc_realize(DeviceState *dev,
>> Error **errp)
>>               return;
>>           }
>>           aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->wdt[i]), 0,
>> -                        sc->memmap[ASPEED_DEV_WDT] + i * awc->offset);
>> +                        sc->memmap[ASPEED_DEV_WDT] + i * awc->iosize);
>>       }
>>
>>       /* RAM  */
>> diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c index
>> d753693a2e..958725a1b5 100644
>> --- a/hw/watchdog/wdt_aspeed.c
>> +++ b/hw/watchdog/wdt_aspeed.c
>> @@ -309,7 +309,7 @@ static void aspeed_2400_wdt_class_init(ObjectClass
>> *klass, void *data)
>>       AspeedWDTClass *awc = ASPEED_WDT_CLASS(klass);
>>
>>       dc->desc = "ASPEED 2400 Watchdog Controller";
>> -    awc->offset = 0x20;
>> +    awc->iosize = 0x20;
>>       awc->ext_pulse_width_mask = 0xff;
>>       awc->reset_ctrl_reg = SCU_RESET_CONTROL1;
>>       awc->wdt_reload = aspeed_wdt_reload; @@ -346,7 +346,7 @@ static void
>> aspeed_2500_wdt_class_init(ObjectClass *klass, void *data)
>>       AspeedWDTClass *awc = ASPEED_WDT_CLASS(klass);
>>
>>       dc->desc = "ASPEED 2500 Watchdog Controller";
>> -    awc->offset = 0x20;
>> +    awc->iosize = 0x20;
>>       awc->ext_pulse_width_mask = 0xfffff;
>>       awc->reset_ctrl_reg = SCU_RESET_CONTROL1;
>>       awc->reset_pulse = aspeed_2500_wdt_reset_pulse; @@ -369,7 +369,7
>> @@ static void aspeed_2600_wdt_class_init(ObjectClass *klass, void *data)
>>       AspeedWDTClass *awc = ASPEED_WDT_CLASS(klass);
>>
>>       dc->desc = "ASPEED 2600 Watchdog Controller";
>> -    awc->offset = 0x40;
>> +    awc->iosize = 0x40;
>>       awc->ext_pulse_width_mask = 0xfffff; /* TODO */
>>       awc->reset_ctrl_reg = AST2600_SCU_RESET_CONTROL1;
>>       awc->reset_pulse = aspeed_2500_wdt_reset_pulse; @@ -392,7 +392,7
>> @@ static void aspeed_1030_wdt_class_init(ObjectClass *klass, void *data)
>>       AspeedWDTClass *awc = ASPEED_WDT_CLASS(klass);
>>
>>       dc->desc = "ASPEED 1030 Watchdog Controller";
>> -    awc->offset = 0x80;
>> +    awc->iosize = 0x80;
>>       awc->ext_pulse_width_mask = 0xfffff; /* TODO */
>>       awc->reset_ctrl_reg = AST2600_SCU_RESET_CONTROL1;
>>       awc->reset_pulse = aspeed_2500_wdt_reset_pulse; diff --git
>> a/include/hw/watchdog/wdt_aspeed.h
>> b/include/hw/watchdog/wdt_aspeed.h
>> index dfa5dfa424..db91ee6b51 100644
>> --- a/include/hw/watchdog/wdt_aspeed.h
>> +++ b/include/hw/watchdog/wdt_aspeed.h
>> @@ -40,7 +40,7 @@ struct AspeedWDTState {  struct AspeedWDTClass {
>>       SysBusDeviceClass parent_class;
>>
>> -    uint32_t offset;
>> +    uint32_t iosize;
>>       uint32_t ext_pulse_width_mask;
>>       uint32_t reset_ctrl_reg;
>>       void (*reset_pulse)(AspeedWDTState *s, uint32_t property);
>> --
>> 2.38.1
>>
> 

