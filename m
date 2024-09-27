Received: by 2002:a17:504:5f68:b0:1be9:327d:8ee3 with SMTP id gl8csp211331njc;
        Fri, 27 Sep 2024 02:30:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVLEsZyKJMaWUb1niocYHIonqrhy+4QD4rAfJt3Hb9rqCxVNVNS/XRfi5SEzaGbzRMYKVEPzVQoo5gt+Q==@linaro.org
X-Google-Smtp-Source: AGHT+IH6KPWP5pE6X7o872Xdg1oD3CyMFzJda+cPViD0hEwhT/34L0UV8towZsUulS1OXPqee6qW
X-Received: by 2002:a05:622a:3:b0:456:4655:34e6 with SMTP id d75a77b69052e-45c9f222db8mr31863411cf.23.1727429410160;
        Fri, 27 Sep 2024 02:30:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727429410; cv=none;
        d=google.com; s=arc-20240605;
        b=ezI8MrLn7ATohIs/CgrE57L7Otr+fS6glkTUypCdxDo9RajyoqrqraOWdnHJtnEs0O
         CS7w4x0ruFmgpv5fUnVTX3qmJ/VosKWCNMJJVvRPZNwrnfC7b+XeK2bpOC9Ylpugrgj5
         TE7KKrjG8glmDFiLBqbO2IsW6glO58G6yUEquzsD58rsrmsfTH+2VZKgjf/q/8De1zuF
         vyGtnw88qC9BPEc3SwjvlavbsN6J0tjEHjmo3+HYYukGvHJ+iSrMMUDZEZ+dY9tun6Be
         oXb3WaL4Q4MGKBH6bvXN2m2We5AOWxmXjNDA/C7yRdxTel/h2lJg9TRuaOkjTA/o3HfF
         pi4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=D9kxpIxRrrqdoMUXiXsP2l/6BrcF4S2BFQOy2NGAW7Q=;
        fh=97uyR/uuvr4jnX3vPrzCNtEvGPs9ZT7AiNCQmcU+/V4=;
        b=WJo6yVStqYUAl2RgpcKAvu+fOfY0d3gG8jHjP7fwC+E1gKDDchKkkboIK918W9Mk0j
         R8zLHBCbm69mcA7qnLQYk35f8yQulbyzVLB0PK/QFP83OrUBrCutylFXFQiaXPCQFAJK
         /4/f7Drgp2Ud+imledoKif0K7y5A9eyV4k7xgCTsQYUs3ZvlHQQTQ/3yNouxXBwEDMA5
         ZFD5GV2TFINevYAsxd+ieO2AxEqOaLtxEudfqH/uz2N4lk7I5vOuYMVKZHo+JyU0yITJ
         UE1Xrd/tXNF7WkkOpA3ofiowGn/lHkxn9Vle7VUyLbBvBhvAJfGTgxM8mX4vE6E9onPY
         PtQA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45c9f2c0884si17049231cf.227.2024.09.27.02.30.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Sep 2024 02:30:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1su7IU-0005XF-CM; Fri, 27 Sep 2024 05:29:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=hVAz=QZ=kaod.org=clg@ozlabs.org>)
 id 1su7IP-0005Lu-Mc; Fri, 27 Sep 2024 05:29:54 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=hVAz=QZ=kaod.org=clg@ozlabs.org>)
 id 1su7IC-0002WO-HQ; Fri, 27 Sep 2024 05:29:53 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4XFQCc4lhhz4xSZ;
 Fri, 27 Sep 2024 19:29:32 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XFQCX0MwRz4xRB;
 Fri, 27 Sep 2024 19:29:27 +1000 (AEST)
Message-ID: <a3ae007e-2e82-4370-84a2-63c06719f47d@kaod.org>
Date: Fri, 27 Sep 2024 11:29:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] aspeed/soc: Support GPIO for AST2700 and correct
 irq 130
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20240927083351.2637798-1-jamin_lin@aspeedtech.com>
 <20240927083351.2637798-7-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240927083351.2637798-7-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=hVAz=QZ=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.246, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: acY84XpKSps2

Hello Jamin,

On 9/27/24 10:33, Jamin Lin wrote:
> The register set of GPIO have a significant change since AST2700.
> Each GPIO pin has their own individual control register and users are able to
> set one GPIO pin’s direction, interrupt enable, input mask and so on in the
> same one control register.
> 
> AST2700 does not have GPIO18_XXX registers for GPIO 1.8v, removes
> ASPEED_DEV_GPIO_1_8V. It is enough to only have ASPEED_DEV_GPIO
> device in AST2700.
> 
> Add GPIO model for AST2700 GPIO support. The GPIO controller registers base
> address is start at 0x14C0_B000 and its address space is 0x1000.
> 
> The AST2700 GPIO controller interrupt is connected to GICINT130_INTC at
> bit 18. Therefore, correct GPIO irq 130.

I would prefer 2 patches. One for the IRQ number fix and one for
"Support GPIO for AST2700"

Thanks,

C.


> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   hw/arm/aspeed_ast27x0.c | 18 +++++++++++++++---
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

