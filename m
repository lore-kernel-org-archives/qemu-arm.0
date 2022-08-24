Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp2173319ejc;
        Wed, 24 Aug 2022 07:32:49 -0700 (PDT)
X-Google-Smtp-Source: AA6agR63PgEgszK/bqGPbWXpolsm64KijbfbnnrV1ZuuNmIqWibiFMVh3vjhqGkKI0hh8JB8KY+E
X-Received: by 2002:ac8:5a0f:0:b0:344:63fa:1933 with SMTP id n15-20020ac85a0f000000b0034463fa1933mr23753908qta.431.1661351568945;
        Wed, 24 Aug 2022 07:32:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661351568; cv=none;
        d=google.com; s=arc-20160816;
        b=qCHmI3SENBDWjX/ELrOXvfq4UAsSo+XWiVOmlMrz5SNLO66WTkFHiPIFyiZmFn7DeE
         Vitl0Y41HX6aihQxRMjojVvwV/8Fp1Y6OQTm1Bu932cJRQJTbOUVqqGCSHeehMFfNMUX
         sC/c15BuYF0VGw+xo4AcpEUYDzA+ANCnl+54nbsDajukYxdL3Zr3O7xrNaZyL+oM7yWF
         wY5itJFPYEeDK/QdoncR5rZHIvO5QSR9P797UGLtK+E6mlClWL+6xMxPpxfjxQOQ4aJw
         xz5SmzmeReUC1CH3i+DAMRwYUPLPJc0bmeUS3xWNjw4/aI90/rJjHOgTDK+9QJoioKGv
         oG+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=d9spXcXVcnj/qWxZ8oKURxVaxw0STxQ4B5QMnpk/X9A=;
        b=rl/qvdjWoEts81TzsxHlle+ypIAOBmMHHF6SNnk0nbdwZJXyPyMLg+Pi+t/z44UPb/
         dMFdMhaPbQouevMXd9/xT9Pjt/ycEvb5qIO+C2dCAQrdVuGabVJp+jHTDFt8mEh4mYMI
         cHHqLSrA5YVYIGtFeKTJScEiVMjrjdj69yM3RvWAVxG20O80dpONAbNfV9IMo++6JAI7
         ZiSh0QIbmXCSW4sp0kXGmCkOEgs2W/I0qx8WA50q7Y5fchy8OpGORALSLt6+w0PwXSSp
         FV/dLHTcZW0JDw4s66Kadr5Dbymx+0a6lCLXAocwq3t8wnXF6+c31X5NjoRBE96vifwr
         +S0w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x18-20020a05620a0ed200b006bb822d2c6dsi7150623qkm.72.2022.08.24.07.32.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Aug 2022 07:32:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQrR2-00082J-ES
	for alex.bennee@linaro.org; Wed, 24 Aug 2022 10:32:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oQrQS-00080N-3x
 for qemu-arm@nongnu.org; Wed, 24 Aug 2022 10:32:12 -0400
Received: from 5.mo548.mail-out.ovh.net ([188.165.49.213]:45445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oQrQP-0005XL-Nl
 for qemu-arm@nongnu.org; Wed, 24 Aug 2022 10:32:11 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.19])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 786A421FCE;
 Wed, 24 Aug 2022 14:31:57 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 24 Aug
 2022 16:31:56 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0041501cd1d-ac5b-467f-8632-1f94d6d7916a,
 54EE2556EDEEBF270875BAAC0107257449009F33) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 83.205.98.5
Message-ID: <65ea4c92-9dc3-bed2-c287-d4d7a4a45e3b@kaod.org>
Date: Wed, 24 Aug 2022 16:31:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/1] hw/i2c/aspeed: Fix old reg slave receive
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>, Klaus Jensen <its@irrelevant.dk>
CC: <patrick@stwcx.xyz>, <peter.maydell@linaro.org>, <andrew@aj.id.au>,
 <joel@jms.id.au>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>,
 <dz4list@gmail.com>
References: <20220820225712.713209-1-peter@pjd.dev>
 <20220820225712.713209-2-peter@pjd.dev> <YwScq4fD+gBIN+3Q@apples>
 <YwUOGUfJTPtE4AzH@pdel-fedora-MJ0HJWH9>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <YwUOGUfJTPtE4AzH@pdel-fedora-MJ0HJWH9>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 078e8062-98c0-4e50-a34a-a02c5dd264cd
X-Ovh-Tracer-Id: 3917287254873246511
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejuddgjeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeevhfelueevgfejjeetveetffevieeghfevgfduteeuuedvleeifffhieekleekheenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepugiigehlihhsthesghhmrghilhdrtghomhdpoffvtefjohhsthepmhhoheegke
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 0PV8mXOti8pG

