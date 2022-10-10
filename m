Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp2202875ocg;
        Sun, 9 Oct 2022 23:13:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5PyzTBwzqUTchU1sFVuGM1i8MdYiHlow3LE12CP1QdoT/8252ojnpz/SiP+ra1sb82cFJ1
X-Received: by 2002:a05:6214:ac4:b0:4af:b60f:5c7a with SMTP id g4-20020a0562140ac400b004afb60f5c7amr13428388qvi.60.1665382426396;
        Sun, 09 Oct 2022 23:13:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665382426; cv=none;
        d=google.com; s=arc-20160816;
        b=CQ7U70zjrWooZAgQjO0B44oUHcpXX4TrqaswF5cd3A1LWBBewpW7wEHPbAwl+/m2Rg
         TiPt/dmoMyKWoQUaUASWce6l9l3Od/I1FsBZhNwEWw3ccgsyo03S39jcLfe5gQGx3k4o
         y8heuQIMwFM0xftxZrqvyFCbyRHcm1AB4gJ583L8bWN+iZpZoNoluGNvisgxCNM0MIH2
         8A4cdW16+FPVKXbm2OQiVhdMlmsMY6cCINTE+S1CTTGIUOSfwWC7MhwUyZ3ga+4RdFbo
         hfGKfvN9o8fzOSBRxzukUUGSLMN3yehiiukY7E0QzEIXecSdXOLsjxRGAT+gKh0dmVev
         XJXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=/zsC7NKvJ5ByQSX6AZbv+f3IElYRm3xdMV3+J7F1cTs=;
        b=B3oiDvOUkHzK5OhbtvemVyCXDvn5NNKvg8OLHU0uy35iiwsQh57uZFT4dbZX6B4iN7
         y+E5aAWeOfVQ0pBQHys6Epr66HaIUuYpNXIE5kzM5I7OsLHNNQYOcfCt9OFACbYYKyq8
         eu/YjXCiL6b/6N+Js+E0dXrR2p4hg/zgNxKG+GN08SnxG5Afe+gGucDmWUfUvnGLDh/+
         CYOQYmxA3jEd64OdWT0EPKvSNI55LVwZ0zJwkBQL2T+AQbDwZlfYxOhw0H+dIAiSRWRq
         fZyDxFUv7TcHli6CapPmVuONKQ511Yzqe0ynmObhlYvizdsf5lhcc+oBAbUBDZpakMv/
         Bsmw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f15-20020a05622a114f00b003436a1da196si5056700qty.388.2022.10.09.23.13.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Oct 2022 23:13:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ohm2r-0000TH-B4
	for alex.bennee@linaro.org; Mon, 10 Oct 2022 02:13:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ohlzU-0006da-UO
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 02:10:16 -0400
Received: from 1.mo552.mail-out.ovh.net ([178.32.96.117]:35125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ohlzR-0005DQ-TO
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 02:10:16 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.210])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 8996125ADE;
 Mon, 10 Oct 2022 06:09:59 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Mon, 10 Oct
 2022 08:09:58 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002e05f19ae-87c1-4320-8bc9-e327885f6622,
 8F9D85B4748BB0730094C5680DDBB13DC71FBC21) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <443fe2a3-4361-e573-4728-af9a2a43ff2a@kaod.org>
Date: Mon, 10 Oct 2022 08:09:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 3/8] m25p80: Add the mx25l25635e SFPD table
Content-Language: en-US
To: Francisco Iglesias <frasse.iglesias@gmail.com>
CC: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <qemu-block@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>,
 Iris Chen <irischenlj@fb.com>, Michael Walle <michael@walle.cc>
References: <20220722063602.128144-1-clg@kaod.org>
 <20220722063602.128144-4-clg@kaod.org> <20221007135921.GB20384@fralle-msi>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221007135921.GB20384@fralle-msi>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 189047ad-cc47-4b13-8031-acc3ee5a3a04
X-Ovh-Tracer-Id: 13202020836137339826
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejvddguddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehmihgthhgrvghlseifrghllhgvrdgttgdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo552.mail-out.ovh.net
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.934,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: RRmVvMpv6mb2

Hello Francisco

