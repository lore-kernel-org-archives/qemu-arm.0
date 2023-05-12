Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp4532249ejq;
        Thu, 11 May 2023 21:00:30 -0700 (PDT)
X-Received: by 2002:a1c:7915:0:b0:3f4:2174:b28c with SMTP id l21-20020a1c7915000000b003f42174b28cmr11883408wme.14.1683864030149;
        Thu, 11 May 2023 21:00:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683864030; cv=none;
        d=google.com; s=arc-20160816;
        b=t34XtAn2hJ/J7oYreMhOXmu7UgLozyZ6fXKwus6AluV6GkEpzgLB2oqzhy+6NN/qJ8
         k/crBNImUP1uwYlYMVqX6ozi3PCJBCVMGeRjFXVy7N90z8o8Wmx3hm/2f+6eL3QJrePz
         EUuVw5LbbuTnkWgETtvkOEBCC1bVmLRe0mzYg0zCpGD9s7gBY6+wlalHtIantLRNt3hm
         bfLvZova+kFwIKbPyyj4C6xi6F2vHtRjHxkLFRTLr+Z0RaFAj6OwgU0lXh+FXieFj+2D
         h9sag9pPN05cf1G5dIgezF/gTsYBMyJW4BRRubLVQI38aSJrGv5QGSLUnoysgc2Dz6mZ
         y4Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=PMkAISeKfeZmlX05O6QAQtQ/X4/lGBBlkslZHo8wJNE=;
        b=cQgaWja5Bksp7HZ1EfJEc5UwBXp6bmZl7i/aE+eM3VRQK2Ng8FH18nrS/47OB76/Z0
         ApGpSYwCRQlcOwl0M8r3DTztbR/ieaYz5G05urG8rR9hCjhf0tf3B5TR2UH96SMynnFp
         ic/dUxKSeF2DM0UZxk7Ou4CHmymnhBIMgLwsLhgQdm90aVWrr8OuLbVBZ+stq9btF/ze
         /a9A5GL6/2DHXoDVyn8/IA0MyVJ+qwI/4q8tyXDaKu/EXPBnB0px+ZyIIZyetjunD0MO
         hEx9DHiAyBDXCu6pz0pHtjEGT/ajj5XvMvJkmFcYFi7HFlGNRhTcohUtRbWsVa3ISCOj
         9mjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="nhzb/DkG";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bh26-20020a05600c3d1a00b003f49a2c62fcsor8265178wmb.1.2023.05.11.21.00.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 11 May 2023 21:00:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="nhzb/DkG";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683864030; x=1686456030;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PMkAISeKfeZmlX05O6QAQtQ/X4/lGBBlkslZHo8wJNE=;
        b=nhzb/DkG2yZ9eU8UDCVIK+8r1wJo3fpYL+Fg9YOBXDBBhhj5iNsgmesWGXepOZ1B+E
         OjdjdSbEnC86rkl9/yguXnoIctRutvpWlUp/0cPfdj+Ua1MjRgKC/Pi475BhsMKmJMqF
         m4sJuYabPoR+WZGNvqD2iVXl9yX+HyYEIrrYDS4oUGaZ7FH71uw+U6wR/SV4BYwWRs/j
         FBwnl4sFEQ2HtVeFaK0SfbY+Q1mxXW7Lqqqf4j1VPtN9XW2xpv/ZkhOOM+Wm5xkUbViU
         UYreE3qXTfkI40LjbeDO3lmKD6LEgbE0AfotBR59D8nb5OPv/sl01M56YV1hzGjLg/aJ
         EDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683864030; x=1686456030;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PMkAISeKfeZmlX05O6QAQtQ/X4/lGBBlkslZHo8wJNE=;
        b=bgYNBMlKIeQToUoIzT3OvNTvhqDSV1LQVbeQcQpYPD5sU0YDkZ3brKn7cY2NSMBa68
         XbcJkGSHUHwsuRw9GGqjMZ71UX4xRhrS41iM1sFnn2jGv/f5Be6CuQjziKA4JMYHZoLn
         ClYppEhNZPArCCoeztEsukU6RE7IKgJd0sXoFX+fim1IvA94h26M47WTt/tZVAGjtRZF
         fqq/8aS+byjQ9TuAjHxb++V1q7O3OtqoGYs4cERY7llCLVE2o3LPm+792GDp2sDj93NT
         8/OoYqyGOnRo8W6NQEpknb5eyXlZJNzjorPn1MKfNmAvFNl0L4pACs6nQbZa39HRfJa+
         71og==
X-Gm-Message-State: AC+VfDyx8NhY+UrQeEwI59MtzSNdog7QDA+bdCRUxFMTWeHtEGV6oOOx
	SO9JVmcHzgBnVqd3Fm1enVEJLZ34
