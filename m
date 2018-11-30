Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3749337wrt;
        Fri, 30 Nov 2018 08:10:32 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VCd1EGosXi9zQAEnm+uhCmC3hw1Gz0fA6hyQOEG4moKuLCNIcd5lbDdZaAtXPLYvmk9dBT
X-Received: by 2002:a0d:f883:: with SMTP id i125-v6mr6262470ywf.55.1543594232789;
        Fri, 30 Nov 2018 08:10:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543594232; cv=none;
        d=google.com; s=arc-20160816;
        b=tfqyNHS+VG2FIjsFJndcxIk9aOittJZhPE9Tsr8cWMBw1XbxKrCQfyVWSf7J09EYpv
         8ng3iuQ/ZPakqnlVkZ5KArmhhFBNO012u/HPBhA2R8ZAp2RcVumyGRhFxZQ0VO4EBlAv
         K3fVU5O5EpLuCwdD10HgrWbxi3iwHcW+z4TV3waEBz2mzlwneeDKib/C8TVXpgo7C+4p
         0IDelHSfKHdyQFZa934f6Kde3uhtrvSykXCfKkuyBXZCLszte4mb56UhwTBWqDTHwkdw
         G2C9rGpQivtfWdN1kGQ3KdUvyWWKaqRBCvPeODiHCa3cS1pmnSgizHgaOl1HQjDyuoe1
         cZAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T++/rdSUkie+4jxFViA/9yVgXqwk1DjEsl0lJwcuADQ=;
        b=gI1RzGQyTNVs5Z5uRApvctvyo4SDWvWpyMvsX4q2l2X0wGui5SAhtdL3Iq3MdnaBVB
         v+NptezGUtRVtNuEketxnAFpL8Qq5oKm6S7gKUCI23MOtvcdTqS8onSIWvCdtZ0gxgWS
         M/0rfiA9z6fWZ7ZLYLCZI0JMToshHHBJRu9dRt2U25WFvhMJer8Da0TaH1TUHiSic6fB
         ye8yWwVk230xrXCPBAaYJUAFPK2Sijg9A2bUvky42q3K2U6CEO/245Rrj49eLKzaWytX
         KgHMhUvUDdFhq04XwJq01bi+SZUPIB+ctb5unwMjWoYsnGHcqQcxldZcq7p4ppDv7erY
         6Q6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LzQUAVvW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s64si3358561ywc.265.2018.11.30.08.10.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 08:10:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LzQUAVvW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33582 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSlN9-0002Tz-G8
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 11:10:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43081)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gSlMv-0002Sn-8h
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 11:10:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gSlMt-0005Gg-9u
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 11:10:17 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:35421)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gSlMt-0005DP-21
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 11:10:15 -0500
Received: by mail-ot1-x343.google.com with SMTP id 81so5580672otj.2
	for <qemu-arm@nongnu.org>; Fri, 30 Nov 2018 08:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=T++/rdSUkie+4jxFViA/9yVgXqwk1DjEsl0lJwcuADQ=;
	b=LzQUAVvW1b6sfFFohhK+qJv9ZHppWE9viqWYNwj8v69PuJ7W6GKWchR3B7BL4jwLV2
	rJ6aXf4/hsIQLfrQvVbQYdvZf0zJwtXXTbyanf57zELYnIXf9+vDjesanqJeyNarWDry
	HNIJ8yPk72hHvV89CGAllPWXcbwsYPbnFtXx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=T++/rdSUkie+4jxFViA/9yVgXqwk1DjEsl0lJwcuADQ=;
	b=X4ec08aHYTwD7quwykAOvmzJgbhFhB0W4WodLGzhDvODqr9FeN/WqP7TUOmabAxNP0
	fUNnV3XSQhq7VgcJ1bK9Rk3WKTzBmrR5qCrJYvl4RlDUypb9U5IIyjmMj59ARflfn2ls
	OXkyVmKhu+8iteT/Y+Grc6s/SloOAWazWAZCiKv4jUd9i0slSgSEq9Z0UgI3I2DvdwAb
	nVbXxG/unB7ZcBW57dNQkhjQBmyFnWPkqFpELPFaA6hqWla4wUGPPkQsBQhyPVLghr91
	2JK1D2+mFyJbRhGNtcwsOD6xg2olvlpVrtHlft2efu08v/AyF0liuXWEGuVIh1ctMx7H
	VVKA==
