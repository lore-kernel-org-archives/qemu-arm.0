Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp386622ejf;
        Thu, 22 Feb 2024 22:20:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWmha98I8AyoXQGGNAF4k/GVo/dgWshzQyjzIVUYttsI4zfBNWC3PRwpHXVg57QgNRssnwVACpIAafFCMDEYhHeTAiYmO/N
X-Google-Smtp-Source: AGHT+IH2NtNvK/GJLmqp8dXN5wG9ZQ+AzgpPdA0xMCaNnXbENTlxOFDR5X8tNU47l66iG1MRAiD1
X-Received: by 2002:ac8:5bc1:0:b0:42e:6708:f923 with SMTP id b1-20020ac85bc1000000b0042e6708f923mr143016qtb.15.1708669225526;
        Thu, 22 Feb 2024 22:20:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708669225; cv=none;
        d=google.com; s=arc-20160816;
        b=de0C9cCpME+bPlQUwFyrWi+wH79Yrf3IDMFA241E0wZmTZRW1KpCGj9Ri9E2UqIMOd
         VXtgrBjvrBM9CwwEVXkn2PvwrycGqseuoNFpBnsWeGP4MiP56h7nWyz/Oq3/fO1bLZ9q
         V9X7tuF4AuGdLBVUM1YCzS55hkSpAsVe43vK9qxCZeAHcTdLy7Ysdo7vZaMEWsN4SMja
         FCERx3Wz+LHJv0OHBSO8KGzf+t0vZDIGUhYKhyEfgisYot+3sdY2MSpVig+XkGzrXB1E
         tCKlZezf76ZntgqtVZ6auPD54JhUlzOJNYQ34mGw6hpJj79RPI+t3xysEsjIYRu8TtiP
         Vwvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=wUumZKGyLOuOITajr0Qz1cjy849gVUQV7AnAAP66C44=;
        fh=x7KyJMxEm9BN3vIq5/tvQqp+UM9LcBYUPJOAZ3NYarc=;
        b=Fe3RkI85GzorzF7kJvx9yPqFWv6JBOx/6BETaNQ512Hi57CH2yFw193EMxDe3Pq+S1
         ctslcn/iweT9KGiawAlROekyaJZJdj3jXAfn4vkuXqdNgxjkdUeLI8ccPpLPAJro4lDz
         1OSnvR8gdyE4PM/IkmqMe8IiPUTsydPjFNzQ+gyvbiwWCIWIpF3AQJuKAYgW7iqfzm9l
         7kAgP0bgUqSpja2TnSlrIcqiQKYFnwC/lM/c/rsCZJ3Qhrz0u33go50Z1hyOsS+yyYSq
         3pMpLvNz9nOmInb1XwE2+E2fU/H9IsA8I/Cqvu3BhRbp+do32S5x2rb6oT98YK67W8ob
         WiHQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WxyxXFsU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y10-20020a05622a004a00b0042da7adb8aasi16063119qtw.267.2024.02.22.22.20.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Feb 2024 22:20:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WxyxXFsU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdOuw-0000I4-B1; Fri, 23 Feb 2024 01:20:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rdOuu-00008M-Q5
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 01:20:16 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rdOul-0008Mn-W0
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 01:20:16 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4128cfb6b6fso5735e9.0
 for <qemu-arm@nongnu.org>; Thu, 22 Feb 2024 22:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708669206; x=1709274006; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wUumZKGyLOuOITajr0Qz1cjy849gVUQV7AnAAP66C44=;
 b=WxyxXFsUIdNaSBhuKke/yEgqGdifcP05goRDucc+/W9MouC2uKrNAbYjVPjWb9hxeP
 ZwdBJDwHV6xljy6xV1qktRdJr9FmYgd4pHBmAiEYp9wzj69o+lO/UH89Bc2tU0WQnGHp
 H8pwCTQmuc7nG9uSIHM3W80ZTyNCBykR1GPFTmY93jv3jIuBL7EtKODvCxEntgEpv7Ew
 stdzH5of1BhjYZ9XUL28uUaRs8A6/j7+NPage5azLROCB5Wxrlv7RaKfCUSny6THVLqb
 V27wU6j0xAv17mS+IFr5nPe7PMiUyPd8jkbXEuV6GyIEnEugvV9xkSRRlLpz7QuOWTBe
 IkDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708669206; x=1709274006;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wUumZKGyLOuOITajr0Qz1cjy849gVUQV7AnAAP66C44=;
 b=Pl/ET1D930LdZQsDFDqVXpswvXRZkTKxiMI75ppX2Q4UsLaj6asS3HFYFn9ab1tYsz
 FWnZKb0v5BCiX8XZpCacNWrUzXiXuCJBH0kX4DSkOz/qryosi7ZKxoo+p481E6yjSel7
 j8d7Qsr60Yk0EcWZ20dChCK9wHzPuYGVgFoHLnPgtMkyPnHGEU2jOCV0qhg10HYF5yQv
 YNbPHcGvfN7H57aJ8bNB3AJhdboQEiOnv3gEd+9ntK2NGuRdSPPrgUc1j2+dyM/ltCsO
 GSMN58VETrIinIlMTfWIFWYH/L/Sa8BCXq/1rqxhoYQAYCAhsJlLI0n0QmjGw8IZL6DZ
 xsxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQEClsTqGl0TfpF7FYkdrLp7Nyuq48q+Gy6uXunZ6RSJmjuUb0LSH3D8suGavgQ1amROrSl8f1W9EOQ2ynpfBuQs/H
