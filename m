Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EDEACD6E79
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 09:00:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWsK8-0002GG-Eq; Tue, 09 Jun 2026 05:00:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWsK6-0002E6-Uy
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 05:00:38 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWsK5-0006Mp-HS
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 05:00:38 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-6611669cd16so2786449d50.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 02:00:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780995636; cv=none;
 d=google.com; s=arc-20240605;
 b=R+IpSISxfuxfO/C6H2C31ddLsncE3l7SVlSiQtP6yFywM0rPvx2dqAluRSwe/EXp2K
 +hiwTkJ2AsdExBpqmy8tB9nWH5MgqrKTDjIdzxHZGd9hzRPOQjn/bo4AusPiPdDnvO96
 AyDYTieb74yTDpmABcI1L+Kwih9eUB6kh6riNRErPoXNiv8vCUOPQS4K2F/iL8i31N0F
 rsq0uboBX6suQMfGb8e2eme+Dc6v1vN760ofGVYUBpYluFyL4BwBb4PUWv0oBh7SS+5X
 dVf1FD9AQ7blfawZTCwvXLjaZRYEwJ8RPuO9kAmNO5lFS3EeYy5LcABwcMCDMqitY8EZ
 0r9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=cdvyM+brOEXM6M8zyW6kbJRdYM5C4WyqiI8qJXr5MwU=;
 fh=IdJ4dx+p106qIi8EbViBlaHrfyDJGJLSOcJ7VJdnQp8=;
 b=BwdT3HpKlrbTrmpk+P1ciVJYwcmXyt+T/XomdDswtFWDdxD7MduHwgxCkg0JBlWJ7+
 50FOx0ReCic+1x6yUz/rLGnVhrUIHMlEZaMa/O+Eo/faaVixvV0QhY91k3B55HlS6ig/
 /N34CqrucFmnYoiS/Oxd+bKxZrf6D8sXFhIpVY4MWvj4tsCb/rHciTyDk6Shf9srNyqH
 b2LeS27Z4F0irUtjNIdm6IZ5KneG45nysz9mWQUaYWO/OZqR47uDgClogAUmqDBDCeyv
 igCXMgEcEvUnRRBEAXJRvG5L+DSXfcVLHkld4GVChLdd7xDkf6ln+QDHp+oXAOFK8thc
 ojjw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780995636; x=1781600436; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cdvyM+brOEXM6M8zyW6kbJRdYM5C4WyqiI8qJXr5MwU=;
 b=Ty+WU62jgy6vTvvjSizZKJq/w0mn6illiV1pnFoiI8h5cuhM5u8pJeMyjSYOiIm1y+
 hGN0hJsmwVa94ARiYIJ7ddSaP05b9LUMBaum7XJ0wUjkt+zDXeC0nzXcS4+BlJZwx9Ge
 Sg/Dxxerlt8waWmZ3nhYLC8JCPcvmkRgzJScCUEJ9aYrI6F4/iJQTdFa50/pW0vtB40e
 fFW2bJkOMJ6M4CIETNBeNkHWuH2GGPrC/9u1+N4YM+5vb+ByOa/ghkHad9lNxjgrQNag
 91JtZh1p55ZJ9FjJcJ8Ip/80ZCrxoQbhbmKrzB6c4Gwvb232jdIFgF5xFLAWrBXmEqhp
 yuYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780995636; x=1781600436;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cdvyM+brOEXM6M8zyW6kbJRdYM5C4WyqiI8qJXr5MwU=;
 b=sUOzXFh8hlHoDiiOPWoEdZMhRugcJ6IqspL7W2dhOXCBD9AdGc2unDzJwfJH/gBhZE
 J9uIso674kOtIocBdSfTJZrOiNh0XpO4JzTJ7VvgIldwcSv1xjOxMCJOQL1FkU8nutFz
 Ik8q+skNsMTNeM0x8wMC+4FsSWHrEx8m8IjUzgVmculsuqfRZB4YKqeCIcorsnnmhEiX
 11FSlF3h5jMxkB+RFL7CG1/TTYngcaR+S4kwR8+y8266eAvzrf1BvVsWpl599nNMacPS
 EPCfy9pDL2tIw2p1M+4as6ju5zoRNEbQWkrRtiH0Yq2hUlZbRiEwcuNeaNuyWtYmdaBd
 YGaA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9JLH7RLwgM40MIZmZmoesIqCrQ0AEJ7P+gOzvxEneBdii/RmPH6uFSNf4IRZYLwid+23hq9uD9fQ==@nongnu.org
X-Gm-Message-State: AOJu0YwWY/CyGDLfqIv3FqHEyc4skceHo+oTVwdzXKTfrHrcLf5PAvIn
 KZ6QpCmST8m7BdVCqkfqB172k+/sOFCE9phU7D7M/IXBelQwJzEnVS4qhPP3mcadphNe2DwVhc7
 GIocRwJBoLJ5GQpSztYmN9qxkxYFVFG45/G+xI9DlAw==
X-Gm-Gg: Acq92OGPY0tTWZOXmLDWTm3Uc+7dG1HjmtJ6tUP/05NF6LFnBgVr/InLtqlgJapsZWC
 lGwLDgXFk1yUSZ8m1ZfHbTZPGKdurpiw7z/UMauZdBdX51tLFLpu5agl7U+/4pqlO2b5q+xThI7
 FdR/OUnCMUrK/2da9Bi8xkUPG716HJpGe4uvszRwBjvB5ZGRgvUnie0XxdVYt5ZxRKWhqckIHG9
 ZrPC49wy+j8G7omkTGOQIjrSz2SnHbsYa1AIYzlzA/iPpY8vpREkmIJSSuO1Mj5oqdvuKY1X2pd
 DhsY5qY4RIT07mcEABpOsVkOvpIRI7HQ6WTz4pQ4evsodA32PD4tcv8rS60xgGCPAbgTRxFpY0C
 y/ezww6uZT/dc
X-Received: by 2002:a05:690e:1908:b0:651:bf58:446b with SMTP id
 956f58d0204a3-66106e004f2mr17374836d50.10.1780995636303; Tue, 09 Jun 2026
 02:00:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260603032855.106930-1-richard.henderson@linaro.org>
 <20260603032855.106930-18-richard.henderson@linaro.org>
In-Reply-To: <20260603032855.106930-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jun 2026 10:00:22 +0100
X-Gm-Features: AVVi8Cd9N7Sfw0gLxceCieuEypaylimcYx9I5mZZWKr1e38oWm_Lk8R_TLN_iaU
Message-ID: <CAFEAcA8C7Q+NaM2jaijD5PHDkkKiMbAuN_J6w=EGHXL2ZDkAMQ@mail.gmail.com>
Subject: Re: [PATCH v9 17/45] target/arm: Implement FCVTN (16- to 8-bit fp)
 for SVE
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb131.google.com
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

On Wed, 3 Jun 2026 at 04:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> @@ -4100,6 +4100,8 @@ TRANS_FEAT_STREAMING_IF(BF1CVTLT, aa64_sme2_or_sve2_f8cvt, aa64_sme2,
>  TRANS_FEAT_STREAMING_IF(BF2CVTLT, aa64_sme2_or_sve2_f8cvt, aa64_sme2,
>                          do_f8cvt, a, gen_helper_sve2_bfcvt, true, true)
>
> +TRANS_FEAT(FCVTN, aa64_sme2_or_sve2_f8cvt, do_f8cvt,
> +           a, gen_helper_sve2_fcvtn_bh, false, false)

This also I think should be streaming-if-SME2.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

