Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp1284377njk;
        Thu, 18 Jul 2024 00:52:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUeVXp5YSbv9unDtMlnvf0oc/NV8m7kdBfR+3y6J6ycBHBc3M/wpwQT12/XqsczmPkVAl0AEdDaEzNbjhk9oNOpkX6kecvq
X-Google-Smtp-Source: AGHT+IEf/mrqQ4La4LP8oyUg4dyrdUx9QW+CFHiCNepQbGsEN6U2tJuwYFZt9MBAS8DGGpehUApd
X-Received: by 2002:a05:6214:ca1:b0:6b5:d663:bb53 with SMTP id 6a1803df08f44-6b78ca327ddmr52775056d6.5.1721289172580;
        Thu, 18 Jul 2024 00:52:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721289172; cv=none;
        d=google.com; s=arc-20160816;
        b=D0T+x2PEjg65R7U4tQ7qiiZbwzo8/k5jUc5W6ukH+M0UYT4AGkLFsu9oAfQyVctgmE
         1wIyaskLl69hW6nHMeflejuv2WFzgzuFxMDDb9b0020r8TpmqtRl+iI29Ntc4WC0Zmjt
         uMgLm7ZZkYDDTRe5Z2sRss11BrFXuFRZD0GrCzz5K3PIZBPW/tENzK5mxAc44jYi0+hh
         U4xIRl2YAL1lJUKDPSZDexfCj7qEWk81BzjVrt6A5dOCDezPPIVZobLD8FVU2yT1BOKW
         XivhXrlf1FuWoVZcvNJ9/r3NVlY7gOSJD46B6ScPfg+Ze+fWm1qEJL7f+ITwBhHhsZFC
         4k1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=4ovlUnglfEIqU+E4vpAHm7K1L4bUnrVGOco0UE2jMBc=;
        fh=QMpkKS6sSWhhW4MgF48YOK0XafmsLhcO6HStbjTjrIc=;
        b=Iwg6Rjig0ZdcXpn2dua/ak59K7l8dlWAlMIz4WQFs3VoF2LOcKK849lcTt7SRzUYZz
         FcrNRUzO4H0GTkGahesR087StL9JcRihW+LNh15i67HLhaHQ/1zTOzFlWKxj+zUW4zAr
         jvM1BzU9VhvVAysWvbwA/OJdsYYCVk4Wn92u6hAI7HcssJn9I0Oz20wy41Orptl88mYf
         jirgIkfqZDH8fDdgy801n6Ui6hCVpEc8rHLC9xnN6kQ7iXNQ1EovZKgWuNgskDhaRy42
         7LCGE2OHOXkT1oBab68UFZlCHGCLwdfomjmZ7Q+uTHiVeKFmVN4G3fzhcReZQzV7mNht
         lFfw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b79c7b30e0si13779066d6.208.2024.07.18.00.52.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jul 2024 00:52:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sULwU-0001Ji-Gc; Thu, 18 Jul 2024 03:52:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=3riu=OS=kaod.org=clg@ozlabs.org>)
 id 1sULwJ-0000Ze-9J; Thu, 18 Jul 2024 03:52:36 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=3riu=OS=kaod.org=clg@ozlabs.org>)
 id 1sULwH-0007wO-Al; Thu, 18 Jul 2024 03:52:35 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4WPlQQ4t7Rz4x04;
 Thu, 18 Jul 2024 17:52:30 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4WPlPk6H6zz4wxk;
 Thu, 18 Jul 2024 17:51:54 +1000 (AEST)
Message-ID: <d77313c9-3014-4b6d-b212-0b2542ac4a70@kaod.org>
Date: Thu, 18 Jul 2024 09:51:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/15] aspeed/soc: support ADC for AST2700
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:STM32F205" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20240718064925.1846074-1-jamin_lin@aspeedtech.com>
 <20240718064925.1846074-3-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240718064925.1846074-3-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=3riu=OS=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: a/doHcuDLCwF

On 7/18/24 08:49, Jamin Lin wrote:
> Add ADC model for AST2700 ADC support.
> The ADC controller registers base address is start at
> 0x14C0_0000 and its address space is 0x1000.
> The ADC controller interrupt is connected to
> GICINT130_INTC group at bit 16. The GIC IRQ is 130.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   hw/arm/aspeed_ast27x0.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
> index a9fb0d4b88..4257b5e8af 100644
> --- a/hw/arm/aspeed_ast27x0.c
> +++ b/hw/arm/aspeed_ast27x0.c
> @@ -60,6 +60,7 @@ static const hwaddr aspeed_soc_ast2700_memmap[] = {
>       [ASPEED_DEV_SLIIO]     =  0x14C1E000,
>       [ASPEED_GIC_DIST]      =  0x12200000,
>       [ASPEED_GIC_REDIST]    =  0x12280000,
> +    [ASPEED_DEV_ADC]       =  0x14C00000,
>   };
>   
>   #define AST2700_MAX_IRQ 288
> @@ -344,6 +345,9 @@ static void aspeed_soc_ast2700_init(Object *obj)
>       object_initialize_child(obj, "sli", &s->sli, TYPE_ASPEED_2700_SLI);
>       object_initialize_child(obj, "sliio", &s->sliio, TYPE_ASPEED_2700_SLIIO);
>       object_initialize_child(obj, "intc", &a->intc, TYPE_ASPEED_2700_INTC);
> +
> +    snprintf(typename, sizeof(typename), "aspeed.adc-%s", socname);
> +    object_initialize_child(obj, "adc", &s->adc, typename);
>   }
>   
>   /*
> @@ -601,6 +605,14 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
>       aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->sliio), 0,
>                       sc->memmap[ASPEED_DEV_SLIIO]);
>   
> +    /* ADC */
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->adc), errp)) {
> +        return;
> +    }
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->adc), 0, sc->memmap[ASPEED_DEV_ADC]);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->adc), 0,
> +                       aspeed_soc_get_irq(s, ASPEED_DEV_ADC));
> +
>       create_unimplemented_device("ast2700.dpmcu", 0x11000000, 0x40000);
>       create_unimplemented_device("ast2700.iomem0", 0x12000000, 0x01000000);
>       create_unimplemented_device("ast2700.iomem1", 0x14000000, 0x01000000);

