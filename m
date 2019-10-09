Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp814077wrm;
        Wed, 9 Oct 2019 04:49:45 -0700 (PDT)
X-Received: by 2002:a6b:7410:: with SMTP id s16mr2681381iog.35.1570621785743;
        Wed, 09 Oct 2019 04:49:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570621785; cv=none;
        d=google.com; s=arc-20160816;
        b=h+CT86tFUE2hqFvUDvceyJ+u9ugEDsgQ2L85BzPfYgzpGlT5X91Pl89hY7d0EkIeCB
         VquVpLZ5F8qd7VyhJzbsxujZv/zku225nP6/kvF6jjcbNnGWWUiOUmMgW8b4Tq3lVjBC
         4Bmzb0lBbXuvfxvc7N6Dy9jCPy/8EfyqEsy5hu2FTF7purcnD2FXnEuxktPpXxJVfcFL
         TRA9FwQInqXZe8h9FGKJsVd/eGRKta7CHKSOX5vTyaoI/SwTC2zDUUf3S8PnTNdXaHTH
         3sOU2DIR2lsxCCKFJ+w+5+JeEa248i5U1XBehV/f3jZKvlWT0eQAhCGD9DHYbAd9liAc
         aBNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0akdC6ifbO5r1Bkx4nu2fQVSUkpoM1OWF+hL9JHRCno=;
        b=z3HFOeIuA4O2wr3gzLMVhZl0Bha29sOYrVSgyhcuQF83fIq54GbVyxEGk60NCtossd
         6dm7qIkb1JwXqS0hMe5Tfhecz7L2wL21OB1lr/3LYJsHlRqNagsxBrjnGwfb422ksHgM
         VIE/LTPiavox+QR6Z+PbOFoUp23SGx5+sdIu0ZxsxRTFzh8zOMHTaYqGTPVdCoTEr0IC
         HyO3KbipX34zJB0ViQdvkJ1wI5Ry7FfUbxSte7hIPiEoIzx3b8H4zz7AD0vpUXzqCka6
         5obyEtLe6TyOYmiPaLov9NDaP56AJnma1oVPZ7lGlcmRqNvEqkjY0FS8k0sgS8r8PIpc
         osFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NcqAT3b3;
       spf=pass (google.com: domain of beata.michalska@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=beata.michalska@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <beata.michalska@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id p4sor1049793iof.45.2019.10.09.04.49.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 09 Oct 2019 04:49:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of beata.michalska@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NcqAT3b3;
       spf=pass (google.com: domain of beata.michalska@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=beata.michalska@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0akdC6ifbO5r1Bkx4nu2fQVSUkpoM1OWF+hL9JHRCno=;
        b=NcqAT3b3iP1jdtZ9i/4LodHKnk4sh7ZpfMC1gkVkwhaGXM2GGkfgqUA28OKEVDfKgD
         75HELxx//kCiRF3cO7/U6PnBrsuGAWec+d/VrC+0arBf2o/C/S3sjDeJyEgIGsosP6bl
         AyODG8lEc2faqWeqI8YvNF9huuy60JqHdVcgUt8rWvyHYRTNC2XMM1gFqBkmhQ3V9FQY
         lct92oGa3Flr1zgHExWl6OyO3leRSwikPwnVkTp2/uWjPNuR7iY5i0dGdjShvsNoXboV
         F4DLKEOE6hhmoJMuUB/Pe8Sbv7mVHyGSMpsIXBnfVcoOrs49p1fUMTZbI1f6GiUqUBVL
         ITug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0akdC6ifbO5r1Bkx4nu2fQVSUkpoM1OWF+hL9JHRCno=;
        b=nwHYP/ZXeUOiuVTo7ZdC1feoYF0C8MOjWdpO68kM5NkQnkP2oMN/joQyewkSoYzYu9
         ow3DoQpq5QI+m6B1wd09rNjvm3h+O2hfg+h251kYZ6odoO41im1uCoomapnaYJuFIFPl
         iCeWyQsx9STEl5HT71E8MAi4ZjNSAbkQ4UJhrnIG0A4DOhcj/BoLXCwF3vq+w38TkCYq
         xnPtoorXTePu28NkHs1TuN5Wbm2N6HOlIJO96UBMEi6HFCf5X3MYJRS/QMjSl+nXR/5F
         li5558b5I3vb0/puzDygPgFqbAyF7xHyFMHYdbQPb5u79GJ2zHhFvLVGz8CHTBII+Lw/
         Jh3g==
X-Gm-Message-State: APjAAAW9pyRlnTcw3VaByqTdX25nXl/zzHkuenbfGpnHonz7JM6uXfy/
	HYlEXgpXEB6MUYeakViDnjm0yINiAK2WUH3U7RMK38AbglA=
X-Google-Smtp-Source: APXvYqzP9aywJCnt7B0+IRSczfqaZmfqXn4lkRdCajJLpNmgY6YMKnjeOwR9DkcBBej3qEe/UExOiLeto67f3dswalE=
X-Received: by 2002:a5e:c811:: with SMTP id y17mr2783513iol.248.1570621785133;
 Wed, 09 Oct 2019 04:49:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190910095610.4546-1-beata.michalska@linaro.org>
 <20190910095610.4546-5-beata.michalska@linaro.org> <87blvabijl.fsf@linaro.org>
In-Reply-To: <87blvabijl.fsf@linaro.org>
From: Beata Michalska <beata.michalska@linaro.org>
Date: Wed, 9 Oct 2019 12:49:34 +0100
Message-ID: <CADSWDzvD69hEJU2H2aZ44f1wNY_yDk1KLA45Wz8ZwRcKpFQYcw@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 4/4] target/arm: Add support for DC CVAP & DC
 CVADP ins
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, quintela@redhat.com, 
	Richard Henderson <richard.henderson@linaro.org>, 
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, shameerali.kolothum.thodi@huawei.com, 
	eric.auger@redhat.com, qemu-arm@nongnu.org, pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: e2LMTXeIr6xZ

On Tue, 24 Sep 2019 at 02:16, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Beata Michalska <beata.michalska@linaro.org> writes:
>
> > ARMv8.2 introduced support for Data Cache Clean instructions
> > to PoP (point-of-persistence) - DC CVAP and PoDP (point-of-deep-persist=
ence)
> > - DV CVADP. Both specify conceptual points in a memory system where all=
 writes
> > that are to reach them are considered persistent.
> > The support provided considers both to be actually the same so there is=
 no
> > distinction between the two. If none is available (there is no backing =
store
> > for given memory) both will result in Data Cache Clean up to the point =
of
> > coherency. Otherwise sync for the specified range shall be performed.
> >
> > Signed-off-by: Beata Michalska <beata.michalska@linaro.org>
> > ---
> >  linux-user/elfload.c       | 18 +++++++++++++++++-
> >  target/arm/cpu.h           | 13 ++++++++++++-
> >  target/arm/cpu64.c         |  1 +
> >  target/arm/helper.c        | 24 ++++++++++++++++++++++++
> >  target/arm/helper.h        |  1 +
> >  target/arm/op_helper.c     | 36 ++++++++++++++++++++++++++++++++++++
> >  target/arm/translate-a64.c |  5 +++++
> >  7 files changed, 96 insertions(+), 2 deletions(-)
> >
> > diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> > index 3365e192eb..1ec00308d5 100644
> > --- a/linux-user/elfload.c
> > +++ b/linux-user/elfload.c
> > @@ -609,7 +609,12 @@ enum {
> >      ARM_HWCAP_A64_PACG          =3D 1UL << 31,
> >  };
> >
> > +enum {
> > +    ARM_HWCAP2_A64_DCPODP   =3D 1 << 0,
> > +};
> > +
> >  #define ELF_HWCAP get_elf_hwcap()
> > +#define ELF_HWCAP2 get_elf_hwcap2()
> >
> >  static uint32_t get_elf_hwcap(void)
> >  {
> > @@ -644,12 +649,23 @@ static uint32_t get_elf_hwcap(void)
> >      GET_FEATURE_ID(aa64_jscvt, ARM_HWCAP_A64_JSCVT);
> >      GET_FEATURE_ID(aa64_sb, ARM_HWCAP_A64_SB);
> >      GET_FEATURE_ID(aa64_condm_4, ARM_HWCAP_A64_FLAGM);
> > +    GET_FEATURE_ID(aa64_dcpop, ARM_HWCAP_A64_DCPOP);
> >
> > -#undef GET_FEATURE_ID
> >
> >      return hwcaps;
> >  }
> >
> > +static uint32_t get_elf_hwcap2(void)
> > +{
> > +    ARMCPU *cpu =3D ARM_CPU(thread_cpu);
> > +    uint32_t hwcaps =3D 0;
> > +
> > +    GET_FEATURE_ID(aa64_dcpodp, ARM_HWCAP2_A64_DCPODP);
> > +    return hwcaps;
> > +}
> > +
> > +#undef GET_FEATURE_ID
> > +
> >  #endif /* not TARGET_AARCH64 */
> >  #endif /* TARGET_ARM */
> >
> > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > index 297ad5e47a..1713d76590 100644
> > --- a/target/arm/cpu.h
> > +++ b/target/arm/cpu.h
> > @@ -2229,7 +2229,8 @@ static inline uint64_t cpreg_to_kvm_id(uint32_t c=
pregid)
> >  #define ARM_CP_NZCV              (ARM_CP_SPECIAL | 0x0300)
> >  #define ARM_CP_CURRENTEL         (ARM_CP_SPECIAL | 0x0400)
> >  #define ARM_CP_DC_ZVA            (ARM_CP_SPECIAL | 0x0500)
> > -#define ARM_LAST_SPECIAL         ARM_CP_DC_ZVA
> > +#define ARM_CP_DC_CVAP           (ARM_CP_SPECIAL | 0x0600)
> > +#define ARM_LAST_SPECIAL         ARM_CP_DC_CVAP
> >  #define ARM_CP_FPU               0x1000
> >  #define ARM_CP_SVE               0x2000
> >  #define ARM_CP_NO_GDB            0x4000
> > @@ -3572,6 +3573,16 @@ static inline bool isar_feature_aa64_frint(const=
 ARMISARegisters *id)
> >      return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, FRINTTS) !=3D 0;
> >  }
> >
> > +static inline bool isar_feature_aa64_dcpop(const ARMISARegisters *id)
> > +{
> > +    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, DPB) !=3D 0;
> > +}
> > +
> > +static inline bool isar_feature_aa64_dcpodp(const ARMISARegisters *id)
> > +{
> > +    return (FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, DPB) >> 1) !=3D=
 0;
