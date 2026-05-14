Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C8CCD4851
	for <qemu-arm@archiver.kernel.org>; Thu, 14 May 2026 10:36:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNTQI-0006il-28; Thu, 14 May 2026 06:36:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNTQE-0006g6-Eh
 for qemu-arm@nongnu.org; Thu, 14 May 2026 06:36:08 -0400
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNTQB-0006vu-Ge
 for qemu-arm@nongnu.org; Thu, 14 May 2026 06:36:05 -0400
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-65c7492a2ceso8028819d50.3
 for <qemu-arm@nongnu.org>; Thu, 14 May 2026 03:36:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778754962; cv=none;
 d=google.com; s=arc-20240605;
 b=eHfinEgOKloLa+Tj7AY2OkqEZaPX6dYXsu/8g3CPm+E8a7H1+NHN4AlB2+vwhdHrHv
 z//Br25fuVAKI9cotY0feTLwBgkmVv3uuVEXioMbid9KqnuW98tZ0hyjhhC2c8mAxYNw
 L/9J6+zWrNjnwRpEaXbyjaWDG09gUeOfzao1cWEsad81GlWIB024WJXMefFTp0/22jt+
 sF37YLlPy1uTiPTudAYVipzvDWZrsf0H7kG6VGoi1PPvHXoWOGEOsPEKiYTapYQ13k3k
 w/yn3Xr6dBh0prueG6NgGhnIT7lu3qhKSBspiPkm8NbvJCQ2RZfVI2wYk+x2j6lCK4kc
 B4VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=MrH5kM0u1sWk+ZNQaJmTKUQLLfGjq7iPep1qYDJzMsM=;
 fh=leuQ07SutAV8bZwTlYy81LqZOlMH++dxWd6anJMviig=;
 b=C26qH6lKEZsuk0q+3AUQuCz18Cz2j6zx8evuEjA8cCUeUAs4PnRF2an2xkuXRuQjxB
 D1zEu40oG2126abcV2yHi6KluD6X+IqIZ0HDhvbF0C9Pime7O028l2JYAZhGF8IkFmI4
 O2S965/nPEWRcnd8lxYyXUu3sIOil/a3SdayZq7YnFceJHRQGto+ENjQNck+uxBg7dwl
 fBlY+niryArpLtSRGt5u0GyzKFoHurtgoO/5K3mMNh506IUEuXtiRRRy0GAsjQeWE8FP
 pBAoEJEM0wVvFAKKYHX1E3qZuawzw2Oam0haEzFdawgrzjs39u8JKlTFXS6q6RnfT7Az
 Uphg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778754962; x=1779359762; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MrH5kM0u1sWk+ZNQaJmTKUQLLfGjq7iPep1qYDJzMsM=;
 b=qvN4xuQe4qt4/yDoMXWIKWkKYVA9HIrr40s6GxdRYPBPnLBMOJp8WhZV+1GniTBn3I
 4jmQRhFUAnRPBt+GcFKbrThrq9jNhe/fb6VdmdYsczsWHgRMVsJHyxaLAW4uYtDCxotP
 SRZJnYW4ZVCde2IL3y+fPx4rLk46grvJm/QEcHnCmAuQS6vq6TQZnYlYVoz9rkX2MPe/
 MoV7t3N9FIGPg9F04h5AdvQE2jBgUEl15vUJe5+EieEpid3uKr4vzPw59QGCyAivcBVB
 rVaHCYQksJrofvjsNhfA+GqOqvV1iVE+zFo41gWr63GKgSEAQC02OR05e6ACkz3rc5k0
 U0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778754962; x=1779359762;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MrH5kM0u1sWk+ZNQaJmTKUQLLfGjq7iPep1qYDJzMsM=;
 b=gPg3Aam3dTaLTPkz8VeNZ5dD2y1IE/bwhVKY2WKct5ONFQqziL+JnumjCvnzYQnWDM
 VAc2vTm7PER5VJYgweqI6e5MTjIG37PSMnHn98j/hd7TrjJmqX+WZf0nXsEXv0rz7snB
 pWjnZzqB5c4c/pnkqe8eUGxIJ58vtPKz/LW/L05sKBcIRzqX6xIW0K25x40AL3/G223/
 qBBlp+bu9GMhMfKTiNbgJtaO2pmpeKzUDXmWCdvJG9uD3xvvM6HJiRJeIkHYdrgHTAI7
 g7NZ5n+H24QLdSnlXBAOxbKuWUIhT+TJKM76teOZ9BkQ0KHzniQ3jb+D3/HPiuqQ0S9U
 BTIw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+GR5kg5GX+i6aIhpv/KCRyuG6tSD0+V4KWmIdF9Zt/hEPzAyeIU1tBu9v+HL1rg9Z13kJyBrJVDQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy3Oa1sluaANLrbvu0AP3GVTDbTSF36vAPWs3kcoDhpSaqEgmDW
 M7c5tOtbZnxECQzlA/wiAQcTT6q/cssc/Q789C4uISXVhRWVfVkpCsrImBSXQKiqbh0iwjf9/QC
 mcz3ybe3+uTz+tic7HDw/CqPmhCm/D45qbQ64+V4iYw==
