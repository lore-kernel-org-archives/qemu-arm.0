Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp496233wrw;
        Fri, 16 Nov 2018 07:07:17 -0800 (PST)
X-Google-Smtp-Source: AJdET5fRsAhv9daJqUNBGeg8WlNFNzhMjPQBXIPV5ld/MZ8bEFZbAjlb3MnQf2NgVP2H278nYacy
X-Received: by 2002:a37:86c5:: with SMTP id i188mr10565390qkd.81.1542380837467;
        Fri, 16 Nov 2018 07:07:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542380837; cv=none;
        d=google.com; s=arc-20160816;
        b=DQh5iVZkZSzaTn8+412C3NS2ayMxwAmtbgw/JBiGnHkzLeIB/h0JZfA2BrfvXxOULO
         Jku4Jai/R00+sIW5uW98fsEAB1C9QSBNngvUVSuVlu9H2KwoRg+Iu6lag/dwXHPb+T+K
         9Jrhc5+7A8h9Qh5QxW33PvOAB+Y02zRcIJsUZhCb68l5odwhxIh6ui0YQg09u000Lheg
         MBkb0hhtwL5u8y7g6hcxBb+M5p0Jeff9bq/Yw//jE23vzyu0HradZGTaIU6k9BQ/VM6U
         dRihbNxj6OnIFueIUyD+uiUm7qAhIxHAiKDNlqSoazMcNX9XQoj3LvRO8XNuCayeCGeC
         GcFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=TD0XbnDB6sGeL/rsV+ekYKG59AVHVmKjIw45IFxbhmo=;
        b=VDPuCykhu0G5yBJzNXFvRz2AQ79nWUTP7Ef4dP894N7kLL5appD8ZN/1sM5YkUMc2I
         aP/yahYV1dIN1SpLoYmbCOLIW9fa4E10fX75MXS8i405VasR5SXS8/y6lRRqxvIZ3dhJ
         gV/z1u4zyNpVC86+2I7QChWhUKyLKIv1gxjtrKHKFRsWukFCknvCv6JxAgBxtWVqHAwv
         wCxF3+Ugv9NDGEM7Of/Z6wjt0ReW8YnV5fV5SQghXGlozTHzoJE+SJGj4sfno7qnj4pY
         r+PVphrxudaAwfJk+1UwjZBJzqi0X+ulf3bbyzRaV1cI7+kDyU4pVUkDOildAS3GgAi0
         dhpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JRj1CGeS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k124si8480989qkd.2.2018.11.16.07.07.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Nov 2018 07:07:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JRj1CGeS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45223 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNfiG-0005hJ-NB
	for alex.bennee@linaro.org; Fri, 16 Nov 2018 10:07:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41276)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gNfi2-0005dY-Dw
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 10:07:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gNfi1-00021t-Ea
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 10:07:02 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:35582)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gNfi0-00020X-Ug
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 10:07:01 -0500
Received: by mail-ot1-x342.google.com with SMTP id 81so21601398otj.2
	for <qemu-arm@nongnu.org>; Fri, 16 Nov 2018 07:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TD0XbnDB6sGeL/rsV+ekYKG59AVHVmKjIw45IFxbhmo=;
	b=JRj1CGeSx2RA/1Gbl/9TzAxUIxNHAKNP2itmN8NAnWVvaznooHYSuHM7DRlvFWJTdX
	S8nNU1sOCptbvW/A43xJaL704tL5Id7oyRot/K5LKHvomRBO7h8GGfyjkbxY+UVUfGQY
	S5OrP/xU6zbi+OmsM1SUt+6tcRwFwo/6IDoYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TD0XbnDB6sGeL/rsV+ekYKG59AVHVmKjIw45IFxbhmo=;
	b=teMXkUdHBg0sEhUuXxKTWmQy+9S91MOe7veG2T27OuXlMDj4PpaIu2eXdz1RyHXLJd
	iQrQf5Scin4RtQX3eTkhgu6oI4HjIj7w+6RJcicoLSbwpSHPejw3IZH7lemjgTvG6YoN
	B21RpAFLWT63nr69P0xQhisAXpniNVHIye/Gne6da2hA/Y85P365x9ZK6KB3If4U33Ko
	3e/Dk9mGPqVdfasBUbqtV7naazLl3ljPJ4V0wwy+wO516VHds3iFQRR1vm9Y4gy78v30
	8FurXmjzTxFjT7FH14/0RffdnBz2YwhZD6Mas7lr2gwP8lwsow9D0vB4sUeXLMnhf1GV
	qH+Q==
X-Gm-Message-State: AGRZ1gJ7RCIma+XQP9vN5nPMdGcD/F6J3M6XqrO94+KYJiGcYEcfBTUJ
	UBD7Td4grxsF1qWL349CrJE6DKAaiTGZ3HRQhaOjVg==
