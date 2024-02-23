Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp525694ejf;
        Fri, 23 Feb 2024 04:27:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUXh79tw0Vy2VgVYirktdAwe+UKMru8BfJyQg9oATtm8kspXoWa4/mK71nLdBRALD9XuxKlP9gkDzMwksqekkXd4lRqcXqr
X-Google-Smtp-Source: AGHT+IEtgsOEgkHLHBh5T2RFMA7clc9Bxi/MxJTmvH3eptA6d/lSKFcb9f0GaLl4oOIPr1jm7eL+
X-Received: by 2002:a05:6902:1351:b0:dc7:1d:5db4 with SMTP id g17-20020a056902135100b00dc7001d5db4mr2092551ybu.34.1708691233063;
        Fri, 23 Feb 2024 04:27:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708691233; cv=none;
        d=google.com; s=arc-20160816;
        b=fZsJGAiUkA5AAtbSuDAbF6wFxvH8CZNNWOgoylgpbmpsy8h1sp/SoZslu7jstKVIX1
         u4J6D+8L0itm5gQOfXhNVexkleffT3zn16u3w7SkBBbiE4ETklNQk+ImruaSCMI5AzV7
         dlkKhCBIERpThLSZRrD5T4whttlPkavooPLVxSfeBewHPmxetEVzkreP5jpLsaPV5NZy
         K01+Wfrkabkd0PFiyFwIDYygX06aQi8VjuF5LSgFhWsM2cL9DwQu8RgpDalqgdEU7AEx
         F0teeCR1YcN9oi8lEZnLmBLxjpolZo6hFPmU9gJ6SMwFy2vPc5h1AkQ4psAS3wDFg2c9
         jqfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=zfoVqz9hrWMYTu3FBjcdg+zNi/5qfs8T/qrZe8dDN4Y=;
        fh=NzHT1zli0NSjL1HfuceSHymolyCFY2nEd3hPf6oVDX4=;
        b=c0l9S1HbqgUEmuxUfmOQy/HOClUCXy/qflxdVnLWIbkREoeJxCIkH2++8YdIwvLoYn
         YpoBKVebhYaFBJ8kOo8g1L9hYeNrVPtZV+TqWP35Hoye1ypB5Muxi+RyUk+hKsCV+pNf
         /yr5Hmy5dHL0QDOOM/MFhkxvremw+vp/yXj2K9dUhwhdla97qEJcrMg+LqiaVP50Su8k
         GnMI72+d9AvvVfp+T9NSgcIEYYNhfgwMSuBFdJXhN/uCVLlroLcD5n3XRxyLXDL3EVy6
         mGGOjvBWIvZ4qvZzAtoErjEvQFQxkp/qcRnhJETcI2/mbpy348UedOYa7t3lqWySk1g1
         CbsQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vCgbjEtj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c19-20020ac85a93000000b0042df364fbd7si15331769qtc.546.2024.02.23.04.27.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 04:27:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vCgbjEtj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdUde-0002nJ-Jv; Fri, 23 Feb 2024 07:26:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rdUcA-0007Jx-59
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 07:25:18 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rdUc8-0000Uq-Ir
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 07:25:17 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4128fe4b8c8so5420575e9.1
 for <qemu-arm@nongnu.org>; Fri, 23 Feb 2024 04:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708691115; x=1709295915; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zfoVqz9hrWMYTu3FBjcdg+zNi/5qfs8T/qrZe8dDN4Y=;
 b=vCgbjEtjHGJaJHoWUMuMA7uLXovXPiJqTaAHqtvbW7VFMG0A9d8fBYmHsxI/bFEhqw
 NxmGfdZBGWr02gC0UzHAyC+hFGz8rg0goWDRdF0TEL+ncNuJEUePl5loZ7Q8UZBjr/+t
 fDneHj2DZrH/Kp0emlQVG5mJS+3XJwaqSl1/ZQOSafeGnyG1GSKOivy+BH0eODgRP3gU
 sExGKp0mQa/TNx/YjB5DSlyLN/XLgAvgzwy80RT0wVlI8WiyoebU6TQYF9yPjk+8yqrO
 EQGEqaRDLk9+tkz1p+BtLmx7iBZyT3NYKyou9DUQGegRGQcPjXBYPAQz7rRbC9Zv1fy1
 d9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708691115; x=1709295915;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zfoVqz9hrWMYTu3FBjcdg+zNi/5qfs8T/qrZe8dDN4Y=;
 b=b4b8iidWjDMXD/EH9rIdnbDwqcsEA1bJ0kqNhEL48OKJUTJxN8drStn/RnMHaVZGK+
 w4xlWy0Z5foNoA/BkpVfIYt/XogHKM/O0L40bYWvNmFijwMxbT4jA/TU+BsvCqQ7HlqS
 bt4xrw/I+h/gNXCr97JNZlXE+aXhSDDOiLwnMlqrsrxEB/FNV8FTAYEFj43W9VYIH6Tj
 g6NlCMPVSGn38fHNo077oE7/pENU/5XKYxS98+81KD0t03TN+IWnbk7EaRpKZFKH+wbu
 hRIqnAc2Rk4Whpe4FTSoC5CItjUUc2XwdwK2hNLcoGpd/P+6pkjIHKqkAAeGQK0v25Fz
 /ZCw==
