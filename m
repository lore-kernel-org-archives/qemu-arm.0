Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp331080ejc;
        Wed, 18 Jan 2023 00:46:45 -0800 (PST)
X-Google-Smtp-Source: AMrXdXteYASuzQXc7Sb2YMSNXD2hLKPObXKOUlAafLtgN4fu7yWHNaB+wrtrpR8rxAtJ0v004pes
X-Received: by 2002:ac8:7ed7:0:b0:3b6:3260:fa1d with SMTP id x23-20020ac87ed7000000b003b63260fa1dmr8108462qtj.45.1674031605278;
        Wed, 18 Jan 2023 00:46:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674031605; cv=none;
        d=google.com; s=arc-20160816;
        b=nmQWdLTgfF+SoNbXyLwBS3vmy0KpAsWA8931/IoF+u73BoGPytZIAs7/LqbFCcZAbC
         XyYAYtH59jkXGmVQ/uDwyBlJtS7ouj2b5pi1HRSxLzNk68yXSdg56Cod98Z0YuGz26LX
         aiHLeQQjTZWlcVbX85hCMZpBOQ376YXxpNgy51KfvKcJ184vnXdWeh4liR/PrduHnsqt
         reuXHp1eLL/m37TcWaA8rf1yHBo+oBqrRCP1oIwJ4onPNBod2Pgaj3Jd8WD7Eaq1I+/q
         yt8yCeW9ii4PdogMeW5WZZ1ddQKdU5mNO1dSZhocec4LV2G5s2QQL9SCavehSd9CD85n
         qG4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:cc:to:from:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=Ys+8pTisCtqc1F7fq5EDvS45hiAWOMOuL059KRRij08=;
        b=xQoOsENi6wwWrtQlZbOQhAdPqfPf1UfEVJcATb6qAG5hNrOweyByIA/z9/3/k28ice
         jLbTWnqlsET6mYPlkefMGx9xrrNbFgIDG3/ZgXJbt8YseUozug3xKtQgq0vndb5gSRk8
         Yqw6URnN2NRTJINYK64rBpXBKlML0QkS6W5jWiAkDHB03JmxcHo3TN1/saWe/OJ1zcJ5
         C2WL2nb3bE5Vu+cQ0VmVmDM+mgYKcSx0Y7NEb+F5v84xqNp9Y/8wvkTjPkNvNBAJsZk/
         SR1gqfcQBQD0DrXZChFAug1o1vkpINjFFIuLf2WBDnDJeel/CePw44qNF/dgpeBF/lQn
         L/6w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 64-20020a370c43000000b00706a452c077si2091686qkm.151.2023.01.18.00.46.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Jan 2023 00:46:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI45X-0005l5-Oo; Wed, 18 Jan 2023 03:46:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pI45W-0005kf-IT
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 03:46:30 -0500
Received: from 3.mo552.mail-out.ovh.net ([178.33.254.192])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pI45U-0003CP-H2
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 03:46:30 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.6])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 1B3012E632;
 Wed, 18 Jan 2023 08:46:24 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Wed, 18 Jan
 2023 09:46:23 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003cb749571-80ff-45d1-89b3-be4a749c2394,
 B02C0E203F6A6AD140F658F33EDEBE178EEACDD3) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <6aeeb580-b74f-20f4-286c-ce66cd894742@kaod.org>
Date: Wed, 18 Jan 2023 09:46:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 01/11] hw/watchdog/wdt_aspeed: Rename MMIO region size
 as 'iosize'
Content-Language: en-US
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
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
 <55ccb3e8-330e-4dfb-7e9a-4177212dfbf3@kaod.org>
