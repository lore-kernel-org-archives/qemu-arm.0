Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcdf8529f1sm901051a12.1.2025.02.05.04.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 04:52:00 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 6E3245F90B;
	Wed,  5 Feb 2025 12:51:59 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org
Subject: Re: [PATCH 05/14] target/arm: Make CP_ACCESS_TRAPs to AArch32 EL3
 be Monitor traps
In-Reply-To: <20250130182309.717346-6-peter.maydell@linaro.org> (Peter
	Maydell's message of "Thu, 30 Jan 2025 18:23:00 +0000")
References: <20250130182309.717346-1-peter.maydell@linaro.org>
	<20250130182309.717346-6-peter.maydell@linaro.org>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Wed, 05 Feb 2025 12:51:59 +0000
Message-ID: <874j18a70w.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 49jgidJqrOvJ

Peter Maydell <peter.maydell@linaro.org> writes:

> In system register access pseudocode the common pattern for
> AArch32 registers with access traps to EL3 is:
>
> at EL1 and EL2:
>   if HaveEL(EL3) && !ELUsingAArch32(EL3) && (SCR_EL3.TERR =3D=3D 1) then
>      AArch64.AArch32SystemAccessTrap(EL3, 0x03);
>   elsif HaveEL(EL3) && ELUsingAArch32(EL3) && (SCR.TERR =3D=3D 1) then
>      AArch32.TakeMonitorTrapException();
> at EL3:
>   if (PSTATE.M !=3D M32_Monitor) && (SCR.TERR =3D=3D 1) then
>      AArch32.TakeMonitorTrapException();

I was confused a little by my copy which was:

    elsif HaveEL(EL3) && !ELUsingAArch32(EL3) && SCR_EL3.TERR =3D=3D '1' th=
en
        if EL3SDDUndef() then
            UNDEFINED;
        else
            AArch64.AArch32SystemAccessTrap(EL3, 0x03);

But I think EL3SDDUndef() is always false for us as we don't have an
external debug interface.

>
> (taking as an example the ERRIDR access pseudocode).
>
> This implements the behaviour of (in this case) SCR.TERR that
> "Accesses to the specified registers from modes other than Monitor
> mode generate a Monitor Trap exception" and of SCR_EL3.TERR that
> "Accesses of the specified Error Record registers at EL2 and EL1
> are trapped to EL3, unless the instruction generates a higher
> priority exception".
>
> In QEMU we don't implement this pattern correctly in two ways:
>  * in access_check_cp_reg() we turn the CP_ACCESS_TRAP_EL3 into
>    an UNDEF, not a trap to Monitor mode
>  * in the access functions, we check trap bits like SCR.TERR
>    only when arm_current_el(env) < 3 -- this is correct for
>    AArch64 EL3, but misses the "trap non-Monitor-mode execution
>    at EL3 into Monitor mode" case for AArch32 EL3
>
> In this commit we fix the first of these two issues, by
> making access_check_cp_reg() handle CP_ACCESS_TRAP_EL3
> as a Monitor trap. This is a kind of exception that we haven't
> yet implemented(!), so we need a new EXCP_MON_TRAP for it.
>
> This diverges from the pseudocode approach, where every access check
> function explicitly checks for "if EL3 is AArch32" and takes a
> monitor trap; if we wanted to be closer to the pseudocode we could
> add a new CP_ACCESS_TRAP_MONITOR and make all the accessfns use it
> when appropriate.  But because there are no non-standard cases in the
> pseudocode (i.e.  where either it raises a Monitor trap that doesn't
> correspond to an AArch64 SystemAccessTrap or where it raises a
> SystemAccessTrap that doesn't correspond to a Monitor trap), handling
> this all in one place seems less likely to result in future bugs
> where we forgot again about this special case when writing an
> accessor.
>
> (The cc of stable here is because "hw/intc/arm_gicv3_cpuif: Don't
> downgrade monitor traps for AArch32 EL3" which is also cc:stable
> will implicitly use the new EXCP_MON_TRAP code path.)
>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h           |  1 +
>  target/arm/helper.c        | 11 +++++++++++
>  target/arm/tcg/op_helper.c | 13 ++++++++++++-
>  3 files changed, 24 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 2213c277348..4cb672c120b 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -62,6 +62,7 @@
>  #define EXCP_NMI            26
>  #define EXCP_VINMI          27
>  #define EXCP_VFNMI          28
> +#define EXCP_MON_TRAP       29   /* AArch32 trap to Monitor mode */
>  /* NB: add new EXCP_ defines to the array in arm_log_exception() too */
>=20=20
>  #define ARMV7M_EXCP_RESET   1
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 5d9eca35c04..c5cd27b249f 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -9684,6 +9684,7 @@ void arm_log_exception(CPUState *cs)
>              [EXCP_NMI] =3D "NMI",
>              [EXCP_VINMI] =3D "Virtual IRQ NMI",
>              [EXCP_VFNMI] =3D "Virtual FIQ NMI",
> +            [EXCP_MON_TRAP] =3D "Monitor Trap",
>          };
>=20=20
>          if (idx >=3D 0 && idx < ARRAY_SIZE(excnames)) {
> @@ -10250,6 +10251,16 @@ static void arm_cpu_do_interrupt_aarch32(CPUStat=
e *cs)
>          mask =3D CPSR_A | CPSR_I | CPSR_F;
>          offset =3D 0;
>          break;
> +    case EXCP_MON_TRAP:
> +        new_mode =3D ARM_CPU_MODE_MON;
> +        addr =3D 0x04;
> +        mask =3D CPSR_A | CPSR_I | CPSR_F;
> +        if (env->thumb) {
> +            offset =3D 2;
> +        } else {
> +            offset =3D 4;
> +        }
> +        break;
>      default:
>          cpu_abort(cs, "Unhandled exception 0x%x\n", cs->exception_index);
>          return; /* Never happens.  Keep compiler happy.  */
> diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
> index 1161d301b71..1ba727e8e9f 100644
> --- a/target/arm/tcg/op_helper.c
> +++ b/target/arm/tcg/op_helper.c
> @@ -758,6 +758,7 @@ const void *HELPER(access_check_cp_reg)(CPUARMState *=
env, uint32_t key,
>      const ARMCPRegInfo *ri =3D get_arm_cp_reginfo(cpu->cp_regs, key);
>      CPAccessResult res =3D CP_ACCESS_OK;
>      int target_el;
> +    uint32_t excp;
>=20=20
>      assert(ri !=3D NULL);
>=20=20
> @@ -851,8 +852,18 @@ const void *HELPER(access_check_cp_reg)(CPUARMState =
*env, uint32_t key,
>      }
>=20=20
>   fail:
> +    excp =3D EXCP_UDEF;
>      switch (res & ~CP_ACCESS_EL_MASK) {
>      case CP_ACCESS_TRAP:
> +        /*
> +         * If EL3 is AArch32 then there's no syndrome register; the cases
> +         * where we would raise a SystemAccessTrap to AArch64 EL3 all be=
come
> +         * raising a Monitor trap exception. (Because there's no visible
> +         * syndrome it doesn't matter what we pass to raise_exception().)
> +         */
> +        if ((res & CP_ACCESS_EL_MASK) =3D=3D 3 && !arm_el_is_aa64(env, 3=
)) {
> +            excp =3D EXCP_MON_TRAP;
> +        }
>          break;
>      case CP_ACCESS_TRAP_UNCATEGORIZED:
>          /* Only CP_ACCESS_TRAP traps are direct to a specified EL */
> @@ -888,7 +899,7 @@ const void *HELPER(access_check_cp_reg)(CPUARMState *=
env, uint32_t key,
>          g_assert_not_reached();
>      }
>=20=20
> -    raise_exception(env, EXCP_UDEF, syndrome, target_el);
> +    raise_exception(env, excp, syndrome, target_el);
>  }
>=20=20
>  const void *HELPER(lookup_cp_reg)(CPUARMState *env, uint32_t key)

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
