Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp42061ejk;
        Tue, 28 May 2024 08:52:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUlo3Tpa+W7rIKcUKMH15n1z2zrSJQij5Il5Vks+nay1WBulg4xFdxQO4+w8v2RrJKVaqqXax0wVrYtrLJLJ+W7YKPNthVC
X-Google-Smtp-Source: AGHT+IEtcM88zKCgrrDWZBuUnyNARVu8PB4rqjZWp0hw2c5zpcTvzG/LrQP4UXd3COTEx9BEUymD
X-Received: by 2002:a05:6214:3d88:b0:6ad:78f4:7e5d with SMTP id 6a1803df08f44-6ad78f47f13mr104738326d6.20.1716911528103;
        Tue, 28 May 2024 08:52:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716911528; cv=none;
        d=google.com; s=arc-20160816;
        b=bJpuxsNzgIiNnZH5EiW/h4QrEX7sjWIv8q32b01OiDaZQLrB6fee3u7AAN2+HU4Jmv
         XP5Vp38SExIYDH8mU7YETvno1wJx2ir5IhLE/VkFIAUv3ro/am5t5hmUwVRG2AEd6g0/
         iOERrJGuV1fuoJ5NV9BBsqxzxRfihl7Fd8rL85rfhue9paAMSOyEoSuOrZWaH16JN+m7
         U+TjRPfg5xXMkzEpM+rMSs1hyglNz2i5+Ev5nnqp1o2V98lNie117txKdh93Lo5OIVXw
         QVADtd9aMdxX0SRfPMDj6z45DI/K9OwlyW7JlyyS2qIrHvMPJk4hVIPd9ukgldpOq1oM
         CadQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=So98Jf54H8IWI3ia4EdVZYW+FWjhfKCBBI/z9EMCibA=;
        fh=1NxTY24bSmYLjV7zhdk6vaL3+6AAp/sCTyAtGpdKBe4=;
        b=kdKWV6pQ4V+c18gbubpWBUMgxjYdKkdZuTbU3jaNQuFneIjeKfaJtSNnDmg85MdDa5
         dEqONt4I65hfTcPWhzpXk5kA0TTEyZ/n6yIzDx+YIqF931Nmyo06H3QXdQWuCStCCK2t
         bwSpJ4ZDegoFQHMuh8i89USrg/jkFr6R+GSiwOnm05KdH9Xi2cV4v6VApkjoO5XK4IgQ
         JC0EOqp23OrCwAvdaIzyBMLJjBtWGVuTzVa6rTKuEVb2gQqNPfPplbA8HP0fOwuR0yjd
         OsAcg2fN32z+4QHqSD2l7kbNVyRXhvpJuAn6nz6hS5Z5M3Gh/sj8JH3vwAFoX/tiMNvg
         kwyg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oeD3m48x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ac162b2ba2si102518876d6.451.2024.05.28.08.52.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 08:52:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oeD3m48x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sBz6k-0000XZ-QD; Tue, 28 May 2024 11:51:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBz6j-0000XG-N0
 for qemu-arm@nongnu.org; Tue, 28 May 2024 11:51:25 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBz6i-0006Is-6L
 for qemu-arm@nongnu.org; Tue, 28 May 2024 11:51:25 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5785e443cf4so1082140a12.3
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 08:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716911482; x=1717516282; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=So98Jf54H8IWI3ia4EdVZYW+FWjhfKCBBI/z9EMCibA=;
 b=oeD3m48xcNLKHELmyHMjGh1V3JubvfRGWT7S2PXQqhmCFT8Bipb3kFf6qEfyB89zTE
 IRALMjCkhWf24mb+h9JWvIxmAexRMUx9FiEbGFYBvjOat14KGGrSDwiE8/7QOJYnuvJ2
 v4yTMZI48gMLdlNXzNar73q2+1tHCUi8Y7UrlJ6GxT9E0E6EhH+vawEafDhMlD7D+OGR
 HdOOWLwWNkamxiTowQ3gFHwOTeAb3ePLj0GpS+/qR4NHQ/xDHLsZho57t+dLTzjbLpsT
 KUKzQxN8DLEHKZA4ykVjclPqxHdIkotMmkobeuJz35P3xmp8YF/qWu+pngo1NhZnVlSG
 77bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716911482; x=1717516282;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=So98Jf54H8IWI3ia4EdVZYW+FWjhfKCBBI/z9EMCibA=;
 b=n72IhKt0raXNCMU9QBxsHFqIyiGfwid3FUYVDmmfA1g0InLOfb2QqaWiBq2xH61SSH
 rjfxZT2BS+xQ74emiDmpckLR/rDSC4PTxXQi4o/v4Zc8qVJVUiH2MWPXdKWrb1sLWd1g
 S6zUhQR4+n4sBFS7MZRWWxc54rS9nwqLm6Dj678Z2lB6Wq2uJBnmUB0lkruMIUjI5AMp
 +UWtuMKWFEXSNh/rexrcolw6X8C5N+gY8xq5P65RX9aXyhWzYk/efIZAJdtCMYwAla1E
 99jYsuxyGOhFhz7mJas87n0J0C4Xri5GqT6BPR7tn5MPx54AF3gDgSJpK+NaDHIwYZ9N
 9aBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZ8h6BP3eQRuu711EVtIuqi3GaWFjgBEQ/ZEhoRf0L9Ga+6QlTHAs2mZsh1V1aAa53ynbIN8ZGujdvO8slEn7SGmTl
