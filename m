Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B2CCD4F5E
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 08:26:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPyj2-0002Sg-9V; Thu, 21 May 2026 04:25:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wPyj0-0002SQ-Uc
 for qemu-arm@nongnu.org; Thu, 21 May 2026 04:25:50 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wPyiz-0006Hd-8M
 for qemu-arm@nongnu.org; Thu, 21 May 2026 04:25:50 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-65c24be9e4bso6123016d50.1
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 01:25:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779351948; cv=none;
 d=google.com; s=arc-20240605;
 b=RLyTbeyMh9U/d/FcxYszIf/N4jRAONHhuGOYQGMKc4l7hPuOwwhvWFxaiJ6X39icQ3
 C72DhKWh+luMwGcIl2gwilu8tsCrRUNy7VZqcoTCb+qATlWqNRTY47X82+T99pnFmE0i
 kFWeKsGhI/fuhsUpW9C1Xp+H1HWD24+OO3KwsD/D4UHp2IY83EqKoNPXtJA6WzNdg3iF
 K3NovkRqkIK1aeQczgnrl53w3PpMuQI5uBJG9GRerq4duMPRKZycSI7RhZo2wRB4qkV+
 fPDSzUsl228aFVNZ4AlQBbfpH+Jlunrj7Sb34Hw4IQlK3IKaj4mqtv3VZeg88JEbO6qK
 wwAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=zviA81fpa7mw+EtXADcpJMm+mlojLlGfZyaJMSq+5XY=;
 fh=UV5DCnEFRo1k3Uqcf0CF3iYKiiHIrQXsV7liJ7bO8iw=;
 b=MWzivKoP8Yhl4DcbG4tod9n+YAOBXhBlQrOEAZrRPHPe9RAbpquJbYmZn4tShzIAER
 Rtgar7i7T6BXR2EPVKhFMtd1hut8iqNUWNqwnckxEo8f732xp2GSPJCCE+1IUxHLVkfJ
 JSvzWAIQXTYv5PfIh0KoZQWcTEs0ycZRTp2qm7UNx5O3u/mwW7+nsUEq9uKPAiI5x2tT
 q9wg2vP6fPhWAmxgxD4A/TZkXeObjNpHoZiIL6Au8cwHjAfbv2QZZp87BxvKB0hQXKvj
 92pMVXwgsKagrfiTsVOTJk4Q/4EMFrui1XmOSz+5zG8M5ST7rLkHkdltdXSXE0Jd7Wgu
 1Etg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779351948; x=1779956748; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zviA81fpa7mw+EtXADcpJMm+mlojLlGfZyaJMSq+5XY=;
 b=L4xUIrY8jWBmMcB3pei8HdTTKtLkl/sPWaRptPEXNqVO7br2c6r+FCfgxKguB0n7X1
 gbs78W+BrIsVnwU17AWpk47uLoB8ovrkw2SuccKpEB2/6BIl/FnLZAANSWVl/KtBl3Vc
 j1qPbe1vq48NhEduNSM3GiiBePmCZyCJh6xsKZcA0RM1pzHCXGW99eTLdB36VGqCwc4F
 awQ+0bFM0h4njLzM9Lu/J6EUz8n4aLLkDwpxotgq8rId49Aaxqf9x/IJ+7Bm88vHwUxy
 kfeKc8UJXWmYPrX6SbvFwtnclDJmjpvaxPJISyNzy79OtBlwMzp+oWkiYIPrhj0/k8TD
 AuSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779351948; x=1779956748;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zviA81fpa7mw+EtXADcpJMm+mlojLlGfZyaJMSq+5XY=;
 b=RrFAQmPJw8Is/Ia0k2WZ3hFwUnZGg6+MeYG6Wptb+D+cfMUHcESXtG91icMblzGO+A
 /8N4wTfJqvjSTX2gSZfS2t61ZXAJGrh5eyTEQsV7A/uQJ1HEKV7HdbH4LJor8AlWUQN5
 IL4kXLTfprWW1DcdievnLVaVYd8lK2/BxQAEYIbIyGnqWd2sE6i/S2hcLIwqIWT9IX5N
 NNB0maJVSoB1+pi/h19f37rnePwFoIezt9WN44pxLYLnZoUSIezNZkvuwT+t84ok8AyL
 bamGq2VHgMppu5S8n7aN+oRfZoVvBLctvgqF23ctBk5yhhOtR21Nq3xw5UxSzP/JT/Bf
 VKxw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/eNl5cCZTFl9nQNnDM2YRFoy/7yHKq0hVhJtr0SjhKbF0ShrIfztb+GH5qS78kAq61GJ+qSOe3ow==@nongnu.org
