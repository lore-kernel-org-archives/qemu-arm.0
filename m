Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB416C43458
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Jul 2026 09:28:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wfaBt-0004pl-Lb; Fri, 03 Jul 2026 05:28:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfaBr-0004or-ME
 for qemu-arm@nongnu.org; Fri, 03 Jul 2026 05:28:07 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfaBq-0007fB-7V
 for qemu-arm@nongnu.org; Fri, 03 Jul 2026 05:28:07 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-664b84118d5so547004d50.3
 for <qemu-arm@nongnu.org>; Fri, 03 Jul 2026 02:28:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783070885; cv=none;
 d=google.com; s=arc-20260327;
 b=MW0XU4byKdOeyuvMXt3qr5eEpQMgqx/nKji6ZbXI7Hlx3QF1NUs4GmYCiXb9Xqtj4w
 DkkMvlhvrfLpcoB9+QjQlCL0vu3IFXTYxAd7i6tVIdqUw7eiS8EIyIdYR6lMQ+ihFFQy
 1YRxichxCiwiRrFq47Zrs4q4BGuoaOCSyqPSa3Kzu+Suk0CtLUUnuKbL+IuemRLjaZNM
 wgxLX2OMKkZ6jFWHCNW+h9r4sbrMr6bcN2c9OcQE/UV8RSfETwXEYvgpgLO8Wg/p8nzM
 xDAAXbCQg+uUoJCCbIrR5Y1uj9sQwjTDf0c6bWwMbwXJ/MJ1wka5LBo5U+/aLG2eNfRH
 XzKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=VIeqffjGpU/iFP8bZYqFwZot2E/hD0BF0vHSKPooctM=;
 fh=mYFVYZB1KIwKuh2kAWF7ya+xydkgIRG6K2WrcjDol/U=;
 b=XfHae8FhtCTdzmBH089kSiENYhamqYLfrMkbHRkU4ngRQUuZYVUG6Ug/9S7T6azUAW
 WojgZEGMuUpPAO84nIJ2bkQdMX6eK9QB1H1grpluu9bKTKplC+pcHQsS3chDCEvSrJYb
 OM0DO3oO7lEUxXh/h/hqbCh6Mh8nGzdv4eDsD2Np99UQI+HQTP467jmUJyzxZKAMpl11
 A64TkQRPgWdVRNZww4Cno579f787LzcPvpPAXQErp0Pdy/5T5FVYT8Y3Yog7n6LdmrI8
 sC+KqcX5dJimSoEtTO3rr3Kn0uOCquScc5HbY5HGh+9YPwvS6ll9CwwwjtLoJdYkkMIV
 mX+w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783070885; x=1783675685; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VIeqffjGpU/iFP8bZYqFwZot2E/hD0BF0vHSKPooctM=;
 b=Xg93E9KpXWYeT7qL178d+mDBX4OtIlkSh6tCMVfoTpqqDgbD/6CAmAxlkm3ZxCke6F
 VOrGjK9P5MMoo15iJQKNBcgng6EEmEsvYATGJb/BTGbZKb5AwOdI31dmz5/cvJ7rRsGc
 YwgMbZJdaxuH36WO5rdcbHYlvGzABI6qJVnE8O5XZ/DcOfUu8aUS8OeY8vdE7RRNhy8R
 smtezRcC0MUH3+B6r866/ewLcOT2jP7lu/xHVIVqiNGHpRBSr4eJoPf2qgbLuDRVGPsx
 OU14r91W1SGDRioC9/aX7E3e/K08gYzgVj7SGYMszTwAeyRWjnFmcF/07wP+eGWl467Y
 WB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783070885; x=1783675685;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VIeqffjGpU/iFP8bZYqFwZot2E/hD0BF0vHSKPooctM=;
 b=egf1ApSOnjN7upRoVR66P1fOCj9/5t/zDmoGVYM9gGyYI3wagMAsRh8iiv4GWsqnCP
 YYAB6NRwAKpTJtjQTNggzMy6//tcvbYJhFZTg4kEyHN2kmKgPskVB3r1sAlK6n3M5VFd
 HUq6BP/MertedGp4ZKGIQz5mqyVh812t2qTv2TRCNeMSZYRBRusNo+/Cw+NYiN018Jtp
 Ms752gjsQ37Ozg4j8mAQI5gf4avJ3LnvgKGqEzPdtMa6SHt7X27lFQy4RFLZt95POWGS
 KUHg4bO3k4+Gr3U+ApZWEVp7rvniuLNloU31s+BFmxso5pV47YtLQLPJlWQnspApVW4J
 39Ug==
