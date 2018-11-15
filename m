Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp7275982wrw;
        Thu, 15 Nov 2018 09:21:45 -0800 (PST)
X-Google-Smtp-Source: AJdET5faX8sLh8ydlnNXGYgpoA0XUv5ytcXAl3YcYpQiNo3q45S6FESQGut+p7fs00vkrPHPt7/N
X-Received: by 2002:aed:3b25:: with SMTP id p34mr6761454qte.310.1542302505715;
        Thu, 15 Nov 2018 09:21:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542302505; cv=none;
        d=google.com; s=arc-20160816;
        b=nO4vX/IDPCrGSaZ6r9Bze7Os80LQ3izjCKRCr4qL5IkHZipwcLmqVcU8m7zRnVSVUt
         nVnrm1dt03+TsT81IonvOhjCMC7fpmlRGHoTUAwdCmI2E6r0UzrTJnpWIYNGp9OupNAp
         OlYJ/7Xq+sUkEpFJX+5bF+5MM90/YWy+WXXg/swsx4hgZh7MwhD+4CebFZlef+uLiqJw
         0jfGfXbE+dpv7+h2K+1oyrjJ9/m5REF7Xp9V5gPALdltEALmvwI8x368WodrF3YO9Gqj
         zNSKWqH1bHqyfKhjsSsuh9zjZWZLqZ67NphpIUzgt3GgzE2nHuZJbEebzsz0OUTRfnhV
         R++w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=cYzCCC8KsB8brAvuQB+sNb05dikQNCiPmllv9+sDLlk=;
        b=EPGPzK4FweZu9Ns9VT7cyR6wjPy+WXIm2ImSpIwzGMnuvCtyBxf+uMuXfHh0SGO5wk
         F+31Tdf2sQo9bg+jhASbdjkCaHOXKzKbCKftUdcYQZAUpYq1HXo7p6ogbfTPhD22Vn5R
         YKSoqqfq2NhgfsmcAzs6DpJkdtwt5hS1FV6du97YW3OBX9AJ5yM0unrnpEBUiB8p0mOB
         tfP6uleqHZZiDh1nSOJkJNLtBxOJ3LqcqvPdGBIq9hCpRuNC6amTxHpqvvNeRjMY9rRC
         VsQypAzHu8/TbThEIhMTSzVhtMIfmI8KBGkRyDH2/wEmXfV/DZbPI+tQFImoB8EHkg7P
         4c+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BTXBaYhB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l91si3184218qva.115.2018.11.15.09.21.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 09:21:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BTXBaYhB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40045 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNLKq-0002SV-Ux
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 12:21:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52141)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gNLKj-0002Rx-L1
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 12:21:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gNLKX-0002DX-E9
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 12:21:27 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:36343)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gNLKX-00027H-0g
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 12:21:25 -0500
Received: by mail-ot1-x341.google.com with SMTP id k98so18732465otk.3
	for <qemu-arm@nongnu.org>; Thu, 15 Nov 2018 09:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cYzCCC8KsB8brAvuQB+sNb05dikQNCiPmllv9+sDLlk=;
	b=BTXBaYhBhO5viseWu2jKYzlF8jb7IKiIyYlVCKIDYwxHott2lIzUqFdWyZLBu1DX3v
	DE2/8+oxxF+ltWm9ydhJi/po6ztnMT0aquqeP81j8+ni1tL65J8uAA7xs2HbZvS/G7uN
	RfVJnq3xgBLSav2VypHBSFHowtK7hYsRje8a8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cYzCCC8KsB8brAvuQB+sNb05dikQNCiPmllv9+sDLlk=;
	b=gm/EulkS6YbIIdgOSjJbTt/PZ+HeDlBd84aePDwT2GpbOy9GQuK2MY+GoYYxAvYQKq
	ErF8sA7NXrPhx2SZWFJNUaXv60STnN6YNC7nGWm5xwTiwaFBEFd26kzWKGzz8M9rHzHb
	ccCJl8EzliVI3wLsNmUWEb9tz19l3kb9SXHW35G2p2Og+BNwHrPpBGajkVuW4vzNxnm+
	X55IVa9Nhik2fQaB15MxIcBrAg1dfiVtzzyXi4uXJRbR95UwzuJlpHACoIiHxY2XpRpV
	kl7yjTCIYp6gm8sR86TJ43uPP4ANKjYTKB5D3wma2iHKF/3zwD3yFfirLyJ/Cjlgt98I
	FBkA==
X-Gm-Message-State: AGRZ1gLXEyDUYOu7WQ7NbS2hgUju2eT3F6DCY//lKwDidPvDZDE3CqlL
	jyHAZ+n7wWYoVzGntnSl7ENYm3EtjmRr2bHVlxcsVw==
X-Received: by 2002:a9d:156d:: with SMTP id z42mr4329012otz.201.1542302484113; 
	Thu, 15 Nov 2018 09:21:24 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Thu, 15 Nov 2018 09:21:03
	-0800 (PST)
In-Reply-To: <20181102134112.26370-3-richard.henderson@linaro.org>
References: <20181102134112.26370-1-richard.henderson@linaro.org>
	<20181102134112.26370-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Nov 2018 17:21:03 +0000
