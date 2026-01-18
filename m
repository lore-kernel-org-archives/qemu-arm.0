Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678BEC98315
	for <qemu-arm@archiver.kernel.org>; Sun, 18 Jan 2026 23:21:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vhc57-0008Bh-Qg; Sun, 18 Jan 2026 18:21:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vhc56-0008Aq-G4
 for qemu-arm@nongnu.org; Sun, 18 Jan 2026 18:21:16 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vhc54-0003jw-Sx
 for qemu-arm@nongnu.org; Sun, 18 Jan 2026 18:21:16 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-47fedb7c68dso24094805e9.2
 for <qemu-arm@nongnu.org>; Sun, 18 Jan 2026 15:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768778473; x=1769383273; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oi+8iRPhyIsFnki7pDengp9/o/rjfpHUeK4b5AYYbhs=;
 b=gzRtUbQr4Kn5WEeItBwS/7o0v+k5dUsgrnb3gfKaTcqpG6cW9VyAp5APsp9X2iUTBL
 AQHOvNTDbcDx6VPf521I4l9sFzXPwGvtabQpBVeLSc5kd3F2R8bIpinCRuUEocVs4KiX
 s2u3Qozg9S+S+gphPUlanCUtjfJuL/hi1TE1V6gBVaOTwgEoDr1AdVD8q20hhDkf1H7P
 PFSGGLyWlnxFFhE1kJkIcCeh0lGmgWNz0PeCiOV4C5bk+QR3pBJLpkwrL6PYKkZ0f9U1
 j00b/mh5tHPNEfq74FjJ7+PLwsRPFt0LD0QaDBoDEVWW5xZ7gFvortnxd0DmfHyc9XSZ
 UrVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768778473; x=1769383273;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Oi+8iRPhyIsFnki7pDengp9/o/rjfpHUeK4b5AYYbhs=;
 b=HnzymM+4KNCt+MugNUVZx6wsPFcHw25DBZuXDB/EGenvyFKbzEiXXZo2DOb2o276Xl
 SCDN+t3rcne5icwkgDzAr7zXPhX75fefrwzY5mok4CcgQe5vjdsnZRz/kwoVkIZ9MhUv
 vAZsNr507s0FZA/8NAI0eRvLS9p9PFjWfpktYD5s3bWHlEcxCYQpx5dhj2SQ1DM3VKdX
 Ehrcm67r76RlUSiKPqmcdK5XwN91kjD9doEtqnhoZnXtRg6fp6/FGGIfbWTO572EGFCt
 vR12MMeIxM402gemkeTdNnfSOVjmAzBnbQLb2UjB7abGanVRy5tQsiT3Gk1w0NzdX/B8
 vMwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyfZqou7sp86njjoiaCAfDgXEf+rG+cBPYsWiXH/F396CRBqSQPGPsW+LIWCYlMRs87YtL/3Kt7Q==@nongnu.org
X-Gm-Message-State: AOJu0YxdJfj+/PamA04xUIaRwGyBZPQxA1uWzWKsyWF1vxd23OKQPx9C
 hVUAF2Npp6WbAYytuDY1jWkISv+2afoCZq3BaqIxZye1y7ngS2k8UzVq
X-Gm-Gg: AY/fxX47OwlvLyyrU3UIF83bPuK2unFpZN5PK+DMaRAyDWvnSC49/xbz0WVF22lAWCN
 g/oaw9QGeykEnhPfO/MNO08rTVEL3re1vxhFGoOe6jW2H8q4q1zFK2HmQX6W37Rc9UamTc+cF9F
 q4R1vgOlT8aFocz9lmfr1jAowjaOgm6A4Xbnovap+2q/EGBHBIB1RuYDB+V2g00QXjNrIUwjbeX
 RcGPcrXY2Q0qHs9Nn8BHpPxtkoZMC6RBJgsKw1YHznRRrxHR8UmRlBPcV5MXaqLzgk5OuRViTpq
 YniUm73JAAu9m9aiEtPDpWx7h5JVz/1/chy0chm6b88dNf4fkQGTPXRU327MNMu9CDSNRVHIPND
 Ud2xsyStIaWdc+HWe8RgauqVJWKCR1uYH/lStdIJL61SKvgtPV1IkjcTNS/Zbmv+PrwpL8VW4Y5
 j8EMz+XAGBvHK+TYeRo4PzPu3oxjyJPqo8K3l9aEqcYrdB6NwJG50HMVOnGBP9WbJkIU//iqxqI
 kftqWr/r0fXTVtvevkvEhvYs/alEtUXYP5C9LVl3iPorQ==
X-Received: by 2002:a05:6000:2c0a:b0:430:ff41:5c87 with SMTP id
 ffacd0b85a97d-43569bd490amr11644588f8f.60.1768778472368; 
 Sun, 18 Jan 2026 15:21:12 -0800 (PST)
Received: from ehlo.thunderbird.net
 (dynamic-2a02-3100-2f50-f200-f91d-651c-a220-693b.310.pool.telefonica.de.
 [2a02:3100:2f50:f200:f91d:651c:a220:693b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43569997f41sm18664913f8f.38.2026.01.18.15.21.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jan 2026 15:21:11 -0800 (PST)
Date: Sun, 18 Jan 2026 22:56:29 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>, Bin Meng <bmeng.cn@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH 00/14] Freescale SDHCI Fixes
In-Reply-To: <4add79fa-6cee-4795-96e9-033ae98c472e@linaro.org>
References: <20260112145418.220506-1-shentey@gmail.com>
 <4add79fa-6cee-4795-96e9-033ae98c472e@linaro.org>
Message-ID: <3F4EA15D-0769-4FF6-BC25-B1052EA69032@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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



Am 18=2E Januar 2026 18:23:11 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <p=
hilmd@linaro=2Eorg>:
>> Bernhard Beschow (14):
>>    hw/sd/sdhci: Fix TYPE_IMX_USDHC to implement sd-spec-version 3 by
>>      default
>>    hw/arm/fsl-imx6: Remove now redundant setting of "sd-spec-version"
>>      property
>>    hw/arm/fsl-imx6: Fix naming of SDHCI related constants and attribute=
s
>>    hw/arm/fsl-imx25: Apply missing reset quirk
>>    Revert "hw/sd/sdhci: Rename ESDHC_* defines to USDHC_*"
>>    hw/sd/sdhci: Consolidate eSDHC constants
>>    hw/sd/sdhci: Rename usdhc_ functions
>>    hw/sd/sdhci: Add TYPE_FSL_ESDHC_BE
>>    hw/ppc/e500: Use TYPE_FSL_ESDHC_BE
>>    hw/arm/fsl-imx25: Extract TYPE_FSL_ESDHC_LE
>>    hw/sd/sdhci: Remove endianness property
>>    hw/sd/sdhci: Add uSDHC-specific quirk
>>    hw/sd/sdhci: Remove vendor property
>>    hw/sd/trace-events: Remove redundant "SWITCH " command name
>
>Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>
>and queued, thanks!

Thanks, Phil!

Could you do me a favor and drop patch "hw/sd/sdhci: Add uSDHC-specific qu=
irk" for now? Although the patch does solve a boot problem I think it needs=
 some more thought=2E Thanks!

Best regards,
Bernhard

