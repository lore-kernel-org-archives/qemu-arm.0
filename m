Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1813208lfj;
        Mon, 16 May 2022 00:28:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznYY/oTc30dGQNtYSuy8jLaRFyWCsaPDsv/JjKX9MW+AaCQGOYdPdizWqQVfoA2WN0nNgp
X-Received: by 2002:ac8:7f50:0:b0:2f3:bd0f:c4e1 with SMTP id g16-20020ac87f50000000b002f3bd0fc4e1mr14092604qtk.496.1652686084778;
        Mon, 16 May 2022 00:28:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652686084; cv=none;
        d=google.com; s=arc-20160816;
        b=T0pd5tkn9252Idc044fNxpB0BZpcHVZKkbR9cWuZ9Ev1ElnzwSloWYTUgkvH9SzCtu
         GfvCjhhfhYoJBVRKQMIeVxOQEMBUxTjxzg9TRzQfnkttjBCSSNOF6S9SAPnWZi8j1JbZ
         FDBJIp77m1AZns6gjNgPXhmE6156XLZsYCdJqe/kzUOFVTGG6meU6A3d7s9cQVyo0eCf
         hgGkYyXIsZy4fP2DZ1kAEUNcTET0B6lnTUBYxw4l09HzeRXw1rkY/sgSbW3ledb6FOdh
         YtcmCPMoM9wO2vxzU9L75Jn7X5LUwNkzlT8xBegaMNWSCr5L6Ic05Yziudc6Jec3nY5k
         sH4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=ckjEfu/xKNKEp+vXkJiID3PIA0sGGY6xp5hxzwCqbRs=;
        b=evm5Nqg6/F8TWF/M3W6QEyHCA+E3P0F8TGR0i0PvotRSJy8vQz9/gSUJ9oXF9vKR5f
         /IQcIxUHmzQ2Sg40g0SOWTZQFXiJdl8JA8F3rdlyxpUc9/i6WO54ldZys1X/UejlGmPr
         bK3zGB+IfKMjk8oZF94/9VTioTf7rtIIy83VLhegUePyuSxF6O7eyYpJ41FRHuDjNzph
         C5FT1FOWU/CVTLrxp+L57a3nJ5qVR/En0QryOT7uoul7ETRgIldirUPN8CPpaB8bu+Xo
         N8pL+DDhg+fzYyfxHsPrh5Yqn+zM4w/RPNT4DYdXQwE6SAwlnLjJ39bkyfTiusnyz9aw
         Zc+w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 7-20020a370407000000b0069f52b2638bsi5047548qke.160.2022.05.16.00.28.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 May 2022 00:28:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nqV9A-0001rM-7H
	for alex.bennee@linaro.org; Mon, 16 May 2022 03:28:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nqV2O-0003VJ-Ib; Mon, 16 May 2022 03:21:04 -0400
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:38301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nqV2K-0008KP-KP; Mon, 16 May 2022 03:21:04 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.192])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 1197910028E11;
 Mon, 16 May 2022 09:20:58 +0200 (CEST)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Mon, 16 May
 2022 09:20:57 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002ac001822-d446-48a0-8c9e-03cc33ed083d,
 182B8575423FAF1F37CDABDABB9637A2CFA4B440) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <6193e078-0819-16c3-389c-304a30089636@kaod.org>
Date: Mon, 16 May 2022 09:20:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 4/5] hw: aspeed: Introduce common UART init function
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
CC: <irischenlj@fb.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>,
 <zev@bewilderbeest.net>, <openbmc@lists.ozlabs.org>, <andrew@aj.id.au>,
 <peter.maydell@linaro.org>, <joel@jms.id.au>, Jamin Lin
 <jamin_lin@aspeedtech.com>
References: <20220516062328.298336-1-pdel@fb.com>
 <20220516062328.298336-5-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220516062328.298336-5-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: ea3d32f0-c9d9-4fcb-9fbc-b1a3abddeed6
