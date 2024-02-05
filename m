Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp1137320ejb;
        Mon, 5 Feb 2024 05:47:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFc53sBYHrQh6kYpER2nrBbEDa2aW4Ph/brazJPUOTWdWgfaSjQNygf3V7rRdw03qYdbLKs
X-Received: by 2002:a0c:f2d4:0:b0:68c:968c:4673 with SMTP id c20-20020a0cf2d4000000b0068c968c4673mr5589496qvm.36.1707140839917;
        Mon, 05 Feb 2024 05:47:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707140839; cv=none;
        d=google.com; s=arc-20160816;
        b=vtZHO/jFj5XwDA+VbMwRu09D/d7/GYroFyorGSE74HPOr8zZR4zqZHVAl/gVXaimL5
         kWugKz9QCFwTT/BUMmqUQL6U66MLfpqtuMm4OckVshkMGW+GeD4YZI6rbLTtweg79jD9
         7hFYuFnPZQClyIOji6+oMTibJJ3s+0hfLLVx1nm3k435h8INxo1w5DZXr52KeISxajwB
         3pqfyG5lkgvvfX4GP3VxmrXdcgqtANLBVUi1f7HA98LkQ98V4CWPydvmFeUgl5RnRVS4
         PXIalA5B4/lQoQT+Y1rQbMQrpy/uyfE8uNOST3v2/n+OpfDCD6UvdnOShiIdPewf5rCt
         nL5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=OT8usIBI/R6EoqXiVlG877zeju+QK276nLgHhkV9l6k=;
        fh=+5iPRQ/3bXVro73DmW+tIEy/ZSyvZaOHTIM/muIX25E=;
        b=JGdOyViwbBwPxbjsMCzWh9hMGV6i8qHf+mMZRuzn9HmJyN+1c0+FvXLT4jLhaTsPcY
         yrZpk0w4ebFpJwYh1w3+L4XPtUsUIdCSpZQr/Z4xnLLVyzWzqlXsH6Z/VSA0ZsyeGopd
         Hmf1vNEeiuG1VTBfj6qU2HlyQz2GFe1dCkULBTcxW3mrk9plNjCcRl73YwmGEYc3UF60
         KKrVzZ/iRT7uruxB2XVHS5woqdFIWE2h3DULi7HFX4GdeDdqUC4feUyEKBT9hUjPJQWM
         6FlXeFswH2Ju1SHjVXDBPn4LUbhL4O3wXIlwipMNrUY325Dx68w6s7QIpYBvf0U4BZWK
         rOjg==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QjMZj7Y7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCVKndJCu/UdH3WGROdXXO2SexZRinkflmKtlAlqEutViLgSuf0sJeyUwHanPIB6DZuSNLB+OkodsDRq7sz/OKEFQLojeC1c
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cu14-20020a05621417ce00b0067f2b2b2468si8121315qvb.116.2024.02.05.05.47.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Feb 2024 05:47:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QjMZj7Y7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rWzJW-0007UN-7A; Mon, 05 Feb 2024 08:47:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rWzJS-0007Tt-Si
 for qemu-arm@nongnu.org; Mon, 05 Feb 2024 08:47:08 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rWzJP-0003uS-88
 for qemu-arm@nongnu.org; Mon, 05 Feb 2024 08:47:05 -0500
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a354408e6bfso931377066b.1
 for <qemu-arm@nongnu.org>; Mon, 05 Feb 2024 05:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707140821; x=1707745621; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OT8usIBI/R6EoqXiVlG877zeju+QK276nLgHhkV9l6k=;
 b=QjMZj7Y74Nvzs6rbB6iXMCpmL5s45Fkj7sXaKHcVEn1S2/s2hWOTcqsTUORHMK1Bq2
 aAaDIsFuLTIXuBByu2VWQ6eAwaKmJwlpqp1rSfL/hruq8TAqA9hQjqvMZgbN8chPVsgt
 Wph1MXGJqgSl+98rTqA3aovui84MvTGESew8d6jrXlQP37gZ5t3BYiulDKZfM3cRHNQ1
 5GbmaGRYiEDkq69GkU0BDUPPkFG4or6EB6xScRXj01rxs1aJq1o6gHI6FRabuP1CeX6S
 +/HUirnITKr5PQO+KpyXYxgv36PcvhhD0Ij3lmKmeQpGY25JK2IhsY9+62Ad/p33pGPK
 P4HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707140821; x=1707745621;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OT8usIBI/R6EoqXiVlG877zeju+QK276nLgHhkV9l6k=;
 b=Xm1lHHERfgOJOTcRVgl56zB9o7GnECdBdFcuBBOgggzb3Od5CJExuUnjx3Z8VN/zAl
 o00B/g8cfhSYOn51y41oByU0pKZAxAFrW3wc6GvAfxaoeXpRK3sdbsMoIU17QDZGJSX/
 pdLtQdgbw9jC+tOb8zgDmq8qGAXCbLtR6OHhqX2KiV48cboaKOK8Q7Qzevwni+d5URfS
 QPVD4sEIMUBLdjUaiMO1fBC/9H/VXNDlJt/wfqlwlQfSOhFipAnQCk8l4X7qW68GBLVG
 2cAe53exfLvN3iAY5QYM5PNmUtJu6c09LzvwPxvx7ATqhskYUQqoBTYBzYME6LBXw0LK
 M4vA==
