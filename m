Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp2429944ejg;
        Mon, 22 Jan 2024 03:33:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzIAz3WrFzJctPY5r15d5Uf/RBZDK7KDFRpWEOGBPhl42jmzUL5FpCfqmRpjQUdHOvvpW5
X-Received: by 2002:a05:6808:2f1b:b0:3bd:1fdc:eeaa with SMTP id gu27-20020a0568082f1b00b003bd1fdceeaamr7463253oib.55.1705923182073;
        Mon, 22 Jan 2024 03:33:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705923182; cv=none;
        d=google.com; s=arc-20160816;
        b=xYWqfRArSRHOFk5EUYFoATQ65qFjncXOAR9/H7+SPcYYRk3pXFhTkK4pEfpEQ4ITcZ
         tW73wJzwaZ+lA34KhLBpXlj/+G4fszRtaK+Bn+3gJC2/b/7d28nyfUlt9zDLiTjKmBek
         D686V49m9tfxNSTzG5qT1q10V4rBtZ0gejqI8BBs+pWnmgIbSIk6qtAGTdZRIKRY8t3P
         EWx0mhN44fDJVsPTyYvcgr5OIo19LYAMnOUOI2obJCh0Un95hUV/lsU/Qu/Tl15WqJ/l
         6D1HFxwpjY8tvFYaVhYkw/uRyHSHvTctBSG3O5JviJij4CItJbe7EoBWlt45Dp3YWXVz
         cJwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Spj1DEQ3yDjTcC3IiWC7nEQw5VCoZYJNLSP2vwP4t8U=;
        fh=Z3N10gw6mJnMT3ieT6+4ImP8OKl+uYykn1JJpSPdLyQ=;
        b=n+nl1ySKpu5hCTUeadqs0FUn+g4/QIbB0YesZA+9qO6WaoXp+5o30Xl1c5S7RzX45z
         QdfLkDaLBkTPq/bNXaMniB0COcjQEyhGo022Ys71oNuhFaf/7I8wWTCOhhBORiT1ol6f
         wInuMzYTgy4B55j99h6cbZwVTvKKZC/YLTq+TfD0hQqgM3sMgrRyxpx2sERd91rA+rEf
         rXlemTTk01hBghx4bVrD8QWNu2EqCnBdERlQCKY3Fdk8AvGUWGU1U8Y+aT9Y0AMbkjnL
         /UzXdZO1L1qj8t8L1X0fMAkZieGGed45tGsUP9gZyqMec3wk5clS5UGchN/Gci2bNOBO
         tKWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="O5RBX/ET";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i2-20020ac85c02000000b0042a2f5563a2si5209911qti.466.2024.01.22.03.33.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jan 2024 03:33:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="O5RBX/ET";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rRsXh-0008P4-CK; Mon, 22 Jan 2024 06:32:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rRsXe-0008Ob-Oc
 for qemu-arm@nongnu.org; Mon, 22 Jan 2024 06:32:38 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rRsXc-0001cW-SZ
 for qemu-arm@nongnu.org; Mon, 22 Jan 2024 06:32:38 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-339208f5105so2644922f8f.1
 for <qemu-arm@nongnu.org>; Mon, 22 Jan 2024 03:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705923155; x=1706527955; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Spj1DEQ3yDjTcC3IiWC7nEQw5VCoZYJNLSP2vwP4t8U=;
 b=O5RBX/ETcKylqELG5zgoyrDWzvpmzIEbh6ABM8wQ7NKHLtRqOOR/jWfBA9FQxGHAIb
 +Bf7V8FYPYYyXWQMcXVTYp2jpuUbM5WX4wK6Kyo12rwv2CHeVv4JJYtgBhrHXvo3HwFO
 LtJQRMK2GXXzVIpUTLDaA3xTWTZqkqND4U5X75572/Ll6BPDLqjlnh0ItKWtMILhpksj
 XdqX1XVQTFT6UIoa1bYicNOHZWoqIFNyLJlLRWTKHvhaeis3kIwvSwBKE/tl9DshawXw
 WEA0Mo2mAN1KGeb37tRx2rlAvrVABML77uXAY+JbfQ3yk8S4mpxUIvFIqowY2CkLHGMo
 Ymcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705923155; x=1706527955;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Spj1DEQ3yDjTcC3IiWC7nEQw5VCoZYJNLSP2vwP4t8U=;
 b=TjDGIiWvo0lDumkKz3DwLjO+LyErkvltAg2Y51rQiV+V66XE/a+UKVZfa4qZWaZBK4
 7OOVFP4jSV6mtIAqBUeWWWkCgCHk+NoxkWs9ui24kev13ySKK9n946Gt7qqVxRmfbcoj
 Q8yy3gsyb19B7P4cugqUq9pG5e5yEPAkKKhnrk6lc2vr39GYPd5Z4SV4F507CCrswxMl
 J0RKGc0adNJx+LGE025ntDy3/K+IOsnmQEAHurZm45Q+b1z+D9+LKXx0c8/bcT9BgEmT
 +B1BJIVCJVuYvDowRGWqL0VNw0fN48jppaqo/KqL2416j6ecR+14UZTenvfRGCr4npR0
 qIpA==
