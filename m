Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp2078854lff;
        Wed, 11 Aug 2021 01:09:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVRsoDqRY0v7wmBFF9u8DOQmD+hNIKZNypH3YvVxfCikKll9wvPDcud40pGmQ4I2e3mnRI
X-Received: by 2002:a02:9a02:: with SMTP id b2mr3813767jal.89.1628669397991;
        Wed, 11 Aug 2021 01:09:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628669397; cv=none;
        d=google.com; s=arc-20160816;
        b=pdHKZyFbCsYpDJbo80Kk8dOhZJl4xCRf7YjZphoX05auuNiLO+y+cSfBvyOa7Iuf8C
         DsnFHPK2mRv128B8DDhZoZM33mhiOU4i7/0zCwkEU+p6Vc94gfNn8mTZdvpq6jCjVwtS
         B0+1o8e99UA6X84B4rzJ/2xzamiwCfDSF50OY4jrSWQvlXW1JnYyatFbmUoxBBoWu7GU
         3T6Bv49b4Q6FkTJizXmuz0leQFy5eEko5moCsPThSm68iwiwWeEcxh3I6/xjhYTvUYeB
         j49RFvYzO7kXWh8xPLFasGqSZ4bN5CZQXQI0uIJwCEJGxNuJPksMIidbJnz7AAruPxh8
         D4Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=gwEJRb7cmFKaoE5qiTXjarbkyGA/T1dcMSFEZwdbHQE=;
        b=ImAV/p756QpJjDlWaUn9YtuLNbzMMX6SRkBAm+xV7w1TQHhENalM/N5QX1JdG7mfOF
         S4dVL/yPQpZ36d/Dewa9i0TgtmRXZ4Xx6KS+44LLjnK531tDeM6UuXr2homs5R915uue
         baxUDT9rdHPEq+sb1li5Qxtx2F4Dz8jJzRL6p6PfTYLROixgvxIAy3Vy8WvyLlfyaikp
         8BkyBF08+cqVdPkUgwRYlksh06AkLcufa1w1epqIC2IIl7ZdTxI6nwL8ksPBie+dwvtL
         187kUuXgOEoteyq1LmcxstztvuqqhOXFDHZ2SyNtglEp76VSBVM43x7dUHW7013nLiYU
         +0xw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l2si26147642jak.45.2021.08.11.01.09.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Aug 2021 01:09:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mDjJF-0003O9-9Q
	for alex.bennee@linaro.org; Wed, 11 Aug 2021 04:09:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mDjJ6-0003Ni-IZ; Wed, 11 Aug 2021 04:09:48 -0400
Received: from smtpout3.3005.mail-out.ovh.net ([217.182.185.173]:35241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mDjJ4-00024J-5M; Wed, 11 Aug 2021 04:09:48 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.124])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id D63CC13D943;
 Wed, 11 Aug 2021 08:09:41 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 11 Aug
 2021 10:09:40 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003838a321f-8fe8-42da-b5bf-e23922552251,
 F37E8DF54766F004E000311A84F7FEB06F086262) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [PATCH 08/10] aspeed: Emulate the AST2600A3
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, Peter Maydell
 <peter.maydell@linaro.org>
References: <20210809131556.686260-1-clg@kaod.org>
 <20210809131556.686260-9-clg@kaod.org>
 <d41fddce-4c87-5356-faf0-762f9f4fd32b@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <d62848e5-910c-0d81-fcf9-3a6ebd9794db@kaod.org>
Date: Wed, 11 Aug 2021 10:09:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d41fddce-4c87-5356-faf0-762f9f4fd32b@amsat.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b5974f8b-8a51-458c-9ce1-afa31d1bcf5b
X-Ovh-Tracer-Id: 9639110579892620070
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrkeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepfhegsghughesrghmshgrthdrohhrgh
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout3.3005.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DpM/Ev9DbPR6

