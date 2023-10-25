Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2547433ejb;
        Wed, 25 Oct 2023 00:10:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0348E+MdvL7ag4UYbGvGshPATtaYqzbmeVunkv9BuqmVyepsSGZAiRr4V9v7C0sK/RqBj
X-Received: by 2002:adf:fc91:0:b0:32d:8cf1:a088 with SMTP id g17-20020adffc91000000b0032d8cf1a088mr10231420wrr.68.1698217857382;
        Wed, 25 Oct 2023 00:10:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698217857; cv=none;
        d=google.com; s=arc-20160816;
        b=QDCbjopE4WxWaO6K5TUT9+EADrn19skTD+fcoyaJCweytMRa38czPZZ3yTcvo7Voyd
         mmnXNJxSE7Z/Q3dFCxKzO2l/XDph/JSRQq3GrUeBJ6yHhdM2GwFfuS9SPX2gcw8HU22h
         d+dPHFWNsDMDluMoWCodqizYR8ABSSRti+OsWxAjN6lntPb6qRsIV9/kB6l9SLlUKaVY
         uIkLF2ckI8g9nAjyVJweOR1khDyxOKBQsVsOhFrYY6hqCFdHddYSmxdjHfxbia5ubw0X
         dNk6LznAJbCBvZC9fK/DswY5kGGjAzKOLBqY8OBCqM3zpWx4tmjT1wWTrsZzbJnCtDAg
         8awg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=sGPSa+FbRvTrKbMNZlQJxgmr/5I7ihBEvL0zKbSaA2g=;
        fh=keE2KatKG8lbgXGZXmt3WBgtkhQ6uEw33ggpupitLEY=;
        b=wAseDFLZV6RI5k071yxAHM8gJ13lD0QnO3q5wTYmTN5yyubtGBCRfXvoBnEaCLlyag
         V2LUrgR53yCKlVp7MWKuf8Q2GiXMgQRj2xIO6uALP/PlMGVwwtPQMYq4IEKACZ9AI32+
         u/ghFhSgN/Qr49oIshh+YyOb17N7DqhyowbFTvAjT5KrqN7P6Z0QdI4ERYieD/5DFgZ0
         EpyWw4YWrMVdmk4CaWgUe5cXWoxerLpogeeJ/kT80jwK4m+r+QuDSR4oLzemVT2ZlSQf
         GmbE0dGzqdWRgwh6ZnAftVCzyEix9n+WYBg8lxAUgKTKfuAxbTVGEk4HfgtLCy75vz7m
         21Vg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q13-20020adff78d000000b0032da3ee5419si6864021wrp.242.2023.10.25.00.10.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 00:10:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qvY2E-0007SM-7L; Wed, 25 Oct 2023 03:10:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=4l40=GH=kaod.org=clg@ozlabs.org>)
 id 1qvY28-0007GQ-VF; Wed, 25 Oct 2023 03:10:28 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=4l40=GH=kaod.org=clg@ozlabs.org>)
 id 1qvY22-0001Y2-Ga; Wed, 25 Oct 2023 03:10:28 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4SFg701dR4z4wx5;
 Wed, 25 Oct 2023 18:10:20 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4SFg6y2rcNz4wd7;
 Wed, 25 Oct 2023 18:10:18 +1100 (AEDT)
Message-ID: <d87aa387-fb9c-462b-a9d7-4153406bea29@kaod.org>
Date: Wed, 25 Oct 2023 09:10:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] hw/arm/aspeed: Introduce TYPE_ASPEED2400_SOC
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org
References: <20231024162423.40206-1-philmd@linaro.org>
 <20231024162423.40206-8-philmd@linaro.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20231024162423.40206-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=4l40=GH=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
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
X-TUID: oFA2BOhqoV6B

