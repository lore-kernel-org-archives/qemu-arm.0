Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id j21-20020a170906431500b00a521e5856f6sm15395091ejm.51.2024.04.30.10.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 10:15:59 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 51F685F7A7;
	Tue, 30 Apr 2024 18:15:58 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org
Subject: Re: [PATCH 1/2] accel/tcg: Make TCGCPUOps::cpu_exec_halt return
 bool for whether to halt
In-Reply-To: <20240430140035.3889879-2-peter.maydell@linaro.org> (Peter
	Maydell's message of "Tue, 30 Apr 2024 15:00:34 +0100")
References: <20240430140035.3889879-1-peter.maydell@linaro.org>
	<20240430140035.3889879-2-peter.maydell@linaro.org>
Date: Tue, 30 Apr 2024 18:15:58 +0100
Message-ID: <87ttji3h69.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: IwOgrcbl2xAm

Peter Maydell <peter.maydell@linaro.org> writes:

> The TCGCPUOps::cpu_exec_halt method is called from cpu_handle_halt()
> when the CPU is halted, so that a target CPU emulation can do
> anything target-specific it needs to do.  (At the moment we only use
> this on i386.)
>
> The current specification of the method doesn't allow the target
> specific code to do something different if the CPU is about to come
> out of the halt state, because cpu_handle_halt() only determines this
> after the method has returned.  (If the method called cpu_has_work()
> itself this would introduce a potential race if an interrupt arrived
> between the target's method implementation checking and
> cpu_handle_halt() repeating the check.)
>
> Change the definition of the method so that it returns a bool to
> tell cpu_handle_halt() whether to stay in halt or not.
>
> We will want this for the Arm target, where FEAT_WFxT wants to do
> some work only for the case where the CPU is in halt but about to
> leave it.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/core/tcg-cpu-ops.h       | 11 +++++++++--
>  target/i386/tcg/helper-tcg.h        |  2 +-
>  accel/tcg/cpu-exec.c                |  7 +++++--
>  target/i386/tcg/sysemu/seg_helper.c |  3 ++-
>  4 files changed, 17 insertions(+), 6 deletions(-)
>
> diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
> index dc1f16a9777..f3ac76e6f6d 100644
> --- a/include/hw/core/tcg-cpu-ops.h
> +++ b/include/hw/core/tcg-cpu-ops.h
> @@ -111,8 +111,15 @@ struct TCGCPUOps {
>      void (*do_interrupt)(CPUState *cpu);
>      /** @cpu_exec_interrupt: Callback for processing interrupts in cpu_e=
xec */
>      bool (*cpu_exec_interrupt)(CPUState *cpu, int interrupt_request);
> -    /** @cpu_exec_halt: Callback for handling halt in cpu_exec */
> -    void (*cpu_exec_halt)(CPUState *cpu);
> +    /**
> +     * @cpu_exec_halt: Callback for handling halt in cpu_exec.
> +     *
> +     * Return true to indicate that the CPU should now leave halt, false
> +     * if it should remain in the halted state.
> +     * If this method is not provided, the default is to leave halt
> +     * if cpu_has_work() returns true.
> +     */
> +    bool (*cpu_exec_halt)(CPUState *cpu);

Would it be too much to rename the method to cpu_exec_leave_halt() to
make it clearer on use the sense of the return value?

>      /**
>       * @tlb_fill: Handle a softmmu tlb miss
>       *
> diff --git a/target/i386/tcg/helper-tcg.h b/target/i386/tcg/helper-tcg.h
> index effc2c1c984..85957943bf3 100644
> --- a/target/i386/tcg/helper-tcg.h
> +++ b/target/i386/tcg/helper-tcg.h
> @@ -39,7 +39,7 @@ QEMU_BUILD_BUG_ON(TCG_PHYS_ADDR_BITS > TARGET_PHYS_ADDR=
_SPACE_BITS);
>   */
>  void x86_cpu_do_interrupt(CPUState *cpu);
>  #ifndef CONFIG_USER_ONLY
> -void x86_cpu_exec_halt(CPUState *cpu);
> +bool x86_cpu_exec_halt(CPUState *cpu);
>  bool x86_need_replay_interrupt(int interrupt_request);
>  bool x86_cpu_exec_interrupt(CPUState *cpu, int int_req);
>  #endif
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 5c70748060a..550f93b19ce 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -669,11 +669,14 @@ static inline bool cpu_handle_halt(CPUState *cpu)
>  #ifndef CONFIG_USER_ONLY
>      if (cpu->halted) {
>          const TCGCPUOps *tcg_ops =3D cpu->cc->tcg_ops;
> +        bool leave_halt;
>=20=20
>          if (tcg_ops->cpu_exec_halt) {
> -            tcg_ops->cpu_exec_halt(cpu);
> +            leave_halt =3D tcg_ops->cpu_exec_halt(cpu);
> +        } else {
> +            leave_halt =3D cpu_has_work(cpu);
>          }
> -        if (!cpu_has_work(cpu)) {
> +        if (!leave_halt) {
>              return true;
>          }
>=20=20
> diff --git a/target/i386/tcg/sysemu/seg_helper.c b/target/i386/tcg/sysemu=
/seg_helper.c
> index 2db8083748e..9ba94deb3aa 100644
> --- a/target/i386/tcg/sysemu/seg_helper.c
> +++ b/target/i386/tcg/sysemu/seg_helper.c
> @@ -128,7 +128,7 @@ void x86_cpu_do_interrupt(CPUState *cs)
>      }
>  }
>=20=20
> -void x86_cpu_exec_halt(CPUState *cpu)
> +bool x86_cpu_exec_halt(CPUState *cpu)
>  {
>      if (cpu->interrupt_request & CPU_INTERRUPT_POLL) {
>          X86CPU *x86_cpu =3D X86_CPU(cpu);
> @@ -138,6 +138,7 @@ void x86_cpu_exec_halt(CPUState *cpu)
>          cpu_reset_interrupt(cpu, CPU_INTERRUPT_POLL);
>          bql_unlock();
>      }
> +    return cpu_has_work(cpu);

The x86 version is essentially being called for side effects. Do we want
to document this usage in the method?

>  }
>=20=20
>  bool x86_need_replay_interrupt(int interrupt_request)

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
