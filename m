Received: by 10.25.208.211 with SMTP id h202csp207077lfg;
        Thu, 31 Mar 2016 07:59:57 -0700 (PDT)
X-Received: by 10.140.144.132 with SMTP id 126mr17845283qhq.102.1459436397567;
        Thu, 31 Mar 2016 07:59:57 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w198si8079593qkw.58.2016.03.31.07.59.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Mar 2016 07:59:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60982 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ale4j-0006Mg-6L
	for alex.bennee@linaro.org; Thu, 31 Mar 2016 10:59:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33094)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1ale4a-0006Cq-GY
	for qemu-arm@nongnu.org; Thu, 31 Mar 2016 10:59:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1ale4U-0007BQ-Np
	for qemu-arm@nongnu.org; Thu, 31 Mar 2016 10:59:48 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:34130)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>)
	id 1ale4U-0007BI-HO; Thu, 31 Mar 2016 10:59:42 -0400
Received: by mail-oi0-x242.google.com with SMTP id q133so8082925oib.1;
	Thu, 31 Mar 2016 07:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=2TPh6xMdmuEtR4QWZvD996WEPvfinMLMrJ3ImuOqo4U=;
	b=dWq4Qzd9o0na9I3xOZQDgN2wXKGNEfqptPbKeREbid3eE5GASqj5llWH2OLpkjEwry
	Z5eMOrpcIx1nl/0c6sKtAeqNE0BWZE2ktFs/4QRTxOC+1c1yZJ58neTQzRRgnFY+LX+5
	DVgFMYKFfxlnkhkqWBBaanjSzTKLakHtVGGdPM8hUXFzPw+DHrmXQogtcv54zBcWk/89
	STq/hmAT0OSTkLsY8vcYBEvet8vo928y0mJ9/CozzKPFRCT4W2VuNNLDhUxF51mXpg28
	YcbeCoXMS3cohfUg+yhEljAYde3h+ziu/AM0LW2g/DtX3T53W0K3LFBgZGw+y7UhC+QO
	ZGPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=2TPh6xMdmuEtR4QWZvD996WEPvfinMLMrJ3ImuOqo4U=;
	b=Z2/XmoAJ3i/msEfOrjqRq/KbxS23zPuvY0RtBqUdyeZJrHf9E8Le2bSZhVJmbzJ3JZ
	pPisuGkhdal8N7qqs4qp8lAaYDOZGEKa4EgMuOloKhknkc6p5Z1n/B7re8YULwh4wDx2
	MYaYAJArvF/iC2JcZvmQMkvAMnwkEe3G9v1LyL6L9kbCi4xaZPjq8QJq33vOvf6dbCG/
	xi0EVpRq1M2fDXN2d5QKI0sjJws5aOVDgNwseFqG8TWGuf4A3rg82wuREKj5OqCnxLbl
	odzsE67d82uJWz3qyeD1+O9PCee1qUeH+2l64gYj5k6ywLuoBPJJ7fD7dZbeuueZAwLo
	quSA==
X-Gm-Message-State: AD7BkJJ39KLc70C7qiX9B43l6Me6Ab9USbzQTDXBIclcmMOT8I5FjwppkQeUcMDVKdcpTIlQd2/jiFcARmEJNA==
MIME-Version: 1.0
X-Received: by 10.157.9.225 with SMTP id 30mr8282020otz.10.1459436381705; Thu,
	31 Mar 2016 07:59:41 -0700 (PDT)
Received: by 10.157.1.118 with HTTP; Thu, 31 Mar 2016 07:59:41 -0700 (PDT)
In-Reply-To: <1459435778-5526-2-git-send-email-peter.maydell@linaro.org>
References: <1459435778-5526-1-git-send-email-peter.maydell@linaro.org>
	<1459435778-5526-2-git-send-email-peter.maydell@linaro.org>
