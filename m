Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1963486lfm;
        Sat, 20 Jun 2020 19:00:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyydJWWUEWw27dlbhSJCw4OEHkGmmMJ+PxYFOVdkQ/UHePFvnEyqgj13BcFQ0513gQsUkLX
X-Received: by 2002:a05:6902:68b:: with SMTP id i11mr17508702ybt.396.1592704843502;
        Sat, 20 Jun 2020 19:00:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592704843; cv=none;
        d=google.com; s=arc-20160816;
        b=EiH55Tq4IyJvkX9/84GRZgMGmb5ed3aH0i/uw3xKh/734ru+i4c47Bbo7tEK3Zu4fC
         bbv71Efi3rW+8DYraM38rs9iMqUFBmPl1kqXfhD4kHgstyJL4v0Wi2S8e/qBsRAJNwmN
         v4lz2iKungQtYduIQ4T3Shh/IhqD3BvVQrI+OlpEC+Qu+rRx1fnKGHE1ZkYsF/+CVrKh
         XGQ85fMNIt6ecPG/Oz/4TaI+3XiQnKmB7aAxPYQYIvnLT1L3wvyOo7BQqQo5RmK5Q6tg
         cdJWChq1vXKKlj/Hi+veBMeBeZDVZ4mwsU5CDa2GnurkKeEJ6+nCWSkYAteUfR5N+LLt
         J0VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Eu2ltL/J/UEiR6+pkgX4KilzggFxN5V/18+9DpZHl1w=;
        b=eEBk5pR/c1jep8fEcZQp47UYw5JUC2aJOzOwXxItnIyT/BmO/mENyhXk4Msl4QQGHT
         XRGFpgDwA/VQjkOC5SejQ1DrzaiBAUPST0U5rfCGabzxFLzzVvCvgHajutBjzEacJ1Bi
         UXZtbiK3tDjzUng+Jvzcslmdybn/FCRYiGjXdOq06Gdh+MQBcljt0oVsvOB9Y3QwZ97t
         32g9w0g31ps2OPs8A5V8U4gQ5AgqasHrWyGUSWOblMHpDJIU9c1hxJf+Wh/bOx60O80j
         CAyGJqnE63GuxzCuysFLKzxKDeskcEvaY8rBU4ebLPrFcT5+7osBDez8hjlilbIv3pqL
         RcdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mKnAOBum;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f13si9764727ybk.162.2020.06.20.19.00.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 20 Jun 2020 19:00:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mKnAOBum;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmpHm-00034j-Od
	for alex.bennee@linaro.org; Sat, 20 Jun 2020 22:00:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmpHd-00032v-AE
 for qemu-arm@nongnu.org; Sat, 20 Jun 2020 22:00:33 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:36633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmpHZ-0000xz-TO
 for qemu-arm@nongnu.org; Sat, 20 Jun 2020 22:00:33 -0400
Received: by mail-pg1-x544.google.com with SMTP id p3so3757392pgh.3
 for <qemu-arm@nongnu.org>; Sat, 20 Jun 2020 19:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Eu2ltL/J/UEiR6+pkgX4KilzggFxN5V/18+9DpZHl1w=;
 b=mKnAOBumxHCaSGrXEmoWPhXJiDVgLS8lp9145JmYNKOMjBT56La9CF0AcYw9npRRqA
 1SaoFPUDbAHMr9T9i788wu+6oqAV3qYCqxZ69Hjq6BWQUwZha8hnPD5jJPJVSKINysGj
 tZJw57PeWKBY3O8u4k1ViatbaN/3EYCHHDXFZjr1XiwlfUFmtKcWKDExBNaAUzk68mUl
 AE479Y3vZwQnlRb6uirS2I9xIVtX+z5NFxBwjucX0C5dXrKN8CCxeUMHwPRFzEerDwHH
 OSmawIo5llwJA+pQe5DJ8Ex3i3XlLHgapkSsWsCcTDupL8dJvQptRirl37/DBZpmEFB+
 qVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Eu2ltL/J/UEiR6+pkgX4KilzggFxN5V/18+9DpZHl1w=;
 b=Eq9oUBYxaLaKVeptoLTA9KyE1y26hWupnjoktNHRPLuSXwC1iJ2Z9jw+SdMtqJllLN
 fbc6cKSWeIwsxMxqp7ixnQ3WfQ81OZioUi98VRmmiHD5mREbAEuwCb/VP4jpGrQfpfcR
 ad3g3q8+/Al/9vtjfC6YtL8LK/RHgUVtMMHSJgNCduixueb/JUmej1GvX613btydi113
 0T8hHMhSIkedUFw15DI6DUjRFQG1B3posBpe7ADdAaMUBFTQ1KwuOrmAe8MTQ77AuUHi
 UCi5OUAO6tBLqWpHzAmdnuGfNAiBtf/Mt/CzLqLhZgdTuqwQ1Z+r2HQ7jHNWdYILRiZf
 g43A==
