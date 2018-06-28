Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp7617697wrq;
        Thu, 28 Jun 2018 09:24:24 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcRGxSJGmM/iKpu6gc0Nya9RAN0FPIASgKh+QTvbJ+5igYr+KquLpyS/MYTxbPd+ifctkop
X-Received: by 2002:a0c:d80f:: with SMTP id h15-v6mr9881565qvj.5.1530203063967;
        Thu, 28 Jun 2018 09:24:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530203063; cv=none;
        d=google.com; s=arc-20160816;
        b=elPfUt760I2jrIFlrEt7H7wgnT0vZzsAmhe5wSy7R+1j7FM52RlcQ6NnNHvssR2Wt1
         /awb61y6330Npahihl1oorqSDZ7Dn4b5l3s3hLA6R4S0XNlCewlUEy43pus814K0zWNv
         5Oqym2ms5JroG01ANUgid1nRQRBNlkv0X8Gy9LlEwga/yvCIZUPAZsuLoZGQysL1Vqdh
         apwxPZqdLhTYKHAsHtZbjWyUWy6cClPkmh+5nr188fy1IFH+bM0xOH06AjUXRGkNyxoH
         z41IDRKEEsFJWtK2wB/Bt1uDNbUHXNDNDMr9l5rcJJP+TZ8boiqn9qjG05a1NJ6a4KFY
         MRsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=UaudN+qc+he4KBmrRYQxn2LrjXyT3Vn45QRW9/Xz1Qg=;
        b=rDUFJT1Bb1McDaU1hyr6r27pDh9CJSwMVihzZzNWo1baEiqNipSgaxWiBw4Srw2KUt
         FHd5Ei3cpqF9jKxOLnCbvYQZWP52LX0wP4rK3JgNDjUZiRgs+OIbuDIYaKUi8VXNwk7G
         ZkhsfBpt7l29v3+OdlObkiOEDY/K6bNX+47L1E9Z8EfWdxl2oUzWEvUMGukvwPpr0Gr2
         F5XNM5+aw/2tImqZb9OBGR7XfLgrzm+DA0nuJkGoMuxlFn3QmG1nZJAcR9FJ7Tb6nMKb
         DvKRYO/03oaNxWqFQ5RVzO4d97vd6yhaDosk4llbciIbI2w7PMn/JTV8KWUQejX0c7z5
         hfUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d3BuMP35;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p2-v6si7317112qvk.287.2018.06.28.09.24.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jun 2018 09:24:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d3BuMP35;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37506 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYZiZ-0005t8-Cp
	for alex.bennee@linaro.org; Thu, 28 Jun 2018 12:24:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47981)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fYZiL-0005qv-R4
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 12:24:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fYZiK-0003lP-N7
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 12:24:09 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:32824)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fYZiK-0003l2-Id
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 12:24:08 -0400
Received: by mail-oi0-x243.google.com with SMTP id c6-v6so5760070oiy.0
	for <qemu-arm@nongnu.org>; Thu, 28 Jun 2018 09:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UaudN+qc+he4KBmrRYQxn2LrjXyT3Vn45QRW9/Xz1Qg=;
	b=d3BuMP35FpRw1dSdIvo48tjfEV21RDluIZmnT4rBx/fk9mApY1wDVgMITvN8GceNqx
	3oBMTdhtq53imtjfX9d7ISsBn5l7drozVs0rhhsVz2CUeCvyUYYWI2Fusl/ere8EUC0A
	cpscbKvXYorCnv8oirZwtkagxRpmzP8a0qJNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UaudN+qc+he4KBmrRYQxn2LrjXyT3Vn45QRW9/Xz1Qg=;
	b=ccDn0HXr6s7TFohEF36eKIBvtbIZ+JqRjFFMgTvrJYuh1xPD56Nod2uL/XtgbQAqFw
	KGIh9PVHhhzzwIwGzCZZ1yNiVbTn+fUckXgiNNWZAsT1+XkorWG7BiNQ7CzDCgl2k5oZ
	SBJFMu9Q69z2AR0ibmoWvKYYpFwyZ/j5A4+5pnC3WRHgjKJ+gpi9qG6QaGewpPCqRxBo
	S3EKk+Twtx2Ek+u2RKbSnGmnN8q8k/RCc6loo+4XnCXsn9JA0PutL0Iu9KNiY7tRXrTV
	Wvd6LUWcQCAJtXLzgvNgRZxVMZjydf9MDPx+VLx+kn1K/71uJr0og2EndC1GAlQyGIWK
	+x9A==
