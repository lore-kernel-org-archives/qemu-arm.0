Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2854396wru;
        Tue, 17 Jul 2018 09:18:15 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdeuBgQO9ceZtrtnhMTWv9wIG/+2dKcXoxP874+Eahy2/FL4ypL4H07UbjcArLkdwV+MM2M
X-Received: by 2002:ac8:489:: with SMTP id s9-v6mr2199979qtg.173.1531844295884;
        Tue, 17 Jul 2018 09:18:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531844295; cv=none;
        d=google.com; s=arc-20160816;
        b=lvJZxI3p3CiHuoj8t6m+qM4+XkKa/7Qh0eXcoIbUTRggsURz9r4BCnx5xbpdUuaVyK
         bw4bWApIwnq3ufYdWsYFzCqYeFmSbeMquSPXLapu7HaXRntpPgOfz83IGYux6DSIlVUd
         OpuwokoozQsBOrSO+Iu5HpxoRTW+8JFiRKSJSyIaq/JpvAKfTvd+nkEbnwVSr7WgIdBd
         83reaAbxWxmbcWtkEY/xDaTEo7ckJrc291E0wLrOXN3nzFpYaDMNM+Fl3VYkgYKbxzL1
         84YvzJwz4fyPrjCVEX2oLSgLN6OhYKnUpBjvnKfRvswrl3RDCQ8sGnijIFg3ZtsMNFoB
         SPSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=H5P8KKqdDWeJrykRKchtTGjz0Oi8Kj0f0VUHJ5kDqLc=;
        b=Q35LcSyP0z8TV61tG5Mk9zlIC/Ynte9TwDpds5cJb5hfruR8d3Wakr+GQkWynW/Gl7
         J7r6PAArhb2gIMEmIZQfhDJeMRGKCZwlw4ojdiAfdaFkB3cEB/wmC0LiYYtGqSU7ZBm2
         eeI8BNPNhy4h793rmL66w7NgF5idDyAXEE56BsR1M3hPMCbakI+pKB0JoKpwfZi5LL4E
         a1iu6u2m37hV/7tlQl676tYrxDi/9TRSzXd9UF32hyStbl7qdfpc+NYAkPhaxne1kybS
         mTLAl2rTtv2Jteno9CR7W4wlFOACNb8rRlV7mRatj+qeXqYUOkSDKWGDYp9krqPZoBBd
         7lVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ho1Vzpyo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m54-v6si554592qtk.122.2018.07.17.09.18.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Jul 2018 09:18:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ho1Vzpyo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60349 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ffSg3-0003Fr-BC
	for alex.bennee@linaro.org; Tue, 17 Jul 2018 12:18:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43014)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ffSfp-0003EI-NC
	for qemu-arm@nongnu.org; Tue, 17 Jul 2018 12:18:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ffSfo-0006GW-E9
	for qemu-arm@nongnu.org; Tue, 17 Jul 2018 12:18:01 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:41162)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ffSfn-0006G3-Ur
	for qemu-arm@nongnu.org; Tue, 17 Jul 2018 12:18:00 -0400
Received: by mail-oi0-x243.google.com with SMTP id k12-v6so3099337oiw.8
	for <qemu-arm@nongnu.org>; Tue, 17 Jul 2018 09:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=H5P8KKqdDWeJrykRKchtTGjz0Oi8Kj0f0VUHJ5kDqLc=;
	b=Ho1VzpyoE9Qq8dWscKGtXq91ENgL1bxz7oQrIWwMl/Wy1GG9pG1itDNFeCdJxsGS9b
	bFJs/ICu32vWjLqH6DbvjrlQOe0OZC4HX8fB6gxFmhJV8WKU1z6YIErCK2iO2Fpj5xzh
	F1ZvMBlmxClAANAFQO64j1qJr/8l+WOYsNDI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=H5P8KKqdDWeJrykRKchtTGjz0Oi8Kj0f0VUHJ5kDqLc=;
	b=J8Z7xQyg+n6Kjd5hKVXjgktmN6gmoaqpoCd1uB2aX6y2FoBbSxI762A0IZ0PcJntPI
	+KKAm+71Rch02zrlzYihizGPQ+QtWCXHV9CY4f5A+A25Htfuv2ZWwdcRcZYRaV0ESgZi
	srei4lLaLa4jjqmVjKmL4QzN2YZyyl3rKu2FpW0d2IoNHUKd8joaBYyCI7Ak7UiKwtQb
	beDkPKwTVqo9CJmPChWKO/runM2t5Bo5tRl8vS/mS3oDJgmD8uDctofXVuKa2jYAgOt3
	X6oIMVi7S7KtGV64it0LIKDVu5midxDczz3nz5r7f1qRepgI8FmpM7OgAqN3KlalNDiU
	koNQ==
