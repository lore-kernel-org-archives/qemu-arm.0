Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id t5sm8536885wmi.32.2021.05.24.09.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 09:09:11 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 64F731FF7E;
	Mon, 24 May 2021 17:09:10 +0100 (BST)
References: <20210510150016.24910-1-peter.maydell@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Chan Kim <ckim@etri.re.kr>, qemu-arm@nongnu.org
Subject: Re: [PATCH] hw/intc/arm_gicv3_cpuif: Fix EOIR write access check logic
Date: Mon, 24 May 2021 16:48:18 +0100
In-reply-to: <20210510150016.24910-1-peter.maydell@linaro.org>
Message-ID: <87fsyc3yhl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 5udlMB9IcEno


Peter Maydell <peter.maydell@linaro.org> writes:

> In icc_eoir_write() we assume that we can identify the group of the
> IRQ being completed based purely on which register is being written
> to and the current CPU state, and that "CPU state matches group
> indicated by register" is the only necessary access check.
>
> This isn't correct: if the CPU is not in Secure state then EOIR1 will
> only complete Group 1 NS IRQs, but if the CPU is in EL3 it can
> complete both Group 1 S and Group 1 NS IRQs.  (The pseudocode
> ICC_EOIR1_EL1 makes this clear.) We were also missing the logic to
> prevent EOIR0 writes completing G0 IRQs when they should not.
>
> Rearrange the logic to first identify the group of the current
> highest priority interrupt and then look at whether we should
> complete it or ignore the access based on which register was accessed
> and the state of the CPU.  The resulting behavioural change is:
>  * EL3 can now complete G1NS interrupts
>  * G0 interrupt completion is now ignored if the GIC
>    and the CPU have the security extension enabled and
>    the CPU is not secure
>
> Reported-by: Chan Kim <ckim@etri.re.kr>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/arm_gicv3_cpuif.c | 48 ++++++++++++++++++++++++++-------------
>  1 file changed, 32 insertions(+), 16 deletions(-)
>
> diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> index 43ef1d7a840..81f94c7f4ad 100644
> --- a/hw/intc/arm_gicv3_cpuif.c
> +++ b/hw/intc/arm_gicv3_cpuif.c
> @@ -1307,27 +1307,16 @@ static void icc_eoir_write(CPUARMState *env, cons=
t ARMCPRegInfo *ri,
>      GICv3CPUState *cs =3D icc_cs_from_env(env);
>      int irq =3D value & 0xffffff;

Un-related but the docs do say that:

  This field has either 16 or 24 bits implemented. The number of
  implemented bits can be found in ICC_CTLR_EL1.IDbits and
  ICC_CTLR_EL3.IDbits. If only 16 bits are implemented, bits [23:16] of
  this register are RES0

>      int grp;
> +    bool is_eoir0 =3D ri->crm =3D=3D 8;
>=20=20
> -    if (icv_access(env, ri->crm =3D=3D 8 ? HCR_FMO : HCR_IMO)) {
> +    if (icv_access(env, is_eoir0 ? HCR_FMO : HCR_IMO)) {
>          icv_eoir_write(env, ri, value);
>          return;
>      }
>=20=20
> -    trace_gicv3_icc_eoir_write(ri->crm =3D=3D 8 ? 0 : 1,
> +    trace_gicv3_icc_eoir_write(is_eoir0 ? 0 : 1,
>                                 gicv3_redist_affid(cs), value);
>=20=20
> -    if (ri->crm =3D=3D 8) {
> -        /* EOIR0 */
> -        grp =3D GICV3_G0;
> -    } else {
> -        /* EOIR1 */
> -        if (arm_is_secure(env)) {
> -            grp =3D GICV3_G1;
> -        } else {
> -            grp =3D GICV3_G1NS;
> -        }
> -    }
> -
>      if (irq >=3D cs->gic->num_irq) {
>          /* This handles two cases:
>           * 1. If software writes the ID of a spurious interrupt [ie 1020=
-1023]
> @@ -1340,8 +1329,35 @@ static void icc_eoir_write(CPUARMState *env, const=
 ARMCPRegInfo *ri,
>          return;
>      }
>=20=20
> -    if (icc_highest_active_group(cs) !=3D grp) {
> -        return;
> +    grp =3D icc_highest_active_group(cs);
> +    switch (grp) {
> +    case GICV3_G0:
> +        if (!is_eoir0) {
> +            return;
> +        }
> +        if (!(cs->gic->gicd_ctlr & GICD_CTLR_DS)
> +            && arm_feature(env, ARM_FEATURE_EL3) && !arm_is_secure(env))=
 {
> +            return;
> +        }
> +        break;
> +    case GICV3_G1:
> +        if (is_eoir0) {
> +            return;
> +        }
> +        if (!arm_is_secure(env)) {
> +            return;
> +        }
> +        break;
> +    case GICV3_G1NS:
> +        if (is_eoir0) {
> +            return;
> +        }
> +        if (!arm_is_el3_or_mon(env) && arm_is_secure(env)) {
> +            return;
> +        }
> +        break;
> +    default:
> +        g_assert_not_reached();
>      }

From my reading of the spec it looks OK to me:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
