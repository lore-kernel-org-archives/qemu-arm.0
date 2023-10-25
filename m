Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2546801ejb;
        Wed, 25 Oct 2023 00:09:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZRs/zPNBxbup5DLGjP2AslpY+rk0423rh7RmaEQVEBcWcMHJyLLchMK2Om2NWJuiDtVc2
X-Received: by 2002:a05:600c:1f8d:b0:407:8ee2:9986 with SMTP id je13-20020a05600c1f8d00b004078ee29986mr10196521wmb.26.1698217770249;
        Wed, 25 Oct 2023 00:09:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698217770; cv=none;
        d=google.com; s=arc-20160816;
        b=PaL3hgO3Kzyt84W+CVwrZDGrIMIu0pHwrFhwbzmFwTXplaM4RMCWIbqrnNWzd1CjBI
         GBSEObVtGhfyz4jaZQtGADC+jq73G/1MJhHvg99HQoCOS9Qft4Yk6fFWMHGTY7FErgWk
         BsNF1FtEAG4qamPNAkCQzwGoriZTsOfgAkbb6MRQDacelUnDt0fJLMdD/GE2nIrhq2Aj
         raG6vvzmSnSMrFX0u8VJCN9ScZ+OCvTpfmMtkJs0IKTbsUXLHGDp7myk8Fl0Y7eL4P4c
         lPAKR0Y6j1ZjHmFruYS/aaqcoEOJIAg8iKBik7SIPmsmZufBqueCBOMIfq0FDHqZ8+kT
         Mlmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=LkymvqPt0sLIsF8vIH6OuZrOZOyznmQINtSgdn5aGYM=;
        fh=keE2KatKG8lbgXGZXmt3WBgtkhQ6uEw33ggpupitLEY=;
        b=tQzgQLtznS20WcpWtj8bruZVRQ/cYgsTZ83qibiqTNMn0/wi4le4VJ3JzuhKDIGqrm
         w5z+ND5TucM6AJXVg73agquaB4WpdflvBnD0OakCgoFbDseC6SdvCYyb2srGxFPqU6lR
         /Z80wu0y0RhMNJuFni3JUCjF6GgMZkeTLZrbcr0KYc3ZcIwSDhnZQQw7ZM7FoBs7+p8P
         n1uzE9owvd7vCb4Vhu1DMwCMS+kWKvBC087px7msAwWXHq9SO549eFxBnM90s53SBfX4
         +4DEekESocf4s/rEWxfMNjl/FaLeNpBytoFQWvW/1jv41CLB4/Qo1VhuqfECugQb0PiN
         STYA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bg2-20020a05600c3c8200b003fe9eb22077si8223018wmb.110.2023.10.25.00.09.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 00:09:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvY0x-0005kU-J2; Wed, 25 Oct 2023 03:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=4l40=GH=kaod.org=clg@ozlabs.org>)
 id 1qvY0q-0005ib-9r; Wed, 25 Oct 2023 03:09:09 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=4l40=GH=kaod.org=clg@ozlabs.org>)
 id 1qvY0n-0001BE-De; Wed, 25 Oct 2023 03:09:06 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4SFg5V186yz4wx5;
 Wed, 25 Oct 2023 18:09:02 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4SFg5R6GQVz4wdC;
 Wed, 25 Oct 2023 18:08:59 +1100 (AEDT)
Message-ID: <47102f7a-6801-487f-b2bf-661484a76ac1@kaod.org>
Date: Wed, 25 Oct 2023 09:08:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] hw/arm/aspeed: Introduce TYPE_ASPEED10X0_SOC
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org
References: <20231024162423.40206-1-philmd@linaro.org>
 <20231024162423.40206-6-philmd@linaro.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20231024162423.40206-6-philmd@linaro.org>
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
X-TUID: KeWEqz6gd5WJ

On 10/24/23 18:24, Philippe Mathieu-Daudé wrote:
> TYPE_ASPEED10X0_SOC inherits from TYPE_ASPEED_SOC.
> In few commits we'll add more fields, but to keep
> review process simple, don't add any yet.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   include/hw/arm/aspeed_soc.h |  7 +++++++
>   hw/arm/aspeed_ast10x0.c     | 26 +++++++++++++-------------
>   2 files changed, 20 insertions(+), 13 deletions(-)
> 
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index 8adff70072..dcb43a4ecd 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -101,6 +101,13 @@ struct AspeedSoCState {
>   #define TYPE_ASPEED_SOC "aspeed-soc"
>   OBJECT_DECLARE_TYPE(AspeedSoCState, AspeedSoCClass, ASPEED_SOC)
>   
> +struct Aspeed10x0SoCState {
> +    AspeedSoCState parent;
> +};
> +
> +#define TYPE_ASPEED10X0_SOC "aspeed10x0-soc"
> +OBJECT_DECLARE_SIMPLE_TYPE(Aspeed10x0SoCState, ASPEED10X0_SOC)
> +
>   struct AspeedSoCClass {
>       DeviceClass parent_class;
>   
> diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
> index 649b3b13c1..1c15bf422f 100644
> --- a/hw/arm/aspeed_ast10x0.c
> +++ b/hw/arm/aspeed_ast10x0.c
> @@ -435,18 +435,18 @@ static void aspeed_soc_ast1030_class_init(ObjectClass *klass, void *data)
>       sc->get_irq = aspeed_soc_ast1030_get_irq;
>   }
>   
> -static const TypeInfo aspeed_soc_ast1030_type_info = {
> -    .name          = "ast1030-a1",
> -    .parent        = TYPE_ASPEED_SOC,
> -    .instance_size = sizeof(AspeedSoCState),
> -    .instance_init = aspeed_soc_ast1030_init,
> -    .class_init    = aspeed_soc_ast1030_class_init,
> -    .class_size    = sizeof(AspeedSoCClass),
> +static const TypeInfo aspeed_soc_ast10x0_types[] = {
> +    {
> +        .name           = TYPE_ASPEED10X0_SOC,
> +        .parent         = TYPE_ASPEED_SOC,
> +        .instance_size  = sizeof(Aspeed10x0SoCState),
> +        .abstract       = true,
> +    }, {
> +        .name           = "ast1030-a1",
> +        .parent         = TYPE_ASPEED10X0_SOC,
> +        .instance_init  = aspeed_soc_ast1030_init,
> +        .class_init     = aspeed_soc_ast1030_class_init,
> +    },
>   };
>   
> -static void aspeed_soc_register_types(void)
> -{
> -    type_register_static(&aspeed_soc_ast1030_type_info);
> -}
> -
> -type_init(aspeed_soc_register_types)
> +DEFINE_TYPES(aspeed_soc_ast10x0_types)

