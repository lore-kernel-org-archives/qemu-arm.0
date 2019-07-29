Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3178467wrv;
        Mon, 29 Jul 2019 06:50:31 -0700 (PDT)
X-Received: by 2002:a9d:70d3:: with SMTP id w19mr18404028otj.208.1564408231664;
        Mon, 29 Jul 2019 06:50:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564408231; cv=none;
        d=google.com; s=arc-20160816;
        b=eyo3QO/j99vTYef9qgK7p/sfeP1FwYwcVVvFWUrNcvJBCw5KLj4vv+EdCLZR8jEWn+
         bVcuGaO3jqnOvaNq5yL59KcFOqIbu5PN4AaoyKwRXDOC8q2DcqSNeyxq42cxc6xDkQnA
         oRi6PVSwyy3aQtI492YdjvVkVZy+qDEQyggYJlfQF2lzNarCx861P4xOs0l6v4dGa4Fr
         cuWq1Z1CcmjGVYQjuY4YZ7tpsFiLcgxWL/NiowW2JalCAxtXBu6dnzClYRdpcK2TElOi
         pwxUwMbTlqZ7Wx2+7XpkiTPzQV2iVGuUQ25l6i/5t9sZhXjC48x2/+AsHCOdvaVkE+Yh
         4jng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=u9E9kzr6fZRxsNz5JxBpfqg9DVltmbmfiigEisB9a7Q=;
        b=bs/E3+CwmFwhIftFyHdEEnhsHCGCbInn2QGdBMUN0hA+08Bm3iVlWRZlARphfTBDjR
         dhMCW+jE149qYFa7GIF55WmVZi3HG27hk8162zSeWnBS98/cSUp64hvnMHVejwV8o9xx
         QCpomr9glGW5u7GtmtCNUh+J15IfGthyH9zjo+pPYjW32HHHasuqaVzs/Eyvl8RFBA1M
         8H8VNc+pvsfXYNhiODYb+dB1MDMOqzWvVqJ4wy/iaLJ/UegOUSjzz/0IuoNyRowpubzn
         BWdXrAnebnEXIfzV9hHYO+ltMdSQFaWVmAS6CT95NFIECh6UgT5ack17E6VJv2Sybjuq
         tW6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pYcrDjPI;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y27sor26924565ote.102.2019.07.29.06.50.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 29 Jul 2019 06:50:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pYcrDjPI;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u9E9kzr6fZRxsNz5JxBpfqg9DVltmbmfiigEisB9a7Q=;
        b=pYcrDjPIVFKkmYAo0NxgkKanf6B65kN2mio7KyZ+zoe9es81Wt4dGKFWuVDwBdpWqD
         40u9mcSFEhvMxbebwd+G9UijPWHDHMaJcAEVMkYD4KjCWVWyvS/muuJLauI7NoRNSyDp
         Cr0XXDPuEvn1KTl/pf4L1GDT4UAQKqLkpB2BrZFtezPiEbOPhiFfbDfTzhiNZA9sqJWX
         XHyyq8GD0X8N0aumB7TNfTnTjZ9Xxj53uQ7i7s3ajGS4A9SBp7O55RvPH3altfIXKNQT
         T6KucaOy9qW3nEsW+DfNXUXnpRcWfBbdbziF8jkwS9zHbhzm+gkZ+GjR5sRxvQk9ug6k
         3Ybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u9E9kzr6fZRxsNz5JxBpfqg9DVltmbmfiigEisB9a7Q=;
        b=NMNEPhtYApURirIejz8w0tyL9CZ/fdeI3tnGNLCBbecC86zW9QODBrCovXoMYfKN+E
         qdRRFmoAh6q8LC6WtllCAl91jUdg/SzRTPON8FlV1H9EZOpBufAfw1XCsWUhZs3FTXpZ
         2uD9q1gNEaDmAS8gbaiKRYJ5M4lZ/1YDvLAf+nqQoGnsTBM15kN6WZNuNIN24+GVttlG
         y/ZXF78iiIkOtgdujVxcZ/LMZ2xQdkHhvrOFbEvNt2GGOa7uxOFvn+xglHjA/8FvpJdw
         Xi5hkuiGXea4b2ArcO82DsFYMBHXJTpTtclKa5dj6SXU4YjLIWtupERT6XAdErBP1LVS
         qOSw==
X-Gm-Message-State: APjAAAX0GRRUWLA1CVwScCPRPaI0ZmmWqCGzAb7yX4z3gIOdbt6GOsRM
	vMPlh3TSYJypnwrZ0zYggCye4QkK52ZTY/XVXcwvxJby
X-Google-Smtp-Source: APXvYqy5cJvQt7tbenOcDqjCT+saQIbjmoA5EVIcXLzHCDAji2un0WbhJuUmG0SYL96i0BL+LBe8r5w1RCuZMME1LsA=
X-Received: by 2002:a05:6830:1653:: with SMTP id h19mr26899294otr.232.1564408231320;
 Mon, 29 Jul 2019 06:50:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190726175032.6769-1-richard.henderson@linaro.org> <20190726175032.6769-4-richard.henderson@linaro.org>
In-Reply-To: <20190726175032.6769-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Jul 2019 14:50:20 +0100
Message-ID: <CAFEAcA-RCm7zqtYz=kJrfvySvv8TBkej+mu4h8+oR26AYZ3DNw@mail.gmail.com>
Subject: Re: [PATCH 03/67] target/arm: Remove offset argument to gen_exception_bkpt_insn
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: Gg95jhSjoHmH

On Fri, 26 Jul 2019 at 18:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The address of the current insn is still available in s->base.pc_next.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 33f78296eb..19b126d4f3 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -1256,12 +1256,12 @@ static void gen_exception_insn(DisasContext *s, int excp, int syn,
>      s->base.is_jmp = DISAS_NORETURN;
>  }
>
> -static void gen_exception_bkpt_insn(DisasContext *s, int offset, uint32_t syn)
> +static void gen_exception_bkpt_insn(DisasContext *s, uint32_t syn)
>  {
>      TCGv_i32 tcg_syn;
>
>      gen_set_condexec(s);
> -    gen_set_pc_im(s, s->pc - offset);
> +    gen_set_pc_im(s, s->base.pc_next);
>      tcg_syn = tcg_const_i32(syn);
>      gen_helper_exception_bkpt_insn(cpu_env, tcg_syn);
>      tcg_temp_free_i32(tcg_syn);
> @@ -8139,7 +8139,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
>              case 1:
>                  /* bkpt */
>                  ARCH(5);
> -                gen_exception_bkpt_insn(s, 4, syn_aa32_bkpt(imm16, false));
> +                gen_exception_bkpt_insn(s, syn_aa32_bkpt(imm16, false));
>                  break;
>              case 2:
>                  /* Hypervisor call (v7) */
> @@ -11611,7 +11611,7 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
>          {
>              int imm8 = extract32(insn, 0, 8);
>              ARCH(5);
> -            gen_exception_bkpt_insn(s, 2, syn_aa32_bkpt(imm8, true));
> +            gen_exception_bkpt_insn(s, syn_aa32_bkpt(imm8, true));
>              break;
>          }

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
