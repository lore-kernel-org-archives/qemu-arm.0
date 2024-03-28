Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp1234345ejv;
        Thu, 28 Mar 2024 09:07:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVntgq83fYnbIbqOFcB0zBb2/2XuhZJAt4ludNVc+VP8qBQZw2mXhvdzirb/OxV/zQwtIeE0kbWZ3GmFoPRIox8i3wuJ7XW
X-Google-Smtp-Source: AGHT+IF4UEATui1v6rkHYbUBaBjajVoZuTNWhlONjYd7ZWB8oPCGx8Q5g7UN74R4WfQsg4pZTDZo
X-Received: by 2002:a05:6102:3652:b0:478:303b:45e3 with SMTP id s18-20020a056102365200b00478303b45e3mr2992654vsu.6.1711642024442;
        Thu, 28 Mar 2024 09:07:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711642024; cv=none;
        d=google.com; s=arc-20160816;
        b=0MN/jK3QpjoGIbz4vxGmmsJBsErofgN8tnNIQ6D5tCrS4z8XAJH3hofmrHRXKzKf3n
         VcEIVA5JHqmuebdva8/Pay8N/mGeKdBtjMdBeRjP9lKsRJNFa+st2NSmel+o7zy5Tvru
         xjBOKr4JB4RrrPAdhEEmE/wznHHmP7B59e8ZUIWnZNXq4nQ9fkBTP/Z7JEyB7vY0uh7Z
         OcAHumYel0FO4LqgPLKLFDQwfUlD9Z+7kVQsvADlsOXiBZvChOg683UsGVOIrMDhp8Ye
         u9q3JKA+szntIBARDUBV9k3T/jtHGvT2F7VbDGC8XGjxaZKs/TylbzyUWUvrWcyOBWiV
         V7WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=NyTol4klR46/tcVPVfGK0GfXwUzLzNbwBfnnH5hahPE=;
        fh=i8it1D0tg2X975/2QdWys4PABOK07FiiEGbl7UTh+KI=;
        b=Jhrn4TSaTZAZEZ+K+1CGuBJAnJLXKuSF6+YvYx1S1SpAYE9dRR3k3emK+U+gH/9ZsP
         5+/HNvbBk89TVXAf+dL1O/FKrYc71uqhYcv+gzhJbh/5VL9LePfvu8RKuwnB6KD/LAc8
         N71Fvk4d5WQs69tVprOMUP+iYkm0jqWheu97i0o4wU6CBrKTpdLPYC5FjEZaW+miBxqo
         W+3QURqBpUn0vUcj2+1DPi0Mhupcw8HnShl8W3nQa8Qg9I5nqc6JlqIlLFlJK3V/tZk5
         uf11CpZVnJU4shfvmO+532VrO5AjL+Y+DWHANVrpIj2Fa/9KVEjRquT3HYIBDPuvVxPg
         JF+g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XGNau89O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bl32-20020a05610250a000b004783e24ad67si300137vsb.81.2024.03.28.09.07.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Mar 2024 09:07:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XGNau89O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rpsGy-0000tf-89; Thu, 28 Mar 2024 12:06:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rpsGw-0000tG-P5
 for qemu-arm@nongnu.org; Thu, 28 Mar 2024 12:06:34 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rpsGu-000561-Ht
 for qemu-arm@nongnu.org; Thu, 28 Mar 2024 12:06:34 -0400
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-512bde3d197so805179e87.0
 for <qemu-arm@nongnu.org>; Thu, 28 Mar 2024 09:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711641990; x=1712246790; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NyTol4klR46/tcVPVfGK0GfXwUzLzNbwBfnnH5hahPE=;
 b=XGNau89Os7FzyCLvQlYkGMczN0DA2DhytF8zHNc8vBfLxu3hqAf45Dm8ZkxQg6dYxm
 xO+3M28uGjmIds+DBSQWV1+HnZnEogiaW+NJB3i0Txcm8x+URkkYEU0+aWQljPBb46z1
 nzH3KZDeMNp158QxybaKE2SRJ3X1zE+4xNloAS2s55yACnO+yvTw9InO+rM1h9hgGkl5
 O3lYGWsLWVGaxsp5HASkHmKf4ufEE784BBxRcsnjq0w0iKPsAvDNL0RWnTetMeRYf23y
 7ZZlTjU0N7lGGnEPcj7YtCW7IMEXW35hfzTH/Q+qwPdYQ1AsirK+jLXo3r7wt1Q7zSrk
 2Ycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711641990; x=1712246790;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NyTol4klR46/tcVPVfGK0GfXwUzLzNbwBfnnH5hahPE=;
 b=UgDU9G03pthuZvZB8ym7Hf2q6buA6tobbOxJoFjJgsWs35xjIcInZaWmz1LDtQ31AO
 Rf2X4ohcvI4JSi7OVAo7juxWFIZa/W1i9Pthr+o85DZl8c8NR2S3aLO5T7anR4MJ4AQ7
 UdYGqcA0EtTqykmfUOqxGUiSk0jfTsL0DZcdtmfI8w5JiZj+FzLdNSxRXwKDf1D86SyO
 9HNZbxA/9wOC9vNJApZl0sSPHN9dZYimQA073Y6IGvu199yGaRKpeLg7xouZG9SCzbl4
 ZIBmrVC03Zl/6jfmGYvtPYJ+tJbG8p1ftQ4jfZtYFjAY2JTQQvgph0TTa88/4Xu1xpQV
 Sz1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUo/TO8leJXg/g6H6wXzqMRZLbqbSWxLhRPUwutEO5nLOXXQPA+ZAtuQtVr/0q9WI9FmqXOH9e7sqT5A5/w9uy+FyGH
