Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp662788lfg;
        Sun, 24 Jul 2022 23:34:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vT4jX8HMzjYftzZ+PZln/mPc+zfnjV6PhmugLhvp3wCQlyjt/M4M45ORRhHoGgIWe5XUAq
X-Received: by 2002:a05:620a:c4e:b0:6b2:8e49:6b3d with SMTP id u14-20020a05620a0c4e00b006b28e496b3dmr8162484qki.67.1658730877806;
        Sun, 24 Jul 2022 23:34:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658730877; cv=none;
        d=google.com; s=arc-20160816;
        b=axpVBRlh4fkJPE2XajJaLF4flH1fJiHTTfg2OLpcNiS9aTC8rxKiTSZgkeDd35xq5x
         89a3MHmWwyiKZckF0CVwj1uHEyrQYUsEa+FfAIC9+QEEn/Eeb14rtxsV+nufFJrQ+Pxm
         N9AFYwgXqik4SYvGyT/b+hR/rMgAByNST0pTi4vszOiPdPM5P9FKblX6yzrOwbo4R9Rn
         EKNo/fnzq8dnPDL7KPA6V4NElfl0ZmHXgQLSbkeVicdht+5qZl7mAW7T8V5i6viPue0d
         w2w7RDg8KRliDo0nP3suKGd3+llse7cP6kTfP+OvY4syuzIFFQAd3kV+vdgIZQKIthUV
         bzEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=YV2Ei/WBHD+UDq3xgGd9fFf5s2SnsbhGGzOqvJgzPso=;
        b=D4/pTCNd7bQkgzfs0ceXsmfM996HAVHRuI1f7OiOBSpfpoQENx2kSniho/c1AI9UbP
         QtB37m9AP+DhFEdMFhtRzgOpnTyO+1tBUO9eps8kPGAGNA+t34AAvgN/fqMgzbtyv6XI
         48K9pMf2UOHt0+SU9t3YOb4wo5QNJB/PLsIl0FeFtlycDZpJbQ3xTOnQ51qT83x/T/jP
         fn811IxY4cjHsVtmIp6TSzaOeRfDvE9DyEd8q6ZK/wi3LIg8d6dv/y8P4+6YM6sKuZKx
         FBE/oyEkAGvGIJN+tRtKov4/rOKKTe+0GKKg9EW61UyyzfWjdcliPNXjTIYO9MlrFl7/
         n6jA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x28-20020a05620a0b5c00b006b5768c51bcsi7302805qkg.225.2022.07.24.23.34.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 24 Jul 2022 23:34:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oFrfp-0006Y5-3i
	for alex.bennee@linaro.org; Mon, 25 Jul 2022 02:34:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oFreE-0005rV-2t
 for qemu-arm@nongnu.org; Mon, 25 Jul 2022 02:33:04 -0400
Received: from 10.mo552.mail-out.ovh.net ([87.98.187.244]:37177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oFre7-0002Ae-VK
 for qemu-arm@nongnu.org; Mon, 25 Jul 2022 02:32:55 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.137])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 6BCF422803;
 Mon, 25 Jul 2022 06:32:21 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Mon, 25 Jul
 2022 08:32:19 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S0016870ca9c-2298-4e02-825e-780df94e8c99,
 D832AE00456E0C65F35A6D2849B778492C3B7DB7) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <257967d9-fd97-41ed-e5a1-23e4a89dba57@kaod.org>
Date: Mon, 25 Jul 2022 08:32:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 8/8] arm/aspeed: Replace mx25l25635e chip model
Content-Language: en-US
To: Andrew Jeffery <andrew@aj.id.au>, Cameron Esfahani via
 <qemu-devel@nongnu.org>
CC: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9_via?= <qemu-arm@nongnu.org>,
 <qemu-block@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, Joel
 Stanley <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>,
 Francisco Iglesias <frasse.iglesias@gmail.com>, Iris Chen
 <irischenlj@fb.com>, Michael Walle <michael@walle.cc>
References: <20220722063602.128144-1-clg@kaod.org>
 <20220722063602.128144-9-clg@kaod.org>
 <e98735a4-19ae-4628-bacb-549511821c41@www.fastmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <e98735a4-19ae-4628-bacb-549511821c41@www.fastmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 70187cc3-2f05-4ab5-8586-da4583dc029e
X-Ovh-Tracer-Id: 4103905162150316978
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvddtjedgudduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeeggffggfehjefgudefieeuffevheetjefgleeukefggeetgfffjeehtdfgjefgnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehmihgthhgrvghlseifrghllhgvrdgttgdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=87.98.187.244; envelope-from=clg@kaod.org;
 helo=10.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2DYDH5aSg0QC

On 7/25/22 04:08, Andrew Jeffery wrote:
> 
> 
> On Fri, 22 Jul 2022, at 16:06, Cédric Le Goater wrote:
>> A mx25l25635f chip model is generally found on these machines. It's
>> newer and uses 4B opcodes which is better to exercise the support in
>> the Linux kernel.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   hw/arm/aspeed.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>> index 1c611284819d..7e95abc55b09 100644
>> --- a/hw/arm/aspeed.c
>> +++ b/hw/arm/aspeed.c
>> @@ -1157,7 +1157,7 @@ static void
>> aspeed_machine_palmetto_class_init(ObjectClass *oc, void *data)
>>       amc->soc_name  = "ast2400-a1";
>>       amc->hw_strap1 = PALMETTO_BMC_HW_STRAP1;
>>       amc->fmc_model = "n25q256a";
>> -    amc->spi_model = "mx25l25635e";
>> +    amc->spi_model = "mx25l25635f";
> 
> Hmm, dmesg reported mx25l25635e on the palmetto I checked
> 
>>       amc->num_cs    = 1;
>>       amc->i2c_init  = palmetto_bmc_i2c_init;
>>       mc->default_ram_size       = 256 * MiB;
>> @@ -1208,7 +1208,7 @@ static void
>> aspeed_machine_ast2500_evb_class_init(ObjectClass *oc, void *data)
>>       amc->soc_name  = "ast2500-a1";
>>       amc->hw_strap1 = AST2500_EVB_HW_STRAP1;
>>       amc->fmc_model = "mx25l25635e";
>> -    amc->spi_model = "mx25l25635e";
>> +    amc->spi_model = "mx25l25635f";
>>       amc->num_cs    = 1;
>>       amc->i2c_init  = ast2500_evb_i2c_init;
>>       mc->default_ram_size       = 512 * MiB;
>> @@ -1258,7 +1258,7 @@ static void
>> aspeed_machine_witherspoon_class_init(ObjectClass *oc, void *data)
>>       mc->desc       = "OpenPOWER Witherspoon BMC (ARM1176)";
>>       amc->soc_name  = "ast2500-a1";
>>       amc->hw_strap1 = WITHERSPOON_BMC_HW_STRAP1;
>> -    amc->fmc_model = "mx25l25635e";
>> +    amc->fmc_model = "mx25l25635f";
> 
> The witherspoon I checked also reported mx25l25635e in dmesg for the
> FMC.
> 
> You do say "generally" in the commit message though.

You can not tell from dmesg.

The MX25L25635F and MX25L25635E models share the same JEDEC ID and
the spi-nor flash device table only contains a mx25l25635e entry.
The MX25L25635F is detected in mx25l25635_post_bfpt_fixups using SFDP.

That's why I added this warning  :

   https://github.com/legoater/linux/commit/934f0708ac597022cbf6c8d6f2ce91d55025e943


C.

> 
> Andrew

