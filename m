Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp892411njb;
        Fri, 6 Dec 2024 06:40:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUWwdraIPboDHRpSBe7Vbbp10RYwFTM8YeZXHIXopMiP9h/k3YfV4F8sIxJxZMbTpb+kDHftxEtY2ADhQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHOlqWV0loxJK5aw46NYpfl6MUq8BNy8se/E++1c0gCcq8EObS72aRjgj8kZRsnxFLhbrmf
X-Received: by 2002:a05:690c:5709:b0:6ef:7fc0:a378 with SMTP id 00721157ae682-6efe3bd6335mr28334547b3.9.1733496041778;
        Fri, 06 Dec 2024 06:40:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733496041; cv=none;
        d=google.com; s=arc-20240605;
        b=cRpGKL+e1QT0mRZwirCowyB8NcOtP6dhnhBREfp4Nnbr6KpHeO814vzRSfxKZ2/En/
         /FCLNhP2Q78lRivbkNwpBQPOHQzSSvwfqn2G1QIzw3PRqvqcY9wStS8yY5uro+UhQIGB
         Z5zysVVatU/osXjOY+NfDdvJN6z0/w+uwPAa2//1kSypaOh8VyaAwBsMHAo44Tq1seyX
         MVvqXo2d6lDqs0MYyH5LzeijeNfcFWu1WSMh9uWUYUfgLHOfjfd0EDnbsOcJmxacp/bi
         U9Y3PkuU1c4xY2nKgmQQ1bo+XMo1cmKwgJ9x0kzxzrBap84nJC2/+oC6MX4lR66MKhKG
         40jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=dKWsYe3dnMt1bAU3N0u0ZdoPsnUZIkj/ikSFbpwzhys=;
        fh=g78Jtyv5l1wjPIa2e4itv+Xi/qbR/aCh8L0kz167qOU=;
        b=SJzA7gkWzp+oB7HiukzXEwY1HZmfO6fWKyWJ9qIMZPRVmRjtoJNesaSS4L07tS+Nu6
         JO89sejEvnQe05ITvsTg6S5rPaduGiurpATPwPOYdgdt5IT0Ukg2qiR+welGUTUNN+lP
         P1Td56bZrU14B7gfoDc5VBrHPaQf829a6tx5OD3gxgFS7kbgjHY/tOjA0t0hwc8LjBwS
         /WUPmO/QCRWRKh1tAJ4aXzY5tWuU/bGLRDYZibPskMjJpAR2Xu4Fjyj8Ttw7P67ectwG
         fBRcuxLBIhLTVy2ocLniASEMdO6AJx9gjhAHd0monFinjkyEX+fnGvw+Yxkxwp4ZoPRF
         9/6g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EdTkpuAG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8dac292e0si1867846d6.492.2024.12.06.06.40.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 06:40:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EdTkpuAG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJZVP-0001to-73; Fri, 06 Dec 2024 09:40:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJZVM-0001tL-UO
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 09:40:28 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJZVK-0005TC-Iu
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 09:40:28 -0500
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5d0c098c870so3867976a12.1
 for <qemu-arm@nongnu.org>; Fri, 06 Dec 2024 06:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733496024; x=1734100824; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dKWsYe3dnMt1bAU3N0u0ZdoPsnUZIkj/ikSFbpwzhys=;
 b=EdTkpuAGIjd7G5H5+mcKZdkl5ZIKFTHFDSAFs3e3dY9yv93tujlNW3GFd73OPWnTGB
 Tj9dH/bBEEl3kjlf9r7OOX/h/xWJydqbVkPbtMMS+ZLoJhEZn1FZmOWqiywAS8OtpUhY
 RXBGnrCTc7ae2tT9GprGqbUXtW2DUHgn0Hnc8zm+1EuAopkTokOiljsgFN8mpLpDEZMP
 sL46WzhV0Ix8gac7JHATdrP7+dkL/If7GAmmICoDM8D3NP0BsXC7F6E43WFniIJfL6Of
 xnwzi0576utX3WeXFOcR+bZGb4+JLfZmQy5CTnhnY7iKl+05wVKMi2pc8MSVdUJqKozr
 Lirw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733496024; x=1734100824;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dKWsYe3dnMt1bAU3N0u0ZdoPsnUZIkj/ikSFbpwzhys=;
 b=IYv7s7zHMqZMFwAZs+Eb/9AgN2J217h0WMpFV7U5xTq2fKHjItt3iUxYaVZaXS76Ha
 5OMumjmzSrs92pMXVOpbLW2OJQoIRNcX+OBCWmpK8bFXknJMbl++SGsQKdeC5NgXh2Zj
 EXBLk/+66w4ODSvMFDgn6v3BbdGrRLzAJkzFW7pKVXEYuY1HIokcidZZFFrSjkt2IrXU
 zF6BEDo2T01G+0fbJ8cbzvx6vpiRizgKaZWhc06e4pUL1kRuZc+ShrEi8Zjhf2pks5/5
 hDlWLw1qVTr/cABIPtDp1ysNxIn8IcV1QiRTArhwmcFOWW5h7MzihTQOhqAwdvP2Sgw9
 gFkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuboeWSWJVp707lb1H7/7P0hyNQFjt1UVzE1r7zuDBiEL27N7F7EFWSfAKnWdvTWc+DdHTzzB5XA==@nongnu.org