X-Gm-Message-State: AOJu0YyRkmrc3dV+PX4kzs4iTUKwgZEDZ1+fGlq5yGp/VnaM7w5z9KNn
 f/lH+wkMmA8JKdzx37F0fPlV26d5xgilDlvktz8+0rjTK/HotpYwI+tV8uHavBWUxYProbEc01F
 2nVtW8umPRdTRfBx67mhYTFo3y9TGX9diFNyrYxaMAQ==
X-Gm-Gg: Acq92OGMYCKGe/khuARI8bVwAp356Dwt/P16MPan3VgJmv46igLnwmwHdEOrdSanEpg
 qR+r+Ci3YNNLA9M8PRoWbkQQ5iukIJA7PHJu2z15CuHi/1G7y6mM/KlGfpyiYmqbf9uQW2zwTRG
 3jE4wY9uzSkU97wV2naYF+2fanqkdW9hXv0sa14/I7jLlsG9aAVT4AUyrTxRa3uWSEKLxO1yT9V
 VynNZ/nWgLsm3qYf8NnnCSnSum3U+/yt49qitIYUpG58SBaCkKagVrEKZMkeC2q+FfdSPXAeeP1
 FzWrvMKJX8K8ttkL6f68a9/LjeXV8CE4Etu63ltVI1RAapE9jKSI2fNEnWbrewnpT9I=
X-Received: by 2002:a05:690e:124a:b0:65c:ca50:e5 with SMTP id
 956f58d0204a3-65eadff6929mr1508008d50.27.1779351947922; Thu, 21 May 2026
 01:25:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260520182213.872945-1-richard.henderson@linaro.org>
 <20260520182213.872945-3-richard.henderson@linaro.org>
In-Reply-To: <20260520182213.872945-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 May 2026 09:25:35 +0100
X-Gm-Features: AVHnY4IZkeR-CI4x3VhN5O0TS_DuJukHwWfS9frVZNicFa_xM0sbhaaxTnrBSdk
Message-ID: <CAFEAcA_F72LXF9kWVrU=mSt4=v19jRkDt9XkznpE+7DjVV94kw@mail.gmail.com>
Subject: Re: [PATCH v6 02/64] target/arm: Implement FEAT_FAMINMAX for AdvSIMD
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
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

On Wed, 20 May 2026 at 19:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> +/*
> + * Use float_minmax_ismag to get the absolute value min/max.
> + * Avoid float_minmax_is{num,number} so that we get normal NaN processing.
> + * If the result is not a nan, take the absolute value.
> + *
> + * Note this operation squashes FZ, FIZ, and AH to 0.
> + * Create a fresh status with default behaviour and propagate exceptions.
> + */
> +#define DO_FAMINMAX(NAME, TYPE, MIN)                                    \
> +TYPE TYPE##_##NAME(TYPE a, TYPE b, float_status *s)                     \
> +{                                                                       \
> +    float_status local = {};                                            \
> +    arm_set_default_fp_behaviours(&local);                              \

This misses that we need to keep the default_nan_mode setting
from 's', otherwise we stop honouring FPCR.DN. This will fix it:

--- a/target/arm/tcg/vec_helper64.c
+++ b/target/arm/tcg/vec_helper64.c
@@ -155,6 +155,7 @@ TYPE TYPE##_##NAME(TYPE a, TYPE b, float_status
*s)                     \
 {                                                                       \
     float_status local = {};                                            \
     arm_set_default_fp_behaviours(&local);                              \
+    set_default_nan_mode(get_default_nan_mode(s), &local);              \
     TYPE r = TYPE##_minmax(a, b, &local, MIN | float_minmax_ismag);     \
     if (!TYPE##_is_any_nan(r)) {                                        \
         r = TYPE##_abs(r);                                              \

(or we could go back to copying 's' into 'local').

-- PMM

