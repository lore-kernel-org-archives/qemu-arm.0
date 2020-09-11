Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp246179lfq;
        Fri, 11 Sep 2020 12:56:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxucy1kdFHfq4fb/owki3pPQiB6vjan46mJMn5tLE7s0v8cgxgzXqLBUK9+tBqzNvZ6LikY
X-Received: by 2002:a37:c203:: with SMTP id i3mr2955138qkm.155.1599854212147;
        Fri, 11 Sep 2020 12:56:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599854212; cv=none;
        d=google.com; s=arc-20160816;
        b=i9oSh2S8e3X/Ih/qVIgQgxvBMTecrevUSEyto41EuHf3FLhTOvRJUWRDrtZ9g733zQ
         EzB3g280qOHPDcxIQlJaLQ0I3aPVJkdenTi81AnJPy9+HYo7Uzvjm45mYemRzZN6IVOb
         AkD5NQ6ZBopX799fX9r8QfwUgV94px0cu+SVFJyEKjWgJZTG5nS9WVUmg4Rp43ABqbeK
         6Rfqtc4bIz5AXB4vFWyE/B8SPuO86GSlh5UCcc2i8tsBouFMCqEaq2oApiaifEyHQUhV
         4bJSERfcOkbiPcNIlW8DOX9xz2fpB8V6sONNqMhfbaoBNNvCKr7enUCEMfj02C6exzuS
         Mq0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=j3Jp32DOmEUKD+UFTzD+kq3uK4vmAci16OFio8uGAN0=;
        b=nbhfkI1e7cScbXUyB9vpOPKs0aUT6uQ7yk1RqRSJ6xcvD1OW6F5ffDGftHXct//OGt
         esyagjIiw0M0ns/HGN1d2XrPm8Ttg6UEx/W8A6UQA7pBvNdINCS/cyODe1QF/ZGrh5l8
         THF+xQIUOfyh/JCDlcoFaT7meYyj2i56EGP/n40q9henqXT/qSfVxXaGpyfu/Tbz03Rq
         bLsJvz+vWbejUmkvLcOueWEY9L1acMV3kSzDw2i4TxURpJuqXOuNmM/v4pHbCi+Iedjd
         4eZnFappjp1LNEKv6Shza98Hh80hQd6HVLJKq98pPVQYETlTrMhEzW+xTJLxMexXNlw3
         vITQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=EFdCCxQv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m18si1940261qtq.48.2020.09.11.12.56.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Sep 2020 12:56:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=EFdCCxQv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kGpAB-0004m9-Ea
	for alex.bennee@linaro.org; Fri, 11 Sep 2020 15:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1kGp9b-0004l4-M1; Fri, 11 Sep 2020 15:56:15 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:32992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1kGp9Y-0003lk-NA; Fri, 11 Sep 2020 15:56:15 -0400
Received: from [172.17.10.18] (unknown [172.17.10.18])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 0516921C1F;
 Fri, 11 Sep 2020 19:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1599854170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j3Jp32DOmEUKD+UFTzD+kq3uK4vmAci16OFio8uGAN0=;
 b=EFdCCxQvy3oXZTU8J0FIGvNRpmvl6DOjgbz27CdJoafXmobvVOmaqpHmynSCBBt5OJ2Fad
 t8XGWPCyP6xeZ3yGzRmsSzu6Pm9xW5I/at0Ec8zDnpmvAWy+oUukeEmFPZBcrBKKUJVe5Y
 uU3GqpEHk7NxJeO7aAgvxISzLHml3/0=
Subject: Re: [PATCH v5 4/7] hw/arm/aspeed: Add the 3 front LEDs drived by the
 PCA9552 #1
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200910205429.727766-1-f4bug@amsat.org>
 <20200910205429.727766-5-f4bug@amsat.org>
From: Luc Michel <luc.michel@greensocs.com>
Message-ID: <2b47f80b-0c4a-5715-af55-19c93c31e30a@greensocs.com>
Date: Fri, 11 Sep 2020 21:57:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200910205429.727766-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=luc.michel@greensocs.com; helo=beetle.greensocs.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/11 15:41:15
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.469,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WOHretqBmeTN

