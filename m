Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id j31sm950224wre.67.2017.07.12.02.30.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jul 2017 02:30:26 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 6A7D93E01BB;
	Wed, 12 Jul 2017 10:30:25 +0100 (BST)
References: <149942760788.8972.474351671751194003.stgit@frigg.lan> <149943131289.8972.14899352517803578316.stgit@frigg.lan>
User-agent: mu4e 0.9.19; emacs 25.2.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Llu=C3=ADs?= Vilanova <vilanova@ac.upc.edu>
Cc: qemu-devel@nongnu.org, "Emilio G. Cota" <cota@braap.org>, Richard Henderson <rth@twiddle.net>, Peter Crosthwaite <crosthwaite.peter@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, "open list\:ARM" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v12 15/27] target/arm: [tcg,a64] Port to init_disas_context
In-reply-to: <149943131289.8972.14899352517803578316.stgit@frigg.lan>
Date: Wed, 12 Jul 2017 10:30:25 +0100
Message-ID: <871spm9f4e.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: vJCb/ibJrS0h


Lluís Vilanova <vilanova@ac.upc.edu> writes:

> Incrementally paves the way towards using the generic instruction translation
> loop.
>
> Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
> Reviewed-by: Richard Henderson <rth@twiddle.net>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

> ---
>  target/arm/translate-a64.c |   36 ++++++++++++++++++++++--------------
>  1 file changed, 22 insertions(+), 14 deletions(-)
>
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 4270ac3847..5c04ff3d8b 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -11190,21 +11190,12 @@ static void disas_a64_insn(CPUARMState *env, DisasContext *s)
>      free_tmp_a64(s);
>  }
>
> -void gen_intermediate_code_a64(DisasContextBase *dcbase, CPUState *cs,
> -                               TranslationBlock *tb)
> +static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
> +                                               CPUState *cpu)
>  {
> -    CPUARMState *env = cs->env_ptr;
> -    ARMCPU *cpu = arm_env_get_cpu(env);
>      DisasContext *dc = container_of(dcbase, DisasContext, base);
> -    target_ulong next_page_start;
> -    int max_insns;
> -
> -    dc->base.tb = tb;
> -    dc->base.pc_first = dc->base.tb->pc;
> -    dc->base.pc_next = dc->base.pc_first;
> -    dc->base.is_jmp = DISAS_NEXT;
> -    dc->base.num_insns = 0;
> -    dc->base.singlestep_enabled = cs->singlestep_enabled;
> +    CPUARMState *env = cpu->env_ptr;
> +    ARMCPU *arm_cpu = arm_env_get_cpu(env);
>
>      dc->pc = dc->base.pc_first;
>      dc->condjmp = 0;
> @@ -11230,7 +11221,7 @@ void gen_intermediate_code_a64(DisasContextBase *dcbase, CPUState *cs,
>      dc->fp_excp_el = ARM_TBFLAG_FPEXC_EL(dc->base.tb->flags);
>      dc->vec_len = 0;
>      dc->vec_stride = 0;
> -    dc->cp_regs = cpu->cp_regs;
> +    dc->cp_regs = arm_cpu->cp_regs;
>      dc->features = env->features;
>
>      /* Single step state. The code-generation logic here is:
> @@ -11254,6 +11245,23 @@ void gen_intermediate_code_a64(DisasContextBase *dcbase, CPUState *cs,
>      dc->ss_same_el = (arm_debug_target_el(env) == dc->current_el);
>
>      init_tmp_a64_array(dc);
> +}
> +
> +void gen_intermediate_code_a64(DisasContextBase *dcbase, CPUState *cs,
> +                               TranslationBlock *tb)
> +{
> +    CPUARMState *env = cs->env_ptr;
> +    DisasContext *dc = container_of(dcbase, DisasContext, base);
> +    target_ulong next_page_start;
> +    int max_insns;
> +
> +    dc->base.tb = tb;
> +    dc->base.pc_first = dc->base.tb->pc;
> +    dc->base.pc_next = dc->base.pc_first;
> +    dc->base.is_jmp = DISAS_NEXT;
> +    dc->base.num_insns = 0;
> +    dc->base.singlestep_enabled = cs->singlestep_enabled;
> +    aarch64_tr_init_disas_context(&dc->base, cs);
>
>      next_page_start = (dc->base.pc_first & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
>      max_insns = dc->base.tb->cflags & CF_COUNT_MASK;


--
Alex Bennée
