Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp559808ejs;
        Tue, 9 Jan 2024 10:22:08 -0800 (PST)
X-Received: by 2002:a05:6512:250:b0:50e:7d25:bd88 with SMTP id b16-20020a056512025000b0050e7d25bd88mr632921lfo.18.1704824528496;
        Tue, 09 Jan 2024 10:22:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704824528; cv=none;
        d=google.com; s=arc-20160816;
        b=e9TD6Q/pPPtMPMzOPMTudRM+0aAta/CbwdGX/hWu0miN5Pi3WLsEa7WBduy/mUnj+m
         N8EytUwh/GzwY1Zr0byEIO87k1JB8HdllilqurYN3KpBC1725YSxTETcmH94QIPu4pqp
         LV06T04SEBtOWtT03tYLg6jBoS/DikyDe/XHYL8zroFMUOXeHjfH6NNtXMGt3iyoYQe0
         hw9vLMh6BjEbwrYucxiGkyz3W7sAcEr69coj8h0W9FKfQ+bV1cLMX4LqGlgBNyi7mrgD
         DkNtIqIl/vdgkBdABw4BctyKuy2TKgyoGnBNpMeOz4ZkP6yAUrSmTlPv3v+hD0xFs8iD
         ry6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=vnaDIUIfoY2hYCZsgiQ6ORd4ONxMPiat5cTnt+biCyo=;
        fh=tIPtNlFzeHxgf2SHuPpxDfNXaZCwv2ZxIDfoid7y1B4=;
        b=hfBhI1exhwHdqRy7FIAElmNflNXYZYTotvwsqlF5llWNXqT7z3tIwCnOuBDs1fJ/PA
         sNo1XZRi8tqtDpv1GbwND1jy4VAV27JRDEfGlPMbY7k9FXql503k7V4j4ZEwopyzzHsM
         l9Taop9V4QKsRNOUJusmdYnuUc8gxFXx6cdj1o6P/8jV+cmGxKZ4ohWngCUTotER3iUb
         Qu86YcdkNLd1cczJH/ungrgGzqcut8g2LtoivHG1P/DZRBgDfVKVP9119HR3pgx6xycu
         krV5VDK1vI+8U8d73f3lVJ3RpKtJqX0DzL1JQE8Q9c9tVh+989Y4XNvcaBT7r9/ztWF3
         00GA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="P7nuXwE/";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bi31-20020a0565120e9f00b0050eca173fa0sor449091lfb.13.2024.01.09.10.22.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Jan 2024 10:22:08 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="P7nuXwE/";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704824528; x=1705429328; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vnaDIUIfoY2hYCZsgiQ6ORd4ONxMPiat5cTnt+biCyo=;
        b=P7nuXwE/b0RKOSxUrvzOVyiL/n3pZZpXaigpirTvSQpINRshr7Z9qrVtTqQKzRmWJc
         52M6HF9hNuyoUDCjCNWdhv1RDUPCP7GhUiU/suClF9THCsCaYUUNEDcc3XJZaQu5cwhc
         xwQ+BEF81f+u7sA3MrwdjsS3Q8XEP1CziapTsWY3Ig0ilyrRfnf1asdfpAjLUhKnMsyr
         plTarygKxracQj/HH2ZcBbWoI8DUQqWbS8yy+cLKwpdcFC6vf5xb08TE7p95OdUXjqSq
         BNaDNXKzkAaonwPPAD5hz/7HBy3R1HWlmapo61cpuWrv3GoiZ+YTNQWz6zjVxklHu2kn
         la9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704824528; x=1705429328;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vnaDIUIfoY2hYCZsgiQ6ORd4ONxMPiat5cTnt+biCyo=;
        b=U8Q1NNfK3pLvk7deHwacUKkKD2QeebTIyrRrIxE9OuRTpeP+zprOZyFggkaAtcMjj7
         kjg1UvXRuxaNIuYJgBWo51Fb7h6Uxq7F68NqwleF7Qsv9IOCafGvTHsHql3KQ5d2BsQs
         iVb/bHiqBcyseU+kmItGZWWn8gGgZy1oKDsI4oIKSTh6J4ur4u3Jyz2heG4oRE8MXga4
         IV9WFY0HJJ/C+st9amSgX3XR7zMGEQqD3achvDtD2Tkx+4R87MVk6p9TQy1uB38akXQi
         fg7jo4VJxhIRx5WxBiCibXF2u7GOLvUXlsRZcdIy1p5ynT37tfPo7GDuq4WLxXrnBH1o
         ZPNg==
