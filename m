Received: by 2002:a17:504:5c6a:b0:1be9:327d:8ee3 with SMTP id dm10csp1863572njc;
        Mon, 24 Feb 2025 05:23:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWueCoSQw53sn+TwdjKquZuANf2n7g0sbRf5wWGJyEaOxViSyGOUgMOiz5lEtI3oO1+lalrHOoQGy00lQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEZVhAdx9l8Vr198W3McNipeBXCkHJQCz85n32CluZxAk1f9t+pYl/WGE0KFuZCJUsW3FQc
X-Received: by 2002:ad4:5c6e:0:b0:6d8:8390:15db with SMTP id 6a1803df08f44-6e6ae7f4097mr180716866d6.6.1740403409527;
        Mon, 24 Feb 2025 05:23:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740403409; cv=none;
        d=google.com; s=arc-20240605;
        b=DLWFYENYEFM4qx0sM7pvKt864M7OiByd8FYYhO9Jon94UdBDYMkkeBpnGlnOpoIpxg
         TFqcbiNHtlrVJHDV3xdclRopJ5TkrEW6P73Rt3mmZQ5P50PfZAyOEHDS4GbGRL2E1vyV
         lDILGtPWOracvdpReb4thjRh4fAG4w84ID1wa7dusDohniCdyvTs41bKqxY+ypdn/4bD
         gmozN/8+oq5wvNVBCa8B4Qy7K7jDsSekiaxE3niLOTYbqzSff1IwU9SL8uLht6zS/ZLw
         XZYyxbWBN9CWYD6Yz56ZkrXO60MEvrbS2F8o+TDwF+Na3PKlc3Qf3UfTvPZzLAhPPiH5
         dlCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=mL5wk++DSiVxVe0X4baydx3zkyf30Ey6UdpzjUwsx6c=;
        fh=WsNKeUKJSxjfHgbsW5tBmx/8Qxs89cfjxHyIWbOr5H4=;
        b=loFJoXouCL1dwmXO0SVHk1I5cVc2LXY3+Ae1QjLUKdEgYKS6OZ3lz6gQ6SbCp+kNLQ
         mu79p+kSTuCKevLLqMgSwwv8C5AkQP198URqZ3CvFyzUB+dRDGvr9go+8DMmSC8lAQrC
         fvGnR6cistrL6PXdnhJyclpHm0KqN+5u9p9omhZaH/5dFHZfuYu0/V/MEY+dTC/Rj7BL
         FNCmoQ3hH+Lv8jMyMs8kliJ/1WYtbNX3AhluJWElFS7Q8Lty/PsBg044l/y6DBpUtipA
         jRDTngB6Dqif0wavdcD70fxhkG2F8QjrL74mP2v5OpIoXcx5z6+Yf7pKRPPXwAypjXRx
         vF1A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aDBVu3P0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e65d9a8c73si206961536d6.173.2025.02.24.05.23.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2025 05:23:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aDBVu3P0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tmYQB-0001fM-Sx; Mon, 24 Feb 2025 08:22:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tmYQ5-0001dG-4h
 for qemu-arm@nongnu.org; Mon, 24 Feb 2025 08:22:50 -0500
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tmYQ0-0005Yi-Uz
 for qemu-arm@nongnu.org; Mon, 24 Feb 2025 08:22:47 -0500
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-6f9625c0fccso36763587b3.1
 for <qemu-arm@nongnu.org>; Mon, 24 Feb 2025 05:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740403363; x=1741008163; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mL5wk++DSiVxVe0X4baydx3zkyf30Ey6UdpzjUwsx6c=;
 b=aDBVu3P0InHLakPJplal2s+yKoSWlplkucHMBgLtzerNlwIHiH1pLkJgKxzZiHK476
 CQYXS7PF23n3z3/yN+FiZ51M8bxSfiGQ0L4VWELxTay4hH6f0j34dIyb/h1lOTpcs/r4
 ZEUIhGkDElL1pIXb8ozJswkwUNN0jCADuXU+RXwc9FiFYICB/39FPDVcS/WsU3npTQBc
 olk6hvllbOcS+GHamF0lEZukFLcXS7fg53zPz7tFHLwpFL4Hgu69tszq78umuFvisk/p
 4WUAKaFrsKcvptURmKhmex0+lDMH/8vmNEW+4cJPx40w0Sc8QQCkwdcwwN97lujWIFtF
 EG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740403363; x=1741008163;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mL5wk++DSiVxVe0X4baydx3zkyf30Ey6UdpzjUwsx6c=;
 b=fgRUYTvbZXkWxmdqu3OiFFy9Ylmh7MXndqodzJv0hm994EijqKan5JbbLaEhP7uFTc
 aly1teq8NGtcFiPH2NMCrNOldtr4GSAYGRnkC4hxVFT/HB/X2cExGMlIHVSX4Cixo9t2
 v7iERre2GmDHZfxRjxAoXpNlTOrsIIzKfq2B5LeLTwf1soJOLO2+ejPaVaPJpT80GGkm
 uw8McfMzKpVMaZU8qJYgnaMdElqnKltI38Bk824dxmq1M+wtATsso1lA9HM4AEdNfpkZ
 aXbT1YDv4C+I25B0EHYYmzuPpSIIegfODvmOghVe/oMMML2j0YZkoOqAGkZU1EX0Oj0B
 wjbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfoDCRQ9JcuMXxar7n0PoN8AplNgABxk86ZSvkcMzvnhDYHdbNjVS1wQch0rU2zRy72iK0h5QnLw==@nongnu.org
