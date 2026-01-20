Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D597CA5FB5
	for <qemu-arm@archiver.kernel.org>; Tue, 20 Jan 2026 17:00:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1viF5N-0000nG-QL; Tue, 20 Jan 2026 12:00:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1viF5E-0000ew-Ad
 for qemu-arm@nongnu.org; Tue, 20 Jan 2026 12:00:00 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1viF5C-000784-JA
 for qemu-arm@nongnu.org; Tue, 20 Jan 2026 11:59:59 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-47ff94b46afso193355e9.1
 for <qemu-arm@nongnu.org>; Tue, 20 Jan 2026 08:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768928397; x=1769533197; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LmCUs282K4/tylcg9QZD7xuR1Rh/5OFRlrbEouPAO4w=;
 b=qU1ZXc3De0YYhLmx3UNEl3UpQAK3R93Y3Zt7sQETkluD+dMm3fqMkOrizos8ocTjqT
 fYbvrxIrMdZBOhN//lyCud+8KauFVIfrUD1Ak2Sk7m9SmSbMX7a4tJWloqWNT331RchF
 bry1sWRLhEGaBi2QUi3qOj4Ga3NA5YS2/Rjh9fx6dSgzsFan0DGkhYcBrX2Ks9uU2guM
 KBWnQ/ahsmQsxYQiUWJcb5iSWyKgqAQmeu0qkx4Ii0qiltDw9ov4Ed3nnB3h09dmy47W
 zOD3x6xTz/Voy2aG2eVHPCRwxqWdhPCLt7zSvSzDdEdo0sLCtwgM+mEDpx0HxBUgM7J5
 F/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768928397; x=1769533197;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LmCUs282K4/tylcg9QZD7xuR1Rh/5OFRlrbEouPAO4w=;
 b=tutSEfmmsjJYrL5KhknQapWYem8i7PdFb+jQFU1/Oy150dAUAmOSaO46oU0lnv89iE
 2L5EddfvEgJVwCu8558IrYofP0F5RXX1XJRX4DAlGVFIuKuxlS2zeIj4c3K1F6h0m0vs
 aYnyTycznqeCxPUikF2UDb3AM4Sye1/ZyDJJ0R7JTJfnhCUkVVFbd/xfhZX73zEkaIZg
 jQeZcWu4d6zyqwv08EN6b/XIT9/3+lwGyUtDkf2ENZ09kiAmNhJrT1inAFX1lc+44gED
 DWl+AtlvjaR2IOWIQj9f50cWcSBJRXfRHisgYpjxzYAMW7cjPyDJbI8Hn8m9LQ7NSxGN
 PXSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGbp/7Y3lDu/QSRz3pDxe7Wto8j6QiiIMDqgG8Z1xmUbsZj3mmBxMk06Vx9YmCkpVV+lgBNqgDOA==@nongnu.org
X-Gm-Message-State: AOJu0Yx7DIYAOF1JKI+BAbe5OxS1pccGwOvqVK+l7yzzMBMtFxguAXwW
 ZR1sdHpn/rPQmke9IyBvp9n76vtC7ECNUM57BKw2HGtb38s7mtDWKVHTLenwTnvx5NM=
X-Gm-Gg: AY/fxX5l5xJ8SHIXwRpbPlyVITk76uEZgASDuJjI2UlhWU9we68NmJc4pBuT7T4G9Qd
 xciYFqlQOUWm+1unPtIe6l94flLEMfcDPhcTy4YLoN/9Pts0X2sR9cWzRTqIpq18uLrJGA0ZliJ
 lyhFD6zdYWUd7JWG7IPWLmtHj9WUcKkNQ7yU+rvDpz7X6TZ+zarTC+SL19qV/P9xj8k6l+67AL6
 wIplaD1XiL1j+R4MX+80lJ1fjJcPI13SHDgzEjDTN/X7NX0afVBXfY7UXf78aGXeMgSijKnbCo9
 1s7HEZofqyRca8DA3JI3L/flbMjou+Oxc64LP7sOzXsWFQPrzlD+CnF3EZKe0uxvc3JC/yhGIQz
 3Mj/UWvOhoG5dmaghuoIQMnW7YAKQeBNVFXRRBpv57K4Xa3kd66W1OS2zSou297CdOVKHvQ7GW8
 ltr2Whpq4DOL4oXndqSZ993Lj06tlYQcwiVlc1ZDAyl2S6w1VeABOLeg==
X-Received: by 2002:a05:600c:8208:b0:47e:e981:78b4 with SMTP id
 5b1f17b1804b1-4801e67b738mr194331985e9.12.1768928396810; 
 Tue, 20 Jan 2026 08:59:56 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4801e86c00esm252289045e9.2.2026.01.20.08.59.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jan 2026 08:59:56 -0800 (PST)
Message-ID: <ae4c2553-c82e-4ba5-a79d-535e02b39e44@linaro.org>
Date: Tue, 20 Jan 2026 17:59:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/14] Freescale SDHCI Fixes
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>, Bin Meng <bmeng.cn@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org
References: <20260112145418.220506-1-shentey@gmail.com>
 <4add79fa-6cee-4795-96e9-033ae98c472e@linaro.org>
 <3F4EA15D-0769-4FF6-BC25-B1052EA69032@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <3F4EA15D-0769-4FF6-BC25-B1052EA69032@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

On 18/1/26 23:56, Bernhard Beschow wrote:
> 
> 
> Am 18. Januar 2026 18:23:11 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
>>> Bernhard Beschow (14):
>>>     hw/sd/sdhci: Fix TYPE_IMX_USDHC to implement sd-spec-version 3 by
>>>       default
>>>     hw/arm/fsl-imx6: Remove now redundant setting of "sd-spec-version"
>>>       property
>>>     hw/arm/fsl-imx6: Fix naming of SDHCI related constants and attributes
>>>     hw/arm/fsl-imx25: Apply missing reset quirk
>>>     Revert "hw/sd/sdhci: Rename ESDHC_* defines to USDHC_*"
>>>     hw/sd/sdhci: Consolidate eSDHC constants
>>>     hw/sd/sdhci: Rename usdhc_ functions
>>>     hw/sd/sdhci: Add TYPE_FSL_ESDHC_BE
>>>     hw/ppc/e500: Use TYPE_FSL_ESDHC_BE
>>>     hw/arm/fsl-imx25: Extract TYPE_FSL_ESDHC_LE
>>>     hw/sd/sdhci: Remove endianness property
>>>     hw/sd/sdhci: Add uSDHC-specific quirk
>>>     hw/sd/sdhci: Remove vendor property
>>>     hw/sd/trace-events: Remove redundant "SWITCH " command name
>>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>
>> and queued, thanks!
> 
> Thanks, Phil!
> 
> Could you do me a favor and drop patch "hw/sd/sdhci: Add uSDHC-specific quirk" for now? Although the patch does solve a boot problem I think it needs some more thought. Thanks!

Done.

