Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp42574lfp;
        Tue, 12 Jul 2022 23:16:16 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u3bbEWWP3xp9kdwHSoFnvjnKkDtXuU9pJwmR7O8abJ4yQbZEQKdnuqWfX01wt2+ts20btj
X-Received: by 2002:a05:622a:28e:b0:31e:c38d:82bd with SMTP id z14-20020a05622a028e00b0031ec38d82bdmr1448223qtw.204.1657692976731;
        Tue, 12 Jul 2022 23:16:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657692976; cv=none;
        d=google.com; s=arc-20160816;
        b=u5CnkJzmoX/4o41/vy6eWr9PkQ+yapY/qP8ttcFXKC8L1pQ1swDhxD8xywmZRSU3ZU
         L6qdBq6po8gCGjR9Jc5RQo8PxSA9S3L5mL1R46FG2lUWRRItrJ+v6BmNdYw1Bi4aCH9c
         NpPHLOmk0EogKhrgVq4/G2GySMVPZxHDDqUeH9bNwSWNj7+ej4fckk/CDyXrnitLj2zs
         G42Bb1QQnyfTG7VAg94F6p1Y7ebypkjYOoJPgBqY14Z0kR+taK0/6L6L9QVckuDpjeRk
         YsPSASWWRCRzoDHsYyP7vC9zQPk936n0836g1iQrgM/NAp0LWx8DF6QigOs/211Bkn3w
         e0GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=OLKdwaxgGKRF5st+u4rOR4HcDpQS8FLIlU9pDEj2tOA=;
        b=FzOAwx3REfN+Mka72cRddVSTZbayPFMWnz0oo9bs6eTtC5WvgM4qBkX5gzU63girDn
         U/AV0QaPXGNz8dODk6AZK7OxznHVQ0xsfH8Izk0ZQ5ejtyv4q/3Mzz6+LAfsjUsUkRpx
         GD92MWs0oMyCOOg3uTaazeVRY5CKUMU4s9afgLOegf49UZoYVvwAsF84lzF0PmhUU04r
         JieJ6fVBBXwNleTOApoeHhpfQ8zxBE0OArwogz0VzwBqpavxXnBfT/ragd43s1hBq+a/
         OvHsnXE7BgDCqee86KQ+m2/hfFPckLDC6TB602shroUJXSKasClxrLp2Wfmg84UHAsHg
         2N2A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v18-20020ac85792000000b0031ea8b64b73si8689171qta.527.2022.07.12.23.16.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jul 2022 23:16:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oBVfT-0000kt-77
	for alex.bennee@linaro.org; Wed, 13 Jul 2022 02:16:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oBVeh-0000kU-SS
 for qemu-arm@nongnu.org; Wed, 13 Jul 2022 02:15:28 -0400
Received: from 6.mo552.mail-out.ovh.net ([188.165.49.222]:52653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oBVef-0008Jw-8Q
 for qemu-arm@nongnu.org; Wed, 13 Jul 2022 02:15:27 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.128])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 817BC260A6;
 Wed, 13 Jul 2022 06:15:21 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 13 Jul
 2022 08:15:20 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002d9e9464b-fe28-434c-87cf-675b7432ceda,
 B7C06120255AFE5421B63915098EA76FE65B5110) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Message-ID: <b87060c9-5bcb-848c-73f1-86831a20a1fb@kaod.org>
Date: Wed, 13 Jul 2022 08:15:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 2/3] hw/gpio/aspeed: Don't let guests modify input pins
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
CC: <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <thuth@redhat.com>, <lvivier@redhat.com>, <pbonzini@redhat.com>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220712023219.41065-1-peter@pjd.dev>
 <20220712023219.41065-3-peter@pjd.dev>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220712023219.41065-3-peter@pjd.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 5381905e-69b8-4883-91b0-fab7de670b25
X-Ovh-Tracer-Id: 7131731487341906735
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudejiedguddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnheptdehkeelieetvddtlefgveeuheduheetledvtdfgfeffledvjeekjeegledvkeeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=188.165.49.222; envelope-from=clg@kaod.org;
 helo=6.mo552.mail-out.ovh.net
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
X-TUID: 1AEKK1gVYs97

