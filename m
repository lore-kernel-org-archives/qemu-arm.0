Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id t25sm1710845wmj.29.2019.09.05.06.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2019 06:53:06 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 595631FF87;
	Thu,  5 Sep 2019 14:53:05 +0100 (BST)
References: <20190820210720.18976-1-richard.henderson@linaro.org>
 <20190820210720.18976-17-richard.henderson@linaro.org>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [Qemu-devel] [PATCH v5 16/17] target/arm: Rebuild hflags at EL
 changes and MSR writes
In-reply-to: <20190820210720.18976-17-richard.henderson@linaro.org>
Date: Thu, 05 Sep 2019 14:53:05 +0100
Message-ID: <87a7bi97em.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 3FhoLQVGXuTj


Richard Henderson <richard.henderson@linaro.org> writes:

> Now setting, but not relying upon, env->hflags.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/syscall.c       |  1 +
>  target/arm/cpu.c           |  1 +
>  target/arm/helper-a64.c    |  3 +++
>  target/arm/helper.c        |  2 ++
>  target/arm/machine.c       |  1 +
>  target/arm/op_helper.c     |  1 +
>  target/arm/translate-a64.c |  6 +++++-
>  target/arm/translate.c     | 18 ++++++++++++++++--
>  8 files changed, 30 insertions(+), 3 deletions(-)
>
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 8b41a03901..be01c33759 100644
<snip>

I had to manually fix these up due to the patch failing to apply. I
think because 9e9b10c64911 removes the gen_io_end() calls.

> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index fc3e5f5c38..4412c60383 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -1777,11 +1777,15 @@ static void handle_sys(DisasContext *s, uint32_t =
insn, bool isread,
>          /* I/O operations must end the TB here (whether read or write) */
>          gen_io_end();
>          s->base.is_jmp =3D DISAS_UPDATE;
> -    } else if (!isread && !(ri->type & ARM_CP_SUPPRESS_TB_END)) {
> +    }
> +    if (!isread && !(ri->type & ARM_CP_SUPPRESS_TB_END)) {
>          /* We default to ending the TB on a coprocessor register write,
>           * but allow this to be suppressed by the register definition
>           * (usually only necessary to work around guest bugs).
>           */
> +        TCGv_i32 tcg_el =3D tcg_const_i32(s->current_el);
> +        gen_helper_rebuild_hflags_a64(cpu_env, tcg_el);
> +        tcg_temp_free_i32(tcg_el);
>          s->base.is_jmp =3D DISAS_UPDATE;
>      }
>  }
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index d948757131..2f7beca065 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -7130,6 +7130,8 @@ static int disas_coproc_insn(DisasContext *s, uint3=
2_t insn)
>      ri =3D get_arm_cp_reginfo(s->cp_regs,
>              ENCODE_CP_REG(cpnum, is64, s->ns, crn, crm, opc1, opc2));
>      if (ri) {
> +        bool need_exit_tb;
> +
>          /* Check access permissions */
>          if (!cp_access_ok(s->current_el, ri, isread)) {
>              return 1;
> @@ -7301,15 +7303,27 @@ static int disas_coproc_insn(DisasContext *s, uin=
t32_t insn)
>              }
>          }
>
> +        need_exit_tb =3D false;
>          if ((tb_cflags(s->base.tb) & CF_USE_ICOUNT) && (ri->type & ARM_C=
P_IO)) {
>              /* I/O operations must end the TB here (whether read or writ=
e) */
>              gen_io_end();
> -            gen_lookup_tb(s);
> -        } else if (!isread && !(ri->type & ARM_CP_SUPPRESS_TB_END)) {
> +            need_exit_tb =3D true;
> +        }
> +        if (!isread && !(ri->type & ARM_CP_SUPPRESS_TB_END)) {
>              /* We default to ending the TB on a coprocessor register wri=
te,
>               * but allow this to be suppressed by the register definition
>               * (usually only necessary to work around guest bugs).
>               */
> +            TCGv_i32 tcg_el =3D tcg_const_i32(s->current_el);
> +            if (arm_dc_feature(s, ARM_FEATURE_M)) {
> +                gen_helper_rebuild_hflags_m32(cpu_env, tcg_el);
> +            } else {
> +                gen_helper_rebuild_hflags_a32(cpu_env, tcg_el);
> +            }
> +            tcg_temp_free_i32(tcg_el);
> +            need_exit_tb =3D true;
> +        }
> +        if (need_exit_tb) {
>              gen_lookup_tb(s);
>          }


--
Alex Benn=C3=A9e