Message-ID: <CAFEAcA8Em2FP7rQgsHXuBcAhM+L-KUsFHR9PbW7QcRzHq8uy4g@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH for-4.0 2/4] target/arm: Implement the
 ARMv8.1-LOR extension
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ubwdOrjQIlP5

On 2 November 2018 at 13:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Provide a trivial implementation with zero limited ordering regions,
> which causes the LDLAR and STLLR instructions to devolve into the
> LDAR and STLR instructions from the base ARMv8.0 instruction set.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h           |  5 +++++
>  target/arm/cpu64.c         |  4 ++++
>  target/arm/helper.c        | 26 ++++++++++++++++++++++++++
>  target/arm/translate-a64.c | 12 ++++++++++++
>  4 files changed, 47 insertions(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 2ce5e80dfc..f12a6afddc 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -3278,6 +3278,11 @@ static inline bool isar_feature_aa64_atomics(const ARMISARegisters *id)
>      return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, ATOMIC) != 0;
>  }
>
> +static inline bool isar_feature_aa64_lor(const ARMISARegisters *id)
> +{
> +    return FIELD_EX64(id->id_aa64mmfr0, ID_AA64MMFR1, LO) != 0;
> +}
> +
>  static inline bool isar_feature_aa64_rdm(const ARMISARegisters *id)
>  {
>      return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, RDM) != 0;
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 0babe483ac..aac6283018 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -324,6 +324,10 @@ static void aarch64_max_initfn(Object *obj)
>          t = FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 1);
>          cpu->isar.id_aa64pfr0 = t;
>
> +        t = cpu->isar.id_aa64mmfr1;
> +        t = FIELD_DP64(t, ID_AA64MMFR1, LO, 1);
> +        cpu->isar.id_aa64mmfr1 = t;
> +
>          /* Replicate the same data to the 32-bit id registers.  */
>          u = cpu->isar.id_isar5;
>          u = FIELD_DP32(u, ID_ISAR5, AES, 2); /* AES + PMULL */
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 70376764cb..758ddac5e9 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -5714,6 +5714,32 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>          define_one_arm_cp_reg(cpu, &sctlr);
>      }
>
> +    if (cpu_isar_feature(aa64_lor, cpu)) {
> +        /*
> +         * A trivial implementation of ARMv8.1-LOR leaves all of these
> +         * registers fixed at 0, which indicates that there are zero
> +         * supported Limited Ordering regions.
> +         */
> +        static const ARMCPRegInfo lor_reginfo[] = {
> +            { .name = "LORSA_EL1", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 10, .crm = 4, .opc2 = 0,
> +              .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
> +            { .name = "LOREA_EL1", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 10, .crm = 4, .opc2 = 1,
> +              .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
> +            { .name = "LORN_EL1", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 10, .crm = 4, .opc2 = 2,
> +              .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
> +            { .name = "LORC_EL1", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 10, .crm = 4, .opc2 = 3,
> +              .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
> +            { .name = "LORID_EL1", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 10, .crm = 4, .opc2 = 7,
> +              .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
> +        };

There are access checks needed for these registers:
HCR_EL2.TLOR controls trapping to EL2
SCR_EL3.TLOR controls trapping to EL3.
All except LORID_EL1 are also inaccessible from Secure state.

> +        define_arm_cp_regs(cpu, lor_reginfo);
> +    }
> +
>      if (cpu_isar_feature(aa64_sve, cpu)) {
>          define_one_arm_cp_reg(cpu, &zcr_el1_reginfo);
>          if (arm_feature(env, ARM_FEATURE_EL2)) {
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 88195ab949..2307a18d5a 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -2290,6 +2290,12 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
>          }
>          return;
>
> +    case 0x8: /* STLLR */
> +        if (!dc_isar_feature(aa64_lor, s)) {
> +            break;
> +        }
> +        /* StoreLORelease is the same as Store-Release for QEMU.  */
> +        /* fallthru */
>      case 0x9: /* STLR */
>          /* Generate ISS for non-exclusive accesses including LASR.  */
>          if (rn == 31) {
> @@ -2301,6 +2307,12 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
>                    disas_ldst_compute_iss_sf(size, false, 0), is_lasr);
>          return;
>
> +    case 0xc: /* LDLAR */
> +        if (!dc_isar_feature(aa64_lor, s)) {
> +            break;
> +        }
> +        /* LoadLOAcquire is the same as Load-Acquire for QEMU.  */
> +        /* fallthru */
>      case 0xd: /* LDAR */
>          /* Generate ISS for non-exclusive accesses including LASR.  */
>          if (rn == 31) {
> --

We should check the SBO bits in these encodings:
the instructions have "(1)"s in the fields for Rs and Rt2, which means
that the behaviour if not set is CONSTRAINED UNPREDICTABLE
(see DDI0487D.a C2.2.2). "Executes as if the value of the bit is 1"
is a permitted choice, so not checking the fields isn't wrong, but
it does make it a bit harder to tell when some future guest makes
use of some new encoding that borrows some of the space, so it's
nicer to take the "make the instruction UNDEFINED" option.
It looks like we missed this with some of the other encodings in
this space too.

thanks
-- PMM
