Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp72886ejo;
        Thu, 4 Jan 2024 05:18:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGbYnjk588in6rFY3AdV19Wc6gfv9GeblWIdy9omPIaBXEXVoy94VMCJTGMelnQFyWuB4pi
X-Received: by 2002:a05:6808:2013:b0:3bc:27a0:7b9b with SMTP id q19-20020a056808201300b003bc27a07b9bmr549959oiw.51.1704374304066;
        Thu, 04 Jan 2024 05:18:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704374304; cv=none;
        d=google.com; s=arc-20160816;
        b=gzfadT+bjB440dMNo3gSwC4MzAff81/DGijSA/z+cdNL+IkhU6WZHYusIcvBhI02FC
         udI1piK2gfx1T7jRIWZg9CBArAfz2e5xz84+WLI8kPAJp7/+SALUgL8jZPbYnWq4jUTD
         NWI5LaknN2A5v28EQsAzDF+xJ13SNOcXZO+523iXxUGZRYyfcokAYYquAlhGHaI4P3nt
         ZGxYQj0TwQC7sCE/BENhi5cekMAQWHzOYVKWZx8RGba6uc02kYpGSIrckZ3YUhKGGbwo
         6adc9mgbWiCS/dj69fFEOIzJE50OqB56slw5DBLEZDxDTrgNPMFMRBNfXs/uUbC6xdZ6
         aXGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=0nqpvXDtbcm8dXnlETyYiphTGxuBaT+IlARwQCABQIw=;
        fh=QOGl9Zs+nNvNanknLTIuYJHxyygDHEWPeAwoechlFJk=;
        b=n8ZWc67+fpHDODzDffIrjPlZbmFynsO2o+NL82zNeHizA4h8O+ft3GCI4ycNxgs1sF
         dC1fGE/ofQsPvK9x2l1JAHTus/UkhSA6xnP0jdMUxhJgtPIZlvzknAb4hhRz4KgZNMMw
         9lq25s5MhqiOKZvNDnTWatvgghwPR4NV/PxOq8JwbWzwzPDDPcb88Ib1zdrMjtlXRda3
         XDVxquDGsj9iAkOepq6Igcbk/OsRd4IkrF5Rim/PjVgIiGnMRreD8E5SiUEF8UXs2mBb
         HrMicJLWACiQYbeSkTDPFVz497UQT/1tE+4e0hO/Bnq713ewfdobrwBj8oDsJVeoEn9m
         vhRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gLR+S4BE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ey11-20020a0562140b6b00b00680503eb91bsi21206819qvb.165.2024.01.04.05.18.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jan 2024 05:18:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gLR+S4BE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLNc0-0005Fs-E7; Thu, 04 Jan 2024 08:18:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLNbs-0005Dj-85
 for qemu-arm@nongnu.org; Thu, 04 Jan 2024 08:18:08 -0500
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLNbp-0005XF-Ig
 for qemu-arm@nongnu.org; Thu, 04 Jan 2024 08:18:07 -0500
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50eabd1c701so558056e87.3
 for <qemu-arm@nongnu.org>; Thu, 04 Jan 2024 05:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704374282; x=1704979082; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0nqpvXDtbcm8dXnlETyYiphTGxuBaT+IlARwQCABQIw=;
 b=gLR+S4BEaWvTFey0cUrCyHgnCppMDW6icA9/aTLgM0QBlAA1ZjWFjAhzeeZBKAd4f5
 ztQEY/SlQvqDpstYzRpBNWXz9rAbJwyugNHi2Fnos2Fl6dOy6B+C211xb4ZzC9W5Ht2J
 O+1VBSa5OJ3EX0dhSjGGRJBoY0u+V6XXjtAE4IkZ/nkU+5IhvbYuTrgsic+9/nxYNS0e
 QYJTelAAzFLHZSVswK5PW4jnvoxZGYBfIqb0FzbRmXaXLVyiIx0wmNv+/60POhCqZbHa
 nl0uUedtckwFg038/RQOy7AC5TQOJJmU89GNdK3Oisy04WesNMuKqknpQsG4FrD6kVHd
 lyVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704374282; x=1704979082;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0nqpvXDtbcm8dXnlETyYiphTGxuBaT+IlARwQCABQIw=;
 b=V+u26G/oLyMdFcIF4ct2mi6Kg+K8aIjAT/OwUEeNtBD5xvGcFcj7P4h9SrlVEfKW4X
 0G7s8SBaa2fXox0nfLaYjTwmYg7b4/HHMf0tl1x+qPFZkCJTchywdPANkU+jdMT0G7Sl
 VvO2VkXaHc1VAWWcp/lLrz8HtFClwWQEDE5a56dHA1rZXk5UKHJcHgg1Lr7uAPaX9Vzi
 BvOeXxtZUGYMPFKbfgP+HuwFbt3sHD0kjNYLZGUhJuIZO8JG9sJq09MVQm/3o9crY+Pe
 R+xDb9JBoAmUxc58Gk0lXNZcLTg+sFTr1Bq7dMXQuAJ9yvMIOFZeaqegVKPGHvXzsM0H
 0ffQ==
