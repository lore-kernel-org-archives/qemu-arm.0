Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id g5-v6sm7181604wmf.34.2018.11.12.03.58.03
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Nov 2018 03:58:04 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 492413E045E;
	Mon, 12 Nov 2018 11:58:03 +0000 (GMT)
References: <20181109134731.11605-1-peter.maydell@linaro.org> <20181109134731.11605-3-peter.maydell@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Adam Lackorzynski <adam.lackorzynski@kernkonzept.com>, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH for-v3.1 2/3] target/arm: Track the state of our irq lines from the GIC explicitly
In-reply-to: <20181109134731.11605-3-peter.maydell@linaro.org>
Date: Mon, 12 Nov 2018 11:58:03 +0000
Message-ID: <87h8gmecdw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: xdv3rk1DXUm/


Peter Maydell <peter.maydell@linaro.org> writes:

> Currently we track the state of the four irq lines from the GIC
> only via the cs->interrupt_request or KVM irq state. That means
> that we assume that an interrupt is asserted if and only if the
> external line is set. This assumption is incorrect for VIRQ
> and VFIQ, because the HCR_EL2.{VI,VF} bits allow assertion
> of VIRQ and VFIQ separately from the state of the external line.
>
> To handle this, start tracking the state of the external lines
> explicitly in a CPU state struct field, as is common practice
> for devices.
>
> The complicated part of this is dealing with inbound migration
> from an older QEMU which didn't have this state. We assume in
> that case that the older QEMU did not implement the HCR_EL2.{VI,VF}
> bits as generating interrupts, and so the line state matches
> the current state in cs->interrupt_request. (This is not quite
> true between commit 8a0fc3a29fc2315325400c7 and its revert, but
> that commit is broken and never made it into any released QEMU
> version.)
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/cpu.h     |  3 +++
>  target/arm/cpu.c     | 16 ++++++++++++++
>  target/arm/machine.c | 51 ++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 70 insertions(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index b5eff79f73b..f1913cdad26 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -538,6 +538,9 @@ typedef struct CPUARMState {
>          uint64_t esr;
>      } serror;
>
> +    /* State of our input IRQ/FIQ/VIRQ/VFIQ lines */
> +    uint32_t irq_line_state;
> +
>      /* Thumb-2 EE state.  */
>      uint32_t teecr;
>      uint32_t teehbr;
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 784a4c2dfcc..45c16ae90ba 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -449,6 +449,12 @@ static void arm_cpu_set_irq(void *opaque, int irq, i=
nt level)
>          [ARM_CPU_VFIQ] =3D CPU_INTERRUPT_VFIQ
>      };
>
> +    if (level) {
> +        env->irq_line_state |=3D mask[irq];
> +    } else {
> +        env->irq_line_state &=3D ~mask[irq];
> +    }
> +
>      switch (irq) {
>      case ARM_CPU_VIRQ:
>      case ARM_CPU_VFIQ:
> @@ -473,17 +479,27 @@ static void arm_cpu_kvm_set_irq(void *opaque, int i=
rq, int level)
>      ARMCPU *cpu =3D opaque;
>      CPUState *cs =3D CPU(cpu);
>      int kvm_irq =3D KVM_ARM_IRQ_TYPE_CPU << KVM_ARM_IRQ_TYPE_SHIFT;
> +    uint32_t linestate_bit;
>
>      switch (irq) {
>      case ARM_CPU_IRQ:
>          kvm_irq |=3D KVM_ARM_IRQ_CPU_IRQ;
> +        linestate_bit =3D CPU_INTERRUPT_HARD;
>          break;
>      case ARM_CPU_FIQ:
>          kvm_irq |=3D KVM_ARM_IRQ_CPU_FIQ;
> +        linestate_bit =3D CPU_INTERRUPT_FIQ;
>          break;
>      default:
>          g_assert_not_reached();
>      }
> +
> +    if (level) {
> +        env->irq_line_state |=3D linestate_bit;
> +    } else {
> +        env->irq_line_state &=3D ~linestate_bit;
> +    }
> +
>      kvm_irq |=3D cs->cpu_index << KVM_ARM_IRQ_VCPU_SHIFT;
>      kvm_set_irq(kvm_state, kvm_irq, level ? 1 : 0);
>  #endif
> diff --git a/target/arm/machine.c b/target/arm/machine.c
> index 239fe4e84d1..2033816a64e 100644
> --- a/target/arm/machine.c
> +++ b/target/arm/machine.c
> @@ -192,6 +192,22 @@ static const VMStateDescription vmstate_serror =3D {
>      }
>  };
>
> +static bool irq_line_state_needed(void *opaque)
> +{
> +    return true;
> +}
> +
> +static const VMStateDescription vmstate_irq_line_state =3D {
> +    .name =3D "cpu/irq-line-state",
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .needed =3D irq_line_state_needed,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_UINT32(env.irq_line_state, ARMCPU),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  static bool m_needed(void *opaque)
>  {
>      ARMCPU *cpu =3D opaque;
> @@ -625,11 +641,44 @@ static int cpu_pre_save(void *opaque)
>      return 0;
>  }
>
> +static int cpu_pre_load(void *opaque)
> +{
> +    ARMCPU *cpu =3D opaque;
> +    CPUARMState *env =3D &cpu->env;
> +
> +    /*
> +     * Pre-initialize irq_line_state to a value that's never valid as
> +     * real data, so cpu_post_load() can tell whether we've seen the
> +     * irq-line-state subsection in the incoming migration state.
> +     */
> +    env->irq_line_state =3D UINT32_MAX;
> +
> +    return 0;
> +}
> +
>  static int cpu_post_load(void *opaque, int version_id)
>  {
>      ARMCPU *cpu =3D opaque;
> +    CPUARMState *env =3D &cpu->env;
>      int i, v;
>
> +    /*
> +     * Handle migration compatibility from old QEMU which didn't
> +     * send the irq-line-state subsection. A QEMU without it did not
> +     * implement the HCR_EL2.{VI,VF} bits as generating interrupts,
> +     * so for TCG the line state matches the bits set in cs->interrupt_r=
equest.
> +     * For KVM the line state is not stored in cs->interrupt_request
> +     * and so this will leave irq_line_state as 0, but this is OK because
> +     * we only need to care about it for TCG.
> +     */
> +    if (env->irq_line_state =3D=3D UINT32_MAX) {
> +        CPUState *cs =3D CPU(cpu);
> +
> +        env->irq_line_state =3D cs->interrupt_request &
> +            (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ |
> +             CPU_INTERRUPT_VIRQ | CPU_INTERRUPT_VFIQ);
> +    }
> +
>      /* Update the values list from the incoming migration data.
>       * Anything in the incoming data which we don't know about is
>       * a migration failure; anything we know about but the incoming
> @@ -680,6 +729,7 @@ const VMStateDescription vmstate_arm_cpu =3D {
>      .version_id =3D 22,
>      .minimum_version_id =3D 22,
>      .pre_save =3D cpu_pre_save,
> +    .pre_load =3D cpu_pre_load,
>      .post_load =3D cpu_post_load,
>      .fields =3D (VMStateField[]) {
>          VMSTATE_UINT32_ARRAY(env.regs, ARMCPU, 16),
> @@ -747,6 +797,7 @@ const VMStateDescription vmstate_arm_cpu =3D {
>          &vmstate_sve,
>  #endif
>          &vmstate_serror,
> +        &vmstate_irq_line_state,
>          NULL
>      }
>  };


--
Alex Benn=C3=A9e
