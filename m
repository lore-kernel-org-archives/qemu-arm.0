Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp7490098wrq;
        Thu, 28 Jun 2018 07:23:33 -0700 (PDT)
X-Received: by 2002:a9d:c41:: with SMTP id 59-v6mr6392919otr.309.1530195813060;
        Thu, 28 Jun 2018 07:23:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530195813; cv=none;
        d=google.com; s=arc-20160816;
        b=RybQhUUkXwnSCZ3emZ3+i/j6A5zujrxvC1viVTn8GTjgFVDrCd+qvGOgI+ohsKZnjT
         m1lkLI2Qj/7RBPMECokKNUn9sjJqKyhxIqjzSxfZn8yV1mmPbD3sRiCPt7ZaTVVcoiBh
         7AioQjvdYypHAs61nKCB7iuJ+2jYmvWoZQ29zY9ZsZ5KUkdbBDl39uVYEd7BjE5/OY5Y
         l+B+G3/3IxfybsJVNm9VknSh3W8TIY2ada/abpzlt2xFQaa0pgbffGrfQWQbjycKbsaB
         qa0xlDGvyXjOALas/JsJvgl5UuVKgsnx/b4x7qUBQClP80iitcuUqXBnonMlFog027zt
         FAqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=aPTzf5HL6XlMg43oACL+Y7oEpiQVSGrjMuW301HOd7w=;
        b=U9PRVy51COm3EKyrMW4Mnm5BzmNxDlSg5PgHyS5NYVpXJgi7sendbihFBw2cDnV1dJ
         yL2dHfZi3pC+3zFcx0I1CXhLMxw089AuuML0YnRacfvoO8mVWsL1pqK6lIdHKt5J6Lr+
         dcA6EjJ9IqADRyzlm2CLAyRknzEVDqosq09sBkN7C0hqAtx8ie7Bb4H37V1OkBq0+1uB
         /Vi7T+kXW8FyrwkWxg5nC7ltyGMDcwf9xG8qmwxfiavUK7d1z4Odr7UirNBC4tZaGNX+
         sbsyme4XqIc5cA9kAs/GiEh6yc040ocyxuOS8w/2Xb30Q8UfAnADpuWjXTBwsyWJGXAB
         ZKtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ez5XJ7h7;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id e65-v6sor2802677oic.158.2018.06.28.07.23.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 28 Jun 2018 07:23:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ez5XJ7h7;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=aPTzf5HL6XlMg43oACL+Y7oEpiQVSGrjMuW301HOd7w=;
        b=ez5XJ7h7rOPJNvNzw6KF2QXRXWZQiLG747aEQ2Wa2M/RzElw/3kPl+nW0o191P0gBb
         qvbBrhqkMWbVjc7a7wxfD8eoaIilVRnT6alv4RWsv8ZLVoEmpIaVFMx9yC+AcCJes8p4
         Llq5HCny7U92ACHN/gCYpkqgKITgWcHUTt9mM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=aPTzf5HL6XlMg43oACL+Y7oEpiQVSGrjMuW301HOd7w=;
        b=j8V6Az4jljy8xPRishHR87h4YsLiJehl6K8V+40P1RGgwHUZz/Sv/S2xUjEmc7eTw5
         rrP8zBSUPDCCor8QODAoPudNUi6fWLLhMQLz1UCdIAYaS1eNL5JxepWMhRRh3tkB7gJ+
         BFxKi+vjN2kURtoGFgX0PGpLF9WaNKQ0zpga9nKDgXxO3U6o8AXnKE0drT5ZEPA3JbfX
         jeiMFNQCknPM/pyb04QbyvfgaEtcmOfjjUW2eSyh70I+U6nzd26NZGC0hlbBNLRpdATt
         wQEVsrZRWdg0i/SogEg1btmzKIFX4yKwYIkdjHQ8FqNxo/z6DTnR8x6453Rp0UGh4pac
         Wdzw==
X-Gm-Message-State: APt69E3N3D5lW7ZELKHCRdu65kTceY/TeV3XL+Zmw93uvt+yGyNfiUZP
	hfRDUt169bFQWmL4XJJNqXrAB25GutFdQfnD4VBOCm1eF04=
X-Google-Smtp-Source: AAOMgpeDy+DPIPt+G3TLDL5YxF91PZ1sJZmSoNjwMEzYc1jfcXCFK3OMvQuwPDF+TiGraTyv7/8ZuyG6tIUQTE6/gkI=
X-Received: by 2002:aca:4ad2:: with SMTP id x201-v6mr5336741oia.11.1530195812526;
 Thu, 28 Jun 2018 07:23:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:902:0:0:0:0:0 with HTTP; Thu, 28 Jun 2018 07:23:11 -0700 (PDT)