On 9/10/20 10:54 PM, Philippe Mathieu-Daudé wrote:
> The Witherspoon has 3 LEDs connected to a PCA9552. Add them.
> The names and reset values are taken from:
> https://github.com/open-power/witherspoon-xml/blob/master/witherspoon.xml
> 
> Example booting obmc-phosphor-image:
> 
>    $ qemu-system-arm -M witherspoon-bmc -trace led_change_intensity
>    1592693373.997015:led_change_intensity LED desc:'front-fault-4' color:green intensity 0% -> 100%
>    1592693373.997632:led_change_intensity LED desc:'front-power-3' color:green intensity 0% -> 100%
>    1592693373.998239:led_change_intensity LED desc:'front-id-5' color:green intensity 0% -> 100%
>    1592693500.291805:led_change_intensity LED desc:'front-power-3' color:green intensity 100% -> 0%
>    1592693500.312041:led_change_intensity LED desc:'front-power-3' color:green intensity 0% -> 100%
>    1592693500.821254:led_change_intensity LED desc:'front-power-3' color:green intensity 100% -> 0%
>    1592693501.331517:led_change_intensity LED desc:'front-power-3' color:green intensity 0% -> 100%
>    1592693501.841367:led_change_intensity LED desc:'front-power-3' color:green intensity 100% -> 0%
>    1592693502.350839:led_change_intensity LED desc:'front-power-3' color:green intensity 0% -> 100%
>    1592693502.861134:led_change_intensity LED desc:'front-power-3' color:green intensity 100% -> 0%
>    1592693503.371090:led_change_intensity LED desc:'front-power-3' color:green intensity 0% -> 100%
> 
> We notice the front-power LED starts to blink at a ~2Hz rate.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Luc Michel <luc.michel@greensocs.com>

> ---
>   hw/arm/aspeed.c | 20 ++++++++++++++++++++
>   hw/arm/Kconfig  |  1 +
>   2 files changed, 21 insertions(+)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 8bfb1c79ddc..83e322ea983 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -20,6 +20,7 @@
>   #include "hw/i2c/smbus_eeprom.h"
>   #include "hw/misc/pca9552.h"
>   #include "hw/misc/tmp105.h"
> +#include "hw/misc/led.h"
>   #include "hw/qdev-properties.h"
>   #include "qemu/log.h"
>   #include "sysemu/block-backend.h"
> @@ -521,9 +522,20 @@ static void sonorapass_bmc_i2c_init(AspeedMachineState *bmc)
>   
>   static void witherspoon_bmc_i2c_init(AspeedMachineState *bmc)
>   {
> +    static const struct {
> +        unsigned gpio_id;
> +        LEDColor color;
> +        const char *description;
> +        bool gpio_polarity;
> +    } pca1_leds[] = {
> +        {13, LED_COLOR_GREEN, "front-fault-4",  GPIO_POLARITY_ACTIVE_LOW},
> +        {14, LED_COLOR_GREEN, "front-power-3",  GPIO_POLARITY_ACTIVE_LOW},
> +        {15, LED_COLOR_GREEN, "front-id-5",     GPIO_POLARITY_ACTIVE_LOW},
> +    };
>       AspeedSoCState *soc = &bmc->soc;
>       uint8_t *eeprom_buf = g_malloc0(8 * 1024);
>       DeviceState *dev;
> +    LEDState *led;
>   
>       /* Bus 3: TODO bmp280@77 */
>       /* Bus 3: TODO max31785@52 */
> @@ -534,6 +546,14 @@ static void witherspoon_bmc_i2c_init(AspeedMachineState *bmc)
>                                   aspeed_i2c_get_bus(&soc->i2c, 3),
>                                   &error_fatal);
>   
> +    for (size_t i = 0; i < ARRAY_SIZE(pca1_leds); i++) {
> +        led = led_create_simple(OBJECT(bmc),
> +                                pca1_leds[i].gpio_polarity,
> +                                pca1_leds[i].color,
> +                                pca1_leds[i].description);
> +        qdev_connect_gpio_out(dev, pca1_leds[i].gpio_id,
> +                              qdev_get_gpio_in(DEVICE(led), 0));
> +    }
>       i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4), "tmp423", 0x4c);
>       i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 5), "tmp423", 0x4c);
>   
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index bc3a423940b..06ba1c355b1 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -394,6 +394,7 @@ config ASPEED_SOC
>       select TMP105
>       select TMP421
>       select UNIMP
> +    select LED
>   
>   config MPS2
>       bool
> 
