Received: by 10.25.208.211 with SMTP id h202csp1162003lfg;
        Fri, 19 Feb 2016 05:40:39 -0800 (PST)
X-Received: by 10.140.92.146 with SMTP id b18mr15351850qge.88.1455889239496;
        Fri, 19 Feb 2016 05:40:39 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u92si3473218qge.31.2016.02.19.05.40.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Feb 2016 05:40:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52373 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aWlIV-0007Bh-0E
	for alex.bennee@linaro.org; Fri, 19 Feb 2016 08:40:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59142)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aWlIR-0007Bb-V5
	for qemu-arm@nongnu.org; Fri, 19 Feb 2016 08:40:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aWlIM-0003Ya-Ny
	for qemu-arm@nongnu.org; Fri, 19 Feb 2016 08:40:35 -0500
Received: from mail-lf0-x234.google.com ([2a00:1450:4010:c07::234]:33097)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aWlIM-0003YV-AV; Fri, 19 Feb 2016 08:40:30 -0500
Received: by mail-lf0-x234.google.com with SMTP id m1so54483104lfg.0;
	Fri, 19 Feb 2016 05:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=gJxXYG4FOy6oV+RZosOxptVbJKnvI/iXzHw1/BBmgek=;
	b=Yc++jmeRiZsFAmzMQ/dI4eyUAvBbfimLty6+mpzv11YZCV805YFH2LVE/W5a1Gm8Rz
	fjdn/l48ERy5hRQBPurkdYw9mDklEdaMY2032Qh3ne5AeyXniWkj3kql70TEWuUuPziz
	E+Go+ioUAJ6wgSq9DcT4YZrMPmctK+13DLiabbGrz0v97/uR+rvq8p/OPEmHsGoaISaF
	P/enmftyTiTsQpJKjoc0G2yu1XiX+eSRlIF17iz5oROKJFQuznNazwWrPHzOiNOTO0R0
	XjQ5bvxZ0MopzTO3mR79dR4drDt1QEqb71fNMhl46ChWBPF+B8QOGvZxQ8XdiEvvBpHe
	3bJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=gJxXYG4FOy6oV+RZosOxptVbJKnvI/iXzHw1/BBmgek=;
	b=UzYSvYaNGAtiGJjI5ZgfwGu03V+Y5GTV/EK/jjrdn2yI3KpIaX7zgqPBRz6mRedS8I
	zjyrONWmrOEFd8LLVMgN60BsrxfkTRcMX4ndcojcsHW251jWyoRGvaysSiDg06vThRyl
	bECq73WhLYSPlqvstuKe89KcV2aoMP4YCZMOrNngNLq9BYiXdg6h99yyaC+kjdxk+vJp
	GKi+upBKFnrm1x+O0vJEvK2m3zWktHDJFBwnj30Z2S1nhtfMDWeCIzBRky/o1DSs1Rtn
	5VF8dEHcbV/+SjMUz0RYfacBgbnZiKGiyjxg9F0GYglr33jdrXEHpxn3IbD3EYFU6hR9
	iH0Q==
X-Gm-Message-State: AG10YOS0bgQpB9HmhmVtXRUWfm6tzkk+VviI+ZZRmYYcPe1Iacf5vw/AlQ6+fWQMMn/z1A==
X-Received: by 10.25.138.7 with SMTP id m7mr5645054lfd.109.1455889229472;
	Fri, 19 Feb 2016 05:40:29 -0800 (PST)
Received: from [10.30.10.50] ([213.243.91.10])
	by smtp.googlemail.com with ESMTPSA id
	ub6sm1523316lbb.17.2016.02.19.05.40.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 19 Feb 2016 05:40:28 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1455881194-10865-1-git-send-email-peter.maydell@linaro.org>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56C71B4B.4010309@gmail.com>
Date: Fri, 19 Feb 2016 16:40:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1455881194-10865-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::234
Cc: Alistair Francis <alistair.francis@xilinx.com>, qemu-arm@nongnu.org,
	patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH] target-arm: Implement MDCR_EL3.TPM and
	MDCR_EL2.TPM traps
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Zr4p/YRfHdIp