On 10/24/23 18:24, Philippe Mathieu-Daudé wrote:
> TYPE_ASPEED2400_SOC inherits from TYPE_ASPEED_SOC.
> In few commits we'll add more fields, but to keep
> review process simple, don't add any yet.
> 
> TYPE_ASPEED_SOC is common to various Aspeed SoCs,
> define it in aspeed_soc_common.c.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   include/hw/arm/aspeed_soc.h |  7 +++++
>   hw/arm/aspeed_soc.c         | 61 +++++++++++--------------------------
>   hw/arm/aspeed_soc_common.c  | 29 ++++++++++++++++++
>   3 files changed, 53 insertions(+), 44 deletions(-)
> 
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index 103b1598f6..ee7926b81c 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -101,6 +101,13 @@ struct AspeedSoCState {
>   #define TYPE_ASPEED_SOC "aspeed-soc"
>   OBJECT_DECLARE_TYPE(AspeedSoCState, AspeedSoCClass, ASPEED_SOC)
>   
> +struct Aspeed2400SoCState {
> +    AspeedSoCState parent;
> +};
> +
> +#define TYPE_ASPEED2400_SOC "aspeed2400-soc"
> +OBJECT_DECLARE_SIMPLE_TYPE(Aspeed2400SoCState, ASPEED2400_SOC)
> +
>   struct Aspeed2600SoCState {
>       AspeedSoCState parent;
>   };
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 191276a320..dfb97f6dbd 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -497,29 +497,6 @@ static void aspeed_ast2400_soc_realize(DeviceState *dev, Error **errp)
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
>                          aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
>   }
> -static Property aspeed_soc_properties[] = {
> -    DEFINE_PROP_LINK("memory", AspeedSoCState, memory, TYPE_MEMORY_REGION,
> -                     MemoryRegion *),
> -    DEFINE_PROP_LINK("dram", AspeedSoCState, dram_mr, TYPE_MEMORY_REGION,
> -                     MemoryRegion *),
> -    DEFINE_PROP_END_OF_LIST(),
> -};
> -
> -static void aspeed_soc_class_init(ObjectClass *oc, void *data)
> -{
> -    DeviceClass *dc = DEVICE_CLASS(oc);
> -
> -    device_class_set_props(dc, aspeed_soc_properties);
> -}
> -
> -static const TypeInfo aspeed_soc_type_info = {
> -    .name           = TYPE_ASPEED_SOC,
> -    .parent         = TYPE_DEVICE,
> -    .instance_size  = sizeof(AspeedSoCState),
> -    .class_size     = sizeof(AspeedSoCClass),
> -    .class_init     = aspeed_soc_class_init,
> -    .abstract       = true,
> -};
>   
>   static void aspeed_soc_ast2400_class_init(ObjectClass *oc, void *data)
>   {
> @@ -545,14 +522,6 @@ static void aspeed_soc_ast2400_class_init(ObjectClass *oc, void *data)
>       sc->get_irq      = aspeed_soc_ast2400_get_irq;
>   }
>   
> -static const TypeInfo aspeed_soc_ast2400_type_info = {
> -    .name           = "ast2400-a1",
> -    .parent         = TYPE_ASPEED_SOC,
> -    .instance_init  = aspeed_ast2400_soc_init,
> -    .instance_size  = sizeof(AspeedSoCState),
> -    .class_init     = aspeed_soc_ast2400_class_init,
> -};
> -
>   static void aspeed_soc_ast2500_class_init(ObjectClass *oc, void *data)
>   {
>       AspeedSoCClass *sc = ASPEED_SOC_CLASS(oc);
> @@ -577,18 +546,22 @@ static void aspeed_soc_ast2500_class_init(ObjectClass *oc, void *data)
>       sc->get_irq      = aspeed_soc_ast2400_get_irq;
>   }
>   
> -static const TypeInfo aspeed_soc_ast2500_type_info = {
> -    .name           = "ast2500-a1",
> -    .parent         = TYPE_ASPEED_SOC,
> -    .instance_init  = aspeed_ast2400_soc_init,
> -    .instance_size  = sizeof(AspeedSoCState),
> -    .class_init     = aspeed_soc_ast2500_class_init,
> -};
> -static void aspeed_soc_register_types(void)
> -{
> -    type_register_static(&aspeed_soc_type_info);
> -    type_register_static(&aspeed_soc_ast2400_type_info);
> -    type_register_static(&aspeed_soc_ast2500_type_info);
> +static const TypeInfo aspeed_soc_ast2400_types[] = {
> +    {
> +        .name           = TYPE_ASPEED2400_SOC,
> +        .parent         = TYPE_ASPEED_SOC,
> +        .instance_init  = aspeed_ast2400_soc_init,
> +        .instance_size  = sizeof(Aspeed2400SoCState),
> +        .abstract       = true,
> +    }, {
> +        .name           = "ast2400-a1",
> +        .parent         = TYPE_ASPEED2400_SOC,
> +        .class_init     = aspeed_soc_ast2400_class_init,
> +    }, {
> +        .name           = "ast2500-a1",
> +        .parent         = TYPE_ASPEED2400_SOC,
> +        .class_init     = aspeed_soc_ast2500_class_init,
> +    },
>   };
>   
> -type_init(aspeed_soc_register_types);
> +DEFINE_TYPES(aspeed_soc_ast2400_types)
> diff --git a/hw/arm/aspeed_soc_common.c b/hw/arm/aspeed_soc_common.c
> index a43f5d2a6f..b66f769d18 100644
> --- a/hw/arm/aspeed_soc_common.c
> +++ b/hw/arm/aspeed_soc_common.c
> @@ -12,6 +12,7 @@
>   
>   #include "qemu/osdep.h"
>   #include "qapi/error.h"
> +#include "hw/qdev-properties.h"
>   #include "hw/misc/unimp.h"
>   #include "hw/arm/aspeed_soc.h"
>   #include "hw/char/serial.h"
> @@ -112,3 +113,31 @@ void aspeed_mmio_map_unimplemented(AspeedSoCState *s, SysBusDevice *dev,
>       memory_region_add_subregion_overlap(s->memory, addr,
>                                           sysbus_mmio_get_region(dev, 0), -1000);
>   }
> +
> +static Property aspeed_soc_properties[] = {
> +    DEFINE_PROP_LINK("dram", AspeedSoCState, dram_mr, TYPE_MEMORY_REGION,
> +                     MemoryRegion *),
> +    DEFINE_PROP_LINK("memory", AspeedSoCState, memory, TYPE_MEMORY_REGION,
> +                     MemoryRegion *),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void aspeed_soc_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    device_class_set_props(dc, aspeed_soc_properties);
> +}
> +
> +static const TypeInfo aspeed_soc_types[] = {
> +    {
> +        .name           = TYPE_ASPEED_SOC,
> +        .parent         = TYPE_DEVICE,
> +        .instance_size  = sizeof(AspeedSoCState),
> +        .class_size     = sizeof(AspeedSoCClass),
> +        .class_init     = aspeed_soc_class_init,
> +        .abstract       = true,
> +    },
> +};
> +
> +DEFINE_TYPES(aspeed_soc_types)

