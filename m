Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp751587wrd;
        Wed, 29 Aug 2018 08:31:41 -0700 (PDT)
X-Google-Smtp-Source: ANB0Vdb5IgwW0ldGaJLKF7dErQ6HzMP1siOQUL2ireKvQaeqK3mR41X0v5RWJoyY/qCMb37e69zM
X-Received: by 2002:aed:33a2:: with SMTP id v31-v6mr3481291qtd.33.1535556701718;
        Wed, 29 Aug 2018 08:31:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535556701; cv=none;
        d=google.com; s=arc-20160816;
        b=g8+dlBom1sw2cowvcXgaViXJMC6N/JIwf5/08g8DDF7Zpw28Jgglew54nj0uY++rQ5
         kOjBxsbGpVD8TimKCiwG6fmjuaFhniNkhWU+lFtOkG2b2ml2gVbLpBJlrdhVWBeJD+on
         Y/kIZof0gM8DwzB051+CnIRpuPSBMkBwBLth94UMxZlnzBViox0RPUZ5RZLFaG5judfS
         YAzhqrDw9I+Q/FSZUvKiYiaTk0p4+wo5cIPQ0uabwXQRZJedglBo+Y8i/rkI6TksLSwH
         uipezlb35DyOr3eiJau13VCOXQV8y5vBR4ai8lHw4o7GKqnl3DCAosh9bCpva2Wv6ll5
         3uwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=r+pZ21sVPp8xH0S4UImUdsreToM91+qoFQcj9oclnH8=;
        b=sbYN1k5gHoBx+Fcd+9sCfXR88nBpILY72WBgzaWTJs59uX9qgNRYN+nYJOsYEhCWye
         uHRllyhbHz+ue3AEICukun0qb3iZTOb4zQmfJuCHMPtMi/MzUMqS7NhOqp40BNBMHfCR
         skG5dGg4GOYtxwaVFC/Ai75y51ID3hYetLSY2Rg95gGkirDiqBa6GDnZ3i46dqyl1q/U
         bnIX/uPGqg+yFqh6yKEswzrTOiVAbUYwAA6Ov8tYS36XJ5CcxtPPS/fPt/aKsD+c67W7
         FXKF18G6U60OhGQ+FH7hrSN/R5Ce8Tc/GmtHhYCAmuXhZpoFgoy6jWZr9MnrvCvM5Pp2
         xWIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZU1hFA1y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i20-v6si4014857qvg.81.2018.08.29.08.31.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 29 Aug 2018 08:31:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZU1hFA1y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43599 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fv2RZ-0002ns-9v
	for alex.bennee@linaro.org; Wed, 29 Aug 2018 11:31:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59922)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1fv2RN-0002nR-Lo
	for qemu-arm@nongnu.org; Wed, 29 Aug 2018 11:31:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1fv2RM-0005vF-EI
	for qemu-arm@nongnu.org; Wed, 29 Aug 2018 11:31:29 -0400
Received: from mail-qt0-x22d.google.com ([2607:f8b0:400d:c0d::22d]:38078)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aclindsa@gmail.com>)
	id 1fv2RM-0005sz-7g; Wed, 29 Aug 2018 11:31:28 -0400
