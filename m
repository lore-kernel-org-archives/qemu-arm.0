Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3619474wrt;
        Mon, 4 Feb 2019 06:05:15 -0800 (PST)
X-Received: by 2002:a9d:2926:: with SMTP id d35mr36491361otb.355.1549289115163;
        Mon, 04 Feb 2019 06:05:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549289115; cv=none;
        d=google.com; s=arc-20160816;
        b=b+tqAHTd6s2MT7lLA3WWDn+P9WQmGFk5ZFErx+mYOxpl5gZyNZaWwVFN1eK0qIpN8P
         Qcy/nWsXY15X6pQBF+LdZHcgv5wSdbKWUfTZ5H0rmQRfGpmlKTdVyzGCoID2vVyuQD2f
         LtSIPHVZAci6AVJ75oMPkRLnyuzxVci9zzsKrfFusj2cAIiq102Pni4YLzBdbqUu7ra+
         yUrCTZSjcrIwZ660zl+LgToSw9snkzG3JX4nbolQHT6nIJF6n2J3X9PIFB9Q95rnzum5
         L9kW3r6IEfqWgvXLfhGbFJarMgqyT8Eqb04wRY9B9SYZAVSb7JS0mq8rSAq1AiH3y68g
         slzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+gMV1kYagTBINxrYG7rdDYmFKEMIXEm4xYp0g3kaENM=;
        b=0AW9rfT6DvZkMy0JFu6aZsu7Cx5h/GgCSBMero4a22Zsg3z9Is6FQo+oXX8tzCHpNn
         Mpw6QEaASlhT9E9xKxxbH9ykUkSbS/3pLzkbxt3nxeqt4xHaeqBbJx9LaG62FQ2WOdru
         0keI/VAQwxywkCY6IHSVsfVdRLreP1QrRkUr01iNKj17fYozAnby2V1254v7uXH5V0UA
         GN6mtGS6SWa5IxIJziOqTHw/PqVKYTYakro4irvtQ5/q7n4BqdWDlw+C3mMVOT8JwyRA
         e/S9UVBQfxnRzRfIoCD++fg0NljfYtg+hxDyuh8Gb6erzJ9P6GnR0QEgzCKixeI7f1U7
         6yvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="DGuQ9/3+";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id m31sor9489595otm.64.2019.02.04.06.05.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 04 Feb 2019 06:05:15 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="DGuQ9/3+";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+gMV1kYagTBINxrYG7rdDYmFKEMIXEm4xYp0g3kaENM=;
        b=DGuQ9/3+lPdIwTcqQ8PTdxeM3sRytV2k1kLTxKrlgmT8hxoJbiFhmTgdYjdvtkTSTJ
         NR5FM5V3kT+7TLhPPInu8QlAkE1wxeFvdG2E/JNRt7QJXpZkcuz0ms5q6OQ+T1sTJPkY
         aL0VsBZNaHU3SiYd4Wjieun5y1MxlIVneRH4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+gMV1kYagTBINxrYG7rdDYmFKEMIXEm4xYp0g3kaENM=;
        b=Au6ebOWb9ZbwMc1TnW8911SHNxNJ1ETBxJODyHnHk0J0Dms2nnQe2WlbPU3YDqIXhk
         HCb7ck2PzbuKUaLvrvdkMBrBSHnO5Bv+/poY/i7TSQTh1fcsTiByiiKhELfxAATUtavV
         xsEVVseCVgQWeFKWDTs1mNpDb9k6GTfFi+jBu6RI3DiwOcXzM7pgxXLJqxwei84M/HDo
         BAPWe0hpFiCu9wJFmJWyh9BTmb38Yf2hIr/TYcUBPCegAdLHLPo2vH/qonIsay+CBfw6
         65to1v6lqkToQMe55aP6R3hZVoEnx3WUUISxrHELymnP7+CT76OTHK/mKYxGdQsugbCm
         E1BQ==
X-Gm-Message-State: AJcUukctH2eDlqzk/PDBtnFdFquJy8EIH9iWoF8stobOVqh1SjyNLnq+
	VPA2TJ+/cEhgozRenY8ALNCQmxlE4H+ejzaaZ41WTZdwWdUiDQ==
X-Google-Smtp-Source: ALg8bN5hNNg3UI4I+UBbpcEAv5bjLsnuFtF1A0yxORMgkCj9GQAXpcdfOPLaafrrHCj5RiJsg8cq3vgA+kuNycEWXHs=
X-Received: by 2002:a05:6830:1115:: with SMTP id w21mr36680514otq.316.1549289114513;
 Mon, 04 Feb 2019 06:05:14 -0800 (PST)
MIME-Version: 1.0
References: <20190128173940.25813-1-alex.bennee@linaro.org> <20190128173940.25813-3-alex.bennee@linaro.org>
In-Reply-To: <20190128173940.25813-3-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Feb 2019 14:05:03 +0000
Message-ID: <CAFEAcA9fD_bju_+QM3D+088rKJffQ66HBPYUB-cDknKmPikhaQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] target/arm: expose CPUID registers to userspace
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: iSbeCQoA6JkY

