Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F14CDCD5BA4
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 09:53:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ05P-0007mC-An; Thu, 21 May 2026 05:53:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ05N-0007ll-N3
 for qemu-arm@nongnu.org; Thu, 21 May 2026 05:53:01 -0400
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ05M-0004v4-6C
 for qemu-arm@nongnu.org; Thu, 21 May 2026 05:53:01 -0400
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-65dead17c24so5655181d50.2
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 02:52:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779357178; cv=none;
 d=google.com; s=arc-20240605;
 b=Z1Hs+Ao7dHf7djr7f8aMjdF1TNqC7E0P9xNT2NqThch+hSYMOiPQJaMQFVybQin7M7
 zej5ls5IjlyPHhOCD11v4zV7wThhpaN0fa+C8uUd1qMHRNTOQnscNTzPku1rAW5N3VGj
 i5n2zTbwye5P35tUDI0b+16IUbjqgRsDQSJrv/+QfH8Sr2HOE+Pk/aH2WUiLXqjlKDa1
 PoJlkTV/jSs1dG+1lBivQ0WImTKX0I/bXrCvfTMApfyoTTR6rVbAUC7WrXHP95vFtDVq
 gUt0HoO7jgzUH7dhNEuQIPbgjAIo64UZjMmzNVwdVL7xD6VgVJfBeKfLFsl3ZtXb9g6Y
 AjEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=nUgeBFh1V4EOv6CYNGi1f0MN9FXnwdnSuM0h+QguS+Q=;
 fh=Zlhs7bGpAd1ohpSlFh6jBqVO6PQQaeD4tvJJhS2Yof8=;
 b=NJIymJwrDtYmcw18H4shD+2mHBf7wCiJ2gPHNvOCRlR5Kamuo1vwkpUQfSV1yhEW+1
 E0LkZ2gixuKVQQMeAh+bCM+AiZsKD3IG4c0oNQsEnYJI/88+EiStD0XvmGlHLeT1Iw2B
 R/E3+XBgxgUu1wyfGkuonrjBaze24y+Qqa5qBpKvvA1cmT7pB7zVi8JpKAa9S3jaZ99b
 9sjKSvGZLUSFrWc7O83e4GasMk5jLfJkpp/GPgzy1K/dFlK3PiiPQKy6g+ZGMkur3VEH
 x/8QECHb5CY5PpvUxXa3vAuQglqeSeJsoQfokoU6GbVOSWQwQPC9MsDphJO3r+5Pxnd2
 3U9w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779357178; x=1779961978; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nUgeBFh1V4EOv6CYNGi1f0MN9FXnwdnSuM0h+QguS+Q=;
 b=aN0Wc0TNzpmzN95B4bMfvrhcPWUw4ehjIBlMHdjslUgXRcE05oZUENeA1zjkSiD7Nz
 w8KbTQNqYtd9IBUIxtNCe27K5sZFeW3YJLTjkcK8YEya+WlYchzmV5iwzOfIGgBwl/cN
 vp/gG5Vio6DI8oO1QX9bikvo8Rh5NxDskWOoha4tMlkBE7F/hf3uTK1IQDShIjbx7yYt
 tqNxAcFVOefEzq9XA6nMyzynFV+v0WEFx4vX9+LRhHW4GL3brDAhfAhlQRRl9lD364lF
 /T6bgXu21Ub6kXL9ZriqeYrzqna2et3327nT3oK0x6WchA/uUro7QseQp0bT+b0vDqMg
 Fakg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779357178; x=1779961978;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nUgeBFh1V4EOv6CYNGi1f0MN9FXnwdnSuM0h+QguS+Q=;
 b=QCKr5NMNVhgbo7ZmeyT3mD0E7zzmSFhbtzHOol1O7Hgqvv5HzrWwkM7tads94sIw2d
 uST4lL9VAfiJ87syyF9wU/Iv1rSxvEDInBWngJRlxLMSn9WZ7j5MvzJN+gMsliOMrRA0
 jqg+0Ra+TOOQsflc2qjkGza8S7QLQ56uT2o2scy+jcvvKqpSocqP3kkO18De/zREGHfZ
 4uegeSVlE70h60l+iSGcLsjA4fJQ1Gn3rwD2JCO/qXTuFwH2HdsJ1VyRsb5vcrDnKLsj
 yGGQ+tqgFZXAbhfF7RzfQJ1WFw8OClEnD+1OVegqv5lv9jlKq1DIn+9n0YIszWv1wgQt
 sNbw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9Tnrrw+L7CdGDQuS64j2Hy5gqok8a1PCSO6aNB+8VYKXxoQBQgZpJgGJNIp9WL2KXdFBNOPI0pUw==@nongnu.org
