Received: by 10.223.197.9 with SMTP id q9csp4655636wrf;
        Tue, 17 Oct 2017 07:22:22 -0700 (PDT)
X-Received: by 10.55.127.66 with SMTP id a63mr12027680qkd.90.1508250142228;
        Tue, 17 Oct 2017 07:22:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508250142; cv=none;
        d=google.com; s=arc-20160816;
        b=HgAFqMmpPWU2LbHpIsM/2cPlPPBBE/8KvzvV9Bor2brvHvFkYcPBmmegKasWWIwGWB
         EsXu1wn0Rcp3XOZxrCsCVKGSm7RsdNGKNLGLG56jniOF0+SY35Ko7tp7uLRVx+hXErpf
         MNtdgONEcLJMCKb8jIpmHbovqAPZ2I+Y2c9ST0P5KiVclb7Qm/RMG2uB3bz+kecHNilr
         45YpWTvbL0Lciayato8m2poDsuOvcH8V5E9/JqQFIX29n2FAdNM5FYamAgC0/B2W6iIG
         MmtoF+JbvF/fIAuIMtwDvfR186KEuSFw/VwSKOuX4GVeppsWN69jIILySfCirpRhKS9D
         6N9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=uXn7fDlVA1c00Pzca9UJDGvtPGYSmMvfmqTS0+eAHTY=;
        b=feVBNBhVAs+QuEgi8H63aHkj2P/tmv1KWDteQ5zyq145oaRlm9ggq9YCYNwei873jn
         aGk3+1SSmVe/tL2+gz8m2niYMmkOf4c7NWlC2Z1XLzFAJ7L8lMYIib3KfHdkmJ9V+9A7
         NvNWEE51kjrxYUxp8y7IvzV95qs//WGY5v+dvLQ1KQUdoRvdRjxcVAR/N/is+hq6cMvF
         Sk7IaVJEz/rXFyzKPGTuEudo0v83qp2OwWmvDFt4agQCmrkm+0sFcJ7tvS2LCce98kW0
         x4xnplqzo/0lJgHmeYLl9R4F0CFOnSRIzACeSJtnBMQs28iuWhQ4vJ+01krC+0Cp6byJ
         dloA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=A0PW8Bqi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d54si3546812qtk.305.2017.10.17.07.22.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Oct 2017 07:22:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=A0PW8Bqi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39806 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e4Sl9-0001yJ-VE
	for alex.bennee@linaro.org; Tue, 17 Oct 2017 10:22:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60480)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e4Sj6-0000Pu-QI
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 10:20:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e4Sj5-0003XA-DV
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 10:20:12 -0400
Received: from mail-wr0-x230.google.com ([2a00:1450:400c:c0c::230]:51449)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e4Sj5-0003WH-34
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 10:20:11 -0400
Received: by mail-wr0-x230.google.com with SMTP id j14so1867861wre.8
	for <qemu-arm@nongnu.org>; Tue, 17 Oct 2017 07:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uXn7fDlVA1c00Pzca9UJDGvtPGYSmMvfmqTS0+eAHTY=;
	b=A0PW8Bqiv9tMs/1l3SBvFmgmk9VvwuAT15PcwIx3aE7oMdjnAdJUuKEXMz7rLC0FVO
	3jSZ1k7yW0RpFu15A9QVUmWpGWamck2TOlWuyq3BI4y9UjfwTscEKnJJptS40Vbys2ye
	SWmpunVqf+z7tB5a0Q21CBDREqKGxeT7jlx9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uXn7fDlVA1c00Pzca9UJDGvtPGYSmMvfmqTS0+eAHTY=;
	b=ZM4zDCCfdWDhvcwXczMsyq5R9PM3O1iKaKycfrd4yDcsn4sIM1j1DHyrCM4XaTODwg
	I9ddYYOlk/Eu89k0OzRxj3VMHB+RgngdHIL/9+WrCCohK2bhhv8ZTA9KXc9eWzHz38nS
	WlCuygnKwdvNINOg0bDeKxRxQ/aZCEidnDJi4hwPBBs5eZuCENcuSkDNFzihEkyPWdw5
	3Tp+Jcpe/ct+JHowWX2Fph3b8GsW5aXWepKA0ch5VmNTovgs9HSOd0Vf5YWhEEU5twQb
	PMTDBF7j0f0Dhi5Y2laOGDkGebVcys4I3HRCvNIVkKVadluI+7zZfaNfCsAqkPGLzxyM
	8IGg==
X-Gm-Message-State: AMCzsaXgk/dw9uTLosy7rfTndswKV9Ug7ESl7X5w0b+LRQp1tSDwn7Y3
	tqO9YKzIji9J5UhQ01g5LqfKtEI8vr3aiyh7NcPWXg==
X-Google-Smtp-Source: ABhQp+TDxlzD++5snoinCJ1L+ZygULxz3hfsRJeB8m0Ae0GEwDl1gSnKZxJaN84ey99jP2hKhS3lDUrXQJe8yK+LPPE=
X-Received: by 10.223.160.233 with SMTP id n38mr4270278wrn.177.1508250009860; 
	Tue, 17 Oct 2017 07:20:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.195 with HTTP; Tue, 17 Oct 2017 07:19:49 -0700 (PDT)
