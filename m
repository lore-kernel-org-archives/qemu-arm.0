Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5838742wrp;
        Sun, 29 Sep 2019 07:28:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy1JpLu7udLCCdn8QgNftKxLE7wDhUf4jI7DzrbAQKEOriX9kTMs0CE4pxaXEZuIkG/IC56
X-Received: by 2002:ac8:1935:: with SMTP id t50mr19630616qtj.214.1569767289064;
        Sun, 29 Sep 2019 07:28:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569767289; cv=none;
        d=google.com; s=arc-20160816;
        b=BICPQjyGgKlr++jaXeSSmjbDR0O3Lif++JjqhYZz23tu1cniTCHP5/LZBEKNbq352v
         amEVK9h8etcstpxcVFGELDYHY4lMLiYnDwnceSeoJL4PA7bwsFqJywIMvwTelB42D9tk
         6UXCF4U+aktmmKZrxOpIvzn8DmUZebBbbwdTrpx5NKX5f+ztgMEyfjnbBrjnwpWbtLER
         4+8ZnhIVOdt9VipkQqymuuyLICnTdnTglxkIlJ6176eERpM7QiZWnidHE5IPJoTjevLG
         QhkjjIYOBE6DH2ZsLKuTmVxQekslD0Qy53xfWmPQdNnOyvMqGep6L1hqOqpQYTck68wv
         EiTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:references:in-reply-to:date:to:from:subject
         :message-id:dkim-signature;
        bh=ic0DT++CDTEFfWN0dREva0EauIA/wv5K764o5Cro5E0=;
        b=atswlU2aZ8wAc/7bzgu5fRJRBhCpR7rIkGM7pR0+ZU6lP6vG//+YsOAl4lRl5Y28vj
         SVwKka4IFhmoKaRHPvPTJ9O+bYB8duWZnU2y2dGaRkOckug42eVwEDBR0mR/aU4J4eTz
         G6cxDkJI/UjTSyXKL5t5CrEVKre+y9ClVzPaQlxuw3hJoG/HTygx7ioqk7XwKIE2N3QE
         YeHpr4wySm7ETHKN838MYAvcFYkmc6grPmBbfFJTgWhS/HZBLFxx9ZZZvINFwfQ2OKHv
         M7CkRMRSIgJFrR0uLzffBhQIJOERjhfb7V/mH7y5yGPXncwX8XdZ/QxswtMj8M1Q9B77
         KzCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tpw5Owz7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o8si10670217qtg.128.2019.09.29.07.28.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Sep 2019 07:28:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tpw5Owz7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iEaBE-0001Bk-HS
	for alex.bennee@linaro.org; Sun, 29 Sep 2019 10:28:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37206)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <estebanbosse@gmail.com>) id 1iEaB1-00019Q-Uy
 for qemu-arm@nongnu.org; Sun, 29 Sep 2019 10:27:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <estebanbosse@gmail.com>) id 1iEaB0-0006YM-PX
 for qemu-arm@nongnu.org; Sun, 29 Sep 2019 10:27:55 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:33604)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <estebanbosse@gmail.com>)
 id 1iEaAx-0006TG-Q7; Sun, 29 Sep 2019 10:27:51 -0400
Received: by mail-wr1-x442.google.com with SMTP id b9so8156232wrs.0;
 Sun, 29 Sep 2019 07:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=ic0DT++CDTEFfWN0dREva0EauIA/wv5K764o5Cro5E0=;
 b=tpw5Owz7XQtujeFt7/RnrmOPpwMhkCNuzOlw32acaWSFfXOF2GWNRlnUtXRKRqtaTB
 AOom2n5GywBUEUXYh9TkwlPchffdgZeLhlTbsXVjR0J1vigd29HD7nyQjSdn8K9ZsZGR
 D5WaS0rQSBywftH5pS5bXA17itDQ6hqxSXaIur1CVgwq8t3f62TlxeZZiznME9YWyKGs
 DzOXNStft63z/oac6aoIrTPBLNRmv3DdCGLcXXhy/n+/kVQabu8WfylijD1BHYrJA+rW
 iyGF3tZ/SilVM+8SzG5q0GoVJLBqCTj7Vp2kDWGEhTVYde3lLIhz8AvDSnDPxlX7K9M6
 9Mnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=ic0DT++CDTEFfWN0dREva0EauIA/wv5K764o5Cro5E0=;
 b=hwV/b8mPTYutKYoZ01M5xpW6OJmXnkLX5LMLqsPahE/kkf4vxIae2uGF9bnEgbwJg1
 kVFUxFUsDSRv4GyItEUhNZBCi4pZj/sJqGlzXgSX0nNyPOi7OCzQhPHKOgu3uU+WYR2e
 x1qY/pgyw+quZWpL4l2O+czGtzJCtrkZ0zwtNxazoocbohAaXueWb7xkGvRqT1xhfecb
 kM+kh6MIGeIfjjNCobionGEBaXRox2Qq8K2rjZY9+YCrZt8a14/Fi0Gvlt+A8k0YF/GR
 qWLtnCm4GuDp8pNeBLpujoGL/I0CMa4ARwxHqH/yaP5DD2DF0bSqFeNVY2QOgFhHQAJL
 VgFw==