On 10/7/22 15:59, Francisco Iglesias wrote:
> Hi Cedric,
> 
> On [2022 Jul 22] Fri 08:35:57, Cédric Le Goater wrote:
>> The SFDP table is 0x80 bytes long. The mandatory table for basic
>> features is available at byte 0x30 and an extra Macronix specific
>> table is available at 0x60.
>>
>> 4B opcodes are not supported.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   hw/block/m25p80_sfdp.h |  3 +++
>>   hw/block/m25p80.c      |  3 ++-
>>   hw/block/m25p80_sfdp.c | 26 ++++++++++++++++++++++++++
>>   3 files changed, 31 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/block/m25p80_sfdp.h b/hw/block/m25p80_sfdp.h
>> index d3a0a778ae84..0c46e669b335 100644
>> --- a/hw/block/m25p80_sfdp.h
>> +++ b/hw/block/m25p80_sfdp.h
>> @@ -17,4 +17,7 @@
>>   
>>   extern uint8_t m25p80_sfdp_n25q256a(uint32_t addr);
>>   
>> +extern uint8_t m25p80_sfdp_mx25l25635e(uint32_t addr);
> 
> We could be without 'extern' in above hdr if we like (also the other patches),

Yes. I dropped all of them in v4.

Thanks,

C.

> either way:
> 
> Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
> 
>> +
>> +
>>   #endif
>> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
>> index 13e7b28fd2b0..028b026d8ba2 100644
>> --- a/hw/block/m25p80.c
>> +++ b/hw/block/m25p80.c
>> @@ -232,7 +232,8 @@ static const FlashPartInfo known_devices[] = {
>>       { INFO("mx25l6405d",  0xc22017,      0,  64 << 10, 128, 0) },
>>       { INFO("mx25l12805d", 0xc22018,      0,  64 << 10, 256, 0) },
>>       { INFO("mx25l12855e", 0xc22618,      0,  64 << 10, 256, 0) },
>> -    { INFO6("mx25l25635e", 0xc22019,     0xc22019,  64 << 10, 512, 0) },
>> +    { INFO6("mx25l25635e", 0xc22019,     0xc22019,  64 << 10, 512, 0),
>> +      .sfdp_read = m25p80_sfdp_mx25l25635e },
>>       { INFO("mx25l25655e", 0xc22619,      0,  64 << 10, 512, 0) },
>>       { INFO("mx66l51235f", 0xc2201a,      0,  64 << 10, 1024, ER_4K | ER_32K) },
>>       { INFO("mx66u51235f", 0xc2253a,      0,  64 << 10, 1024, ER_4K | ER_32K) },
>> diff --git a/hw/block/m25p80_sfdp.c b/hw/block/m25p80_sfdp.c
>> index 24ec05de79a1..6499c4c39954 100644
>> --- a/hw/block/m25p80_sfdp.c
>> +++ b/hw/block/m25p80_sfdp.c
>> @@ -56,3 +56,29 @@ static const uint8_t sfdp_n25q256a[] = {
>>       0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>>   };
>>   define_sfdp_read(n25q256a);
>> +
>> +
>> +/*
>> + * Matronix
>> + */
>> +
>> +/* mx25l25635e. No 4B opcodes */
>> +static const uint8_t sfdp_mx25l25635e[] = {
>> +    0x53, 0x46, 0x44, 0x50, 0x00, 0x01, 0x01, 0xff,
>> +    0x00, 0x00, 0x01, 0x09, 0x30, 0x00, 0x00, 0xff,
>> +    0xc2, 0x00, 0x01, 0x04, 0x60, 0x00, 0x00, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xe5, 0x20, 0xf3, 0xff, 0xff, 0xff, 0xff, 0x0f,
>> +    0x44, 0xeb, 0x08, 0x6b, 0x08, 0x3b, 0x04, 0xbb,
>> +    0xee, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0xff,
>> +    0xff, 0xff, 0x00, 0xff, 0x0c, 0x20, 0x0f, 0x52,
>> +    0x10, 0xd8, 0x00, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0x00, 0x36, 0x00, 0x27, 0xf7, 0x4f, 0xff, 0xff,
>> +    0xd9, 0xc8, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +};
>> +define_sfdp_read(mx25l25635e)
>> -- 
>> 2.35.3
>>