In-Reply-To: <20180625160009.17437-4-alex.bennee@linaro.org>
References: <20180625160009.17437-1-alex.bennee@linaro.org> <20180625160009.17437-4-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jun 2018 15:23:11 +0100
Message-ID: <CAFEAcA_DT1a0J8UH0iOAmNQpvkrgMy-cJo-zPdXKrhisSjJxDA@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] target/arm: expose CPUID registers to userspace
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: Sv2p+9baw4nx

On 25 June 2018 at 17:00, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> A number of CPUID registers are exposed to userspace by modern Linux
> kernels thanks to the "ARM64 CPU Feature Registers" ABI. For
> CONFIG_USER_ONLY we don't emulate the kernels trap and emulate but
> instead just lower the read permission to PL0_R (hidden behind the
> PL1U_R macro).
>
> The ID_AA64PFR0_EL1 is a little special as the GIC version is hidden
> from userspace so we can define a ARM_CP_CONST version of the register
> for usermode.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> squash! target/arm: expose CPUID registers to userspace
> ---
>  target/arm/cpu.h    |  7 +++++++
>  target/arm/helper.c | 39 +++++++++++++++++++++++++--------------
>  2 files changed, 32 insertions(+), 14 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index a4507a2d6f..156c811654 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1924,6 +1924,13 @@ static inline bool cptype_valid(int cptype)
>  #define PL0_R (0x02 | PL1_R)
>  #define PL0_W (0x01 | PL1_W)
>
> +/* for AArch64 HWCAP_CPUID to userspace */

The comment here should define what the semantics of this new #define are.

> +#ifdef CONFIG_USER_ONLY
> +#define PL1U_R PL0_R
> +#else
> +#define PL1U_R PL1_R
> +#endif
> +
>  #define PL3_RW (PL3_R | PL3_W)
>  #define PL2_RW (PL2_R | PL2_W)
>  #define PL1_RW (PL1_R | PL1_W)

