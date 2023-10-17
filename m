Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3958450ejc;
        Tue, 17 Oct 2023 07:24:54 -0700 (PDT)
X-Received: by 2002:ac2:5f54:0:b0:503:7dd:7ebd with SMTP id 20-20020ac25f54000000b0050307dd7ebdmr1693284lfz.24.1697552694440;
        Tue, 17 Oct 2023 07:24:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697552694; cv=none;
        d=google.com; s=arc-20160816;
        b=vy0W31K8itSPnfgEg5mHPB9m7mSOGcesARZEul6MxEyTc64T1jyQnFmaLJyWZq/fDF
         Aiw7AZLryC6Xa0XpcGv5/kCwif41KwyWgkJWuyUlSSwddEcjzLmvMNVsis2Io1Nkg9Ux
         n8GBzxcx9HkmqOwoH9zXkhTDAfGxAFT7ChR400WeJESXkbLTZvEpgtA9OHohfbq6SgIc
         6s3JkNz/T/KoTRKY12wZLevc/y5UKfkarFkCTfRjkW1gUXjjxb79Z0GJvFz3BRRc+5NE
         iYKUhRHYBV6x0MTpAwtGYi/1OXfg5DzhzBiOA6BuBUnn/fscFqDGvZ9O085xXsecNU4z
         Bpbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VP+Bc7Qr1lCxWV8ncOwMur5ivxl1AKWpiTU4zWjFipk=;
        fh=CweM1UHkRcLmTkllDe3lrwtdR4z1B0X2bbuIWCVBSyk=;
        b=fb6KhA2iNs/D4jadzrmiWUvBvDAyTfhyPNoG2bPSxoLS7ehebFMc3mfNY5kuRREqrC
         3g6AwPbHfHEoFcpzZ1D+gzG+NDE+gEFs+jPq73jdBFPq46EhKp20GjstaHYImqcGW+MZ
         vzD3I39pQ5CQShXHOLJjnQqcNWLOL/YnAgITDFXN3rWoPjOcDW4Ii4ydx1Shctsdj3Fw
         +v7pvBthnMxRUYlDL6FuEESEdjTW6AL0ZTN2sVI48QRu8Hl/ruHBfqq8XoH94RYE+QQD
         TahgcR9rTgulljZfDxd35yNgEphgF5F0dkquiSelzV9vJNgAauZYF80fOflqrMDDslie
         GfnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=So9cZYx1;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 8-20020ac25f48000000b005056f65d424sor500592lfz.0.2023.10.17.07.24.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 17 Oct 2023 07:24:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=So9cZYx1;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697552693; x=1698157493; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VP+Bc7Qr1lCxWV8ncOwMur5ivxl1AKWpiTU4zWjFipk=;
        b=So9cZYx19Ast6PRY7J3xA86RaLv8mGMUxah1XsofUvgZnZrNRzlm/M+4U8bZeg4DWS
         w3atG0J1VijH0AmHB23nBpXQ6fNQJaRMzBhmXaQq3Ol9K8DAwUemmtD8VBdgOmtn6lIs
         Da1MvfSVvdMPJY2GLZqU94vK2hWsY5cuWUk6+LMzXuMNVqWZUpqfTX3XZUEoNS3XrIOB
         U5sOO6L1iin1DjMBejqQxMSG2lHq6MyLO3tmNJoiFqdlMZqqjiDMynGJTxqG6ErPu9Kt
         f0mupqFDWqLHmW5NjZ1sQGii0dKOmtE/Q3nAL/b+tQj1TdEurFwPZtLakHpxLwlmAf2W
         PFJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697552693; x=1698157493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VP+Bc7Qr1lCxWV8ncOwMur5ivxl1AKWpiTU4zWjFipk=;
        b=DrjMLHEcpR9BvydztCWmFpYMYGJPB8qKUvdVCzoSeUOhOuyKqpM3G8/oIWeBywFoxr
         mEd1zoMNtcobrcmp66pvoPWOHiYq2OMfrMiL4bSMPYcBz6gGqeJ6zYQpCy1qOS0amaQt
         Fk/48ln8daikRPDN+6rtEeDG/7oVgazMzj2P6y46PfRMEqRDZ3G3gnBak1NcIo5cjTzP
         c7kRRCQGvbrUjAs6v1EdjRxVqIokT3+y5jy2MKlXU/qKtpnVRTKDSZP43gQf/PDHNlYZ
         AhWBbnjP0Uh9u2+Aroydp54V+4pn1wOEc0f/agKKFLWSaLMPmVvleBvWCw/RzNeG2QfF
         Vr0g==
X-Gm-Message-State: AOJu0YzC8JX3iGSFDYNQBIl3ucSp6/Ph3nNT6cA/V46MsSyhrVdcC7zh
	WsDWfK9f4Nx78YAU7bQqXWTcfzHP/B6Brc+dglG/2WEjdTVG87ngf84=