On 8/23/22 19:27, Peter Delevoryas wrote:
> On Tue, Aug 23, 2022 at 11:23:55AM +0200, Klaus Jensen wrote:
>> On Aug 20 15:57, Peter Delevoryas wrote:
>>> I think when Klaus ported his slave mode changes from the original patch
>>> series to the rewritten I2C module, he changed the behavior of the first
>>> byte that is received by the slave device.
>>>
>>> What's supposed to happen is that the AspeedI2CBus's slave device's
>>> i2c_event callback should run, and if the event is "send_async", then it
>>> should populate the byte buffer with the 8-bit I2C address that is being
>>> sent to. Since we only support "send_async", the lowest bit should
>>> always be 0 (indicating that the master is requesting to send data).
>>>
>>> This is the code Klaus had previously, for reference. [1]
>>>
>>>      switch (event) {
>>>      case I2C_START_SEND:
>>>          bus->buf = bus->dev_addr << 1;
>>>
>>>          bus->buf &= I2CD_BYTE_BUF_RX_MASK;
>>>          bus->buf <<= I2CD_BYTE_BUF_RX_SHIFT;
>>>
>>>          bus->intr_status |= (I2CD_INTR_SLAVE_ADDR_RX_MATCH | I2CD_INTR_RX_DONE);
>>>          aspeed_i2c_set_state(bus, I2CD_STXD);
>>>
>>>          break;
>>>
>>> [1]: https://lore.kernel.org/qemu-devel/20220331165737.1073520-4-its@irrelevant.dk/
>>>
>>> Signed-off-by: Peter Delevoryas <peter@pjd.dev>
>>> Fixes: a8d48f59cd021b25 ("hw/i2c/aspeed: add slave device in old register mode")
>>> ---
>>>   hw/i2c/aspeed_i2c.c         | 8 +++++---
>>>   include/hw/i2c/aspeed_i2c.h | 1 +
>>>   2 files changed, 6 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
>>> index 42c6d69b82..c166fd20fa 100644
>>> --- a/hw/i2c/aspeed_i2c.c
>>> +++ b/hw/i2c/aspeed_i2c.c
>>> @@ -1131,7 +1131,9 @@ static int aspeed_i2c_bus_slave_event(I2CSlave *slave, enum i2c_event event)
>>>       AspeedI2CBus *bus = ASPEED_I2C_BUS(qbus->parent);
>>>       uint32_t reg_intr_sts = aspeed_i2c_bus_intr_sts_offset(bus);
>>>       uint32_t reg_byte_buf = aspeed_i2c_bus_byte_buf_offset(bus);
>>> -    uint32_t value;
>>> +    uint32_t reg_dev_addr = aspeed_i2c_bus_dev_addr_offset(bus);
>>> +    uint32_t dev_addr = SHARED_ARRAY_FIELD_EX32(bus->regs, reg_dev_addr,
>>> +                                                SLAVE_DEV_ADDR1);
>>>   
>>>       if (aspeed_i2c_is_new_mode(bus->controller)) {
>>>           return aspeed_i2c_bus_new_slave_event(bus, event);
>>> @@ -1139,8 +1141,8 @@ static int aspeed_i2c_bus_slave_event(I2CSlave *slave, enum i2c_event event)
>>>   
>>>       switch (event) {
>>>       case I2C_START_SEND_ASYNC:
>>> -        value = SHARED_ARRAY_FIELD_EX32(bus->regs, reg_byte_buf, TX_BUF);
>>> -        SHARED_ARRAY_FIELD_DP32(bus->regs, reg_byte_buf, RX_BUF, value << 1);
>>> +        /* Bit[0] == 0 indicates "send". */
>>> +        SHARED_ARRAY_FIELD_DP32(bus->regs, reg_byte_buf, RX_BUF, dev_addr << 1);
>>>   
>>>           ARRAY_FIELD_DP32(bus->regs, I2CD_INTR_STS, SLAVE_ADDR_RX_MATCH, 1);
>>>           SHARED_ARRAY_FIELD_DP32(bus->regs, reg_intr_sts, RX_DONE, 1);
>>> diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
>>> index 300a89b343..adc904d6c1 100644
>>> --- a/include/hw/i2c/aspeed_i2c.h
>>> +++ b/include/hw/i2c/aspeed_i2c.h
>>> @@ -130,6 +130,7 @@ REG32(I2CD_CMD, 0x14) /* I2CD Command/Status */
>>>       SHARED_FIELD(M_TX_CMD, 1, 1)
>>>       SHARED_FIELD(M_START_CMD, 0, 1)
>>>   REG32(I2CD_DEV_ADDR, 0x18) /* Slave Device Address */
>>> +    SHARED_FIELD(SLAVE_DEV_ADDR1, 0, 7)
>>>   REG32(I2CD_POOL_CTRL, 0x1C) /* Pool Buffer Control */
>>>       SHARED_FIELD(RX_COUNT, 24, 5)
>>>       SHARED_FIELD(RX_SIZE, 16, 5)
>>> -- 
>>> 2.37.1
>>>
>>
>> Nice catch Peter! I'm not sure how I messed that up like that.
>>
>> Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
> 
> Thanks Klaus. Just realized I forgot to cc you on this, sorry about
> that.

Do we still have time for 7.1 ?

Thanks,

C.


  
