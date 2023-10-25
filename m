Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2719980ejb;
        Wed, 25 Oct 2023 06:01:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEh4X+4RWizvGX77qkBU1H9oI6iACLpJGRYuudvWNGtRaJPFW2mOvI9QXt3iLXOh/AFJ3ok
X-Received: by 2002:a05:651c:211d:b0:2bf:e61b:c980 with SMTP id a29-20020a05651c211d00b002bfe61bc980mr13183295ljq.8.1698238868326;
        Wed, 25 Oct 2023 06:01:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698238868; cv=none;
        d=google.com; s=arc-20160816;
        b=dyNhYwjgaMssrFo9U9suYOCb3MTolK9+HLxKdCtMgH6oiN82gnIW2pjb8l+1Cqfpro
         4g0a6RVQmHpMY3qHX7afWU/O9b1ej5tB6YugI8bN7hFfisKZDraU11Z6lGfWKZtDfpcJ
         Tcpcc2xvXusRhVyxN4BRis4ibd6itHAOzTE1RYC5IeBFwy907HMCTKBMz8urSr1Q7dfF
         INujIHMMz0wZQxm3zituBdO46c9szqeTKRx404uHKLrAvlwZ0oCoWh/Tbjf7JMKyLQWo
         QyjchyTPkflLdd+90IcSzRaN4OCc2Sko002pjLuTbGgmc+qwHFRfeBv6H73wh0LtjLrD
         FFjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=1OZjvdPUkJnBdzOo5qN/r9+7BQ/bPVu2nmeJmZHWKKw=;
        fh=8ZvqHR4zlDjBTNficCG8AmY6zPuCjMlCgUWPFQllnqw=;
        b=uZZf2O4zJeuK2/bAriERD2n3T8TtX25i9JPi63mSqCzeEiqqYa4scJx+rjIvst6UO2
         fNKHnzHIsg2utkKtO1sT9dy46vN6tOd9VUsl1/i8d1a5Kr3w5FpPA0Rqc/YaG5pA58PK
         aAJm/1qjIcNsHzwl8BzbX5vpNArFdxFqc3PikouKObpk/6vum0gsoMYOdTGM2aDmsfTM
         BU2jHqZxSM6QiYjqLWFXOFF++Qupp8qulfZz1CRwghB9oEUDZ/nB/Snwp6VEDG7vY8lC
         EN/MlDmrOQVI6YkCWkc+Da17yVa7uAA+BgGrlGrQGpRhEQoPLdg1BUxFeTePXrGrHWXV
         uugg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fpy1+h0A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w18-20020adfec52000000b003251303356asi7666218wrn.185.2023.10.25.06.01.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 06:01:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fpy1+h0A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvdUp-0001E0-Cj; Wed, 25 Oct 2023 09:00:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qvdUm-0001D0-JZ
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 09:00:24 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qvdUe-0001Mf-Nu
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 09:00:21 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-53d9f001b35so8515695a12.2
 for <qemu-arm@nongnu.org>; Wed, 25 Oct 2023 06:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698238812; x=1698843612; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1OZjvdPUkJnBdzOo5qN/r9+7BQ/bPVu2nmeJmZHWKKw=;
 b=Fpy1+h0AgphU1g5zry6tP8/gy7iDKKD3ajS06z+y6KDZOmfF65CZ+Dzy3+aYllH4O8
 VIT6YYVtHQV0NeaqtEKbglioy5jgDMvjPQTHiT4d4LOJy/ZFCNkcbbw7SInMaP23nNu7
 eOmM/LilArggjugseXNCc5nn1U4+Ro0L0lGSwin1//T4y2ErC7IcQgGOjRFTaPlYiFlu
 uSd4eeOzw2UVB0PBJG/Xjz4Q2TA67hEk/DWXsdmPKFOiLiB5IPrj/2wP+exsGGQbxKgH
 Xs/JGQnMf11BgSyopjYyRurVp+l6ikrzlJ7hP/E4IYXUpJZ4rbxR1DUDwLoAI19zTEDt
 OZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698238812; x=1698843612;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1OZjvdPUkJnBdzOo5qN/r9+7BQ/bPVu2nmeJmZHWKKw=;
 b=SSqE6JbQ3ZWQQBiV9MuuzISQNRtYDb7iOuhB3PomVIEihh6DWXmZqPFKEmmABN2QPC
 9tn/aj9dLcKPdGHqDNJULtVvN4ua9oV5ujj8ZdoF8RMbVzlqBtvaAwVDFP36mcTpwN2/
 NuIQilAuTlEmgepGFH43uz39av7yyV6RkLG2rvWwyfG9yELb+iXPI9zBTdAHo40FFanx
 9wi8h3siB4HwguAuhTRlU71KtePhV9ZGd/TXgbUF1VJWAl0xgbTRnnZpfDEdUI1SviLC
 yOQ8ViCBWx7ZD2ShfRi7vnKsB0sdw/gxDAiTwif3TTRWuzT/NQHiDsepoIk0H/KQdjp/
 Ni0Q==
X-Gm-Message-State: AOJu0YwX9tk2fAI4lHw2VgHqeJa6Tk8lBD5z8gPnGj0tTgfMF6Hc0q9Z
 WUW1NLpOyqtkkUR0+aMbX8MBGrgXMz6EmqKySuPwxQ==
X-Received: by 2002:a05:6402:5243:b0:53d:a4a3:e5cc with SMTP id
 t3-20020a056402524300b0053da4a3e5ccmr10851369edd.42.1698238811900; Wed, 25
 Oct 2023 06:00:11 -0700 (PDT)
MIME-Version: 1.0
References: <20231024191945.4135036-1-milesg@linux.vnet.ibm.com>
In-Reply-To: <20231024191945.4135036-1-milesg@linux.vnet.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 25 Oct 2023 13:59:25 +0100
Message-ID: <CAFEAcA-9mPtVWfpx=fbALZEaOPX6b5aEAtcRgDCpzfH4keLEcQ@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND] misc/led: LED state is set opposite of what is
 expected
To: Glenn Miles <milesg@linux.vnet.ibm.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, clg@kaod.org, 
 andrew@codeconstruct.com.au, joel@jms.id.au, philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: uO2gBZABdBB+

On Tue, 24 Oct 2023 at 20:20, Glenn Miles <milesg@linux.vnet.ibm.com> wrote:
>
> Testing of the LED state showed that when the LED polarity was
> set to GPIO_POLARITY_ACTIVE_LOW and a low logic value was set on
> the input GPIO of the LED, the LED was being turn off when it was
> expected to be turned on.
>
> Signed-off-by: Glenn Miles <milesg@linux.vnet.ibm.com>
> ---
>
> Changes from v1:
>     - Changed logic for readability
>
>  hw/misc/led.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/misc/led.c b/hw/misc/led.c
> index f6d6d68bce..42bb43a39a 100644
> --- a/hw/misc/led.c
> +++ b/hw/misc/led.c
> @@ -63,7 +63,7 @@ static void led_set_state_gpio_handler(void *opaque, int line, int new_state)
>      LEDState *s = LED(opaque);
>
>      assert(line == 0);
> -    led_set_state(s, !!new_state != s->gpio_active_high);
> +    led_set_state(s, !!new_state == s->gpio_active_high);
>  }
>
>  static void led_reset(DeviceState *dev)
> --
> 2.31.1

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
