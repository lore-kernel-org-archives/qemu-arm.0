Received: by 10.25.159.19 with SMTP id i19csp1427786lfe;
        Mon, 8 Feb 2016 08:31:56 -0800 (PST)
X-Received: by 10.55.74.197 with SMTP id x188mr35591286qka.104.1454949116411;
        Mon, 08 Feb 2016 08:31:56 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u3si31153393qka.23.2016.02.08.08.31.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Feb 2016 08:31:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46405 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aSojD-0002J8-UO
	for alex.bennee@linaro.org; Mon, 08 Feb 2016 11:31:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33999)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aSoj9-0002DN-AT
	for qemu-arm@nongnu.org; Mon, 08 Feb 2016 11:31:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aSoj4-0006oC-A2
	for qemu-arm@nongnu.org; Mon, 08 Feb 2016 11:31:51 -0500
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:34393)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aSoj3-0006nx-SJ; Mon, 08 Feb 2016 11:31:46 -0500
Received: by mail-lf0-x244.google.com with SMTP id 78so5326800lfy.1;
	Mon, 08 Feb 2016 08:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=DkdGkaqyu7YzRirrA7i+ajcL8lEMB8XzH25YuFku1As=;
	b=pzINh8mECDcPxrIKNLb+shSWxT6lJwGooUXTy+SUNRzHIRzMYWsmE+NkfQw8ButuoT
	/nzIqKnG79/LTZhktsFOz0Bqtdb+DSy60ljUoYQwjHXXjw3X609t6ZTI1TFnhLUYb32H
	ImhjekdIotIwhgog87jyOlMM+jw/dZ2HiEtd6rI1l+YG9O3vYIx33tqUzNK52ZAnz7TM
	T4CHK0ll5HfoPd0Dh0vA+cRbtMdcmTFxfL5a8orNGGTgCwhrzVW2gLXzM2PF6zPNTCMQ
	VpnLEZ8kqhjM+NGKvlZvq8PfkCQVE2IvLhOF1Yc/wWfKFj+R8LCNSL4STAGCaFk0lppV
	e2Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=DkdGkaqyu7YzRirrA7i+ajcL8lEMB8XzH25YuFku1As=;
	b=e9swec2q86tGInJ+hCQwVQn+SG9hR2R7Lck1k0sJiFWpyIxlWJSfpFiHo3hg9zsEl6
	GQIiSHQBrnnBFeZluuUatvndPmZjrNdzBJV3AIYh2yXrbzfu/6krLaWgeby+9Chq6EjF
	+2Ih9rTDj3QLBBLsrbI5pTZZRmWyi/jjVa76Fjs0duRaSRoMkMey6dszSjXXMJDw31B+
	iqkSd7kOaekTcgbd6T99kBeXTBEBFDPtic6GfsHFnWay/bu8huWG9cB0R9BY2Y9pHP3m
	nTqfZCKF9f8v8ZuBodg3HSsYYZQclTvLq0djwdW2o31mFRMEoA1jjr7ctRCn22pXcI2A
	uYNg==
X-Gm-Message-State: AG10YOQvLO/MjpPvo6tgCWFwEZkRZKbQKnK4GYRRSL7FEIe424pg4OkFR5muk8kqUKPlBA==
X-Received: by 10.25.167.74 with SMTP id q71mr9778275lfe.24.1454949105092;
	Mon, 08 Feb 2016 08:31:45 -0800 (PST)
Received: from [10.30.10.50] ([213.243.91.10])
	by smtp.googlemail.com with ESMTPSA id
	p124sm4120444lfe.31.2016.02.08.08.31.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 08 Feb 2016 08:31:43 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1454690704-16233-1-git-send-email-peter.maydell@linaro.org>
	<1454690704-16233-6-git-send-email-peter.maydell@linaro.org>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56B8C2EE.5090700@gmail.com>
Date: Mon, 8 Feb 2016 19:31:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1454690704-16233-6-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::244
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 5/6] target-arm: Implement
 MDCR_EL2.TDA and MDCR_EL2.TDA traps
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
X-TUID: xcP5pPPy2+mD

One of the MDCR_EL2's should be MDCR_EL3 instead.

