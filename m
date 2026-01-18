Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF40D4A5F4
	for <qemu-arm@archiver.kernel.org>; Sun, 18 Jan 2026 18:24:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vhXQk-0006Pm-GG; Sun, 18 Jan 2026 13:23:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vhXQi-0006N6-KA
 for qemu-arm@nongnu.org; Sun, 18 Jan 2026 13:23:17 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vhXQh-0000Bw-4l
 for qemu-arm@nongnu.org; Sun, 18 Jan 2026 13:23:16 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47ee937ecf2so25584265e9.0
 for <qemu-arm@nongnu.org>; Sun, 18 Jan 2026 10:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768760593; x=1769365393; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XEsuZ2C9AXD2j/4UoVjq8Dd5rAdmuTsgzxDGxkYkryU=;
 b=Dy6eJlDdsQhIw4HlfuXJWDTFsM6K6cEikA+87vCcmdd7wqsfOj4rK1NdnTiVR+vep3
 JzbmtekAb9j/wbZ8Rc4Gmgtx8nN0Xd+sC1EpjwjuNkPM6HJNwmuhrEjW8ShKW3xibq4e
 eE8CU9tyPeuqKrv2N0pDJVGTCV4pSPPHF+k8TGF5wdAnZQt6jXiOLhsgAQ2fmYK9JKIK
 GNZDNr/ohx4XRO5vked4Tp2r/4OIAk92hALBKb2vEZXQvr+TPeuYtmlciqpCm+wRvYep
 duUE13hU4F+KjlqM5HqtOZBSl9NO7myCfr7b8/VlR2Cg43BKCER6U1bP+jMMQMmL6Pxz
 Cyig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768760593; x=1769365393;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XEsuZ2C9AXD2j/4UoVjq8Dd5rAdmuTsgzxDGxkYkryU=;
 b=w8Gxk2Z9L/1EoR3EmdG8Rlixw+4VDBubxcrnVD40YQbdEyuou134AjbMhBwf7dM3AN
 h/nEenORc8TQWngOMZ5zr/vAPQu/s1Jh5wAuDpAf3dzdAuVsSUyPcbvT1TY2/XENsVRI
 Oy0ixRVUiW7ok9IrmKLhd6M1aq4eo1CT+wJM54qOUa0Kn25f32NG9BGdTTtEeHS0yYAS
 DYzrO1tHnx+cbNksxZvUKjYcybL+U7LBSTZV9jegUEOzJl7q9xmEkG/cSq0QhCWlfrQF
 Fp6Tr9OKbCpkHYq2+37Ys4u8eFlClcG4E/lAw2kZSWleLQ7Hw8QreM2I417GbejMT15f
 YWAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXSb0V3G9c1Eyec6Wdmw1cNDXMh+qSbl2gk9+xOyA8dL3V1SzBaQrnoxkE/YzVr/UjNpIHGIStFw==@nongnu.org
X-Gm-Message-State: AOJu0Yxncg1Az+HsJG93O0mzM3RgRdpeoATeu1wT/9fjbPUTIofIcMK2
 wYElpapyKF1IUg/pG506DuSJMIJNtE7W+4uP2eAhMjYyn9TItFeznG39xd/Q1enOflU=
X-Gm-Gg: AY/fxX4MWU3/0wPt6O8giHPPJDxrff3+eRN5EQF2IoZQYUzgM0GtzGyL3LT3OC+VMXt
 78C9Gs72evPAvNN/oLlMtobzsi4ShdQvaE9ohSmEq2QHFNnhJINSPIJdc2jV1hoQ8y1z3X5oI5W
 gu3vbw+Ve+6IzQVeWFxVXnl+HM2tvwxPVxB7UyDz/fFNAOsJOFJoMly2Txm3oI9ZImSqymBgpqh
 Y8so2Kpi1R9RNjzUJ3N0Eet7+74t6imV5qMueACRFTn5lAVJ2x/xH7GkrIRmYt6GMCFc47ltf9E
 ibi62U2MvcLF7+XUUISeY/eAoozswmsEwu5NVh7tPfAfw6Kw/bb/JLyKcV8xDtcxqVv8jcCvhzW
 kb84zcaksw7XWk/KaNq+0M59l2pl5RMxBwiMVH7nUm/tQghhKU8pDi3xDejvLeRu6U3Tl2C0qqt
 4VGyzmltx1CWIOBi1EKluOkOWW8TRzslbUMrB//nPr054DgufmuwEEHA==
X-Received: by 2002:a05:600c:470d:b0:477:9e0c:f59 with SMTP id
 5b1f17b1804b1-4801e530e35mr106376595e9.2.1768760593177; 
 Sun, 18 Jan 2026 10:23:13 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47f4b26764fsm208083585e9.12.2026.01.18.10.23.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jan 2026 10:23:12 -0800 (PST)
Message-ID: <4add79fa-6cee-4795-96e9-033ae98c472e@linaro.org>
Date: Sun, 18 Jan 2026 19:23:11 +0100
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
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260112145418.220506-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

> Bernhard Beschow (14):
>    hw/sd/sdhci: Fix TYPE_IMX_USDHC to implement sd-spec-version 3 by
>      default
>    hw/arm/fsl-imx6: Remove now redundant setting of "sd-spec-version"
>      property
>    hw/arm/fsl-imx6: Fix naming of SDHCI related constants and attributes
>    hw/arm/fsl-imx25: Apply missing reset quirk
>    Revert "hw/sd/sdhci: Rename ESDHC_* defines to USDHC_*"
>    hw/sd/sdhci: Consolidate eSDHC constants
>    hw/sd/sdhci: Rename usdhc_ functions
>    hw/sd/sdhci: Add TYPE_FSL_ESDHC_BE
>    hw/ppc/e500: Use TYPE_FSL_ESDHC_BE
>    hw/arm/fsl-imx25: Extract TYPE_FSL_ESDHC_LE
>    hw/sd/sdhci: Remove endianness property
>    hw/sd/sdhci: Add uSDHC-specific quirk
>    hw/sd/sdhci: Remove vendor property
>    hw/sd/trace-events: Remove redundant "SWITCH " command name

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

and queued, thanks!

