Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp229805wrv;
        Fri, 26 Jul 2019 11:13:28 -0700 (PDT)
X-Received: by 2002:a9d:4b8d:: with SMTP id k13mr17151956otf.61.1564164808228;
        Fri, 26 Jul 2019 11:13:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564164808; cv=none;
        d=google.com; s=arc-20160816;
        b=xnoN7QL5yRn5wursUUlpn8/fpmPS9paEwvqe4zLDGVfaFj923NTkgdpN4gsgDpJZ6w
         h5bCq5jDjIhlFb/3OP982K8sjY5XdSaUt4QXYj0JnQDYPJc8gx0Z0fBffO+3l1I7pgdK
         LeLjpnjjbgmXcSmDNb2ceiZoI6EnNOu8EioRpHlgTjQJLYaf8TD347Dm52vMSrIyPWMQ
         +rhqcbgLz2fFDBqCmj1J/HtnlXkPN8mkRtksfOW9bNB4aRd+/BSOBGGHFsJFZUu20mOf
         46ynM3rdg6ge7DzZ/kWtTzEZP+9XstJOxFO0adh+gPFtMrNbRMGQwWIBZHHfAQPtXdDa
         npKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cB5O7qLZbi7AU1GJPd1XmkLwCN14JF69T6pjBdSiZPc=;
        b=hql97L26pNOCUySEEz3OzSEflrQTnbhj0VLyECgf2w83BCKQNWpGnqdoXQFLeq2FM5
         Q/L76eDi0X25JZB7BWeGJzjyQLBtPE9KzrPD3fYSoszxQS/2Q/tR5eTDLMVQQ7NLWWSa
         RwGnKox0l+IoXSVur2QgqVGHn5sBAbCcVppiradXsnB+176Li5KTZCW64pKiY8+ll0Xp
         o224arw/p1+mD6arQtiHOpUINPs6ucJj2OIe7nP7n0oW+YbZzSvnMDm+zNZ0xrj8lQn3
         NCeBUyBp+QAhd+EgMDeBFiq547m1iWN2z1ujhMkdGasexmmlLkxcKiaG3swzLyrFUku9
         /1XQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eMeab0+N;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y64sor23562502oig.106.2019.07.26.11.13.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 11:13:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eMeab0+N;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cB5O7qLZbi7AU1GJPd1XmkLwCN14JF69T6pjBdSiZPc=;
        b=eMeab0+NWmNXAhFgUk8XVALNy+5YcQqpcnBmYQ+i5c3exvgnchG/ene4YaB3q3zrlm
         lm8ZYkWzwb8zQUaoz/tKO7pKtLiK2uO9oivxkzVlb/g7pROZU5BDlf/Nt1cBU1pwhhyi
         DJwJB3WInOEBv3d8XipwTjVGdBZacCmifC68RmmRjqKOZtqcIddBwaYwusrWo4thptsn
         8y2/MbVB/ZEUn9T2meF2pDVPtPudPaiCfqll8ymQPI/dLMV3AODwqvGSjVI0MlvkEJ9v
         ScWZpN8eoi6p5+LPsRDKdUeEqwOq99Ymk/zRbtnoX1xsWZUt0UcZfL42fLtXuSsAF0zL
         1+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cB5O7qLZbi7AU1GJPd1XmkLwCN14JF69T6pjBdSiZPc=;
        b=Mn61fo9TXaHPjoCPkU9x7WYxdjw+Uswlg/S9KQ8bWFNSMbAtwXjd0F4sQgd2Fp1Cp/
         9/k3XFFdNdWqqmGorLh4bDj+FMP08Gakxs54EflHuUncPy13vkskfVrBhSP8IX3J8/jc
         ie/RzfaR2s3S/uDbWhl27/KMvVlSWkck+NbX6jyboEc55nZrtvgSYvnzc7fWwMroehnG
         ap1x2Dhtig/7cHK6eeBtFmlgBYWhgIQMQw97tdmLK0T0AcRu6ojBq+saRZ/LXIWAUNma
         PnqpgO0lW5d85BPfz6TKO/rV1itPSCQLYD35OmMCHR++iI4+2HoCYQ993l1Gp3+zkga5
         +eyQ==