On 7/12/22 04:32, Peter Delevoryas wrote:
> Up until now, guests could modify input pins by overwriting the data
> value register. The guest OS should only be allowed to modify output pin
> values, and the QOM property setter should only be permitted to modify
> input pins.
> 
> This change also updates the gpio input pin test to match this
> expectation.
> 
> Andrew suggested this particularly refactoring here:
> 
>      https://lore.kernel.org/qemu-devel/23523aa1-ba81-412b-92cc-8174faba3612@www.fastmail.com/
> 
> Suggested-by: Andrew Jeffery <andrew@aj.id.au>
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> Fixes: 4b7f956862dc ("hw/gpio: Add basic Aspeed GPIO model for AST2400 and AST2500")
> ---


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


>   hw/gpio/aspeed_gpio.c          | 15 ++++++++-------
>   tests/qtest/aspeed_gpio-test.c |  2 +-
>   2 files changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
> index a62a673857..1e267dd482 100644
> --- a/hw/gpio/aspeed_gpio.c
> +++ b/hw/gpio/aspeed_gpio.c
> @@ -268,7 +268,7 @@ static ptrdiff_t aspeed_gpio_set_idx(AspeedGPIOState *s, GPIOSets *regs)
>   }
>   
>   static void aspeed_gpio_update(AspeedGPIOState *s, GPIOSets *regs,
> -                               uint32_t value)
> +                               uint32_t value, uint32_t mode_mask)
>   {
>       uint32_t input_mask = regs->input_mask;
>       uint32_t direction = regs->direction;
> @@ -277,7 +277,8 @@ static void aspeed_gpio_update(AspeedGPIOState *s, GPIOSets *regs,
>       uint32_t diff;
>       int gpio;
>   
> -    diff = old ^ new;
> +    diff = (old ^ new);
> +    diff &= mode_mask;
>       if (diff) {
>           for (gpio = 0; gpio < ASPEED_GPIOS_PER_SET; gpio++) {
>               uint32_t mask = 1 << gpio;
> @@ -339,7 +340,7 @@ static void aspeed_gpio_set_pin_level(AspeedGPIOState *s, uint32_t set_idx,
>           value &= ~pin_mask;
>       }
>   
> -    aspeed_gpio_update(s, &s->sets[set_idx], value);
> +    aspeed_gpio_update(s, &s->sets[set_idx], value, ~s->sets[set_idx].direction);
>   }
>   
>   /*
> @@ -653,7 +654,7 @@ static void aspeed_gpio_write_index_mode(void *opaque, hwaddr offset,
>           reg_value = update_value_control_source(set, set->data_value,
>                                                   reg_value);
>           set->data_read = reg_value;
> -        aspeed_gpio_update(s, set, reg_value);
> +        aspeed_gpio_update(s, set, reg_value, set->direction);
>           return;
>       case gpio_reg_idx_direction:
>           reg_value = set->direction;
> @@ -753,7 +754,7 @@ static void aspeed_gpio_write_index_mode(void *opaque, hwaddr offset,
>               __func__, offset, data, reg_idx_type);
>           return;
>       }
> -    aspeed_gpio_update(s, set, set->data_value);
> +    aspeed_gpio_update(s, set, set->data_value, UINT32_MAX);
>       return;
>   }
>   
> @@ -799,7 +800,7 @@ static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data,
>           data &= props->output;
>           data = update_value_control_source(set, set->data_value, data);
>           set->data_read = data;
> -        aspeed_gpio_update(s, set, data);
> +        aspeed_gpio_update(s, set, data, set->direction);
>           return;
>       case gpio_reg_direction:
>           /*
> @@ -875,7 +876,7 @@ static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data,
>                         PRIx64"\n", __func__, offset);
>           return;
>       }
> -    aspeed_gpio_update(s, set, set->data_value);
> +    aspeed_gpio_update(s, set, set->data_value, UINT32_MAX);
>       return;
>   }
>   
> diff --git a/tests/qtest/aspeed_gpio-test.c b/tests/qtest/aspeed_gpio-test.c
> index 8f52454099..d38f51d719 100644
> --- a/tests/qtest/aspeed_gpio-test.c
> +++ b/tests/qtest/aspeed_gpio-test.c
> @@ -69,7 +69,7 @@ static void test_set_input_pins(const void *data)
>   
>       qtest_writel(s, AST2600_GPIO_BASE + GPIO_ABCD_DATA_VALUE, 0x00000000);
>       value = qtest_readl(s, AST2600_GPIO_BASE + GPIO_ABCD_DATA_VALUE);
> -    g_assert_cmphex(value, ==, 0x00000000);
> +    g_assert_cmphex(value, ==, 0xffffffff);
>   }
>   
>   int main(int argc, char **argv)