X-Gm-Message-State: AOJu0Yz1t2xVTQ7iacpGZsxfGW2lh+TPVTZ2VNmn0Du2soBk1emgHD2j
 QV1CV+w/CfLjJwKkvxc1SDNgbde1dPdlae/Q8eFrglINBPUNJ8G655fABrtJAgUxwCxpc/MYwmU
 89kX8jv0kopqyCQdFsRRxrKPwODWzRz9QL39vyQ==
X-Gm-Gg: ASbGncuELfoLF3VFiLnmxkeEvU2xYKlL83p7zI/QWPelIopZClr4kt9S0YZ4VlCen5Y
 JPOLdF8udVYjyUSdIkUcjfvNI8a9NVjSf3q1yVtaQ+pUT0Cs/kgGessshhFUiIXJlSV95TmPihr
 C8uhsaQfCv
X-Received: by 2002:a05:690c:6405:b0:6fb:2980:b0bd with SMTP id
 00721157ae682-6fbcc241d85mr124694927b3.11.1740403363398; Mon, 24 Feb 2025
 05:22:43 -0800 (PST)
MIME-Version: 1.0
References: <3cca4eb3-09d1-4467-81fd-27a5bfe19a3e@csclub.uwaterloo.ca>
In-Reply-To: <3cca4eb3-09d1-4467-81fd-27a5bfe19a3e@csclub.uwaterloo.ca>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Feb 2025 13:22:32 +0000
X-Gm-Features: AWEUYZmN9CYG-k9N3IuMpCFHV6ZTK_bjGmqnZIcDy9nDjpkfa9fAru_dKSdLK_I
Message-ID: <CAFEAcA9kED+fB1repp2+r-zMfZ_5ZeAkZq2ChyxjSUo1j5gAFQ@mail.gmail.com>
Subject: Re: [PATCH] bcm2838: Add GIC-400 timer interupt connections
To: Sourojeet Adhikari <s23adhik@csclub.uwaterloo.ca>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: BWCIeTK4sVcP

On Sun, 16 Feb 2025 at 03:54, Sourojeet Adhikari
<s23adhik@csclub.uwaterloo.ca> wrote:
>
> Hello everyone,
>
> This patch adds support for the system timer interrupts
> in QEMU's BCM2838 model. It defines a new constant
> called GIC400_TIMER_INT, and connects 4 timer interupts
> to the GIC-400.
> Previously timer interupts were not being routed to the
> interupt controller, causing scheduling, and some other
> stuff to have issues (me and a few friends bumped into
> this, and that's why this was written lol).
>
> Signed-off-by: Sourojeet Adhikari <s23adhik@csclub.uwaterloo.ca>

Hi; thanks for sending this patch, but I'm afraid this doesn't
look like a correct fix for the bug you've run into.

> ---
>   hw/arm/bcm2838.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/hw/arm/bcm2838.c b/hw/arm/bcm2838.c
> index ddb7c5f..0a4179f 100644
> --- a/hw/arm/bcm2838.c
> +++ b/hw/arm/bcm2838.c
> @@ -21,6 +21,8 @@
>   #define GIC400_TIMER_S_EL1_IRQ      13
>   #define GIC400_TIMER_NS_EL1_IRQ     14
>   #define GIC400_LEGACY_IRQ           15
> +#define GIC400_TIMER_INT            (96 - 32)
> +
>
>   /* Number of external interrupt lines to configure the GIC with */
>   #define GIC_NUM_IRQS                192
> @@ -176,6 +178,15 @@ static void bcm2838_realize(DeviceState *dev, Error
> **errp)
>                       qdev_get_gpio_in(gicdev, PPI(n, VIRTUAL_PMU_IRQ)));
>       }
>
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&ps_base->systmr), 0,
> +        qdev_get_gpio_in(DEVICE(&s->gic), GIC400_TIMER_INT +
> INTERRUPT_TIMER0));

The values passed to qdev_get_gpio_in(DEVICE(&s->gic), ...)
should be GIC_SPI_INTERRUPT_* values, which we define in
include/hw/arm/bcm2838_peripherals.h. You can add new ones for
the four timers.

> +    sysbus_connect_irq(SYS_BUS_DEVICE(&ps_base->systmr), 1,
> +        qdev_get_gpio_in(DEVICE(&s->gic), GIC400_TIMER_INT +
> INTERRUPT_TIMER1));
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&ps_base->systmr), 2,
> +        qdev_get_gpio_in(DEVICE(&s->gic), GIC400_TIMER_INT +
> INTERRUPT_TIMER2));
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&ps_base->systmr), 3,
> +        qdev_get_gpio_in(DEVICE(&s->gic), GIC400_TIMER_INT +
> INTERRUPT_TIMER3));

The systmr INTERRUPT_TIMER0..3 sysbus IRQ outputs are already
being wired up in the function bcm_soc_peripherals_common_realize()
in hw/arm/bcm2835_peripherals.c (to the TYPE_BCM2835_IC
interrupt controller), and it isn't valid to wire one input
directly to multiple outputs.

In fact it looks like we are currently getting this wrong for
all of the interrupts that need to be wired to both the
"legacy interrupt controller" and the GIC. I think at the moment
what happens is that the wiring to the GIC will happen last
and this overrides the earlier wiring to the legacy interrupt
controller, so code using the latter won't work correctly.

thanks
-- PMM
