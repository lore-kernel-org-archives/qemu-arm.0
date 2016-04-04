Received: by 10.25.208.211 with SMTP id h202csp1160800lfg;
        Mon, 4 Apr 2016 07:14:13 -0700 (PDT)
X-Received: by 10.140.140.16 with SMTP id 16mr23030178qhm.60.1459779253027;
        Mon, 04 Apr 2016 07:14:13 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e7si22417984qga.19.2016.04.04.07.14.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Apr 2016 07:14:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58885 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1an5Ge-0002My-Dx
	for alex.bennee@linaro.org; Mon, 04 Apr 2016 10:14:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35614)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sergey.fedorov@linaro.org>) id 1an5GX-0002LQ-0o
	for qemu-arm@nongnu.org; Mon, 04 Apr 2016 10:14:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sergey.fedorov@linaro.org>) id 1an5GS-0006QH-0Y
	for qemu-arm@nongnu.org; Mon, 04 Apr 2016 10:14:04 -0400
Received: from mail-lb0-x235.google.com ([2a00:1450:4010:c04::235]:33456)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sergey.fedorov@linaro.org>) id 1an5GR-0006Pc-JQ
	for qemu-arm@nongnu.org; Mon, 04 Apr 2016 10:13:59 -0400
Received: by mail-lb0-x235.google.com with SMTP id u8so163088153lbk.0
	for <qemu-arm@nongnu.org>; Mon, 04 Apr 2016 07:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=MIifCr57XXBJE3JTcnVXoZsbVEhI2MOQbT8EZCioUdA=;
	b=IuoM3zVwDjNhfzcW+Hz39VRn/Pm+3tYN3Xvwd9gROIGiwjG1dgHa42VYsllE7Geo3+
	O1J9JA8yEcd4dfbaoOwgG8TPyExivQb4cGsoX56YBQrr0lZSb7vvy0OTf+m+21fnnIje
	cTI+cq855+G0qu7tp1c3LuhnJSztm4gQNIYis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=MIifCr57XXBJE3JTcnVXoZsbVEhI2MOQbT8EZCioUdA=;
	b=J2fDrGZ0k8N7n17fTBtjw8X1yE6cRqnn33JnpmEVcnqsY4mDQDv8PBmINdVk4/qWbh
	8OVwbSBIHnswaaA/iVoCReZKmYm0h+EAC3mRFIdpkvhpi5s3/iE3FCQWEAJjWUI15bAd
	gmh6UAC0zHMlIaCeg1wiEYFjPCTcprDo56E8org937jZOQgUEIvE22ofJz2puBOhKVUz
	9DYyA6JLHgU76VxTqXMwYvJaMOOuI8oor81Sy4HpjWFZXVgewV0jub2cXzXyl3k/vcoM
	wt2C08ibsKpfhQNgv9s+IzkgYBxrxUbaeUL53Oop2ffCMUBwKPM2FhVIOjqh9URq9zP5
	T2qg==
X-Gm-Message-State: AD7BkJK2/usXWV/Je6zXdjNhbleSC1OAX3QGGInxAszLfrW97aJVt+vVXB4He+NxvQMt8WHh
X-Received: by 10.112.13.8 with SMTP id d8mr8309334lbc.110.1459779238553;
	Mon, 04 Apr 2016 07:13:58 -0700 (PDT)
Received: from [192.168.0.46] ([195.91.132.170])
	by smtp.gmail.com with ESMTPSA id
	m35sm3001089lfi.25.2016.04.04.07.13.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Apr 2016 07:13:57 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1459435778-5526-1-git-send-email-peter.maydell@linaro.org>
	<1459435778-5526-2-git-send-email-peter.maydell@linaro.org>
From: Sergey Fedorov <sergey.fedorov@linaro.org>
Message-ID: <570276A5.1070505@linaro.org>
Date: Mon, 4 Apr 2016 17:13:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1459435778-5526-2-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::235
Subject: Re: [Qemu-arm] [PATCH 1/4] target-arm: Correctly reset SCTLR_EL3
	for 64-bit CPUs
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
X-TUID: C7mDBECdsdmx

On 31/03/16 17:49, Peter Maydell wrote:
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

Reviewed-by: Sergey Fedorov <sergey.fedorov@linaro.org>

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

