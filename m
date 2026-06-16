Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3519CD98E7
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 14:52:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZV8n-0004Wg-BE; Tue, 16 Jun 2026 10:51:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZV8l-0004WP-0n
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 10:51:47 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZV8i-0006jO-Vp
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 10:51:46 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-662bf1dab83so755555d50.3
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 07:51:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781621502; cv=none;
 d=google.com; s=arc-20240605;
 b=Y/k0evY94aW3NAquOzxLjg9uQIEukPCO8BjOcPZawQEILs6bXbq+bRUjpe0IPIZSlV
 kaILtZisPnXoZS5d2NyHaHEiMvUl71l/O9W++NIu8aRwW98mkHcilI3q8ERkSzhtMfY8
 vLecqPl8KgLFzwGgsy53Oy8sFkDFbFLexxGhVitWyeaKmJFFdkWbDhhx3kVXR6TH0YkS
 MpeBJazSKZEhjiXL+8tRcX2H/m0WRhNTpTSyXY7oZUfLkUolBk+E5uVrE8txGtYmNYN0
 yUE1nZvZh29MfIERmwHqWj94wj79eUZwEsk7md8Vm+YsC1Dg4lCYFGzQag6gE2HflrE8
 0Y4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=VSX1HRHle/avCp1jehNCQxn3fzJYzZGZcPx0Ur1AmDc=;
 fh=mWgWdeeZgoZa+BI2PAXrsuT3tEb6KH7DCtTAiv2dNKs=;
 b=KRGCRxzcIR0rzAVURryDkgDfN5v3nzWaRaFLT+9Z1S/pNNfJCbI5Sa372yT/Mdt9Zi
 bGun6XXNNITWTCVEIY00tWdwso4NRBBJExHQDYAivSpmdCH5eqAH3EPkjcHh4VmZNL/r
 oAWrrBb2aFrNtL7ssQU1tMpaZTcova/JGAhXWcE60ZBkqDQ+xayWU7PO8+IYNbfYeGYX
 EA5XJTzGuEGGHh3dicDYrlb7gKMK8EzU9RWQCf9qRV1UgF/QJVA+QQfmNkcknWO9IApO
 uFxWshDoB1do9yGpwrwRvZQdpgT+2+YL4B1kec3irg9PyRgvVGVk+kC+PqW9yxGqhH0u
 pBtg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781621502; x=1782226302; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VSX1HRHle/avCp1jehNCQxn3fzJYzZGZcPx0Ur1AmDc=;
 b=cw3grTv3M2nb5L8vgpaqsHIoG8bnqw7YyYHLPW3wPA3Rh2j6mwk25y4Vmz6mkdM3Xv
 ZGR+2io7iaNWWDFJ8f0zAr5tHetot/N/SNlnBeTVQKY5+JrnvYCYfxnzgQCnMB85AAYq
 y3/DbWl9s79CryO1krYgtgUX484/4Au0/xULrLTsJ0fV0oAUKIeqHZjiZhenmuoU5ctB
 PBJ12e/DCNag+Fy+jZxs1SAQZNs+hM5526Q6YVlmNSb1vd7Om6C656A97JTah0JgNATL
 85OwKdyxAsYMDe2aS87l/wnAw+dCzdFu/hpddcBy7DkESRrDPvpokb6qDvRQPDHqHcy6
 dqwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781621502; x=1782226302;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VSX1HRHle/avCp1jehNCQxn3fzJYzZGZcPx0Ur1AmDc=;
 b=hZA7FJwtD1idk21JL6MuPX00IdRJt30h5T3vzys21Q82vdZT9K5rx2CloFOMI8znFA
 M/2z3BapSZT4LNYHwCMg4lqDcZo6FpNsf2AnmjCmQQs+xgnz7zFQ1PYa92pSbNzPZuzr
 MJ35OIGzeOEgKJYJwdQ3ObWDwTuYYO91FULL/SeYQOPp1YuoPGi4p9/oS/HFJg4JeMkw
 7GHyD8Ldi5v1WJTEGDhZtGRA3EizNKlTMjfOWcE7TTc/WC4UhiHP/2CA8g+/xDVVecyz
 HSeD9I992NIPauqgAYrHCOizSqzjdE5giKxH8J40IE5kuIFtUcNasLgfTnl2qnzu7JlZ
 Hxtg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8Me2qUeHcKWNO95Lz/yWv7prAFHAwpFV5jP+GUTD6SRPKlSpnbVoB8fIN17QjB+mWi5OfNCfEYjQ==@nongnu.org
