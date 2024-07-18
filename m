Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp1286814njk;
        Thu, 18 Jul 2024 01:00:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWMBUJIxUjisvrPZtEpy1VAQdlpGMeg8jf7D+mrd6/10gOOUIwcReblyu28pog+r2BTbBKSkwb6DZoYIEX9NykzIP/nPLGD
X-Google-Smtp-Source: AGHT+IEfLU9xSr6jL4k/oRyc2l/lF+3OCXTeDHz1W/Aj1j5Q4QBZ46oC3S0HQioFB6STyNhATmBS
X-Received: by 2002:a05:620a:170c:b0:79f:d11:2a4f with SMTP id af79cd13be357-7a193973f24mr3908485a.54.1721289633178;
        Thu, 18 Jul 2024 01:00:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721289633; cv=none;
        d=google.com; s=arc-20160816;
        b=bIf0kxj6thIyRSgsWY81as6F1n6xXqlKj1PUZXs2NUPRPTQ/RK7v4U/l3dX/UfjkfG
         eedIKuGbhsP330HD0OPHxE8CNpSLJ8XyTm8nuwyOfTyH/Jvxxhs68+Yn3x5gCKb55fC7
         cw6/r9KixmGtA/RKMWvPGk2kNh0TcAzKZfiOZFWQ45OFaopVTg4AtOcms+gkycGt1n+9
         BIDN0QQg+ErmE7B2GWla1tGdx29d9UNUhg7MfY24XTX/YL+zsdP6BEnQ0XbjK+s+S6q7
         EgGCuouGOxwtwSfuua14AK3cebYRN0xV7/FE8yzSWXN3a+KL3pPWAJIpiKerIezFz0L8
         bWJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=4QjyDnwrpaL42GMljYZjJet5j5RPf0TfKPhc8nIeeSo=;
        fh=QMpkKS6sSWhhW4MgF48YOK0XafmsLhcO6HStbjTjrIc=;
        b=F/D/tKOX2TLeGfAVFwSaFFu0+vQxCMrEeIk7vq8iLcjyy2DCj/3CM9QqjhbfDfgRtb
         GPVNpDiLbMsl2hVxRJXXk9NEIteDIP9I4qHNBB3aPr/UaRQlIDQ1AVh9OnsIdEJV4JpK
         C7Ij+TpQ4JsxjpPBgRCMqXGHfumCX+r0bJQYXOFIKIB3RTe8R40zf2c2FEU856NixOnF
         WxxwMT1ZK7DigQOm3ne4J0RFmGMR3j1Fa2F/E5ruluT9lsBMCftqqX7dmcqaRZ/rmEbu
         3PsbSnp2GjOl50zBmfIJH9C/ncuBagQafTwot1YrdN0cTGeFsABx0etZVvg9bcnlGeXS
         ZThw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a193970d87si2392385a.268.2024.07.18.01.00.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jul 2024 01:00:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sUM3l-0003H1-Ny; Thu, 18 Jul 2024 04:00:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=3riu=OS=kaod.org=clg@ozlabs.org>)
 id 1sUM3j-0003Fr-PH; Thu, 18 Jul 2024 04:00:15 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=3riu=OS=kaod.org=clg@ozlabs.org>)
 id 1sUM3h-0002FL-45; Thu, 18 Jul 2024 04:00:15 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4WPlbB1Zsbz4x04;
 Thu, 18 Jul 2024 18:00:06 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4WPlb61xFtz4w2Q;
 Thu, 18 Jul 2024 18:00:01 +1000 (AEST)
Message-ID: <311c3893-4e27-4472-8356-889fdaaade6f@kaod.org>
Date: Thu, 18 Jul 2024 09:59:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/15] hw/i2c/aspeed: support to set the different
 memory size
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:STM32F205" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20240718064925.1846074-1-jamin_lin@aspeedtech.com>
 <20240718064925.1846074-4-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240718064925.1846074-4-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
X-TUID: nM1rNYzRjRC+

On 7/18/24 08:49, Jamin Lin wrote:
> According to the datasheet of ASPEED SOCs,
> an I2C controller owns 8KB of register space for AST2700,
> owns 4KB of register space for AST2600, AST2500 and AST2400,
> and owns 64KB of register space for AST1030.
> 
> It set the memory region size 4KB by default and it does not compatible
> register space for AST2700.
> 
> Introduce a new class attribute to set the I2C controller memory size
> for different ASPEED SOCs.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   hw/i2c/aspeed_i2c.c         | 6 +++++-
>   include/hw/i2c/aspeed_i2c.h | 2 +-
>   2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
> index b43afd250d..7d5a53c4c0 100644
> --- a/hw/i2c/aspeed_i2c.c
> +++ b/hw/i2c/aspeed_i2c.c
> @@ -1014,7 +1014,7 @@ static void aspeed_i2c_realize(DeviceState *dev, Error **errp)
>   
>       sysbus_init_irq(sbd, &s->irq);
>       memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_i2c_ctrl_ops, s,
> -                          "aspeed.i2c", 0x1000);
> +                          "aspeed.i2c", aic->mem_size);
>       sysbus_init_mmio(sbd, &s->iomem);
>   
>       for (i = 0; i < aic->num_busses; i++) {
> @@ -1286,6 +1286,7 @@ static void aspeed_2400_i2c_class_init(ObjectClass *klass, void *data)
>       aic->pool_size = 0x800;
>       aic->pool_base = 0x800;
>       aic->bus_pool_base = aspeed_2400_i2c_bus_pool_base;
> +    aic->mem_size = 0x1000;
>   }
>   
>   static const TypeInfo aspeed_2400_i2c_info = {
> @@ -1320,6 +1321,7 @@ static void aspeed_2500_i2c_class_init(ObjectClass *klass, void *data)
>       aic->bus_pool_base = aspeed_2500_i2c_bus_pool_base;
>       aic->check_sram = true;
>       aic->has_dma = true;
> +    aic->mem_size = 0x1000;
>   }
>   
>   static const TypeInfo aspeed_2500_i2c_info = {
> @@ -1353,6 +1355,7 @@ static void aspeed_2600_i2c_class_init(ObjectClass *klass, void *data)
>       aic->pool_base = 0xC00;
>       aic->bus_pool_base = aspeed_2600_i2c_bus_pool_base;
>       aic->has_dma = true;
> +    aic->mem_size = 0x1000;
>   }
>   
>   static const TypeInfo aspeed_2600_i2c_info = {
> @@ -1376,6 +1379,7 @@ static void aspeed_1030_i2c_class_init(ObjectClass *klass, void *data)
>       aic->pool_base = 0xC00;
>       aic->bus_pool_base = aspeed_2600_i2c_bus_pool_base;
>       aic->has_dma = true;
> +    aic->mem_size = 0x10000;

Are you sure this value is correct ?


Thanks,

C.


>   }
>   
>   static const TypeInfo aspeed_1030_i2c_info = {
> diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
> index a064479e59..065b636d29 100644
> --- a/include/hw/i2c/aspeed_i2c.h
> +++ b/include/hw/i2c/aspeed_i2c.h
> @@ -283,7 +283,7 @@ struct AspeedI2CClass {
>       uint8_t *(*bus_pool_base)(AspeedI2CBus *);
>       bool check_sram;
>       bool has_dma;
> -
> +    uint64_t mem_size;
>   };
>   
>   static inline bool aspeed_i2c_is_new_mode(AspeedI2CState *s)

