Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4558EC54F4D
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 16:22:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wokZP-0001dx-EZ; Tue, 28 Jul 2026 12:22:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wokZO-0001dS-FS
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 12:22:18 -0400
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wokZN-0002dg-2q
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 12:22:18 -0400
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-6679d88abdcso5096603d50.2
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 09:22:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785255736; cv=none;
 d=google.com; s=arc-20260327;
 b=AZt5XmQe2YvZLYrQ54jar+Ozwf12XtkfyL+ym09EeiUtHUoBdRMhz66a2LCgn5yHl0
 fmtDf/Nim42NvkKrfaEczVSS2pmBFNHRlPdlHYXqjREqbz+rokCperwyFFCW0D06BvE8
 kl/tLPbTnppi9W5yZ2zbwEZCyWgB9jZSmWijqCPxnFHa1NqYZ1hwH3F34XIj6aJvkVlP
 PwogwyrBGB1kjYRGkiYz+dWlbNHlIphChtk2fA7HueZ4o7Fod6bNgkX8kf5nO9HNXoC1
 GkclvcCKXnqM3vxqWhS0/cfpXuS/bzjY1ViaOA4ndPLfVFW0Qhl5C3t771CnF0fdhzcX
 IR5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=VR1Lb87bVmmYvhXItynZeV41l0KJ6/d0FMR5njUAFtA=;
 fh=9afu7f+DiPYIPvalr4mE1h306nGe3OdBzomT9SG97rw=;
 b=MJi1STgDMBtnYiTzzalPADL1gPRczn/mXNrZNb3ohlndF12zGKS48ZZ7dlIYMR2oTO
 +8ntpVs+BLOzev55nIn3rx4Kqgucu8ZwKU3iqHjBUL/yaLkz7xv3KFYEqqETLbxZXJF/
 txdpOYCLLpQaC4VjLWrldrc8rPZqjLVqZyow0hrqv/oJWvWUJlwUz024uuCHfXfE+bAL
 WjVXA79RHBKsETDFT76QbV2ozp/SQ3h/Ukf4Vfp2A4aBh5pizTTzZYTFtfKrtxnahtRl
 svkhzDtuSh21ir8COBK44S6KliL+lHsyagDTvc4Trty0PQctbLpNntkGprS0c9pkj4+7
 N1eg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785255736; x=1785860536; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=VR1Lb87bVmmYvhXItynZeV41l0KJ6/d0FMR5njUAFtA=;
 b=ruLnAJ5kZrYehBjpGWIZcno7w1OlXZgMdKIPFKfW96/pB/KxjVv67qzYo9k0FoQ3yS
 s+sOthnFCF52TzJY4Jrj+MZjcbVAo0cKjmOJKwP7AAM/igodl1GyOWT4yN51aB+rC7Zy
 42xqlqHzsC8SYnfefx8+j/oeykC+m73glXEW+t32h3BdgfQYvdzszp1AbdtDHs6V98lx
 gGk1w2cYjH3AXL/OVaxSECVNZdicRbpGPcc7aaxb6Qs4Hoh45YMMJwTOuu6l79vnVMDT
 zIVbbrMcwQsHYv5sLg/OcUc9aob4GAlFchF8fQtNC+f1LyBOb5QD29NuJ9a1M43sEFBn
 zq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785255736; x=1785860536;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=VR1Lb87bVmmYvhXItynZeV41l0KJ6/d0FMR5njUAFtA=;
 b=Vp5CsY8DIHxqlyq8HcVhtY3q6Hk5Vb08T4D2uFxK64hZmUUuwIuldy3MJPxkpiaiTw
 nEmSyObH5iHWdwhxAr29bZ/6HuIiomD8L3nnSHzSB9ppEFas5IwBswcz4wZUK96/F7dI
 lcNwB+VmDbj8NzSGUAQK1gr9thYbaU68Ru3umgQzkY/4jU09j0gXR744gEkPrt+TXZY1
 iHsda1KhzR5yEQso3aWBzxR37m3gtaxHnkczklLc9fgs9okatvPnMHqvnq1MoK3nknLa
 sj/2UzdrraVT1hJXJddiKPnvX2JoZxbP4iDQSMMFQy71Gy/aoF2g4Vd9dw0yAkTYuDjp
 LRwg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq5nNi+oeBGjfsAx4QFkJzSulpJt6wl7dO3yEUoZc5UcXOUFZ14OcxmOznMJX+Kd0A+L27yHstNTw==@nongnu.org
X-Gm-Message-State: AOJu0YzSWS8nfSq6z8VitWS8mQ/0RMr9E3zEubI+1HVH+FIhZo/XElpS
 D2RvoMK731QJ20i6y9IAc5q1rfSvIMQ3ASAf67hG/9u2kYJxg7bfHdAilKDfhncDYN7hjD4cyUy
 ySpV9pVSYxeJdCtyMk64OcT6FVs7zCL6I+c/efuPuDrFCx3ktnti4
X-Gm-Gg: AR+sD12IaNLrcrVPFHKGNJ41Uf5Q9JwJSfsaBusBF8nM9BNHOre//c2XSlNa6b7HRGI
 0MPNYxH02SFUXFZ11WG+9XpuKIiOT/amfyLT99haW/W/vzJKGfczfg5Z+Q4/z2N/JrKLO9bJ+hv
 w8uiCW/1Na1ewtFpv85ZkDS9BM+EYtaZ6HOq668DF/qpE3tOKlvO15bURTcDYVltgUlL7zxxDNP
 mw5LBqbuEpVqA+vcaTq6I15GKNi/Lec5UGJ44M4mgIkx47DGdbZ27c+gVAD81uYDh3FCkBXcd5T
 7o3v6WowgWuPmev3OsSCEQM0EeAJQDB/BiuZGA6qr/jyNgMrbhbZA2FGG9a2xPsJlMAEjrmufXg
 gFCszvjAy0d17Dh8V/Tz1/3qV+h0h
X-Received: by 2002:a05:690e:4847:b0:665:1fb0:5546 with SMTP id
 956f58d0204a3-669056d0ce6mr1007042d50.29.1785255735822; Tue, 28 Jul 2026
 09:22:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260721184656.530230-1-richard.henderson@linaro.org>
 <20260721184656.530230-19-richard.henderson@linaro.org>
In-Reply-To: <20260721184656.530230-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2026 17:22:04 +0100
X-Gm-Features: AUfX_mykGddhOaQWeon_t-OaFxjS_WzqJISVoCT1Bbefl3zJxeWueEkNm9nDhtA
Message-ID: <CAFEAcA9jO4nCMCzEB_gJJYoJGihzmDJYOzKsdOMMQDfeKPSXQw@mail.gmail.com>
Subject: Re: [PATCH 18/20] target/arm: Implement AESDIMC
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12d.google.com
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

On Tue, 21 Jul 2026 at 19:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper-defs.h   |  1 +
>  target/arm/tcg/crypto_helper.c | 31 +++++++++++++++++++++++++++++++
>  target/arm/tcg/translate-sve.c |  2 ++
>  target/arm/tcg/sve.decode      |  3 +++
>  4 files changed, 37 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