In-Reply-To: <55ccb3e8-330e-4dfb-7e9a-4177212dfbf3@kaod.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: de9f4949-c0ed-4551-b803-993f477904ef
X-Ovh-Tracer-Id: 12817244543311514439
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedruddtjedguddviecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuhffvvehfjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgeevgeduffefiefgvdetueekfeelteegkefgfedukeeuvdejudelfedtiefhtdffnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepvgguughivgdrughonhhgsehinhhtvghlrdgtohhmpdhpuggvlhesmhgvthgrrdgtohhmpdhpuggvlhesfhgsrdgtohhmpdhjrghmihhnpghlihhnsegrshhpvggvughtvggthhdrtghomhdpshhtvghvvghnpghlvggvsegrshhpvggvughtvggthhdrtghomhdpphgvthgvrhesphhjugdruggvvhdptghhihhnqdhtihhnghgpkhhuohesrghsphgvvgguthgvtghhrdgtohhmpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdgrnhgurhgvfiesrghjrdhiugdrrghupdhpvghtvg
 hrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpsghlvggrlhesrhgvughhrghtrdgtohhmpdhtrhhohigplhgvvgesrghsphgvvgguthgvtghhrdgtohhmpdhjohgvlhesjhhmshdrihgurdgruhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpphhhihhlmhgusehlihhnrghrohdrohhrghdpfigrihhnvghrshhmsehrvgguhhgrthdrtghomhdptghrohhsrgesrhgvughhrghtrdgtohhmpdfovfetjfhoshhtpehmohehhedvpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=178.33.254.192; envelope-from=clg@kaod.org;
 helo=3.mo552.mail-out.ovh.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.097,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: AMsISCs214Ug

Philippe,

On 1/2/23 13:30, Cédric Le Goater wrote:
> On 12/31/22 23:43, Dong, Eddie wrote:
>>>
>>> Avoid confusing two different things:
>>> - the WDT I/O region size ('iosize')
>>> - at which offset the SoC map the WDT ('offset') While it is often the same, we
>>> can map smaller region sizes at larger offsets.
>>>
>>> Here we are interested in the I/O region size, so rename as 'iosize'.
>>>
>>> Reviewed-by: Peter Delevoryas <peter@pjd.dev>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>   hw/arm/aspeed_ast10x0.c          | 2 +-
>>>   hw/arm/aspeed_ast2600.c          | 2 +-
>>>   hw/arm/aspeed_soc.c              | 2 +-
>>>   hw/watchdog/wdt_aspeed.c         | 8 ++++----
>>>   include/hw/watchdog/wdt_aspeed.h | 2 +-
>>>   5 files changed, 8 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c index
>>> 4d0b9b115f..122b3fd3f3 100644
>>> --- a/hw/arm/aspeed_ast10x0.c
>>> +++ b/hw/arm/aspeed_ast10x0.c
>>> @@ -325,7 +325,7 @@ static void aspeed_soc_ast1030_realize(DeviceState
>>> *dev_soc, Error **errp)
>>>               return;
>>>           }
>>>           aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->wdt[i]), 0,
>>> -                        sc->memmap[ASPEED_DEV_WDT] + i * awc->offset);
>>> +                        sc->memmap[ASPEED_DEV_WDT] + i * awc->iosize);
>>
>>
>> How does the specification say here (I didn't find it)?
>> I read this is for a case where multiple WDTs are implemented.
>> And offset means the distance io registers of WDT[1] are located from WDT[0].
> 
> The specs say 'offset'
> 
>> Or does the spec explicitly says the io registers of WDT[1] is located right after
>> WDT[0] without any gaps in this case, iosize is better)?
> 
> The IO regions are contiguous but size/width is larger than the register set.
> 
> That said, the model takes some shortcuts and Phil's proposal is a sign that
> we need to clarify and distinguish the number of regs, the region width and
> the offset where it is mapped in the overall MMIO region of the SoC.
> 
> 
>>
>>>       }
>>>
>>>       /* GPIO */
>>> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c index
>>> cd75465c2b..a79e05ddbd 100644
>>> --- a/hw/arm/aspeed_ast2600.c
>>> +++ b/hw/arm/aspeed_ast2600.c
>>> @@ -472,7 +472,7 @@ static void aspeed_soc_ast2600_realize(DeviceState
>>> *dev, Error **errp)
>>>               return;
>>>           }
>>>           aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->wdt[i]), 0,
>>> -                        sc->memmap[ASPEED_DEV_WDT] + i * awc->offset);
>>> +                        sc->memmap[ASPEED_DEV_WDT] + i * awc->iosize);
> 
> May be, as a clarification, introduce :
> 
>    hwaddr wdt_offset = sc->memmap[ASPEED_DEV_WDT] + i * awc->iosize

That would be nice to add since you are about to respin.

Thanks,

C.

