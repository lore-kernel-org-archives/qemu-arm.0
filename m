Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E4FCD6E79
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 09:06:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWsPD-0004zX-55; Tue, 09 Jun 2026 05:05:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWsPA-0004zI-S2
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 05:05:54 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWsP3-0008B4-Gi
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 05:05:52 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-66077e90382so4967390d50.3
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 02:05:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780995944; cv=none;
 d=google.com; s=arc-20240605;
 b=ia0gMXAjDypDZ5Ia7RP45KVh9dmSifbNg6GsHVqI1dcTf7o7ScYD2Hw+xCaRhnReF0
 Et+oP8oJr5nfnHutg5Asf48+nuhofh4VyX0SQ3zn5qcOiHXlgn/PI2WOCVf/UESMwWn9
 kHc0Oop59CmvrA3weWVZBHCFN+KRAp+Z1gl80PzVhMeWGRUINXTt3QyOjiuhKx2mtpUh
 wyuZ8nJANnt4FR3a00GueE0tGPeFp4UgJaQxnwN39l1AYaGBBdyVmf79bGaQO7wezWg5
 dVYnnM/wOklnyO0qwZCVnhS/taMAMwPCq6e+e29QNDb/k4BZKwTSfwcWL1tTuBEB3gIN
 f7kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=YFV0+Ihly1rYM+mrr47H0WRI3stoCKHq+jZ3ATNwk08=;
 fh=Hd+RM9PcY4PTqmIYcEyMDIse+e1aut8QjX9rLJtkwF8=;
 b=FZUdXxB55SNreemVAX4TT9TNbk9fAfJMpW65dDnbM3lzpqHV36BFRBHUBc7TeG2e4Y
 tgaPSxyRPnoAvNeSxUDsUZ8hxtQIj7rv7SOTEagl8Fqk0c0SAz8dZmKdgo2e/cVlxOQK
 Eq/5k+IEQ7mon0KZ6XEx0Tv3ckdUbfo5jOTMPDiM1XFk8O22dSbGa65UJTkeXlqhk0MC
 29Kj3Cfp5+I21YbzXd94ir+cAKt7Pt4yuTwuhaIo4OMi8QHztcri1K8FfNXqGkOJ7z2X
 yoZezY3I6FOkXUmkYCr5HbnWm/WlLo/ghSMED3pKIpa/dM7Fea8CT0Ybrn0PbLfx0IEy
 i4Jw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780995944; x=1781600744; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YFV0+Ihly1rYM+mrr47H0WRI3stoCKHq+jZ3ATNwk08=;
 b=GFnhwP9eExQJA/dW/w0HaapfuuoGrnsVud6cB3+b0dEdxAuCqjqQ4H/37NDtTa70l6
 pk/nlClGyWnPp3SessxHyVQrfosClLJwppR/ctMloXA1nusRsh3ykBmBhHhp/tvLoB0y
 AfyYPm2tyRtF07z5cNAJzBCUtKrmvXnd7CN/P4VOzxTl+eW2l5y/AIOkPkn21uul0bOh
 tMdg2hR5jNghVBI4wWv30tqLmNGG0+xhzUmbaBUY8fnJao6ltOcPWzOM643tV8gGhEnc
 cNU9iI7DAnHyqOp4kaFe8yytP8O9g4em6P1uUpVhf5WLxJRj7NL2Lu1COVm/jRkcV0ka
 nVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780995944; x=1781600744;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YFV0+Ihly1rYM+mrr47H0WRI3stoCKHq+jZ3ATNwk08=;
 b=gRFqtj8paNjtmVCWOwsky3w174Extpu5FXRnftQwzgyY2Ceafnv2ACYI3pXp2ybsqV
 31ZOG2tXDl0MFmrQI9fpI8dIwmR4NIkHnEwftSRjoVz9WHFEh4Q9j85OlzS2W1MHFy2A
 moxwsHd/k1T/9+3HtAZ4R38VMt9jO4Qmi9ER11RtumAh8F9Bdgq6qa1+BrVgo1bl/1vB
 CXsflKp+d2Km1eMFjEFhPfLZvKhsnYLLcSNlDvx7rRTHGrwwmdo5bvYmWQAtoU0xlLl6
 x2Lt8hlAl+zbhfRl8HMHV6+EJhNu5RlNXdDjQIjHc8ee8zZYnZ15QgO2DOkKiDOzpDZY
 qt7A==
X-Forwarded-Encrypted: i=1;
 AFNElJ8qrQiEV4pPZdwc5nJsScULZICe633HLmz0auRMtjFQqyOI+0Ld7+60ENMuZIgKJvILkftvGcNYxA==@nongnu.org
X-Gm-Message-State: AOJu0Yyz1atERU88VLddW+cXuwg8afleZIPyttv9eDXVzvoaBPoQlLYO
 LQb28c30SXVvkK/zrpR9u7qto/SbC+FPW6A3tKibJ9SV1MfzLP18f9ejsYddvX5hXhNC9gcFi9m
 SMUZzzISpRm7JnwBbe1hIPDJUfPNBWYrXIFYcrGpB9Q==
X-Gm-Gg: Acq92OHxFWjZsR1QmokvFAGo6RP8mD4CTu6nMmo8kEnaXVUcoupIfLXQVdVFG1xLnwH
 MIyRXYGeCejFWpoR8evY666oNiwPO8jPhr58XeA0WJvIm83bKr85gNzH9RzhrAPVrFar/fcdu6p
 yOeblU/DFjVGVny7YUsizOst0q1yvp+9hB/cq0iTAPLyxouT4Ci5obtfUcmJapEOUdnX8cp/jA1
 ntoIyb0Y6C1zv/FUGXTaRjJvtS+HKKRnDA6NmHD7pDveHzNxY3Q91wL6WHI3g5uETfiDAzijOvV
 KTpnuJveR4Cr6DIzV6ZV65txwUKeAturh/5pVDyo77gvnT8FF30Tz54PDrcCTPfGN4tZh3g8r4M
 5cxyNS79deSNI
X-Received: by 2002:a05:690e:1c07:b0:660:481b:c56 with SMTP id
 956f58d0204a3-6614f81add4mr1354066d50.58.1780995944072; Tue, 09 Jun 2026
 02:05:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260603032855.106930-1-richard.henderson@linaro.org>
 <20260603032855.106930-20-richard.henderson@linaro.org>
In-Reply-To: <20260603032855.106930-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jun 2026 10:05:32 +0100
X-Gm-Features: AVVi8CevS2yu14AWLr86rDwa0HGXy0IfwK0__u9gLY578zAjONULkmyL-vMzSGg
Message-ID: <CAFEAcA-u90AtC0m_MmhQGVN63apPxVEKaEV-jePxgpRaBZxe4g@mail.gmail.com>
Subject: Re: [PATCH v9 19/45] target/arm: Implement FCVT (FP16 to FP8) for SME
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
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
> ---
>  target/arm/tcg/translate-sme.c | 16 ++++++++++++++++
>  target/arm/tcg/sme.decode      |  2 ++
>  2 files changed, 18 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

