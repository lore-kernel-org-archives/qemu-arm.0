Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id l5sm2772172wmi.24.2019.03.13.09.13.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Mar 2019 09:13:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A9C611FF87;
	Wed, 13 Mar 2019 16:13:33 +0000 (UTC)
References: <1552488086-4025-1-git-send-email-amir.charif@cea.fr>
User-agent: mu4e 1.1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Amir Charif <amir.charif@cea.fr>
Subject: Re: [Qemu-arm] [PATCH] Re-evaluate SVE vector length everytime ADDVL is executed
In-reply-to: <1552488086-4025-1-git-send-email-amir.charif@cea.fr>
Date: Wed, 13 Mar 2019 16:13:33 +0000
Message-ID: <87y35i4us2.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: WYSZXKPvWfzX


Amir Charif <amir.charif@cea.fr> writes:

> In system emulation mode, the kernel may internally use 16-byte vectors.
> If this size is saved in the DisasContext before entering a userspace app
> that uses higher SVE sizes, the wrong size may be allocated on the stack
> resulting in corruption (segfaults in user space).
> This fix evaluates the vector size at runtime (as opposed to
> translation time)

This implies we have missed recalculating the vector size on a mode
transition. We want to ensure that the flags setting of TBFLAG_A64,
ZCR_LEN is consistent. Is sve_zcr_len_for_el() getting it wrong?

> to always allocate the correct size on the stack (when ADDVL is used).
>
> Signed-off-by: Amir Charif <amir.charif@cea.fr>
> ---
>  target/arm/translate-a64.c | 17 +++++++++++++++++
>  target/arm/translate-a64.h |  1 +
>  target/arm/translate-sve.c |  7 +++++--
>  3 files changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 1959046..e431f1e 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -45,6 +45,9 @@ static TCGv_i64 cpu_pc;
>  /* Load/store exclusive handling */
>  static TCGv_i64 cpu_exclusive_high;
>
> +/* Current value of the zcr_el[1] register */
> +static TCGv_i64 cpu_zcr_el1;
> +
>  static const char *regnames[] =3D {
>      "x0", "x1", "x2", "x3", "x4", "x5", "x6", "x7",
>      "x8", "x9", "x10", "x11", "x12", "x13", "x14", "x15",
> @@ -103,6 +106,9 @@ void a64_translate_init(void)
>
>      cpu_exclusive_high =3D tcg_global_mem_new_i64(cpu_env,
>          offsetof(CPUARMState, exclusive_high), "exclusive_high");
> +
> +    cpu_zcr_el1 =3D tcg_global_mem_new_i64(cpu_env,
> +        offsetof(CPUARMState, vfp.zcr_el[1]), "zcr_el1");
>  }
>
>  static inline int get_a64_user_mem_index(DisasContext *s)
> @@ -578,6 +584,17 @@ TCGv_i64 read_cpu_reg_sp(DisasContext *s, int reg, i=
nt sf)
>      return v;
>  }
>
> +/* Get a temporary register containing the current vector length */
> +TCGv_i64 get_cpu_vec_len(DisasContext *s)
> +{
> +    TCGv_i64 v =3D new_tmp_a64(s);
> +    tcg_gen_mov_i64(v, cpu_zcr_el1);
> +    tcg_gen_andi_i64(v, v, 0xf);
> +    tcg_gen_addi_i64(v, v, 1);
> +    tcg_gen_muli_i64(v, v, 16);
> +    return v;
> +}
> +
>  /* Return the offset into CPUARMState of a slice (from
>   * the least significant end) of FP register Qn (ie
>   * Dn, Sn, Hn or Bn).
> diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
> index 63d958c..fcfbc90 100644
> --- a/target/arm/translate-a64.h
> +++ b/target/arm/translate-a64.h
> @@ -35,6 +35,7 @@ TCGv_i64 cpu_reg(DisasContext *s, int reg);
>  TCGv_i64 cpu_reg_sp(DisasContext *s, int reg);
>  TCGv_i64 read_cpu_reg(DisasContext *s, int reg, int sf);
>  TCGv_i64 read_cpu_reg_sp(DisasContext *s, int reg, int sf);
> +TCGv_i64 get_cpu_vec_len(DisasContext *s);
>  void write_fp_dreg(DisasContext *s, int reg, TCGv_i64 v);
>  TCGv_ptr get_fpstatus_ptr(bool);
>  bool logic_imm_decode_wmask(uint64_t *result, unsigned int immn,
> diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
> index 3a2eb51..d5ad88b 100644
> --- a/target/arm/translate-sve.c
> +++ b/target/arm/translate-sve.c
> @@ -945,7 +945,9 @@ static bool trans_ADDVL(DisasContext *s, arg_ADDVL *a)
>  {
>      TCGv_i64 rd =3D cpu_reg_sp(s, a->rd);
>      TCGv_i64 rn =3D cpu_reg_sp(s, a->rn);
> -    tcg_gen_addi_i64(rd, rn, a->imm * vec_full_reg_size(s));
> +    TCGv_i64 ln =3D get_cpu_vec_len(s);
> +    tcg_gen_muli_i64(ln, ln, a->imm);
> +    tcg_gen_add_i64(rd, rn, ln);
>      return true;
>  }
>
> @@ -960,7 +962,8 @@ static bool trans_ADDPL(DisasContext *s, arg_ADDPL *a)
>  static bool trans_RDVL(DisasContext *s, arg_RDVL *a)
>  {
>      TCGv_i64 reg =3D cpu_reg(s, a->rd);
> -    tcg_gen_movi_i64(reg, a->imm * vec_full_reg_size(s));
> +    TCGv_i64 ln =3D get_cpu_vec_len(s);
> +    tcg_gen_muli_i64(reg, ln, a->imm);
>      return true;
>  }


--
Alex Benn=C3=A9e
