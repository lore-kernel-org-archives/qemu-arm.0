Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id n1sm24149211wrg.67.2019.10.14.12.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 12:01:40 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 665F01FF87;
	Mon, 14 Oct 2019 20:01:39 +0100 (BST)
References: <20191011155546.14342-1-richard.henderson@linaro.org>
 <20191011155546.14342-17-richard.henderson@linaro.org>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, laurent.desnogues@gmail.com,
 peter.maydell@linaro.org
Subject: Re: [PATCH v6 16/20] target/arm: Rebuild hflags at EL changes
In-reply-to: <20191011155546.14342-17-richard.henderson@linaro.org>
Date: Mon, 14 Oct 2019 20:01:39 +0100
Message-ID: <878spnm9rg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: nUTGWjP7HQGz


Richard Henderson <richard.henderson@linaro.org> writes:

> Begin setting, but not relying upon, env->hflags.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  linux-user/syscall.c    | 1 +
>  target/arm/cpu.c        | 1 +
>  target/arm/helper-a64.c | 3 +++
>  target/arm/helper.c     | 2 ++
>  target/arm/machine.c    | 1 +
>  target/arm/op_helper.c  | 1 +
>  6 files changed, 9 insertions(+)
>
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index e2af3c1494..ebefd05140 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -9982,6 +9982,7 @@ static abi_long do_syscall1(void *cpu_env, int num,=
 abi_long arg1,
>                      aarch64_sve_narrow_vq(env, vq);
>                  }
>                  env->vfp.zcr_el[1] =3D vq - 1;
> +                arm_rebuild_hflags(env);
>                  ret =3D vq * 16;
>              }
>              return ret;
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 2399c14471..d043e75166 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -406,6 +406,7 @@ static void arm_cpu_reset(CPUState *s)
>
>      hw_breakpoint_update_all(cpu);
>      hw_watchpoint_update_all(cpu);
> +    arm_rebuild_hflags(env);
>  }
>
>  bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
> diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
> index bca80bdc38..b4cd680fc4 100644
> --- a/target/arm/helper-a64.c
> +++ b/target/arm/helper-a64.c
> @@ -1025,6 +1025,7 @@ void HELPER(exception_return)(CPUARMState *env, uin=
t64_t new_pc)
>          } else {
>              env->regs[15] =3D new_pc & ~0x3;
>          }
> +        helper_rebuild_hflags_a32(env, new_el);
>          qemu_log_mask(CPU_LOG_INT, "Exception return from AArch64 EL%d t=
o "
>                        "AArch32 EL%d PC 0x%" PRIx32 "\n",
>                        cur_el, new_el, env->regs[15]);
> @@ -1036,10 +1037,12 @@ void HELPER(exception_return)(CPUARMState *env, u=
int64_t new_pc)
>          }
>          aarch64_restore_sp(env, new_el);
>          env->pc =3D new_pc;
> +        helper_rebuild_hflags_a64(env, new_el);
>          qemu_log_mask(CPU_LOG_INT, "Exception return from AArch64 EL%d t=
o "
>                        "AArch64 EL%d PC 0x%" PRIx64 "\n",
>                        cur_el, new_el, env->pc);
>      }
> +
>      /*
>       * Note that cur_el can never be 0.  If new_el is 0, then
>       * el0_a64 is return_to_aa64, else el0_a64 is ignored.
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index b2d701cf00..aae7b62458 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -7998,6 +7998,7 @@ static void take_aarch32_exception(CPUARMState *env=
, int new_mode,
>          env->regs[14] =3D env->regs[15] + offset;
>      }
>      env->regs[15] =3D newpc;
> +    arm_rebuild_hflags(env);
>  }
>
>  static void arm_cpu_do_interrupt_aarch32_hyp(CPUState *cs)
> @@ -8345,6 +8346,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *=
cs)
>      pstate_write(env, PSTATE_DAIF | new_mode);
>      env->aarch64 =3D 1;
>      aarch64_restore_sp(env, new_el);
> +    helper_rebuild_hflags_a64(env, new_el);
>
>      env->pc =3D addr;
>
> diff --git a/target/arm/machine.c b/target/arm/machine.c
> index 5c36707a7c..eb28b2381b 100644
> --- a/target/arm/machine.c
> +++ b/target/arm/machine.c
> @@ -756,6 +756,7 @@ static int cpu_post_load(void *opaque, int version_id)
>      if (!kvm_enabled()) {
>          pmu_op_finish(&cpu->env);
>      }
> +    arm_rebuild_hflags(&cpu->env);
>
>      return 0;
>  }
> diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
> index 0fd4bd0238..ccc2cecb46 100644
> --- a/target/arm/op_helper.c
> +++ b/target/arm/op_helper.c
> @@ -404,6 +404,7 @@ void HELPER(cpsr_write_eret)(CPUARMState *env, uint32=
_t val)
>       * state. Do the masking now.
>       */
>      env->regs[15] &=3D (env->thumb ? ~1 : ~3);
> +    arm_rebuild_hflags(env);
>
>      qemu_mutex_lock_iothread();
>      arm_call_el_change_hook(env_archcpu(env));


--
Alex Benn=C3=A9e
