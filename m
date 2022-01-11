Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp1500030lfj;
        Tue, 11 Jan 2022 01:17:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxn0fmsGLgUzb4owyUpR6mAZw7uDKK/33kgZQTBntF11yO1vOV8s9X2HGPELMihK4cMHrCQ
X-Received: by 2002:a05:620a:2015:: with SMTP id c21mr2463566qka.383.1641892658126;
        Tue, 11 Jan 2022 01:17:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641892658; cv=none;
        d=google.com; s=arc-20160816;
        b=OW8h9AjL2coweK3EQPNymnF51x5RpWnVk4qaox2S3ozFDBFYkwWBtMoRhUQyaPtAEo
         2U3ZFzbSDAgqPH9YiOdz1M2wXa16Ap/GRCjarb8GfuTPnvtUK07NB5zGuxoDMHYmOnnz
         AYdiqknOqVgsqa+V1ff+aVFLTq1fKtvYX+JN3VaYYBEguyhXXdTZ2BIvXAN07SBgqUbj
         kn7xdffi3kcjMEAtPEEkDtTzq+d1K+ohkyt7bF1ZLI+x6/OUnmCC9EMoUz5pEsImngRU
         eZ3umXLvmw67plGJniqFa643fS7M5TU8jIC7u8yP3hxGUvH0FcytiXpJJJHKBCoPMVi9
         C5yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=myrXYo7lA/a67ZeHcS5raFyvo5hHOtzPGjpYwB0QVFU=;
        b=BPlNeukEqRGz9fWTsr1Arg7wULsOyJJL4YfkIy62NHioobhnSquvAe5T/uAQBGI0wh
         oxaGZCdhyxR0JoHGXuaguO1rNUZpNKh5nthlkTQxGSdrkLtUz5+MZoL+rwCqo/2Aztj4
         /l71gEl2CAn9XnIoVrIuxtzcmhZabiXj/5apl4DLHpftVrvIdpQtUW+GOf/xOVYlT8BA
         H6EXfwkHScXA1LQFj9y+usJQBc2tHxa+CfAL83b6FQl+O1PEegU4kJGDw2nNeZ8JecRe
         zeAvumzDyTznqhCPpdzjQscrPQWfyeKcGDaqvqjZIPbbD0Pd03O6SY80odrRPxjr10Eh
         eZWg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u3si3287065qtg.423.2022.01.11.01.17.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jan 2022 01:17:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n7DHd-0006U4-KM
	for alex.bennee@linaro.org; Tue, 11 Jan 2022 04:17:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n7DCf-0002Az-Bg
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 04:12:30 -0500
Received: from 10.mo548.mail-out.ovh.net ([46.105.77.235]:48943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n7DCc-0000WP-P4
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 04:12:28 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.114])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 32B4420F85;
 Tue, 11 Jan 2022 09:12:24 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 11 Jan
 2022 10:12:23 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G00134334b47-21cc-4d90-b9e8-b2bd7905c550,
 5383433EA887FCAE918FFCB03530F9AACAE8953B) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <0d2f0472-3707-e708-5a73-84954143bfde@kaod.org>
Date: Tue, 11 Jan 2022 10:12:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 2/2] This patch includes i3c instance in ast2600 soc.
Content-Language: en-US
To: Troy Lee <troy_lee@aspeedtech.com>, <qemu-devel@nongnu.org>
References: <20220111084546.4145785-1-troy_lee@aspeedtech.com>
 <20220111084546.4145785-3-troy_lee@aspeedtech.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220111084546.4145785-3-troy_lee@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d7598acd-9d43-4021-bd8b-13d3c2778be4
X-Ovh-Tracer-Id: 5330010160848472940
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudehfedgtdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephfeggfdtjeefvdeuteefheejkeejuedtvdfgueduffeigeffhfejudeuiedthfevnecuffhomhgrihhnpehrvggrughthhgvughotghsrdhiohenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=46.105.77.235; envelope-from=clg@kaod.org;
 helo=10.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 hailin.wu@aspeedtech.com, leetroy@gmail.com,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pMa1CLUavqfM