In-Reply-To: <1506737310-21880-8-git-send-email-alindsay@codeaurora.org>
References: <1506737310-21880-1-git-send-email-alindsay@codeaurora.org>
	<1506737310-21880-8-git-send-email-alindsay@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Oct 2017 15:19:49 +0100
Message-ID: <CAFEAcA_1J2xZpnv9dNBeSH5ZvMvBujp3XHPK1SfypjFMU1OBSg@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::230
Subject: Re: [Qemu-arm] [PATCH 07/13] target/arm: Implement PMOVSSET
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
Cc: Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZmgSM4s413nO

On 30 September 2017 at 03:08, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> Also modify it to be stored as a uint64_t
>
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> ---
>  target/arm/cpu.h    |  2 +-
>  target/arm/helper.c | 27 ++++++++++++++++++++++++---
>  2 files changed, 25 insertions(+), 4 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 811b1fe..365a809 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -325,7 +325,7 @@ typedef struct CPUARMState {
>          uint32_t c9_data;
>          uint64_t c9_pmcr; /* performance monitor control register */
>          uint64_t c9_pmcnten; /* perf monitor counter enables */
> -        uint32_t c9_pmovsr; /* perf monitor overflow status */
> +        uint64_t c9_pmovsr; /* perf monitor overflow status */

This is a bug fix, so it should go in its own patch. Specifically,
we already have an AArch64 sysreg PMOVSCLR_EL0 which has
      .fieldoffset = offsetof(CPUARMState, cp15.c9_pmovsr),
so we should have made the CPUARMState field 64 bits when we
added it. (I think without this bugfix reads of the AArch64
reg will return data from the adjoining field in the struct.)


>          uint32_t c9_pmuserenr; /* perf monitor user enable */
>          uint64_t c9_pmselr; /* perf monitor counter selection register */
>          uint64_t c9_pminten; /* perf monitor interrupt enables */
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 74e90c5..3932ac0 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -1150,9 +1150,17 @@ static void pmcntenclr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>  static void pmovsr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                           uint64_t value)
>  {
> +    value &= PMU_COUNTER_MASK(env);
>      env->cp15.c9_pmovsr &= ~value;
>  }
>
> +static void pmovsset_write(CPUARMState *env, const ARMCPRegInfo *ri,
> +                         uint64_t value)
> +{
> +    value &= PMU_COUNTER_MASK(env);
> +    env->cp15.c9_pmovsr |= value;
> +}
> +
>  static void pmxevtyper_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                               uint64_t value)
>  {
> @@ -1317,10 +1325,10 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
>        .fieldoffset = offsetof(CPUARMState, cp15.c9_pmcnten),
>        .writefn = pmcntenclr_write },
>      { .name = "PMOVSR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 3,
> -      .access = PL0_RW, .fieldoffset = offsetof(CPUARMState, cp15.c9_pmovsr),
> -      .accessfn = pmreg_access,
> +      .access = PL0_RW, .accessfn = pmreg_access,
> +      .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmovsr),

Is this just reshuffling the order of .field initializers?

>        .writefn = pmovsr_write,
> -      .raw_writefn = raw_write },
> +      .raw_writefn = raw_write, .resetvalue = 0 },

.resetvalue 0 is the default, but it doesn't hurt to specify it
explicitly I guess.

>      { .name = "PMOVSCLR_EL0", .state = ARM_CP_STATE_AA64,
>        .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 12, .opc2 = 3,
>        .access = PL0_RW, .accessfn = pmreg_access,
> @@ -1328,6 +1336,19 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
>        .fieldoffset = offsetof(CPUARMState, cp15.c9_pmovsr),
>        .writefn = pmovsr_write,
>        .raw_writefn = raw_write },
> +    { .name = "PMOVSSET", .cp = 15, .crn = 9, .crm = 14, .opc1 = 0, .opc2 = 3,
> +      .access = PL0_RW, .accessfn = pmreg_access,
> +      .type = ARM_CP_ALIAS,
> +      .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmovsr),
> +      .writefn = pmovsset_write,
> +      .raw_writefn = raw_write },
> +    { .name = "PMOVSSET_EL0", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 14, .opc2 = 3,
> +      .access = PL0_RW, .accessfn = pmreg_access,
> +      .type = ARM_CP_ALIAS,
> +      .fieldoffset = offsetof(CPUARMState, cp15.c9_pmovsr),
> +      .writefn = pmovsset_write,
> +      .raw_writefn = raw_write },

You can implement these using a single STATE_BOTH regdef, I think.
Also, there's a standard order for the fields which goes
.cp .opc0 .opc1 .crn .crm .opc2
(you can often omit the .cp as the default is 15).

We need to be a bit careful here, because the AArch32 PMMOVSET
register isn't implemented in ARMv7 until v7VE. So we need to
put the regdef somewhere else...


thanks
-- PMM
