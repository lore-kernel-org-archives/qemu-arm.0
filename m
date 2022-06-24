Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp623965lft;
        Fri, 24 Jun 2022 14:43:06 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sEJ4y8GVjo3IegiwgFeGNk2GcqHcCDKuilhsDWJCDpW5pN9IU2xMjzMdHrwvww/KHUDCjn
X-Received: by 2002:ad4:596d:0:b0:470:7f34:fa13 with SMTP id eq13-20020ad4596d000000b004707f34fa13mr1008664qvb.55.1656106986223;
        Fri, 24 Jun 2022 14:43:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656106986; cv=none;
        d=google.com; s=arc-20160816;
        b=wV4CBhN5R/OqMqW4Gg6RJrzFFqMsRxt3/+G/Tp5hwNo89R8ypHrSS+nDOakx569jfR
         TigDpSiJ8ez86Irjr5v6/xqGfhMnrku1gw2NJ/uA4QJ7Sv9i4kAKEhq3us4N2yuRc9qw
         7dVL3UMz8I0NxhxE4KV3jOplC5LFvIBTTuDNWVAcrvNyE1VTvlK11DI5yAiRYIRWNg1z
         U29k9FCo+RrLBuBDFvmzCwyc1WE5BU2qGaYA4EDLybWpAdDr/PXsk0pWOOIFAjYZFWFy
         viuOQZvp0CX33dE7vC0SAnsjGVoDQUxTrvXxOyDPUoK3iPXPjdLxXKZ7BswZS6gUeZ9U
         Vgxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=RqENp+hgNyEIeB/+2P7P+nNF/3e0RZCqXQXSLMOyt00=;
        b=wa5STUfYITA/zbRrBXZ+mUqqTl/FKaTX1/fYQT83DTag+OXZJAERqjAJ1sFXoI5JRm
         5h9WKcCVnDjgRZjvg1FZQHmcLPB7q3c+lR3tm8SbzjuQgRMBx82dyc7LyITg5ZmITa2j
         SkE/TbE4F5GFqMKxODK8Tq7UrI9RqV+VYtvk2GPNIOsk2vqJNCzfZXxAhun1xfKKDNdu
         kiaJ1p6p+rYxST4nNkB1aoaBqpb5BO0TZSMNOSiUDG6GAWUeyH1wdWgRqQp3d+A8FBvY
         rDf9Ijuz183Ws+WTctB9Jn8vHMgNqznBdRIoK/TuUKWeOc+4P3BVVdwZk+LjwnW2BEcQ
         Xz4g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bi8-20020a05620a318800b006a5740177f7si2888777qkb.28.2022.06.24.14.43.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 14:43:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4r4z-000681-NC
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 17:43:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o4qtN-0002Ct-9z
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 17:31:05 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:39201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o4qtK-0004vn-W3
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 17:31:04 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.195])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 53DB0110E84D9;
 Fri, 24 Jun 2022 23:30:59 +0200 (CEST)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 24 Jun
 2022 23:30:58 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G00137a5c612-f125-4c0a-8585-846dfc43b54f,
 5EF2319963E9DB1A14486A5EC8730A2EE4B20F29) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <4aebf7dd-cda2-2f88-218a-ca251aefbc57@kaod.org>
Date: Fri, 24 Jun 2022 23:30:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] aspeed: i2c: Fix DMA len write-enable bit handling
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
CC: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 "qemu-arm-nongnu.org@devvm9194.prn0.facebook.com"
 <qemu-arm-nongnu.org@devvm9194.prn0.facebook.com>, Cameron Esfahani via
 <qemu-devel@nongnu.org>
References: <20220624203151.2026355-1-pdel@fb.com>
 <A705D254-804B-49CD-99BB-D5152F6ABB41@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <A705D254-804B-49CD-99BB-D5152F6ABB41@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: aa47fda2-f8f9-416c-b4aa-13b45ac6038d
