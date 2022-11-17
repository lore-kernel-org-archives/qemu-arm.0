Received: by 2002:a05:7022:459c:b0:46:f5cc:2c85 with SMTP id cf28csp772352dlb;
        Wed, 16 Nov 2022 22:56:39 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7Evl3LdJvtswDwtoQg3jLQvKKydkC7fj0RUdn9rgz0p9db/ndEjrSvzZOdEBd7c4b5Im0Y
X-Received: by 2002:a05:620a:1599:b0:6fa:3b1b:9c82 with SMTP id d25-20020a05620a159900b006fa3b1b9c82mr598189qkk.704.1668668199827;
        Wed, 16 Nov 2022 22:56:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668668199; cv=none;
        d=google.com; s=arc-20160816;
        b=PObQTNGN8SQZ4cBykjC4L7ZrCPuHU/fpO4RDKGx7OKkP544oDVOkKDiRvjSAztLpvh
         q8tdqKIlWF7JBk4le+UGNOvA9IWVSBw71BZso9uMTIXpW/oCfR4dGrLS5tt7ullIEDiQ
         k6AgGZTKnYkCFMIEt8VW460yX907FIKMzTEWTAgKGde7Ymq1YoHovjKR8XiTq5iKnwaP
         b19E4KK7NwNQWdASqxpCWkuPC0jQLdifM/rmcBBqZdBxLTnAkiwblcB2zKCich7NWoQM
         +YaJR/MsYDfN1WCSE1uemJEU4NuwXKif8eeeTTASONVP/O0ZUcOz5eMiE4s9Q/lXGcgS
         fmJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=h/+9ixUzn6GuukrIWEGCsdj1JdsrpFivDIdComZHpAo=;
        b=tDISCieOeyYg8wVFQ0N8J2m6/FNdnFMoTwcrvhqo/fUWj9ArrrXyCCMrZqII8MQzlE
         MJFTUVqASXC9HWakjfdz7yPQ8O+YCuTkIdXuWbCEyw1Ij9ZraR7EYO1j6MnVSjFYcnMz
         7x8ZL/snlPlVnFkcc1/byDqL0wn39F36cwzkc4YiAdOrX8spJmZqAgIH0CpsuIU9rx8M
         Bw6F3ZvOxqfrQLZfmE45Dj5UjSbZrVPu5wFT+uYuKBoa+u9mxaSTwMY7CotgnLJfJsmh
         bB3+hPKxVYJ7fbl5vEop3t6BNBY1o0ZhzCeyFk94wMRTjDukDDMTR8I42r8DY8S9jV3W
         R+WA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f4-20020a05622a1a0400b003a4f242dc2asi11446886qtb.362.2022.11.16.22.56.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Nov 2022 22:56:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ovYp0-0001RS-S3; Thu, 17 Nov 2022 01:56:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ovYox-0001R4-8I
 for qemu-arm@nongnu.org; Thu, 17 Nov 2022 01:56:23 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ovYou-00087E-Mu
 for qemu-arm@nongnu.org; Thu, 17 Nov 2022 01:56:23 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.216])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 35C9113FC88E5;
 Thu, 17 Nov 2022 07:56:14 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Thu, 17 Nov
 2022 07:56:11 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005e4ea5eb1-7e02-4635-96d8-8f15bbaf77e8,
 AE5717285A2AC47C671D2CB192D1CF6730B7D7F3) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <6bfe7b2e-2e4f-c286-530a-b0342f9107a0@kaod.org>
Date: Thu, 17 Nov 2022 07:56:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH maybe-7.2 1/3] hw/i2c: only schedule pending master when
 bus is idle
Content-Language: en-US
To: Klaus Jensen <its@irrelevant.dk>
CC: <qemu-devel@nongnu.org>, Andrew Jeffery <andrew@aj.id.au>, Keith Busch
 <kbusch@kernel.org>, Corey Minyard <cminyard@mvista.com>, Peter Delevoryas
 <peter@pjd.dev>, <qemu-arm@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>, <qemu-block@nongnu.org>, Jeremy Kerr
 <jk@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, Klaus Jensen
 <k.jensen@samsung.com>
References: <20221116084312.35808-1-its@irrelevant.dk>
 <20221116084312.35808-2-its@irrelevant.dk>
 <8dd9ed34-93c3-0638-e152-f619f9e097e6@kaod.org>
 <Y3XXcWUnntBrIXq+@cormorant.local>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <Y3XXcWUnntBrIXq+@cormorant.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: e24ac3a2-0f0f-44dc-b818-24372699c8c9
X-Ovh-Tracer-Id: 15784553746249649144
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrgeejgddutdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepihhtshesihhrrhgvlhgvvhgrnhhtrdgukhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdprghnughrvgifsegrjhdrihgurdgruhdpkhgsuhhstghhsehkvghrnhgvlhdrohhrghdptghmihhnhigrrhgusehmvhhishhtrgdrtghomhdpphgvthgvrhesphhjugdruggvvhdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdhqvghmuhdqsghlohgtkhesnhhonhhgnhhurdhorhhgpdhjkhestghoug
 gvtghonhhsthhruhgtthdrtghomhdrrghupdhjohgvlhesjhhmshdrihgurdgruhdpkhdrjhgvnhhsvghnsehsrghmshhunhhgrdgtohhmpdfovfetjfhoshhtpehmohehvdelpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: TLVYDCZU+5U1

On 11/17/22 07:40, Klaus Jensen wrote:
> On Nov 16 16:58, Cédric Le Goater wrote:
>> On 11/16/22 09:43, Klaus Jensen wrote:
>>> From: Klaus Jensen <k.jensen@samsung.com>
>>>
>>> It is not given that the current master will release the bus after a
>>> transfer ends. Only schedule a pending master if the bus is idle.
>>>
>>> Fixes: 37fa5ca42623 ("hw/i2c: support multiple masters")
>>> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>>> ---
>>>    hw/i2c/aspeed_i2c.c  |  2 ++
>>>    hw/i2c/core.c        | 37 ++++++++++++++++++++++---------------
>>>    include/hw/i2c/i2c.h |  2 ++
>>>    3 files changed, 26 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
>>> index c166fd20fa11..1f071a3811f7 100644
>>> --- a/hw/i2c/aspeed_i2c.c
>>> +++ b/hw/i2c/aspeed_i2c.c
>>> @@ -550,6 +550,8 @@ static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus *bus, uint64_t value)
>>>            }
>>>            SHARED_ARRAY_FIELD_DP32(bus->regs, reg_cmd, M_STOP_CMD, 0);
>>>            aspeed_i2c_set_state(bus, I2CD_IDLE);
>>> +
>>> +        i2c_schedule_pending_master(bus->bus);
>>
>> Shouldn't it be i2c_bus_release() ?
>>
> 
> The reason for having both i2c_bus_release() and
> i2c_schedule_pending_master() is that i2c_bus_release() sort of pairs
> with i2c_bus_master(). They either set or clear the bus->bh member.
> 
> In the current design, the controller (in this case the Aspeed I2C) is
> an "implicit" master (it does not have a bottom half driving it), so
> there is no bus->bh to clear.
>
> I should (and will) write some documentation on the asynchronous API.

I found the routine names confusing. Thanks for the clarification.

Maybe we could do this rename  :

   i2c_bus_release()             -> i2c_bus_release_and_clear()
   i2c_schedule_pending_master() -> i2c_bus_release()

and keep i2c_schedule_pending_master() internal the I2C core subsystem.

C.