> 
> 
> 
>>>       }
>>>
>>>       /* RAM */
>>> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c index
>>> b05b9dd416..2c0924d311 100644
>>> --- a/hw/arm/aspeed_soc.c
>>> +++ b/hw/arm/aspeed_soc.c
>>> @@ -393,7 +393,7 @@ static void aspeed_soc_realize(DeviceState *dev,
>>> Error **errp)
>>>               return;
>>>           }
>>>           aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->wdt[i]), 0,
>>> -                        sc->memmap[ASPEED_DEV_WDT] + i * awc->offset);
>>> +                        sc->memmap[ASPEED_DEV_WDT] + i * awc->iosize);
>>>       }
>>>
>>>       /* RAM  */
>>> diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c index
>>> d753693a2e..958725a1b5 100644
>>> --- a/hw/watchdog/wdt_aspeed.c
>>> +++ b/hw/watchdog/wdt_aspeed.c
>>> @@ -309,7 +309,7 @@ static void aspeed_2400_wdt_class_init(ObjectClass
>>> *klass, void *data)
>>>       AspeedWDTClass *awc = ASPEED_WDT_CLASS(klass);
>>>
>>>       dc->desc = "ASPEED 2400 Watchdog Controller";
>>> -    awc->offset = 0x20;
>>> +    awc->iosize = 0x20;
>>>       awc->ext_pulse_width_mask = 0xff;
>>>       awc->reset_ctrl_reg = SCU_RESET_CONTROL1;
>>>       awc->wdt_reload = aspeed_wdt_reload; @@ -346,7 +346,7 @@ static void
>>> aspeed_2500_wdt_class_init(ObjectClass *klass, void *data)
>>>       AspeedWDTClass *awc = ASPEED_WDT_CLASS(klass);
>>>
>>>       dc->desc = "ASPEED 2500 Watchdog Controller";
>>> -    awc->offset = 0x20;
>>> +    awc->iosize = 0x20;
>>>       awc->ext_pulse_width_mask = 0xfffff;
>>>       awc->reset_ctrl_reg = SCU_RESET_CONTROL1;
>>>       awc->reset_pulse = aspeed_2500_wdt_reset_pulse; @@ -369,7 +369,7
>>> @@ static void aspeed_2600_wdt_class_init(ObjectClass *klass, void *data)
>>>       AspeedWDTClass *awc = ASPEED_WDT_CLASS(klass);
>>>
>>>       dc->desc = "ASPEED 2600 Watchdog Controller";
>>> -    awc->offset = 0x40;
>>> +    awc->iosize = 0x40;
>>>       awc->ext_pulse_width_mask = 0xfffff; /* TODO */
>>>       awc->reset_ctrl_reg = AST2600_SCU_RESET_CONTROL1;
>>>       awc->reset_pulse = aspeed_2500_wdt_reset_pulse; @@ -392,7 +392,7
>>> @@ static void aspeed_1030_wdt_class_init(ObjectClass *klass, void *data)
>>>       AspeedWDTClass *awc = ASPEED_WDT_CLASS(klass);
>>>
>>>       dc->desc = "ASPEED 1030 Watchdog Controller";
>>> -    awc->offset = 0x80;
>>> +    awc->iosize = 0x80;
>>>       awc->ext_pulse_width_mask = 0xfffff; /* TODO */
>>>       awc->reset_ctrl_reg = AST2600_SCU_RESET_CONTROL1;
>>>       awc->reset_pulse = aspeed_2500_wdt_reset_pulse; diff --git
>>> a/include/hw/watchdog/wdt_aspeed.h
>>> b/include/hw/watchdog/wdt_aspeed.h
>>> index dfa5dfa424..db91ee6b51 100644
>>> --- a/include/hw/watchdog/wdt_aspeed.h
>>> +++ b/include/hw/watchdog/wdt_aspeed.h
>>> @@ -40,7 +40,7 @@ struct AspeedWDTState {  struct AspeedWDTClass {
>>>       SysBusDeviceClass parent_class;
>>>
>>> -    uint32_t offset;
>>> +    uint32_t iosize;
>>>       uint32_t ext_pulse_width_mask;
>>>       uint32_t reset_ctrl_reg;
>>>       void (*reset_pulse)(AspeedWDTState *s, uint32_t property);
>>> -- 
>>> 2.38.1
>>>
>>
> 

