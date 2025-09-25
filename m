Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D89CAC5A5
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 01:11:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1aVt-0000ln-HV; Wed, 24 Sep 2025 21:11:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1aVr-0000lK-C4
 for qemu-arm@nongnu.org; Wed, 24 Sep 2025 21:11:12 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1aVn-0000ms-PK
 for qemu-arm@nongnu.org; Wed, 24 Sep 2025 21:11:10 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-45cb5e5e71eso1619065e9.2
 for <qemu-arm@nongnu.org>; Wed, 24 Sep 2025 18:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758762661; x=1759367461; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vhIHUUlhWKAlN5od0xfoeVS0hk23aHhXFxBsfij08Fs=;
 b=WvpVNLVzEcubiAk7KrWW7/T2dbPdNXQ5krXWGudfg3bzKMUhz+Yhfli3oFzy5fhrWn
 2KjqQBvgBbFmlqpLCc4PLCfVIEG/lzhAB0rsIsQTEglwvlotQeA5wItO/Lod5kV+yoR/
 DSVjXCcJVf+QWDTZ18Yt3VWKfpx4RSoNLMpmVe0ZRk4b5tczUoy2r6kx28udYvvdVDrP
 /AH7e3r1+VNO7EAzWiz8lgTjfhzkO+dOKmvesy+6SoX86I08gARhAm43CJlJJ2OcH/tX
 jFZaYO9BHnCPuKjy45sEtEUVhJm0Z8wJfnb0hYt+f24bgFGmX0pcSYlr05znz5sszmIt
 ucsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758762661; x=1759367461;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vhIHUUlhWKAlN5od0xfoeVS0hk23aHhXFxBsfij08Fs=;
 b=bUdbTbTRyLtgx7VwDeguPZaAUb8YB+gYyvkbBe75rM5AHP4vOWA2rWe7zJdZWSjhaL
 WuCg4wht6KzZlRuyrq/+22UR81FXQe6A6Iwo1pFX5wPk5lHhIglM1gsQT2Ns2zHNd63Y
 sS8V3mgajo2/xSQxPU7mM2fNhiVB+bB/+cgw5IkhQlLLCAeV/Nxjm/6Sy9nRXCgGlzvA
 hL+Nhzc0cp4P0ZS3PxDu0gJlIxmGvLgqn6lgb4q5EHwTEZMgp3lfFzXIekOOmPp6P7zT
 GeUD2CAVIyztEWF56Txr7WM7qDZgsQPI92mS7k6AAbHK+JMpZL/lkrQlmjIn2jW09qS2
 e9lw==
X-Gm-Message-State: AOJu0YzzVfvGS1agchSgAOnYSlO24iRLqBwge/xNblDKs4SAHhl29C9U
 NRTZ1TDQlzbxwgxXdMVuDwYLr3BsfjinmCpu9Nl/aWGzoHIpaTfJ+HD/ULIYY5CIF5wLIjexvXR
 Xvtgp+S8PbA==
X-Gm-Gg: ASbGncuPtry9x5QREtvTKEkpYWAFDLCWqumMpuoZhW7xIvhc7VHmymRQCNij1sPf7oI
 ob0rMIBHaLzQPx6qEnGCHuAZqMQGWG7Mz92pkrKuwlyyBIwpDQmaxo5918AUPbzXInp+hB5zSCB
 BC2Irh9UPTxL9EkOgI03qFn+J9GGY9zlhlJT91qtwwGIxiszU/Y0us/bww1JMit5kNMGLcWVc5F
 oh3HedwoBtzY+yGdVRakOlKWMTMq43q7Nsqq6rcDRU0HkFzyozGdTrnVqcr3Ouv/LB5k67HKOeT
 NEPfxCkx0Y9/nh4lBZOIgb6YDRXJYHnLgQOdfPSxNAW6049G8u4gUTI6RqHY6TkleDbqMkD6nrQ
 2yJaG65USJq9efTOvM+lWlNoJjXbXj4bk+B0604RFgUnOAaTSxaL32s78CHoh03uqFg==
X-Google-Smtp-Source: AGHT+IGZCC/okg2JhlLmjECODSxCdvEx8rAnVxDAqRTAE82888s12CHHrbUOsYXtweyE+h0j4mVWtQ==
X-Received: by 2002:a05:600c:4f49:b0:468:7a5a:725 with SMTP id
 5b1f17b1804b1-46e329d499fmr16316125e9.1.1758762660702; 
 Wed, 24 Sep 2025 18:11:00 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2ab31e97sm53790225e9.14.2025.09.24.18.10.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Sep 2025 18:11:00 -0700 (PDT)
Message-ID: <132cc9e6-bab2-47d7-bfe3-c08ac5fc6816@linaro.org>
Date: Thu, 25 Sep 2025 03:10:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] hw/gpio/npcm8xx: Implement npcm sgpio device input
 pin logic
Content-Language: en-US
To: Coco Li <lixiaoyan@google.com>, peter.maydell@linaro.org, clg@kaod.org,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, flwu@google.com,
 andrew@codeconstruct.com.au, Hao Wu <wuhaotsh@google.com>
References: <20250925005832.3708492-1-lixiaoyan@google.com>
 <20250925005832.3708492-6-lixiaoyan@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250925005832.3708492-6-lixiaoyan@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 25/9/25 02:58, Coco Li wrote:
> Signed-off-by: Coco Li <lixiaoyan@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> ---
>   hw/gpio/npcm8xx_sgpio.c          | 134 ++++++++++++++++++++---
>   include/hw/gpio/npcm8xx_sgpio.h  |   4 +-
>   tests/qtest/npcm8xx_sgpio-test.c | 180 ++++++++++++++++++++++++++-----
>   3 files changed, 274 insertions(+), 44 deletions(-)
> 
> diff --git a/hw/gpio/npcm8xx_sgpio.c b/hw/gpio/npcm8xx_sgpio.c


> +static uint8_t get_even_bits(uint16_t n)
> +{
> +    n &= 0x5555;
> +
> +    n = (n | (n >> 1)) & 0x3333;
> +    n = (n | (n >> 2)) & 0x0F0F;
> +    n = (n | (n >> 4)) & 0x00FF;
> +
> +    return (uint8_t)n;
> +}
> +
> +static uint8_t get_odd_bits(uint16_t n)
> +{
> +    return get_even_bits(n >> 1);
> +}

Candidates for "include/qemu/bitops.h"?

