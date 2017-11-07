Received: by 10.223.150.237 with SMTP id u100csp326817wrb;
        Tue, 7 Nov 2017 10:04:57 -0800 (PST)
X-Google-Smtp-Source: ABhQp+TrSdjeH/M9bHXt3oBgoL8RaU6dzWNBN9W/SH2QMkFmwIfGXmU2ElWbB3VSinZWMxEu721i
X-Received: by 10.37.192.3 with SMTP id c3mr12440696ybf.335.1510077897845;
        Tue, 07 Nov 2017 10:04:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510077897; cv=none;
        d=google.com; s=arc-20160816;
        b=ZRb0sRIHNWFRquRnei1crsmMegfqwnva/qFpBzFkT75UpGL427efmoSUjP2k2oYK8e
         ef22Y2QZKHqd0tOXNUEq5jJg9QFY7gAgGTUPKaLi28uYbBdS6joif8Cral0f2NkU9+oy
         B3F9x0gLLMa/WvO18MZNxWKx5FpUEANVhFlkRn+xkoM6FwlR/oDi4rZOgg5fdpf89qVJ
         w8ni23Y+TjTJ7aIL4y8Zz2TPZHPHuVwVEPBBuJxWUOh1hZ783bRCsLTRBTDkZG/O6r3G
         0MonzGhbsvBuom6xeIT0r1sKh1O0750+chnCxcQs0iLQNndW3fy/inNaWZvJ/r8S+jv0
         rF3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :references:message-id:in-reply-to:to:from:date:dmarc-filter
         :arc-authentication-results;
        bh=HP6lFcXLQ3CDGhMwM8SZ/g7/yOM/XyKf865SXnzHlp4=;
        b=ba/Awe7q8sWWl33FvYR0AMMTpQxxgIYiJtHHa4mfvv1xftj7Bxgl9dlkDtOmV+03xs
         I8YKTbCC43GlS5S6UdOWfnBZU8sIzwEpAfvciiM1pfwUdfvU6YQltNi/dQTogvddkFPD
         a72H04c2APtOCh7vqfT71cTxWuYLNJRZXTIrEqz7r7V7bfdOTRQaPvRBylncvvmvq2o5
         J/p1/x2cMjjAfq2uEPV+YHBCKT+ZJbF7Y/LnVhXsHci7c7mpp6yUW+Hbjf7U2l83JqqH
         bGhZDk7N0JJ7b+DIka+amxsnGRV2xRIlpc7TrId+XjgvQAZ2OhJ1AUCMz01DReR2uvRi
         kFSA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s187si432874ywf.86.2017.11.07.10.04.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Nov 2017 10:04:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55209 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eC8F7-0000RD-D4
	for alex.bennee@linaro.org; Tue, 07 Nov 2017 13:04:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44355)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1eC8Ez-0000Qz-LC
	for qemu-arm@nongnu.org; Tue, 07 Nov 2017 13:04:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1eC8Et-0002uA-QD
	for qemu-arm@nongnu.org; Tue, 07 Nov 2017 13:04:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:53786)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sstabellini@kernel.org>)
	id 1eC8Et-0002tD-In; Tue, 07 Nov 2017 13:04:43 -0500
Received: from sstabellini-ThinkPad-X260.attlocal.net
	(162-198-228-37.lightspeed.wlfrct.sbcglobal.net [162.198.228.37])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 5924B218D0;
	Tue,  7 Nov 2017 18:04:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5924B218D0
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org;
	spf=none smtp.mailfrom=sstabellini@kernel.org
Date: Tue, 7 Nov 2017 10:04:41 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <1510066898-3725-1-git-send-email-peter.maydell@linaro.org>
Message-ID: <alpine.DEB.2.10.1711071004190.30448@sstabellini-ThinkPad-X260>
References: <1510066898-3725-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.99
Subject: Re: [Qemu-arm] [PATCH for-2.11] target/arm: Report GICv3 sysregs
 present in ID registers if needed
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
Cc: qemu-arm@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JJZsMwIRz29U

