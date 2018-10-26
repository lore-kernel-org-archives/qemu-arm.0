Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id a12-v6sm6706554wrr.71.2018.10.26.06.39.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Oct 2018 06:39:21 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 0BE553E014D;
	Fri, 26 Oct 2018 14:39:21 +0100 (BST)
References: <20181025144644.15464-1-cota@braap.org> <20181025144644.15464-36-cota@braap.org>
User-agent: mu4e 1.1.0; emacs 26.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Emilio G. Cota" <cota@braap.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-devel] [RFC v4 36/71] arm: convert to cpu_interrupt_request
In-reply-to: <20181025144644.15464-36-cota@braap.org>
Date: Fri, 26 Oct 2018 14:39:21 +0100
Message-ID: <87d0rw25fa.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: RrqqzZPi5VWu


Emilio G. Cota <cota@braap.org> writes:

> Cc: Peter Maydell <peter.maydell@linaro.org>

This will need to catch-up in the next re-base as there is a merge conflict.

> Cc: qemu-arm@nongnu.org
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Emilio G. Cota <cota@braap.org>
> ---
>  target/arm/cpu.c    |  2 +-
>  target/arm/helper.c | 12 +++++-------
>  2 files changed, 6 insertions(+), 8 deletions(-)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 9c5cda8eb7..7330c2dae1 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -49,7 +49,7 @@ static bool arm_cpu_has_work(CPUState *cs)
>      ARMCPU *cpu =3D ARM_CPU(cs);
>
>      return (cpu->power_state !=3D PSCI_OFF)
> -        && cs->interrupt_request &
> +        && cpu_interrupt_request(cs) &
>          (CPU_INTERRUPT_FIQ | CPU_INTERRUPT_HARD
>           | CPU_INTERRUPT_VFIQ | CPU_INTERRUPT_VIRQ
>           | CPU_INTERRUPT_EXITTB);
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index c83f7c1109..454954a56c 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -1294,11 +1294,12 @@ static uint64_t isr_read(CPUARMState *env, const =
ARMCPRegInfo *ri)
>  {
>      CPUState *cs =3D ENV_GET_CPU(env);
>      uint64_t ret =3D 0;
> +    uint32_t interrupt_request =3D cpu_interrupt_request(cs);
>
> -    if (cs->interrupt_request & CPU_INTERRUPT_HARD) {
> +    if (interrupt_request & CPU_INTERRUPT_HARD) {
>          ret |=3D CPSR_I;
>      }
> -    if (cs->interrupt_request & CPU_INTERRUPT_FIQ) {
> +    if (interrupt_request & CPU_INTERRUPT_FIQ) {
>          ret |=3D CPSR_F;
>      }
>      /* External aborts are not possible in QEMU so A bit is always clear=
 */
> @@ -8579,10 +8580,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
>          return;
>      }
>
> -    /* Hooks may change global state so BQL should be held, also the
> -     * BQL needs to be held for any modification of
> -     * cs->interrupt_request.
> -     */
> +    /* Hooks may change global state so BQL should be held */
>      g_assert(qemu_mutex_iothread_locked());
>
>      arm_call_pre_el_change_hook(cpu);
> @@ -8597,7 +8595,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
>      arm_call_el_change_hook(cpu);
>
>      if (!kvm_enabled()) {
> -        cs->interrupt_request |=3D CPU_INTERRUPT_EXITTB;
> +        cpu_interrupt_request_or(cs, CPU_INTERRUPT_EXITTB);
>      }
>  }


--
Alex Benn=C3=A9e