> > +}
> > +
> >  static inline bool isar_feature_aa64_fp16(const ARMISARegisters *id)
> >  {
> >      /* We always set the AdvSIMD and FP fields identically wrt FP16.  =
*/
> > diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> > index d7f5bf610a..20094f980d 100644
> > --- a/target/arm/cpu64.c
> > +++ b/target/arm/cpu64.c
> > @@ -331,6 +331,7 @@ static void aarch64_max_initfn(Object *obj)
> >          cpu->isar.id_aa64isar0 =3D t;
> >
> >          t =3D cpu->isar.id_aa64isar1;
> > +        t =3D FIELD_DP64(t, ID_AA64ISAR1, DPB, 2);
> >          t =3D FIELD_DP64(t, ID_AA64ISAR1, JSCVT, 1);
> >          t =3D FIELD_DP64(t, ID_AA64ISAR1, FCMA, 1);
> >          t =3D FIELD_DP64(t, ID_AA64ISAR1, APA, 1); /* PAuth, architect=
ed only */
> > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > index 507026c915..99ae01b7e7 100644
> > --- a/target/arm/helper.c
> > +++ b/target/arm/helper.c
> > @@ -3843,6 +3843,22 @@ static CPAccessResult aa64_cacheop_access(CPUARM=
State *env,
> >      return CP_ACCESS_OK;
> >  }
> >
> > +static CPAccessResult aa64_cacheop_persist_access(CPUARMState *env,
> > +                                                  const ARMCPRegInfo *=
ri,
> > +                                                  bool isread)
> > +{
> > +    ARMCPU *cpu =3D env_archcpu(env);
> > +    /*
> > +     * Access is UNDEF if lacking implementation for either DC CVAP or=
 DC CVADP
> > +     * DC CVAP ->  CRm: 0xc
> > +     * DC CVADP -> CRm: 0xd
> > +     */
> > +    return (ri->crm =3D=3D 0xc && !cpu_isar_feature(aa64_dcpop, cpu)) =
||
> > +           (ri->crm =3D=3D 0xd && !cpu_isar_feature(aa64_dcpodp, cpu))
> > +           ? CP_ACCESS_TRAP_UNCATEGORIZED
> > +           : aa64_cacheop_access(env, ri, isread);
> > +}
> > +
> >  /* See: D4.7.2 TLB maintenance requirements and the TLB maintenance in=
structions
> >   * Page D4-1736 (DDI0487A.b)
> >   */
> > @@ -4251,6 +4267,14 @@ static const ARMCPRegInfo v8_cp_reginfo[] =3D {
> >        .opc0 =3D 1, .opc1 =3D 3, .crn =3D 7, .crm =3D 10, .opc2 =3D 1,
> >        .access =3D PL0_W, .type =3D ARM_CP_NOP,
> >        .accessfn =3D aa64_cacheop_access },
> > +    { .name =3D "DC_CVAP", .state =3D ARM_CP_STATE_AA64,
> > +      .opc0 =3D 1, .opc1 =3D 3, .crn =3D 7, .crm =3D 12, .opc2 =3D 1,
> > +      .access =3D PL0_W, .type =3D ARM_CP_DC_CVAP,
> > +      .accessfn =3D aa64_cacheop_persist_access },
> > +    { .name =3D "DC_CVADP", .state =3D ARM_CP_STATE_AA64,
> > +      .opc0 =3D 1, .opc1 =3D 3, .crn =3D 7, .crm =3D 13, .opc2 =3D 1,
> > +      .access =3D PL0_W, .type =3D ARM_CP_DC_CVAP,
> > +      .accessfn =3D aa64_cacheop_persist_access },
> >      { .name =3D "DC_CSW", .state =3D ARM_CP_STATE_AA64,
> >        .opc0 =3D 1, .opc1 =3D 0, .crn =3D 7, .crm =3D 10, .opc2 =3D 2,
> >        .access =3D PL1_W, .type =3D ARM_CP_NOP },
> > diff --git a/target/arm/helper.h b/target/arm/helper.h
> > index 1fb2cb5a77..a850364944 100644
> > --- a/target/arm/helper.h
> > +++ b/target/arm/helper.h
> > @@ -561,6 +561,7 @@ DEF_HELPER_FLAGS_3(crypto_sm4ekey, TCG_CALL_NO_RWG,=
 void, ptr, ptr, ptr)
> >  DEF_HELPER_FLAGS_3(crc32, TCG_CALL_NO_RWG_SE, i32, i32, i32, i32)
> >  DEF_HELPER_FLAGS_3(crc32c, TCG_CALL_NO_RWG_SE, i32, i32, i32, i32)
> >  DEF_HELPER_2(dc_zva, void, env, i64)
> > +DEF_HELPER_2(dc_cvap, void, env, i64)
> >
> >  DEF_HELPER_FLAGS_2(neon_pmull_64_lo, TCG_CALL_NO_RWG_SE, i64, i64, i64=
)
> >  DEF_HELPER_FLAGS_2(neon_pmull_64_hi, TCG_CALL_NO_RWG_SE, i64, i64, i64=
)
> > diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
> > index 0fd4bd0238..75ebf6afa4 100644
> > --- a/target/arm/op_helper.c
> > +++ b/target/arm/op_helper.c
> > @@ -987,3 +987,39 @@ void HELPER(dc_zva)(CPUARMState *env, uint64_t vad=
dr_in)
> >      memset(g2h(vaddr), 0, blocklen);
> >  #endif
> >  }
> > +
> > +void HELPER(dc_cvap)(CPUARMState *env, uint64_t vaddr_in)
> > +{
> > +#ifndef CONFIG_USER_ONLY
>
> Are we essentially saying the operation is a NOP for user-mode
> emulation? Is it just because we don't really expose HW to linux-user?
>
> If so move the #ifndef outside the HELPER definition and...
>

I do not think there is a way to specify persistent mem for user mode.
Or am I mistaken ?
I will move the switch to the HELPER def.

> > +    ARMCPU *cpu =3D env_archcpu(env);
> > +    /* CTR_EL0 System register -> DminLine, bits [19:16] */
> > +    uint64_t dline_size =3D 4 << ((cpu->ctr >> 16) & 0xF);
> > +    uint64_t vaddr =3D vaddr_in & ~(dline_size - 1);
> > +    void *haddr;
> > +    int mem_idx =3D cpu_mmu_index(env, false);
> > +
> > +    /* This won't be crossing page boundaries */
> > +    haddr =3D probe_read(env, vaddr, dline_size, mem_idx, GETPC());
> > +    if (haddr) {
> > +
> > +        ram_addr_t offset;
> > +        MemoryRegion *mr;
> > +
> > +        /*
> > +         * RCU critical section + ref counting,
> > +         * so that MR won't disappear behind the scene
> > +         */
> > +        rcu_read_lock();
> > +        mr =3D memory_region_from_host(haddr, &offset);
> > +        if (mr) {
> > +            memory_region_ref(mr);
> > +        }
> > +        rcu_read_unlock();
> > +
> > +        if (mr) {
> > +            memory_region_do_writeback(mr, offset, dline_size);
> > +            memory_region_unref(mr);
> > +        }
> > +    }
> > +#endif
> > +}
> > diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> > index 2d6cd09634..21ea3631d6 100644
> > --- a/target/arm/translate-a64.c
> > +++ b/target/arm/translate-a64.c
> > @@ -1746,6 +1746,11 @@ static void handle_sys(DisasContext *s, uint32_t=
 insn, bool isread,
> >          tcg_rt =3D cpu_reg(s, rt);
> >          gen_helper_dc_zva(cpu_env, tcg_rt);
> >          return;
> > +    case ARM_CP_DC_CVAP:
> > +        /* DC CVAP / DC CVADP */
>
> .. #ifndef CONFIG_USER_ONLY this code so we don't add the overhead of a
> helper call in linux-user mode.

Noted.
>
> > +        tcg_rt =3D cpu_reg(s, rt);
> > +        gen_helper_dc_cvap(cpu_env, tcg_rt);
> > +        return;
> >      default:
> >          break;
> >      }
>
>
> --
> Alex Benn=C3=A9e

Thank you,

BR
Beata
