Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1410214njb;
        Thu, 6 Feb 2025 01:07:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW3a/Ji/lNORH4TTz1Eq67pb7gF1q/9amjd8rT9Ra/0G4jpTONGlQi/9sHDyGpKtwq8zqkTjT7kb3xIfA==@linaro.org
X-Google-Smtp-Source: AGHT+IG1IfZn38Cczff87uESWCT4LYIiE95xc5c+i4A81N0hRiswgwJ4H+q/61FcY7rxO/gwidu5
X-Received: by 2002:a05:620a:f14:b0:7b6:d4a2:f126 with SMTP id af79cd13be357-7c039fc06eamr927488685a.13.1738832836204;
        Thu, 06 Feb 2025 01:07:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738832836; cv=none;
        d=google.com; s=arc-20240605;
        b=kGdIT3V47k4wPcwZgdWFsHzfc1fdoiutBVbrwjw7ii9p1n5svUn60kVtHbXsiIeFK2
         QH4MCe1gp/DTXKW4nlsN3alv3I46Q2JdeicJbbGmgm7LiJa5rCPHLUVpXrs8kb8UAg7V
         +jBKpVAAEMsojdj1pWavoUtTE5nH6oADDhYI8Uo3AVqYM024YKbVop4V5tAPZqEpJbXQ
         bgWMV0YXFx9xn6oe/Pv0KjtEYzgFvhq5yuFPXFNtw9ubLHK+S5sbImaYcnxE1Pfg6Idj
         N5G23phpfIv4j0/saICYwer6ODBYic4/0RDG6OnfnB9L5R/vxAE5e8XVqOWwEOps5q64
         JEEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=IzCJVvvfB1EaRb4n7nTPbLIP0W9cumDbV+oH5GXptgs=;
        fh=c8fHOSfepZpraM5kd61iQblNo+/0YhVDJmbS6Tbl5o8=;
        b=Ge+oNT7j/Pqp7vr4H8eOYkQy6mFbUfo41AfGzwPo2upwtvtixkvJ3nUc2ptli/2mxj
         MAEx4JawnWbCMd1LlTtl48RyLb+PY9hoNjcu5aVSQZauLwSlO3mLeVsCxWpjVHAIOgVw
         D1VT995Uf+ehiO0skG16agcP/YzGkdkNEpL4E1IgfSDh5JcMsakg7L2vCW2Fv7qjultm
         CGXp2Ztc6cWOGkpfWk7frnVirFiGakQYD/kQtm486Aa97HzM5xpheG4awvMvKjRGpLaa
         HxX4ELPQLUerHAmTcCFBI5kjUxQ7IGLrEsq9Yjgc3K67tMq+9z3HeVNjx0oNhSp0+ZpE
         0aTw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wfl2z4ja;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c041df4791si81602285a.92.2025.02.06.01.07.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 01:07:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wfl2z4ja;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfxqV-0006rA-A8; Thu, 06 Feb 2025 04:06:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfxqQ-0006q9-Qb
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 04:06:48 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfxqO-0008Cd-N9
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 04:06:46 -0500
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-385dece873cso234984f8f.0
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 01:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738832803; x=1739437603; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IzCJVvvfB1EaRb4n7nTPbLIP0W9cumDbV+oH5GXptgs=;
 b=Wfl2z4jaKejKQjxVllFulSmaqfsKLnTJOao8meIdEzl/d+ssvfPg71Ixorpq4HO6Lk
 2Md1mlsXw1Tl/KNM/sx2O/5W0wCfy3BSS573qeBMGpJJOMX3BJoe9A3oiphHvH5uXuIX
 GnMapvGTk4kPLeJisZ1qCHUrTl4Firvcrhn+rbnjU3rME88bEpTgg1oo366cGmTHhq3w
 DORghthnrr+ERTUBG6cUvGgzRRbKPPg1MRl6lHx8eeT+MAMltESf1m1dhZqX2jv2PZ8X
 u0whhFs4HZdqE9r4ozcv+oFRSxMKzoKPDjV9vqMqpmHeJNCynRZUZ2fifnKZkYcEhu06
 H1Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738832803; x=1739437603;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IzCJVvvfB1EaRb4n7nTPbLIP0W9cumDbV+oH5GXptgs=;
 b=qY3rZ3Te2IThStwcV6t1JpobYxLRoKTovjv0uwhFOrRW9zaUpLM7Q3ksDxs0iJLrac
 RNoTcKYxod9xQvzy+JBk/TMTK1W8+Rirbig3R6BOtA95du6dt4yoIWWkPdq+xdGQLn0z
 08vDwHwpIpPNEDB6ymS4tlPJAlPKrtqWzvP5leGZdE5Kkgja95pvJ4R/plKhN+7mV1gd
 be+u6S+vvsyIIFQ30CY6S38OelyTw8jrRpz83TB4bPq94v+WysqZL2nQdYQCDwl7Y//3
 lLQ4ruEVVeY75fFXZa9ofPCULcZ/TMc65UPb+B85YeNO2q1ItUVB34aRGdmZzMFV+YgY
 Yl5w==