>  void register_cp_regs_for_features(ARMCPU *cpu)
>  {
> @@ -4934,18 +4936,26 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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
> +             * user-mode HWCAP_CPUID emulation the gic bits are masked
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
> +              .access =3D PL0_R, .type =3D ARM_CP_CONST,
> +              .resetvalue =3D cpu->id_aa64pfr0
> +#endif
> +            },
>              { .name =3D "ID_AA64PFR1_EL1", .state =3D ARM_CP_STATE_AA64,
>                .opc0 =3D 3, .opc1 =3D 0, .crn =3D 0, .crm =3D 4, .opc2 =
=3D 1,
> -              .access =3D PL1_R, .type =3D ARM_CP_CONST,
> +              .access =3D PL1U_R, .type =3D ARM_CP_CONST,
>                .resetvalue =3D cpu->id_aa64pfr1},
>              { .name =3D "ID_AA64PFR2_EL1_RESERVED", .state =3D ARM_CP_ST=
ATE_AA64,
>                .opc0 =3D 3, .opc1 =3D 0, .crn =3D 0, .crm =3D 4, .opc2 =
=3D 2,


The spec says that the values revealed to userspace are masked,
so only certain fields are shown to userspace and others (reserved,
impdef, invisible fields) are masked out and replaced with fixed
values. I don't see where in this patchset we're doing that.

Also, in order to correctly reveal the ID regs to linux-user code,
we need to set them correctly for what we're emulating, which at
the moment we do not if the cpu is 'max' or 'any'. (See the comment
in arm_max_initfn().)

> @@ -4973,11 +4983,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>                .resetvalue =3D 0 },
>              { .name =3D "ID_AA64DFR0_EL1", .state =3D ARM_CP_STATE_AA64,
>                .opc0 =3D 3, .opc1 =3D 0, .crn =3D 0, .crm =3D 5, .opc2 =
=3D 0,
> -              .access =3D PL1_R, .type =3D ARM_CP_CONST,
> +              .access =3D PL1U_R, .type =3D ARM_CP_CONST,
>                .resetvalue =3D cpu->id_aa64dfr0 },
>              { .name =3D "ID_AA64DFR1_EL1", .state =3D ARM_CP_STATE_AA64,
>                .opc0 =3D 3, .opc1 =3D 0, .crn =3D 0, .crm =3D 5, .opc2 =
=3D 1,
> -              .access =3D PL1_R, .type =3D ARM_CP_CONST,
> +              .access =3D PL1U_R, .type =3D ARM_CP_CONST,
>                .resetvalue =3D cpu->id_aa64dfr1 },
>              { .name =3D "ID_AA64DFR2_EL1_RESERVED", .state =3D ARM_CP_ST=
ATE_AA64,
>                .opc0 =3D 3, .opc1 =3D 0, .crn =3D 0, .crm =3D 5, .opc2 =
=3D 2,
> @@ -5005,11 +5015,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>                .resetvalue =3D 0 },
>              { .name =3D "ID_AA64ISAR0_EL1", .state =3D ARM_CP_STATE_AA64=
,
>                .opc0 =3D 3, .opc1 =3D 0, .crn =3D 0, .crm =3D 6, .opc2 =
=3D 0,
> -              .access =3D PL1_R, .type =3D ARM_CP_CONST,
> +              .access =3D PL1U_R, .type =3D ARM_CP_CONST,
>                .resetvalue =3D cpu->id_aa64isar0 },
>              { .name =3D "ID_AA64ISAR1_EL1", .state =3D ARM_CP_STATE_AA64=
,
>                .opc0 =3D 3, .opc1 =3D 0, .crn =3D 0, .crm =3D 6, .opc2 =
=3D 1,
> -              .access =3D PL1_R, .type =3D ARM_CP_CONST,
> +              .access =3D PL1U_R, .type =3D ARM_CP_CONST,
>                .resetvalue =3D cpu->id_aa64isar1 },
>              { .name =3D "ID_AA64ISAR2_EL1_RESERVED", .state =3D ARM_CP_S=
TATE_AA64,
>                .opc0 =3D 3, .opc1 =3D 0, .crn =3D 0, .crm =3D 6, .opc2 =
=3D 2,
> @@ -5037,11 +5047,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>                .resetvalue =3D 0 },
>              { .name =3D "ID_AA64MMFR0_EL1", .state =3D ARM_CP_STATE_AA64=
,
>                .opc0 =3D 3, .opc1 =3D 0, .crn =3D 0, .crm =3D 7, .opc2 =
=3D 0,
> -              .access =3D PL1_R, .type =3D ARM_CP_CONST,
> +              .access =3D PL1U_R, .type =3D ARM_CP_CONST,
>                .resetvalue =3D cpu->id_aa64mmfr0 },
>              { .name =3D "ID_AA64MMFR1_EL1", .state =3D ARM_CP_STATE_AA64=
,
>                .opc0 =3D 3, .opc1 =3D 0, .crn =3D 0, .crm =3D 7, .opc2 =
=3D 1,
> -              .access =3D PL1_R, .type =3D ARM_CP_CONST,
> +              .access =3D PL1U_R, .type =3D ARM_CP_CONST,
>                .resetvalue =3D cpu->id_aa64mmfr1 },
>              { .name =3D "ID_AA64MMFR2_EL1_RESERVED", .state =3D ARM_CP_S=
TATE_AA64,
>                .opc0 =3D 3, .opc1 =3D 0, .crn =3D 0, .crm =3D 7, .opc2 =
=3D 2,
> @@ -5335,7 +5345,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>          ARMCPRegInfo id_v8_midr_cp_reginfo[] =3D {
>              { .name =3D "MIDR_EL1", .state =3D ARM_CP_STATE_BOTH,
>                .opc0 =3D 3, .opc1 =3D 0, .crn =3D 0, .crm =3D 0, .opc2 =
=3D 0,
> -              .access =3D PL1_R, .type =3D ARM_CP_NO_RAW, .resetvalue =
=3D cpu->midr,
> +              .access =3D PL1U_R, .type =3D ARM_CP_NO_RAW, .resetvalue =
=3D cpu->midr,
>                .fieldoffset =3D offsetof(CPUARMState, cp15.c0_cpuid),
>                .readfn =3D midr_read },
>              /* crn =3D 0 op1 =3D 0 crm =3D 0 op2 =3D 4,7 : AArch32 alias=
es of MIDR */
> @@ -5347,7 +5357,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>                .access =3D PL1_R, .resetvalue =3D cpu->midr },
>              { .name =3D "REVIDR_EL1", .state =3D ARM_CP_STATE_BOTH,
>                .opc0 =3D 3, .opc1 =3D 0, .crn =3D 0, .crm =3D 0, .opc2 =
=3D 6,
> -              .access =3D PL1_R, .type =3D ARM_CP_CONST, .resetvalue =3D=
 cpu->revidr },
> +              .access =3D PL1U_R, .type =3D ARM_CP_CONST,
> +              .resetvalue =3D cpu->revidr },

This is a STATE_BOTH register, so just changing the .access value
will reveal the aarch32 cpreg to userspace, which is wrong.

>              REGINFO_SENTINEL
>          };
>          ARMCPRegInfo id_cp_reginfo[] =3D {
> --
> 2.17.1

thanks
-- PMM
