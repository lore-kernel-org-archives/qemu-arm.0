Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB11C54F51
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 13:22:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wohlh-0004E6-SQ; Tue, 28 Jul 2026 09:22:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wohlg-0004Dk-Fy
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 09:22:48 -0400
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wohlf-0004ZQ-47
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 09:22:48 -0400
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-6689402c7bfso4119360d50.1
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 06:22:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785244966; cv=none;
 d=google.com; s=arc-20260327;
 b=indrug7IfdopS61bxi43FEcPeYq+E5Q3hCavAff/E0neZO6OhJ4MpoM5++netCpgQT
 IwiiWe+TD9s2qwe7J8ReVg/Yv/KBRPSvyOWcGyMZ+53g0UcNZ2fbahgldHVfA+sk0HTR
 7ydicpe8ek3uPkiE55chu1+jJ6170NyKGkaAdU77TyGbuNHIrRMuz4xRzcHsVdkkutM5
 rV0ZEX0o0wYXrTYs13XHOcQCj2nz2jPjn9V964+T89dppF7O9MHajTb9KE6jXdpeJiz1
 eUMEhfwFpoRwidzYGfuoSsWaijK5c9Bu7qn2O/xircjT93vpPcKTyVnmNJ+0TMAOiFxY
 y9ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=dg+cQhw1P79xDNwC0bgZO5F0AU21hjZ1JN6fS+THde0=;
 fh=TPC8zv8I+9Nq4YT4fjbXSifsbHyJWjUjm0AbjOOaIAc=;
 b=ejfp5uM5IRcQX91aaAzzL8Zu1R94A/cwZuGnZogyqSK68xAQdEwmPmCTN9vEPcDpxC
 5ky/JzUvkinLcghip2ggoyyhDAYXC8Av1UHSWuUl/c6h1tp1hWMc08wlhP8j4bzBpCOt
 qsAVOVUfxk2wi/a1fN6OhUixiXwvMsHcA0YAPUEZNWKj4vQ2ddJ1RqiK/2O6zHy13Wta
 OsQMiIdZwwAtwioFSwOhVLbuwylEeb/YuvAorjei1fDrTofGNwBO1okzKHFYrzJa+TRe
 MJgKOW72jdiPv770S99AiSwyMnFBMXwHJqvobCoE1zJJ7pwRJG5urdJNczYPaFUsVaUD
 WLQw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785244966; x=1785849766; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=dg+cQhw1P79xDNwC0bgZO5F0AU21hjZ1JN6fS+THde0=;
 b=CpCQF0eZoO/yuaVJLZbuAKsNNjBCvfPRUDgTLCtZ6rfwqsd9IXNvEC+un5KD2GB8cI
 z5aZDIREALWRLwwF9fT+D0AsYqXYcmDIx5eEl1HDCbKOR099YIC8CYgxgYu1rvI4a6Fj
 Ox1GlniKgeGmvHFBXlHmod+vE3VEUVu8Z3Z57pWX0mrBf+sJvAuj+cE/CUwdbTqCUUHB
 TtEWAtGxTnGhbc76kGiVROVUri6sD6nNoNzSY5FkE+mjVz5B+U3RLjjQy0JZDrFFzwWF
 LhYJ//tPC4JsFgYZu2Edbloy+OOu6HagkHuzDcmR87CDr7Ory6ii/iDCw8hgCe/ZmRha
 1TLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785244966; x=1785849766;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=dg+cQhw1P79xDNwC0bgZO5F0AU21hjZ1JN6fS+THde0=;
 b=KEjbeROZ5frCInKxTBL6CwPqHO6gONAqoE4NS+DjG1C9EOv/6Kbvexz2KNJI4YFiMm
 33ogJvOg9qfJswuWtsi33bSANBe3NFRUh0xysLXOMvqzJM2GphQe1AS+fFyH7hXMb/73
 +hJOa5ZxiEVzlw/BRi6wh96lBob2tJVLwU+KpOY+RBMdwX1/622RGPwyUJDzhDW6DoOd
 MJxtihwets/YHu6I0u7Y6eWh7hi1sbmYCxDK7hQoMNGdj6xCe6K/8vaSZ4V9fdLOu6yu
 PXPaIMV2QwOu0U2ybScidmq8NRXXzUtbtBBDICI7YEXVMYA5yOVABKlcduXSSItWUmWG
 gmFA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrQwvtxXG+0/v/gknRg7kTeSxvGXdvGmjJxUSsgTeX4Mhj4D/pFDqMd5irg3vUujNvE+fiDMFFtkw==@nongnu.org
X-Gm-Message-State: AOJu0YwswglM0PkjGXFKy7/LGX43kKEayuwo74Wfi7Qo0QKKeS5VtX4p
 zrNyO/gzN/U/Ru4QGh/tn1H0ugZ+vwCmrD1FgefMs7JCfB2ZoA+fqlQzDj/n97SH4VOZj9602qm
 ZVQTkQa857IZGa/ZHktqNEJzaHTCbnz6RpRT3H8uUvY5IrvubMu2I
X-Gm-Gg: AR+sD13YYbmO2JVRLxR1eirac0IAV3jmzDokSOgOxJpi6FAStdD282fEbKqPu9Aju4n
 qJAYXz2ek1m/Qlb5dJD82cuKFvGTST9neMYjRSAVTtDrU0XNpLMkx0/Hy3qkMhBK/oq4neRRhCY
 pFphPU0wXgpnzeHGuGGd4ysQaKyaSZvJ5C9TEwGxi2aZgV0LtKMW+WtdhvBEx8VdADigQem3oCO
 nXO7wtsYe4ID6Gift7eiimZnuCNko4uawp8uX/gVIDApsg21qVPucLsDYnKuYYyP3NmHLNvxesN
 8cKIBreUhW0c3ZVsKExQS+2KYFBTVnUmPqRfd3GMzt+8exifdk9LyeJQ
X-Received: by 2002:a05:690e:4548:20b0:667:e412:6add with SMTP id
 956f58d0204a3-66905490791mr603360d50.9.1785244965478; Tue, 28 Jul 2026
 06:22:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260713230244.70174-1-richard.henderson@linaro.org>
 <20260713230244.70174-9-richard.henderson@linaro.org>
In-Reply-To: <20260713230244.70174-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2026 14:22:33 +0100
X-Gm-Features: AUfX_myMdN0w0AuWVElSisOp64PlLAX9-N4neSb_yWocmftwb8RvxtLzD-dFwXU
Message-ID: <CAFEAcA-OkMNpdu-6eJ+ihQY2HSWTHb7589ZSk5wQMPATvbpFEQ@mail.gmail.com>
Subject: Re: [PATCH 08/10] target/arm: Implement [SU]TMOPA (2-way)
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

On Tue, 14 Jul 2026 at 00:03, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper-sme-defs.h |  3 +++
>  target/arm/tcg/sme_helper.c      | 12 ++++++++++++
>  target/arm/tcg/translate-sme.c   | 21 +++++++++++++++++++++
>  target/arm/tcg/sme.decode        |  3 +++
>  4 files changed, 39 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