X-Gm-Message-State: AOJu0Yy3JIgvrj2ruj2zrNbWdHc8CYGENEBToPCt0lGjxaNz/ih8G3qz
 p5phuj47eimq6iBWM3zpq7iNvi68dvn07BvxnoN3CXY6bF7ft+22OExqBphiEYA=
X-Received: by 2002:a5d:6186:0:b0:337:c700:460e with SMTP id
 j6-20020a5d6186000000b00337c700460emr1556519wru.160.1705923154983; 
 Mon, 22 Jan 2024 03:32:34 -0800 (PST)
Received: from [192.168.149.175] ([92.88.171.62])
 by smtp.gmail.com with ESMTPSA id
 y3-20020adfee03000000b003368c8d120fsm13662931wrn.7.2024.01.22.03.32.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jan 2024 03:32:34 -0800 (PST)
Message-ID: <3f2bbcb1-9552-46e1-8bd9-de3e626d0de6@linaro.org>
Date: Mon, 22 Jan 2024 12:32:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] hw/gpio: Implement STM32L4x5 GPIO
Content-Language: en-US
To: =?UTF-8?Q?In=C3=A8s_Varhol?= <ines.varhol@telecom-paris.fr>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20240122092005.30556-1-ines.varhol@telecom-paris.fr>
 <20240122092005.30556-2-ines.varhol@telecom-paris.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240122092005.30556-2-ines.varhol@telecom-paris.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: AmFppwPxs6zM

Hello Inès,

On 22/1/24 10:18, Inès Varhol wrote:
> Features supported :
> - the 8 STM32L4x5 GPIOs are initialized with their reset values
>      (except IDR, see below)
> - input mode : setting a pin in input mode "externally" (using input
>      irqs) results in an out irq (transmitted to SYSCFG)
> - output mode : setting a bit in ODR sets the corresponding out irq
>      (if this line is configured in output mode)
> - pull-up, pull-down
> - push-pull, open-drain
> 
> Difference with the real GPIOs :
> - Alternate Function and Analog mode aren't implemented :
>      pins in AF/Analog behave like pins in input mode
> - floating pins stay at their last value
> - register IDR reset values differ from the real one :
>      values are coherent with the other registers reset values
>      and the fact that AF/Analog modes aren't implemented
> - setting I/O output speed isn't supported
> - locking port bits isn't supported
> - ADC function isn't supported
> - GPIOH has 16 pins instead of 2 pins
> - writing to registers LCKR, AFRL, AFRH and ASCR is ineffective
> 
> Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
> Signed-off-by: Inès Varhol <ines.varhol@telecom-paris.fr>
> ---
>   MAINTAINERS                        |   1 +
>   docs/system/arm/b-l475e-iot01a.rst |   2 +-
>   hw/gpio/Kconfig                    |   3 +
>   hw/gpio/meson.build                |   1 +
>   hw/gpio/stm32l4x5_gpio.c           | 537 +++++++++++++++++++++++++++++
>   hw/gpio/trace-events               |   6 +
>   include/hw/gpio/stm32l4x5_gpio.h   |  80 +++++
>   7 files changed, 629 insertions(+), 1 deletion(-)
>   create mode 100644 hw/gpio/stm32l4x5_gpio.c
>   create mode 100644 include/hw/gpio/stm32l4x5_gpio.h