X-Gm-Message-State: AOAM531Eedf8psoD35k8RmA7xesq3ZE5aqK1KI+Wg8jRIQMg7bX4oeMH
 0LgdZZXAob2JdGE0+JMqxgl2cw==
X-Received: by 2002:a63:5b63:: with SMTP id l35mr7958823pgm.34.1592704828254; 
 Sat, 20 Jun 2020 19:00:28 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id j16sm1639455pgb.33.2020.06.20.19.00.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Jun 2020 19:00:27 -0700 (PDT)
Subject: Re: [PATCH v3 1/7] hw/misc: Add a LED device
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200620230719.32139-1-f4bug@amsat.org>
 <20200620230719.32139-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f2cc97dc-87c8-5cc8-e0fb-026cf80c25fa@linaro.org>
Date: Sat, 20 Jun 2020 19:00:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200620230719.32139-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5AiZCUtqDTHf

On 6/20/20 4:07 PM, Philippe Mathieu-Daudé wrote:
> Add a LED device which can be connected to a GPIO output.
> LEDs are limited to a set of colors.
> They can also be dimmed with PWM devices. For now we do
> not implement the dimmed mode, but in preparation of a
> future implementation, we start using the LED intensity.
> When used with GPIOs, the intensity can only be either
> minium or maximum. This depends of the polarity of the
> GPIO.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/hw/misc/led.h |  79 +++++++++++++++++++++++++++
>  hw/misc/led.c         | 121 ++++++++++++++++++++++++++++++++++++++++++
>  MAINTAINERS           |   6 +++
>  hw/misc/Kconfig       |   3 ++
>  hw/misc/Makefile.objs |   1 +
>  hw/misc/trace-events  |   3 ++
>  6 files changed, 213 insertions(+)
>  create mode 100644 include/hw/misc/led.h
>  create mode 100644 hw/misc/led.c
> 
> diff --git a/include/hw/misc/led.h b/include/hw/misc/led.h
> new file mode 100644
> index 0000000000..821ee1247d
> --- /dev/null
> +++ b/include/hw/misc/led.h
> @@ -0,0 +1,79 @@
> +/*
> + * QEMU single LED device
> + *
> + * Copyright (C) 2020 Philippe Mathieu-Daudé <f4bug@amsat.org>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#ifndef HW_MISC_LED_H
> +#define HW_MISC_LED_H
> +
> +#include "hw/qdev-core.h"
> +
> +#define TYPE_LED "led"
> +#define LED(obj) OBJECT_CHECK(LEDState, (obj), TYPE_LED)
> +
> +typedef enum {
> +    LED_COLOR_UNKNOWN,
> +    LED_COLOR_RED,
> +    LED_COLOR_ORANGE,
> +    LED_COLOR_AMBER,
> +    LED_COLOR_YELLOW,
> +    LED_COLOR_GREEN,
> +    LED_COLOR_BLUE,
> +    LED_COLOR_VIOLET, /* PURPLE */
> +    LED_COLOR_WHITE,
> +    LED_COLOR_COUNT
> +} LEDColor;

Is color especially interesting, given that we only actually "display" the
color via tracing?

> +/* Definitions useful when a LED is connected to a GPIO */
> +#define LED_RESET_INTENSITY_ACTIVE_LOW  UINT16_MAX
> +#define LED_RESET_INTENSITY_ACTIVE_HIGH 0U
> +
> +typedef struct LEDState {
> +    /* Private */
> +    DeviceState parent_obj;
> +    /* Public */
> +
> +    /* Properties */
> +    char *description;
> +    char *color;

The enumeration is unused by the actual device, it would seem?

> +/**
> + * led_set_intensity: set the state of a LED device
> + * @s: the LED object
> + * @is_on: boolean indicating whether the LED is emitting
> + *
> + * This utility is meant for LED connected to GPIO.
> + */
> +void led_set_state(LEDState *s, bool is_on);

Comment mismatch.


> +void led_set_intensity(LEDState *s, uint16_t new_intensity)
> +{
> +    trace_led_set_intensity(s->description ? s->description : "n/a",
> +                            s->color, new_intensity);

Why not default description upon reset/realize?

> +static void led_realize(DeviceState *dev, Error **errp)
> +{
> +    LEDState *s = LED(dev);
> +
> +    if (s->color == NULL) {
> +        error_setg(errp, "property 'color' not specified");
> +        return;
> +    }
> +}

Indeed, why not insist that description is set?  If a board is forced to say
that the led is red, should it not also be forced to label it?

> +static Property led_properties[] = {
> +    DEFINE_PROP_STRING("color", LEDState, color),

It would appear that one can set any color via properties, including "plaid".
So if you do want the char *color field, what's the point in the enum?

> +# led.c
> +led_set_intensity(const char *color, const char *desc, uint16_t intensity) "LED desc:'%s' color:%s intensity: 0x%04"PRIx16

Is 0...65535 the best set of intensities?
Is that more valuable than e.g. a percentage?


r~