X-Received: by 2002:a9d:156d:: with SMTP id z42mr6773342otz.201.1542380820255; 
	Fri, 16 Nov 2018 07:07:00 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Fri, 16 Nov 2018 07:06:39
	-0800 (PST)
In-Reply-To: <20181105185046.2802-8-aaron@os.amperecomputing.com>
References: <20181105185046.2802-1-aaron@os.amperecomputing.com>
	<20181105185046.2802-8-aaron@os.amperecomputing.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Nov 2018 15:06:39 +0000
Message-ID: <CAFEAcA8F5ZhPHU2ZC53xeXOEuR2NqzwHqjG9858VELjorwYj5g@mail.gmail.com>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [PATCH v7 07/12] target/arm: Add array for supported
 PMU events, generate PMCEID[01]
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
Cc: Aaron Lindsay <alindsay@codeaurora.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LPjSyPiAwPLo

On 5 November 2018 at 18:51, Aaron Lindsay <aaron@os.amperecomputing.com> wrote:
> This commit doesn't add any supported events, but provides the framework
> for adding them. We store the pm_event structs in a simple array, and
> provide the mapping from the event numbers to array indexes in the
> supported_event_map array. Because the value of PMCEID[01] depends upon
> which events are supported at runtime, generate it dynamically.
>
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> ---
>  target/arm/cpu.c    | 20 +++++++++++++-------
>  target/arm/cpu.h    | 10 ++++++++++
>  target/arm/cpu64.c  |  4 ----
>  target/arm/helper.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 65 insertions(+), 11 deletions(-)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 9e54c56379..d1c766d180 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -957,9 +957,19 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>      if (!cpu->has_pmu) {
>          unset_feature(env, ARM_FEATURE_PMU);
>          cpu->id_aa64dfr0 &= ~0xf00;
> -    } else if (!kvm_enabled()) {
> -        arm_register_pre_el_change_hook(cpu, &pmu_pre_el_change, 0);
> -        arm_register_el_change_hook(cpu, &pmu_post_el_change, 0);
> +    }
> +    if (arm_feature(env, ARM_FEATURE_PMU)) {
> +        uint64_t pmceid = get_pmceid(&cpu->env);
> +        cpu->pmceid0 = extract64(pmceid, 0, 32);
> +        cpu->pmceid1 = extract64(pmceid, 32, 32);
> +
> +        if (!kvm_enabled()) {
> +            arm_register_pre_el_change_hook(cpu, &pmu_pre_el_change, 0);
> +            arm_register_el_change_hook(cpu, &pmu_post_el_change, 0);
> +        }
> +    } else {
> +        cpu->pmceid0 = 0x00000000;
> +        cpu->pmceid1 = 0x00000000;
>      }

This now sets one of the ID registers for "we have no
PMU" in the first "if (!cpu->has_pmu)" statement (id_aa64dfr0),
and some of them (pmceid0, pcmeid1) in this else clause at the
end. We should put them all in the same place.

>
>      if (!arm_feature(env, ARM_FEATURE_EL2)) {
> @@ -1601,8 +1611,6 @@ static void cortex_a7_initfn(Object *obj)
>      cpu->id_pfr0 = 0x00001131;
>      cpu->id_pfr1 = 0x00011011;
>      cpu->id_dfr0 = 0x02010555;
> -    cpu->pmceid0 = 0x00000000;
> -    cpu->pmceid1 = 0x00000000;
>      cpu->id_afr0 = 0x00000000;
>      cpu->id_mmfr0 = 0x10101105;
>      cpu->id_mmfr1 = 0x40000000;
> @@ -1647,8 +1655,6 @@ static void cortex_a15_initfn(Object *obj)
>      cpu->id_pfr0 = 0x00001131;
>      cpu->id_pfr1 = 0x00011011;
>      cpu->id_dfr0 = 0x02010555;
> -    cpu->pmceid0 = 0x0000000;
> -    cpu->pmceid1 = 0x00000000;
>      cpu->id_afr0 = 0x00000000;
>      cpu->id_mmfr0 = 0x10201105;
>      cpu->id_mmfr1 = 0x20000000;
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 92282cd976..f991ff370e 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -991,6 +991,16 @@ void pmu_op_finish(CPUARMState *env);
>  void pmu_pre_el_change(ARMCPU *cpu, void *ignored);
>  void pmu_post_el_change(ARMCPU *cpu, void *ignored);
>
> +/*
> + * get_pmceid
> + * @env: CPUARMState
> + *
> + * Return the PMCEID[01] register values corresponding to the counters which
> + * are supported given the current configuration (0 is low 32, 1 is high 32
> + * bits)
> + */
> +uint64_t get_pmceid(CPUARMState *env);

This doesn't look like the right API, because in AArch64
PMCEID0_EL0 and PMCEID1_EL0 are both 64-bit registers,
so you can't fit them both into a single uint64_t.

thanks
-- PMM