X-Gm-Message-State: AOJu0YxE4OmuH7/RXkIN5JeVwlv+Dj9P4C85ncXqtD/CLouhpRaevvQK
	5ic/jXatF/ZoVqfiTvMANhX/hyEVbtXFeyVD
X-Google-Smtp-Source: AGHT+IH0X1Qq1R2tBkRAsm+nBYM29efXSYqnKue2nJe3obXJPfbLVFNziFfxi7kU4EpHwE6btty4FA==
X-Received: by 2002:a05:6512:36cc:b0:50e:59d2:aaf0 with SMTP id e12-20020a05651236cc00b0050e59d2aaf0mr571253lfs.10.1704824527848;
        Tue, 09 Jan 2024 10:22:07 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (rsa59-h02-176-184-32-47.dsl.sta.abo.bbox.fr. [176.184.32.47])
        by smtp.gmail.com with ESMTPSA id o15-20020a198c0f000000b0050e7dcc05a5sm425817lfd.102.2024.01.09.10.22.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 10:22:07 -0800 (PST)
Message-ID: <e233582b-67db-481d-90bd-bb2677ff8734@linaro.org>
Date: Tue, 9 Jan 2024 19:22:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/14] hw/arm: Prefer arm_feature(EL3) over
 object_property_find(has_el3)
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Rob Herring <robh@kernel.org>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
References: <20240109180930.90793-1-philmd@linaro.org>
 <20240109180930.90793-10-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240109180930.90793-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: o1i6QZxoaUdR

On 9/1/24 19:09, Philippe Mathieu-Daudé wrote:
> The "has_el3" property is added to ARMCPU when the
> ARM_FEATURE_EL3 feature is available. Rather than
> checking whether the QOM property is present, directly
> check the feature.
> 
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/exynos4210.c   |  4 ++--
>   hw/arm/integratorcp.c |  5 ++---
>   hw/arm/realview.c     |  2 +-
>   hw/arm/versatilepb.c  |  5 ++---
>   hw/arm/xilinx_zynq.c  |  2 +-
>   hw/cpu/a15mpcore.c    | 11 +++++++----
>   hw/cpu/a9mpcore.c     |  6 +++---
>   7 files changed, 18 insertions(+), 17 deletions(-)


> diff --git a/hw/cpu/a15mpcore.c b/hw/cpu/a15mpcore.c
> index bfd8aa5644..cebfe142cf 100644
> --- a/hw/cpu/a15mpcore.c
> +++ b/hw/cpu/a15mpcore.c
> @@ -53,7 +53,6 @@ static void a15mp_priv_realize(DeviceState *dev, Error **errp)
>       DeviceState *gicdev;
>       SysBusDevice *busdev;
>       int i;
> -    bool has_el3;
>       bool has_el2 = false;
>       Object *cpuobj;
>   
> @@ -62,13 +61,17 @@ static void a15mp_priv_realize(DeviceState *dev, Error **errp)
>       qdev_prop_set_uint32(gicdev, "num-irq", s->num_irq);
>   
>       if (!kvm_irqchip_in_kernel()) {
> +        CPUState *cpu;
> +
>           /* Make the GIC's TZ support match the CPUs. We assume that
>            * either all the CPUs have TZ, or none do.
>            */
> -        cpuobj = OBJECT(qemu_get_cpu(0));
> -        has_el3 = object_property_find(cpuobj, "has_el3") &&
> +        cpu = qemu_get_cpu(0);
> +        cpuobj = OBJECT(cpu);
> +        if (arm_feature(cpu_env(cpu), ARM_FEATURE_EL3)) {
>               object_property_get_bool(cpuobj, "has_el3", &error_abort);

This requires the same change than a9mp_priv_realize(), so squashing:

-- >8 --
          if (arm_feature(cpu_env(cpu), ARM_FEATURE_EL3)) {
-            object_property_get_bool(cpuobj, "has_el3", &error_abort);
-            qdev_prop_set_bit(gicdev, "has-security-extensions", true);
+            qdev_prop_set_bit(gicdev, "has-security-extensions",
+                              object_property_get_bool(cpuobj, "has_el3",
+                                                       &error_abort));
          }
---

> -        qdev_prop_set_bit(gicdev, "has-security-extensions", has_el3);
> +            qdev_prop_set_bit(gicdev, "has-security-extensions", true);
> +        }
>           /* Similarly for virtualization support */
>           has_el2 = object_property_find(cpuobj, "has_el2") &&
>               object_property_get_bool(cpuobj, "has_el2", &error_abort);
