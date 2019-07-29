Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3180508wrv;
        Mon, 29 Jul 2019 06:52:53 -0700 (PDT)
X-Received: by 2002:a9d:5d0b:: with SMTP id b11mr10446731oti.333.1564408373210;
        Mon, 29 Jul 2019 06:52:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564408373; cv=none;
        d=google.com; s=arc-20160816;
        b=jvVUQI7fKO6Dqt5Bz1k0cY5r+37PmsFpS7QpUJo//vy+qts/6Ysz9lin13vNisZMbg
         x74szfQ6PlNwYi9NVTDNwgGQJ+yHmHivtRR2z/QNPu+DykK6GZMC52QPB2scJV4n1DkY
         kHony43kFNMuyuShsc98/bn422sEgr6rxXJpg0SvzUVHNeGnbEVKL5ClyYZWviqU2eng
         Q4/unz3m3adlpqJXz4kdD+l228E2XCRarpcAJCiK6oWl8B+A36YE0M5SjOfdOPvtu9Bx
         6L0DsX4gT5XJLdIwPIaKuTfQI2vTG63pLOrVAiejUq4ZsIyBwz8fVpZA401FyszUskIS
         6tpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AJIPApmunRaDVleF7ASJ0u00EHmTdBgJRyKlvg7vvbQ=;
        b=qcbmsioeJe63FMEic3UyXXARPUkTsKjbJG5P9RqGhlF2NwfSX6v/XRqXF9Nq+qrRLh
         QcHF/AojF2Ob/KldJEGR2V9aePg34gLAcR1QNIeWoBVrDiitv0Q+nB1L8UOoBjgnlFfB
         BtU3dvZk8T3b9fGbQVGpNKYBMnIK2iQJVdYN6Vb24npw5V3mJtrQip61ESvRLSLGzQvt
         G6U16wUkc3mtMNkdAe/ADkvbJBNIiOEHh240eNrzuE8zQNdD+nMXHdzo+MVxjccnb6Yb
         7xZFJlu+IwqkYRq0XQ4rLnAABQoisiHdnpvQ1XprGKVunY5RdDEcanO8PBh+f/q815si
         ueqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VEDuSBPC;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id p129sor26680723oib.67.2019.07.29.06.52.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 29 Jul 2019 06:52:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VEDuSBPC;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AJIPApmunRaDVleF7ASJ0u00EHmTdBgJRyKlvg7vvbQ=;
        b=VEDuSBPCaubJRL/6B8k84wXeRJeNGZuEbznNn7YKAWS+oXoHqb5Lc03aHsscZftA2v
         vGB91YB4SD4yxkuZAkCkQ6uE77rGc6YWFcf2EBP8tDv2okH+XWktlZzTXhqr2igeKPW+
         sGYTqksbcuxBcFbO6OJGbPPBDL6+TOXzplO+DY8anE6vTnBFMZVopokJ3PgeCdOn8FMZ
         1KUhAy9tFSDRCbrWnXBD0TDkZ6deckrJdhI+jxthXkpcVzcB/dpEbaJrkD7o5Pdy1diB
         w/rnlg9yU7T1fnPYmfW9uwSjdWKA9R/6/bImWDD229MxcuksFrhbgcQJw/qHxYwIceou
         s7Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AJIPApmunRaDVleF7ASJ0u00EHmTdBgJRyKlvg7vvbQ=;
        b=UjfC869OMfp3R/FJMeKQcUPuDFgKeeZhJ/C0k8Dtep7EeklOcQDtbWxTo+wWOqN64G
         xDY3g0S0omCadIlwYrNZLmMfINPlWfxASumQuxfWdj1QuI9irFHGVjXbxVcfaQoOvZYB
         rvuajTOAj78QEXti4yqPn8i6VoRadGY8gMyCcnvIULWo5WHOaJw3E0X+f7mvKUyya3na
         SfVobfxp+SDx1tkiLqmGOAqVWHWucK7QlPeQKgTX1wIEApG0cB/QKkwGRNNgFsOYHRZg
         iPyb33gyo7LtC+/ZYQFUwXZWQXjxolyYuNsomEzvBirjM6FNOMniGsSm3JeTXeCj+x0A
         /7Ig==
X-Gm-Message-State: APjAAAXAcHa6nqeLutQZ3LHQv7LnY03AyOmqST0W2HDr5RvePNSAPnyX
	Rmb2Jv9Kk1EF63otAFnABrVDOpyhmBgBrqelENuOrIGC
X-Google-Smtp-Source: APXvYqySCUbdvELL8v0YCzLbJlmtHQNPecqJ3XF1wVcNLXQdgadSRLXga8fe4ExovbTJGbcoqzpbcaISj42ruktfArA=
X-Received: by 2002:aca:5cd7:: with SMTP id q206mr49047676oib.146.1564408372825;
 Mon, 29 Jul 2019 06:52:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190726175032.6769-1-richard.henderson@linaro.org> <20190726175032.6769-5-richard.henderson@linaro.org>
In-Reply-To: <20190726175032.6769-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Jul 2019 14:52:42 +0100
Message-ID: <CAFEAcA-W7idBRdD-DHxrVqfnBsKmAOPZoQAJkaUVOcjnLnGugw@mail.gmail.com>
Subject: Re: [PATCH 04/67] target/arm: Remove offset argument to gen_exception_internal_insn
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 0RqdKPFJ5Z8j

On Fri, 26 Jul 2019 at 18:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The actual argument is 0 for all callers.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 19b126d4f3..0848fb933a 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -1239,10 +1239,10 @@ static inline void gen_smc(DisasContext *s)
>      s->base.is_jmp = DISAS_SMC;
>  }
>
> -static void gen_exception_internal_insn(DisasContext *s, int offset, int excp)
> +static void gen_exception_internal_insn(DisasContext *s, int excp)
>  {
>      gen_set_condexec(s);
> -    gen_set_pc_im(s, s->pc - offset);
> +    gen_set_pc_im(s, s->pc);
>      gen_exception_internal(excp);
>      s->base.is_jmp = DISAS_NORETURN;
>  }
> @@ -1294,7 +1294,7 @@ static inline void gen_hlt(DisasContext *s, int imm)
>          s->current_el != 0 &&
>  #endif
>          (imm == (s->thumb ? 0x3c : 0xf000))) {
> -        gen_exception_internal_insn(s, 0, EXCP_SEMIHOST);
> +        gen_exception_internal_insn(s, EXCP_SEMIHOST);
>          return;
>      }
>
> @@ -11984,7 +11984,7 @@ static bool arm_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
>          /* End the TB early; it's likely not going to be executed */
>          dc->base.is_jmp = DISAS_TOO_MANY;
>      } else {
> -        gen_exception_internal_insn(dc, 0, EXCP_DEBUG);
> +        gen_exception_internal_insn(dc, EXCP_DEBUG);
>          /* The address covered by the breakpoint must be
>             included in [tb->pc, tb->pc + tb->size) in order
>             to for it to be properly cleared -- thus we
> --
> 2.17.1


I'm not so convinced about this one -- gen_exception_insn()
and gen_exception_internal_insn() shouldn't have the
same pattern of function prototype but different semantics
like this, it's confusing. It happens that both the cases
of wanting to generate an "internal" exception happen to want
it to be taken with the PC being for the following insn,
not the current one, but that seems more coincidence to
me than anything else.

thanks
-- PMM