X-Gm-Message-State: AA+aEWYMxlYgQXHjKmfUmkm8CCHF4dR9srTQZkT5IlFbcRFXp0BHczxi
	hbSEzqdsg5BYAzl6pRu/uO70lLcHaYZ7nvTQDTbJwQ==
X-Received: by 2002:a9d:bf7:: with SMTP id 110mr4040871oth.201.1543594214408; 
	Fri, 30 Nov 2018 08:10:14 -0800 (PST)
MIME-Version: 1.0
References: <20181120212553.8480-1-aaron@os.amperecomputing.com>
	<20181120212553.8480-8-aaron@os.amperecomputing.com>
In-Reply-To: <20181120212553.8480-8-aaron@os.amperecomputing.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Nov 2018 16:10:03 +0000
Message-ID: <CAFEAcA92+6NdqpB+L42cu1Ba7qvvHoLkjSDgcEDLvR=iqpd4gg@mail.gmail.com>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH v8 07/13] target-arm: Make PMCEID[01]_EL0 64
 bit registers, add PMCEID[23]
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
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ijVk4oM1Qth/

On Tue, 20 Nov 2018 at 21:26, Aaron Lindsay
<aaron@os.amperecomputing.com> wrote:
>
> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> ---
>  target/arm/cpu.h    |  4 ++--
>  target/arm/helper.c | 12 ++++++++++--
>  2 files changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 627e5c1995..50de58e4a2 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -837,8 +837,8 @@ struct ARMCPU {
>      uint32_t id_pfr0;
>      uint32_t id_pfr1;
>      uint32_t id_dfr0;
> -    uint32_t pmceid0;
> -    uint32_t pmceid1;
> +    uint64_t pmceid0;
> +    uint64_t pmceid1;
>      uint32_t id_afr0;
>      uint32_t id_mmfr0;
>      uint32_t id_mmfr1;
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 71be6fb578..75f054fe79 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -5432,7 +5432,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>              { .name = "PMCEID0", .state = ARM_CP_STATE_AA32,
>                .cp = 15, .opc1 = 0, .crn = 9, .crm = 12, .opc2 = 6,
>                .access = PL0_R, .accessfn = pmreg_access, .type = ARM_CP_CONST,
> -              .resetvalue = cpu->pmceid0 },
> +              .resetvalue = extract64(cpu->pmceid0, 0, 32) },
> +            { .name = "PMCEID2", .state = ARM_CP_STATE_AA32,
> +              .cp = 15, .opc1 = 0, .crn = 9, .crm = 14, .opc2 = 4,
> +              .access = PL0_R, .accessfn = pmreg_access, .type = ARM_CP_CONST,
> +              .resetvalue = extract64(cpu->pmceid0, 32, 32) },
>              { .name = "PMCEID0_EL0", .state = ARM_CP_STATE_AA64,
>                .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 12, .opc2 = 6,
>                .access = PL0_R, .accessfn = pmreg_access, .type = ARM_CP_CONST,
> @@ -5440,7 +5444,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>              { .name = "PMCEID1", .state = ARM_CP_STATE_AA32,
>                .cp = 15, .opc1 = 0, .crn = 9, .crm = 12, .opc2 = 7,
>                .access = PL0_R, .accessfn = pmreg_access, .type = ARM_CP_CONST,
> -              .resetvalue = cpu->pmceid1 },
> +              .resetvalue = extract64(cpu->pmceid1, 0, 32) },
> +            { .name = "PMCEID3", .state = ARM_CP_STATE_AA32,
> +              .cp = 15, .opc1 = 0, .crn = 9, .crm = 14, .opc2 = 5,
> +              .access = PL0_R, .accessfn = pmreg_access, .type = ARM_CP_CONST,
> +              .resetvalue = extract64(cpu->pmceid1, 32, 32) },
>              { .name = "PMCEID1_EL0", .state = ARM_CP_STATE_AA64,
>                .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 12, .opc2 = 7,
>                .access = PL0_R, .accessfn = pmreg_access, .type = ARM_CP_CONST,
> --

PMCEID2 and PMCEID3 are only defined from ARMv8.1; before that they
are UNDEFINED. So these registers need to be only defined if a
suitable feature bit or ID register field check passes.

thanks
-- PMM