X-Gm-Message-State: AOJu0YwVN5yluuqRxKzXdupbYr8cy6cknxaNGgx7x9cYiBCbssUozo0M
 9e1JvYu8H1f+9oeFckdw/2YDMixQTkOUsHKgdFk6T/H2xjns5P4HRHWoWBBWEY8=
X-Received: by 2002:a17:907:7656:b0:a37:b5e7:467b with SMTP id
 kj22-20020a170907765600b00a37b5e7467bmr2918597ejc.24.1707140821477; 
 Mon, 05 Feb 2024 05:47:01 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCX3qmh/NWRXtQo4B2bBH+Vz9MoCH94cqCIZqDLUvY9uqrx2Si7CNQOEr0yINCINrSIpUNBteyfcihxTnHTNHTJxMd//soi1S1IruO5Hs/E2DTHyS9N9cL6GXwnUwICva3BXF1DIStg9PKvc/IWgrsxl1IA5Rl7zSO2Skm8YPZOKUMzyNjK3BiZkaOsjrnP0/EG/hNOxCWg/BypCP46R2x3kJP05TRqMZ+7cR1WDt4XkOr5ZeCW5OuXc340RZznXZnNSfzlSbiZGkcFk29q6Cy4ZxSzppkdMeVY=
Received: from [192.168.197.175] ([92.88.170.125])
 by smtp.gmail.com with ESMTPSA id
 i25-20020a1709064ed900b00a2e7d1b6042sm4328824ejv.196.2024.02.05.05.46.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 05:47:01 -0800 (PST)
Message-ID: <22defe7a-6c67-4aae-b028-838ee6aa4e1a@linaro.org>
Date: Mon, 5 Feb 2024 14:46:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] hw/arm : Connect DM163 to STM32L4x5
Content-Language: en-US
To: =?UTF-8?Q?In=C3=A8s_Varhol?= <ines.varhol@telecom-paris.fr>,
 qemu-devel@nongnu.org
Cc: Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Samuel Tardieu <sam@rfc1149.net>, Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20240126193657.792005-1-ines.varhol@telecom-paris.fr>
 <20240126193657.792005-3-ines.varhol@telecom-paris.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240126193657.792005-3-ines.varhol@telecom-paris.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
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
X-TUID: y3gU1emh/u4U

Hi Inès,

On 26/1/24 20:31, Inès Varhol wrote:
> Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
> Signed-off-by: Inès Varhol <ines.varhol@telecom-paris.fr>
> ---
>   hw/arm/Kconfig                 |  1 +
>   hw/arm/stm32l4x5_soc.c         | 55 +++++++++++++++++++++++++++++++++-
>   include/hw/arm/stm32l4x5_soc.h |  3 ++
>   3 files changed, 58 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 3e49b913f8..818aa2f1a2 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -463,6 +463,7 @@ config STM32L4X5_SOC
>       select STM32L4X5_SYSCFG
>       select STM32L4X5_RCC
>       select STM32L4X5_GPIO
> +    select DM163


> +/*
> + * There are actually 14 input pins in the DM163 device.
> + * Here the DM163 input pin EN isn't connected to the STM32L4x5
> + * GPIOs as the IM120417002 colors shield doesn't actually use
> + * this pin to drive the RGB matrix.
> + */
> +#define NUM_DM163_INPUTS 13
> +
> +static const int dm163_input[NUM_DM163_INPUTS] = {
> +    1 * 16 + 2,  /* ROW0  PB2       */
> +    0 * 16 + 15, /* ROW1  PA15      */
> +    0 * 16 + 2,  /* ROW2  PA2       */
> +    0 * 16 + 7,  /* ROW3  PA7       */
> +    0 * 16 + 6,  /* ROW4  PA6       */
> +    0 * 16 + 5,  /* ROW5  PA5       */
> +    1 * 16 + 0,  /* ROW6  PB0       */
> +    0 * 16 + 3,  /* ROW7  PA3       */
> +    0 * 16 + 4,  /* SIN (SDA) PA4   */
> +    1 * 16 + 1,  /* DCK (SCK) PB1   */
> +    2 * 16 + 3,  /* RST_B (RST) PC3 */
> +    2 * 16 + 4,  /* LAT_B (LAT) PC4 */
> +    2 * 16 + 5,  /* SELBK (SB)  PC5 */
> +};
> +
> +
>   static const uint32_t gpio_addr[] = {
>       0x48000000,
>       0x48000400,
> @@ -116,6 +143,8 @@ static void stm32l4x5_soc_initfn(Object *obj)
>           g_autofree char *name = g_strdup_printf("gpio%c", 'a' + i);
>           object_initialize_child(obj, name, &s->gpio[i], TYPE_STM32L4X5_GPIO);
>       }
> +
> +    object_initialize_child(obj, "dm163", &s->dm163, TYPE_DM163);

The DM163 is another chip, not a component part of the SoC;
it belongs to the machine and should be created/wired in
b_l475e_iot01a_init(). Similarly to the IRQ splitters.

Keeping board component states in a Bl475eMachineState structure
could help organizing your model. You can find an example on how
extend the MachineState in hw/avr/arduino.c.

You might call qdev_pass_gpios() to exposes the SysCfg lines out
of the SoC.

Regards,

Phil.