X-Gm-Gg: Acq92OHHWvLT3qH0wCMGGNmzXYmC92T4H+9ruvse1hrgtJSx4u9258VsJayB5dvIjL3
 k7a0VU/Yr0ssdtB5GG1ZphRbt/MW+gJpnyFGT3aXdblbtzTVz8LhX1hPHPDI1n+KgH6Z4KOKvuf
 3BSameWGG/do6RYl0ut248c1o/H7NDHtNAveEGFEr5WTKvP5hDHMDDecUOOniFRLLbcfaYUPEeC
 1Ccg3KWkCVSOSllQQLrSlWIEeiwseGxeNYWKwUMMrbm82sCiamqVRe6rxHsbc2xuEPnBRo63yOc
 NSsPHsAW5uBXstgjLbBO8OCq9rnOsqlkcIghH9sUSheSbvrbE2tvNwVnLzt9wpZaqzDLgubiYk7
 Q8Q==
X-Received: by 2002:a05:690e:dcb:b0:65c:1f97:2c4a with SMTP id
 956f58d0204a3-65df815aad9mr6798863d50.16.1778754961817; Thu, 14 May 2026
 03:36:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260421051346.41106-1-richard.henderson@linaro.org>
 <20260421051346.41106-3-richard.henderson@linaro.org>
In-Reply-To: <20260421051346.41106-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 May 2026 11:35:50 +0100
X-Gm-Features: AVHnY4I4uQ3TcVSJRnoMyTMpOTgcUwN6cMiAddhvfk56TYLMqB6mLkczWSi-KEg
Message-ID: <CAFEAcA8cM2aKa=9Qh8LOVyoEZKQfw3rTBfNrDi4xd_s+tXq2Mg@mail.gmail.com>
Subject: Re: [PATCH 02/37] target/arm: Implement FEAT_FAMINMAX for AdvSIMD
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

On Tue, 21 Apr 2026 at 06:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-features.h        |  5 +++++
>  target/arm/tcg/helper-a64-defs.h |  7 +++++++
>  target/arm/tcg/vec_internal.h    |  7 +++++++
>  target/arm/tcg/translate-a64.c   | 14 +++++++++++++
>  target/arm/tcg/vec_helper64.c    | 35 ++++++++++++++++++++++++++++++++
>  target/arm/tcg/a64.decode        |  5 +++++
>  6 files changed, 73 insertions(+)



> +#define DO_FAMINMAX(NAME, TYPE, FN)                             \
> +TYPE TYPE##_##NAME(TYPE a, TYPE b, float_status *s)             \
> +{                                                               \
> +    bool save_fz = get_flush_to_zero(s);                        \
> +    bool save_fiz = get_flush_inputs_to_zero(s);                \
> +    int new_flags, save_flags = get_float_exception_flags(s);   \
> +                                                                \
> +    set_flush_to_zero(0, s);                                    \
> +    set_flush_inputs_to_zero(0, s);                             \
> +    TYPE r = TYPE##_##FN(TYPE##_abs(a), TYPE##_abs(b), s);      \
> +                                                                \
> +    set_flush_to_zero(save_fz, s);                              \
> +    set_flush_inputs_to_zero(save_fiz, s);                      \
> +    new_flags = get_float_exception_flags(s);                   \
> +    new_flags = (save_flags & float_flag_input_denormal_used)   \
> +              | (new_flags & ~float_flag_input_denormal_used);  \
> +    set_float_exception_flags(new_flags, s);                    \
> +                                                                \
> +    return r;                                                   \
> +}

I don't think this has the right behaviour for NaN inputs.
We don't special-case NaNs in this function, and we pass
our inputs to the floatN_abs() functions, which also don't
special-case NaNs, they just flip the sign bit. So if the
input is a NaN with the sign bit set, the max/min function
will propagate a sign-flipped NaN to the output, rather
than correctly propagating the input NaN untouched.

-- PMM

