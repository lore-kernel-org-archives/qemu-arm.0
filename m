Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id r142sm12996796wmg.24.2017.06.26.04.30.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Jun 2017 04:30:35 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 529863E0141;
	Mon, 26 Jun 2017 12:31:26 +0100 (BST)
References: <149838022308.6497.2104916050645246693.stgit@frigg.lan> <149838531005.6497.12362377034456580175.stgit@frigg.lan>
User-agent: mu4e 0.9.19; emacs 25.2.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Llu=C3=ADs?= Vilanova <vilanova@ac.upc.edu>
Cc: qemu-devel@nongnu.org, Richard Henderson <rth@twiddle.net>, Peter Crosthwaite <crosthwaite.peter@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, "open list\:ARM" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v9 21/26] target: [tcg,arm] Port to insn_start
In-reply-to: <149838531005.6497.12362377034456580175.stgit@frigg.lan>
Date: Mon, 26 Jun 2017 12:31:26 +0100
Message-ID: <87d19rx9wx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: 1fbg22C9oWxO


Lluís Vilanova <vilanova@ac.upc.edu> writes:

> Incrementally paves the way towards using the generic instruction translation
> loop.
>
> Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
> ---
>  target/arm/translate-a64.c |   11 +++++++++--
>  target/arm/translate.c     |   36 +++++++++++++++++++++---------------
>  2 files changed, 30 insertions(+), 17 deletions(-)
>
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 1959f27377..bfc2cdabb5 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -11259,6 +11259,14 @@ static void aarch64_trblock_init_disas_context(DisasContextBase *db,
>      init_tmp_a64_array(dc);
>  }
>
> +static void aarch64_trblock_insn_start(DisasContextBase *db, CPUState *cpu)
> +{
> +    DisasContext *dc = container_of(db, DisasContext, base);
> +
> +    dc->insn_start_idx = tcg_op_buf_count();
> +    tcg_gen_insn_start(dc->pc, 0, 0);
> +}
> +
>  void gen_intermediate_code_a64(DisasContextBase *db, ARMCPU *cpu,
>                                 TranslationBlock *tb)
>  {
> @@ -11291,8 +11299,7 @@ void gen_intermediate_code_a64(DisasContextBase *db, ARMCPU *cpu,
>
>      do {
>          db->num_insns++;
> -        dc->insn_start_idx = tcg_op_buf_count();
> -        tcg_gen_insn_start(dc->pc, 0, 0);
> +        aarch64_trblock_insn_start(db, cs);
>
>          if (unlikely(!QTAILQ_EMPTY(&cs->breakpoints))) {
>              CPUBreakpoint *bp;
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index ae3f772446..18b0e8fbb6 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -11934,6 +11934,26 @@ static void arm_trblock_tb_start(DisasContextBase *db, CPUState *cpu)
>      }
>  }
>
> +static void arm_trblock_insn_start(DisasContextBase *db, CPUState *cpu)
> +{
> +    DisasContext *dc = container_of(db, DisasContext, base);
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
> +        dc->is_jmp = DJ_EXC;

This fails to build.

> +    }
> +#endif
> +}
> +
>  /* generate intermediate code for basic block 'tb'.  */
>  void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
>  {
> @@ -11981,21 +12001,7 @@ void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
>
>      do {
>          db->num_insns++;
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
> -            dc->is_jmp = DJ_EXC;
> -            break;
> -        }
> -#endif
> +        arm_trblock_insn_start(db, cpu);
>
>          if (unlikely(!QTAILQ_EMPTY(&cpu->breakpoints))) {
>              CPUBreakpoint *bp;


--
Alex Bennée
