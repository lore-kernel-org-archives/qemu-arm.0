Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id n22sm12827903wmk.19.2019.10.14.09.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 09:17:40 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id DB39A1FF87;
	Mon, 14 Oct 2019 17:17:39 +0100 (BST)
References: <20191011155546.14342-1-richard.henderson@linaro.org>
 <20191011155546.14342-8-richard.henderson@linaro.org>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, laurent.desnogues@gmail.com,
 peter.maydell@linaro.org
Subject: Re: [PATCH v6 07/20] target/arm: Split out rebuild_hflags_a32
In-reply-to: <20191011155546.14342-8-richard.henderson@linaro.org>
Date: Mon, 14 Oct 2019 17:17:39 +0100
Message-ID: <87o8yjmhcs.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: p6Z3kfRJ38Kv


Richard Henderson <richard.henderson@linaro.org> writes:

> Currently a trivial wrapper for rebuild_hflags_common_32.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/helper.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 296a4b2232..d1cd54cc93 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -11106,6 +11106,12 @@ static uint32_t rebuild_hflags_m32(CPUARMState *=
env, int fp_el,
>      return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
>  }
>
> +static uint32_t rebuild_hflags_a32(CPUARMState *env, int fp_el,
> +                                   ARMMMUIdx mmu_idx)
> +{
> +    return rebuild_hflags_common_32(env, fp_el, mmu_idx, 0);
> +}
> +
>  static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
>                                     ARMMMUIdx mmu_idx)
>  {
> @@ -11218,7 +11224,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, targe=
t_ulong *pc,
>                  flags =3D FIELD_DP32(flags, TBFLAG_A32, LSPACT, 1);
>              }
>          } else {
> -            flags =3D rebuild_hflags_common_32(env, fp_el, mmu_idx, 0);
> +            flags =3D rebuild_hflags_a32(env, fp_el, mmu_idx);
>          }
>
>          flags =3D FIELD_DP32(flags, TBFLAG_A32, THUMB, env->thumb);


--
Alex Benn=C3=A9e