X-Gm-Message-State: AOJu0YwfoKjJ/WotE3ignD4IWvwQ/D2Ksu9G9rw8ymXABU1ubvx1MdbP
 LyJnQe8xKkd9CTul0fztmJ4cFrM89o/YVb2FLbfWq78p0L7kmvJ8YF2od8LSG1+BmlM8p2ckQHQ
 IY/7l+ygXd++QdPp6WKlfoLBCgJoPec6+dtcOIAmTiQ==
X-Gm-Gg: Acq92OEP6TXG5BSL/NBrzOmIKYMpWFJrtax+28hIWjHKIyHgP1E23W1BllVBOk/ydgJ
 NFiwREKOufHhnTHqCPb6HUZ8C0CsrZCqdGrszWMuEhGZwBk1nsisDjQZ+fv719WTFChYe2Ny+RJ
 WBh57IlDDbdVyaoZBuRT4nENLrsiGpNFBFYRiRNIKszqK3oTVh39cdpZvruOY8oDr+1YobSvLIo
 V5CvP1MNbQoQXGF1tRA1L7aBG2Nykbg+pc4JzDHScmtXfEcSuuL3EuL64tpT5L0QuYMx1L5Q8Tz
 6nHF9a2/FufUx/FGNPKJr6W/mauNaqAfEBgUtr4PFZNEqZG+I7PuuZJpjz5yHWd5cVo=
X-Received: by 2002:a05:690e:4384:b0:660:6441:d041 with SMTP id
 956f58d0204a3-662850c23camr11461140d50.39.1781621501960; Tue, 16 Jun 2026
 07:51:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260604234852.573178-1-richard.henderson@linaro.org>
 <20260604234852.573178-25-richard.henderson@linaro.org>
In-Reply-To: <20260604234852.573178-25-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2026 15:51:30 +0100
X-Gm-Features: AVVi8Cf0JIJvSbrcKV0ZemvnSq0VbYHiCUaiEVOog7oOQbJPebQuS3BH9TCWd2c
Message-ID: <CAFEAcA-0VgXH7bZgbc730ZgHZ02ZR-jm300izcPDabgBCHAY=A@mail.gmail.com>
Subject: Re: [PATCH 24/25] target/arm: Implement FEAT_SSVE_AES
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
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

On Fri, 5 Jun 2026 at 00:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Enable FEAT_SVE_AES instructions in streaming mode.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-features.h      |  5 +++++
>  linux-user/aarch64/elfload.c   |  1 +
>  target/arm/tcg/cpu64.c         |  1 +
>  target/arm/tcg/translate-sve.c | 20 +++++++++++---------
>  docs/system/arm/emulation.rst  |  1 +
>  5 files changed, 19 insertions(+), 9 deletions(-)

As far as this patch goes,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

but I was briefly confused by something in our pre-existing code for
these insns:

> @@ -8174,15 +8174,17 @@ TRANS_FEAT(SDOT_zzzz_2s, aa64_sme2_or_sve2p1, gen_gvec_ool_arg_zzzz,
>  TRANS_FEAT(UDOT_zzzz_2s, aa64_sme2_or_sve2p1, gen_gvec_ool_arg_zzzz,
>             gen_helper_gvec_udot_2h, a, 0)
>
> -TRANS_FEAT_NONSTREAMING(AESMC, aa64_sve2_aes, gen_gvec_ool_zz,
> -                        gen_helper_crypto_aesmc, a->rd, a->rd, 0)
> -TRANS_FEAT_NONSTREAMING(AESIMC, aa64_sve2_aes, gen_gvec_ool_zz,
> -                        gen_helper_crypto_aesimc, a->rd, a->rd, 0)

We mark all of these as aa64_sve2_aes(), which we define as
    return FIELD_EX64_IDREG(id, ID_AA64ZFR0, AES) != 0;

But the Arm ARM calls the feature defined by AES >= 0 "FEAT_SVE_AES",
not "FEAT_SVE2_AES". I think this is because we implemented this
before the Arm ARM split out separate official feature names for
the sub-parts of SVE2, and we happened to choose something that
is almost but not quite the same as the official one.
(cf commit bc980d66308 adding the extra names to the docs).
The name we have has slight potential to confuse, because there
is also a FEAT_SVE_AES2 (for AES >= 3), which we don't implement yet.

Do you think it's worth updating our feature function names to
match the official architecture names, or shall we just leave it be?

-- PMM

