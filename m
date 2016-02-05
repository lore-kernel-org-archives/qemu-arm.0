Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id v78sm9132522wmv.23.2016.02.05.05.43.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Feb 2016 05:43:56 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 45C2D3E025C;
	Fri,  5 Feb 2016 13:43:55 +0000 (GMT)
References: <1454506721-11843-1-git-send-email-peter.maydell@linaro.org> <1454506721-11843-4-git-send-email-peter.maydell@linaro.org>
User-agent: mu4e 0.9.17; emacs 25.0.90.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH 3/7] target-arm: Use access_trap_aa32s_el1() for SCR and MVBAR
In-reply-to: <1454506721-11843-4-git-send-email-peter.maydell@linaro.org>
Date: Fri, 05 Feb 2016 13:43:55 +0000
Message-ID: <87lh6znug4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: KVBoOR28k35c


Peter Maydell <peter.maydell@linaro.org> writes:

> The registers MVBAR and SCR should have the behaviour of trapping to
> EL3 if accessed from Secure EL1, but we were incorrectly implementing
> them to UNDEF (which would trap to EL1).  Fix this by using the new
> access_trap_aa32s_el1() access function.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target-arm/helper.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 8b96b80..d85b04f 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -3547,7 +3547,8 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
>        .resetvalue = 0, .writefn = scr_write },
>      { .name = "SCR",  .type = ARM_CP_ALIAS,
>        .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 0,
> -      .access = PL3_RW, .fieldoffset = offsetoflow32(CPUARMState, cp15.scr_el3),
> +      .access = PL1_RW, .accessfn = access_trap_aa32s_el1,
> +      .fieldoffset = offsetoflow32(CPUARMState, cp15.scr_el3),
>        .writefn = scr_write },
>      { .name = "MDCR_EL3", .state = ARM_CP_STATE_AA64,
>        .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 3, .opc2 = 1,
> @@ -3569,7 +3570,8 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
>        .access = PL3_W | PL1_R, .resetvalue = 0,
>        .fieldoffset = offsetof(CPUARMState, cp15.nsacr) },
>      { .name = "MVBAR", .cp = 15, .opc1 = 0, .crn = 12, .crm = 0, .opc2 = 1,
> -      .access = PL3_RW, .writefn = vbar_write, .resetvalue = 0,
> +      .access = PL1_RW, .accessfn = access_trap_aa32s_el1,
> +      .writefn = vbar_write, .resetvalue = 0,
>        .fieldoffset = offsetof(CPUARMState, cp15.mvbar) },
>      { .name = "SCTLR_EL3", .state = ARM_CP_STATE_AA64,
>        .type = ARM_CP_ALIAS, /* reset handled by AArch32 view */

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

--
Alex Bennée
