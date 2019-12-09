Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id v22sm63170wml.11.2019.12.09.08.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 08:00:37 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 86D401FF87;
	Mon,  9 Dec 2019 16:00:36 +0000 (GMT)
References: <20191209134552.27733-1-philmd@redhat.com>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] target/arm: Display helpful message when hflags mismatch
In-reply-to: <20191209134552.27733-1-philmd@redhat.com>
Date: Mon, 09 Dec 2019 16:00:36 +0000
Message-ID: <87d0cx32vv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: B0f2tBzOMTi3


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Instead of crashing in a confuse way, give some hint to the user
> about why we aborted. He might report the issue without having
> to use a debugger.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  target/arm/helper.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 0bf8f53d4b..6bfb62672b 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -11348,6 +11348,20 @@ void HELPER(rebuild_hflags_a64)(CPUARMState *env=
, int el)
>      env->hflags =3D rebuild_hflags_a64(env, el, fp_el, mmu_idx);
>  }
>=20=20
> +static inline void assert_hflags_rebuild_correctly(CPUARMState *env)
> +{
> +#ifdef CONFIG_DEBUG_TCG
> +    uint32_t env_flags_current =3D env->hflags;
> +    uint32_t env_flags_rebuilt =3D rebuild_hflags_internal(env);
> +
> +    if (unlikely(env_flags_current !=3D env_flags_rebuilt)) {
> +        fprintf(stderr, "TCG hflags mismatch (current:0x%08x rebuilt:0x%=
08x)\n",
> +                env_flags_current, env_flags_rebuilt);
> +        abort();
> +    }
> +#endif
> +}
> +
>  void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
>                            target_ulong *cs_base, uint32_t *pflags)
>  {
> @@ -11355,9 +11369,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, targe=
t_ulong *pc,
>      uint32_t pstate_for_ss;
>=20=20
>      *cs_base =3D 0;
> -#ifdef CONFIG_DEBUG_TCG
> -    assert(flags =3D=3D rebuild_hflags_internal(env));
> -#endif
> +    assert_hflags_rebuild_correctly(env);

I'm trying to recall why we don't just use:

  g_assert_cmphex(flags, =3D, rebuild_hflags_internal(env))

I think it came up in one of the reviews.

>=20=20
>      if (FIELD_EX32(flags, TBFLAG_ANY, AARCH64_STATE)) {
>          *pc =3D env->pc;


--=20
Alex Benn=C3=A9e
