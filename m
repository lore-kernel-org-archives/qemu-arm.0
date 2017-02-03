Received: by 10.25.77.65 with SMTP id a62csp612117lfb;
        Fri, 3 Feb 2017 05:21:09 -0800 (PST)
X-Received: by 10.200.38.50 with SMTP id u47mr13632107qtu.293.1486128069205;
        Fri, 03 Feb 2017 05:21:09 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u11si19239041qte.278.2017.02.03.05.21.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Feb 2017 05:21:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34759 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cZdnY-0000KI-Mi
	for alex.bennee@linaro.org; Fri, 03 Feb 2017 08:21:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49275)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cZdnT-0000JM-HQ
	for qemu-arm@nongnu.org; Fri, 03 Feb 2017 08:21:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cZdnS-0000jr-Jk
	for qemu-arm@nongnu.org; Fri, 03 Feb 2017 08:21:03 -0500
Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b]:32931)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cZdnS-0000j5-BS
	for qemu-arm@nongnu.org; Fri, 03 Feb 2017 08:21:02 -0500
Received: by mail-wm0-x22b.google.com with SMTP id t18so14688020wmt.0
	for <qemu-arm@nongnu.org>; Fri, 03 Feb 2017 05:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=c3JChRB/OGzYpNjk9+Vmn1VohVFwdr64w86LWQo9bbw=;
	b=O5MNGbgvtLw6kpmbAzaP1qSyirsQEAxbNYS4hDW8viLS26nFmtYXuO/wSVnZ1RLjwN
	8svd9YrxdqiFzAj6qoJidfMiYlebHXegCuryHe5MG2gYlt2Dz8q1MR9zc/RlbT0NO9xr
	COyB2jzguk9QWdOOSRx5yolLaDsoaTbCT0ux8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=c3JChRB/OGzYpNjk9+Vmn1VohVFwdr64w86LWQo9bbw=;
	b=X53hCiK9xnUVDGdnMu2ecc9bbdJvPneyfZxaAJIrUhbSDWJfC238IyF7q0j/lOr2L7
	3z44nyFAnuKzzAM6JUS07wt7SC3M4yWuNBzwyclQ8iFor0G6/HDWNvWhD2+2BQI6shLJ
	pIgS3zIy4Y53zdHVQA2Dli/XFlPB2BgFMRRvo2tQ3ZHEKFeN4JHt+Z+r+60rLB13fkF2
	BVaDxwJNZ7Prd7+rm4pH5R/LzO9U8U6pFqxC6sx7kg0aupVfe1md487A+S9J/UEoI809
	PZHhnCBeFBmE+BpIxOXHR+6arv2C7w7mf4qMNMtWnxyGivsj8ThVFlSIjr35YUrlxyq3
	7RRA==
X-Gm-Message-State: AIkVDXIQ1FnPDh0qlf+4A/gCVBGHvrJX0Z7eLM/ZXOWy8Ab/uCy+nqQUDjPlFjt5rdCosaWoW9ITU9Op9DCzZHRu
X-Received: by 10.223.142.131 with SMTP id q3mr12051336wrb.195.1486128061209; 
	Fri, 03 Feb 2017 05:21:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 3 Feb 2017 05:20:40 -0800 (PST)
In-Reply-To: <1485875745-27741-2-git-send-email-wei@redhat.com>
References: <1485875745-27741-1-git-send-email-wei@redhat.com>
	<1485875745-27741-2-git-send-email-wei@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Feb 2017 13:20:40 +0000
Message-ID: <CAFEAcA_K4Rmsno3hWjmSXYe9fg=cUeGZL0VEi2C29VUYNpORVA@mail.gmail.com>
To: Wei Huang <wei@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22b
Subject: Re: [Qemu-arm] [PATCH V2 1/5] target-arm: Add support for PMU
 register PMSELR_EL0
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
X-TUID: lW06wS59BFLT

On 31 January 2017 at 15:15, Wei Huang <wei@redhat.com> wrote:
> This patch adds support for AArch64 register PMSELR_EL0. The existing
> PMSELR definition is revised accordingly.
>
> Signed-off-by: Wei Huang <wei@redhat.com>
> ---
>  target/arm/cpu.h    |  1 +
>  target/arm/helper.c | 25 ++++++++++++++++++++-----
>  2 files changed, 21 insertions(+), 5 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 39bff86..8a82c73 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -309,6 +309,7 @@ typedef struct CPUARMState {
>          uint32_t c9_pmovsr; /* perf monitor overflow status */
>          uint32_t c9_pmxevtyper; /* perf monitor event type */
>          uint32_t c9_pmuserenr; /* perf monitor user enable */
> +        uint64_t c9_pmselr; /* perf monitor counter selection register */
>          uint32_t c9_pminten; /* perf monitor interrupt enables */
>          union { /* Memory attribute redirection */
>              struct {
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index c23df1b..67520ea 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -975,6 +975,17 @@ static uint64_t pmccntr_read(CPUARMState *env, const ARMCPRegInfo *ri)
>      return total_ticks - env->cp15.c15_ccnt;
>  }
>
> +static void pmselr_write(CPUARMState *env, const ARMCPRegInfo *ri,
> +                         uint64_t value)
> +{
> +    /* The value of PMSELR.SEL affects the behavior of PMXEVTYPER and
> +     * PMXEVCNTR. We allow [0..31] to be written to PMSELR here; in the
> +     * meanwhile, we check PMSELR.SEL when PMXEVTYPER and PMXEVCNTR are
> +     * accessed.
> +     */
> +    env->cp15.c9_pmselr = value & 0x1f;
> +}
> +
>  static void pmccntr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                          uint64_t value)
>  {
> @@ -1194,12 +1205,16 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
>      /* Unimplemented so WI. */
>      { .name = "PMSWINC", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 4,
>        .access = PL0_W, .accessfn = pmreg_access, .type = ARM_CP_NOP },
> -    /* Since we don't implement any events, writing to PMSELR is UNPREDICTABLE.
> -     * We choose to RAZ/WI.
> -     */
>      { .name = "PMSELR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 5,
> -      .access = PL0_RW, .type = ARM_CP_CONST, .resetvalue = 0,
> -      .accessfn = pmreg_access },
> +      .access = PL0_RW, .type = ARM_CP_ALIAS,
> +      .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmselr),
> +      .accessfn = pmreg_access, .writefn = pmselr_write,
> +      .raw_writefn = raw_write},
> +    { .name = "PMSELR_EL0", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 12, .opc2 = 5,
> +      .access = PL0_RW, .accessfn = pmreg_access,
> +      .fieldoffset = offsetof(CPUARMState, cp15.c9_pmselr),
> +      .writefn = pmselr_write, .raw_writefn = raw_write, },
>  #ifndef CONFIG_USER_ONLY
>      { .name = "PMCCNTR", .cp = 15, .crn = 9, .crm = 13, .opc1 = 0, .opc2 = 0,
>        .access = PL0_RW, .resetvalue = 0, .type = ARM_CP_IO,
> --
> 1.8.3.1
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