On 19.02.2016 14:26, Peter Maydell wrote:
> Implement the performance monitor register traps controlled
> by MDCR_EL3.TPM and MDCR_EL2.TPM. Most of the performance
> registers already have an access function to deal with the
> user-enable bit, and the TPM checks can be added there. We
> also need a new access function which only implements the
> TPM checks for use by the few not-EL0-accessible registers
> and by PMUSERENR_EL0 (which is always EL0-readable).
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I think this is the last of the EL3 traps we need to implement...
>
> Alistair, now we have these two access functions can you check
> that any new perf registers that are added in the patches you've
> got pending use the right accessfn? (I'll probably catch it in
> code review if you forget, but basing on top of this patch will
> hopefully avoid unnecessary merge conflicts.)
>
> thanks
> -- PMM
>
>  target-arm/helper.c | 43 ++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 36 insertions(+), 7 deletions(-)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 3d7fda1..e7dbc02 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -439,6 +439,24 @@ static CPAccessResult access_tda(CPUARMState *env, const ARMCPRegInfo *ri,
>      return CP_ACCESS_OK;
>  }
>  
> +/* Check for traps to performance monitor registers, which are controlled
> + * by MDCR_EL2.TPM for EL2 and MDCR_EL3.TPM for EL3.
> + */
> +static CPAccessResult access_tpm(CPUARMState *env, const ARMCPRegInfo *ri,
> +                                 bool isread)
> +{
> +    int el = arm_current_el(env);
> +
> +    if (el < 2 && (env->cp15.mdcr_el2 & MDCR_TPM)
> +        && !arm_is_secure_below_el3(env)) {
> +        return CP_ACCESS_TRAP_EL2;
> +    }
> +    if (el < 3 && (env->cp15.mdcr_el3 & MDCR_TPM)) {
> +        return CP_ACCESS_TRAP_EL3;

This trap is only possible if EL3 is using AArch64.

> +    }
> +    return CP_ACCESS_OK;
> +}
> +
>  static void dacr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
>  {
>      ARMCPU *cpu = arm_env_get_cpu(env);
> @@ -774,11 +792,22 @@ static CPAccessResult pmreg_access(CPUARMState *env, const ARMCPRegInfo *ri,
>                                     bool isread)
>  {
>      /* Performance monitor registers user accessibility is controlled
> -     * by PMUSERENR.
> +     * by PMUSERENR. MDCR_EL2.TPM and MDCR_EL3.TPM allow configurable
> +     * trapping to EL2 or EL3 for other accesses.
>       */
> -    if (arm_current_el(env) == 0 && !env->cp15.c9_pmuserenr) {
> +    int el = arm_current_el(env);
> +
> +    if (el == 0 && !env->cp15.c9_pmuserenr) {
>          return CP_ACCESS_TRAP;
>      }
> +    if (el < 2 && (env->cp15.mdcr_el2 & MDCR_TPM)
> +        && !arm_is_secure_below_el3(env)) {
> +        return CP_ACCESS_TRAP_EL2;
> +    }
> +    if (el < 3 && (env->cp15.mdcr_el3 & MDCR_TPM)) {
> +        return CP_ACCESS_TRAP_EL3;

The same as above.

Best regards,
Sergey


> +    }
> +
>      return CP_ACCESS_OK;
>  }
>  
> @@ -1101,28 +1130,28 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
>        .access = PL0_RW, .type = ARM_CP_CONST, .resetvalue = 0,
>        .accessfn = pmreg_access },
>      { .name = "PMUSERENR", .cp = 15, .crn = 9, .crm = 14, .opc1 = 0, .opc2 = 0,
> -      .access = PL0_R | PL1_RW,
> +      .access = PL0_R | PL1_RW, .accessfn = access_tpm,
>        .fieldoffset = offsetof(CPUARMState, cp15.c9_pmuserenr),
>        .resetvalue = 0,
>        .writefn = pmuserenr_write, .raw_writefn = raw_write },
>      { .name = "PMUSERENR_EL0", .state = ARM_CP_STATE_AA64,
>        .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 14, .opc2 = 0,
> -      .access = PL0_R | PL1_RW, .type = ARM_CP_ALIAS,
> +      .access = PL0_R | PL1_RW, .accessfn = access_tpm, .type = ARM_CP_ALIAS,
>        .fieldoffset = offsetof(CPUARMState, cp15.c9_pmuserenr),
>        .resetvalue = 0,
>        .writefn = pmuserenr_write, .raw_writefn = raw_write },
>      { .name = "PMINTENSET", .cp = 15, .crn = 9, .crm = 14, .opc1 = 0, .opc2 = 1,
> -      .access = PL1_RW,
> +      .access = PL1_RW, .accessfn = access_tpm,
>        .fieldoffset = offsetof(CPUARMState, cp15.c9_pminten),
>        .resetvalue = 0,
>        .writefn = pmintenset_write, .raw_writefn = raw_write },
>      { .name = "PMINTENCLR", .cp = 15, .crn = 9, .crm = 14, .opc1 = 0, .opc2 = 2,
> -      .access = PL1_RW, .type = ARM_CP_ALIAS,
> +      .access = PL1_RW, .accessfn = access_tpm, .type = ARM_CP_ALIAS,
>        .fieldoffset = offsetof(CPUARMState, cp15.c9_pminten),
>        .writefn = pmintenclr_write, },
>      { .name = "PMINTENCLR_EL1", .state = ARM_CP_STATE_AA64,
>        .opc0 = 3, .opc1 = 0, .crn = 9, .crm = 14, .opc2 = 2,
> -      .access = PL1_RW, .type = ARM_CP_ALIAS,
> +      .access = PL1_RW, .accessfn = access_tpm, .type = ARM_CP_ALIAS,
>        .fieldoffset = offsetof(CPUARMState, cp15.c9_pminten),
>        .writefn = pmintenclr_write },
>      { .name = "VBAR", .state = ARM_CP_STATE_BOTH,

