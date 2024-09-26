Received: by 2002:a17:505:5b18:b0:1be9:327d:8ee3 with SMTP id ox24csp1045967njb;
        Thu, 26 Sep 2024 09:08:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW/QsKUOLrkkwzl4zPjGs/wdg9AQpomUdrlDKaVmqudXoB03jnvvSkNB5C9Fy7S5oB+IUc5CAS/M+Zxwg==@linaro.org
X-Google-Smtp-Source: AGHT+IF8dpEfOVXnWSQHU0mYMIRmRhN2EjQLKMYdia8AMIJDZi9291rQUKte3wdiAShs9jW1b9ly
X-Received: by 2002:ac8:7d86:0:b0:458:1431:d3ef with SMTP id d75a77b69052e-45c9f1dc9f0mr1668671cf.5.1727366932434;
        Thu, 26 Sep 2024 09:08:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727366932; cv=none;
        d=google.com; s=arc-20240605;
        b=QVuGvuiKCV4RJHwWHectAqBjxgOjWwcr3pu658A9V3zCdJmZRNacV0UN0UrIKaHlbX
         Mt84s2MHK0SDgUkkiGZK1mucQBDmwyVGlgbGi6y4xgUPTTBMe4F6OEur3WaQrF4pmH/Y
         +xWPxQ6+Djg8MIQ/nW52Zdt7nbKRUkq7YxIQOQnbSvil+jqxcLKy25EFGt4XAUj4Jirs
         dH/giLbUMRqKSgkQSEB8/on4wZBzxv5FVZh5nftjwAcQxPCl241sUlMUccs38nSKJU04
         2OYIOByTwJw6WdibaB9RfRyNcseNOrdhvRRLi0XlvJjqaEMKSKBZhzrVjbeU2n1sDkmv
         qOUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=5R3rolcpdog4A0re5kovyKb9BsOXjwxlopB8UHNDmGQ=;
        fh=y8UldgvBpgWdzvo0ZnT6ptMSZ9zI0pieroCu40oTsaQ=;
        b=ViBMk2pfPwSvSCmf3+mGHnqZ9WzNhqpFvlxOfplKjGWFKnI8IsKI6gZ31fC7xA39wC
         mKmwH7hutJoWxk8TLUzE/JVVl2EdDa+63lxSxJxfpYaUk+9AE87Y0JqEOoXUiMGlc9aV
         fzNpg08ZYGq0UIVoSdVZSrFGAGK/M5HVZ2snQMjKHTdnb3STWeDMKhWVC/LmOgE/xXYi
         7PIiWJ/t+aXTk+HocViJIAjB65PT11S8G6VrQoqQqf2NZEXKgmyQbTP7Ziu+fLrgUEZK
         gJ7N0YvsHg+3aourIhlLTNoj1dhKTTWgBvCfYEImV5P37xwvARd0BpfVOPd1pWh00pKP
         szww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45c9f37da86si365321cf.657.2024.09.26.09.08.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Sep 2024 09:08:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1str2o-0006pq-SC; Thu, 26 Sep 2024 12:08:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Z/Ab=QY=kaod.org=clg@ozlabs.org>)
 id 1str2n-0006oH-Dq; Thu, 26 Sep 2024 12:08:41 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Z/Ab=QY=kaod.org=clg@ozlabs.org>)
 id 1str2l-00043c-8p; Thu, 26 Sep 2024 12:08:41 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4XDz6P2kMgz4xQS;
 Fri, 27 Sep 2024 02:08:29 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XDz6K37lNz4xGl;
 Fri, 27 Sep 2024 02:08:05 +1000 (AEST)
Message-ID: <97b239a9-39df-4c5e-83f3-4bee66e570e5@kaod.org>
Date: Thu, 26 Sep 2024 18:08:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] hw/gpio/aspeed: Fix coding style
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20240926074535.1286209-1-jamin_lin@aspeedtech.com>
 <20240926074535.1286209-2-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240926074535.1286209-2-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=Z/Ab=QY=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.246, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: 94FlntlkOWP7

On 9/26/24 09:45, Jamin Lin wrote:
> Fix coding style issues from checkpatch.pl
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   hw/gpio/aspeed_gpio.c         | 6 +++---
>   include/hw/gpio/aspeed_gpio.h | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
> index 71756664dd..00fb72a509 100644
> --- a/hw/gpio/aspeed_gpio.c
> +++ b/hw/gpio/aspeed_gpio.c
> @@ -340,7 +340,8 @@ static void aspeed_gpio_set_pin_level(AspeedGPIOState *s, uint32_t set_idx,
>           value &= ~pin_mask;
>       }
>   
> -    aspeed_gpio_update(s, &s->sets[set_idx], value, ~s->sets[set_idx].direction);
> +    aspeed_gpio_update(s, &s->sets[set_idx], value,
> +                       ~s->sets[set_idx].direction);
>   }
>   
>   /*
> @@ -629,7 +630,6 @@ static uint64_t aspeed_gpio_read(void *opaque, hwaddr offset, uint32_t size)
>   static void aspeed_gpio_write_index_mode(void *opaque, hwaddr offset,
>                                                   uint64_t data, uint32_t size)
>   {
> -
>       AspeedGPIOState *s = ASPEED_GPIO(opaque);
>       AspeedGPIOClass *agc = ASPEED_GPIO_GET_CLASS(s);
>       const GPIOSetProperties *props;
> @@ -963,7 +963,7 @@ static void aspeed_gpio_set_pin(Object *obj, Visitor *v, const char *name,
>       aspeed_gpio_set_pin_level(s, set_idx, pin, level);
>   }
>   
> -/****************** Setup functions ******************/
> +/* Setup functions */
>   static const GPIOSetProperties ast2400_set_props[ASPEED_GPIO_MAX_NR_SETS] = {
>       [0] = {0xffffffff,  0xffffffff,  {"A", "B", "C", "D"} },
>       [1] = {0xffffffff,  0xffffffff,  {"E", "F", "G", "H"} },
> diff --git a/include/hw/gpio/aspeed_gpio.h b/include/hw/gpio/aspeed_gpio.h
> index 90a12ae318..39febda9ea 100644
> --- a/include/hw/gpio/aspeed_gpio.h
> +++ b/include/hw/gpio/aspeed_gpio.h
> @@ -88,7 +88,7 @@ struct AspeedGPIOState {
>       qemu_irq irq;
>       qemu_irq gpios[ASPEED_GPIO_MAX_NR_SETS][ASPEED_GPIOS_PER_SET];
>   
> -/* Parallel GPIO Registers */
> +    /* Parallel GPIO Registers */
>       uint32_t debounce_regs[ASPEED_GPIO_NR_DEBOUNCE_REGS];
>       struct GPIOSets {
>           uint32_t data_value; /* Reflects pin values */

