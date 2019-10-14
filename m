Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id d193sm33594091wmd.0.2019.10.14.12.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 12:08:41 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 46CFC1FF87;
	Mon, 14 Oct 2019 20:08:41 +0100 (BST)
References: <20191011155546.14342-1-richard.henderson@linaro.org>
 <20191011155546.14342-20-richard.henderson@linaro.org>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent.desnogues@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v6 19/20] target/arm: Rebuild hflags for M-profile.
In-reply-to: <20191011155546.14342-20-richard.henderson@linaro.org>
Date: Mon, 14 Oct 2019 20:08:41 +0100
Message-ID: <874l0bm9fq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: eDPYxWY4Gqcu


Richard Henderson <richard.henderson@linaro.org> writes:

> Continue setting, but not relying upon, env->hflags.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/m_helper.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
> index 27cd2f3f96..f2512e448e 100644
> --- a/target/arm/m_helper.c
> +++ b/target/arm/m_helper.c
> @@ -494,6 +494,7 @@ void HELPER(v7m_bxns)(CPUARMState *env, uint32_t dest)
>      switch_v7m_security_state(env, dest & 1);
>      env->thumb =3D 1;
>      env->regs[15] =3D dest & ~1;
> +    arm_rebuild_hflags(env);
>  }
>
>  void HELPER(v7m_blxns)(CPUARMState *env, uint32_t dest)
> @@ -555,6 +556,7 @@ void HELPER(v7m_blxns)(CPUARMState *env, uint32_t des=
t)
>      switch_v7m_security_state(env, 0);
>      env->thumb =3D 1;
>      env->regs[15] =3D dest;
> +    arm_rebuild_hflags(env);
>  }
>
>  static uint32_t *get_v7m_sp_ptr(CPUARMState *env, bool secure, bool thre=
admode,
> @@ -895,6 +897,7 @@ static void v7m_exception_taken(ARMCPU *cpu, uint32_t=
 lr, bool dotailchain,
>      env->regs[14] =3D lr;
>      env->regs[15] =3D addr & 0xfffffffe;
>      env->thumb =3D addr & 1;
> +    arm_rebuild_hflags(env);
>  }
>
>  static void v7m_update_fpccr(CPUARMState *env, uint32_t frameptr,
> @@ -1765,6 +1768,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
>
>      /* Otherwise, we have a successful exception exit. */
>      arm_clear_exclusive(env);
> +    arm_rebuild_hflags(env);
>      qemu_log_mask(CPU_LOG_INT, "...successful exception return\n");
>  }
>
> @@ -1837,6 +1841,7 @@ static bool do_v7m_function_return(ARMCPU *cpu)
>      xpsr_write(env, 0, XPSR_IT);
>      env->thumb =3D newpc & 1;
>      env->regs[15] =3D newpc & ~1;
> +    arm_rebuild_hflags(env);
>
>      qemu_log_mask(CPU_LOG_INT, "...function return successful\n");
>      return true;
> @@ -1959,6 +1964,7 @@ static bool v7m_handle_execute_nsc(ARMCPU *cpu)
>      switch_v7m_security_state(env, true);
>      xpsr_write(env, 0, XPSR_IT);
>      env->regs[15] +=3D 4;
> +    arm_rebuild_hflags(env);
>      return true;
>
>  gen_invep:


--
Alex Benn=C3=A9e