X-Google-Smtp-Source: ACHHUZ5RbOYsGDXjJ36MuoRkyJVqrFfp0GHpLXSFXRlMrCtOiRNVk9cVuhfjkPeJyrJBwM0tX2Y40g==
X-Received: by 2002:a05:600c:4f16:b0:3f1:939e:2e3b with SMTP id l22-20020a05600c4f1600b003f1939e2e3bmr16488070wmq.19.1683864029741;
        Thu, 11 May 2023 21:00:29 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] ([176.176.152.186])
        by smtp.gmail.com with ESMTPSA id d6-20020a056000114600b00306344eaebfsm22135624wrx.28.2023.05.11.21.00.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 21:00:29 -0700 (PDT)
Message-ID: <93d8146b-1490-a0ae-29b3-3b36d89ed64a@linaro.org>
Date: Fri, 12 May 2023 06:00:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PULL 04/16] aspeed/smc: Cache AspeedSMCClass
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20221025152042.278287-1-clg@kaod.org>
 <20221025152042.278287-5-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221025152042.278287-5-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: D6JNu0EDaXOh

Hi Cédric,

On 25/10/22 17:20, Cédric Le Goater wrote:
> Store a reference on the AspeedSMC class under the flash object and
> use it when accessing the flash contents. Avoiding the class cast
> checkers in these hot paths improves performance by 10% when running
> the aspeed avocado tests.

I doubt you still have your benchmark number, but do you remember
if you were using --enable-qom-cast-debug ?

> Message-Id: <20220923084803.498337-7-clg@kaod.org>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   include/hw/ssi/aspeed_smc.h | 2 ++
>   hw/ssi/aspeed_smc.c         | 9 ++++-----
>   2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
> index 2d5f8f3d8f68..8e1dda556b91 100644
> --- a/include/hw/ssi/aspeed_smc.h
> +++ b/include/hw/ssi/aspeed_smc.h
> @@ -30,6 +30,7 @@
>   #include "qom/object.h"
>   
>   struct AspeedSMCState;
> +struct AspeedSMCClass;
>   
>   #define TYPE_ASPEED_SMC_FLASH "aspeed.smc.flash"
>   OBJECT_DECLARE_SIMPLE_TYPE(AspeedSMCFlash, ASPEED_SMC_FLASH)
> @@ -37,6 +38,7 @@ struct AspeedSMCFlash {
>       SysBusDevice parent_obj;
>   
>       struct AspeedSMCState *controller;
> +    struct AspeedSMCClass *asc;
>       uint8_t cs;
>   
>       MemoryRegion mmio;
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index faed7e0cbe17..22df4be528a7 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -388,7 +388,7 @@ static inline int aspeed_smc_flash_cmd(const AspeedSMCFlash *fl)
>   static inline int aspeed_smc_flash_addr_width(const AspeedSMCFlash *fl)
>   {
>       const AspeedSMCState *s = fl->controller;
> -    AspeedSMCClass *asc = ASPEED_SMC_GET_CLASS(s);
> +    AspeedSMCClass *asc = fl->asc;
>   
>       if (asc->addr_width) {
>           return asc->addr_width(s);
> @@ -420,7 +420,7 @@ static uint32_t aspeed_smc_check_segment_addr(const AspeedSMCFlash *fl,
>                                                 uint32_t addr)
>   {
>       const AspeedSMCState *s = fl->controller;
> -    AspeedSMCClass *asc = ASPEED_SMC_GET_CLASS(s);
> +    AspeedSMCClass *asc = fl->asc;
>       AspeedSegments seg;
>   
>       asc->reg_to_segment(s, s->regs[R_SEG_ADDR0 + fl->cs], &seg);
> @@ -1234,7 +1234,6 @@ static const TypeInfo aspeed_smc_info = {
>   static void aspeed_smc_flash_realize(DeviceState *dev, Error **errp)
>   {
>       AspeedSMCFlash *s = ASPEED_SMC_FLASH(dev);
> -    AspeedSMCClass *asc;
>       g_autofree char *name = g_strdup_printf(TYPE_ASPEED_SMC_FLASH ".%d", s->cs);
>   
>       if (!s->controller) {
> @@ -1242,14 +1241,14 @@ static void aspeed_smc_flash_realize(DeviceState *dev, Error **errp)
>           return;
>       }
>   
> -    asc = ASPEED_SMC_GET_CLASS(s->controller);
> +    s->asc = ASPEED_SMC_GET_CLASS(s->controller);
>   
>       /*
>        * Use the default segment value to size the memory region. This
>        * can be changed by FW at runtime.
>        */
>       memory_region_init_io(&s->mmio, OBJECT(s), &aspeed_smc_flash_ops,
> -                          s, name, asc->segments[s->cs].size);
> +                          s, name, s->asc->segments[s->cs].size);
>       sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
>   }
>   
