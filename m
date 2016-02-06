Received: by 10.25.159.19 with SMTP id i19csp520410lfe;
        Sat, 6 Feb 2016 08:49:13 -0800 (PST)
X-Received: by 10.140.28.133 with SMTP id 5mr17221375qgz.79.1454777353731;
        Sat, 06 Feb 2016 08:49:13 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n73si21827794qhc.34.2016.02.06.08.49.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 06 Feb 2016 08:49:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55013 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aS62r-0003Nd-A6
	for alex.bennee@linaro.org; Sat, 06 Feb 2016 11:49:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48150)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1aS62o-0003K1-CK
	for qemu-arm@nongnu.org; Sat, 06 Feb 2016 11:49:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1aS62n-0008GE-5v
	for qemu-arm@nongnu.org; Sat, 06 Feb 2016 11:49:10 -0500
Received: from mail-pa0-x241.google.com ([2607:f8b0:400e:c03::241]:33419)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1aS62i-0008Fp-AK; Sat, 06 Feb 2016 11:49:04 -0500
Received: by mail-pa0-x241.google.com with SMTP id pv5so3813254pac.0;
	Sat, 06 Feb 2016 08:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=x58GWLwV9B2Yo4KVkARci234zUlOg1dFq1f6C0jwsCc=;
	b=izLWskihmaAcVv+veInKxdBgy4xpBtipmmQuesiIi/f0jR3YJ0EsNuhnWBiQnZC9tT
	OUO19H2G3dOxu680Y7bEH5uq2OspfKKt2K8GE4NC9EjZUaGrotyxuY8F9u2POw1eaa/H
	lROqOr16TxMNYHoVBVfBMo2XAPmdqMngKpNddafkgRJ76db11naAbBYRLjqH82xWeGqr
	8qhZyfOMpBU19AhucHTzGfw1//XLjZVVrWXBPlrPGThOwxtqmPaP63FkzKXxDv54EdIU
	TG50Uwf1GNp1MFqdtP0QCPbMi4oj5f+et1ty7SH785uXH8n0Kkpk4UGU6fgHLlzcnAU9
	yIGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=x58GWLwV9B2Yo4KVkARci234zUlOg1dFq1f6C0jwsCc=;
	b=Owh/8YcCpM5OisFILj4wDtAuWTc60rFJiKPGa3ZvcuIkyDjE/5saZ0j+62DGXpdu70
	P9CVtGQUvOsL6B7WIea/cOaOE+YU3859FHnN5z2Cc766UjsfQAxKJM/VCipBjZIEOzf3
	Z40xMF+eXSvKoiAtgGLuG+5NCJQ0kJ1IiO1MNLYWSjO9EFArc9AMOC057g4ZCHJtZfzU
	7qaUfjCTqhPQoGGTFJthWrT18EC+UgWqkj4NXDxF/3AqmKFCpFEo06u9DBuiTO/fTq2J
	CdbbdLLLmPRrZoRGRQEpUdo2ojtVjYtIoKMEhHXAOHDA8u8aRLS13UnSddTEzV6wWqf0
	GFYw==
X-Gm-Message-State: AG10YOR1Dt2Jvu2Aof2FEnoVNqGlg0wIaUoxWPkrGvjaylhNlTMTX5iQ3czjkArJhMKBYA==
X-Received: by 10.66.230.201 with SMTP id ta9mr29154857pac.52.1454777343368;
	Sat, 06 Feb 2016 08:49:03 -0800 (PST)
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com.
	[52.8.89.49]) by smtp.gmail.com with ESMTPSA id
	cq4sm32365456pad.28.2016.02.06.08.49.01
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Sat, 06 Feb 2016 08:49:02 -0800 (PST)
Date: Sat, 6 Feb 2016 17:42:24 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160206164224.GG3913@toto>
References: <1454506721-11843-1-git-send-email-peter.maydell@linaro.org>
	<1454506721-11843-7-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1454506721-11843-7-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::241
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH 6/7] target-arm: Implement NSACR trapping
	behaviour
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
X-TUID: dr+XjK327m0J

On Wed, Feb 03, 2016 at 01:38:40PM +0000, Peter Maydell wrote:
> Implement some corner cases of the behaviour of the NSACR
> register on ARMv8:
>  * if EL3 is AArch64 then accessing the NSACR from Secure EL1
>    with AArch32 should trap to EL3
>  * if EL3 is not present or is AArch64 then reads from NS EL1 and
>    NS EL2 return constant 0xc00
> 
> It would in theory be possible to implement all these with
> a single reginfo definition, but for clarity we use three
> separate definitions for the three cases and install the
> right one based on the CPU feature flags.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

