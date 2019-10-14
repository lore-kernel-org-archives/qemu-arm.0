Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id q10sm33888954wrd.39.2019.10.14.12.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 12:03:56 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 2FEEC1FF87;
	Mon, 14 Oct 2019 20:03:55 +0100 (BST)
References: <20191011155546.14342-1-richard.henderson@linaro.org>
 <20191011155546.14342-18-richard.henderson@linaro.org>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, laurent.desnogues@gmail.com,
 peter.maydell@linaro.org
Subject: Re: [PATCH v6 17/20] target/arm: Rebuild hflags at MSR writes
In-reply-to: <20191011155546.14342-18-richard.henderson@linaro.org>
Date: Mon, 14 Oct 2019 20:03:55 +0100
Message-ID: <877e57m9no.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: gKz/yWEEKlpB


Richard Henderson <richard.henderson@linaro.org> writes:

> Continue setting, but not relying upon, env->hflags.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/translate-a64.c | 13 +++++++++++--
>  target/arm/translate.c     | 28 +++++++++++++++++++++++-----
>  2 files changed, 34 insertions(+), 7 deletions(-)
>
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 2d6cd09634..d4bebbe629 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -1789,8 +1789,17 @@ static void handle_sys(DisasContext *s, uint32_t i=
nsn, bool isread,
>      if ((tb_cflags(s->base.tb) & CF_USE_ICOUNT) && (ri->type & ARM_CP_IO=
)) {
>          /* I/O operations must end the TB here (whether read or write) */
>          s->base.is_jmp =3D DISAS_UPDATE;
> -    } else if (!isread && !(ri->type & ARM_CP_SUPPRESS_TB_END)) {
> -        /* We default to ending the TB on a coprocessor register write,
> +    }
> +    if (!isread && !(ri->type & ARM_CP_SUPPRESS_TB_END)) {
> +        /*
> +         * A write to any coprocessor regiser that ends a TB
> +         * must rebuild the hflags for the next TB.
> +         */
> +        TCGv_i32 tcg_el =3D tcg_const_i32(s->current_el);
> +        gen_helper_rebuild_hflags_a64(cpu_env, tcg_el);
> +        tcg_temp_free_i32(tcg_el);
> +        /*
> +         * We default to ending the TB on a coprocessor register write,
>           * but allow this to be suppressed by the register definition
>           * (usually only necessary to work around guest bugs).
>           */
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 698c594e8c..cb47cd9744 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -6890,6 +6890,8 @@ static int disas_coproc_insn(DisasContext *s, uint3=
2_t insn)
>      ri =3D get_arm_cp_reginfo(s->cp_regs,
>              ENCODE_CP_REG(cpnum, is64, s->ns, crn, crm, opc1, opc2));
>      if (ri) {
> +        bool need_exit_tb;
> +
>          /* Check access permissions */
>          if (!cp_access_ok(s->current_el, ri, isread)) {
>              return 1;
> @@ -7068,14 +7070,30 @@ static int disas_coproc_insn(DisasContext *s, uin=
t32_t insn)
>              }
>          }
>
> -        if ((tb_cflags(s->base.tb) & CF_USE_ICOUNT) && (ri->type & ARM_C=
P_IO)) {
> -            /* I/O operations must end the TB here (whether read or writ=
e) */
> -            gen_lookup_tb(s);
> -        } else if (!isread && !(ri->type & ARM_CP_SUPPRESS_TB_END)) {
> -            /* We default to ending the TB on a coprocessor register wri=
te,
> +        /* I/O operations must end the TB here (whether read or write) */
> +        need_exit_tb =3D ((tb_cflags(s->base.tb) & CF_USE_ICOUNT) &&
> +                        (ri->type & ARM_CP_IO));
> +
> +        if (!isread && !(ri->type & ARM_CP_SUPPRESS_TB_END)) {
> +            /*
> +             * A write to any coprocessor regiser that ends a TB
> +             * must rebuild the hflags for the next TB.
> +             */
> +            TCGv_i32 tcg_el =3D tcg_const_i32(s->current_el);
> +            if (arm_dc_feature(s, ARM_FEATURE_M)) {
> +                gen_helper_rebuild_hflags_m32(cpu_env, tcg_el);
> +            } else {
> +                gen_helper_rebuild_hflags_a32(cpu_env, tcg_el);
> +            }
> +            tcg_temp_free_i32(tcg_el);
> +            /*
> +             * We default to ending the TB on a coprocessor register wri=
te,
>               * but allow this to be suppressed by the register definition
>               * (usually only necessary to work around guest bugs).
>               */
> +            need_exit_tb =3D true;
> +        }
> +        if (need_exit_tb) {
>              gen_lookup_tb(s);
>          }


--
Alex Benn=C3=A9e
