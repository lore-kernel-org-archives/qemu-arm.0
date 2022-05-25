Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp701790lfh;
        Tue, 24 May 2022 23:39:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeoLfKpD6UNxY0e72NnM4hQc89x9xJwNVNT8s2HkvmBmbvE6FZX3Yw6BVQB+ljdmrpoq6U
X-Received: by 2002:a05:620a:2104:b0:6a3:502b:5375 with SMTP id l4-20020a05620a210400b006a3502b5375mr14615519qkl.131.1653460780921;
        Tue, 24 May 2022 23:39:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653460780; cv=none;
        d=google.com; s=arc-20160816;
        b=UmdNGa7rb/Q35G4kMtcMT3qXpq80U6L92PqIn2Jy5Kg+9N+uvTFwyWUvb7ta9QrCL0
         P5IkAy6jq8wTMp+HkRV1O45QvsJgQIBTjzIveX6nCfUHZ0pjxaeuinXuzMV6mt60SqPK
         a77TR3LFaUpv+9cBA4NNQPCQZl/c6IiBf7F2xKemcIn4HyhO5vxAb6djxISIJnjOJQiP
         ro95HmeRq581ekML5ZmSpFRH9V+k0weOIn+Bw1yXWkuDOdHrWWLEd53IhgQMSDNw6FlY
         ztDrz5O0bLmbXBb/Jl0lBTOM0WxbYPPz6jMfuavUG9Xh03K9+ZThrHzXKBVbOd1tZWUa
         9JGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=cBfbyRwd4fSPgReURI7LrKuxGUGzYsp8+VqekIOcO/U=;
        b=VeYgoEc/Wz1vlBqD+8rakLrU36Zi4n8ZJfzupfVWags99HaDPB9tZjSK4hGGl2KBUb
         3nE3NcuxCY9q+1fdr9beIlm9WS3lEGV7FsLPdql8PXa/OTzb2PHNB5WmpyosfgU4shNQ
         rj1lsHzHX2d6EsP5ly+jFrEmiF1zlXXJ+TbtthlZQStYs7Bcg5V+N4WGmWwK3loi7Djp
         w5OP2vJToRjA4hjdLK3YIicAXIuMBj4vIYjnPnlxAs1zoyijoZyqJ29qlYngH4RjwmLj
         pFCLIPmtJ4X7yhKUOK+lzA/NXLevI1egTcfFrzZxTMy/69SzPFHCL9oNv/oIfxHXcQ++
         dCwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id eq12-20020ad4596c000000b00461d082a4b2si714286qvb.354.2022.05.24.23.39.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 May 2022 23:39:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ntkgG-0005LD-EN
	for alex.bennee@linaro.org; Wed, 25 May 2022 02:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ntkTz-0004nq-H2
 for qemu-arm@nongnu.org; Wed, 25 May 2022 02:26:59 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:45099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ntkTx-0003BG-JM
 for qemu-arm@nongnu.org; Wed, 25 May 2022 02:26:59 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.51])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 3817C1039B842;
 Wed, 25 May 2022 08:26:53 +0200 (CEST)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 25 May
 2022 08:26:53 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004db140786-3551-460d-b50a-7f33736346c7,
 D6A97ED6E11FF164423AFC60B0B43C9491D8EECB) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <690b6f4c-f596-0c64-1b19-47af1d32a9ba@kaod.org>
Date: Wed, 25 May 2022 08:26:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 4/4] hw/gpio: replace HWADDR_PRIx with PRIx64
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
CC: <steven_lee@aspeedtech.com>, <troy_lee@aspeedtech.com>
References: <20220525053444.27228-1-jamin_lin@aspeedtech.com>
 <20220525053444.27228-5-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220525053444.27228-5-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 1fa6baee-4d56-49eb-8018-4b6f47d536df
X-Ovh-Tracer-Id: 14712415560385661804
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrjeeggddutdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehtrhhohigplhgvvgesrghsphgvvgguthgvtghhrdgtohhm
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
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
X-TUID: z0uXXzYw8anZ

On 5/25/22 07:34, Jamin Lin wrote:
> 1. replace HWADDR_PRIx with PRIx64
> 2. fix indent issue
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.




> ---
>   hw/gpio/aspeed_gpio.c         | 8 ++++----
>   include/hw/gpio/aspeed_gpio.h | 2 +-
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
> index c834bf19f5..a62a673857 100644
> --- a/hw/gpio/aspeed_gpio.c
> +++ b/hw/gpio/aspeed_gpio.c
> @@ -561,7 +561,7 @@ static uint64_t aspeed_gpio_read(void *opaque, hwaddr offset, uint32_t size)
>       reg = &agc->reg_table[idx];
>       if (reg->set_idx >= agc->nr_gpio_sets) {
>           qemu_log_mask(LOG_GUEST_ERROR, "%s: no getter for offset 0x%"
> -                      HWADDR_PRIx"\n", __func__, offset);
> +                      PRIx64"\n", __func__, offset);
>           return 0;
>       }
>   
> @@ -611,7 +611,7 @@ static uint64_t aspeed_gpio_read(void *opaque, hwaddr offset, uint32_t size)
>           break;
>       default:
>           qemu_log_mask(LOG_GUEST_ERROR, "%s: no getter for offset 0x%"
> -                      HWADDR_PRIx"\n", __func__, offset);
> +                      PRIx64"\n", __func__, offset);
>           return 0;
>       }
>   
> @@ -787,7 +787,7 @@ static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data,
>       reg = &agc->reg_table[idx];
>       if (reg->set_idx >= agc->nr_gpio_sets) {
>           qemu_log_mask(LOG_GUEST_ERROR, "%s: no setter for offset 0x%"
> -                      HWADDR_PRIx"\n", __func__, offset);
> +                      PRIx64"\n", __func__, offset);
>           return;
>       }
>   
> @@ -872,7 +872,7 @@ static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data,
>           break;
>       default:
>           qemu_log_mask(LOG_GUEST_ERROR, "%s: no setter for offset 0x%"
> -                      HWADDR_PRIx"\n", __func__, offset);
> +                      PRIx64"\n", __func__, offset);
>           return;
>       }
>       aspeed_gpio_update(s, set, set->data_value);
> diff --git a/include/hw/gpio/aspeed_gpio.h b/include/hw/gpio/aspeed_gpio.h
> index 41b36524d0..904eecf62c 100644
> --- a/include/hw/gpio/aspeed_gpio.h
> +++ b/include/hw/gpio/aspeed_gpio.h
> @@ -67,7 +67,7 @@ enum GPIORegIndexType {
>   typedef struct AspeedGPIOReg {
>       uint16_t set_idx;
>       enum GPIORegType type;
> - } AspeedGPIOReg;
> +} AspeedGPIOReg;
>   
>   struct AspeedGPIOClass {
>       SysBusDevice parent_obj;

