Received: by 10.25.208.211 with SMTP id h202csp1252281lfg;
        Fri, 19 Feb 2016 08:42:55 -0800 (PST)
X-Received: by 10.140.86.85 with SMTP id o79mr16839638qgd.3.1455900175371;
        Fri, 19 Feb 2016 08:42:55 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b7si4151456qgb.59.2016.02.19.08.42.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Feb 2016 08:42:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53659 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aWo8s-0007Sr-Ug
	for alex.bennee@linaro.org; Fri, 19 Feb 2016 11:42:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54611)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aWo8q-0007Sl-M6
	for qemu-arm@nongnu.org; Fri, 19 Feb 2016 11:42:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aWo8n-0005to-CC
	for qemu-arm@nongnu.org; Fri, 19 Feb 2016 11:42:52 -0500
Received: from mail-lf0-x230.google.com ([2a00:1450:4010:c07::230]:36609)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aWo8m-0005tR-UH; Fri, 19 Feb 2016 11:42:49 -0500
Received: by mail-lf0-x230.google.com with SMTP id 78so57514668lfy.3;
	Fri, 19 Feb 2016 08:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=zGPES+BqleqhW4Q1A5H/BzAxKWzOENSpboso5ZeVixw=;
	b=JTBexm/uZEwds4iodOHFuNu7T2ZVhpebPET5OcTnqsy5SqBOQv3tch+b6hZpcpQXgz
	U+4Eso6r89BmoHFaiqctoJbDSZ6i0ezD72XM/6LY8D7rinFotwB0kMPCPn4PLlmzV8Gr
	rFTpJr34mz3pMRjcbLyVaIZ5jJWE6SaBqAXXHwxPL8bk5nWV4YNG3MALr0CzYFNF5atD
	kaat3J1Nf3R9oe/Ao8rD6LAdZzdlBWUGOyKrpG2mU/dusPeejFX3gikOpavTWV/aed3v
	Tsj18mH1GBj6kmwE0Hw/9gjNX9SSYvZBHda+5j53Znj36zJjsxVJnXuXqXodxYgTc5A5
	vTaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=zGPES+BqleqhW4Q1A5H/BzAxKWzOENSpboso5ZeVixw=;
	b=chVrSNRZYjXYzsjHGdGuheAjQxWVRYGo/D0lSo0Q90f8+VYQ/bF1f7or3vBU8e/r7G
	8aebLz7BiKuDWxmY6X7UaAffxhXVbR90dA7Bqj2a3mNSYb3JYUQu03Ggz+2gTGOmihjY
	16eCke8qk8mIlq9ZYj/kiubpt7KhIauieCv3JRYaR55UrHzfE9GAuwf3Jw3uMl9NrhMI
	lfGqnLUVLhpGhI2E3wrCPSs48B2uly86LN+sVvBSrLQqudryZxX90IgoqyHwMPcF2LNB
	4cMPuDmeemU7e4EGXWhp82Nw6u3ENpoolwQCfOSPtsEl/L9Rw5DP4vq1Ozwj9uRefWf6
	eCDQ==
X-Gm-Message-State: AG10YOQRO0dCJdJ9Bd0Hvh3mdVhlj8wzPwZnlKy5q4LcxaAYiSJFeELiQj/aKfHQoA5oPg==
X-Received: by 10.25.86.198 with SMTP id k189mr4688368lfb.90.1455900168014;
	Fri, 19 Feb 2016 08:42:48 -0800 (PST)
Received: from [10.30.10.50] ([213.243.91.10])
	by smtp.googlemail.com with ESMTPSA id
	b5sm1640931lbc.14.2016.02.19.08.42.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 19 Feb 2016 08:42:46 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1455892784-11328-1-git-send-email-peter.maydell@linaro.org>
	<1455892784-11328-3-git-send-email-peter.maydell@linaro.org>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56C74605.9090305@gmail.com>
Date: Fri, 19 Feb 2016 19:42:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1455892784-11328-3-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::230
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH v2 2/2] target-arm: Implement MDCR_EL3.TPM
 and MDCR_EL2.TPM traps
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
X-TUID: A2by5QkPD+Mf

On 19.02.2016 17:39, Peter Maydell wrote:
> Implement the performance monitor register traps controlled
> by MDCR_EL3.TPM and MDCR_EL2.TPM. Most of the performance
> registers already have an access function to deal with the
> user-enable bit, and the TPM checks can be added there. We
> also need a new access function which only implements the
> TPM checks for use by the few not-EL0-accessible registers
> and by PMUSERENR_EL0 (which is always EL0-readable).
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

> ---
>  target-arm/helper.c | 43 ++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 36 insertions(+), 7 deletions(-)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index e9b89e6..ef3f1ce 100644
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

