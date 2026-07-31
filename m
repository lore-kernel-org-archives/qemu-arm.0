Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2DAC55167
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Jul 2026 17:35:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpr8K-0000Ef-Pl; Fri, 31 Jul 2026 13:34:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wpr89-0000Ai-3m
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 13:34:48 -0400
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wpr87-0006IZ-GG
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 13:34:44 -0400
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-668005ba03cso1569700d50.2
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 10:34:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785519282; cv=none;
 d=google.com; s=arc-20260327;
 b=TTfBvCKIntAxLWucXlRslHwdN3jk0KVviipAoHDMSg7z0lL25oCJavYXecV+bgeajU
 f0+bndFfSySZshwX/ktNhpEcCsrlvl7+Ff4ncWnL80n36mLsLEWckVMvIkoR4iVBS9nU
 dwzGO3psua5eZrI7x3LQMRsfPCqcoy8oY1v7/4JerhQJEILc0xPrkG9H+khhqTodIO+h
 jQM6tNwG4Q7wvuiONfWA2C6rRxnHEi76+qW1jQzmfK1hcGQLa0yUtbTw+PgLzM6tGIxz
 D73c9bWbBvOESn8pYu37V7jn/1pWPVxNrGryi8MfggRCk2QgLBHWlVu+i/L3j2+ZzuIU
 MYLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=uz7UcaWvtjC1VUrg2O/CUC4pLvht0xzhdCbjVXgGzKk=;
 fh=WO8VTBshgz17lurrDUyL+8x8s+TD4zd+3gnQQoXKTg4=;
 b=cAv6wVOR/cl8LvBbq3ikAbLZyaa5ZkB5K38+H4FmHOPpWu9/jVDgrixFehArI3AI8M
 +/FEEETPbQAUhsbdiKJBbOUFomzrwBdVB7YatRjKsS2b9NrdgBlKz+98tVyUfJwbSmuV
 o5gu2QvaMJQfAodSHs/x5+qcIdKZDmQlFySoBJiNmr1tMX+emvGTnwPmeovshcgpr7Vj
 Ws3KIocxSMOkm6Scdbp2gZHV1LE41UP5B7RvE7zCOGo9CpvpdB2BSVyp70VTQxHDiFsj
 XnyumV68XEXIBSB2SgeWpItpevebyA4AE+19Vu59cRiVqtyNMbPFmz/xk+fAgbGq+IYs
 6e6Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785519282; x=1786124082; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=uz7UcaWvtjC1VUrg2O/CUC4pLvht0xzhdCbjVXgGzKk=;
 b=ejwzeXYlQyViTzMJEABhNyqt8zyOcK4w3adswSq0UCoCew6PasBmCNMaXqyyTHdXfH
 n8ccjJ6uF78FmcvLPMkO+Xx/BtKlmR+pJYw2KKW/Xm5TaQr27BAnKMKeyW1M5tOG2vHZ
 it/UvSzPr1sbUor2V3zjien+z7YQ1D0hYkXrI9ucjHCMbgL/swUqBsRMeFQh/xFPIofR
 SFt07cYElTCS4i7b8KfQ0Dg6ghUY6MGWP0FlsiCcF5FeKnmlxKjf5MoYkuWwH8q9VLbD
 HEBz5kSVB3ea7IZgs8rkLRlTTyGsF/lW+jkGx5ZnMGGDLWKcN1UXU2OwrfJyGTzQOa2J
 fFNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785519282; x=1786124082;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=uz7UcaWvtjC1VUrg2O/CUC4pLvht0xzhdCbjVXgGzKk=;
 b=rzYTAFiTxn8GPQXHN7IAp54jCEX5tjpnHY2bxGdiFVp/KyW2HULMwmvUCsfqmV+LSL
 +qh4NlpV/b0Us3ggceZPLMvm0aKpyhRlChDzbIFS0a4P5oQJSjWgiEkYaWPSdeRoa6nj
 uNBlA5X9/ec792hWNxBfbHBBhhh35Q/qBn2HVWqn/qUWlekhjcBOYPw2DEP//gcfVlGJ
 z/pnAccqf0R/hY5aUlVh6lMis8A8b0GUwk8itVAmDW7KqS0eRMpkz6s6fVdYGe/MHYQ+
 OMW/1b/81t0FW+dbq9TUXYET76dLqubYFFol73pIEh92rDYWucmpuzF00JgEOD9rWqKs
 yz2Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RrZcxPIbUGN9MpnarGux/Jk9i1MAk45CoYraH4D1CSxmkYM8g/jBLpTj1jTKry7XBp/44hKNb/TCQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy50sozoOHsAceJqcFvRkRhAdyjTy37nSiQRsdbWij1yaGocLZ2
 rqJVHH/Q7WPUWu2Q546kOriKpLOIOHIKmh0N4hifp3PYUAXT3D0l3i6tGrn+romg95lsc7Ow05w
 EL9qW+UjGRFT2OaY6naEbKMfAZQx36dojRuQzY2piJQ==
X-Gm-Gg: AR+sD1065sD3rLHJV1eId+yBCGBQ6E1aNQ2aWP604BZ7qPMofkEp6mo5z1LYn1OLdQN
 4qKguiajn0LshpH3rNnmT00NZsT4rrWFf50kqzwlmspi22z7eeayM88d0Li2VPJoPg6MeiIBpn+
 hSWKJeo/B8vJr6E92mLmD/5yA6CF7lZJfGANurWTYToRF56FMmQtg/TRZhaJHvyiOYqhai7gCIX
 njeW0WjZFhwUBjZHcM0/RxWnTepofCSr83AJg0FTUE/yNVzDrpvMp/+1sUFgj+UBkcQYi4eHoKq
 hV8t9Wpvy5ZJPi58cazpzvPLZmGxED2lHRljA/h1aN6CfRe7ZbILd318sNOxUQ9Lt4zr8fwUwWd
 SWN2GzMuQCL27argu+1dqHnEOWPKW
X-Received: by 2002:a05:690e:4848:b0:668:9d0f:ab70 with SMTP id
 956f58d0204a3-6694f079ea9mr761141d50.18.1785519282224; Fri, 31 Jul 2026
 10:34:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260724031123.76597-1-richard.henderson@linaro.org>
 <20260724031123.76597-2-richard.henderson@linaro.org>
In-Reply-To: <20260724031123.76597-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 31 Jul 2026 18:34:30 +0100
X-Gm-Features: AUfX_myEsvU3U5TiyVubbw0KY3g515r_kTwIOkrDBppCsIfiCQEeE7meNnJtFgg
Message-ID: <CAFEAcA9jz-88M-f1U8qJb7i2mYKbX8G1ehtV-ZpVW9iCRuUK6w@mail.gmail.com>
Subject: Re: [PATCH 1/6] target/arm: Rename isar_feature_aa64_idst
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb134.google.com
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

On Fri, 24 Jul 2026 at 04:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Rename from isar_feature_aa64_ids to match the feature name: FEAT_IDST.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-features.h      | 2 +-
>  target/arm/tcg/op_helper.c     | 2 +-
>  target/arm/tcg/translate-a64.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

