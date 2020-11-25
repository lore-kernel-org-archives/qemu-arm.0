Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp269847lfb;
        Tue, 24 Nov 2020 23:48:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxm509M1UwhD7OqHhkdH6swGYu/xA/M2bZqhpB1OPtUzQfA973+TLx8gNXzdtaj3vHMkUk3
X-Received: by 2002:a25:810c:: with SMTP id o12mr2788356ybk.74.1606290515984;
        Tue, 24 Nov 2020 23:48:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606290515; cv=none;
        d=google.com; s=arc-20160816;
        b=Qsu6NdNMEmCKiKMgyIc5/Cx9jHNpieRu3A0Xe2D+JSi1YH46jLwIml1YmJ8bW3LEDQ
         3bDRAUxwKHMRbBR5YZjZt3xBOkp/MdHcjpwcqrXz8fOvLGJkT9djcIGt9t3XszFb953R
         mvMRmzJz5s4ZuyU5f5u4xOccyNXJIzRwKPvyjHA6ZnNTcCeY+op+FR2yF6kmz+7P2uqt
         NiybqveldYL+JCqb5LVli9TwZ7K8EltBd+Y7X9OfVXFfSz1WiRf5tk5EicuKUStN7Z6u
         qNJlhDTc1iYefX7PKOJiZq3/ExvicCrqHU0qkWqzhmfYn/rycPPqJvnDF7lfDCbztHpp
         TAew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=++Dw/z2Xsatxkvnh605s/v+Iq0sVovfDb0DIWcgvXRg=;
        b=SsZKApTP4MzdQgLqwAEQ59CxVSCqz1aepHRXpJX8R+oeR8iciHVWiM0tFFnncW4J1G
         oVCQIbTD6KYKPhrwQ0cqQHoA4BMlTBZ8ByEQCEUps/dXYKHB0+7EeAj8oAlnu9CsNSVz
         8QO259yk5owJ8+FyCIq+5xlxoGnQMvkbJS+RAJKbM7K531iHDtGhWoO1uTbNtoqY44RI
         lEV6bR009PTTitekAbySv8UaEHjuKRDoCCKUBrDKij8HRpOuQ4awX1bGw+VAcTGMjCMh
         Defcztg78vUSi3oc5tXQoN+SKrgGNOebgLQnjkZItf+w4VW09M/dhLl1pWd8lmHLVwgK
         1GsA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x15si1540467ybr.301.2020.11.24.23.48.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Nov 2020 23:48:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1khpXX-0008LV-Dp
	for alex.bennee@linaro.org; Wed, 25 Nov 2020 02:48:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1khpXP-0008KO-VS
 for qemu-arm@nongnu.org; Wed, 25 Nov 2020 02:48:27 -0500
Received: from 9.mo51.mail-out.ovh.net ([46.105.48.137]:39871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1khpXM-0000e6-Fb
 for qemu-arm@nongnu.org; Wed, 25 Nov 2020 02:48:27 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.6])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id DA36E23AE9C;
 Wed, 25 Nov 2020 08:48:18 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 25 Nov
 2020 08:48:17 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0019c72c231-1d8c-4a45-b4d5-00637f23b4e2,
 1D6677CCFEDB402305856C1EADE37DC40CDB6EE3) smtp.auth=clg@kaod.org
Subject: Re: [PATCH for-6.0 2/2] aspeed/smc: Add extra controls to request DMA
To: Joel Stanley <joel@jms.id.au>
References: <20201120161547.740806-1-clg@kaod.org>
 <20201120161547.740806-3-clg@kaod.org>
 <CACPK8Xf_Q2_r=B54hvxmq4ezwmAndDPqGqOh9+YGFDCb4jfqig@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <9d56eea1-2fd5-4bb5-5f30-07f6529a2cd7@kaod.org>
Date: Wed, 25 Nov 2020 08:48:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xf_Q2_r=B54hvxmq4ezwmAndDPqGqOh9+YGFDCb4jfqig@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: f4b93fa3-5c57-4014-b05e-92332c504647
X-Ovh-Tracer-Id: 883268478529735462
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudegledgudduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruh
Received-SPF: pass client-ip=46.105.48.137; envelope-from=clg@kaod.org;
 helo=9.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: azAT+SbXNLRg

On 11/25/20 3:49 AM, Joel Stanley wrote:
> On Fri, 20 Nov 2020 at 16:16, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> The controller has a set of hidden bits to request/grant DMA access.
> 
> Do you have the ast2600 datasheet? It describes these bits:
> 
> 31 RW DMA Request
> 
> Write SPIR80 = 0xAEED0000 to set this bit ot '1'.
> And hardware will clear the request to '0' after DMA done, or FW can
> clear to '0' by writing SPIR80 = 0xDEEA0000.
> 
> 30 RO DMA Grant
> 
> 0: DMA is not allowed to be used. All DMA related control registers
> are not allowed to be written.
> 1: DMA is granted to be used.

I see them now :) They are under the SPI controllers but not under 
the BMC SPI controller where I was looking. May be the datasheet 
was updated now ? 
 
> Do you want to add the magic behavior to your model?

Yes. The Aspeed SPI driver needs them. I think the model can be better.
I will send a v2.

Thanks,

C.

> 
>>
>> Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  hw/ssi/aspeed_smc.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
>> index e3d5e26058c0..c1557ef5d848 100644
>> --- a/hw/ssi/aspeed_smc.c
>> +++ b/hw/ssi/aspeed_smc.c
>> @@ -127,6 +127,8 @@
>>
>>  /* DMA Control/Status Register */
>>  #define R_DMA_CTRL        (0x80 / 4)
>> +#define   DMA_CTRL_REQUEST      (1 << 31)
>> +#define   DMA_CTRL_GRANT        (1 << 30)
>>  #define   DMA_CTRL_DELAY_MASK   0xf
>>  #define   DMA_CTRL_DELAY_SHIFT  8
>>  #define   DMA_CTRL_FREQ_MASK    0xf
>> @@ -1237,6 +1239,11 @@ static void aspeed_smc_dma_done(AspeedSMCState *s)
>>
>>  static void aspeed_smc_dma_ctrl(AspeedSMCState *s, uint64_t dma_ctrl)
>>  {
>> +    if (dma_ctrl & DMA_CTRL_REQUEST) {
>> +            s->regs[R_DMA_CTRL] = dma_ctrl | DMA_CTRL_GRANT;
>> +            return;
>> +    }
>> +
>>      if (!(dma_ctrl & DMA_CTRL_ENABLE)) {
>>          s->regs[R_DMA_CTRL] = dma_ctrl;
>>
>> --
>> 2.26.2
>>

