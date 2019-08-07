Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id h133sm96782343wme.28.2019.08.07.02.17.14
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 07 Aug 2019 02:17:14 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 2F5201FF87;
	Wed,  7 Aug 2019 10:17:14 +0100 (BST)
References: <20190805130952.4415-1-peter.maydell@linaro.org>
 <20190805130952.4415-2-peter.maydell@linaro.org>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
Subject: Re: [Qemu-arm] [PATCH 1/2] target/arm: Factor out 'generate
 singlestep exception' function
In-reply-to: <20190805130952.4415-2-peter.maydell@linaro.org>
Date: Wed, 07 Aug 2019 10:17:14 +0100
Message-ID: <87tvatibc5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: YqjslTAdhEY1


Peter Maydell <peter.maydell@linaro.org> writes:

> Factor out code to 'generate a singlestep exception', which is
> currently repeated in four places.
>
> To do this we need to also pull the identical copies of the
> gen-exception() function out of translate-a64.c and translate.c
> into translate.h.
>
> (There is a bug in the code: we're taking the exception to the wrong
> target EL.  This will be simpler to fix if there's only one place to
> do it.)
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/translate.h     | 23 +++++++++++++++++++++++
>  target/arm/translate-a64.c | 19 ++-----------------
>  target/arm/translate.c     | 20 ++------------------
>  3 files changed, 27 insertions(+), 35 deletions(-)
>
> diff --git a/target/arm/translate.h b/target/arm/translate.h
> index a20f6e20568..45053190baa 100644
> --- a/target/arm/translate.h
> +++ b/target/arm/translate.h
> @@ -2,6 +2,7 @@
>  #define TARGET_ARM_TRANSLATE_H
>
>  #include "exec/translator.h"
> +#include "internals.h"
>
>
>  /* internal defines */
> @@ -232,6 +233,28 @@ static inline void gen_ss_advance(DisasContext *s)
>      }
>  }
>
> +static inline void gen_exception(int excp, uint32_t syndrome,
> +                                 uint32_t target_el)
> +{
> +    TCGv_i32 tcg_excp =3D tcg_const_i32(excp);
> +    TCGv_i32 tcg_syn =3D tcg_const_i32(syndrome);
> +    TCGv_i32 tcg_el =3D tcg_const_i32(target_el);
> +
> +    gen_helper_exception_with_syndrome(cpu_env, tcg_excp,
> +                                       tcg_syn, tcg_el);
> +
> +    tcg_temp_free_i32(tcg_el);
> +    tcg_temp_free_i32(tcg_syn);
> +    tcg_temp_free_i32(tcg_excp);
> +}
> +
> +/* Generate an architectural singlestep exception */
> +static inline void gen_swstep_exception(DisasContext *s, int isv, int ex)
> +{
> +    gen_exception(EXCP_UDEF, syn_swstep(s->ss_same_el, isv, ex),
> +                  default_exception_el(s));
> +}
> +
>  /*
>   * Given a VFP floating point constant encoded into an 8 bit immediate i=
n an
>   * instruction, expand it to the actual constant value of the specified
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index d3231477a27..f6729b96fd0 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -253,19 +253,6 @@ static void gen_exception_internal(int excp)
>      tcg_temp_free_i32(tcg_excp);
>  }
>
> -static void gen_exception(int excp, uint32_t syndrome, uint32_t target_e=
l)
> -{
> -    TCGv_i32 tcg_excp =3D tcg_const_i32(excp);
> -    TCGv_i32 tcg_syn =3D tcg_const_i32(syndrome);
> -    TCGv_i32 tcg_el =3D tcg_const_i32(target_el);
> -
> -    gen_helper_exception_with_syndrome(cpu_env, tcg_excp,
> -                                       tcg_syn, tcg_el);
> -    tcg_temp_free_i32(tcg_el);
> -    tcg_temp_free_i32(tcg_syn);
> -    tcg_temp_free_i32(tcg_excp);
> -}
> -
>  static void gen_exception_internal_insn(DisasContext *s, int offset, int=
 excp)
>  {
>      gen_a64_set_pc_im(s->pc - offset);
> @@ -305,8 +292,7 @@ static void gen_step_complete_exception(DisasContext =
*s)
>       * of the exception, and our syndrome information is always correct.
>       */
>      gen_ss_advance(s);
> -    gen_exception(EXCP_UDEF, syn_swstep(s->ss_same_el, 1, s->is_ldex),
> -                  default_exception_el(s));
> +    gen_swstep_exception(s, 1, s->is_ldex);
>      s->base.is_jmp =3D DISAS_NORETURN;
>  }
>
> @@ -14261,8 +14247,7 @@ static void aarch64_tr_translate_insn(DisasContex=
tBase *dcbase, CPUState *cpu)
>           * bits should be zero.
>           */
>          assert(dc->base.num_insns =3D=3D 1);
> -        gen_exception(EXCP_UDEF, syn_swstep(dc->ss_same_el, 0, 0),
> -                      default_exception_el(dc));
> +        gen_swstep_exception(dc, 0, 0);
>          dc->base.is_jmp =3D DISAS_NORETURN;
>      } else {
>          disas_a64_insn(env, dc);
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 7853462b21b..19b9d8f2725 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -282,20 +282,6 @@ static void gen_exception_internal(int excp)
>      tcg_temp_free_i32(tcg_excp);
>  }
>
> -static void gen_exception(int excp, uint32_t syndrome, uint32_t target_e=
l)
> -{
> -    TCGv_i32 tcg_excp =3D tcg_const_i32(excp);
> -    TCGv_i32 tcg_syn =3D tcg_const_i32(syndrome);
> -    TCGv_i32 tcg_el =3D tcg_const_i32(target_el);
> -
> -    gen_helper_exception_with_syndrome(cpu_env, tcg_excp,
> -                                       tcg_syn, tcg_el);
> -
> -    tcg_temp_free_i32(tcg_el);
> -    tcg_temp_free_i32(tcg_syn);
> -    tcg_temp_free_i32(tcg_excp);
> -}
> -
>  static void gen_step_complete_exception(DisasContext *s)
>  {
>      /* We just completed step of an insn. Move from Active-not-pending
> @@ -308,8 +294,7 @@ static void gen_step_complete_exception(DisasContext =
*s)
>       * of the exception, and our syndrome information is always correct.
>       */
>      gen_ss_advance(s);
> -    gen_exception(EXCP_UDEF, syn_swstep(s->ss_same_el, 1, s->is_ldex),
> -                  default_exception_el(s));
> +    gen_swstep_exception(s, 1, s->is_ldex);
>      s->base.is_jmp =3D DISAS_NORETURN;
>  }
>
> @@ -12024,8 +12009,7 @@ static bool arm_pre_translate_insn(DisasContext *=
dc)
>           * bits should be zero.
>           */
>          assert(dc->base.num_insns =3D=3D 1);
> -        gen_exception(EXCP_UDEF, syn_swstep(dc->ss_same_el, 0, 0),
> -                      default_exception_el(dc));
> +        gen_swstep_exception(dc, 0, 0);
>          dc->base.is_jmp =3D DISAS_NORETURN;
>          return true;
>      }


--
Alex Benn=C3=A9e
