Received: by 10.25.208.211 with SMTP id h202csp21749lfg;
        Fri, 19 Feb 2016 11:38:40 -0800 (PST)
X-Received: by 10.140.94.46 with SMTP id f43mr18044767qge.95.1455910720039;
        Fri, 19 Feb 2016 11:38:40 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s131si15674002qhs.77.2016.02.19.11.38.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Feb 2016 11:38:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54840 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aWqsw-0005Y3-LA
	for alex.bennee@linaro.org; Fri, 19 Feb 2016 14:38:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49319)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1aWqsu-0005XK-46
	for qemu-arm@nongnu.org; Fri, 19 Feb 2016 14:38:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1aWqss-0007mk-Tk
	for qemu-arm@nongnu.org; Fri, 19 Feb 2016 14:38:36 -0500
Received: from mail-oi0-x236.google.com ([2607:f8b0:4003:c06::236]:36129)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1aWqss-0007me-Hd; Fri, 19 Feb 2016 14:38:34 -0500
Received: by mail-oi0-x236.google.com with SMTP id w5so19085797oie.3;
	Fri, 19 Feb 2016 11:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=oavQike1oiIgi6O9nkkSWOuoFT38hqhrRcex2rcUYoc=;
	b=SFbn3vtiKaixw/x7hw/yefDy3FIfLf9+Thz3P9I5Ml2H438oT/eHqhi7F3kx3I6UVN
	t7eqRexBwrJOr+d/QSPgb8EiTqXgaGcfYfVcjxKo/ECbTwjjLuSTp7OXs3W6nzqD5H9a
	p4NrKPSiCOeq9t78H/MloAK0iJWN8dRIQ65wQrG8Xw8wolDKzL+ubUXMwGi0Ni082oyO
	xWirgvdsWYZNgBM+aH+fwl53ewn5ZJhGyamD3YNY9C8lMwDtF/CMsEcLsv/Nhj9HCJfU
	mLwHfAwt6yrbL8zzgq+MDyg7QGBPesLeiFxoduBf2vGxRmHw2w5QCaHunJGTId39GSlS
	oJig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=oavQike1oiIgi6O9nkkSWOuoFT38hqhrRcex2rcUYoc=;
	b=epm2l53BeQnqFjLaKUDcRlIWu8mpXx4w4+zwL1BqLHB94zr8TX7x53EvsGeQHPtVhb
	DNarChC8fNqYXsxO3G1Y+9OwoEaN/uVMmbYV6DMHyfoCjqwYQuFY6b5jjDfntXJxrcl5
	uhiBjtQ08gGZgDcR7ZPq9H+Nxh6a9hRlzFzpUKfpxoLTGk1nY7vNXafNrJohil4xGPYl
	wiaBivE+giTv4SwRiBl3G8g2TMQbZqZ4XTsaFPYzV5L5WMGgljI0ghaVB+RvmgHE3I07
	eivxr2vQHXbFoYWJ6QG0WBQfPzGsYeawKJipWVidpvlwJrsbw4x4PdhQqo5Am1f0kClV
	lOLQ==
X-Gm-Message-State: AG10YOSW5FaLMSXwcaVStHqH7vXYhzjDgdSDOF6wbuJ9Iocfh+PbbRMR/S5/UoJ8f0llWdjxSI6CLrxMKshuJQ==
X-Received: by 10.202.104.169 with SMTP id o41mr12706023oik.57.1455910713820; 
	Fri, 19 Feb 2016 11:38:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.49.199 with HTTP; Fri, 19 Feb 2016 11:38:04 -0800 (PST)
In-Reply-To: <1455892784-11328-3-git-send-email-peter.maydell@linaro.org>
References: <1455892784-11328-1-git-send-email-peter.maydell@linaro.org>
	<1455892784-11328-3-git-send-email-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 19 Feb 2016 11:38:04 -0800
Message-ID: <CAKmqyKNy79b8_k2wOO_v0DgXc3OCwhcHv7zVkcEPe_Fft6-Gpw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::236
Cc: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 2/2] target-arm: Implement
 MDCR_EL3.TPM and MDCR_EL2.TPM traps
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
X-TUID: kFSn6SHVg6Eh

On Fri, Feb 19, 2016 at 6:39 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
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

Hey Peter,

Why not use else if?

Also, I'll hopefully be able to have another look at the PMU patches
next week. I'll make sure to rebase them on top of this.

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

Same here

Thanks,

Alistair

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
> --
> 1.9.1
>
>
