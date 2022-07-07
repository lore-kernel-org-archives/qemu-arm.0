Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp5328835lft;
        Thu, 7 Jul 2022 01:59:41 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u8va6GOqAKVJoJRLq6h9aEWGTYCvRT9W2r6ZOFwk9ne8q9uVP+mm1z9I4apFQzz3iLkYCH
X-Received: by 2002:a05:6902:54f:b0:66c:a098:339d with SMTP id z15-20020a056902054f00b0066ca098339dmr49729090ybs.116.1657184381058;
        Thu, 07 Jul 2022 01:59:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657184381; cv=none;
        d=google.com; s=arc-20160816;
        b=HMa7GoTROIjYdxleuNSxzkx9Ys9Qmt7V39A3BcxLTipbmih1wmRtti+w45MlxzpUI2
         kLvh4rqYVpC0vpyQrLLhIktbAjfcs6wy6rxClkTJLP1bOS7Whfu1UiWBY51LZktEcpqT
         F6SJJHlORnKVDeUuHtRtnEgQEhkyrpjYEj3md5S+lo+nfW9nFfZCjbitqDoV5rIo22oJ
         vQoS5FhXqnoDv8YodU5+7TZLORGIZlPAxPpDa7ceLmaToMXsFN+vpkvDvCSpOwL8qp+V
         4BdhjwentzzfbsfUk8MX5njosDZLUr1hIQQVPLZU5Z1G+Hb2l/MdL2B/GwwsVspDufTK
         q/+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=b+5fDOD84mIx1Dt6KkXyJ/Gm6NqhXmUzQG8+sKxB98I=;
        b=bOgBbZfddysbBMJV/Ej8NmeUorU0UIBbmmBQOc2qbG6rDffJ8YlsHi8vhoIhQ6k/v/
         edQ0524PKRTXOiH1VQtcFz24dbHipHO9Jz3b+y0E0mOvDDJetmRJze+Xut1VBm97VVoE
         LBhQQ/8HeRo3rPbZ1QrtmGtRgwcakO5BodmocotZOIDAzb2z4uY1F9K1PxdCOlsWvgzG
         B5nGKirMI5gFSVWxbVGDdJPGTLnEvAtioG8Eh6he34n0V8jAWC8Jg22YeGU+nlg0r+SO
         yhgq6rBBVqzroJZyqxJkMNvB5qpbJ62TQ8yIvT0A8mSTewwbvL+GWOAWzTJfWuT/yI9W
         kJew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 193-20020a2513ca000000b0066e41d5c2c4si15491705ybt.86.2022.07.07.01.59.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jul 2022 01:59:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9NMK-0005dU-Au
	for alex.bennee@linaro.org; Thu, 07 Jul 2022 04:59:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o9NIx-0002o5-LU
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 04:56:11 -0400
Received: from 3.mo552.mail-out.ovh.net ([178.33.254.192]:51571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o9NIu-0006Cl-4c
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 04:56:11 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.164])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 10F0027698;
 Thu,  7 Jul 2022 08:56:03 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 7 Jul 2022
 10:56:03 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0040a4aee57-9010-4aa9-8aba-bd3fa6eceb39,
 2B39F57B81C0BD827FC0711042E7B74C62F0E97C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <fa52743a-5730-3b3f-f07f-99931bb66b01@kaod.org>
Date: Thu, 7 Jul 2022 10:56:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] hw/gpio/aspeed: Don't let guests modify input pins
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery
 <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20220707071731.34047-1-peter@pjd.dev>
 <20220707071731.34047-2-peter@pjd.dev>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220707071731.34047-2-peter@pjd.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 8f1c9ca1-5748-4dc0-9c7d-057dc0a516f7
X-Ovh-Tracer-Id: 11503037874949557030
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudeihedgtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelleeiiefgkeefiedtvdeigeetueetkeffkeelheeugfetteegvdekgfehgffgkeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehhedv
Received-SPF: pass client-ip=178.33.254.192; envelope-from=clg@kaod.org;
 helo=3.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: gtDXdEQI+7n3