X-Gm-Message-State: AOUpUlFF1nutGG7gQUZrVvmJpDj8t4RVQdzlTDfgkEHtj03qoZ/Qx6wv
	a4oB928D1Tdq5lg8xCPj+bAKERIWohJ3qQpauAYN+g==
X-Received: by 2002:aca:7247:: with SMTP id
	p68-v6mr2505498oic.252.1531844279187; 
	Tue, 17 Jul 2018 09:17:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Tue, 17 Jul 2018 09:17:38
	-0700 (PDT)
In-Reply-To: <1529699547-17044-9-git-send-email-alindsay@codeaurora.org>
References: <1529699547-17044-1-git-send-email-alindsay@codeaurora.org>
	<1529699547-17044-9-git-send-email-alindsay@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jul 2018 17:17:38 +0100
Message-ID: <CAFEAcA_O5f7Ao4cfCD8XMD5y0bb4g8P4mMz-k573FoXJwZz0qg@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
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
	qemu-arm <qemu-arm@nongnu.org>, Aaron Lindsay <aclindsa@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fRAArSvgFop2

On 22 June 2018 at 21:32, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> Add arrays to hold the registers, the definitions themselves, access
> functions, and logic to reset counters when PMCR.P is set. Update
> filtering code to support counters other than PMCCNTR.
>
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> ---
>  target/arm/cpu.h    |   3 +
>  target/arm/helper.c | 224 +++++++++++++++++++++++++++++++++++++++++++++++-----
>  2 files changed, 209 insertions(+), 18 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 430b8d5..c240b38 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -481,6 +481,9 @@ typedef struct CPUARMState {
>           * pmccntr_op_finish.
>           */
>          uint64_t c15_ccnt_delta;
> +        uint64_t c14_pmevcntr[31];
> +        uint64_t c14_pmevcntr_delta[31];
> +        uint64_t c14_pmevtyper[31];
>          uint64_t pmccfiltr_el0; /* Performance Monitor Filter Register */
>          uint64_t vpidr_el2; /* Virtualization Processor ID Register */
>          uint64_t vmpidr_el2; /* Virtualization Multiprocessor ID Register */
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 9f81747..f1fd21c 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -938,6 +938,7 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
>  #define PMCRDP  0x10
>  #define PMCRD   0x8
>  #define PMCRC   0x4
> +#define PMCRP   0x2
>  #define PMCRE   0x1
>
>  #define PMXEVTYPER_P          0x80000000
> @@ -1120,9 +1121,11 @@ static inline bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
>          prohibited = env->cp15.c9_pmcr & PMCRDP;
>      }
>
> -    /* TODO Remove assert, set filter to correct PMEVTYPER */
> -    assert(counter == 31);
> -    filter = env->cp15.pmccfiltr_el0;
> +    if (counter == 31) {
> +        filter = env->cp15.pmccfiltr_el0;
> +    } else {
> +        filter = env->cp15.c14_pmevtyper[counter];
> +    }
>
>      p   = filter & PMXEVTYPER_P;
>      u   = filter & PMXEVTYPER_U;
> @@ -1142,6 +1145,21 @@ static inline bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
>          filtered = m != p;
>      }
>
> +    if (counter != 31) {
> +        /* If not checking PMCCNTR, ensure the counter is setup to an event we
> +         * support */

Please use the right format for multiline comments (here and below).

>  static void pmuserenr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                              uint64_t value)
>  {
> @@ -1552,16 +1698,23 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
>        .fieldoffset = offsetof(CPUARMState, cp15.pmccfiltr_el0),
>        .resetvalue = 0, },
>      { .name = "PMXEVTYPER", .cp = 15, .crn = 9, .crm = 13, .opc1 = 0, .opc2 = 1,
> -      .access = PL0_RW, .type = ARM_CP_NO_RAW, .accessfn = pmreg_access,
> +      .access = PL0_RW, .type = ARM_CP_NO_RAW | ARM_CP_IO,
> +      .accessfn = pmreg_access,
>        .writefn = pmxevtyper_write, .readfn = pmxevtyper_read },
>      { .name = "PMXEVTYPER_EL0", .state = ARM_CP_STATE_AA64,
>        .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 13, .opc2 = 1,
> -      .access = PL0_RW, .type = ARM_CP_NO_RAW, .accessfn = pmreg_access,
> +      .access = PL0_RW, .type = ARM_CP_NO_RAW | ARM_CP_IO,
> +      .accessfn = pmreg_access,
>        .writefn = pmxevtyper_write, .readfn = pmxevtyper_read },
> -    /* Unimplemented, RAZ/WI. */
>      { .name = "PMXEVCNTR", .cp = 15, .crn = 9, .crm = 13, .opc1 = 0, .opc2 = 2,
> -      .access = PL0_RW, .type = ARM_CP_CONST, .resetvalue = 0,
> -      .accessfn = pmreg_access_xevcntr },
> +      .access = PL0_RW, .type = ARM_CP_NO_RAW | ARM_CP_IO,
> +      .accessfn = pmreg_access_xevcntr,
> +      .writefn = pmxevcntr_write, .readfn = pmxevcntr_read },
> +    { .name = "PMXEVCNTR_EL0", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 13, .opc2 = 2,
> +      .access = PL0_RW, .type = ARM_CP_NO_RAW | ARM_CP_IO,
> +      .accessfn = pmreg_access_xevcntr,
> +      .writefn = pmxevcntr_write, .readfn = pmxevcntr_read },
>      { .name = "PMUSERENR", .cp = 15, .crn = 9, .crm = 14, .opc1 = 0, .opc2 = 0,
>        .access = PL0_R | PL1_RW, .accessfn = access_tpm,
>        .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmuserenr),
> @@ -4250,7 +4403,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
>  #endif
>      /* The only field of MDCR_EL2 that has a defined architectural reset value
>       * is MDCR_EL2.HPMN which should reset to the value of PMCR_EL0.N; but we
> -     * don't impelment any PMU event counters, so using zero as a reset
> +     * don't implement any PMU event counters, so using zero as a reset
>       * value for MDCR_EL2 is okay
>       */
>      { .name = "MDCR_EL2", .state = ARM_CP_STATE_BOTH,
> @@ -5062,6 +5215,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>          define_arm_cp_regs(cpu, pmovsset_cp_reginfo);
>      }
>      if (arm_feature(env, ARM_FEATURE_V7)) {
> +        unsigned int i;
>          /* v7 performance monitor control register: same implementor
>           * field as main ID register, and we implement only the cycle
>           * count register.
> @@ -5086,6 +5240,40 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>          };
>          define_one_arm_cp_reg(cpu, &pmcr);
>          define_one_arm_cp_reg(cpu, &pmcr64);
> +        for (i = 0; i < 31; i++) {
> +            char *pmevcntr_name = g_strdup_printf("PMEVCNTR%d", i);
> +            char *pmevcntr_el0_name = g_strdup_printf("PMEVCNTR%d_EL0", i);
> +            char *pmevtyper_name = g_strdup_printf("PMEVTYPER%d", i);
> +            char *pmevtyper_el0_name = g_strdup_printf("PMEVTYPER%d_EL0", i);
> +            ARMCPRegInfo pmev_regs[] = {
> +                { .name = pmevcntr_name, .cp = 15, .crn = 15,
> +                  .crm = 8 | (3 & (i >> 3)), .opc1 = 0, .opc2 = i & 7,
> +                  .access = PL0_RW, .type = ARM_CP_NO_RAW | ARM_CP_IO,
> +                  .readfn = pmevcntr_readfn, .writefn = pmevcntr_writefn,
> +                  .accessfn = pmreg_access },
> +                { .name = pmevcntr_el0_name, .state = ARM_CP_STATE_AA64,
> +                  .opc0 = 3, .opc1 = 3, .crn = 15, .crm = 8 | (3 & (i >> 3)),
> +                  .opc2 = i & 7, .access = PL0_RW, .accessfn = pmreg_access,
> +                  .type = ARM_CP_NO_RAW | ARM_CP_IO,
> +                  .readfn = pmevcntr_readfn, .writefn = pmevcntr_writefn },
> +                { .name = pmevtyper_name, .cp = 15, .crn = 15,
> +                  .crm = 12 | (3 & (i >> 3)), .opc1 = 0, .opc2 = i & 7,
> +                  .access = PL0_RW, .type = ARM_CP_NO_RAW | ARM_CP_IO,
> +                  .readfn = pmevtyper_readfn, .writefn = pmevtyper_writefn,
> +                  .accessfn = pmreg_access },
> +                { .name = pmevtyper_el0_name, .state = ARM_CP_STATE_AA64,
> +                  .opc0 = 3, .opc1 = 3, .crn = 15, .crm = 12 | (3 & (i >> 3)),
> +                  .opc2 = i & 7, .access = PL0_RW, .accessfn = pmreg_access,
> +                  .type = ARM_CP_NO_RAW | ARM_CP_IO,
> +                  .readfn = pmevtyper_readfn, .writefn = pmevtyper_writefn },
> +                REGINFO_SENTINEL
> +            };
> +            define_arm_cp_regs(cpu, pmev_regs);
> +            g_free(pmevcntr_name);
> +            g_free(pmevcntr_el0_name);
> +            g_free(pmevtyper_name);
> +            g_free(pmevtyper_el0_name);
> +        }
>  #endif

Because all these registers are marked as NO_RAW we're going to fail
to migrate their state, I think.

This patchset in general needs to address how the extra CPU state
involved with the PMU is going to be migrated.

thanks
-- PMM
