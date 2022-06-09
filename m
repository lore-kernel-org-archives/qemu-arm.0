Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp626515lfb;
        Thu, 9 Jun 2022 11:37:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyw30N740Ypv+xlxU3fSYNEFSaMk4O+lduDHeiJseVfqcMX+OYn5grXb4YtXaMU0377kQSH
X-Received: by 2002:a37:9607:0:b0:6a6:a7a4:2fea with SMTP id y7-20020a379607000000b006a6a7a42feamr21360872qkd.381.1654799861456;
        Thu, 09 Jun 2022 11:37:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654799861; cv=none;
        d=google.com; s=arc-20160816;
        b=DHJvc1kvaiwn6rL6U3SvTEsK4NphoLa3uGJ9pho3TPFiO/oWk0nYrDivphBJoE0vmB
         fbCDC14SFAe3BUvD6zbL+uZamFqEjlz+KVJbA1FZW/+cCt2hvKLaYG+vbELLXayyNnBT
         jKU3BmeY1d8p8o7TqFP6L4DqHbGSXVydiwQ74/yOpcJ2rjsAo9fMFKeaT5Qp11N68/7k
         Bbu2161HKtFvu7RBCgp+Ci6bAsjV9X4kvxRI/0PGjQgnhLMq0nMfXjYyeEpfrQ/3uSKS
         oIq9aXH2aBf8ctrZrMLnz3sjQ+q7OxlzhXXDq3AhF2jDjvfgwl8DXcHVRHJNvfZHhjvo
         HilQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=9NjmZq2FTkWs7bk8NVL+Z9nGi0I8flVKyKYjxY9T348=;
        b=Q/Ux5UZEriDprlGZDn/GitnipK82e9IX00QxU1kAl13SgOgsYajSgHn3l0CdRipZQz
         Aslq53x4V80mXrGvn5iikKCb6sSx6g1mWbO3fCAGGbboYi4fidJ0cCGO3MbsauE6Hj7U
         owBN2ihmdtEd1awzL7BYl9wqHZcDlZ6brbzLiNyybpw6HT1qJBGbX0qIhXB//jXLKFda
         G2sTU/LKQfG7B7es908VelL/CZ00ygFut1awpvkyyptND/m7hls2awKC8sYJ3PX4czm0
         9hL7lk5l/m0/jAvxQUmkdyxIRGohSq9ltHlW41AAySYcN9IADBIvXcQBPH4uhMuko8bv
         8Sng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jkcEP3U7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v17-20020a05620a091100b006a6b81e6b92si6271058qkv.583.2022.06.09.11.37.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 11:37:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jkcEP3U7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzN2K-0003C7-Uj
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 14:37:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzLQ2-0006QO-Cn
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 12:54:02 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:37504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzLQ0-0007Kq-JA
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 12:54:02 -0400
Received: by mail-yb1-xb36.google.com with SMTP id r1so14182866ybd.4
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 09:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9NjmZq2FTkWs7bk8NVL+Z9nGi0I8flVKyKYjxY9T348=;
 b=jkcEP3U7fTX7lpSO32xjugMP2b2D6qSsZ1Hq5MfVZjraVu8v1KXwqoRYE6PSkxFjNt
 VhuU86O1DkUkBa6YpGsm6+pPdYqPkvFCVAfWRFHiGBxLqYmJmDTWP1XW9urS8oa6MEMa
 kehxVBda+oFN8xkrJdg7yEkVa8F154wn3OUMNMREjKbcSiLmLurB2Aw2qRctP/n6WFrX
 ke3jyF0q8aDARc6I16/+9aRy0LvdC9f5k8m/MZ0RxgsNyKzS6Z0xcNghe9YTr2C3l2sW
 AwqGOmnohf2ktBfUjUMcfN/M5LvWKUm3rNRcbhVUjSOzbL9sFoYOyEkaX3XrbpqnJuPb
 /9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9NjmZq2FTkWs7bk8NVL+Z9nGi0I8flVKyKYjxY9T348=;
 b=At/tzP5H2u3jUOSQQ7gUzcW8lpticY0mEQiZ+uokoKLrFyBGF+I2rrvv4xKtvvsRQQ
 iEGPy5wLx/5pyCNn8PLWyL7uwOJCpjlwmb1wylsOe/g7+EbyAvYqodcDCaJIjitRhdds
 03z/f6I6nlxFU9MahonWVXnD6fUvdHBHB8Y5aBO2JlJvWf7KIKGcy4myf/bb1vp0kIGQ
 lJQEQMHQ6ot//jRDsG1LWLuI7FWWLffXzQgRA7afh7NPjgcbRTOHNQk6hLWf4XVsuSfg
 TWmhYmgOu7DhI7mWyTKP1+9myzZYhvVrhELWP97tzutat1Pe6iwMjZXJJdyHZ0DudiQm
 VrUw==