X-Gm-Message-State: AOJu0YzADQeA4ulVfNcsit3WbuOascKwDBuApF5/Bf8kGUGoaO8e2490
 ZlLTauqlc66PvZnm6HHgBeGHoljQhlrb6Q==
X-Received: by 2002:a05:6512:1091:b0:50e:4598:b836 with SMTP id
 j17-20020a056512109100b0050e4598b836mr480262lfg.15.1704374282071; 
 Thu, 04 Jan 2024 05:18:02 -0800 (PST)
Received: from [192.168.69.100] ([176.187.194.232])
 by smtp.gmail.com with ESMTPSA id
 ck15-20020a0564021c0f00b00555f908b2e4sm7429756edb.40.2024.01.04.05.18.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jan 2024 05:18:01 -0800 (PST)
Message-ID: <88e6855d-4b5f-46aa-b926-142d60275d7c@linaro.org>
Date: Thu, 4 Jan 2024 14:17:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] hw/arm: Connect STM32L4x5 EXTI to STM32L4x5 SoC
Content-Language: en-US
To: =?UTF-8?Q?In=C3=A8s_Varhol?= <ines.varhol@telecom-paris.fr>,
 qemu-devel@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org
References: <20231228161944.303768-1-ines.varhol@telecom-paris.fr>
 <20231228161944.303768-4-ines.varhol@telecom-paris.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231228161944.303768-4-ines.varhol@telecom-paris.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: /RBVqbqwUBF0

On 28/12/23 17:19, Inès Varhol wrote:
> Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
> Signed-off-by: Inès Varhol <ines.varhol@telecom-paris.fr>
> ---
>   hw/arm/Kconfig                 |  1 +
>   hw/arm/stm32l4x5_soc.c         | 56 ++++++++++++++++++++++++++++++++--
>   include/hw/arm/stm32l4x5_soc.h |  3 ++
>   3 files changed, 58 insertions(+), 2 deletions(-)


>   static void stm32l4x5_soc_initfn(Object *obj)
>   {
>       Stm32l4x5SocState *s = STM32L4X5_SOC(obj);
>   
> +    object_initialize_child(obj, "exti", &s->exti, TYPE_STM32L4X5_EXTI);
> +
>       s->sysclk = qdev_init_clock_in(DEVICE(s), "sysclk", NULL, NULL, 0);
>       s->refclk = qdev_init_clock_in(DEVICE(s), "refclk", NULL, NULL, 0);
>   }
> @@ -50,7 +91,9 @@ static void stm32l4x5_soc_realize(DeviceState *dev_soc, Error **errp)
>       Stm32l4x5SocState *s = STM32L4X5_SOC(dev_soc);
>       const Stm32l4x5SocClass *sc = STM32L4X5_SOC_GET_CLASS(dev_soc);
>       MemoryRegion *system_memory = get_system_memory();
> -    DeviceState *armv7m;
> +    DeviceState *dev, *armv7m;
> +    SysBusDevice *busdev;
> +    int i;
>   
>       /*
>        * We use s->refclk internally and only define it with qdev_init_clock_in()
> @@ -115,6 +158,16 @@ static void stm32l4x5_soc_realize(DeviceState *dev_soc, Error **errp)
>           return;
>       }
>   
> +    dev = DEVICE(&s->exti);

'dev' isn't used, you can drop it and directly use:

        busdev = SYS_BUS_DEVICE(&s->exti);

> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->exti), errp)) {

Here you can use 'busdev' directly.

> +        return;
> +    }
> +    busdev = SYS_BUS_DEVICE(dev);
> +    sysbus_mmio_map(busdev, 0, EXTI_ADDR);
> +    for (i = 0; i < NUM_EXTI_IRQ; i++) {

Preferably reduce 'i' scope:

        for (unsigned i = 0; ...) {

> +        sysbus_connect_irq(busdev, i, qdev_get_gpio_in(armv7m, exti_irq[i]));
> +    }

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

With the comments addressed:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