X-Gm-Message-State: AOJu0Yw5ptJj+j/tAAHf70OsAohWw73y/KDBLS6cyB4v3yvxYmZqjkgN
 AwBS/DPPxVIIRAgIZV0xmU+XAU4J5vS7fbUvRjhpe8h0BHNFxG4crbHsCtWWB/2lsSS7lnOgSpx
 E8y0=
X-Gm-Gg: ASbGncvO5fguLc7q7nAthXBG+AlwWr+LiImgP/Qtsnz7cgZ54mqEnUX3vrvKaFTWdpT
 drO0gMtsch6kLHeHl/Juv1+HWe/sFlTa4JBNkF5mdlv6ibkVE0swsNUM/wv2JoME8PuwspAUNcs
 nGW3841Ae5oSnHQJUVYAGvZuS9uFWLtUOqrUAuxGu1pXgm6mKwewjHwHnGeA6IiwkJPLHCaUkWa
 Wsm7uZRef9FqIguPO0w/gYSbcWgYrZRiJld/6dMBqoZKpapbgSNZkEeybI72+FQkCUmGUTFGVm2
 7hAj3rEenNDLTsUUIaiSEzgFnBB99a8x2C5ILF7Bhw7lSxavQSKubPVoMGU=
X-Received: by 2002:a05:6000:1fa4:b0:38d:b125:3787 with SMTP id
 ffacd0b85a97d-38db48bcac1mr3965207f8f.17.1738832802699; 
 Thu, 06 Feb 2025 01:06:42 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dbde31ccesm1176186f8f.98.2025.02.06.01.06.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 01:06:42 -0800 (PST)
Message-ID: <20258263-a231-45be-b0f4-f6499d613640@linaro.org>
Date: Thu, 6 Feb 2025 10:06:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/17] hw/ssi: Make flash size a property in NPCM7XX FIU
To: Hao Wu <wuhaotsh@google.com>, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com,
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com,
 titusr@google.com, chli30@nuvoton.corp-partner.google.com
References: <20250206013105.3228344-1-wuhaotsh@google.com>
 <20250206013105.3228344-4-wuhaotsh@google.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250206013105.3228344-4-wuhaotsh@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: RBRC7LQMxL+I

Hi Hao,

