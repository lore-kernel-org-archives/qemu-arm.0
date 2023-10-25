Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2545936ejb;
        Wed, 25 Oct 2023 00:07:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERWM2TePyNlA14RSKKJBM4/mFZaWN/hEnl0c+ECmZH24tCIFAtScERWw/3hWfm6VfIEj6S
X-Received: by 2002:a5d:4042:0:b0:32d:a210:d90a with SMTP id w2-20020a5d4042000000b0032da210d90amr8494344wrp.71.1698217648803;
        Wed, 25 Oct 2023 00:07:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698217648; cv=none;
        d=google.com; s=arc-20160816;
        b=Ri+5OaK0vNdn7aagD4C7PSoN9DQAHbqhiTAeCdtxWjZBIZZdWhxseR8aLJHvweGMKK
         1zP1rsuPeMAascTIRHKOLUZZNrsCMVAZjqkhRUA/sb0tNGylWlpEMOLq6/iUq2bftlNy
         KvlEIq7ZEIsOsh2C/GNEQUVRhJh9vUX6gRivaXH9RdumKy0Nd/+Aanp5RvCR9cq3HjQj
         Mnduu+O+sK4J1VgPsitid04E8WPWT0AvAFmkhWUSe16Nq5u3s6PVulah4uVtqjJoK3yG
         270xF5jMSJ/dfY48wtFPITNpE48SQZ+uuW6FoZWiCg0n585C+53cpmBqyjf+gcYyYYg6
         3O7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=UTZ73Xcn9fh2kel77vGEXPhB3oOXTW2462lF76nBHD0=;
        fh=keE2KatKG8lbgXGZXmt3WBgtkhQ6uEw33ggpupitLEY=;
        b=hMtnurVPH27aY7ioNA5En/bCE2fzCaXialAGcLLPkowSaGZNhoyTfV3PUNfPlgF1sY
         vj6bqV8SLMLnUwWu9ddEsxOvuk9/GdPDnyC3zNSPjlyBsQlHPm95lk1Y5ZWW4klzpbwt
         RSQiEYxVM9iIRY8L4mVHQGiHO54WSoBZ3cZO9irHJzzudcG/dGYQohpaMmMTJWZgfSeI
         RgqK/9DhkcPkoOv0CqBMUxvZR9ncdMhZYCdCvTiR73VkhhWBApKJURiLa7CWpsLcoKGr
         9hC2jvZ1UimGJJmHbFBf0KnlPAxdXHq3gYr+8SFZsU+55asnL6bERBb7PfR/Pjxm3G/Q
         tYSA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h7-20020adf9cc7000000b00317752a13besi7055341wre.408.2023.10.25.00.07.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 00:07:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvXyw-0002E4-Pm; Wed, 25 Oct 2023 03:07:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=4l40=GH=kaod.org=clg@ozlabs.org>)
 id 1qvXyv-0002DU-Ip; Wed, 25 Oct 2023 03:07:09 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=4l40=GH=kaod.org=clg@ozlabs.org>)
 id 1qvXym-0000oa-BR; Wed, 25 Oct 2023 03:07:09 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4SFg350C7pz4wx5;
 Wed, 25 Oct 2023 18:06:57 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4SFg331g3lz4wd2;
 Wed, 25 Oct 2023 18:06:54 +1100 (AEDT)
Message-ID: <23abf111-873c-42f3-b953-f462287cf4db@kaod.org>
Date: Wed, 25 Oct 2023 09:06:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] hw/arm/aspeed: Rename aspeed_soc_init() as
 AST2400/2500 specific
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org
References: <20231024162423.40206-1-philmd@linaro.org>
 <20231024162423.40206-3-philmd@linaro.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20231024162423.40206-3-philmd@linaro.org>
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
X-TUID: 6mR4POxTJgnL

On 10/24/23 18:24, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/arm/aspeed_soc.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index f6c2ead4ac..bb377e9e6e 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -140,7 +140,7 @@ static qemu_irq aspeed_soc_ast2400_get_irq(AspeedSoCState *s, int dev)
>       return qdev_get_gpio_in(DEVICE(&s->vic), sc->irqmap[dev]);
>   }
>   
> -static void aspeed_soc_init(Object *obj)
> +static void aspeed_ast2400_soc_init(Object *obj)
>   {
>       AspeedSoCState *s = ASPEED_SOC(obj);
>       AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
> @@ -546,7 +546,7 @@ static void aspeed_soc_ast2400_class_init(ObjectClass *oc, void *data)
>   static const TypeInfo aspeed_soc_ast2400_type_info = {
>       .name           = "ast2400-a1",
>       .parent         = TYPE_ASPEED_SOC,
> -    .instance_init  = aspeed_soc_init,
> +    .instance_init  = aspeed_ast2400_soc_init,
>       .instance_size  = sizeof(AspeedSoCState),
>       .class_init     = aspeed_soc_ast2400_class_init,
>   };
> @@ -573,7 +573,7 @@ static void aspeed_soc_ast2500_class_init(ObjectClass *oc, void *data)
>   static const TypeInfo aspeed_soc_ast2500_type_info = {
>       .name           = "ast2500-a1",
>       .parent         = TYPE_ASPEED_SOC,
> -    .instance_init  = aspeed_soc_init,
> +    .instance_init  = aspeed_ast2400_soc_init,
>       .instance_size  = sizeof(AspeedSoCState),
>       .class_init     = aspeed_soc_ast2500_class_init,
>   };

