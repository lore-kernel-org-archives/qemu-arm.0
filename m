Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5383036lfh;
        Thu, 2 Jun 2022 22:32:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydsRh5ouOPgnMVQf4RtNRlCPVBUiGDmLoB0yD3VCt9/IZNTfW+RsV2+664nMEZj9u41mk0
X-Received: by 2002:ad4:596e:0:b0:464:523a:123f with SMTP id eq14-20020ad4596e000000b00464523a123fmr5879976qvb.74.1654234342210;
        Thu, 02 Jun 2022 22:32:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654234342; cv=none;
        d=google.com; s=arc-20160816;
        b=IPRtCBtcR827532VkxvyPyqQFRneyHRBUFdGl++I7b3D7vnUJJzqPcZT7yprIUnMbd
         as4N15cgPBexCVbU1bffx6deg6gaUI0TUua57Q7QIc51WO3hi/L6gPgMYQm5AeStouja
         Fnq5t0MXwCr+UNzdQhuYUp+BENnY+OjRGR33kN98NGChn+ylNawMFKq/dH30SmX9dKqW
         8FlEq5YAzf0Smc8cTYbMV2Fzl+7vm1sP22MySwt/t5TIQP125HT/YJOP7oogHAimHQ1b
         btf73XCP06nBgBogf8LjqJMlH0yrrQMrpb097TsKqmoPTGk/nqZtaupQlKcpD09pP+I2
         7EBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=nMnqs7clfrcThneU2Ufq5g6vlcdfJLJl8pJGpe3o/bg=;
        b=uLX38jx4DfMawbWl6uJikiLbiM4sgKvlD5DMqMVphH+AxD9/WOG0j78/h9lcUaPBFT
         sXZby2u3BuSamgkNun0OdGHhQeEeC5jY6bQA4eJoAhdBKz0xN+m3fUPt/3ty6Ac7E9rH
         Kk+4NVbO0U249mNvrN6pueSG/sAzxU9t9rOz0qXiBaeR448Uo99qzlS9vX5LVxKiaArS
         pzzYPMJHQRG1ojcEFwUoXJ3k7VbYstyZ9qt+X3jBehCuNSAAdxiZrwI4JRzHZnB1tdst
         Taw2aPsMslLtr/a8F5H0LW8NaZrfUYBiKo3WsV1QzgMUwZSb1mCNql/6h9Im5Bynfw5S
         S3UA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iv12-20020ad45cec000000b00465d1649918si2890835qvb.524.2022.06.02.22.32.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 22:32:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwzv3-0000JT-ME
	for alex.bennee@linaro.org; Fri, 03 Jun 2022 01:32:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nwzuU-0000JA-SZ
 for qemu-arm@nongnu.org; Fri, 03 Jun 2022 01:31:48 -0400
Received: from 9.mo548.mail-out.ovh.net ([46.105.48.137]:59139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nwzuR-0005ob-QK
 for qemu-arm@nongnu.org; Fri, 03 Jun 2022 01:31:46 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.89])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 34840215E2;
 Fri,  3 Jun 2022 05:31:38 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 3 Jun 2022
 07:31:36 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S001fbaa5465-ede8-4225-949b-73219cec5dbe,
 2F375BC487B398842DD9155F09582B226C9A4747) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <0fb7b735-8f14-b570-9ed7-3abbdf654c61@kaod.org>
Date: Fri, 3 Jun 2022 07:31:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RFC PATCH v2 0/6] hw/i2c: i2c slave mode support
Content-Language: en-US
To: Klaus Jensen <its@irrelevant.dk>
CC: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>, <qemu-devel@nongnu.org>, Jonathan
 Cameron <Jonathan.Cameron@huawei.com>, <qemu-arm@nongnu.org>, Peter
 Delevoryas <pdel@fb.com>, Peter Maydell <peter.maydell@linaro.org>, Corey
 Minyard <cminyard@mvista.com>, Padmakar Kalghatgi <p.kalghatgi@samsung.com>,
 Damien Hedde <damien.hedde@greensocs.com>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, Arun Kumar Kashinath Agasar
 <arun.kka@samsung.com>, Klaus Jensen <k.jensen@samsung.com>, Zev Weiss
 <zev@bewilderbeest.net>
References: <20220601210831.67259-1-its@irrelevant.dk>
 <6e0eb197-25c2-6b1e-2c19-f93597e29cff@kaod.org> <YphzHGNYErSMEfPw@apples>
 <00e2d10a-20f5-8357-5b13-41791940ce19@kaod.org>
 <5683a737-8a15-20c5-5716-f5216d6c33c8@quicinc.com>
 <c796202d-2e57-32b3-3007-343d37dcdb84@kaod.org> <YpkNXUkafYQ3ZSpT@apples>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <YpkNXUkafYQ3ZSpT@apples>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: aed4b370-32e3-4a89-a597-debfb0cc7dc7
X-Ovh-Tracer-Id: 11293339017378106241
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrleehgdelhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnheptdehkeelieetvddtlefgveeuheduheetledvtdfgfeffledvjeekjeegledvkeeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopeiivghvsegsvgifihhluggvrhgsvggvshhtrdhnvghtpdfovfetjfhoshhtpehmohehgeek
Received-SPF: pass client-ip=46.105.48.137; envelope-from=clg@kaod.org;
 helo=9.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: Aht+dcloJpuK

On 6/2/22 21:19, Klaus Jensen wrote:
> On Jun  2 17:40, Cédric Le Goater wrote:
>> On 6/2/22 16:29, Jae Hyun Yoo wrote:
>>> Hi Klaus,
>>>
>>> On 6/2/2022 6:50 AM, Cédric Le Goater wrote:
>>>> On 6/2/22 10:21, Klaus Jensen wrote:
>>>>>
>>>>> There is an outstanding issue with the SLAVE_ADDR_RX_MATCH interrupt bit
>>>>> (bit 7). Remember from my first series I had a workaround to make sure
>>>>> it wasnt masked.
>>>>>
>>>>> I posted this upstream to linux
>>>>>
>>>>> https://lore.kernel.org/lkml/20220602054842.122271-1-its@irrelevant.dk/
>>>>>
>>>>> Not sure if that is the right way to fix it.
>>>>
>>>> That's weird. I would have thought it was already enabled [ Adding Jae ]
>>>
>>> Slave mode support in Aspeed I2C driver is already enabled and it has
>>> worked well so far. The fix Klaus made in the link is incorrect.
>>>
>>> https://lore.kernel.org/lkml/20220602054842.122271-1-its@irrelevant.dk/
>>>
>>> The patch is adding ASPEED_I2CD_INTR_SLAVE_MATCH as a mask bit for
>>> I2CD0C (Interrupt Control Register) but actually this bit is part of
>>> I2CD10 (Interrupt Status Register). Means that the slave match interrupt
>>> can be enabled without enabling any mask bit in I2CD0C.
>>
>> Thanks Jae.
>>
>> So we should enable this interrupt always independently of the
>> Interrupt Control Register value.
>>
>> I would simply extend the mask value (bus->regs[intr_ctrl_reg])
>> with the SLAVE_ADDR_RX_MATCH bit when interrupts are raised in
>> aspeed_i2c_bus_raise_interrupt().
>>
> 
> Alright, so my "workaround" from v1 was actually the right fix - I'll
> re-add it ;)

yes :) but now we know why ! May be add a ALWAYS_ENABLE mask ?

Thanks,

C.

