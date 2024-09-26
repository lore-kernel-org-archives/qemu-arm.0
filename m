Received: by 2002:a17:505:5b18:b0:1be9:327d:8ee3 with SMTP id ox24csp1047825njb;
        Thu, 26 Sep 2024 09:11:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXiXbbUV9lfaptLHONlGcFRkD1yHyRYcMEYkj+K6G3QFtxO9tV/h6F7Lv6VMMmjr2kjFBtGn5demGNawQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFH2CE2BV7j15hLLST6mTwxfDJlkRtlNcm1+PQ52Sgi+YXABiIfJ9oeg9pgub619i0UkR19
X-Received: by 2002:a05:620a:2446:b0:7a9:abee:992 with SMTP id af79cd13be357-7ae378bc21fmr13065185a.50.1727367077085;
        Thu, 26 Sep 2024 09:11:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727367077; cv=none;
        d=google.com; s=arc-20240605;
        b=XGB/Cpr9eIvO8pnfeGBlfTGolqPBVFeWjHBD8lI/Z1gusRiCwjYFSqZHZp+XMW4/7K
         O8e8bSiH+Dlvav/oZqiVGWtVI+OYOkTT8Z0i8Igcllhmd/v9/jsYpmijnw5nX7QEBQvD
         jRqhaxL3VobhlW5nyvcDvst78/As6VMmI0LdF+L2X5o/11LmB1TVK2IwhrzXzi51dcPf
         uYjd39KPlwT1+/cbzrV9AZr7bi0u71np5iwNKWVIGq0z8c3VGgiC7OVw/zE/XEDw7Bp4
         NvuUFWxnzh+4foIYjzyAiBOITvjM+nhBSS11lNY1SY/TvjOoDcy82V71iNd3XtM4+G/I
         6tOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=9n0t7ONe5NhY5lcT4V7ZlJStcL5L8fm2GgteTR+3SfE=;
        fh=y8UldgvBpgWdzvo0ZnT6ptMSZ9zI0pieroCu40oTsaQ=;
        b=FdV2Zec64Kw7QjFyQvjsn+VC6T/a4Nl+JMPlqZI/HbVeeWtERuuFeqoPtiu3woZH0b
         0EmA5Pl3Laip/PL/t651M1rBaewbQyLSNHCi0PfXCgP0H9tkKGm4mTPnMKm0545szecE
         jDgmas/UC0OlZT3EDlWCZj1d8FWIO6EVFGZTcD9awTIvUx9XB6giMadLlqt7hpCF40wp
         jxT9Xz0iaNX+nNu+Jb1aP9EwuEe57DtdLpw13bGYlPIxJEHWid6YZmjPfE96KmKTF0Iv
         gHi6TQ8GbjeAewLi3is3hcZvzKiP/m6/ZD2PtB7Q/Uce7S9yIKnajU3wbfVUj9U44U/F
         d33A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae377d0429si8266785a.104.2024.09.26.09.11.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Sep 2024 09:11:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1str56-0005sY-Rq; Thu, 26 Sep 2024 12:11:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Z/Ab=QY=kaod.org=clg@ozlabs.org>)
 id 1str52-0005bv-IB; Thu, 26 Sep 2024 12:11:00 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Z/Ab=QY=kaod.org=clg@ozlabs.org>)
 id 1str50-0004Me-O3; Thu, 26 Sep 2024 12:11:00 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4XDz9C5DMQz4xQr;
 Fri, 27 Sep 2024 02:10:55 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XDz980X1Tz4xPX;
 Fri, 27 Sep 2024 02:10:51 +1000 (AEST)
Message-ID: <6aea4f4b-2446-43c0-acb9-0f0df000f3b4@kaod.org>
Date: Thu, 26 Sep 2024 18:10:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] aspeed/soc: Support GPIO for AST2700
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20240926074535.1286209-1-jamin_lin@aspeedtech.com>
 <20240926074535.1286209-7-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240926074535.1286209-7-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=Z/Ab=QY=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.246, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +V1VcSs5FHMJ

On 9/26/24 09:45, Jamin Lin wrote:
> Add GPIO model for AST2700 GPIO support.
> The GPIO controller registers base address is start at
> 0x14C0_B000 and its address space is 0x1000.
> 
> The AST2700 GPIO controller interrupt is connected to
> GICINT130_INTC at bit 18.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> --->   hw/arm/aspeed_ast27x0.c | 18 +++++++++++++++---
>   1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
> index 761ee11657..dca660eb6b 100644
> --- a/hw/arm/aspeed_ast27x0.c
> +++ b/hw/arm/aspeed_ast27x0.c
> @@ -62,6 +62,7 @@ static const hwaddr aspeed_soc_ast2700_memmap[] = {
>       [ASPEED_GIC_REDIST]    =  0x12280000,
>       [ASPEED_DEV_ADC]       =  0x14C00000,
>       [ASPEED_DEV_I2C]       =  0x14C0F000,
> +    [ASPEED_DEV_GPIO]      =  0x14C0B000,
>   };
>   
>   #define AST2700_MAX_IRQ 288
> @@ -87,8 +88,7 @@ static const int aspeed_soc_ast2700_irqmap[] = {
>       [ASPEED_DEV_ADC]       = 130,
>       [ASPEED_DEV_XDMA]      = 5,
>       [ASPEED_DEV_EMMC]      = 15,
> -    [ASPEED_DEV_GPIO]      = 11,
> -    [ASPEED_DEV_GPIO_1_8V] = 130,
> +    [ASPEED_DEV_GPIO]      = 130,

This change needs some explanation and a Fixes tag.

Thanks,

C.


>       [ASPEED_DEV_RTC]       = 13,
>       [ASPEED_DEV_TIMER1]    = 16,
>       [ASPEED_DEV_TIMER2]    = 17,
> @@ -124,7 +124,7 @@ static const int aspeed_soc_ast2700_gic128_intcmap[] = {
>   static const int aspeed_soc_ast2700_gic130_intcmap[] = {
>       [ASPEED_DEV_I2C]        = 0,
>       [ASPEED_DEV_ADC]        = 16,
> -    [ASPEED_DEV_GPIO_1_8V]  = 18,
> +    [ASPEED_DEV_GPIO]       = 18,
>   };
>   
>   /* GICINT 131 */
> @@ -373,6 +373,9 @@ static void aspeed_soc_ast2700_init(Object *obj)
>   
>       snprintf(typename, sizeof(typename), "aspeed.i2c-%s", socname);
>       object_initialize_child(obj, "i2c", &s->i2c, typename);
> +
> +    snprintf(typename, sizeof(typename), "aspeed.gpio-%s", socname);
> +    object_initialize_child(obj, "gpio", &s->gpio, typename);
>   }
>   
>   /*
> @@ -658,6 +661,15 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
>           sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c.busses[i]), 0, irq);
>       }
>   
> +    /* GPIO */
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpio), errp)) {
> +        return;
> +    }
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->gpio), 0,
> +                    sc->memmap[ASPEED_DEV_GPIO]);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio), 0,
> +                       aspeed_soc_get_irq(s, ASPEED_DEV_GPIO));
> +
>       create_unimplemented_device("ast2700.dpmcu", 0x11000000, 0x40000);
>       create_unimplemented_device("ast2700.iomem0", 0x12000000, 0x01000000);
>       create_unimplemented_device("ast2700.iomem1", 0x14000000, 0x01000000);