Received: by mail-qt0-x22d.google.com with SMTP id x7-v6so6209015qtk.5;
	Wed, 29 Aug 2018 08:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=r+pZ21sVPp8xH0S4UImUdsreToM91+qoFQcj9oclnH8=;
	b=ZU1hFA1y8uRL4ZuIyEpOjeqcIvTwMWPuKtqLwaSSOZBQuAfVC2UaaE2RsgZH7Dm8nL
	T1jyT7Bi8L53dQMfCHzx8E3yuCyuxFnB84Y3B7x+hPQxcSp4t3Whq0NH3XhGhl4BzIM+
	yYYOKLYxbViG3AKvTEnkohA0uyoU8FzkSoxVJWp1uscy0ku2NzaxoAehH8od1Gih5zTi
	aatZFNdIVkDAMnh0VDncTe2ujDeW5Utjinxrg4qALOlAdPgrKcuqVjtMEQCS1yEx1DkB
	30QdoN1g0SDm4O7qLD90z1SabqGHr4b2RriW9IYEvvZmooYXAgUjbqRaL19x9RIeiA3q
	mkrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=r+pZ21sVPp8xH0S4UImUdsreToM91+qoFQcj9oclnH8=;
	b=YHT0Ije0V3+KBgF14OrNMVE9eNwdqJfOAY/oCNlip/OG43r8wXKh2uy4LlrRfsDYdJ
	Fo9D7uluNqK+3vKLM2Zgk/McitBxcWsI4TCIHzuVqJsxXp1BegHGpGwKwAYAru19wL27
	BfVO+B7n+lxM/uvwdB8eOGAp7a+5iBTOHNX3AoIQ5PQZNlnttx1FhG8ZJ+oIvqbwD7Ds
	H7e/L14Vo57xSSHiqQRoJXTfO5WEkmI9OmtPpA3i9isGjyy08WN0jQLujYWI8j7/dyPz
	vQD+a3GF443iVpgn1uHKqzZy2uoc/XY/gj+oZQaJSuUJL9r5gNEuWGfIEgUvJ7M41DQe
	7BlA==
X-Gm-Message-State: APzg51DzNN6D2e/KIHI3Y4mmBeyMIf8ss3JvJJw6Xo3rdskHQ6YsHMRB
	wAl0lgfgOtX5Pbvnjpmfou0=
X-Received: by 2002:aed:3baf:: with SMTP id
	r44-v6mr7172696qte.77.1535556687724; 
	Wed, 29 Aug 2018 08:31:27 -0700 (PDT)
Received: from okra.localdomain ([2600:3c03::f03c:91ff:febb:cdda])
	by smtp.gmail.com with ESMTPSA id
	q26-v6sm2903646qta.18.2018.08.29.08.31.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 29 Aug 2018 08:31:27 -0700 (PDT)
Date: Wed, 29 Aug 2018 11:31:26 -0400
From: Aaron Lindsay <aclindsa@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180829153126.GE3671@okra.localdomain>
References: <1529699547-17044-1-git-send-email-alindsay@codeaurora.org>
	<1529699547-17044-9-git-send-email-alindsay@codeaurora.org>
	<CAFEAcA_O5f7Ao4cfCD8XMD5y0bb4g8P4mMz-k573FoXJwZz0qg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_O5f7Ao4cfCD8XMD5y0bb4g8P4mMz-k573FoXJwZz0qg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22d
Subject: Re: [Qemu-arm] [PATCH v5 08/13] target/arm: Finish implementation
 of PM[X]EVCNTR and PM[X]EVTYPER
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Aaron Lindsay <alindsay@amperecomputing.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r4x+ybTliRjm

