Received: by 10.25.77.65 with SMTP id a62csp613586lfb;
        Fri, 3 Feb 2017 05:24:47 -0800 (PST)
X-Received: by 10.200.56.113 with SMTP id r46mr13629794qtb.217.1486128286965;
        Fri, 03 Feb 2017 05:24:46 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p72si19243410qki.325.2017.02.03.05.24.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Feb 2017 05:24:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34765 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cZdr4-0001c9-FV
	for alex.bennee@linaro.org; Fri, 03 Feb 2017 08:24:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49726)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cZdr1-0001c3-DC
	for qemu-arm@nongnu.org; Fri, 03 Feb 2017 08:24:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cZdr0-0002tz-9E
	for qemu-arm@nongnu.org; Fri, 03 Feb 2017 08:24:43 -0500
Received: from mail-wj0-x236.google.com ([2a00:1450:400c:c01::236]:34886)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cZdr0-0002tT-28
	for qemu-arm@nongnu.org; Fri, 03 Feb 2017 08:24:42 -0500
Received: by mail-wj0-x236.google.com with SMTP id b20so915163wjs.2
	for <qemu-arm@nongnu.org>; Fri, 03 Feb 2017 05:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=n3MCfN7Ra3eGlRvAo1A0Nv98bCfPyoREFzRlqNMUNC8=;
	b=SvWBalwfRaZJmOO0GKuXcH9gvrbl3ne6axmtEKPHtSTsMz3AO6N8VTR12zG1EsovG8
	DpGKjzaEa80F4xKRFzdPc8AOAv34VcYnn74UjYsY+wsUzxVp1YyS9xf/U8eE6pJAjlmW
	8lg1RaHZzcQlY2OHL17ryuaBXBowElssnxQQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=n3MCfN7Ra3eGlRvAo1A0Nv98bCfPyoREFzRlqNMUNC8=;
	b=YU/0pz+bTaL0/xLm05gMpZHPrQ1qapHkxgQsd8m5294J4JOVRW5jAIx75CARu+p1S7
	/ACq1o/vaYhVyf3p5rgpD1DhPpLeqyqAqEigYH3mw/Cdq2xLgdtJ/CFcA1YGlD6ZGCQc
	mP1QOMbxkGMbw5lyBZhGap0tNRAtvqU3EoAVnTHMVFiy96ZRYpAlgTtwmDQap4tXkZ6M
	Y1F1x8KlHb3PBB6wGAwDHtF3SEgjfr04wyVGutb9C9Vl8lZW0wRIxiKq06LuM51dxxFD
	3+yitlyJehAQOkk44ugq4nrxKm9fVW2ghd1XT8f7KxF4eprk0dAIMD9zQxWDL9ksnPKI
	ikOQ==
X-Gm-Message-State: AIkVDXJ6yH0BFu1Ab3vCXLAcuKMkj9rRJjdAsUgssJKeJobmbSuF0zuwJC+PMpTqtMnoLQFbu+azyHxqsB+Kv9oq
X-Received: by 10.223.142.131 with SMTP id q3mr12065413wrb.195.1486128280825; 
	Fri, 03 Feb 2017 05:24:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 3 Feb 2017 05:24:20 -0800 (PST)
In-Reply-To: <1485875745-27741-3-git-send-email-wei@redhat.com>
References: <1485875745-27741-1-git-send-email-wei@redhat.com>
	<1485875745-27741-3-git-send-email-wei@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Feb 2017 13:24:20 +0000
Message-ID: <CAFEAcA_Mgebwv8G_QM7owVm+HuNpLs-QfmXz4=Ac7xg9DKiUVg@mail.gmail.com>
To: Wei Huang <wei@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c01::236
Subject: Re: [Qemu-arm] [PATCH V2 2/5] target-arm: Add support for AArch64
 PMU register PMXEVTYPER_EL0
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vxrbFikzndgb

On 31 January 2017 at 15:15, Wei Huang <wei@redhat.com> wrote:
> In order to support Linux perf, which uses PMXEVTYPER register,
> this patch adds access support for PMXEVTYPER_EL0.
>
> Signed-off-by: Wei Huang <wei@redhat.com>
> ---
>  target/arm/cpu.h    |  2 +-
>  target/arm/helper.c | 19 ++++++++++++++++---
>  2 files changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 8a82c73..ce02044 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -307,7 +307,7 @@ typedef struct CPUARMState {
>          uint64_t c9_pmcr; /* performance monitor control register */
>          uint64_t c9_pmcnten; /* perf monitor counter enables */
>          uint32_t c9_pmovsr; /* perf monitor overflow status */
> -        uint32_t c9_pmxevtyper; /* perf monitor event type */
> +        uint64_t c9_pmxevtyper; /* perf monitor event type */
>          uint32_t c9_pmuserenr; /* perf monitor user enable */
>          uint64_t c9_pmselr; /* perf monitor counter selection register */
>          uint32_t c9_pminten; /* perf monitor interrupt enables */
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 67520ea..c8620d9 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -1054,7 +1054,13 @@ static void pmovsr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>  static void pmxevtyper_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                               uint64_t value)
>  {
> -    env->cp15.c9_pmxevtyper = value & 0xff;
> +    /* Attempts to access PMXEVTYPER are CONSTRAINED UNPREDICTABLE when
> +     * PMSELR value is equal to or greater than the number of implemented
> +     * counters, but not euqal to 0x1f. We opt to behave as a NOP.

"equal"

> +     */
> +    if (env->cp15.c9_pmselr == 0x1f) {
> +        pmccfiltr_write(env, ri, value);
> +    }
>  }
>
>  static void pmuserenr_write(CPUARMState *env, const ARMCPRegInfo *ri,
> @@ -1234,10 +1240,17 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
>        .fieldoffset = offsetof(CPUARMState, cp15.pmccfiltr_el0),
>        .resetvalue = 0, },
>      { .name = "PMXEVTYPER", .cp = 15, .crn = 9, .crm = 13, .opc1 = 0, .opc2 = 1,
> -      .access = PL0_RW,
> -      .fieldoffset = offsetof(CPUARMState, cp15.c9_pmxevtyper),
> +      .access = PL0_RW, .type = ARM_CP_ALIAS,
> +      .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmxevtyper),
>        .accessfn = pmreg_access, .writefn = pmxevtyper_write,
>        .raw_writefn = raw_write },
> +    { .name = "PMXEVTYPER_EL0", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 13, .opc2 = 1,
> +      .access = PL0_RW, .accessfn = pmreg_access,
> +      .type = ARM_CP_IO,
> +      .fieldoffset = offsetof(CPUARMState, cp15.c9_pmxevtyper),
> +      .writefn = pmxevtyper_write, .raw_writefn = raw_write,
> +      .resetvalue = 0x0 },

Reads also need to give you PMCCFILTR_EL0, if PMSELR is set to 31,
so you need a readfn as well. (That also means that the c9_pmxevtyper
field in the struct becomes unused, so you can drop it, and
the .fieldoffset setting, and mark both the A32 and A64 reg structs
as ARM_CP_NO_RAW.)

>      /* Unimplemented, RAZ/WI. */
>      { .name = "PMXEVCNTR", .cp = 15, .crn = 9, .crm = 13, .opc1 = 0, .opc2 = 2,
>        .access = PL0_RW, .type = ARM_CP_CONST, .resetvalue = 0,
> --
> 1.8.3.1
>

thanks
-- PMM