X-Ovh-Tracer-Id: 3247939759032929187
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudefledgudeitdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgfefgfdukeefueejfeelgeffvdeulefhffekledvieegfffhudekgfefkeeiheelnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpohiilhgrsghsrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehvdel
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
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
X-TUID: maloNixi2Ynt

On 6/24/22 22:34, Peter Delevoryas wrote:
> 
> 
>> On Jun 24, 2022, at 1:31 PM, Peter Delevoryas <pdel@fb.com> wrote:
>>
>> I noticed i2c rx transfers were getting shortened to "1" on Zephyr. It
>> seems to be because the Zephyr i2c driver sets the RX DMA len with the
>> RX field write-enable bit set (bit 31) to avoid a read-modify-write. [1]
>>
>> /* 0x1C : I2CM Master DMA Transfer Length Register   */
>>
>> I think we should be checking the write-enable bits on the incoming
>> value, not checking the register array. I'm not sure we're even writing
>> the write-enable bits to the register array, actually.
>>
>> [1] https://github.com/AspeedTech-BMC/zephyr/blob/db3dbcc9c52e67a47180890ac938ed380b33f91c/drivers/i2c/i2c_aspeed.c#L145-L148
> 
> Arg, forgot this:
> 
> Fixes: ba2cccd64e90f34 ("aspeed: i2c: Add new mode support”)
> 
> Should I resend as v2?


No. patchwork did it :

http://patchwork.ozlabs.org/project/qemu-devel/patch/20220624203151.2026355-1-pdel@fb.com/

Thanks,

C.


> Thanks,
> Peter
> 
>>
>> Signed-off-by: Peter Delevoryas <pdel@fb.com>
>> ---
>> hw/i2c/aspeed_i2c.c | 8 ++++----
>> 1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
>> index 37ae1f2e04..c4fce7474a 100644
>> --- a/hw/i2c/aspeed_i2c.c
>> +++ b/hw/i2c/aspeed_i2c.c
>> @@ -644,18 +644,18 @@ static void aspeed_i2c_bus_new_write(AspeedI2CBus *bus, hwaddr offset,
>>                                                       RX_BUF_LEN) + 1;
>>          break;
>>      case A_I2CM_DMA_LEN:
>> -        w1t = ARRAY_FIELD_EX32(bus->regs, I2CM_DMA_LEN, RX_BUF_LEN_W1T) ||
>> -                   ARRAY_FIELD_EX32(bus->regs, I2CM_DMA_LEN, TX_BUF_LEN_W1T);
>> +        w1t = FIELD_EX32(value, I2CM_DMA_LEN, RX_BUF_LEN_W1T) ||
>> +              FIELD_EX32(value, I2CM_DMA_LEN, TX_BUF_LEN_W1T);
>>          /* If none of the w1t bits are set, just write to the reg as normal. */
>>          if (!w1t) {
>>              bus->regs[R_I2CM_DMA_LEN] = value;
>>              break;
>>          }
>> -        if (ARRAY_FIELD_EX32(bus->regs, I2CM_DMA_LEN, RX_BUF_LEN_W1T)) {
>> +        if (FIELD_EX32(value, I2CM_DMA_LEN, RX_BUF_LEN_W1T)) {
>>              ARRAY_FIELD_DP32(bus->regs, I2CM_DMA_LEN, RX_BUF_LEN,
>>                               FIELD_EX32(value, I2CM_DMA_LEN, RX_BUF_LEN));
>>          }
>> -        if (ARRAY_FIELD_EX32(bus->regs, I2CM_DMA_LEN, TX_BUF_LEN_W1T)) {
>> +        if (FIELD_EX32(value, I2CM_DMA_LEN, TX_BUF_LEN_W1T)) {
>>              ARRAY_FIELD_DP32(bus->regs, I2CM_DMA_LEN, TX_BUF_LEN,
>>                               FIELD_EX32(value, I2CM_DMA_LEN, TX_BUF_LEN));
>>          }
>> -- 
>> 2.30.2
>>
> 