On 1/11/22 09:45, Troy Lee wrote:
> v3:
> - Remove unrelated changes to SPI2 address
> - Remove controller irq line
> 
> v2: Rebase to mainline QEMU
> 
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

You should consider updating the documentation :

   https://qemu.readthedocs.io/en/latest/system/arm/aspeed.html

Thanks,

C.

> ---
>   hw/arm/aspeed_ast2600.c     | 16 ++++++++++++++++
>   include/hw/arm/aspeed_soc.h |  3 +++
>   2 files changed, 19 insertions(+)
> 
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index e33483fb5d..8f37bdb1d8 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -61,6 +61,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] = {
>       [ASPEED_DEV_UART1]     = 0x1E783000,
>       [ASPEED_DEV_UART5]     = 0x1E784000,
>       [ASPEED_DEV_VUART]     = 0x1E787000,
> +    [ASPEED_DEV_I3C]       = 0x1E7A0000,
>       [ASPEED_DEV_SDRAM]     = 0x80000000,
>   };
>   
> @@ -108,6 +109,7 @@ static const int aspeed_soc_ast2600_irqmap[] = {
>       [ASPEED_DEV_ETH4]      = 33,
>       [ASPEED_DEV_KCS]       = 138,   /* 138 -> 142 */
>       [ASPEED_DEV_DP]        = 62,
> +    [ASPEED_DEV_I3C]       = 102,   /* 102 -> 107 */
>   };
>   
>   static qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int ctrl)
> @@ -223,6 +225,8 @@ static void aspeed_soc_ast2600_init(Object *obj)
>   
>       snprintf(typename, sizeof(typename), "aspeed.hace-%s", socname);
>       object_initialize_child(obj, "hace", &s->hace, typename);
> +
> +    object_initialize_child(obj, "i3c", &s->i3c, TYPE_ASPEED_I3C);
>   }
>   
>   /*
> @@ -523,6 +527,18 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>       sysbus_mmio_map(SYS_BUS_DEVICE(&s->hace), 0, sc->memmap[ASPEED_DEV_HACE]);
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
>                          aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
> +
> +    /* I3C */
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->i3c), errp)) {
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i3c), 0, sc->memmap[ASPEED_DEV_I3C]);
> +    for (i = 0; i < ASPEED_I3C_NR_DEVICES; i++) {
> +        qemu_irq irq = qdev_get_gpio_in(DEVICE(&s->a7mpcore),
> +                                        sc->irqmap[ASPEED_DEV_I3C] + i);
> +        /* The AST2600 I3C controller has one IRQ per bus. */
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->i3c.devices[i]), 0, irq);
> +    }
>   }
>   
>   static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index 18fb7eed46..cae9906684 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -21,6 +21,7 @@
>   #include "hw/timer/aspeed_timer.h"
>   #include "hw/rtc/aspeed_rtc.h"
>   #include "hw/i2c/aspeed_i2c.h"
> +#include "hw/misc/aspeed_i3c.h"
>   #include "hw/ssi/aspeed_smc.h"
>   #include "hw/misc/aspeed_hace.h"
>   #include "hw/watchdog/wdt_aspeed.h"
> @@ -51,6 +52,7 @@ struct AspeedSoCState {
>       AspeedRtcState rtc;
>       AspeedTimerCtrlState timerctrl;
>       AspeedI2CState i2c;
> +    AspeedI3CState i3c;
>       AspeedSCUState scu;
>       AspeedHACEState hace;
>       AspeedXDMAState xdma;
> @@ -141,6 +143,7 @@ enum {
>       ASPEED_DEV_HACE,
>       ASPEED_DEV_DPMCU,
>       ASPEED_DEV_DP,
> +    ASPEED_DEV_I3C,
>   };
>   
>   #endif /* ASPEED_SOC_H */
> 

