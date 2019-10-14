Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id q3sm17069429wru.33.2019.10.14.12.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 12:08:15 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 163181FF87;
	Mon, 14 Oct 2019 20:08:15 +0100 (BST)
References: <20191011155546.14342-1-richard.henderson@linaro.org>
 <20191011155546.14342-19-richard.henderson@linaro.org>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, laurent.desnogues@gmail.com,
 peter.maydell@linaro.org
Subject: Re: [PATCH v6 18/20] target/arm: Rebuild hflags at CPSR writes
In-reply-to: <20191011155546.14342-19-richard.henderson@linaro.org>
Date: Mon, 14 Oct 2019 20:08:15 +0100
Message-ID: <875zkrm9gg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: dz4NSpCETPgz


Richard Henderson <richard.henderson@linaro.org> writes:

> Continue setting, but not relying upon, env->hflags.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/op_helper.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
> index ccc2cecb46..b529d6c1bf 100644
> --- a/target/arm/op_helper.c
> +++ b/target/arm/op_helper.c
> @@ -224,6 +224,7 @@ uint32_t HELPER(usat16)(CPUARMState *env, uint32_t x,=
 uint32_t shift)
>  void HELPER(setend)(CPUARMState *env)
>  {
>      env->uncached_cpsr ^=3D CPSR_E;
> +    arm_rebuild_hflags(env);
>  }
>
>  /* Function checks whether WFx (WFI/WFE) instructions are set up to be t=
rapped.
> @@ -387,6 +388,8 @@ uint32_t HELPER(cpsr_read)(CPUARMState *env)
>  void HELPER(cpsr_write)(CPUARMState *env, uint32_t val, uint32_t mask)
>  {
>      cpsr_write(env, val, mask, CPSRWriteByInstr);
> +    /* TODO: Not all cpsr bits are relevant to hflags.  */

Do you mean by this we could check which bits changed and avoid a
re-compute if we wanted to? Is it likely to be anything other than the
SS_ACTIVE bit?

> +    arm_rebuild_hflags(env);
>  }
>
>  /* Write the CPSR for a 32-bit exception return */

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


--
Alex Benn=C3=A9e
