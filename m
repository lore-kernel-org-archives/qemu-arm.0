Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id h10sm1933779wme.30.2017.07.12.02.32.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jul 2017 02:32:35 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 47F323E01BB;
	Wed, 12 Jul 2017 10:32:35 +0100 (BST)
References: <149942760788.8972.474351671751194003.stgit@frigg.lan> <149943180765.8972.18399158340352150851.stgit@frigg.lan>
User-agent: mu4e 0.9.19; emacs 25.2.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Llu=C3=ADs?= Vilanova <vilanova@ac.upc.edu>
Cc: qemu-devel@nongnu.org, "Emilio G. Cota" <cota@braap.org>, Richard Henderson <rth@twiddle.net>, Peter Crosthwaite <crosthwaite.peter@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, "open list\:ARM" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v12 17/27] target/arm: [tcg] Port to insn_start
In-reply-to: <149943180765.8972.18399158340352150851.stgit@frigg.lan>
Date: Wed, 12 Jul 2017 10:32:35 +0100
Message-ID: <87y3ru80gc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: H8IIjU0/GbCf


Lluís Vilanova <vilanova@ac.upc.edu> writes:

> Incrementally paves the way towards using the generic instruction translation
> loop.
>
> Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
> Reviewed-by: Richard Henderson <rth@twiddle.net>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>


> ---
>  target/arm/translate.c |   36 +++++++++++++++++++++---------------
>  1 file changed, 21 insertions(+), 15 deletions(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 22af4e372a..7a1935d4d7 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -11896,6 +11896,26 @@ static void arm_tr_tb_start(DisasContextBase *dcbase, CPUState *cpu)
>      }
>  }
>
> +static void arm_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
> +{
> +    DisasContext *dc = container_of(dcbase, DisasContext, base);
> +
> +    dc->insn_start_idx = tcg_op_buf_count();
> +    tcg_gen_insn_start(dc->pc,
> +                       (dc->condexec_cond << 4) | (dc->condexec_mask >> 1),
> +                       0);
> +
> +#ifdef CONFIG_USER_ONLY
> +    /* Intercept jump to the magic kernel page.  */
> +    if (dc->pc >= 0xffff0000) {
> +        /* We always get here via a jump, so know we are not in a
> +           conditional execution block.  */
> +        gen_exception_internal(EXCP_KERNEL_TRAP);
> +        dc->base.is_jmp = DISAS_EXC;
> +    }
> +#endif
> +}
> +
>  /* generate intermediate code for basic block 'tb'.  */
>  void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
>  {
> @@ -11939,21 +11959,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
>
>      do {
>          dc->base.num_insns++;
> -        dc->insn_start_idx = tcg_op_buf_count();
> -        tcg_gen_insn_start(dc->pc,
> -                           (dc->condexec_cond << 4) | (dc->condexec_mask >> 1),
> -                           0);
> -
> -#ifdef CONFIG_USER_ONLY
> -        /* Intercept jump to the magic kernel page.  */
> -        if (dc->pc >= 0xffff0000) {
> -            /* We always get here via a jump, so know we are not in a
> -               conditional execution block.  */
> -            gen_exception_internal(EXCP_KERNEL_TRAP);
> -            dc->base.is_jmp = DISAS_EXC;
> -            break;
> -        }
> -#endif
> +        arm_tr_insn_start(&dc->base, cs);
>
>          if (unlikely(!QTAILQ_EMPTY(&cs->breakpoints))) {
>              CPUBreakpoint *bp;


--
Alex Bennée