On 6/2/25 02:30, Hao Wu wrote:
> This allows different FIUs to have different flash sizes, useful
> in NPCM8XX which has multiple different sized FIU modules.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>   hw/arm/npcm7xx.c             |  6 ++++++
>   hw/ssi/npcm7xx_fiu.c         | 11 +++++++----
>   include/hw/ssi/npcm7xx_fiu.h |  1 +
>   3 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
> index 386b2c35e9..2d6e08b72b 100644
> --- a/hw/arm/npcm7xx.c
> +++ b/hw/arm/npcm7xx.c
> @@ -292,17 +292,21 @@ static const struct {
>       hwaddr regs_addr;
>       int cs_count;
>       const hwaddr *flash_addr;
> +    size_t flash_size;
>   } npcm7xx_fiu[] = {
>       {
>           .name = "fiu0",
>           .regs_addr = 0xfb000000,
>           .cs_count = ARRAY_SIZE(npcm7xx_fiu0_flash_addr),
>           .flash_addr = npcm7xx_fiu0_flash_addr,
> +        .flash_size = 128 * MiB,
> +
>       }, {
>           .name = "fiu3",
>           .regs_addr = 0xc0000000,
>           .cs_count = ARRAY_SIZE(npcm7xx_fiu3_flash_addr),
>           .flash_addr = npcm7xx_fiu3_flash_addr,
> +        .flash_size = 128 * MiB,
>       },
>   };
>   
> @@ -735,6 +739,8 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
>   
>           object_property_set_int(OBJECT(sbd), "cs-count",
>                                   npcm7xx_fiu[i].cs_count, &error_abort);
> +        object_property_set_int(OBJECT(sbd), "flash-size",
> +                                npcm7xx_fiu[i].flash_size, &error_abort);
>           sysbus_realize(sbd, &error_abort);
>   
>           sysbus_mmio_map(sbd, 0, npcm7xx_fiu[i].regs_addr);
> diff --git a/hw/ssi/npcm7xx_fiu.c b/hw/ssi/npcm7xx_fiu.c
> index 21fc489038..ccdce67fa9 100644
> --- a/hw/ssi/npcm7xx_fiu.c
> +++ b/hw/ssi/npcm7xx_fiu.c
> @@ -28,9 +28,6 @@
>   
>   #include "trace.h"
>   
> -/* Up to 128 MiB of flash may be accessed directly as memory. */
> -#define NPCM7XX_FIU_FLASH_WINDOW_SIZE (128 * MiB)
> -
>   /* Each module has 4 KiB of register space. Only a fraction of it is used. */
>   #define NPCM7XX_FIU_CTRL_REGS_SIZE (4 * KiB)
>   
> @@ -507,6 +504,11 @@ static void npcm7xx_fiu_realize(DeviceState *dev, Error **errp)
>           return;
>       }
>   
> +    if (s->flash_size == 0) {
> +        error_setg(errp, "%s: flash size must be set", dev->canonical_path);
> +        return;
> +    }
> +
>       s->spi = ssi_create_bus(dev, "spi");
>       s->cs_lines = g_new0(qemu_irq, s->cs_count);
>       qdev_init_gpio_out_named(DEVICE(s), s->cs_lines, "cs", s->cs_count);
> @@ -525,7 +527,7 @@ static void npcm7xx_fiu_realize(DeviceState *dev, Error **errp)
>           flash->fiu = s;
>           memory_region_init_io(&flash->direct_access, OBJECT(s),
>                                 &npcm7xx_fiu_flash_ops, &s->flash[i], "flash",
> -                              NPCM7XX_FIU_FLASH_WINDOW_SIZE);
> +                              s->flash_size);

Per the comment, this is the device aperture.

Either add a check whether size is always <= 128 * MiB, or use
MIN(s->flash_size, NPCM7XX_FIU_FLASH_WINDOW_SIZE)?

>           sysbus_init_mmio(sbd, &flash->direct_access);
>       }
>   }
> @@ -543,6 +545,7 @@ static const VMStateDescription vmstate_npcm7xx_fiu = {
>   
>   static const Property npcm7xx_fiu_properties[] = {
>       DEFINE_PROP_INT32("cs-count", NPCM7xxFIUState, cs_count, 0),
> +    DEFINE_PROP_SIZE("flash-size", NPCM7xxFIUState, flash_size, 0),
>   };
>   
>   static void npcm7xx_fiu_class_init(ObjectClass *klass, void *data)
> diff --git a/include/hw/ssi/npcm7xx_fiu.h b/include/hw/ssi/npcm7xx_fiu.h
> index a3a1704289..1785ea16f4 100644
> --- a/include/hw/ssi/npcm7xx_fiu.h
> +++ b/include/hw/ssi/npcm7xx_fiu.h
> @@ -60,6 +60,7 @@ struct NPCM7xxFIUState {
>       int32_t cs_count;
>       int32_t active_cs;
>       qemu_irq *cs_lines;
> +    size_t flash_size;
>       NPCM7xxFIUFlash *flash;
>   
>       SSIBus *spi;