> +static void stm32l4x5_gpio_a_class_init(ObjectClass *klass, void *data)
> +{
> +    Stm32l4x5GpioClass *sc = STM32L4X5_GPIO_CLASS(klass);
> +
> +    sc->moder_reset = 0xABFFFFFF;
> +    sc->ospeedr_reset = 0x0C000000;
> +    sc->pupdr_reset = 0x64000000;
> +}
> +
> +static void stm32l4x5_gpio_b_class_init(ObjectClass *klass, void *data)
> +{
> +    Stm32l4x5GpioClass *sc = STM32L4X5_GPIO_CLASS(klass);
> +
> +    sc->moder_reset = 0xFFFFFEBF;
> +    sc->ospeedr_reset = 0x00000000;
> +    sc->pupdr_reset = 0x00000100;
> +}
> +
> +static void stm32l4x5_gpio_c_class_init(ObjectClass *klass, void *data)
> +{
> +    Stm32l4x5GpioClass *sc = STM32L4X5_GPIO_CLASS(klass);
> +
> +    sc->moder_reset = 0xFFFFFFFF;
> +    sc->ospeedr_reset = 0x00000000;
> +    sc->pupdr_reset = 0x00000000;
> +}
> +
> +static void stm32l4x5_gpio_d_class_init(ObjectClass *klass, void *data)
> +{
> +    Stm32l4x5GpioClass *sc = STM32L4X5_GPIO_CLASS(klass);
> +
> +    sc->moder_reset = 0xFFFFFFFF;
> +    sc->ospeedr_reset = 0x00000000;
> +    sc->pupdr_reset = 0x00000000;
> +}
> +
> +static void stm32l4x5_gpio_e_class_init(ObjectClass *klass, void *data)
> +{
> +    Stm32l4x5GpioClass *sc = STM32L4X5_GPIO_CLASS(klass);
> +
> +    sc->moder_reset = 0xFFFFFFFF;
> +    sc->ospeedr_reset = 0x00000000;
> +    sc->pupdr_reset = 0x00000000;
> +}
> +
> +static void stm32l4x5_gpio_f_class_init(ObjectClass *klass, void *data)
> +{
> +    Stm32l4x5GpioClass *sc = STM32L4X5_GPIO_CLASS(klass);
> +
> +    sc->moder_reset = 0xFFFFFFFF;
> +    sc->ospeedr_reset = 0x00000000;
> +    sc->pupdr_reset = 0x00000000;
> +}
> +
> +static void stm32l4x5_gpio_g_class_init(ObjectClass *klass, void *data)
> +{
> +    Stm32l4x5GpioClass *sc = STM32L4X5_GPIO_CLASS(klass);
> +
> +    sc->moder_reset = 0xFFFFFFFF;
> +    sc->ospeedr_reset = 0x00000000;
> +    sc->pupdr_reset = 0x00000000;
> +}
> +
> +static void stm32l4x5_gpio_h_class_init(ObjectClass *klass, void *data)
> +{
> +    Stm32l4x5GpioClass *sc = STM32L4X5_GPIO_CLASS(klass);
> +
> +    sc->moder_reset = 0x0000000F;
> +    sc->ospeedr_reset = 0x00000000;
> +    sc->pupdr_reset = 0x00000000;
> +}
> +
> +static const TypeInfo stm32l4x5_gpio_types[] = {
> +    {
> +        .name = TYPE_STM32L4X5_GPIO,
> +        .parent = TYPE_SYS_BUS_DEVICE,
> +        .instance_size = sizeof(Stm32l4x5GpioState),
> +        .instance_init = stm32l4x5_gpio_init,
> +        .class_size     = sizeof(Stm32l4x5GpioClass),
> +        .class_init = stm32l4x5_gpio_class_init,
> +        .abstract = true,
> +    }, {
> +        .name = TYPE_STM32L4X5_GPIO_A,
> +        .parent = TYPE_STM32L4X5_GPIO,
> +        .class_init = stm32l4x5_gpio_a_class_init,
> +    }, {
> +        .name = TYPE_STM32L4X5_GPIO_B,
> +        .parent = TYPE_STM32L4X5_GPIO,
> +        .class_init = stm32l4x5_gpio_b_class_init,
> +    }, {
> +        .name = TYPE_STM32L4X5_GPIO_C,
> +        .parent = TYPE_STM32L4X5_GPIO,
> +        .class_init = stm32l4x5_gpio_c_class_init,
> +    }, {
> +        .name = TYPE_STM32L4X5_GPIO_D,
> +        .parent = TYPE_STM32L4X5_GPIO,
> +        .class_init = stm32l4x5_gpio_d_class_init,
> +    }, {

My understanding is the same GPIO block is used for the STM32L4*
family, and the reset values are specific to each SoC.

Therefore I'd keep a generic GPIO model in this file, and set the
reset values in stm32l4x5_soc.c, likely stm32l4x5_soc_realize().

Something like:

static const struct {
     uint32_t moder;
     uint32_t ospeedr;
     uint32_t pupdr;
} stm32l4x5_gpio_initval[NUM_GPIOS] = {
     { 0xABFFFFFF, 0x0C000000, 0x64000000 },
     { 0xFFFFFEBF, 0x00000000, 0x00000100 },
     { 0xFFFFFFFF, 0x00000000, 0x00000000 },
     ...
};

   for (unsigned i = 0; i < NUM_GPIOS; i++) {
       DeviceState *dev = DEVICE(&s->gpio[i]);
       g_autofree char *name = g_strdup_printf("%c", 'A' + i);

       qdev_prop_set_string(dev, "name", name);
       qdev_prop_set_uint32(dev, "mode-reset",
                            stm32l4x5_gpio_initval[i].moder);
       qdev_prop_set_uint32(dev, "ospeed-reset",
                            stm32l4x5_gpio_initval[i].ospeedr);
       qdev_prop_set_uint32(dev, "pupd-reset",
                            stm32l4x5_gpio_initval[i].pupdr);
       ...
   }

(Having "mode-reset", "ospeed-reset", "pupd-reset" exposed as
  DEFINE_PROP_UINT32() properties).

Regards,

Phil.