X-Gm-Message-State: APjAAAXlpCii9oU9EBOa3uKL9vQuO1KUe2ycEHkT0HmaoCLCkfRYxj0L
	AtU7o6IN8HpO0m1V1J85mvwFRtSDsh092uNjuvyuEzFf
X-Google-Smtp-Source: APXvYqwX64ULsHl7H8q2Mn7iWh3WA9YJOpFhKMufQyhTrN3wzqHRpYxqmrU42YSHam0ZSYUTnKtNHPkhUrk/yI6FTZo=
X-Received: by 2002:a05:6808:8c2:: with SMTP id k2mr45720050oij.98.1564164807738;
 Fri, 26 Jul 2019 11:13:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190726175032.6769-1-richard.henderson@linaro.org> <20190726175032.6769-67-richard.henderson@linaro.org>
In-Reply-To: <20190726175032.6769-67-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jul 2019 19:13:16 +0100
Message-ID: <CAFEAcA9s44Lc58X=C1DzPRRCyi_KOpx0CiMfhKWEzAdDoU326A@mail.gmail.com>
Subject: Re: [PATCH 66/67] target/arm: Move singlestep check from gen_jmp to gen_goto_tb
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: xUKBjEIyVSJT

On Fri, 26 Jul 2019 at 18:51, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We miss quite a number of single-step events by having
> the check in the wrong place.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index c2b8b86fd2..9ae9b23823 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -2740,7 +2740,10 @@ static void gen_goto_ptr(void)
>   */
>  static void gen_goto_tb(DisasContext *s, int n, target_ulong dest)
>  {
> -    if (use_goto_tb(s, dest)) {
> +    if (unlikely(is_singlestepping(s))) {
> +        gen_set_pc_im(s, dest);
> +        gen_singlestep_exception(s);
> +    } else if (use_goto_tb(s, dest)) {
>          tcg_gen_goto_tb(n);
>          gen_set_pc_im(s, dest);
>          tcg_gen_exit_tb(s->base.tb, n);
> @@ -2751,16 +2754,9 @@ static void gen_goto_tb(DisasContext *s, int n, target_ulong dest)
>      s->base.is_jmp = DISAS_NORETURN;
>  }
>
> -static inline void gen_jmp (DisasContext *s, uint32_t dest)
> +static inline void gen_jmp(DisasContext *s, uint32_t dest)
>  {
> -    if (unlikely(is_singlestepping(s))) {
> -        /* An indirect jump so that we still trigger the debug exception.  */
> -        if (s->thumb)
> -            dest |= 1;
> -        gen_bx_im(s, dest);
> -    } else {
> -        gen_goto_tb(s, 0, dest);
> -    }
> +    gen_goto_tb(s, 0, dest);
>  }
>
>  static inline void gen_mulxy(TCGv_i32 t0, TCGv_i32 t1, int x, int y)

I haven't tested but I'm not sure this change is right.
The idea of the current code is that we handle generating
the actual singlestep exception in arm_tr_tb_stop() at the
end, rather than in the process of generating code for the
insn. This change means we now do a gen_singlestep_exception()
in the gen_jmp()/gen_goto_tb() part of the code, but we haven't
removed the handling of it in arm_tr_tb_stop(), so we're now
doing this in two places. Why doesn't the current design work?
And if we need to do something different for the route to
"change the PC via gen_jmp()" why don't we need to do it
also when we change the PC via eg gen_bx_im() ?

(Incidentally, the only places other than gen_jmp()
which call gen_goto_tb() are:
 * the end-of-TB handling of DISAS_NEXT/DISAS_TOO_MANY
 * four places for barrier insns where we use a
   gen_goto_tb to end the TB -- this isn't consistent
   with how we end the TB for other situations...)

thanks
-- PMM