X-Gm-Message-State: AOJu0YzifuRJDNAFT6rYRrvc+Ip0Z4VW3L27xaVjhgkAaIznYFlLuQzF
 h++Bt7zbeEIpB3WgzltV+ycuB6IkNjgYVZq8LGqsOMqy8eaDpIOgE4KNhr2GkKZ3M0rFo9KY/ca
 0FhUGcHc+r0A1ZXcJq5YvFO/8Hjl9KxaNl7bsCQ==
X-Received: by 2002:a50:cdce:0:b0:579:f196:45ac with SMTP id
 4fb4d7f45d1cf-579f196473cmr1533213a12.7.1716911482000; Tue, 28 May 2024
 08:51:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240524232121.284515-1-richard.henderson@linaro.org>
 <20240524232121.284515-45-richard.henderson@linaro.org>
In-Reply-To: <20240524232121.284515-45-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 May 2024 16:51:11 +0100
Message-ID: <CAFEAcA-4xMXjVZFGbDjefNabHn2MW=4jFaYD79iq5oV4qyXafA@mail.gmail.com>
Subject: Re: [PATCH v2 44/67] target/arm: Convert SRSHL and URSHL (register)
 to gvec
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ScEGwj2l8NDR

On Sat, 25 May 2024 at 00:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h             | 10 +++++++++
>  target/arm/tcg/translate.h      |  4 ++++
>  target/arm/tcg/neon-dp.decode   | 10 ++-------
>  target/arm/tcg/gengvec.c        | 22 +++++++++++++++++++
>  target/arm/tcg/neon_helper.c    | 38 ++++++++++++++++++++++++++++++++-
>  target/arm/tcg/translate-a64.c  | 17 ++++++---------
>  target/arm/tcg/translate-neon.c |  6 ++----
>  7 files changed, 84 insertions(+), 23 deletions(-)


>  uint32_t HELPER(glue(neon_,name))(CPUARMState *env, uint32_t arg1, uint32_t arg2) \
>  NEON_VOP_BODY(vtype, n)
>
> +#define NEON_GVEC_VOP2(name, vtype) \
> +void HELPER(name)(void *vd, void *vn, void *vm, uint32_t desc) \
> +{                                                               \
> +    intptr_t i, opr_sz = simd_oprsz(desc);                      \
> +    vtype *d = vd, *n = vn, *m = vm;                            \
> +    for (i = 0; i < opr_sz / sizeof(vtype); i++) {              \
> +        NEON_FN(d[i], n[i], m[i]);                              \

Does this need H macros for the bigendian case ? It looks
like we use it for smaller-than-64-bit element cases.


> +    }                                                           \
> +    clear_tail(d, opr_sz, simd_maxsz(desc));                    \
> +}
> +

thanks
-- PMM
