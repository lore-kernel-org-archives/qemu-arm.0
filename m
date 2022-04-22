Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id 20-20020a05600c22d400b0038c8dbdc1a3sm1703028wmg.38.2022.04.22.06.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 06:59:51 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id E151D1FFB7;
	Fri, 22 Apr 2022 14:59:50 +0100 (BST)
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-9-richard.henderson@linaro.org>
User-agent: mu4e 1.7.13; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v3 08/60] target/arm: Change DisasContext.thumb to bool
Date: Fri, 22 Apr 2022 14:59:19 +0100
In-reply-to: <20220417174426.711829-9-richard.henderson@linaro.org>
Message-ID: <875yn1uskp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Zw+5vtShLg2E


Richard Henderson <richard.henderson@linaro.org> writes:

> Bool is a more appropriate type for this value.
> Move the member down in the struct to keep the
> bool type members together and remove a hole.

Does gcc even attempt to pack bools? Aren't they basically int types?

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.h     | 2 +-
>  target/arm/translate-a64.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/translate.h b/target/arm/translate.h
> index 8b7dd1a4c0..050d80f6f9 100644
> --- a/target/arm/translate.h
> +++ b/target/arm/translate.h
> @@ -30,7 +30,6 @@ typedef struct DisasContext {
>      bool eci_handled;
>      /* TCG op to rewind to if this turns out to be an invalid ECI state =
*/
>      TCGOp *insn_eci_rewind;
> -    int thumb;
>      int sctlr_b;
>      MemOp be_data;
>  #if !defined(CONFIG_USER_ONLY)
> @@ -65,6 +64,7 @@ typedef struct DisasContext {
>      GHashTable *cp_regs;
>      uint64_t features; /* CPU features bits */
>      bool aarch64;
> +    bool thumb;
>      /* Because unallocated encodings generate different exception syndro=
me
>       * information from traps due to FP being disabled, we can't do a si=
ngle
>       * "is fp access disabled" check at a high level in the decode tree.
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 4dad23db48..be7283b966 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -14670,7 +14670,7 @@ static void aarch64_tr_init_disas_context(DisasCo=
ntextBase *dcbase,
>       */
>      dc->secure_routed_to_el3 =3D arm_feature(env, ARM_FEATURE_EL3) &&
>                                 !arm_el_is_aa64(env, 3);
> -    dc->thumb =3D 0;
> +    dc->thumb =3D false;
>      dc->sctlr_b =3D 0;
>      dc->be_data =3D EX_TBFLAG_ANY(tb_flags, BE_DATA) ? MO_BE : MO_LE;
>      dc->condexec_mask =3D 0;


--=20
Alex Benn=C3=A9e