X-Gm-Message-State: AOJu0YwjggAlLxvDrGdiZJNtbjrrMnc7VNH1YNq187CjI36V2e8qbBRm
 NYMtQCabSlqncknyFxbM483GLJFA5+4T8516XoQh5aYzaj7qggQOIENXWayoePQ=
X-Received: by 2002:a05:600c:4589:b0:412:5df4:914e with SMTP id
 r9-20020a05600c458900b004125df4914emr548219wmo.0.1708669206109; 
 Thu, 22 Feb 2024 22:20:06 -0800 (PST)
Received: from [192.168.69.100] (sto95-h01-176-184-18-96.dsl.sta.abo.bbox.fr.
 [176.184.18.96]) by smtp.gmail.com with ESMTPSA id
 r11-20020a05600c458b00b004122aba0008sm1072010wmo.11.2024.02.22.22.20.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 22:20:05 -0800 (PST)
Message-ID: <6c7b96f8-3fe8-41ee-8aae-131874ff0764@linaro.org>
Date: Fri, 23 Feb 2024 07:20:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] hw/arm: Connect BSC to BCM2835 board as I2C0, I2C1
 and I2C2
Content-Language: en-US
To: Rayhan Faizel <rayhan.faizel@gmail.com>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, qemu-arm@nongnu.org
References: <20240220134120.2961059-1-rayhan.faizel@gmail.com>
 <20240220134120.2961059-3-rayhan.faizel@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240220134120.2961059-3-rayhan.faizel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
X-TUID: 86z7eOUon7n4

On 20/2/24 14:41, Rayhan Faizel wrote:
> BCM2835 has three I2C controllers. All of them share the same interrupt line.
> 
> Signed-off-by: Rayhan Faizel <rayhan.faizel@gmail.com>
> ---
>   hw/arm/Kconfig                       |  1 +
>   hw/arm/bcm2835_peripherals.c         | 32 +++++++++++++++++++++++++---
>   include/hw/arm/bcm2835_peripherals.h |  3 ++-
>   3 files changed, 32 insertions(+), 4 deletions(-)


> diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
> index d5573fd954..ca692ed9a5 100644
> --- a/hw/arm/bcm2835_peripherals.c
> +++ b/hw/arm/bcm2835_peripherals.c
> @@ -148,6 +148,14 @@ static void bcm2835_peripherals_init(Object *obj)
>       /* SPI */
>       object_initialize_child(obj, "bcm2835-spi0", &s->spi[0],
>                               TYPE_BCM2835_SPI);
> +
> +    /* I2C */
> +    object_initialize_child(obj, "bcm2835-i2c0", &s->i2c[0],
> +                            TYPE_BCM2835_I2C);
> +    object_initialize_child(obj, "bcm2835-i2c1", &s->i2c[1],
> +                            TYPE_BCM2835_I2C);
> +    object_initialize_child(obj, "bcm2835-i2c2", &s->i2c[2],
> +                            TYPE_BCM2835_I2C);
>   }
>   
>   static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
> @@ -418,14 +426,32 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
>                                                 BCM2835_IC_GPU_IRQ,
>                                                 INTERRUPT_SPI));
>   
> +    /* I2C */
> +    for (n = 0; n < 3; n++) {
> +        if (!sysbus_realize(SYS_BUS_DEVICE(&s->i2c[n]), errp)) {
> +            return;
> +        }
> +    }
> +
> +    memory_region_add_subregion(&s->peri_mr, BSC0_OFFSET,
> +            sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->i2c[0]), 0));
> +    memory_region_add_subregion(&s->peri_mr, BSC1_OFFSET,
> +            sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->i2c[1]), 0));
> +    memory_region_add_subregion(&s->peri_mr, BSC2_OFFSET,
> +            sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->i2c[2]), 0));
> +
> +    for (n = 0; n < 3; n++) {
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c[n]), 0,
> +                           qdev_get_gpio_in_named(DEVICE(&s->ic),
> +                                                  BCM2835_IC_GPU_IRQ,

Due to how QEMU IRQs are implemented, we can not wire multiple IRQs
to the same output without using an intermediate "OR gate". We model
it as TYPE_OR_IRQ. See the comment in "hw/qdev-core.h" added in
commit cd07d7f9f5 ("qdev: Document GPIO related functions"):

   * It is not valid to try to connect one outbound GPIO to multiple
   * qemu_irqs at once, or to connect multiple outbound GPIOs to the
   * same qemu_irq. (Warning: there is no assertion or other guard to
   * catch this error: the model will just not do the right thing.)
   * Instead, for fan-out you can use the TYPE_SPLIT_IRQ device: connect
   * a device's outbound GPIO to the splitter's input, and connect each
   * of the splitter's outputs to a different device.  For fan-in you
   * can use the TYPE_OR_IRQ device, which is a model of a logical OR
   * gate with multiple inputs and one output.

> +                                                  INTERRUPT_I2C));
> +    }
> +
>       create_unimp(s, &s->txp, "bcm2835-txp", TXP_OFFSET, 0x1000);
>       create_unimp(s, &s->armtmr, "bcm2835-sp804", ARMCTRL_TIMER0_1_OFFSET, 0x40);
>       create_unimp(s, &s->i2s, "bcm2835-i2s", I2S_OFFSET, 0x100);
>       create_unimp(s, &s->smi, "bcm2835-smi", SMI_OFFSET, 0x100);
>       create_unimp(s, &s->bscsl, "bcm2835-spis", BSC_SL_OFFSET, 0x100);
> -    create_unimp(s, &s->i2c[0], "bcm2835-i2c0", BSC0_OFFSET, 0x20);
> -    create_unimp(s, &s->i2c[1], "bcm2835-i2c1", BSC1_OFFSET, 0x20);
> -    create_unimp(s, &s->i2c[2], "bcm2835-i2c2", BSC2_OFFSET, 0x20);
>       create_unimp(s, &s->otp, "bcm2835-otp", OTP_OFFSET, 0x80);
>       create_unimp(s, &s->dbus, "bcm2835-dbus", DBUS_OFFSET, 0x8000);
>       create_unimp(s, &s->ave0, "bcm2835-ave0", AVE0_OFFSET, 0x8000);
