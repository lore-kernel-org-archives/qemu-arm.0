Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 195A3C53219
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 13:01:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wohR3-0003hF-RJ; Tue, 28 Jul 2026 09:01:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wohQn-0003gL-QJ
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 09:01:23 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wohQi-0000Oi-H5
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 09:01:13 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-81eff3ddba4so49631727b3.3
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 06:01:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785243667; cv=none;
 d=google.com; s=arc-20260327;
 b=Krlsyb1YePRQaHL+qTFeeUWtJ62zNKSz0zi2Xpt3MzDKk7yf1Mb4sgU30kTEZnmOA/
 KM51gjuVoyL2+yGBYgMTZft9ymQHZChlC0QQfaiorM5N636I62dGrvglfXMHrdip7Ouu
 JqbhZo01qLRJ9ypRDg6938bgYsRVdPmaGxCyi/B+7ZZbC3CHpp+ofPAmGENRi3p1d4PZ
 dYNe4sCzGzSRt5E8GTSkTaC9SeYm4GkIWVSJI/v7Dmx1uj5j0opgIYD3siWxk2PZepam
 /l4BzdsPas0uKH28r5f/orwA4qSGr4R4OM/AMRn+88ae2ukxFFiTqwtGkgxiLVVNM3Pi
 5tDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=zAvVxxAjh4GA1DaK6vTvvXcTJ5QysptMYb7oOiTYSFI=;
 fh=ya6HWu5PUc5cWu3NvJBx/zG0NdsHGgZVw/Pi/6sWUdo=;
 b=X49YwtNQUFeN/58d+uI9a35LURjpKh6UJ7xrssrStkA34DSKK7TmJBfgVHCaNgsz7B
 aHBtvX3LivaYlqvYRejwJMi5odNWemskY0kPe+UT2CIx88e74tnWqJTCDYdOQF8FuTbw
 E90WcZq2HJQg0dFWQRxOxQKOvM0495rZ9lHXOaM4TwlGf0intTchS4pvRfUjQJn+jkGn
 Fv50jawVysjV1eE65UgAfHDFOSq9COKIC55OOqvbyP8xG3xrZxRh9zDH73U6Q3fuwhnU
 /4qXKgcehgwdgFEYI+7JdKGKjOCploZaq5U/Ze/K0ycB+7KiwJYAEZWTt9WBkmBsZ4sd
 78NA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785243667; x=1785848467; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=zAvVxxAjh4GA1DaK6vTvvXcTJ5QysptMYb7oOiTYSFI=;
 b=EWO1nXlY/+ZTFAVYKtJiyl81til6ZaFeRIUiKX7q2uttfGOdWALD1VEE7XqJEsjZWe
 R8FlrUgmUAejfLcaxA3ObKCQ/7UMeyIcECfinoCI8GU2ImHamLm+IEJKgTsIkZkDtRWA
 O2RTFcNGUojqwhlE8gNInEjkohNl9aE/0ra4gS6RFySABLB0xmTKUF4hCZRdcmXSsY5K
 4wwzv5l/8ZwqAj1+FyuHowzrwfs6MDXUsklfPmC0l+3xToqXqGJmNdkdcAPBXjUzvzV6
 9inEbJY1jE4O9U8iprPMfOuWCyS0g4A9FGh5jHhsV7SsyC/5BWm2tSZ106vjD2Bh2CVD
 6H+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785243667; x=1785848467;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=zAvVxxAjh4GA1DaK6vTvvXcTJ5QysptMYb7oOiTYSFI=;
 b=PDSaEHP5O89+kanKlGITcaVRI+uf0RoHwIg74V+l+aAyovt84iF9aHFDKxPMGVm0eP
 pvfzyRhg5BGFgzKXRoe+i3cP1BGRAhrURbiP5/a9we7d766idU1VknIYcSlK8Lah56gO
 FEi/XQeOTTwjYZYCj3NGpgeTwDSPX943mnB7JIC1nEtkAAh2TveSQ6WkDzje80EwRNSw
 QPjOk19ZBHy1YPRcqYMGO9Eg6OQvgKf7Hlq0iWNfXoCgaDgu4Op9xA2yIUPb813j9fpw
 oU7SRD6pE7gF5UPo58eh1jhwPlwL3UdpanEqxMvq4ssnpfd6Krv8fHCMySYDXUmKuBXU
 vD7g==
X-Forwarded-Encrypted: i=1;
 AHgh+RoyuzBEtHvHCv1QXYuNVVsa/vvdm+O57N96QYf+eRQI90mTWY8G4S/RAobRbedAta4Z4bP8OFA4hw==@nongnu.org
X-Gm-Message-State: AOJu0YyVYbc2+Blvkkx4LyBM5DZHwe8yE+3OKDHFZR/x4/UIzCmJUQbW
 4YKWwduXPEvA8TDVt66Iufx7neF378ILBCdEKUWFd2MsAMSsOtz6XwF9foDEKUMM6O8RMKd9G5q
 CI26FZQYYpcfkwhTl6ieJqW2rqz40vAAEMOIfMEG95w==
X-Gm-Gg: AR+sD10F8icXXiirt5Qx2scLN8Nofij8mz16OEEPVPv2fGVvPWnasPz1LbEl/yfH3jR
 bJGNOaXnLyb8VR2vK2AVxpKl50Mnu4CSvethkcnkNErIdTs+6DvxpAfGF7NEE3SUNvBo+DyPCln
 ex9zXiuUHQm6zHeCaSprCEoSNdk8C9x9XmPSpOk/y8EdI3HvkTuLdLk2B2Ws5rATpxKlNXk5B9z
 fEkumAeLxCnbyz67hNmU6DWk78puYUs/OTgV7erH06xd07mzJusQFRbNz9MP/FU4u1Pc6nqil2E
 YQYkisECpnHS8KIwvY9c3JgoMGRbXVsW6Ze1JLPrBXrEdQ==
X-Received: by 2002:a05:690c:6f10:b0:81f:6547:cfc0 with SMTP id
 00721157ae682-81f992cab9cmr8501997b3.67.1785243666822; Tue, 28 Jul 2026
 06:01:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260713230244.70174-1-richard.henderson@linaro.org>
 <20260713230244.70174-2-richard.henderson@linaro.org>
In-Reply-To: <20260713230244.70174-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2026 14:00:55 +0100
X-Gm-Features: AUfX_mwW0GD9xgUdh3_FqO4ontu-2JUanXp_eKQ3XqnqnoA_sn92XaEoupC3hrc
Message-ID: <CAFEAcA_gEawV6WuN-W2fZp2L9CdWT3F3MDhnV_y4QY2d-NG5fQ@mail.gmail.com>
Subject: Re: [PATCH 01/10] target/arm: Implement FTMOPA (non-widening, FP32)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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

On Tue, 14 Jul 2026 at 00:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-features.h        |  5 ++++
>  target/arm/tcg/helper-sme-defs.h |  2 ++
>  target/arm/tcg/sme_helper.c      | 49 ++++++++++++++++++++++++++++++++
>  target/arm/tcg/translate-sme.c   | 26 +++++++++++++++++
>  target/arm/tcg/sme.decode        | 10 +++++++
>  5 files changed, 92 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