X-Google-Smtp-Source: AGHT+IG0WN+T6Xzp962N7hB/W9C45vJqjHIPR/MUEiCnt7vZem+j2CAlH2+DUYcY1BjE96+zaekU9NZapamnPIcKDZ0=
X-Received: by 2002:a05:6512:3b0c:b0:507:9693:12aa with SMTP id
 f12-20020a0565123b0c00b00507969312aamr2572573lfv.15.1697552693482; Tue, 17
 Oct 2023 07:24:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230915185453.1871167-1-peter.maydell@linaro.org>
 <20230915185453.1871167-3-peter.maydell@linaro.org> <87edhtbbod.fsf@linaro.org>
In-Reply-To: <87edhtbbod.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Oct 2023 15:24:42 +0100
Message-ID: <CAFEAcA9pbOuo0uRXLMCngkbF+jpDKRivZ=y66xn1KHunC--zrw@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/arm: Implement Neoverse N2 CPU model
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, 
	Leif Lindholm <quic_llindhol@quicinc.com>, Radoslaw Biernacki <rad@semihalf.com>, qemu-arm@nongnu.org, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: J65jj+uVF6h+

On Tue, 17 Oct 2023 at 14:50, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > Implement a model of the Neoverse N2 CPU. This is an Armv9.0-A
> > processor very similar to the Cortex-A710. The differences are:
> >  * no FEAT_EVT
> >  * FEAT_DGH (data gathering hint)
> >  * FEAT_NV (not yet implemented in QEMU)
> >  * Statistical Profiling Extension (not implemented in QEMU)
> >  * 48 bit physical address range, not 40
> >  * CTR_EL0.DIC =3D 1 (no explicit icache cleaning needed)
> >  * PMCR_EL0.N =3D 6 (always 6 PMU counters, not 20)
> >
> > Because it has 48-bit physical address support, we can use
> > this CPU in the sbsa-ref board as well as the virt board.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  docs/system/arm/virt.rst |   1 +
> >  hw/arm/sbsa-ref.c        |   1 +
> >  hw/arm/virt.c            |   1 +
> >  target/arm/tcg/cpu64.c   | 103 +++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 106 insertions(+)
> >
> > diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
> > index e1697ac8f48..7c4c80180c6 100644
> > --- a/docs/system/arm/virt.rst
> > +++ b/docs/system/arm/virt.rst
> > @@ -63,6 +63,7 @@ Supported guest CPU types:
> >  - ``host`` (with KVM only)
> >  - ``neoverse-n1`` (64-bit)
> >  - ``neoverse-v1`` (64-bit)
> > +- ``neoverse-n2`` (64-bit)
> >  - ``max`` (same as ``host`` for KVM; best possible emulation with TCG)
> >
> >  Note that the default is ``cortex-a15``, so for an AArch64 guest you m=
ust
> > diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> > index bc89eb48062..4db287287e1 100644
> > --- a/hw/arm/sbsa-ref.c
> > +++ b/hw/arm/sbsa-ref.c
> > @@ -154,6 +154,7 @@ static const char * const valid_cpus[] =3D {
> >      ARM_CPU_TYPE_NAME("cortex-a72"),
> >      ARM_CPU_TYPE_NAME("neoverse-n1"),
> >      ARM_CPU_TYPE_NAME("neoverse-v1"),
> > +    ARM_CPU_TYPE_NAME("neoverse-n2"),
> >      ARM_CPU_TYPE_NAME("max"),
> >  };
> >
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index 8ad78b23c24..42253462735 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -215,6 +215,7 @@ static const char *valid_cpus[] =3D {
> >      ARM_CPU_TYPE_NAME("a64fx"),
> >      ARM_CPU_TYPE_NAME("neoverse-n1"),
> >      ARM_CPU_TYPE_NAME("neoverse-v1"),
> > +    ARM_CPU_TYPE_NAME("neoverse-n2"),
> >  #endif
> >      ARM_CPU_TYPE_NAME("cortex-a53"),
> >      ARM_CPU_TYPE_NAME("cortex-a57"),
> > diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
> > index ea43cf3c1ee..370cc82f0ef 100644
> > --- a/target/arm/tcg/cpu64.c
> > +++ b/target/arm/tcg/cpu64.c
> > @@ -963,6 +963,108 @@ static void aarch64_a710_initfn(Object *obj)
> >      aarch64_add_sve_properties(obj);
> >  }
> >
> > +/* Extra IMPDEF regs in the N2 beyond those in the A710 */
> > +static const ARMCPRegInfo neoverse_n2_cp_reginfo[] =3D {
> > +    { .name =3D "CPURNDBR_EL3", .state =3D ARM_CP_STATE_AA64,
> > +      .opc0 =3D 3, .opc1 =3D 6, .crn =3D 15, .crm =3D 3, .opc2 =3D 0,
> > +      .access =3D PL3_RW, .type =3D ARM_CP_CONST, .resetvalue =3D 0 },
> > +    { .name =3D "CPURNDPEID_EL3", .state =3D ARM_CP_STATE_AA64,
> > +      .opc0 =3D 3, .opc1 =3D 6, .crn =3D 15, .crm =3D 3, .opc2 =3D 1,
> > +      .access =3D PL3_RW, .type =3D ARM_CP_CONST, .resetvalue =3D 0 },
> > +};
> > +
> > +static void aarch64_neoverse_n2_initfn(Object *obj)
> > +{
> > +    ARMCPU *cpu =3D ARM_CPU(obj);
> > +
> > +    cpu->dtb_compatible =3D "arm,neoverse-n2";
> > +    set_feature(&cpu->env, ARM_FEATURE_V8);
> > +    set_feature(&cpu->env, ARM_FEATURE_NEON);
> > +    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> > +    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
> > +    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
> > +    set_feature(&cpu->env, ARM_FEATURE_EL2);
> > +    set_feature(&cpu->env, ARM_FEATURE_EL3);
> > +    set_feature(&cpu->env, ARM_FEATURE_PMU);
> > +
> > +    /* Ordered by Section B.5: AArch64 ID registers */
> > +    cpu->midr          =3D 0x410FD493; /* r0p3 */
> > +    cpu->revidr        =3D 0;
> > +    cpu->isar.id_pfr0  =3D 0x21110131;
> > +    cpu->isar.id_pfr1  =3D 0x00010000; /* GIC filled in later */
> > +    cpu->isar.id_dfr0  =3D 0x16011099;
> > +    cpu->id_afr0       =3D 0;
> > +    cpu->isar.id_mmfr0 =3D 0x10201105;
> > +    cpu->isar.id_mmfr1 =3D 0x40000000;
> > +    cpu->isar.id_mmfr2 =3D 0x01260000;
> > +    cpu->isar.id_mmfr3 =3D 0x02122211;
> > +    cpu->isar.id_isar0 =3D 0x02101110;
> > +    cpu->isar.id_isar1 =3D 0x13112111;
> > +    cpu->isar.id_isar2 =3D 0x21232042;
> > +    cpu->isar.id_isar3 =3D 0x01112131;
> > +    cpu->isar.id_isar4 =3D 0x00010142;
> > +    cpu->isar.id_isar5 =3D 0x11011121; /* with Crypto */
> > +    cpu->isar.id_mmfr4 =3D 0x01021110;
> > +    cpu->isar.id_isar6 =3D 0x01111111;
> > +    cpu->isar.mvfr0    =3D 0x10110222;
> > +    cpu->isar.mvfr1    =3D 0x13211111;
> > +    cpu->isar.mvfr2    =3D 0x00000043;
> > +    cpu->isar.id_pfr2  =3D 0x00000011;
> > +    cpu->isar.id_aa64pfr0  =3D 0x1201111120111112ull; /* GIC filled in=
 later */
> > +    cpu->isar.id_aa64pfr1  =3D 0x0000000000000221ull;
> > +    cpu->isar.id_aa64zfr0  =3D 0x0000110100110021ull; /* with Crypto *=
/
> > +    cpu->isar.id_aa64dfr0  =3D 0x000011f210305619ull;
> > +    cpu->isar.id_aa64dfr1  =3D 0;
> > +    cpu->id_aa64afr0       =3D 0;
> > +    cpu->id_aa64afr1       =3D 0;
> > +    cpu->isar.id_aa64isar0 =3D 0x0221111110212120ull; /* with Crypto *=
/
> > +    cpu->isar.id_aa64isar1 =3D 0x0011111101211052ull;
> > +    cpu->isar.id_aa64mmfr0 =3D 0x0000022200101125ull;
> > +    cpu->isar.id_aa64mmfr1 =3D 0x0000000010212122ull;
> > +    cpu->isar.id_aa64mmfr2 =3D 0x1221011112101011ull;
> > +    cpu->clidr             =3D 0x0000001482000023ull;
> > +    cpu->gm_blocksize      =3D 4;
> > +    cpu->ctr               =3D 0x00000004b444c004ull;
> > +    cpu->dcz_blocksize     =3D 4;
> > +    /* TODO FEAT_MPAM: mpamidr_el1 =3D 0x0000_0001_001e_01ff */
>
> Jonathan mentioned he was hacking about with MPAM so if there is a stub
> implementation of the fields it would be nice to add them.

I'm just following the existing A710 code here. There isn't
a stub implementation of the fields, which is why there's
just a TODO comment documenting the ID register value.

> > +
> > +    /* Section B.7.2: PMCR_EL0 */
> > +    cpu->isar.reset_pmcr_el0 =3D 0x3000;  /* with 6 counters */
> > +
> > +    /* Section B.8.9: ICH_VTR_EL2 */
> > +    cpu->gic_num_lrs =3D 4;
> > +    cpu->gic_vpribits =3D 5;
> > +    cpu->gic_vprebits =3D 5;
> > +    cpu->gic_pribits =3D 5;
> > +
> > +    /* Section 14: Scalable Vector Extensions support */
> > +    cpu->sve_vq.supported =3D 1 << 0;  /* 128bit */
> > +
> > +    /*
> > +     * The Neoverse N2 TRM does not list CCSIDR values.  The layout of
> > +     * the caches are in text in Table 7-1, Table 8-1, and Table 9-1.
> > +     *
> > +     * L1: 4-way set associative 64-byte line size, total 64K.
> > +     * L2: 8-way set associative 64 byte line size, total either 512K =
or 1024K.
> > +     */
> > +    cpu->ccsidr[0] =3D make_ccsidr64(4, 64, 64 * KiB);   /* L1 dcache =
*/
> > +    cpu->ccsidr[1] =3D cpu->ccsidr[0];                   /* L1 icache =
*/
> > +    cpu->ccsidr[2] =3D make_ccsidr64(8, 64, 512 * KiB);  /* L2 cache *=
/
> > +
> > +    /* FIXME: Not documented -- copied from neoverse-v1 */
> > +    cpu->reset_sctlr =3D 0x30c50838;
>
> Hmm reset_sctlr might need to be bigger because being used for sctlr_el3
> is a 64 bit entity which has a number of fields:

In theory, yes. In practice, only if we get to a point where we
want to set some bit in the top 32 bits, which we don't yet.

>
>   - DSSBS,bit[44] to have some sort of impdef value
>   - the others all look like architecturally UNKNOWN values
>
> Otherwise I think this is:
>
>   - 3 - RES1 29:28
>   - 0 - RES0 + I assume LE EE bit
>   - c - RES1 23, EIS 22 (architecturally UNKNOWN on reset)
>   - 5 - RES1 18, 16
>   - 0 - RES0 15:14, EnDB 13 (architecturally UNKNOWN on reset), I 12 RES0
>   - 8 - EOS 11 (architecturally UNKNOWN on reset)
>   - 3 - RES1 5:4
>   - 8 - SA 3 (architecturally UNKNOWN on reset)
>
> It's a little confusing because the language describing these
> architecturally unknown states refers to resetting to EL3 (I assume a
> decent firmware would make sure everything is set correctly). Which
> makes me wonder if reset_sctlr is really "sane values for a direct
> kernel boot"?

It's the hardware reset value, at least nominally speaking.
We use the value for our SCTLR_EL1 if we aren't emulating EL2 or EL3,
which means we diverge a little from the hardware which probably doesn't
support an EL1-only config.

To the extent that we need to set values here for kernel boot, we would
do that in hw/arm/boot.c. But mostly we don't, because the kernel sets
up the SCTLR register for the EL it is entered in.

This used to be a bit better defined on older CPUs when previous
versions of the architecture weren't so loose about values being
UNKNOWN on reset. It's unfortunate that we don't have the documented
value for whatever the IMPDEF reset value is for this CPU. In
practice, because it's IMPDEF and UNKNOWN it doesn't matter too much --
guest software will set it as needed. The value used here is "safe"
because it's one we already use for other CPUs.

> > +
> > +    /*
> > +     * The Neoverse N2 has all of the Cortex-A710 IMPDEF registers,
> > +     * and a few more RNG related ones.
> > +     */
> > +    define_arm_cp_regs(cpu, cortex_a710_cp_reginfo);
> > +    define_arm_cp_regs(cpu, neoverse_n2_cp_reginfo);
> > +
> > +    aarch64_add_pauth_properties(obj);
> > +    aarch64_add_sve_properties(obj);
> > +}
> > +
> >  /*
> >   * -cpu max: a CPU with as many features enabled as our emulation supp=
orts.
> >   * The version of '-cpu max' for qemu-system-arm is defined in cpu32.c=
;
> > @@ -1159,6 +1261,7 @@ static const ARMCPUInfo aarch64_cpus[] =3D {
> >      { .name =3D "a64fx",              .initfn =3D aarch64_a64fx_initfn=
 },
> >      { .name =3D "neoverse-n1",        .initfn =3D aarch64_neoverse_n1_=
initfn },
> >      { .name =3D "neoverse-v1",        .initfn =3D aarch64_neoverse_v1_=
initfn },
> > +    { .name =3D "neoverse-n2",        .initfn =3D aarch64_neoverse_n2_=
initfn },
> >  };
> >
> >  static void aarch64_cpu_register_types(void)

thanks
-- PMM