On 05.02.2016 19:45, Peter Maydell wrote:
> Implement the debug register traps controlled by MDCR_EL2.TDA
> and MDCR_EL3.TDA.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target-arm/helper.c | 39 ++++++++++++++++++++++++++++++---------
>  1 file changed, 30 insertions(+), 9 deletions(-)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 8c2adbc..064b415 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -420,6 +420,24 @@ static CPAccessResult access_tdra(CPUARMState *env, const ARMCPRegInfo *ri,
>      return CP_ACCESS_OK;
>  }
>  
> +/* Check for traps to general debug registers, which are controlled
> + * by MDCR_EL2.TDA for EL2 and MDCR_EL3.TDA for EL3.
> + */
> +static CPAccessResult access_tda(CPUARMState *env, const ARMCPRegInfo *ri,
> +                                  bool isread)
> +{
> +    int el = arm_current_el(env);
> +
> +    if (el < 2 && (env->cp15.mdcr_el2 & MDCR_TDA)
> +        && !arm_is_secure_below_el3(env)) {
> +        return CP_ACCESS_TRAP_EL2;
> +    }
> +    if (el < 3 && (env->cp15.mdcr_el3 & MDCR_TDA)) {
> +        return CP_ACCESS_TRAP_EL3;
> +    }
> +    return CP_ACCESS_OK;
> +}
> +
>  static void dacr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
>  {
>      ARMCPU *cpu = arm_env_get_cpu(env);
> @@ -3385,7 +3403,8 @@ static const ARMCPRegInfo el3_no_el2_cp_reginfo[] = {
>        .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
>      { .name = "MDCR_EL2", .state = ARM_CP_STATE_BOTH,
>        .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 1,
> -      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
> +      .access = PL2_RW, .accessfn = access_tda,
> +      .type = ARM_CP_CONST, .resetvalue = 0 },
>      { .name = "HPFAR_EL2", .state = ARM_CP_STATE_BOTH,
>        .opc0 = 3, .opc1 = 4, .crn = 6, .crm = 0, .opc2 = 4,
>        .access = PL2_RW, .accessfn = access_el3_aa32ns_aa64any,
> @@ -3804,7 +3823,7 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
>      /* Monitor debug system control register; the 32-bit alias is DBGDSCRext. */
>      { .name = "MDSCR_EL1", .state = ARM_CP_STATE_BOTH,
>        .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 2,
> -      .access = PL1_RW,
> +      .access = PL1_RW, .accessfn = access_tda,
>        .fieldoffset = offsetof(CPUARMState, cp15.mdscr_el1),
>        .resetvalue = 0 },
>      /* MDCCSR_EL0, aka DBGDSCRint. This is a read-only mirror of MDSCR_EL1.
> @@ -3813,7 +3832,7 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
>      { .name = "MDCCSR_EL0", .state = ARM_CP_STATE_BOTH,
>        .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 0,
>        .type = ARM_CP_ALIAS,
> -      .access = PL1_R,
> +      .access = PL1_R, .accessfn = access_tda,

From ARMv8 ARM rev. A.h: "If MDSCR_EL1.TDCC==1, EL0 read accesses to
this register are trapped to EL1." But it seems like we just don't
implement "Config-RO for EL0" so far. Maybe it's worth to implement a
separate function for checks controlled by MDSCR_EL1.TDCC?

>        .fieldoffset = offsetof(CPUARMState, cp15.mdscr_el1), },
>      { .name = "OSLAR_EL1", .state = ARM_CP_STATE_BOTH,
>        .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 1, .crm = 0, .opc2 = 4,
> @@ -3835,7 +3854,8 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
>       */
>      { .name = "DBGVCR",
>        .cp = 14, .opc1 = 0, .crn = 0, .crm = 7, .opc2 = 0,
> -      .access = PL1_RW, .type = ARM_CP_NOP },
> +      .access = PL1_RW, .accessfn = access_tda,
> +      .type = ARM_CP_NOP },
>      REGINFO_SENTINEL
>  };
>  
> @@ -4100,7 +4120,8 @@ static void define_debug_regs(ARMCPU *cpu)
>      int wrps, brps, ctx_cmps;
>      ARMCPRegInfo dbgdidr = {
>          .name = "DBGDIDR", .cp = 14, .crn = 0, .crm = 0, .opc1 = 0, .opc2 = 0,
> -        .access = PL0_R, .type = ARM_CP_CONST, .resetvalue = cpu->dbgdidr,
> +        .access = PL0_R, .accessfn = access_tda,
> +        .type = ARM_CP_CONST, .resetvalue = cpu->dbgdidr,

The same concern as above.

Kind regards,
Sergey

>      };
>  
>      /* Note that all these register fields hold "number of Xs minus 1". */
> @@ -4131,13 +4152,13 @@ static void define_debug_regs(ARMCPU *cpu)
>          ARMCPRegInfo dbgregs[] = {
>              { .name = "DBGBVR", .state = ARM_CP_STATE_BOTH,
>                .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = i, .opc2 = 4,
> -              .access = PL1_RW,
> +              .access = PL1_RW, .accessfn = access_tda,
>                .fieldoffset = offsetof(CPUARMState, cp15.dbgbvr[i]),
>                .writefn = dbgbvr_write, .raw_writefn = raw_write
>              },
>              { .name = "DBGBCR", .state = ARM_CP_STATE_BOTH,
>                .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = i, .opc2 = 5,
> -              .access = PL1_RW,
> +              .access = PL1_RW, .accessfn = access_tda,
>                .fieldoffset = offsetof(CPUARMState, cp15.dbgbcr[i]),
>                .writefn = dbgbcr_write, .raw_writefn = raw_write
>              },
> @@ -4150,13 +4171,13 @@ static void define_debug_regs(ARMCPU *cpu)
>          ARMCPRegInfo dbgregs[] = {
>              { .name = "DBGWVR", .state = ARM_CP_STATE_BOTH,
>                .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = i, .opc2 = 6,
> -              .access = PL1_RW,
> +              .access = PL1_RW, .accessfn = access_tda,
>                .fieldoffset = offsetof(CPUARMState, cp15.dbgwvr[i]),
>                .writefn = dbgwvr_write, .raw_writefn = raw_write
>              },
>              { .name = "DBGWCR", .state = ARM_CP_STATE_BOTH,
>                .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = i, .opc2 = 7,
> -              .access = PL1_RW,
> +              .access = PL1_RW, .accessfn = access_tda,
>                .fieldoffset = offsetof(CPUARMState, cp15.dbgwcr[i]),
>                .writefn = dbgwcr_write, .raw_writefn = raw_write
>              },