On Mon, 28 Jan 2019 at 17:39, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> A number of CPUID registers are exposed to userspace by modern Linux
> kernels thanks to the "ARM64 CPU Feature Registers" ABI. For QEMU's
> user-mode emulation we don't need to emulate the kernels trap but just
> return the value the trap would have done. For this we use the PL0U_R
> permission mask which allows this access in CONFIG_USER mode.
>
> Some registers only return a subset of their contents so we need
> specific CONFIG_USER_ONLY logic to do this.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> ---
> v4
>   - tweak commit message
>   - use PL0U_R instead of PL1U_R to be less confusing
>   - more CONFIG_USER logic for special cases
>   - mask a bunch of bits for some registers
> ---
>  target/arm/helper.c | 51 ++++++++++++++++++++++++++++++++-------------
>  1 file changed, 36 insertions(+), 15 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 42c1c0b144..68808e7293 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -3543,7 +3543,7 @@ static uint64_t mpidr_read(CPUARMState *env, const =
ARMCPRegInfo *ri)
>  static const ARMCPRegInfo mpidr_cp_reginfo[] =3D {
>      { .name =3D "MPIDR", .state =3D ARM_CP_STATE_BOTH,
>        .opc0 =3D 3, .crn =3D 0, .crm =3D 0, .opc1 =3D 0, .opc2 =3D 5,
> -      .access =3D PL1_R, .readfn =3D mpidr_read, .type =3D ARM_CP_NO_RAW=
 },
> +      .access =3D PL0U_R, .readfn =3D mpidr_read, .type =3D ARM_CP_NO_RA=
W },
>      REGINFO_SENTINEL
>  };
>
> @@ -5488,6 +5488,7 @@ static uint64_t id_pfr1_read(CPUARMState *env, cons=
t ARMCPRegInfo *ri)
>      return pfr1;
>  }
>
> +#ifndef CONFIG_USER_ONLY
>  static uint64_t id_aa64pfr0_read(CPUARMState *env, const ARMCPRegInfo *r=
i)
>  {
>      ARMCPU *cpu =3D arm_env_get_cpu(env);
> @@ -5498,6 +5499,7 @@ static uint64_t id_aa64pfr0_read(CPUARMState *env, =
const ARMCPRegInfo *ri)
>      }
>      return pfr0;
>  }
> +#endif
>
>  /* Shared logic between LORID and the rest of the LOR* registers.
>   * Secure state has already been delt with.
> @@ -5799,18 +5801,26 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>           * define new registers here.
>           */
>          ARMCPRegInfo v8_idregs[] =3D {
> -            /* ID_AA64PFR0_EL1 is not a plain ARM_CP_CONST because we do=
n't
> -             * know the right value for the GIC field until after we
> -             * define these regs.
> +            /* ID_AA64PFR0_EL1 is not a plain ARM_CP_CONST for system
> +             * emulation because we don't know the right value for the
> +             * GIC field until after we define these regs. For
> +             * user-mode HWCAP_CPUID emulation the GIC bits are masked
> +             * anyway.
>               */
>              { .name =3D "ID_AA64PFR0_EL1", .state =3D ARM_CP_STATE_AA64,
>                .opc0 =3D 3, .opc1 =3D 0, .crn =3D 0, .crm =3D 4, .opc2 =
=3D 0,
> +#ifndef CONFIG_USER_ONLY
>                .access =3D PL1_R, .type =3D ARM_CP_NO_RAW,
>                .readfn =3D id_aa64pfr0_read,
> -              .writefn =3D arm_cp_write_ignore },
> +              .writefn =3D arm_cp_write_ignore
> +#else
> +              .access =3D PL0U_R, .type =3D ARM_CP_CONST,
> +              .resetvalue =3D cpu->isar.id_aa64pfr0 & 0x000f000f0ff0000U=
LL
> +#endif
> +            },
>              { .name =3D "ID_AA64PFR1_EL1", .state =3D ARM_CP_STATE_AA64,
>                .opc0 =3D 3, .opc1 =3D 0, .crn =3D 0, .crm =3D 4, .opc2 =
=3D 1,
> -              .access =3D PL1_R, .type =3D ARM_CP_CONST,
> +              .access =3D PL0U_R, .type =3D ARM_CP_CONST,
>                .resetvalue =3D cpu->isar.id_aa64pfr1},
>              { .name =3D "ID_AA64PFR2_EL1_RESERVED", .state =3D ARM_CP_ST=
ATE_AA64,
>                .opc0 =3D 3, .opc1 =3D 0, .crn =3D 0, .crm =3D 4, .opc2 =
=3D 2,
> @@ -5839,11 +5849,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>                .resetvalue =3D 0 },
>              { .name =3D "ID_AA64DFR0_EL1", .state =3D ARM_CP_STATE_AA64,
>                .opc0 =3D 3, .opc1 =3D 0, .crn =3D 0, .crm =3D 5, .opc2 =
=3D 0,
> -              .access =3D PL1_R, .type =3D ARM_CP_CONST,
> +              .access =3D PL0U_R, .type =3D ARM_CP_CONST,
>                .resetvalue =3D cpu->id_aa64dfr0 },

This doesn't seem right -- I think ID_AA64DFR0_EL1 should be exposed
as zero, not whatever the underlying register value is.

More generally, this ifdeffing of "maybe mask the values" doesn't
seem very future-proof. If we add something to one of the cpu-id_*
values, that should be masked out to zero by default for linux-user,
not defaulting to passed through.

thanks
-- PMM