On 7/7/22 09:17, Peter Delevoryas wrote:
> It seems that aspeed_gpio_update is allowing the value for input pins to be
> modified through register writes and QOM property modification.
> 
> The QOM property modification is fine, but modifying the value through
> register writes from the guest OS seems wrong if the pin's direction is set
> to input.
> 
> The datasheet specifies that "0" bits in the direction register select input
> mode, and "1" selects output mode.
> 
> OpenBMC userspace code is accidentally writing 0's to the GPIO data
> registers somewhere (or perhaps the driver is doing it through a reset or
> something), and this is overwriting GPIO FRU information (board ID, slot
> presence pins) that is initialized in Aspeed machine reset code (see
> fby35_reset() in hw/arm/aspeed.c).

It might be good to log a GUEST_ERROR in that case, when writing to an
input GPIO and when reading from an output GPIO.

Thanks,

C.

> 
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> Fixes: 4b7f956862dc ("hw/gpio: Add basic Aspeed GPIO model for AST2400 and AST2500")
> ---
>   hw/gpio/aspeed_gpio.c | 22 ++++++++++++----------
>   1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
> index a62a673857..2eae427201 100644
> --- a/hw/gpio/aspeed_gpio.c
> +++ b/hw/gpio/aspeed_gpio.c
> @@ -268,7 +268,7 @@ static ptrdiff_t aspeed_gpio_set_idx(AspeedGPIOState *s, GPIOSets *regs)
>   }
>   
>   static void aspeed_gpio_update(AspeedGPIOState *s, GPIOSets *regs,
> -                               uint32_t value)
> +                               uint32_t value, bool force)
>   {
>       uint32_t input_mask = regs->input_mask;
>       uint32_t direction = regs->direction;
> @@ -293,10 +293,12 @@ static void aspeed_gpio_update(AspeedGPIOState *s, GPIOSets *regs,
>               }
>   
>               /* ...then update the state. */
> -            if (mask & new) {
> -                regs->data_value |= mask;
> -            } else {
> -                regs->data_value &= ~mask;
> +            if (direction & mask || force) {
> +                if (mask & new) {
> +                    regs->data_value |= mask;
> +                } else {
> +                    regs->data_value &= ~mask;
> +                }
>               }
>   
>               /* If the gpio is set to output... */
> @@ -339,7 +341,7 @@ static void aspeed_gpio_set_pin_level(AspeedGPIOState *s, uint32_t set_idx,
>           value &= ~pin_mask;
>       }
>   
> -    aspeed_gpio_update(s, &s->sets[set_idx], value);
> +    aspeed_gpio_update(s, &s->sets[set_idx], value, true);
>   }
>   
>   /*
> @@ -653,7 +655,7 @@ static void aspeed_gpio_write_index_mode(void *opaque, hwaddr offset,
>           reg_value = update_value_control_source(set, set->data_value,
>                                                   reg_value);
>           set->data_read = reg_value;
> -        aspeed_gpio_update(s, set, reg_value);
> +        aspeed_gpio_update(s, set, reg_value, false);
>           return;
>       case gpio_reg_idx_direction:
>           reg_value = set->direction;
> @@ -753,7 +755,7 @@ static void aspeed_gpio_write_index_mode(void *opaque, hwaddr offset,
>               __func__, offset, data, reg_idx_type);
>           return;
>       }
> -    aspeed_gpio_update(s, set, set->data_value);
> +    aspeed_gpio_update(s, set, set->data_value, false);
>       return;
>   }
>   
> @@ -799,7 +801,7 @@ static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data,
>           data &= props->output;
>           data = update_value_control_source(set, set->data_value, data);
>           set->data_read = data;
> -        aspeed_gpio_update(s, set, data);
> +        aspeed_gpio_update(s, set, data, false);
>           return;
>       case gpio_reg_direction:
>           /*
> @@ -875,7 +877,7 @@ static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data,
>                         PRIx64"\n", __func__, offset);
>           return;
>       }
> -    aspeed_gpio_update(s, set, set->data_value);
> +    aspeed_gpio_update(s, set, set->data_value, false);
>       return;
>   }
>   

