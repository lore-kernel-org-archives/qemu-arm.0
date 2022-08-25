Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp88459ejh;
        Thu, 25 Aug 2022 02:14:40 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4m2vlx76pGbV4fb3XrGG4M+aLVVthXX4ItBOlsT/KP1M79s97uPZsevM+JCpp497NF1FAD
X-Received: by 2002:ac8:59c6:0:b0:344:6f73:da07 with SMTP id f6-20020ac859c6000000b003446f73da07mr2666430qtf.199.1661418880082;
        Thu, 25 Aug 2022 02:14:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661418880; cv=none;
        d=google.com; s=arc-20160816;
        b=WdhQLAaB46KrkUi7JpD3mK1cnFY0v5lRh3X4EtMVeqvwsKTlKgZM1RdWIG2h/FRCEe
         0E9hnJtGGCjKdnmAk2DQJ/yXAUyP868H3jwUlJtLyQ+5vZs/41b3HF9EmMGr4sAmeqwQ
         G2OaZXwQz6dHYb8UVFdiSMVj/ARy62KcBuMLtvAountHkRi6JQoCRqq3Yd5RA3yGXIVx
         Qi1TlekUuqdhkXtbGAAQyjJTH+CyukVQwtoav3skrZcbba/AyWf2x+8a/QhHToaNt92b
         F6GiXBY3utppqCcaiKD8aQ4sfkOGwGETeDRpfumTXA13qjBJSWVp937GkpVmjEtgY6YC
         LV0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=FEoh7NpJCjXqhFqUrs3WOs0yrCXGa9lZjVF40WCq/NI=;
        b=tdO2CXKEVdVZjuqY3sE0JqtD0iuNoAQp4+TTo56chGO3qIoJqTG6UKwH1uRfR3Cc28
         m1F/rUN43kLhg2XktvRlevWIsIcI2+zyeYrygRLzMEwg+GYo31E66AChYGXHsCWzaiJv
         Bm8/pUOQJ/9s5xKPUeNcXsupXayVGwB8pHdHVCgbW+5w9knWB2AibdMxmZ/1fm45Bji0
         wgaakOz28rujhWjpQGE9gdTTczUsOtSeJYHoq52NgUn9nujuLBxyYE3wVDo4O/t3UGc7
         UCdyiLmPMgJwO1SLaKzTl/KhIPYpA7pEfgEL3sq+wfd5IPg9qBdGtK5rfTPTOrPXhIOu
         2BEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m19-20020a05620a24d300b006bb60ea8085si11609519qkn.523.2022.08.25.02.14.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Aug 2022 02:14:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oR8wh-0006VI-Hr
	for alex.bennee@linaro.org; Thu, 25 Aug 2022 05:14:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oR8lO-0006t7-QM
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 05:02:58 -0400
Received: from 1.mo548.mail-out.ovh.net ([178.32.121.110]:47459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oR8lJ-0004BE-GA
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 05:02:56 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.51])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 6DE6B207B4;
 Thu, 25 Aug 2022 09:02:49 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 25 Aug
 2022 11:02:47 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R0065dec3e1b-485a-49ff-87ab-a9c1f1e3d105,
 E113D39BE2F2F3A68AEA684F43C085D526993BDB) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 83.205.98.5
Message-ID: <0d5a24a2-ac4a-c055-98fe-d758c83c4a3c@kaod.org>
Date: Thu, 25 Aug 2022 11:02:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/1] hw/i2c/aspeed: Fix old reg slave receive
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
CC: Klaus Jensen <its@irrelevant.dk>, <patrick@stwcx.xyz>,
 <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <dz4list@gmail.com>
References: <20220820225712.713209-1-peter@pjd.dev>
 <20220820225712.713209-2-peter@pjd.dev> <YwScq4fD+gBIN+3Q@apples>
 <YwUOGUfJTPtE4AzH@pdel-fedora-MJ0HJWH9>
 <65ea4c92-9dc3-bed2-c287-d4d7a4a45e3b@kaod.org>
 <YwctGh2jfdCSHzlB@pdel-fedora-MJ0HJWH9>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <YwctGh2jfdCSHzlB@pdel-fedora-MJ0HJWH9>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 150a305a-b81b-4d72-abac-7eef1783ece6
X-Ovh-Tracer-Id: 4231413328717646639
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejfedguddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekjeevfefhfeehkeegleehkeejtdeikefhffegjefhvdekgfduveehffdttefhgeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhtlhgrsgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopeguiieglhhishhtsehgmhgrihhlrdgtohhmpdfovfetjfhoshhtpehmohehgeek
Received-SPF: pass client-ip=178.32.121.110; envelope-from=clg@kaod.org;
 helo=1.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ajannjGh4h0v

