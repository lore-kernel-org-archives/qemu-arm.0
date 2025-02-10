Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp1990365njb;
        Mon, 10 Feb 2025 06:53:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV/o+rCa9bimEPl4/GKZtKNnvSYPFm7h+NHTbek6TcPsbOmwwwxFWEGDAtDe8s70Ju4gGsRCip3jGG9aQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH82fAgIPnKo7J5W2QBsEIKwAvFi6dWhsi/ohFSCKJTfUoecQZNuW7SNuMSNbLQwqJ/mlhZ
X-Received: by 2002:a05:620a:2951:b0:7c0:6809:e99c with SMTP id af79cd13be357-7c06809ef5fmr79973785a.7.1739199224856;
        Mon, 10 Feb 2025 06:53:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739199224; cv=none;
        d=google.com; s=arc-20240605;
        b=XU17fjHJmCdldD7bcPzIiSQzsec3ql/bswM+WLUpX64kTE58n7+qdDjJEW4Ki3c+F4
         u+dpGNqdhT4IzdXk6xXj1tSN4O63H0vUip08X19vCydk0IXQADGYg9PBmZWu9NBKMe0j
         o3RFo7KbBdiHaxvidKCwaEetH8ufbMMXYawtmDqDqb3HJzIFp//t10b/my3pYYUNAeSo
         xpwO2M7fAsNfkEuBC+/u/1aeuuFBon1N6Nqrl373Wgo3o0El0mWyJQ6nJsEpbwoRpkiO
         UoFULEQY+3YKqXk+Um1Ml4RBZJPCR/6P/AkIp+G1zaKEUHiPVotnSqOx3rt7+mfC2cSp
         WOpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=rWhDsEiYuxRKPXphxfZ/7andCBJuLYjmYo9q0Z0tb7o=;
        fh=x03RV1Ej0T1wB3m81Rst3lNRLA+4GyNB42CwYQgKzu4=;
        b=Kg6Ms5HC5iyVH8zajiGV6bvzGNP6bnbLrjsbBKO+cNNvp1e5GzHu8tlIGTg11LzI3f
         9ruyK85rAuTd4FpcCxOZFmVYq/w7mtE2VhqckTCU1HjVxqB1CLX25K1oIA/LhEB24ulx
         V0DZTRC2wio6XJn9LFbQciBhaZlz/0C6ApB14jRHhh+S7M/ZFIyOFeB72G4gXpK6YJ6w
         qM2IXPl3v8/A5lTh1byWi1o7hnhd0uRQ1uu1CBlA+nbP+MPlIYjoDUk1tBn6jJfVUX8D
         gaA4sCSmHZmwSoAelcDYm/Fp1jtUj1M6qGPXhPEJnc9G/WLKFrvgpIhgEs7ZUDZJYXLZ
         Plfg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a97WZc3y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c041e949acsi965727685a.264.2025.02.10.06.53.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 06:53:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a97WZc3y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thV9t-0000Gz-6c; Mon, 10 Feb 2025 09:53:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thV9r-0000Fg-Sf
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 09:53:12 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thV9p-0003Jw-AH
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 09:53:11 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-38dd14c99d3so2056143f8f.3
 for <qemu-arm@nongnu.org>; Mon, 10 Feb 2025 06:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739199187; x=1739803987; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rWhDsEiYuxRKPXphxfZ/7andCBJuLYjmYo9q0Z0tb7o=;
 b=a97WZc3y5ISnXUr8VDsvzHKtilNR3n6vjmH04WX8KY0s+uCGyfOgVXxq065cZRd26g
 y4cs9sucXit/ra41ybK10i4TZ6L1pTI7UMwZRhJ0FrSfbaNBmRd+EYzpgv675s6UyHzM
 BbWynKjz/YO3mVbi19CrwbbKFDroeOdgIpiXB0gmfRjy1IGSHXVGeH4kGJToPBS8rwqa
 EsIXNuouDha6TYTU5ue+RqbladsoreD4hT0eT8tw5J/RpPvZvgTjPFC7llQtS1eTBh8K
 nEaQX52XOkSCU+y/e0F/fZT1IV8SGk3S+0krYx3vEIXGEKmx6v51FUgYa23+4zhE95dH
 Kr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739199187; x=1739803987;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rWhDsEiYuxRKPXphxfZ/7andCBJuLYjmYo9q0Z0tb7o=;
 b=TKk4SxWsXwUkI2ab5eTRVVulCjqDGKXZDspjOW0JfbFQaAlL/wakgTOOYiMM+cd/Ps
 aZwN2TVFU7uXM6JtMERCfSYqP1FS09IoI0xROK6wStE3pnXQ1dFfj/8Q1rpazmA8Iii8
 KLBXlFRhunIOvXiIrqLeAvz9bPpLL50VSg+QGssYvrX+s0z4sG0o1+2TSUVlQrsbYwTI
 BBJGur8WeBbQr7z2PItgiHJ250Gw0NL2sohr6qpzkSSM8WkQhQvUqGSALZBzJP+D6Md8
 Ea7wk5d+SiG+FjkUSeVFlSE4K/ghL7QuKD540mwF/V49ddyTi4hStY8GJ3v86tPI5HqL
 rX7g==