X-Ovh-Tracer-Id: 18111788852229999538
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrheeggdduvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepjhgrmhhinhgplhhinhesrghsphgvvgguthgvtghhrdgtohhm
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tMP8h4U2N80P

On 5/16/22 08:23, Peter Delevoryas wrote:
> Signed-off-by: Peter Delevoryas <pdel@fb.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.




> ---
>   hw/arm/aspeed_ast10x0.c     |  7 ++-----
>   hw/arm/aspeed_ast2600.c     |  7 ++-----
>   hw/arm/aspeed_soc.c         | 16 ++++++++++++----
>   include/hw/arm/aspeed_soc.h |  1 +
>   4 files changed, 17 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
> index faafb800f3..938615d55f 100644
> --- a/hw/arm/aspeed_ast10x0.c
> +++ b/hw/arm/aspeed_ast10x0.c
> @@ -15,7 +15,6 @@
>   #include "sysemu/sysemu.h"
>   #include "hw/qdev-clock.h"
>   #include "hw/misc/unimp.h"
> -#include "hw/char/serial.h"
>   #include "hw/arm/aspeed_soc.h"
>   
>   #define ASPEED_SOC_IOMEM_SIZE 0x00200000
> @@ -215,10 +214,8 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>                          qdev_get_gpio_in(DEVICE(&s->armv7m),
>                                   sc->irqmap[ASPEED_DEV_KCS] + aspeed_lpc_kcs_4));
>   
> -    /* UART - attach an 8250 to the IO space as our UART */
> -    serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
> -                   aspeed_soc_get_irq(s, s->uart_default),
> -                   38400, serial_hd(0), DEVICE_LITTLE_ENDIAN);
> +    /* UART */
> +    aspeed_soc_uart_init(s);
>   
>       /* Timer */
>       object_property_set_link(OBJECT(&s->timerctrl), "scu", OBJECT(&s->scu),
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index a9523074a0..b0a4199b69 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -11,7 +11,6 @@
>   #include "qapi/error.h"
>   #include "hw/misc/unimp.h"
>   #include "hw/arm/aspeed_soc.h"
> -#include "hw/char/serial.h"
>   #include "qemu/module.h"
>   #include "qemu/error-report.h"
>   #include "hw/i2c/aspeed_i2c.h"
> @@ -372,10 +371,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->adc), 0,
>                          aspeed_soc_get_irq(s, ASPEED_DEV_ADC));
>   
> -    /* UART - attach an 8250 to the IO space as our UART */
> -    serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
> -                   aspeed_soc_get_irq(s, s->uart_default), 38400,
> -                   serial_hd(0), DEVICE_LITTLE_ENDIAN);
> +    /* UART */
> +    aspeed_soc_uart_init(s);
>   
>       /* I2C */
>       object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr),
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 7008cd1af7..912798a9c9 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -303,10 +303,8 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->adc), 0,
>                          aspeed_soc_get_irq(s, ASPEED_DEV_ADC));
>   
> -    /* UART - attach an 8250 to the IO space as our UART */
> -    serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
> -                   aspeed_soc_get_irq(s, s->uart_default), 38400,
> -                   serial_hd(0), DEVICE_LITTLE_ENDIAN);
> +    /* UART */
> +    aspeed_soc_uart_init(s);
>   
>       /* I2C */
>       object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr),
> @@ -544,3 +542,13 @@ qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev)
>   {
>       return ASPEED_SOC_GET_CLASS(s)->get_irq(s, dev);
>   }
> +
> +void aspeed_soc_uart_init(AspeedSoCState *s)
> +{
> +    AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
> +
> +    /* Attach an 8250 to the IO space as our UART */
> +    serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
> +                   aspeed_soc_get_irq(s, s->uart_default), 38400,
> +                   serial_hd(0), DEVICE_LITTLE_ENDIAN);
> +}
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index 669bc49855..02a5a9ffcb 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -164,5 +164,6 @@ enum {
>   };
>   
>   qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev);
> +void aspeed_soc_uart_init(AspeedSoCState *s);
>   
>   #endif /* ASPEED_SOC_H */