On 8/25/22 10:04, Peter Delevoryas wrote:
> On Wed, Aug 24, 2022 at 04:31:50PM +0200, Cédric Le Goater wrote:
>> On 8/23/22 19:27, Peter Delevoryas wrote:
>>> On Tue, Aug 23, 2022 at 11:23:55AM +0200, Klaus Jensen wrote:
>>>> On Aug 20 15:57, Peter Delevoryas wrote:
>>>>> I think when Klaus ported his slave mode changes from the original patch
>>>>> series to the rewritten I2C module, he changed the behavior of the first
>>>>> byte that is received by the slave device.
>>>>>
>>>>> What's supposed to happen is that the AspeedI2CBus's slave device's
>>>>> i2c_event callback should run, and if the event is "send_async", then it
>>>>> should populate the byte buffer with the 8-bit I2C address that is being
>>>>> sent to. Since we only support "send_async", the lowest bit should
>>>>> always be 0 (indicating that the master is requesting to send data).
>>>>>
>>>>> This is the code Klaus had previously, for reference. [1]
>>>>>
>>>>>       switch (event) {
>>>>>       case I2C_START_SEND:
>>>>>           bus->buf = bus->dev_addr << 1;
>>>>>
>>>>>           bus->buf &= I2CD_BYTE_BUF_RX_MASK;
>>>>>           bus->buf <<= I2CD_BYTE_BUF_RX_SHIFT;
>>>>>
>>>>>           bus->intr_status |= (I2CD_INTR_SLAVE_ADDR_RX_MATCH | I2CD_INTR_RX_DONE);
>>>>>           aspeed_i2c_set_state(bus, I2CD_STXD);
>>>>>
>>>>>           break;
>>>>>
>>>>> [1]: https://lore.kernel.org/qemu-devel/20220331165737.1073520-4-its@irrelevant.dk/
>>>>>
>>>>> Signed-off-by: Peter Delevoryas <peter@pjd.dev>
>>>>> Fixes: a8d48f59cd021b25 ("hw/i2c/aspeed: add slave device in old register mode")
>>>>> ---
>>>>>    hw/i2c/aspeed_i2c.c         | 8 +++++---
>>>>>    include/hw/i2c/aspeed_i2c.h | 1 +
>>>>>    2 files changed, 6 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
>>>>> index 42c6d69b82..c166fd20fa 100644
>>>>> --- a/hw/i2c/aspeed_i2c.c
>>>>> +++ b/hw/i2c/aspeed_i2c.c
>>>>> @@ -1131,7 +1131,9 @@ static int aspeed_i2c_bus_slave_event(I2CSlave *slave, enum i2c_event event)
>>>>>        AspeedI2CBus *bus = ASPEED_I2C_BUS(qbus->parent);
>>>>>        uint32_t reg_intr_sts = aspeed_i2c_bus_intr_sts_offset(bus);
>>>>>        uint32_t reg_byte_buf = aspeed_i2c_bus_byte_buf_offset(bus);
>>>>> -    uint32_t value;
>>>>> +    uint32_t reg_dev_addr = aspeed_i2c_bus_dev_addr_offset(bus);
>>>>> +    uint32_t dev_addr = SHARED_ARRAY_FIELD_EX32(bus->regs, reg_dev_addr,
>>>>> +                                                SLAVE_DEV_ADDR1);
>>>>>        if (aspeed_i2c_is_new_mode(bus->controller)) {
>>>>>            return aspeed_i2c_bus_new_slave_event(bus, event);
>>>>> @@ -1139,8 +1141,8 @@ static int aspeed_i2c_bus_slave_event(I2CSlave *slave, enum i2c_event event)
>>>>>        switch (event) {
>>>>>        case I2C_START_SEND_ASYNC:
>>>>> -        value = SHARED_ARRAY_FIELD_EX32(bus->regs, reg_byte_buf, TX_BUF);
>>>>> -        SHARED_ARRAY_FIELD_DP32(bus->regs, reg_byte_buf, RX_BUF, value << 1);
>>>>> +        /* Bit[0] == 0 indicates "send". */
>>>>> +        SHARED_ARRAY_FIELD_DP32(bus->regs, reg_byte_buf, RX_BUF, dev_addr << 1);
>>>>>            ARRAY_FIELD_DP32(bus->regs, I2CD_INTR_STS, SLAVE_ADDR_RX_MATCH, 1);
>>>>>            SHARED_ARRAY_FIELD_DP32(bus->regs, reg_intr_sts, RX_DONE, 1);
>>>>> diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
>>>>> index 300a89b343..adc904d6c1 100644
>>>>> --- a/include/hw/i2c/aspeed_i2c.h
>>>>> +++ b/include/hw/i2c/aspeed_i2c.h
>>>>> @@ -130,6 +130,7 @@ REG32(I2CD_CMD, 0x14) /* I2CD Command/Status */
>>>>>        SHARED_FIELD(M_TX_CMD, 1, 1)
>>>>>        SHARED_FIELD(M_START_CMD, 0, 1)
>>>>>    REG32(I2CD_DEV_ADDR, 0x18) /* Slave Device Address */
>>>>> +    SHARED_FIELD(SLAVE_DEV_ADDR1, 0, 7)
>>>>>    REG32(I2CD_POOL_CTRL, 0x1C) /* Pool Buffer Control */
>>>>>        SHARED_FIELD(RX_COUNT, 24, 5)
>>>>>        SHARED_FIELD(RX_SIZE, 16, 5)
>>>>> -- 
>>>>> 2.37.1
>>>>>
>>>>
>>>> Nice catch Peter! I'm not sure how I messed that up like that.
>>>>
>>>> Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
>>>
>>> Thanks Klaus. Just realized I forgot to cc you on this, sorry about
>>> that.
>>
>> Do we still have time for 7.1 ?
> 
> Is this question for me, or for Peter Maydell or someone else working on the
> release? I think they might still be accepting some patches, or deciding if rc4
> is necessary: I've created this issue to bring awareness to this, since that
> seems like the right way to track this for the release.
> 
> https://gitlab.com/qemu-project/qemu/-/issues/1174

Thanks,

> I don't have any special need for 7.1, since our team branches off of master and
> regularly pulls in updates.

I think it is worth fixing it for 7.1 since we just introduced slave mode
in this release. Hence the late PR. I would have preferred doing it sooner
but I am out of office and this increases latency.

C.