X-Gm-Message-State: AOJu0YzDyj+9hhkTqgliCgBun/gcKBhm/8LVy5vPBgzj1LVxshBD9kbp
 cBbO1JAJC82nt/c1tJg8hu459uj/OJjLOUyFLAj8vcJ8iYqbo5JsHCu1Hs9WuS84dnfz0HctaX8
 xzMGQRUkqo6eJf7HfwCtot7dz03lkFZDJ33+QXhnmnA==
X-Gm-Gg: Acq92OHkGKWiCA3uGGM4wkvlrb6JxeBLsqktF5X5z56aSgPY1qLd6qz+iMf6p4GVvmf
 CanE2IHBn4MW/lL77fx6qeFD2NKuFJ/P98PpFzvPgjoB576yKC5uQ8h8Y8zkyXmIOjbycqPz000
 mnLWkqIdyw8TXrldbSZIitd7AO3DEjUFpD/mKXUxQhIme+KWyjcE341CmksR+14vvFuN4xdMAAD
 tVqFNrmgTaaFCjRXBV+A9lVWGLGiCYzwUGkWo9OcXg0q5TkJUunQiuj5Ty32xG80nIX/1835xYH
 XlP1SDQlfPMtb/1agHajVvy4waOjyA1dFukT25PinalSIkiVFd0FnIWkoGqA+fwESQk=
X-Received: by 2002:a05:690e:191b:b0:650:1bf0:ca62 with SMTP id
 956f58d0204a3-65eadfbf3b1mr1632986d50.6.1779357178208; Thu, 21 May 2026
 02:52:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260520182213.872945-1-richard.henderson@linaro.org>
 <20260520182213.872945-61-richard.henderson@linaro.org>
In-Reply-To: <20260520182213.872945-61-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 May 2026 10:52:46 +0100
X-Gm-Features: AVHnY4KzFW7o7duDWfFFBk208fM3EgldrA5vL9H3OhtFIjRKgYUvaYDJcRGYe5E
Message-ID: <CAFEAcA8+VBdRt3DO9zgwQccbH+O2PMZnK3o81zmX9M1GmgiseA@mail.gmail.com>
Subject: Re: [PATCH v6 60/64] target/arm: Implement FMMLA (FP8 to FP16) for
 AdvSIMD
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12b.google.com
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

On Wed, 20 May 2026 at 19:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> +void HELPER(gvec_fmmla_hb)(void *vd, void *vn, void *vm,
> +                           CPUARMState *env, uint32_t desc)

This still has some lurking copy-and-paste issues from the _sb
version:

> +{
> +    FP8MulContext ctx = fp8_mul_start(env, 0xf);
> +    size_t oprsz = simd_oprsz(desc);
> +    size_t nseg = oprsz / 16;

Each loop here handles 4 16-bit halfprec outputs == 8 bytes,
so we want oprsz / 8.

> +    uint32_t *n = vn;
> +    uint32_t *m = vm;
> +    float16 *d = vd;
> +
> +    for (size_t seg = 0; seg < nseg; seg++, d += 4, n += 2, m += 2) {
> +        float16 d0 = f8dotadd_h(n[0], m[0], 4, d[H4(0)], &ctx);
> +        float16 d1 = f8dotadd_h(n[0], m[1], 4, d[H4(1)], &ctx);
> +        float16 d2 = f8dotadd_h(n[1], m[0], 4, d[H4(2)], &ctx);
> +        float16 d3 = f8dotadd_h(n[1], m[1], 4, d[H4(3)], &ctx);
> +
> +        d[H4(0)] = d0;
> +        d[H4(1)] = d1;
> +        d[H4(2)] = d2;
> +        d[H4(3)] = d3;

The H macros here I think are wrong -- d is a float16 so we
want H2(), and we need H4() macros for the n and m arrays.
(I think in fact if you work it through then all the H macros
cancel out and we could drop the lot, but since they're all
acting on constant indexes there's no runtime cost and having
them present is clearer for the reader.)

thanks
-- PMM