On Jul 17 17:17, Peter Maydell wrote:
> On 22 June 2018 at 21:32, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> > Add arrays to hold the registers, the definitions themselves, access
> > functions, and logic to reset counters when PMCR.P is set. Update
> > filtering code to support counters other than PMCCNTR.
> >
> > Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> > ---
> >  target/arm/cpu.h    |   3 +
> >  target/arm/helper.c | 224 +++++++++++++++++++++++++++++++++++++++++++++++-----
> >  2 files changed, 209 insertions(+), 18 deletions(-)
> >
> > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > index 430b8d5..c240b38 100644
> > --- a/target/arm/cpu.h
> > +++ b/target/arm/cpu.h
> > @@ -481,6 +481,9 @@ typedef struct CPUARMState {
> >           * pmccntr_op_finish.
> >           */
> >          uint64_t c15_ccnt_delta;
> > +        uint64_t c14_pmevcntr[31];
> > +        uint64_t c14_pmevcntr_delta[31];
> > +        uint64_t c14_pmevtyper[31];
> >          uint64_t pmccfiltr_el0; /* Performance Monitor Filter Register */
> >          uint64_t vpidr_el2; /* Virtualization Processor ID Register */
> >          uint64_t vmpidr_el2; /* Virtualization Multiprocessor ID Register */
> > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > index 9f81747..f1fd21c 100644
> > --- a/target/arm/helper.c
> > +++ b/target/arm/helper.c
> > @@ -938,6 +938,7 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
> >  #define PMCRDP  0x10
> >  #define PMCRD   0x8
> >  #define PMCRC   0x4
> > +#define PMCRP   0x2
> >  #define PMCRE   0x1
> >
> >  #define PMXEVTYPER_P          0x80000000
> > @@ -1120,9 +1121,11 @@ static inline bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
> >          prohibited = env->cp15.c9_pmcr & PMCRDP;
> >      }
> >
> > -    /* TODO Remove assert, set filter to correct PMEVTYPER */
> > -    assert(counter == 31);
> > -    filter = env->cp15.pmccfiltr_el0;
> > +    if (counter == 31) {
> > +        filter = env->cp15.pmccfiltr_el0;
> > +    } else {
> > +        filter = env->cp15.c14_pmevtyper[counter];
> > +    }
> >
> >      p   = filter & PMXEVTYPER_P;
> >      u   = filter & PMXEVTYPER_U;
> > @@ -1142,6 +1145,21 @@ static inline bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
> >          filtered = m != p;
> >      }
> >
> > +    if (counter != 31) {
> > +        /* If not checking PMCCNTR, ensure the counter is setup to an event we
> > +         * support */
> 
> Please use the right format for multiline comments (here and below).

Fixed.

> 
> >  static void pmuserenr_write(CPUARMState *env, const ARMCPRegInfo *ri,
> >                              uint64_t value)
> >  {
> > @@ -1552,16 +1698,23 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
> >        .fieldoffset = offsetof(CPUARMState, cp15.pmccfiltr_el0),
> >        .resetvalue = 0, },
> >      { .name = "PMXEVTYPER", .cp = 15, .crn = 9, .crm = 13, .opc1 = 0, .opc2 = 1,
> > -      .access = PL0_RW, .type = ARM_CP_NO_RAW, .accessfn = pmreg_access,
> > +      .access = PL0_RW, .type = ARM_CP_NO_RAW | ARM_CP_IO,
> > +      .accessfn = pmreg_access,
> >        .writefn = pmxevtyper_write, .readfn = pmxevtyper_read },
> >      { .name = "PMXEVTYPER_EL0", .state = ARM_CP_STATE_AA64,
> >        .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 13, .opc2 = 1,
> > -      .access = PL0_RW, .type = ARM_CP_NO_RAW, .accessfn = pmreg_access,
> > +      .access = PL0_RW, .type = ARM_CP_NO_RAW | ARM_CP_IO,
> > +      .accessfn = pmreg_access,
> >        .writefn = pmxevtyper_write, .readfn = pmxevtyper_read },
> > -    /* Unimplemented, RAZ/WI. */
> >      { .name = "PMXEVCNTR", .cp = 15, .crn = 9, .crm = 13, .opc1 = 0, .opc2 = 2,
> > -      .access = PL0_RW, .type = ARM_CP_CONST, .resetvalue = 0,
> > -      .accessfn = pmreg_access_xevcntr },
> > +      .access = PL0_RW, .type = ARM_CP_NO_RAW | ARM_CP_IO,
> > +      .accessfn = pmreg_access_xevcntr,
> > +      .writefn = pmxevcntr_write, .readfn = pmxevcntr_read },
> > +    { .name = "PMXEVCNTR_EL0", .state = ARM_CP_STATE_AA64,
> > +      .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 13, .opc2 = 2,
> > +      .access = PL0_RW, .type = ARM_CP_NO_RAW | ARM_CP_IO,
> > +      .accessfn = pmreg_access_xevcntr,
> > +      .writefn = pmxevcntr_write, .readfn = pmxevcntr_read },
> >      { .name = "PMUSERENR", .cp = 15, .crn = 9, .crm = 14, .opc1 = 0, .opc2 = 0,
> >        .access = PL0_R | PL1_RW, .accessfn = access_tpm,
> >        .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmuserenr),
> > @@ -4250,7 +4403,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
> >  #endif
> >      /* The only field of MDCR_EL2 that has a defined architectural reset value
> >       * is MDCR_EL2.HPMN which should reset to the value of PMCR_EL0.N; but we
> > -     * don't impelment any PMU event counters, so using zero as a reset
> > +     * don't implement any PMU event counters, so using zero as a reset
> >       * value for MDCR_EL2 is okay
> >       */
> >      { .name = "MDCR_EL2", .state = ARM_CP_STATE_BOTH,
> > @@ -5062,6 +5215,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
> >          define_arm_cp_regs(cpu, pmovsset_cp_reginfo);
> >      }
> >      if (arm_feature(env, ARM_FEATURE_V7)) {
> > +        unsigned int i;
> >          /* v7 performance monitor control register: same implementor
> >           * field as main ID register, and we implement only the cycle
> >           * count register.
> > @@ -5086,6 +5240,40 @@ void register_cp_regs_for_features(ARMCPU *cpu)
> >          };
> >          define_one_arm_cp_reg(cpu, &pmcr);
> >          define_one_arm_cp_reg(cpu, &pmcr64);
> > +        for (i = 0; i < 31; i++) {
> > +            char *pmevcntr_name = g_strdup_printf("PMEVCNTR%d", i);
> > +            char *pmevcntr_el0_name = g_strdup_printf("PMEVCNTR%d_EL0", i);
> > +            char *pmevtyper_name = g_strdup_printf("PMEVTYPER%d", i);
> > +            char *pmevtyper_el0_name = g_strdup_printf("PMEVTYPER%d_EL0", i);
> > +            ARMCPRegInfo pmev_regs[] = {
> > +                { .name = pmevcntr_name, .cp = 15, .crn = 15,
> > +                  .crm = 8 | (3 & (i >> 3)), .opc1 = 0, .opc2 = i & 7,
> > +                  .access = PL0_RW, .type = ARM_CP_NO_RAW | ARM_CP_IO,
> > +                  .readfn = pmevcntr_readfn, .writefn = pmevcntr_writefn,
> > +                  .accessfn = pmreg_access },
> > +                { .name = pmevcntr_el0_name, .state = ARM_CP_STATE_AA64,
> > +                  .opc0 = 3, .opc1 = 3, .crn = 15, .crm = 8 | (3 & (i >> 3)),
> > +                  .opc2 = i & 7, .access = PL0_RW, .accessfn = pmreg_access,
> > +                  .type = ARM_CP_NO_RAW | ARM_CP_IO,
> > +                  .readfn = pmevcntr_readfn, .writefn = pmevcntr_writefn },
> > +                { .name = pmevtyper_name, .cp = 15, .crn = 15,
> > +                  .crm = 12 | (3 & (i >> 3)), .opc1 = 0, .opc2 = i & 7,
> > +                  .access = PL0_RW, .type = ARM_CP_NO_RAW | ARM_CP_IO,
> > +                  .readfn = pmevtyper_readfn, .writefn = pmevtyper_writefn,
> > +                  .accessfn = pmreg_access },
> > +                { .name = pmevtyper_el0_name, .state = ARM_CP_STATE_AA64,
> > +                  .opc0 = 3, .opc1 = 3, .crn = 15, .crm = 12 | (3 & (i >> 3)),
> > +                  .opc2 = i & 7, .access = PL0_RW, .accessfn = pmreg_access,
> > +                  .type = ARM_CP_NO_RAW | ARM_CP_IO,
> > +                  .readfn = pmevtyper_readfn, .writefn = pmevtyper_writefn },
> > +                REGINFO_SENTINEL
> > +            };
> > +            define_arm_cp_regs(cpu, pmev_regs);
> > +            g_free(pmevcntr_name);
> > +            g_free(pmevcntr_el0_name);
> > +            g_free(pmevtyper_name);
> > +            g_free(pmevtyper_el0_name);
> > +        }
> >  #endif
> 
> Because all these registers are marked as NO_RAW we're going to fail
> to migrate their state, I think.

A bad copy-paste job from the PMXEVCNTR variants, I'll warrant. Fixed
now.

> This patchset in general needs to address how the extra CPU state
> involved with the PMU is going to be migrated.

I've now commented elsewhere about general ideas for migration, but I'm
wondering if there is a good way to set up unit tests for this code
because I don't trust myself to get migration right (in particular
because it's not my use case, so I won't be "naturally" testing it on my
own).

-Aaron
