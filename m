Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72aaf6295csm431507566b.72.2024.07.02.08.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 08:58:36 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id C642E5F790;
	Tue,  2 Jul 2024 16:58:35 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org
Subject: Re: [PATCH] target/arm: Use cpu_env in cpu_untagged_addr
In-Reply-To: <20240702154911.1667418-1-richard.henderson@linaro.org> (Richard
	Henderson's message of "Tue, 2 Jul 2024 08:49:11 -0700")
References: <20240702154911.1667418-1-richard.henderson@linaro.org>
Date: Tue, 02 Jul 2024 16:58:35 +0100
Message-ID: <87ed8brdjo.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: rzB+EY1VP6G4

Richard Henderson <richard.henderson@linaro.org> writes:

> In a completely artifical memset benchmark object_dynamic_cast_assert
> dominates the profile, even above guest address resolution and
> the underlying host memset.

We seem to use ARM_CPU() quite liberally for a number of helpers so I
wonder if its worth codifying this anywhere? At least all the direct TCG
op helpers take CPUARMState *env directly.

>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index d8eb986a04..ccfb9349a3 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -3309,8 +3309,8 @@ extern const uint64_t pred_esz_masks[5];
>   */
>  static inline target_ulong cpu_untagged_addr(CPUState *cs, target_ulong =
x)
>  {
> -    ARMCPU *cpu =3D ARM_CPU(cs);
> -    if (cpu->env.tagged_addr_enable) {
> +    CPUARMState *env =3D cpu_env(cs);
> +    if (env->tagged_addr_enable) {
>          /*
>           * TBI is enabled for userspace but not kernelspace addresses.
>           * Only clear the tag if bit 55 is clear.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