On Tue, 7 Nov 2017, Peter Maydell wrote:
> The CPU ID registers ID_AA64PFR0_EL1, ID_PFR1_EL1 and ID_PFR1
> have a field for reporting presence of GICv3 system registers.
> We need to report this field correctly in order for Xen to
> work as a guest inside QEMU emulation. We mustn't incorrectly
> claim the sysregs exist when they don't, though, or Linux will
> crash.
> 
> Unfortunately the way we've designed the GICv3 emulation in QEMU
> puts the system registers as part of the GICv3 device, which
> may be created after the CPU proper has been realized. This
> means that we don't know at the point when we define the ID
> registers what the correct value is. Handle this by switching
> them to calling a function at runtime to read the value, where
> we can fill in the GIC field appropriately.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Tested-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
> In retrospect I think having the sysregs emulation in the
> GIC device was a bit of a design error -- we should have
> split it like the hardware does, with a defined protocol
> between the GIC and the CPU interface. (In real hardware the
> CPU can have the GIC system registers even though it's not
> connected to an actual GICv3, and we don't/can't emulate
> that with our current design.)
> ---
>  target/arm/helper.c | 44 ++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 40 insertions(+), 4 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index f61fb3e..35c5bd6 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -4549,6 +4549,33 @@ static void define_debug_regs(ARMCPU *cpu)
>      }
>  }
>  
> +/* We don't know until after realize whether there's a GICv3
> + * attached, and that is what registers the gicv3 sysregs.
> + * So we have to fill in the GIC fields in ID_PFR/ID_PFR1_EL1/ID_AA64PFR0_EL1
> + * at runtime.
> + */
> +static uint64_t id_pfr1_read(CPUARMState *env, const ARMCPRegInfo *ri)
> +{
> +    ARMCPU *cpu = arm_env_get_cpu(env);
> +    uint64_t pfr1 = cpu->id_pfr1;
> +
> +    if (env->gicv3state) {
> +        pfr1 |= 1 << 28;
> +    }
> +    return pfr1;
> +}
> +
> +static uint64_t id_aa64pfr0_read(CPUARMState *env, const ARMCPRegInfo *ri)
> +{
> +    ARMCPU *cpu = arm_env_get_cpu(env);
> +    uint64_t pfr0 = cpu->id_aa64pfr0;
> +
> +    if (env->gicv3state) {
> +        pfr0 |= 1 << 24;
> +    }
> +    return pfr0;
> +}
> +
>  void register_cp_regs_for_features(ARMCPU *cpu)
>  {
>      /* Register all the coprocessor registers based on feature bits */
> @@ -4573,10 +4600,14 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 0,
>                .access = PL1_R, .type = ARM_CP_CONST,
>                .resetvalue = cpu->id_pfr0 },
> +            /* ID_PFR1 is not a plain ARM_CP_CONST because we don't know
> +             * the value of the GIC field until after we define these regs.
> +             */
>              { .name = "ID_PFR1", .state = ARM_CP_STATE_BOTH,
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 1,
> -              .access = PL1_R, .type = ARM_CP_CONST,
> -              .resetvalue = cpu->id_pfr1 },
> +              .access = PL1_R, .type = ARM_CP_NO_RAW,
> +              .readfn = id_pfr1_read,
> +              .writefn = arm_cp_write_ignore },
>              { .name = "ID_DFR0", .state = ARM_CP_STATE_BOTH,
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 2,
>                .access = PL1_R, .type = ARM_CP_CONST,
> @@ -4692,10 +4723,15 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>           * define new registers here.
>           */
>          ARMCPRegInfo v8_idregs[] = {
> +            /* ID_AA64PFR0_EL1 is not a plain ARM_CP_CONST because we don't
> +             * know the right value for the GIC field until after we
> +             * define these regs.
> +             */
>              { .name = "ID_AA64PFR0_EL1", .state = ARM_CP_STATE_AA64,
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 0,
> -              .access = PL1_R, .type = ARM_CP_CONST,
> -              .resetvalue = cpu->id_aa64pfr0 },
> +              .access = PL1_R, .type = ARM_CP_NO_RAW,
> +              .readfn = id_aa64pfr0_read,
> +              .writefn = arm_cp_write_ignore },
>              { .name = "ID_AA64PFR1_EL1", .state = ARM_CP_STATE_AA64,
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 1,
>                .access = PL1_R, .type = ARM_CP_CONST,
> -- 
> 2.7.4
> 
