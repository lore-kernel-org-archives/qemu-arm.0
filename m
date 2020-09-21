Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp4258896lfq;
        Mon, 21 Sep 2020 12:50:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWVtiMj91fbyFjaQIQr0UJI7JB46CD8MHgWaSP3hNeoeADT/bvSLR3HE2PEYE68YY6LP/r
X-Received: by 2002:a25:13c5:: with SMTP id 188mr1712178ybt.308.1600717811986;
        Mon, 21 Sep 2020 12:50:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600717811; cv=none;
        d=google.com; s=arc-20160816;
        b=HoGAIRB5ssg5L3r41htGUSrwuTLDFK2uS14lzHa445i4N7PmpOgTMrFH51KKkWq4ym
         OgR1daUmMP/aI2iimlqSEZzr8A2nb1ifrTB05+Z2cRA0qSbroE+O7Pe20Sdz6Zld2RVb
         uKKdDJgAH81wdgSyP47XwLFdg/faph1CfEAG0q0AeyHo31tGw/0EJe6c2AD4/qulyW6g
         ONTAXMzxcMPCgeatlw30cFQPrWftKY9HvXcZ6htul3HsIV7zVpDhrWfc63SDXHmYK661
         vDHVXQisrjKJV0dz0AfEVQ3SVg+jF57DsmyfHFmhaLLEm6H1tOxkwuni2L8UMKq8NrFC
         YHzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=L04vEc55pwpJzOzEUvgFTOXbRY6nScq4D1eZfzFtMQQ=;
        b=hAIl9Btv0YfZ4zqIO3KCzdzRmKf2Rix5w1IbA305AM9QTTOVuWhbDhQuFuXSLmHVE4
         mZqTRX2TWp/ToYmB67LtE6bCyigvKe69u+S2ooVxwH3tk73LkMFWdIHbqq1LW+mKKDWU
         fsvGFknIQkn1AicWOouJPbUb2pfxchwxY5NQXJ2VQKtwpDl+PXliKhWIPUpGIptufLyu
         /LrG8XQILQeFSXQCvkcrVbYvVcRfxXsEiLcYy96XGMptPGlaHvMWv/KOdymocstQL45c
         w5nzIsDexKVjVqjIPe5gJLAqafEJ5xqzPsk4fX+6x0Is2QSF+KBJiYv1g4I6EFQ3V/A/
         WsQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=lCuscgxd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e2si10407116ybp.95.2020.09.21.12.50.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Sep 2020 12:50:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=lCuscgxd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kKRpB-0005Xw-Hx
	for alex.bennee@linaro.org; Mon, 21 Sep 2020 15:50:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1kKRoM-0005Ws-Mq; Mon, 21 Sep 2020 15:49:18 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:41026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1kKRoK-0000g3-J8; Mon, 21 Sep 2020 15:49:18 -0400
Received: from [172.17.10.14] (unknown [172.17.10.14])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 343B121CBD;
 Mon, 21 Sep 2020 19:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1600717753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L04vEc55pwpJzOzEUvgFTOXbRY6nScq4D1eZfzFtMQQ=;
 b=lCuscgxdZhD60Keab7LMatDa5SBBNohm7RAUnhsQQU0Gv6bZUpgGIWuEKLygOO4LWg5b5m
 Q7OKcxo56VVM6e1/A2W5rJYZOAIllFtp6lDGx4Gm/OlMbkc4yg4pmbDzproxYnEmCz3uX/
 T4Hl8/dqzkY8LrF9A9sjt0ByR4Jc9xA=
Subject: Re: [PATCH v2 5/5] hw/arm/bcm2835_peripherals: Correctly wire the
 SYS_timer IRQs
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200921035257.434532-1-f4bug@amsat.org>
 <20200921035257.434532-6-f4bug@amsat.org>
From: Luc Michel <luc.michel@greensocs.com>
Message-ID: <45d0647d-a717-eafb-b722-44a23a365d46@greensocs.com>
Date: Mon, 21 Sep 2020 21:50:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200921035257.434532-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=luc.michel@greensocs.com; helo=beetle.greensocs.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/21 15:38:48
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Paul Zimmerman <pauldzim@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8vE6oYsRdI1Q

On 9/21/20 5:52 AM, Philippe Mathieu-Daudé wrote:
> The SYS_timer is not directly wired to the ARM core, but to the
> SoC (peripheral) interrupt controller.
> 
> Fixes: 0e5bbd74064 ("hw/arm/bcm2835_peripherals: Use the SYS_timer")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Luc Michel <luc.michel@greensocs.com>

> ---
>   hw/arm/bcm2835_peripherals.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
> index 15c5c72e465..48909a43c32 100644
> --- a/hw/arm/bcm2835_peripherals.c
> +++ b/hw/arm/bcm2835_peripherals.c
> @@ -171,8 +171,17 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
>       memory_region_add_subregion(&s->peri_mr, ST_OFFSET,
>                   sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systmr), 0));
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->systmr), 0,
> -        qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_ARM_IRQ,
> -                               INTERRUPT_ARM_TIMER));
> +        qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
> +                               INTERRUPT_TIMER0));
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->systmr), 1,
> +        qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
> +                               INTERRUPT_TIMER1));
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->systmr), 2,
> +        qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
> +                               INTERRUPT_TIMER2));
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->systmr), 3,
> +        qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
> +                               INTERRUPT_TIMER3));
>   
>       /* UART0 */
>       qdev_prop_set_chr(DEVICE(&s->uart0), "chardev", serial_hd(0));
> 