X-Gm-Message-State: AOJu0YwpltbGaWE3Pfd2X6q4EGfdABVOPpzLHBTLWGm/JaDq7h3Xae/y
 VeGQ6bEWzTPGUjInqo0nfU8IkSfE5drFqgpiiSu2w/AN+BoQaoIYZLv7hhyZMnUmFnvtCt0LaJy
 ynoc1EmHYaeAvwiOAoy3/obKzdm0duHjiFo8zKQ==
X-Received: by 2002:a05:6512:313c:b0:513:ccd1:563e with SMTP id
 p28-20020a056512313c00b00513ccd1563emr2495049lfd.8.1711641990279; Thu, 28 Mar
 2024 09:06:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240324165545.201908-1-arnaud.minier@telecom-paris.fr>
 <20240324165545.201908-6-arnaud.minier@telecom-paris.fr>
In-Reply-To: <20240324165545.201908-6-arnaud.minier@telecom-paris.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Mar 2024 16:06:19 +0000
Message-ID: <CAFEAcA9p14NBVUXp1pZGEZndK9VGBn+26DZz=M5r5t0ZGcJcog@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] hw/arm: Add the USART to the stm32l4x5 SoC
To: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>, 
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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
X-TUID: edMmefYKPIjI

On Sun, 24 Mar 2024 at 16:57, Arnaud Minier
<arnaud.minier@telecom-paris.fr> wrote:
>
> Add the USART to the SoC and connect it to the other implemented devices.
>
> Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
> Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
> ---
>  docs/system/arm/b-l475e-iot01a.rst |  2 +-
>  hw/arm/Kconfig                     |  1 +
>  hw/arm/stm32l4x5_soc.c             | 82 +++++++++++++++++++++++++++---
>  include/hw/arm/stm32l4x5_soc.h     | 13 +++++
>  4 files changed, 91 insertions(+), 7 deletions(-)
>
> diff --git a/docs/system/arm/b-l475e-iot01a.rst b/docs/system/arm/b-l475e=
-iot01a.rst
> index 0afef8e4f4..a76c9976c5 100644
> --- a/docs/system/arm/b-l475e-iot01a.rst
> +++ b/docs/system/arm/b-l475e-iot01a.rst
> @@ -19,13 +19,13 @@ Currently B-L475E-IOT01A machine's only supports the =
following devices:
>  - STM32L4x5 SYSCFG (System configuration controller)
>  - STM32L4x5 RCC (Reset and clock control)
>  - STM32L4x5 GPIOs (General-purpose I/Os)
> +- STM32L4x5 USARTs, UARTs and LPUART (Serial ports)
>
>  Missing devices
>  """""""""""""""
>
>  The B-L475E-IOT01A does *not* support the following devices:
>
> -- Serial ports (UART)
>  - Analog to Digital Converter (ADC)
>  - SPI controller
>  - Timer controller (TIMER)
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 893a7bff66..098d043375 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -477,6 +477,7 @@ config STM32L4X5_SOC
>      select STM32L4X5_SYSCFG
>      select STM32L4X5_RCC
>      select STM32L4X5_GPIO
> +    select STM32L4X5_USART
>
>  config XLNX_ZYNQMP_ARM
>      bool
> diff --git a/hw/arm/stm32l4x5_soc.c b/hw/arm/stm32l4x5_soc.c
> index 40e294f838..ae0868dcab 100644
> --- a/hw/arm/stm32l4x5_soc.c
> +++ b/hw/arm/stm32l4x5_soc.c
> @@ -28,6 +28,7 @@
>  #include "sysemu/sysemu.h"
>  #include "hw/or-irq.h"
>  #include "hw/arm/stm32l4x5_soc.h"
> +#include "hw/char/stm32l4x5_usart.h"
>  #include "hw/gpio/stm32l4x5_gpio.h"
>  #include "hw/qdev-clock.h"
>  #include "hw/misc/unimp.h"
> @@ -116,6 +117,22 @@ static const struct {
>      { 0x48001C00, 0x0000000F, 0x00000000, 0x00000000 },
>  };
>
> +static const hwaddr usart_addr[] =3D {
> +    0x40013800, /* "USART1", 0x400 */
> +    0x40004400, /* "USART2", 0x400 */
> +    0x40004800, /* "USART3", 0x400 */
> +};
> +static const hwaddr uart_addr[] =3D {
> +    0x40004C00, /* "UART4" , 0x400 */
> +    0x40005000  /* "UART5" , 0x400 */
> +};
> +
> +#define LPUART_BASE_ADDRESS 0x40008000
> +
> +static const int usart_irq[] =3D { 37, 38, 39 };
> +static const int uart_irq[] =3D { 52, 53 };
> +#define LPUART_IRQ 70
> +
>  static void stm32l4x5_soc_initfn(Object *obj)
>  {
>      Stm32l4x5SocState *s =3D STM32L4X5_SOC(obj);
> @@ -132,6 +149,18 @@ static void stm32l4x5_soc_initfn(Object *obj)
>          g_autofree char *name =3D g_strdup_printf("gpio%c", 'a' + i);
>          object_initialize_child(obj, name, &s->gpio[i], TYPE_STM32L4X5_G=
PIO);
>      }
> +
> +    for (int i =3D 0; i < STM_NUM_USARTS; i++) {
> +        object_initialize_child(obj, "usart[*]", &s->usart[i],
> +                                TYPE_STM32L4X5_USART);
> +    }
> +
> +    for (int i =3D 0; i < STM_NUM_UARTS; i++) {
> +        object_initialize_child(obj, "uart[*]", &s->uart[i],
> +                                TYPE_STM32L4X5_UART);
> +    }
> +    object_initialize_child(obj, "lpuart1", &s->lpuart,
> +                            TYPE_STM32L4X5_LPUART);
>  }
>
>  static void stm32l4x5_soc_realize(DeviceState *dev_soc, Error **errp)
> @@ -279,6 +308,53 @@ static void stm32l4x5_soc_realize(DeviceState *dev_s=
oc, Error **errp)
>      sysbus_mmio_map(busdev, 0, RCC_BASE_ADDRESS);
>      sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(armv7m, RCC_IRQ));
>
> +    /* USART devices */
> +    for (int i =3D 0; i < STM_NUM_USARTS; i++) {
> +        dev =3D DEVICE(&(s->usart[i]));
> +        qdev_prop_set_chr(dev, "chardev", serial_hd(i));
> +        g_autofree char *name =3D g_strdup_printf("usart%d-out", i + 1);

Variable declarations should always be at the start of a code block.
Similarly below.

> +        qdev_connect_clock_in(dev, "clk",
> +            qdev_get_clock_out(DEVICE(&(s->rcc)), name));
> +        busdev =3D SYS_BUS_DEVICE(dev);
> +        if (!sysbus_realize(busdev, errp)) {
> +            return;
> +        }
> +        sysbus_mmio_map(busdev, 0, usart_addr[i]);
> +        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(armv7m, usart_irq=
[i]));
> +    }
> +
> +    /*
> +     * TODO: Connect the USARTs, UARTs and LPUART to the EXTI once the E=
XTI
> +     * can handle other gpio-in than the gpios. (e.g. Direct Lines for t=
he usarts)
> +     */
> +
> +    /* UART devices */
> +    for (int i =3D 0; i < STM_NUM_UARTS; i++) {
> +        dev =3D DEVICE(&(s->uart[i]));
> +        qdev_prop_set_chr(dev, "chardev", serial_hd(STM_NUM_USARTS + i))=
;
> +        g_autofree char *name =3D g_strdup_printf("uart%d-out", STM_NUM_=
USARTS + i + 1);
> +        qdev_connect_clock_in(dev, "clk",
> +            qdev_get_clock_out(DEVICE(&(s->rcc)), name));
> +        busdev =3D SYS_BUS_DEVICE(dev);
> +        if (!sysbus_realize(busdev, errp)) {
> +            return;
> +        }
> +        sysbus_mmio_map(busdev, 0, uart_addr[i]);
> +        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(armv7m, uart_irq[=
i]));
> +    }
> +
> +    /* LPUART device*/
> +    dev =3D DEVICE(&(s->lpuart));
> +    qdev_prop_set_chr(dev, "chardev", serial_hd(STM_NUM_USARTS + STM_NUM=
_UARTS));
> +    qdev_connect_clock_in(dev, "clk",
> +        qdev_get_clock_out(DEVICE(&(s->rcc)), "lpuart1-out"));
> +    busdev =3D SYS_BUS_DEVICE(dev);
> +    if (!sysbus_realize(busdev, errp)) {
> +        return;
> +    }
> +    sysbus_mmio_map(busdev, 0, LPUART_BASE_ADDRESS);
> +    sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(armv7m, LPUART_IRQ));
> +
>      /* APB1 BUS */
>      create_unimplemented_device("TIM2",      0x40000000, 0x400);
>      create_unimplemented_device("TIM3",      0x40000400, 0x400);
> @@ -294,10 +370,6 @@ static void stm32l4x5_soc_realize(DeviceState *dev_s=
oc, Error **errp)
>      create_unimplemented_device("SPI2",      0x40003800, 0x400);
>      create_unimplemented_device("SPI3",      0x40003C00, 0x400);
>      /* RESERVED:    0x40004000, 0x400 */
> -    create_unimplemented_device("USART2",    0x40004400, 0x400);
> -    create_unimplemented_device("USART3",    0x40004800, 0x400);
> -    create_unimplemented_device("UART4",     0x40004C00, 0x400);
> -    create_unimplemented_device("UART5",     0x40005000, 0x400);
>      create_unimplemented_device("I2C1",      0x40005400, 0x400);
>      create_unimplemented_device("I2C2",      0x40005800, 0x400);
>      create_unimplemented_device("I2C3",      0x40005C00, 0x400);
> @@ -308,7 +380,6 @@ static void stm32l4x5_soc_realize(DeviceState *dev_so=
c, Error **errp)
>      create_unimplemented_device("DAC1",      0x40007400, 0x400);
>      create_unimplemented_device("OPAMP",     0x40007800, 0x400);
>      create_unimplemented_device("LPTIM1",    0x40007C00, 0x400);
> -    create_unimplemented_device("LPUART1",   0x40008000, 0x400);
>      /* RESERVED:    0x40008400, 0x400 */
>      create_unimplemented_device("SWPMI1",    0x40008800, 0x400);
>      /* RESERVED:    0x40008C00, 0x800 */
> @@ -325,7 +396,6 @@ static void stm32l4x5_soc_realize(DeviceState *dev_so=
c, Error **errp)
>      create_unimplemented_device("TIM1",      0x40012C00, 0x400);
>      create_unimplemented_device("SPI1",      0x40013000, 0x400);
>      create_unimplemented_device("TIM8",      0x40013400, 0x400);
> -    create_unimplemented_device("USART1",    0x40013800, 0x400);
>      /* RESERVED:    0x40013C00, 0x400 */
>      create_unimplemented_device("TIM15",     0x40014000, 0x400);
>      create_unimplemented_device("TIM16",     0x40014400, 0x400);
> diff --git a/include/hw/arm/stm32l4x5_soc.h b/include/hw/arm/stm32l4x5_so=
c.h
> index ee5f362405..a94ddbd19c 100644
> --- a/include/hw/arm/stm32l4x5_soc.h
> +++ b/include/hw/arm/stm32l4x5_soc.h
> @@ -21,6 +21,12 @@
>   * https://www.st.com/en/microcontrollers-microprocessors/stm32l4x5/docu=
mentation.html
>   */
>
> +/*
> + * The STM32L4X5 is heavily inspired by the stm32f405 by Alistair Franci=
s.
> + * The reference used is the STMicroElectronics RM0351 Reference manual
> + * for STM32L4x5 and STM32L4x6 advanced Arm =C2=AE -based 32-bit MCUs.
> + */
> +

Doesn't the comment above with the URL already have this
text about the RM0351 manual ?

>  #ifndef HW_ARM_STM32L4x5_SOC_H
>  #define HW_ARM_STM32L4x5_SOC_H

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