X-Gm-Message-State: AOAM531aqDR/9r2QSr9dhaoCedJSHfvLyuT16WkykrHnjdEHbRaa+WCz
 R4dAbGsLfzovhoxw0a1kAvd1uQYEF7OxOMvk9DLVpw==
X-Received: by 2002:a25:47d4:0:b0:65d:510e:c8de with SMTP id
 u203-20020a2547d4000000b0065d510ec8demr40746971yba.39.1654793639468; Thu, 09
 Jun 2022 09:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220607024734.541321-1-richard.henderson@linaro.org>
 <20220607024734.541321-25-richard.henderson@linaro.org>
In-Reply-To: <20220607024734.541321-25-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 17:53:49 +0100
Message-ID: <CAFEAcA9KR9_YicVwE0Ryp8BWzUe_-xOV78h=v9b5Hhpm+LZpCA@mail.gmail.com>
Subject: Re: [PATCH v2 24/25] target/arm: Rearrange Secure PL1 test in
 arm_debug_target_el
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +BBv3IPriscl

On Tue, 7 Jun 2022 at 04:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Not a bug, because arm_is_el2_enabled tests for secure,
> and SCR_EL3.EEL2 cannot be set for AArch32, however the
> ordering of the tests looks odd.  Mirror the structure
> over in exception_target_el().

I think the code is following the ordering in the
DebugTarget() and DebugTargetFrom() pseudocode (or else some other
equivalent function in an older version of the Arm ARM...)

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/debug_helper.c | 30 ++++++++++++++++--------------
>  1 file changed, 16 insertions(+), 14 deletions(-)
>
> diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
> index b18a6bd3a2..59dfcb5d5c 100644
> --- a/target/arm/debug_helper.c
> +++ b/target/arm/debug_helper.c
> @@ -15,22 +15,24 @@
>  /* Return the Exception Level targeted by debug exceptions. */
>  static int arm_debug_target_el(CPUARMState *env)
>  {
> -    bool secure = arm_is_secure(env);
> -    bool route_to_el2 = false;
> -
> -    if (arm_is_el2_enabled(env)) {
> -        route_to_el2 = env->cp15.hcr_el2 & HCR_TGE ||
> -                       env->cp15.mdcr_el2 & MDCR_TDE;
> -    }
> -
> -    if (route_to_el2) {
> -        return 2;
> -    } else if (arm_feature(env, ARM_FEATURE_EL3) &&
> -               !arm_el_is_aa64(env, 3) && secure) {
> +    /*
> +     * No such thing as secure EL1 if EL3 is AArch32.
> +     * Remap Secure PL1 to EL3.
> +     */

I think you're also relying on there being no secure EL2
if EL3 is AArch32 (otherwise an exception from secure EL0
might need to be routed to secure EL2, not EL3).

> +    if (arm_is_secure(env) && !arm_el_is_aa64(env, 3)) {
>          return 3;
> -    } else {
> -        return 1;
>      }
> +
> +    /*
> +     * HCR.TGE redirects EL0 exceptions from EL1 to EL2.
> +     * MDCR.TDE redirects both EL0 and EL1 debug exceptions to EL2.
> +     */
> +    if (arm_is_el2_enabled(env) &&
> +        (env->cp15.hcr_el2 & HCR_TGE || env->cp15.mdcr_el2 & MDCR_TDE)) {
> +        return 2;
> +    }
> +
> +    return 1;
>  }

Anyway, if you prefer this way around
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

though I think there is usually some value in following
the pseudocode's arrangement.

thanks
-- PMM