X-Gm-Message-State: APt69E3LNqQ01fiyodLxdrXMLcPdxz95hE8ohqkPpgIjPMEfezVtCcbc
	cWPaDu1uWsRwuP24kf8a4gOZ2yf6qjAomOMWoWtMTHk8
X-Received: by 2002:aca:a846:: with SMTP id
	r67-v6mr6304950oie.12.1530203047958; 
	Thu, 28 Jun 2018 09:24:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:902:0:0:0:0:0 with HTTP;
	Thu, 28 Jun 2018 09:23:47 -0700 (PDT)
In-Reply-To: <1529699547-17044-7-git-send-email-alindsay@codeaurora.org>
References: <1529699547-17044-1-git-send-email-alindsay@codeaurora.org>
	<1529699547-17044-7-git-send-email-alindsay@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jun 2018 17:23:47 +0100
Message-ID: <CAFEAcA-0_PQdFXo_vY-cxkeC_HwxsKhCe7VNy7+4iCX-NqtOqw@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH v5 06/13] target/arm: Implement PMOVSSET
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
Cc: Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Aaron Lindsay <aclindsa@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g498OfKKEwyx

On 22 June 2018 at 21:32, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> Add an array for PMOVSSET so we only define it for v7ve+ platforms
>
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> ---
>  target/arm/helper.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 7d63bb2..5d83446 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -1293,9 +1293,17 @@ static void pmcntenclr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>  static void pmovsr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                           uint64_t value)
>  {
> +    value &= pmu_counter_mask(env);
>      env->cp15.c9_pmovsr &= ~value;
>  }

This change doesn't look like it should be in this patch ?

>
> +static void pmovsset_write(CPUARMState *env, const ARMCPRegInfo *ri,
> +                         uint64_t value)
> +{
> +    value &= pmu_counter_mask(env);
> +    env->cp15.c9_pmovsr |= value;
> +}
> +
>  static void pmxevtyper_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                               uint64_t value)
>  {
> @@ -1645,6 +1653,23 @@ static const ARMCPRegInfo v7mp_cp_reginfo[] = {
>      REGINFO_SENTINEL
>  };
>
> +static const ARMCPRegInfo pmovsset_cp_reginfo[] = {
> +    /* PMOVSSET is not implemented in v7 before v7ve */
> +    { .name = "PMOVSSET", .cp = 15, .opc1 = 0, .crn = 9, .crm = 14, .opc2 = 3,
> +      .access = PL0_RW, .accessfn = pmreg_access,
> +      .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmovsr),
> +      .writefn = pmovsset_write,
> +      .raw_writefn = raw_write },

This should be marked ARM_CP_ALIAS, beacuse its underlying
state in c9_pmovsr is just an alias into PMOVSR, and that
register is handling reset and migration.

> +    { .name = "PMOVSSET_EL0", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 14, .opc2 = 3,
> +      .access = PL0_RW, .accessfn = pmreg_access,
> +      .type = ARM_CP_ALIAS,
> +      .fieldoffset = offsetof(CPUARMState, cp15.c9_pmovsr),
> +      .writefn = pmovsset_write,
> +      .raw_writefn = raw_write },
> +    REGINFO_SENTINEL
> +};
> +
>  static void teecr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                          uint64_t value)
>  {
> @@ -4996,6 +5021,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>          !arm_feature(env, ARM_FEATURE_PMSA)) {
>          define_arm_cp_regs(cpu, v7mp_cp_reginfo);
>      }
> +    if (arm_feature(env, ARM_FEATURE_V7VE)) {
> +        define_arm_cp_regs(cpu, pmovsset_cp_reginfo);
> +    }
>      if (arm_feature(env, ARM_FEATURE_V7)) {
>          /* v7 performance monitor control register: same implementor
>           * field as main ID register, and we implement only the cycle
> --

thanks
-- PMM
