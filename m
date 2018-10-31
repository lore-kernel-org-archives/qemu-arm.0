Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id y21-v6sm7971290wma.36.2018.10.31.05.15.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Oct 2018 05:15:18 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id D8DE03E0520;
	Wed, 31 Oct 2018 12:15:17 +0000 (GMT)
References: <20181025144644.15464-1-cota@braap.org> <20181025144644.15464-16-cota@braap.org>
User-agent: mu4e 1.1.0; emacs 26.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Emilio G. Cota" <cota@braap.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [Qemu-devel] [RFC v4 16/71] arm: convert to cpu_halted
In-reply-to: <20181025144644.15464-16-cota@braap.org>
Date: Wed, 31 Oct 2018 12:15:17 +0000
Message-ID: <87a7mu8g8a.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: fiUK8ZM2S0DB


Emilio G. Cota <cota@braap.org> writes:

> Cc: Andrzej Zaborowski <balrogg@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Emilio G. Cota <cota@braap.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  hw/arm/omap1.c            | 4 ++--
>  hw/arm/pxa2xx_gpio.c      | 2 +-
>  hw/arm/pxa2xx_pic.c       | 2 +-
>  target/arm/arm-powerctl.c | 4 ++--
>  target/arm/cpu.c          | 2 +-
>  target/arm/op_helper.c    | 2 +-
>  6 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
> index 539d29ef9c..55a7672976 100644
> --- a/hw/arm/omap1.c
> +++ b/hw/arm/omap1.c
> @@ -1769,7 +1769,7 @@ static uint64_t omap_clkdsp_read(void *opaque, hwad=
dr addr,
>      case 0x18:	/* DSP_SYSST */
>          cpu =3D CPU(s->cpu);
>          return (s->clkm.clocking_scheme << 11) | s->clkm.cold_start |
> -                (cpu->halted << 6);      /* Quite useless... */
> +                (cpu_halted(cpu) << 6);      /* Quite useless... */
>      }
>
>      OMAP_BAD_REG(addr);
> @@ -3790,7 +3790,7 @@ void omap_mpu_wakeup(void *opaque, int irq, int req)
>      struct omap_mpu_state_s *mpu =3D (struct omap_mpu_state_s *) opaque;
>      CPUState *cpu =3D CPU(mpu->cpu);
>
> -    if (cpu->halted) {
> +    if (cpu_halted(cpu)) {
>          cpu_interrupt(cpu, CPU_INTERRUPT_EXITTB);
>      }
>  }
> diff --git a/hw/arm/pxa2xx_gpio.c b/hw/arm/pxa2xx_gpio.c
> index e15070188e..5c3fea42e9 100644
> --- a/hw/arm/pxa2xx_gpio.c
> +++ b/hw/arm/pxa2xx_gpio.c
> @@ -128,7 +128,7 @@ static void pxa2xx_gpio_set(void *opaque, int line, i=
nt level)
>          pxa2xx_gpio_irq_update(s);
>
>      /* Wake-up GPIOs */
> -    if (cpu->halted && (mask & ~s->dir[bank] & pxa2xx_gpio_wake[bank])) {
> +    if (cpu_halted(cpu) && (mask & ~s->dir[bank] & pxa2xx_gpio_wake[bank=
])) {
>          cpu_interrupt(cpu, CPU_INTERRUPT_EXITTB);
>      }
>  }
> diff --git a/hw/arm/pxa2xx_pic.c b/hw/arm/pxa2xx_pic.c
> index 61275fa040..46ab4c3fc2 100644
> --- a/hw/arm/pxa2xx_pic.c
> +++ b/hw/arm/pxa2xx_pic.c
> @@ -58,7 +58,7 @@ static void pxa2xx_pic_update(void *opaque)
>      PXA2xxPICState *s =3D (PXA2xxPICState *) opaque;
>      CPUState *cpu =3D CPU(s->cpu);
>
> -    if (cpu->halted) {
> +    if (cpu_halted(cpu)) {
>          mask[0] =3D s->int_pending[0] & (s->int_enabled[0] | s->int_idle=
);
>          mask[1] =3D s->int_pending[1] & (s->int_enabled[1] | s->int_idle=
);
>          if (mask[0] || mask[1]) {
> diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
> index ce55eeb682..e4477444fc 100644
> --- a/target/arm/arm-powerctl.c
> +++ b/target/arm/arm-powerctl.c
> @@ -64,7 +64,7 @@ static void arm_set_cpu_on_async_work(CPUState *target_=
cpu_state,
>
>      /* Initialize the cpu we are turning on */
>      cpu_reset(target_cpu_state);
> -    target_cpu_state->halted =3D 0;
> +    cpu_halted_set(target_cpu_state, 0);
>
>      if (info->target_aa64) {
>          if ((info->target_el < 3) && arm_feature(&target_cpu->env,
> @@ -228,7 +228,7 @@ static void arm_set_cpu_off_async_work(CPUState *targ=
et_cpu_state,
>
>      assert(qemu_mutex_iothread_locked());
>      target_cpu->power_state =3D PSCI_OFF;
> -    target_cpu_state->halted =3D 1;
> +    cpu_halted_set(target_cpu_state, 1);
>      target_cpu_state->exception_index =3D EXCP_HLT;
>  }
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index b5e61cc177..9c5cda8eb7 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -149,7 +149,7 @@ static void arm_cpu_reset(CPUState *s)
>      env->vfp.xregs[ARM_VFP_MVFR2] =3D cpu->mvfr2;
>
>      cpu->power_state =3D cpu->start_powered_off ? PSCI_OFF : PSCI_ON;
> -    s->halted =3D cpu->start_powered_off;
> +    cpu_halted_set(s, cpu->start_powered_off);
>
>      if (arm_feature(env, ARM_FEATURE_IWMMXT)) {
>          env->iwmmxt.cregs[ARM_IWMMXT_wCID] =3D 0x69051000 | 'Q';
> diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
> index fb15a13e6c..8e393823f8 100644
> --- a/target/arm/op_helper.c
> +++ b/target/arm/op_helper.c
> @@ -465,7 +465,7 @@ void HELPER(wfi)(CPUARMState *env, uint32_t insn_len)
>      }
>
>      cs->exception_index =3D EXCP_HLT;
> -    cs->halted =3D 1;
> +    cpu_halted_set(cs, 1);
>      cpu_loop_exit(cs);
>  }


--
Alex Benn=C3=A9e