X-Gm-Message-State: AOJu0YxbjjZ4IYEJXIrpXj36mQxbSGXrrEHWCwlVwraNCUsaSMSrdCmE
 U6Dl2032mQWxyHuqy0xNw6YY6k9Xl96geXxLIK/BpS9jtaWwXToMxlPJW8RctdM=
X-Gm-Gg: ASbGncv9IgT4B5nbNWfTRK4eUjoSjhNfhzuoRSI6zCqaZCxe/iujKpYOgix4e0ujEA+
 0iOuiouj1WXkw+UM7KjPKXBuZDYn+ZBs8xgd/rBUm9bsteSafIDIM/qe2kjHNBeADN6Eg3hdlQz
 jTAo8R5GLAZZpIkoa0ipCBn0CCjxuqxr2nuE9QuYcWgHRzsYZLK21TujEh0wPEM/2LbEw/NNDAO
 jIKFTGjuEPnY2BQekPIWuu3V3Br2aVtaWDw/TX5IZhYOKSoBE5t6AGrg/hWj1pqDdgdtBeVQza9
 x94r7UPZ/pju/1BYsxG8XAQI2OClS6jNOaZQ4GrlhCSD+aT6NykJqFDTiI0=
X-Received: by 2002:a5d:6488:0:b0:386:375a:8322 with SMTP id
 ffacd0b85a97d-38dc8dc0ab9mr12451376f8f.13.1739199187449; 
 Mon, 10 Feb 2025 06:53:07 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dd9552667sm4908649f8f.45.2025.02.10.06.53.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 06:53:06 -0800 (PST)
Message-ID: <4f8886e4-1c00-4fa6-99aa-d5952842042c@linaro.org>
Date: Mon, 10 Feb 2025 15:53:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/17] hw/arm: Add NPCM8XX SoC
To: Hao Wu <wuhaotsh@google.com>, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com,
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com,
 titusr@google.com, chli30@nuvoton.corp-partner.google.com,
 pbonzini@redhat.com, jasowang@redhat.com, alistair@alistair23.me
References: <20250206221203.4187217-1-wuhaotsh@google.com>
 <20250206221203.4187217-16-wuhaotsh@google.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250206221203.4187217-16-wuhaotsh@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: miWOxPMgWulu

On 6/2/25 23:12, Hao Wu wrote:
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>   configs/devices/aarch64-softmmu/default.mak |   1 +
>   hw/arm/Kconfig                              |  13 +
>   hw/arm/meson.build                          |   1 +
>   hw/arm/npcm8xx.c                            | 804 ++++++++++++++++++++
>   include/hw/arm/npcm8xx.h                    | 107 +++
>   5 files changed, 926 insertions(+)
>   create mode 100644 hw/arm/npcm8xx.c
>   create mode 100644 include/hw/arm/npcm8xx.h


> diff --git a/include/hw/arm/npcm8xx.h b/include/hw/arm/npcm8xx.h
> new file mode 100644
> index 0000000000..2c8cfb1289
> --- /dev/null
> +++ b/include/hw/arm/npcm8xx.h
> @@ -0,0 +1,107 @@
> +/*
> + * Nuvoton NPCM8xx SoC family.
> + *
> + * Copyright 2022 Google LLC
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
> + * for more details.
> + */
> +#ifndef NPCM8XX_H
> +#define NPCM8XX_H
> +
> +#include "hw/boards.h"

Not necessary (MachineState is forward-declarated).

> +#include "hw/adc/npcm7xx_adc.h"
> +#include "hw/core/split-irq.h"
> +#include "hw/cpu/cluster.h"
> +#include "hw/gpio/npcm7xx_gpio.h"
> +#include "hw/i2c/npcm7xx_smbus.h"
> +#include "hw/intc/arm_gic_common.h"
> +#include "hw/mem/npcm7xx_mc.h"
> +#include "hw/misc/npcm_clk.h"
> +#include "hw/misc/npcm_gcr.h"
> +#include "hw/misc/npcm7xx_mft.h"
> +#include "hw/misc/npcm7xx_pwm.h"
> +#include "hw/misc/npcm7xx_rng.h"
> +#include "hw/net/npcm7xx_emc.h"
> +#include "hw/nvram/npcm7xx_otp.h"
> +#include "hw/sd/npcm7xx_sdhci.h"
> +#include "hw/timer/npcm7xx_timer.h"
> +#include "hw/ssi/npcm7xx_fiu.h"
> +#include "hw/usb/hcd-ehci.h"
> +#include "hw/usb/hcd-ohci.h"
> +#include "target/arm/cpu.h"


> +/**
> + * npcm8xx_load_kernel - Loads memory with everything needed to boot
> + * @machine - The machine containing the SoC to be booted.
> + * @soc - The SoC containing the CPU to be booted.
> + *
> + * This will set up the ARM boot info structure for the specific NPCM8xx
> + * derivative and call arm_load_kernel() to set up loading of the kernel, etc.
> + * into memory, if requested by the user.
> + */
> +void npcm8xx_load_kernel(MachineState *machine, NPCM8xxState *soc);
> +
> +#endif /* NPCM8XX_H */