On 8/9/21 5:55 PM, Philippe Mathieu-Daudé wrote:
> On 8/9/21 3:15 PM, Cédric Le Goater wrote:
>> From: Joel Stanley <joel@jms.id.au>
>>
>> This is the latest revision of the ASPEED 2600 SoC. As there is no
>> need to model multiple revisions of the same SoC for the moment,
>> update the SCU AST2600 to model the A3 revision instead of the A1 and
>> adapt the AST2600 SoC and machines.
>>
>> Reset values are taken from v8 of the datasheet.
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> [ clg: - Introduced an Aspeed "ast2600-a3" SoC class
>>        - Commit log update ]
>> Message-Id: <20210407171637.777743-21-clg@kaod.org>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> Message-Id: <20210629142336.750058-3-clg@kaod.org>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  include/hw/misc/aspeed_scu.h |  2 ++
>>  hw/arm/aspeed.c              |  6 +++---
>>  hw/arm/aspeed_ast2600.c      |  6 +++---
>>  hw/misc/aspeed_scu.c         | 36 +++++++++++++++++++++++++++++-------
>>  4 files changed, 37 insertions(+), 13 deletions(-)
> 
>> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
>> index 40a38ebd8549..05edebedeb46 100644
>> --- a/hw/misc/aspeed_scu.c
>> +++ b/hw/misc/aspeed_scu.c
>> @@ -101,14 +101,24 @@
>>  #define AST2600_CLK_STOP_CTRL_CLR TO_REG(0x84)
>>  #define AST2600_CLK_STOP_CTRL2     TO_REG(0x90)
>>  #define AST2600_CLK_STOP_CTRL2_CLR TO_REG(0x94)
>> +#define AST2600_DEBUG_CTRL        TO_REG(0xC8)
>> +#define AST2600_DEBUG_CTRL2       TO_REG(0xD8)
>>  #define AST2600_SDRAM_HANDSHAKE   TO_REG(0x100)
>>  #define AST2600_HPLL_PARAM        TO_REG(0x200)
>>  #define AST2600_HPLL_EXT          TO_REG(0x204)
>> +#define AST2600_APLL_PARAM        TO_REG(0x210)
>> +#define AST2600_APLL_EXT          TO_REG(0x214)
>> +#define AST2600_MPLL_PARAM        TO_REG(0x220)
>>  #define AST2600_MPLL_EXT          TO_REG(0x224)
>> +#define AST2600_EPLL_PARAM        TO_REG(0x240)
>>  #define AST2600_EPLL_EXT          TO_REG(0x244)
>> +#define AST2600_DPLL_PARAM        TO_REG(0x260)
>> +#define AST2600_DPLL_EXT          TO_REG(0x264)
>>  #define AST2600_CLK_SEL           TO_REG(0x300)
>>  #define AST2600_CLK_SEL2          TO_REG(0x304)
>> -#define AST2600_CLK_SEL3          TO_REG(0x310)
>> +#define AST2600_CLK_SEL3          TO_REG(0x308)
> 
> Is it a bugfix? Otherwise this is annoying.

This is a bug in the model. These registers have the same layout
on the A1.

Thanks,

C.

> 
> Maybe:
> 
>  #define AST2600A1_CLK_SEL3          TO_REG(0x310)
>  #define AST2600A3_CLK_SEL3          TO_REG(0x308)
> 
> and...
> 
>> +#define AST2600_CLK_SEL4          TO_REG(0x310)
>> +#define AST2600_CLK_SEL5          TO_REG(0x314)
>>  #define AST2600_HW_STRAP1         TO_REG(0x500)
>>  #define AST2600_HW_STRAP1_CLR     TO_REG(0x504)
>>  #define AST2600_HW_STRAP1_PROT    TO_REG(0x508)
>> @@ -433,6 +443,8 @@ static uint32_t aspeed_silicon_revs[] = {
>>      AST2500_A1_SILICON_REV,
>>      AST2600_A0_SILICON_REV,
>>      AST2600_A1_SILICON_REV,
>> +    AST2600_A2_SILICON_REV,
>> +    AST2600_A3_SILICON_REV,
>>  };
>>  
>>  bool is_supported_silicon_rev(uint32_t silicon_rev)
>> @@ -651,16 +663,26 @@ static const MemoryRegionOps aspeed_ast2600_scu_ops = {
>>      .valid.unaligned = false,
>>  };
>>  
>> -static const uint32_t ast2600_a1_resets[ASPEED_AST2600_SCU_NR_REGS] = {
>> +static const uint32_t ast2600_a3_resets[ASPEED_AST2600_SCU_NR_REGS] = {
>>      [AST2600_SYS_RST_CTRL]      = 0xF7C3FED8,
>> -    [AST2600_SYS_RST_CTRL2]     = 0xFFFFFFFC,
>> +    [AST2600_SYS_RST_CTRL2]     = 0x0DFFFFFC,
>>      [AST2600_CLK_STOP_CTRL]     = 0xFFFF7F8A,
>>      [AST2600_CLK_STOP_CTRL2]    = 0xFFF0FFF0,
>> +    [AST2600_DEBUG_CTRL]        = 0x00000FFF,
>> +    [AST2600_DEBUG_CTRL2]       = 0x000000FF,
>>      [AST2600_SDRAM_HANDSHAKE]   = 0x00000000,
>> -    [AST2600_HPLL_PARAM]        = 0x1000405F,
>> +    [AST2600_HPLL_PARAM]        = 0x1000408F,
>> +    [AST2600_APLL_PARAM]        = 0x1000405F,
>> +    [AST2600_MPLL_PARAM]        = 0x1008405F,
>> +    [AST2600_EPLL_PARAM]        = 0x1004077F,
>> +    [AST2600_DPLL_PARAM]        = 0x1078405F,
>> +    [AST2600_CLK_SEL]           = 0xF3940000,
>> +    [AST2600_CLK_SEL2]          = 0x00700000,
>> +    [AST2600_CLK_SEL3]          = 0x00000000,
> 
> ... use AST2600A3_CLK_SEL3 here?
> 
> So someone wanting the emulate the A1 doesn't get
> the nasty bug of having CLK_SEL3 misplaced.
> 
>> +    [AST2600_CLK_SEL4]          = 0xF3F40000,
>> +    [AST2600_CLK_SEL5]          = 0x30000000,
>>      [AST2600_CHIP_ID0]          = 0x1234ABCD,
>>      [AST2600_CHIP_ID1]          = 0x88884444,
>> -
>>  };