X-Gm-Message-State: APjAAAVuyf8rVOX73qY74FoaLfhWaJ55jrwJwy7XKXXAYJeKlmFid88t
 x9A1JW0vpRGW8pu3Nq6WM8Q=
X-Received: by 2002:a5d:4102:: with SMTP id l2mr10410078wrp.348.1569767270193; 
 Sun, 29 Sep 2019 07:27:50 -0700 (PDT)
Received: from ?IPv6:2a01:c22:b04f:b200:7a70:bbc8:8101:45be?
 ([2a01:c22:b04f:b200:7a70:bbc8:8101:45be])
 by smtp.gmail.com with ESMTPSA id a7sm20286889wra.43.2019.09.29.07.27.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Sep 2019 07:27:49 -0700 (PDT)
Message-ID: <e5306439b3a7e77dc114e62b9083785a01f081a0.camel@gmail.com>
Subject: Re: [PATCH 06/14] hw/arm/bcm2835: Rename some definitions
From: Esteban Bosse <estebanbosse@gmail.com>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>, Peter
 Maydell <peter.maydell@linaro.org>, Andrew Baumann
 <Andrew.Baumann@microsoft.com>,  qemu-devel@nongnu.org, Pekka Enberg
 <penberg@iki.fi>,  =?ISO-8859-1?Q?Zolt=E1n?= Baldaszti <bztemail@gmail.com>
Date: Sun, 29 Sep 2019 16:27:39 +0200
In-Reply-To: <20190904171315.8354-7-f4bug@amsat.org>
References: <20190904171315.8354-1-f4bug@amsat.org>
 <20190904171315.8354-7-f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Cc: qemu-arm@nongnu.org, Clement Deschamps <clement.deschamps@antfield.fr>,
 =?ISO-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EhmIy3MCEGRC

El mié, 04-09-2019 a las 19:13 +0200, Philippe Mathieu-Daudé escribió:
> The UART1 is part of the AUX peripheral,
> the PCM_CLOCK (yet unimplemented) is part of the CPRMAN.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/arm/bcm2835_peripherals.c    | 4 ++--
>  include/hw/arm/raspi_platform.h | 8 ++++----
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/arm/bcm2835_peripherals.c
> b/hw/arm/bcm2835_peripherals.c
> index 8984e2e91f..270357b5a8 100644
> --- a/hw/arm/bcm2835_peripherals.c
> +++ b/hw/arm/bcm2835_peripherals.c
> @@ -175,7 +175,7 @@ static void
> bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>  
> -    memory_region_add_subregion(&s->peri_mr, UART1_OFFSET,
> +    memory_region_add_subregion(&s->peri_mr, AUX_OFFSET,
>                  sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->aux), 0));
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->aux), 0,
>          qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
> @@ -268,7 +268,7 @@ static void
> bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>  
> -    memory_region_add_subregion(&s->peri_mr, EMMC_OFFSET,
> +    memory_region_add_subregion(&s->peri_mr, EMMC1_OFFSET,
>                  sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->sdhci),
> 0));
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdhci), 0,
>          qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
> diff --git a/include/hw/arm/raspi_platform.h
> b/include/hw/arm/raspi_platform.h
> index 10083d33df..6f7db85bab 100644
> --- a/include/hw/arm/raspi_platform.h
> +++ b/include/hw/arm/raspi_platform.h
> @@ -39,7 +39,7 @@
>                                                        * Doorbells &
> Mailboxes */
>  #define PM_OFFSET               0x100000 /* Power Management, Reset
> controller
>                                            * and Watchdog registers
> */
> -#define PCM_CLOCK_OFFSET        0x101098
> +#define CPRMAN_OFFSET           0x101000 /* Clock Management */
>  #define RNG_OFFSET              0x104000
>  #define GPIO_OFFSET             0x200000
>  #define UART0_OFFSET            0x201000
> @@ -47,11 +47,11 @@
>  #define I2S_OFFSET              0x203000
>  #define SPI0_OFFSET             0x204000
>  #define BSC0_OFFSET             0x205000 /* BSC0 I2C/TWI */
> -#define UART1_OFFSET            0x215000
> -#define EMMC_OFFSET             0x300000
> +#define AUX_OFFSET              0x215000 /* AUX: UART1/SPI1/SPI2 */
> +#define EMMC1_OFFSET            0x300000
>  #define SMI_OFFSET              0x600000
>  #define BSC1_OFFSET             0x804000 /* BSC1 I2C/TWI */
> -#define USB_OFFSET              0x980000 /* DTC_OTG USB controller
> */
> +#define USB_OTG_OFFSET          0x980000 /* DTC_OTG USB controller
> */
>  #define DMA15_OFFSET            0xE05000 /* DMA controller, channel
> 15 */
>  
>  /* GPU interrupts */
Reviewed-by: Esteban Bosse <estebanbosse@gmail.com>