AFAICT it looks OK

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  target-arm/helper.c | 62 +++++++++++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 58 insertions(+), 4 deletions(-)
> 
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 8bc3ea3..34dc144 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -3562,6 +3562,25 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
>      REGINFO_SENTINEL
>  };
>  
> +static CPAccessResult nsacr_access(CPUARMState *env, const ARMCPRegInfo *ri,
> +                                   bool isread)
> +{
> +    /* The NSACR is RW at EL3, and RO for NS EL1 and NS EL2.
> +     * At Secure EL1 it traps to EL3.
> +     */
> +    if (arm_current_el(env) == 3) {
> +        return CP_ACCESS_OK;
> +    }
> +    if (arm_is_secure_below_el3(env)) {
> +        return CP_ACCESS_TRAP_EL3;
> +    }
> +    /* Accesses from EL1 NS and EL2 NS are UNDEF for write but allow reads. */
> +    if (isread) {
> +        return CP_ACCESS_OK;
> +    }
> +    return CP_ACCESS_TRAP_UNCATEGORIZED;
> +}
> +
>  static const ARMCPRegInfo el3_cp_reginfo[] = {
>      { .name = "SCR_EL3", .state = ARM_CP_STATE_AA64,
>        .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 1, .opc2 = 0,
> @@ -3587,10 +3606,6 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
>        .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 1,
>        .access = PL3_RW, .resetvalue = 0,
>        .fieldoffset = offsetoflow32(CPUARMState, cp15.sder) },
> -      /* TODO: Implement NSACR trapping of secure EL1 accesses to EL3 */
> -    { .name = "NSACR", .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 2,
> -      .access = PL3_W | PL1_R, .resetvalue = 0,
> -      .fieldoffset = offsetof(CPUARMState, cp15.nsacr) },
>      { .name = "MVBAR", .cp = 15, .opc1 = 0, .crn = 12, .crm = 0, .opc2 = 1,
>        .access = PL1_RW, .accessfn = access_trap_aa32s_el1,
>        .writefn = vbar_write, .resetvalue = 0,
> @@ -4361,6 +4376,45 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>          };
>          define_one_arm_cp_reg(cpu, &rvbar);
>      }
> +    /* The behaviour of NSACR is sufficiently various that we don't
> +     * try to describe it in a single reginfo:
> +     *  if EL3 is 64 bit, then trap to EL3 from S EL1,
> +     *     reads as constant 0xc00 from NS EL1 and NS EL2
> +     *  if EL3 is 32 bit, then RW at EL3, RO at NS EL1 and NS EL2
> +     *  if v7 without EL3, register doesn't exist
> +     *  if v8 without EL3, reads as constant 0xc00 from NS EL1 and NS EL2
> +     */
> +    if (arm_feature(env, ARM_FEATURE_EL3)) {
> +        if (arm_feature(env, ARM_FEATURE_AARCH64)) {
> +            ARMCPRegInfo nsacr = {
> +                .name = "NSACR", .type = ARM_CP_CONST,
> +                .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 2,
> +                .access = PL1_RW, .accessfn = nsacr_access,
> +                .resetvalue = 0xc00
> +            };
> +            define_one_arm_cp_reg(cpu, &nsacr);
> +        } else {
> +            ARMCPRegInfo nsacr = {
> +                .name = "NSACR",
> +                .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 2,
> +                .access = PL3_RW | PL1_R,
> +                .resetvalue = 0,
> +                .fieldoffset = offsetof(CPUARMState, cp15.nsacr)
> +            };
> +            define_one_arm_cp_reg(cpu, &nsacr);
> +        }
> +    } else {
> +        if (arm_feature(env, ARM_FEATURE_V8)) {
> +            ARMCPRegInfo nsacr = {
> +                .name = "NSACR", .type = ARM_CP_CONST,
> +                .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 2,
> +                .access = PL1_R,
> +                .resetvalue = 0xc00
> +            };
> +            define_one_arm_cp_reg(cpu, &nsacr);
> +        }
> +    }
> +
>      if (arm_feature(env, ARM_FEATURE_MPU)) {
>          if (arm_feature(env, ARM_FEATURE_V6)) {
>              /* PMSAv6 not implemented */
> -- 
> 1.9.1
> 