X-Forwarded-Encrypted: i=1;
 AHgh+RrpIbe5m0UgoFpUtwVm/VmIZ0RpygMU8qd4uG4JARBKw1/Pk7t9ZISms184rlgVn+NddPQF0Nutxw==@nongnu.org
X-Gm-Message-State: AOJu0YyyJv/ECDJljOoIcP0BlvrlhgiFF6RiK6T3FWgLIs7rjlD34ShG
 jUWqW8p/Hy5rqmc/eNOiNgtG1w6WxYmY7E+DIT+RlAb4FNuPLrUVQvvtPyEhvTL2U0RsgSCJ9v2
 CkXoXr+1MzgrMA/hMUqPxb7nGk7N5SmAMtJDz72ZQrA==
X-Gm-Gg: AfdE7cl8B8w+SUXaXpnHCvUp1WRBbDwdPW9WrGz8E+2aiyC53Hp2ISY7ohFT14R/QRe
 7t47PdSP8tH9MhCjEOjgGqegFuYJBeXqcgzoua2/yHw2wInGcqdnEL3O82WC5S/AJIACRax5yHX
 tY9DrmSQAVIqsVYIXf4k7mDetRl1TAaSubS42z1qb+f+PO+gbzFBzJ7eBG60H/0ApPq7DetEP8X
 uSOQvdyNS/DkJIRi9avoECrYBWJgkxcN3Iyl1y1yBeGtz9ktA6jdRo+hKnAxvL2uhIKY4icHsvd
 oz0cMUIHyrDU4chDDARSxwDtrjJblh4vriy0QJIBn9VFUtXuGa86pJuL
X-Received: by 2002:a05:690e:191c:b0:664:aa85:a7e2 with SMTP id
 956f58d0204a3-665219b9badmr9431449d50.28.1783070884686; Fri, 03 Jul 2026
 02:28:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260626231738.947317-1-oupton@kernel.org>
In-Reply-To: <20260626231738.947317-1-oupton@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Jul 2026 10:27:52 +0100
X-Gm-Features: AVVi8CdrAH9hTW7Uw_FFbG2yd6d1M-n2ipw5SzsSLISmeK-a9z-qtPnyupq1Vxs
Message-ID: <CAFEAcA8ry3ZZp0DrjcTwacf+znjrvv7d_bmF4iC0pTrhYSX3bw@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: Only evaluate SCR_EL3.PIEN if
 ARM_FEATURE_EL3 is present
To: Oliver Upton <oupton@kernel.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
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

On Sat, 27 Jun 2026 at 00:17, Oliver Upton <oupton@kernel.org> wrote:
>
> Running KVM with (as of writing, out-of-tree) support for FEAT_S2PIE
> on -cpu max gets stuck in an infinite loop of stage-2 permission faults
> due to the PTW incorrectly using an effective value of 0 for S2PIR_EL2.
>
> Similar to how S1PIE is handled, only use the IMPLEMENTATION SPECIFIC
> value of 0 for S2PIR_EL2 if EL3 is implemented and PIEN=0.
>
> Fixes: a811c5dafb ("target/arm: Implement get_S2prot_indirect")
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Oliver Upton <oupton@kernel.org>
> ---
>  target/arm/ptw.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 1470de3010..51affba0bf 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -1414,9 +1414,14 @@ static int get_S2prot_indirect(CPUARMState *env, GetPhysAddrResult *result,
>                    PAGE_READ | PAGE_WRITE },
>      };
>
> -    uint64_t pir = (env->cp15.scr_el3 & SCR_PIEN ? env->cp15.s2pir_el2 : 0);
> -    int s2pi = extract64(pir, pi_index * 4, 4);
> +    uint64_t pir = env->cp15.s2pir_el2;
> +    int s2pi;
>
> +    if (arm_feature(env, ARM_FEATURE_EL3) && !(env->cp15.scr_el3 & SCR_PIEN)) {
> +       pir = 0;

There's a hardcoded tab lurking here. checkpatch.pl will
warn you about those.

> +    }
> +
> +    s2pi = extract64(pir, pi_index * 4, 4);
>      result->f.prot = perm_table[s2pi][2];
>      return perm_table[s2pi][s1_is_el0];
>  }


Applied to target-arm.next, thanks. I added a Cc:stable tag
so we backport it to the stable branches later.

-- PMM

