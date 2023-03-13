Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp7601ejb;
        Mon, 13 Mar 2023 00:53:55 -0700 (PDT)
X-Google-Smtp-Source: AK7set9imwdraoUtkpHV2o3cesani4f2giaHI4A6fucuwmV/wO7HS1KBcbCYvT4d6354vEyMxHPF
X-Received: by 2002:ac8:4e53:0:b0:3bf:ce18:a54b with SMTP id e19-20020ac84e53000000b003bfce18a54bmr55485181qtw.33.1678694034913;
        Mon, 13 Mar 2023 00:53:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678694034; cv=none;
        d=google.com; s=arc-20160816;
        b=qeyH1ituD/6XciVVnQ0zsIc3ijMVPnef0oXvLrTsDNzY6W14g/cIyLGY3hZ3sFgqQ0
         gnhVKRR6/Z977od6XGoi6bYj/WYYpXu5ORkU9wARnabkTKvG9mBMgGW93bBWHzy5Aadx
         9ws9y+iK5ECD9QtBqsUpukCW1e77mZFAgUJGQ2DMOSXlVTWnpp17OWNnqW8LEqonICx8
         xZ2fjkUqeySnbB1H5fx+OvGoE98Q/dsczq0pbkxsSdeRxhGJkJpxxdMCXVfqGuCf0/D+
         KCFcN1jjNULcchTe8K1IP7HXOU5W4lFlZZe3HR+ii+Z/zZCAf1sZKJ25/k8atKBJ/YeL
         pGlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=+e3Kv8o4k0K35KRb8HXZ4JLatmuTQTuEcqm+145Nv+I=;
        b=YJFvZfDWLuZ5EI4NfNi3a4jezXHl7983hO8YcqGwqkZoCu+4q/9t6tBqZDSJt+/4Sm
         vK4//Hdt5HUoutjvmOmA9EO0Lj3HggFubazoObdmXWhmrnrtH9aElsq4dDIvMGIwwxRd
         6Z3YSkIrXtxG6PQyFXARTovJhFwQDD6DljU2P13zhHkHMfERtDmvvBH8qNdLpu+rPhBP
         Jpd0fPA/0U1FcW7GiYcVU5kqDDtlD3agyoWEGROcBv1Ls2iCGtsVoIyLjor9vn3IJrHC
         tW5mvxKcBm0ViNnGOc9CsyGModaCC4ccq7/r7agslq88835M25ZVdSCgHdRbdCOpF3ZE
         lOpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="IGFuPC/l";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp40-20020a05622a1ba800b003b62d91fc84si5055025qtb.62.2023.03.13.00.53.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Mar 2023 00:53:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="IGFuPC/l";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pbd09-000440-HI; Mon, 13 Mar 2023 03:53:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbd06-00043Z-3O
 for qemu-arm@nongnu.org; Mon, 13 Mar 2023 03:53:46 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbczv-0003t4-F9
 for qemu-arm@nongnu.org; Mon, 13 Mar 2023 03:53:37 -0400
Received: by mail-wr1-x436.google.com with SMTP id l12so2065323wrm.10
 for <qemu-arm@nongnu.org>; Mon, 13 Mar 2023 00:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678694013;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+e3Kv8o4k0K35KRb8HXZ4JLatmuTQTuEcqm+145Nv+I=;
 b=IGFuPC/l9Z9T9SFEA4XyEJ3qZTB7qxJ+huHN04clw9AheQmZATiL+qHLVAW/SIPwCv
 XoualA+aSD7GwGre4cUMHp+lokaS3PJ1ivTPHeF+KrzsGx+/TfuVSBQ8uRteYm+FGSJz
 pvaaFtN0C8+zMOXy0X8RigR80W8alh/wsrzxBZVLmDN0k6Tu8u1k4aJyrh3+AzURzCEi
 GlTZVV2ygaKdZbXGqFfrpJmFkI5KYnJ5+18j5O/uoD/l34gvzqI3Z56jzWIWBAyjkctE
 oxdGuTI/ww59ybqrRBk9b55m2mBpaEzV/XTcgtDzMyTObJva7AYca4gTGZERA05wyT37
 a2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678694013;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+e3Kv8o4k0K35KRb8HXZ4JLatmuTQTuEcqm+145Nv+I=;
 b=aj/ntJyDQGuD/UsGYhpHBYHu/OuTGA36LOXfNNMWN/p3d9znlRUm/42Hmv/ZbCyeFf
 JWykk41Yv+zDPr7no6NtlyUpEuzRKXxzJ4oXBafBniSCbwoq2fiFCjJk+f06HqqkJVuT
 Sh1CXUe0NzTXiWrw5oTdM5ufajii7tAZLdZW33hOqRkA14b5aPDb8gAwFbLI8ieprRJ9
 xECvH0IiJjmfF6brA9xWAo4AssWUAM+tTljUOTQWupJNQ3x4QLoyx+P+kzT4pjobqrn6
 WWqRx3d1/jcDMCk+M1GJuFxLO/zfintLFsapkOcqGqldQyfj1B5+Hmb1SMT+yV+a/slK
 cgNQ==