X-Gm-Message-State: AOJu0YxGDDCqhkY48S0eOKfAKZ4zl8BEcY8IbTaIjiBE4SolkehGpSgt
 /friFe5v158IPf91Mdkh0chMpdM9Ud21MqBlq/JZyYdYdEbppPqgpkHxQPqaFOA=
X-Received: by 2002:adf:eb51:0:b0:33d:88c1:31b8 with SMTP id
 u17-20020adfeb51000000b0033d88c131b8mr1378718wrn.60.1708691114979; 
 Fri, 23 Feb 2024 04:25:14 -0800 (PST)
Received: from [192.168.69.100] (sto95-h01-176-184-18-96.dsl.sta.abo.bbox.fr.
 [176.184.18.96]) by smtp.gmail.com with ESMTPSA id
 v11-20020a5d4b0b000000b0033d90b314e7sm2631441wrq.101.2024.02.23.04.25.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Feb 2024 04:25:14 -0800 (PST)
Message-ID: <f350fbb7-b954-4bb2-abf4-05ad049ceeae@linaro.org>
Date: Fri, 23 Feb 2024 13:25:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] hw/arm: Connect STM32L4x5 GPIO to STM32L4x5 SoC
Content-Language: en-US
To: =?UTF-8?Q?In=C3=A8s_Varhol?= <ines.varhol@telecom-paris.fr>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Alistair Francis <alistair@alistair23.me>,
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>,
 Thomas Huth <thuth@redhat.com>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>
References: <20240207132517.198348-1-ines.varhol@telecom-paris.fr>
 <20240207132517.198348-3-ines.varhol@telecom-paris.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240207132517.198348-3-ines.varhol@telecom-paris.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
X-TUID: X/SqCe2e8IXq

On 7/2/24 14:23, Inès Varhol wrote:
> Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
> Signed-off-by: Inès Varhol <ines.varhol@telecom-paris.fr>
> ---
>   include/hw/arm/stm32l4x5_soc.h |  2 +
>   hw/arm/stm32l4x5_soc.c         | 78 ++++++++++++++++++++++++++++------
>   hw/arm/Kconfig                 |  3 +-
>   3 files changed, 68 insertions(+), 15 deletions(-)


> diff --git a/hw/arm/stm32l4x5_soc.c b/hw/arm/stm32l4x5_soc.c
> index 347a5377e5..ff38585dd6 100644
> --- a/hw/arm/stm32l4x5_soc.c
> +++ b/hw/arm/stm32l4x5_soc.c
> @@ -78,6 +78,32 @@ static const int exti_irq[NUM_EXTI_IRQ] = {
>   #define RCC_BASE_ADDRESS 0x40021000
>   #define RCC_IRQ 5
>   
> +static const uint32_t gpio_addr[

NUM_GPIOS

> ] = {
> +    0x48000000,
> +    0x48000400,
> +    0x48000800,
> +    0x48000C00,
> +    0x48001000,
> +    0x48001400,
> +    0x48001800,
> +    0x48001C00,
> +};
> +
> +static const struct {

gpio_addr[] should be moved in this same struct (eventually
naming it stm32l4x5_gpio_cfg), since the init val are related
to the gpio peripheral / base addr.

> +    uint32_t moder;
> +    uint32_t ospeedr;
> +    uint32_t pupdr;
> +} stm32l4x5_gpio_initval[NUM_GPIOS] = {
> +    { 0xABFFFFFF, 0x0C000000, 0x64000000 },
> +    { 0xFFFFFEBF, 0x00000000, 0x00000100 },
> +    { 0xFFFFFFFF, 0x00000000, 0x00000000 },
> +    { 0xFFFFFFFF, 0x00000000, 0x00000000 },
> +    { 0xFFFFFFFF, 0x00000000, 0x00000000 },
> +    { 0xFFFFFFFF, 0x00000000, 0x00000000 },
> +    { 0xFFFFFFFF, 0x00000000, 0x00000000 },
> +    { 0x0000000F, 0x00000000, 0x00000000 },
> +};

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