Date: Thu, 31 Mar 2016 16:59:41 +0200
Message-ID: <CABoDooNXFi4Bh8EgOOSbpOhFyPaC1+o9JPENd_N8=MAgOmbotg@mail.gmail.com>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::242
Cc: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Sergey Fedorov <sergey.fedorov@linaro.org>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/4] target-arm: Correctly reset
 SCTLR_EL3 for 64-bit CPUs
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
X-TUID: d2y1kDLAKf+M

On Thu, Mar 31, 2016 at 4:49 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> The regdef for SCTRL_EL3 was incorrectly marked as being an
> ARM_CP_ALIAS, with the remark that this was because the 32-bit
> definition would take care of reset and migration. However the
> intention for banked registers as documented in the comment in
> add_cpreg_to_hashtable() is:
>
>  * 2) If ARMv8 is enabled then we can count on a 64-bit version
>  *    taking care of the secure bank.  This requires that separate
>  *    32 and 64-bit definitions are provided.
>
> and so it marks the 32-bit secure banked version as an alias.
> This results in the sctlr_s/sctlr_el[3] field never being reset
> or migrated for a 64-bit CPU with EL3 enabled.
>
> Fix this by removing the ARM_CP_ALIAS annotation from SCTLR_EL3.
> Since this means it now needs a real reset value, move the regdef
> into the same place that we define the 32-bit SCTLR.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Laurent Desnogues <laurent.desnogues@gmail.com>

Thanks,

Laurent

> ---
>  target-arm/helper.c | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 19d5d52..e583e6a 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -3744,11 +3744,6 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
>        .access = PL1_RW, .accessfn = access_trap_aa32s_el1,
>        .writefn = vbar_write, .resetvalue = 0,
>        .fieldoffset = offsetof(CPUARMState, cp15.mvbar) },
> -    { .name = "SCTLR_EL3", .state = ARM_CP_STATE_AA64,
> -      .type = ARM_CP_ALIAS, /* reset handled by AArch32 view */
> -      .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 0, .opc2 = 0,
> -      .access = PL3_RW, .raw_writefn = raw_write, .writefn = sctlr_write,
> -      .fieldoffset = offsetof(CPUARMState, cp15.sctlr_el[3]) },
>      { .name = "TTBR0_EL3", .state = ARM_CP_STATE_AA64,
>        .opc0 = 3, .opc1 = 6, .crn = 2, .crm = 0, .opc2 = 0,
>        .access = PL3_RW, .writefn = vmsa_ttbr_write, .resetvalue = 0,
> @@ -4641,12 +4636,20 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>      }
>      if (arm_feature(env, ARM_FEATURE_EL3)) {
>          define_arm_cp_regs(cpu, el3_cp_reginfo);
> -        ARMCPRegInfo rvbar = {
> -            .name = "RVBAR_EL3", .state = ARM_CP_STATE_AA64,
> -            .opc0 = 3, .opc1 = 6, .crn = 12, .crm = 0, .opc2 = 1,
> -            .type = ARM_CP_CONST, .access = PL3_R, .resetvalue = cpu->rvbar
> +        ARMCPRegInfo el3_regs[] = {
> +            { .name = "RVBAR_EL3", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 6, .crn = 12, .crm = 0, .opc2 = 1,
> +              .type = ARM_CP_CONST, .access = PL3_R, .resetvalue = cpu->rvbar },
> +            { .name = "SCTLR_EL3", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 0, .opc2 = 0,
> +              .access = PL3_RW,
> +              .raw_writefn = raw_write, .writefn = sctlr_write,
> +              .fieldoffset = offsetof(CPUARMState, cp15.sctlr_el[3]),
> +              .resetvalue = cpu->reset_sctlr },
> +            REGINFO_SENTINEL
>          };
> -        define_one_arm_cp_reg(cpu, &rvbar);
> +
> +        define_arm_cp_regs(cpu, el3_regs);
>      }
>      /* The behaviour of NSACR is sufficiently various that we don't
>       * try to describe it in a single reginfo:
> --
> 1.9.1
>
>