X-Gm-Message-State: AO0yUKUXAbWOcDp55GzBqlS5Jqsv4LgKrN2xJqdD2x8yIajIJocKo4vr
 ft8++nhTyZbmrFsFaGzJCmabQw==
X-Received: by 2002:a5d:42d0:0:b0:2c7:6a6c:c72a with SMTP id
 t16-20020a5d42d0000000b002c76a6cc72amr21478420wrr.48.1678694013502; 
 Mon, 13 Mar 2023 00:53:33 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 g15-20020a5d488f000000b002c559843748sm7098574wrq.10.2023.03.13.00.53.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 00:53:32 -0700 (PDT)
Message-ID: <a63469d1-e163-43b2-c39c-c3b7c0a6eacc@linaro.org>
Date: Mon, 13 Mar 2023 08:53:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 3/4] hw/arm: Add WDT to Allwinner-H3 and Orangepi-PC
Content-Language: en-US
To: Strahinja Jankovic <strahinjapjankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
References: <20230311144111.30468-1-strahinja.p.jankovic@gmail.com>
 <20230311144111.30468-4-strahinja.p.jankovic@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230311144111.30468-4-strahinja.p.jankovic@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: lfMDajvhoEUL

Hi,

On 11/3/23 15:41, Strahinja Jankovic wrote:
> This patch adds WDT to Allwinner-H3 and Orangepi-PC.
> WDT is added as an overlay to the Timer module memory area.
> 
> Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
> ---
>   docs/system/arm/orangepi.rst  | 1 +
>   hw/arm/Kconfig                | 1 +
>   hw/arm/allwinner-h3.c         | 8 ++++++++
>   include/hw/arm/allwinner-h3.h | 5 ++++-
>   4 files changed, 14 insertions(+), 1 deletion(-)


> diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
> index 69d0ad6f50..f05afddf7e 100644
> --- a/hw/arm/allwinner-h3.c
> +++ b/hw/arm/allwinner-h3.c
> @@ -49,6 +49,7 @@ const hwaddr allwinner_h3_memmap[] = {
>       [AW_H3_DEV_OHCI3]      = 0x01c1d400,
>       [AW_H3_DEV_CCU]        = 0x01c20000,
>       [AW_H3_DEV_PIT]        = 0x01c20c00,
> +    [AW_H3_DEV_WDT]        = 0x01c20ca0,
>       [AW_H3_DEV_UART0]      = 0x01c28000,
>       [AW_H3_DEV_UART1]      = 0x01c28400,
>       [AW_H3_DEV_UART2]      = 0x01c28800,
> @@ -234,6 +235,8 @@ static void allwinner_h3_init(Object *obj)
>       object_initialize_child(obj, "twi1",  &s->i2c1,  TYPE_AW_I2C_SUN6I);
>       object_initialize_child(obj, "twi2",  &s->i2c2,  TYPE_AW_I2C_SUN6I);
>       object_initialize_child(obj, "r_twi", &s->r_twi, TYPE_AW_I2C_SUN6I);
> +
> +    object_initialize_child(obj, "wdt", &s->wdt, TYPE_AW_WDT_SUN6I);
>   }
>   
>   static void allwinner_h3_realize(DeviceState *dev, Error **errp)
> @@ -453,6 +456,11 @@ static void allwinner_h3_realize(DeviceState *dev, Error **errp)
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->r_twi), 0,
>                          qdev_get_gpio_in(DEVICE(&s->gic), AW_H3_GIC_SPI_R_TWI));
>   
> +    /* WDT */
> +    sysbus_realize(SYS_BUS_DEVICE(&s->wdt), &error_fatal);
> +    sysbus_mmio_map_overlap(SYS_BUS_DEVICE(&s->wdt), 0,
> +                            s->memmap[AW_H3_DEV_WDT], 1);

Why do you need to overlap?

