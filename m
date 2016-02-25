Received: by 10.25.208.211 with SMTP id h202csp2911062lfg;
        Thu, 25 Feb 2016 08:49:36 -0800 (PST)
X-Received: by 10.140.135.84 with SMTP id 81mr55811432qhh.26.1456418976009;
        Thu, 25 Feb 2016 08:49:36 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k93si8779445qgf.62.2016.02.25.08.49.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Feb 2016 08:49:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:44470 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aYz6d-00015a-I6
	for alex.bennee@linaro.org; Thu, 25 Feb 2016 11:49:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39977)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYz61-0000Ma-NO
	for qemu-devel@nongnu.org; Thu, 25 Feb 2016 11:48:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYz60-0003W2-Nh
	for qemu-devel@nongnu.org; Thu, 25 Feb 2016 11:48:57 -0500
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:34379)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYz60-0003V4-IG
	for qemu-devel@nongnu.org; Thu, 25 Feb 2016 11:48:56 -0500
Received: by mail-vk0-x22a.google.com with SMTP id e185so52937222vkb.1
	for <qemu-devel@nongnu.org>; Thu, 25 Feb 2016 08:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=3YTYlJ3lW991u+L+bsDzve+3+iwUZPyLw6i5WS5omQU=;
	b=bXFWg3yKs49EEcIENIK6U4uUpcf9Amc5QLZ1qR4u8BzKFm9fTk5ECy71GjacaQYSZd
	ov6nGCVovHmsm2cB++XNPzHg+NddcAU+qSOiAsaHP+5MWmFcJoROkWQPJArPwILxAI/i
	AulrpBo285fPy4urGjbdlbS/lYJqJeqbyM7gM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=3YTYlJ3lW991u+L+bsDzve+3+iwUZPyLw6i5WS5omQU=;
	b=kexTZcArKj+bPevAQn4asMiZ0cDfqCmyluC8LvRpigd2mLQxUksiiMHsUkh4fcZGqX
	dVTRT2+Znwax7iE7ThvbxJXuY4U7okRjWEM0M/dJNYe5SX2eqAMcJoErh0YeEvuAfSt+
	3IUZ40WONZHoImrjwjACN6nlN6LSKjodTKJ1taPSN9YltKDgbe+VNqDL/LE/rW6Ga/lP
	axWmO/SXsaK3o9YT2CPalJZLMXh2O+Zxw/ZeQO7oM2QK8PDqRa1j6ADbPVpOM7gkT6ec
	2zvwz6zRis9qxVHfj+tdvxHVRnAj8qPTp5ZWdhNvwAaQ7r10Ezpubj7rTFTgRbXA6Vaa
	DM5w==
X-Gm-Message-State: AG10YOQaLweRO564fFcT40v0sCVvrKvoFUzfI7devEfhNG8sOF1jQVliv9UEnii9YHvwRHbuqbdBM/SgPHLcA99m
X-Received: by 10.31.194.130 with SMTP id s124mr36873711vkf.92.1456418936107; 
	Thu, 25 Feb 2016 08:48:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Thu, 25 Feb 2016 08:48:36 -0800 (PST)
In-Reply-To: <1455890863-11203-1-git-send-email-peter.maydell@linaro.org>
References: <1455890863-11203-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Feb 2016 16:48:36 +0000
Message-ID: <CAFEAcA-cPurz=fkovcc7Fw8tkvwKunb7E4efWr-8XQ_47+mGsQ@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
Cc: qemu-arm <qemu-arm@nongnu.org>, qemu-stable <qemu-stable@nongnu.org>,
	Patch Tracking <patches@linaro.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: [Qemu-devel] [PATCH] target-arm: Make reserved ranges in
 ID_AA64* spaces RAZ, not UNDEF
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BmiPxJ+7WmoE

Ping? (less than a week, I know, but given it unbreaks linux-next
I figure it would be nicer to get it into master sooner rather
than later...)

thanks
-- PMM