X-Gm-Message-State: AOJu0YyyoWNCJiURoULGt5btc+tJuUbXRJ8hMOLJGAJq6Z8J0b1cRG35
 p+480hnDZuT5Obw/fDU8dv4Z1vzuAOFFBijpAdtvhKeODymT/y967JqU+mOHf0ywNBjafGx27pF
 bC1EDgZODLEq2Sl4BGkFujCcvDEY8jFp3n/fJ6sippNvpqAOR
X-Gm-Gg: ASbGncvA3bgQP1pbopG4rrRvbC2KlhQhNTM3ctkF0O/FFQQdYmuqOpKpaZkrV6xwhUN
 bDCkerJimic7RRfkbWsQv/KYw3UYAsMEf
X-Received: by 2002:a05:6402:27ce:b0:5d0:d06b:cdc4 with SMTP id
 4fb4d7f45d1cf-5d3bdccdb54mr3046377a12.15.1733496024517; Fri, 06 Dec 2024
 06:40:24 -0800 (PST)
MIME-Version: 1.0
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-38-richard.henderson@linaro.org>
In-Reply-To: <20241201150607.12812-38-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2024 14:40:13 +0000
Message-ID: <CAFEAcA8-GkpSxLc98y8ZopV9PMej7U4+Ruk8D+zUoEDPZYJ8aA@mail.gmail.com>
Subject: Re: [PATCH 37/67] target/arm: Convert CLS, CLZ (vector) to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: gpov8hlGodCy

On Sun, 1 Dec 2024 at 15:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 37 ++++++++++++++++------------------
>  target/arm/tcg/a64.decode      |  2 ++
>  2 files changed, 19 insertions(+), 20 deletions(-)
>
> diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
> index 4abc786cf6..312bf48020 100644
> --- a/target/arm/tcg/translate-a64.c
> +++ b/target/arm/tcg/translate-a64.c
> @@ -8920,6 +8920,20 @@ static bool do_gvec_fn2(DisasContext *s, arg_qrr_e *a, GVecGen2Fn *fn)
>  TRANS(ABS_v, do_gvec_fn2, a, tcg_gen_gvec_abs)
>  TRANS(NEG_v, do_gvec_fn2, a, tcg_gen_gvec_neg)
>
> +static bool do_gvec_fn2_bhs(DisasContext *s, arg_qrr_e *a, GVecGen2Fn *fn)
> +{
> +    if (a->esz == MO_64) {
> +        return false;
> +    }
> +    if (fp_access_check(s)) {
> +        gen_gvec_fn2(s, a->q, a->rd, a->rn, fn, a->esz);
> +    }
> +    return true;
> +}
> +
> +TRANS(CLS_v, do_gvec_fn2_bhs, a, gen_gvec_cls)
> +TRANS(CLZ_v, do_gvec_fn2_bhs, a, gen_gvec_clz)
> +
>  /* Common vector code for handling integer to FP conversion */
>  static void handle_simd_intfp_conv(DisasContext *s, int rd, int rn,
>                                     int elements, int is_signed,
> @@ -9219,13 +9233,6 @@ static void handle_2misc_64(DisasContext *s, int opcode, bool u,
>      TCGCond cond;
>
>      switch (opcode) {
> -    case 0x4: /* CLS, CLZ */
> -        if (u) {
> -            tcg_gen_clzi_i64(tcg_rd, tcg_rn, 64);
> -        } else {
> -            tcg_gen_clrsb_i64(tcg_rd, tcg_rn);
> -        }
> -        break;
>      case 0x5: /* NOT */

This was dead code, right? We only call handle_2misc_64()
for size == 3, but size == 3 is an unallocated encoding for
"CLS/CLZ (vector)", which only deals with elements sizes up
to 32 bits. Worth mentioning in the commit message, I think.

(I was wondering why the new code doesn't have any cases for
operating on 64-bit elements whereas this old code did seem
to handle it.)

>          /* This opcode is shared with CNT and RBIT but we have earlier
>           * enforced that size == 3 if and only if this is the NOT insn.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
