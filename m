Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 309C0C531F9
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 16:19:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wokW2-0007NV-Hi; Tue, 28 Jul 2026 12:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wokW1-0007NI-Rz
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 12:18:49 -0400
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wokW0-0001YN-1O
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 12:18:49 -0400
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-66804667af2so3256865d50.0
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 09:18:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785255527; cv=none;
 d=google.com; s=arc-20260327;
 b=kgoWmuKcZdUkoTJykU9df6Al+NNzD2sTGK3GKdAp6aZG9mDE9pRC1brQN/wTNNJVq1
 XnRJfmhSDCEIOKelCWgrviaSGa4lXifyuEMivYBGcrouyPz2nAXwn5pqWw1ZVcLwMZt3
 hipaIruyFAm/WhXwZJKa2LdSbTAx++2IAErlEoBjPb41ijBz8XOIF13LBCvlhaBKXd6V
 /O78jPqk7grWCAx+VOrEG0j3jg6MokCtfa3BGMcLVSwqVe3RU5NfnPiHjt6GCWa5rM4b
 Q8kRA7dNRMkMgg6xDTh7sAlL1ClvkTV75oNGcCwPvv6Jg5DUF7nz61p1jZbrP/DRXUqW
 ba5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=NTlmCnhs7R9EB5cLD+d3ITNgjM2W1JVz1cOqzQkeZ/o=;
 fh=gZW6WGw2HUU8lfuNL9kRs83wQr2A+/tYy/t9VejOIzM=;
 b=KlhC9xOLG5DRve4mdPfBuACG3rji4csHxLuRbHJVPehYqbqv+c2Ck8mooKftXOzkhg
 ltQ0KDX/wFl+fdWHSS2JIZ+eEOtisviasK9egjfjWQCD50QnPdGEMgc5Ll6wZtPw+Wwn
 6dALvMpgXgB36SAavmPsmpQgUpTiQUvqLlSYw4Zj3nElLh9r257VLSX0xF7d0IU00obA
 wVQTWH0NeGybHxlKiM0jwbPrSq+bS4A8ie8Zw9wSgSYt5X5xsWxTS80LG2hS7Z649X+v
 RDySAK4KYXuUNZq8g7mr/V5hayHU8rLgSYKmksehnigOAYoMk3IEUE046HPFWYdrJHRX
 +4/w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785255527; x=1785860327; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=NTlmCnhs7R9EB5cLD+d3ITNgjM2W1JVz1cOqzQkeZ/o=;
 b=PKgH+t+x2NwfzliD/J4q0UgIXUJFIyhVmGhIfYuvwzpnh2ymR1hNDxxLUU+qLLaYpr
 yJhfy2ABzL6vVjl1NhiRTDxKAjS0M8QZnPJGpR6EkP3yciW5q4i8LtYzugnHyItKz2v3
 1icfF7pNyVaM1kb6e80bc0SLbtf00IZUvVNqlQ3vj1Mq2Hs1Oy3outhDChOs18Birv/Q
 XcAylMWZbR5pkZSUuAlApeAiNk7dUmvSj0E/uWSiAYX2/7TfQfk2cl8yy77iiKDwkCMB
 Q/fn7zHHhpliemH3ptrWk4AowdvhdDzD5BG+xOxb/2Fu8wdpsaaiKv3zL2iFTMe7a3WV
 yz0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785255527; x=1785860327;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=NTlmCnhs7R9EB5cLD+d3ITNgjM2W1JVz1cOqzQkeZ/o=;
 b=YP8Jh/TS229DdDtC7mlmRclsCgIgRgLIfC3f/uM/XK/aJxxw20Gs1rVq9zMXfeUOze
 oBZIApjzuWMs53yQSAe2FD7C4zvamCcg9asHIxegMVUHEmkCptskLYoYjpgVJLqqmGP+
 /Y5BSeoOtanFsuIb11AOswmHH0e2xFHYa7i0INz2/bx0WJ5XFmvHPZrSUMtWGXMg3snb
 g88WCk6v94iNccNXOBzWf6chrTBafgpBTTvyTzBxkxjX6ZMU0wlBqXg9MiOL4XkGZ7fY
 pewIJRHFi1fvSbsLygRuIouqiBjnhtcqHPhPV1/oxhfC7nWLPYoCe/jjsPUwDZpvlTZO
 QFnw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq1F8u3Sb8GogwkubioeugTwn3/qr4xqowtdobqFij5oWCWvq6XrwxbA+U6XLxnEl5lR5geB6Sm2Q==@nongnu.org
X-Gm-Message-State: AOJu0YwPZaQ63LKO2IHJENGfvZ8lXTuXTEI+pT6cNqk2PwibFQOhVjEa
 fUvJR5afXK1Zec5iVgzz/R0Rvz8hhC+7wrrqeRqYAzkj9tt8u/l8irmy7TMMN7ggFVX4f/8MXiS
 QZNztxGVKDhzkyrPv1nyB3e0c0JLUwqFTlu8dolIraQ==
X-Gm-Gg: AR+sD11aJEm/BldVc9+K8kI0Pf4tWaKOcTcjDD32zPUiH9OKvHVKppzlx9ngT7VMK4Q
 GQRPyAhFI89BbRZfCFnWJDuHoaITh+g++Go/2p5IAg0xMU6ry2Y1Zcyvi+yt+E5S04iJeHIglPE
 7lEILqS9LQKwTrVC2Fg/P6bO1KCklM0Ir3sXgGad92DEvR/HPB5cz0Ye7b7WKCpT8O5W+t50Gk+
 nHn0a47Nm7ud7x0GCg/KeKWoaimxdu0G2yE6+ptXOl0P1pWWkBvWIJPC7/knm/eklvfkchChroA
 w+cbriOnwKs6WCq0IRRQE8dtGkakdn53lSA3D3zswvNMKw==
X-Received: by 2002:a53:e004:0:b0:667:aa57:686a with SMTP id
 956f58d0204a3-669057f7d40mr922374d50.60.1785255526678; Tue, 28 Jul 2026
 09:18:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260721184656.530230-1-richard.henderson@linaro.org>
 <20260721184656.530230-16-richard.henderson@linaro.org>
In-Reply-To: <20260721184656.530230-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2026 17:18:35 +0100
X-Gm-Features: AUfX_mxvewI-mWfoHo4-hjIOuWi0jluaJAG0N52CeHvZf2jZRpDinDjNIPUvPSY
Message-ID: <CAFEAcA8KdeQjsi+_Up9T9MOW6-GFtxJdGUH1K+B+-oxVg9swOA@mail.gmail.com>
Subject: Re: [PATCH 15/20] target/arm: Implement AESE (indexed)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12f.google.com
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

On Tue, 21 Jul 2026 at 19:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-features.h      |  5 ++++
>  target/arm/tcg/helper-defs.h   |  2 ++
>  target/arm/tcg/crypto_helper.c | 55 ++++++++++++++++++++++++----------
>  target/arm/tcg/translate-sve.c | 35 ++++++++++++++++++++++
>  target/arm/tcg/sve.decode      | 13 ++++++--
>  5 files changed, 92 insertions(+), 18 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