On 19 February 2016 at 14:07, Peter Maydell <peter.maydell@linaro.org> wrote:
> The v8 ARM ARM defines that unused spaces in the ID_AA64* system
> register ranges are Reserved and must RAZ, rather than being UNDEF.
> Implement this.
>
> In particular, ARM v8.2 adds a new feature register ID_AA64MMFR2,
> and newer versions of the Linux kernel will attempt to read this,
> which causes them not to boot up on versions of QEMU missing this fix.
>
> Since the encoding .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 6
> is actually defined in ARMv8 (as ID_MMFR4), we give it an entry in
> the ARMCPU struct so CPUs can override it, though since none do
> this too will just RAZ.
>
> Cc: qemu-stable@nongnu.org
> Reported-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> The patch which touches ID_AA64MMFR2 is currently in linux-next...
>
>  target-arm/cpu-qom.h |   1 +
>  target-arm/helper.c  | 128 ++++++++++++++++++++++++++++++++++++++++++++++++---
>  2 files changed, 122 insertions(+), 7 deletions(-)
>
> diff --git a/target-arm/cpu-qom.h b/target-arm/cpu-qom.h
> index 1cc4502..1061c08 100644
> --- a/target-arm/cpu-qom.h
> +++ b/target-arm/cpu-qom.h
> @@ -155,6 +155,7 @@ typedef struct ARMCPU {
>      uint32_t id_mmfr1;
>      uint32_t id_mmfr2;
>      uint32_t id_mmfr3;
> +    uint32_t id_mmfr4;
>      uint32_t id_isar0;
>      uint32_t id_isar1;
>      uint32_t id_isar2;
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 5a0447b..4deea0f 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -4280,12 +4280,14 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 5,
>                .access = PL1_R, .type = ARM_CP_CONST,
>                .resetvalue = cpu->id_isar5 },
> -            /* 6..7 are as yet unallocated and must RAZ */
> -            { .name = "ID_ISAR6", .cp = 15, .crn = 0, .crm = 2,
> -              .opc1 = 0, .opc2 = 6, .access = PL1_R, .type = ARM_CP_CONST,
> -              .resetvalue = 0 },
> -            { .name = "ID_ISAR7", .cp = 15, .crn = 0, .crm = 2,
> -              .opc1 = 0, .opc2 = 7, .access = PL1_R, .type = ARM_CP_CONST,
> +            { .name = "ID_MMFR4", .state = ARM_CP_STATE_BOTH,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 6,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = cpu->id_mmfr4 },
> +            /* 7 is as yet unallocated and must RAZ */
> +            { .name = "ID_ISAR7_RESERVED", .state = ARM_CP_STATE_BOTH,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 7,
> +              .access = PL1_R, .type = ARM_CP_CONST,
>                .resetvalue = 0 },
>              REGINFO_SENTINEL
>          };
> @@ -4339,7 +4341,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>          define_arm_cp_regs(cpu, not_v7_cp_reginfo);
>      }
>      if (arm_feature(env, ARM_FEATURE_V8)) {
> -        /* AArch64 ID registers, which all have impdef reset values */
> +        /* AArch64 ID registers, which all have impdef reset values.
> +         * Note that within the ID register ranges the unused slots
> +         * must all RAZ, not UNDEF; future architecture versions may
> +         * define new registers here.
> +         */
>          ARMCPRegInfo v8_idregs[] = {
>              { .name = "ID_AA64PFR0_EL1", .state = ARM_CP_STATE_AA64,
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 0,
> @@ -4349,6 +4355,30 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 1,
>                .access = PL1_R, .type = ARM_CP_CONST,
>                .resetvalue = cpu->id_aa64pfr1},
> +            { .name = "ID_AA64PFR2_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 2,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
> +            { .name = "ID_AA64PFR3_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 3,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
> +            { .name = "ID_AA64PFR4_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 4,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
> +            { .name = "ID_AA64PFR5_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 5,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
> +            { .name = "ID_AA64PFR6_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 6,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
> +            { .name = "ID_AA64PFR7_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 7,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
>              { .name = "ID_AA64DFR0_EL1", .state = ARM_CP_STATE_AA64,
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 0,
>                .access = PL1_R, .type = ARM_CP_CONST,
> @@ -4362,6 +4392,14 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 1,
>                .access = PL1_R, .type = ARM_CP_CONST,
>                .resetvalue = cpu->id_aa64dfr1 },
> +            { .name = "ID_AA64DFR2_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 2,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
> +            { .name = "ID_AA64DFR3_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 3,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
>              { .name = "ID_AA64AFR0_EL1", .state = ARM_CP_STATE_AA64,
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 4,
>                .access = PL1_R, .type = ARM_CP_CONST,
> @@ -4370,6 +4408,14 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 5,
>                .access = PL1_R, .type = ARM_CP_CONST,
>                .resetvalue = cpu->id_aa64afr1 },
> +            { .name = "ID_AA64AFR2_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 6,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
> +            { .name = "ID_AA64AFR3_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 7,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
>              { .name = "ID_AA64ISAR0_EL1", .state = ARM_CP_STATE_AA64,
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 0,
>                .access = PL1_R, .type = ARM_CP_CONST,
> @@ -4378,6 +4424,30 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 1,
>                .access = PL1_R, .type = ARM_CP_CONST,
>                .resetvalue = cpu->id_aa64isar1 },
> +            { .name = "ID_AA64ISAR2_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 2,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
> +            { .name = "ID_AA64ISAR3_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 3,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
> +            { .name = "ID_AA64ISAR4_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 4,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
> +            { .name = "ID_AA64ISAR5_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 5,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
> +            { .name = "ID_AA64ISAR6_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 6,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
> +            { .name = "ID_AA64ISAR7_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 7,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
>              { .name = "ID_AA64MMFR0_EL1", .state = ARM_CP_STATE_AA64,
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 7, .opc2 = 0,
>                .access = PL1_R, .type = ARM_CP_CONST,
> @@ -4386,6 +4456,30 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 7, .opc2 = 1,
>                .access = PL1_R, .type = ARM_CP_CONST,
>                .resetvalue = cpu->id_aa64mmfr1 },
> +            { .name = "ID_AA64MMFR2_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 7, .opc2 = 2,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
> +            { .name = "ID_AA64MMFR3_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 7, .opc2 = 3,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
> +            { .name = "ID_AA64MMFR4_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 7, .opc2 = 4,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
> +            { .name = "ID_AA64MMFR5_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 7, .opc2 = 5,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
> +            { .name = "ID_AA64MMFR6_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 7, .opc2 = 6,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
> +            { .name = "ID_AA64MMFR7_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 7, .opc2 = 7,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
>              { .name = "MVFR0_EL1", .state = ARM_CP_STATE_AA64,
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 0,
>                .access = PL1_R, .type = ARM_CP_CONST,
> @@ -4398,6 +4492,26 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 2,
>                .access = PL1_R, .type = ARM_CP_CONST,
>                .resetvalue = cpu->mvfr2 },
> +            { .name = "MVFR3_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 3,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
> +            { .name = "MVFR4_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 4,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
> +            { .name = "MVFR5_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 5,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
> +            { .name = "MVFR6_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 6,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
> +            { .name = "MVFR7_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 7,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
>              { .name = "PMCEID0", .state = ARM_CP_STATE_AA32,
>                .cp = 15, .opc1 = 0, .crn = 9, .crm = 12, .opc2 = 6,
>                .access = PL0_R, .accessfn = pmreg_access, .type = ARM_CP_CONST,
> --
> 1.9.1
