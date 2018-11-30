Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3754130wrt;
        Fri, 30 Nov 2018 08:14:32 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XpDuD97nf6y1RMokdqTYAYfpPZ3CRqiVo1kr0DKZn2NGXrABObKPmsuNAvIK2sBgoNgv84
X-Received: by 2002:a81:6156:: with SMTP id v83-v6mr6543128ywb.173.1543594472870;
        Fri, 30 Nov 2018 08:14:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543594472; cv=none;
        d=google.com; s=arc-20160816;
        b=CHp/CQ1t+yALXXCNi4LJLtlNAGvNWvp/MO8RxunrS0K4DZh1XUkZfJQJhXYPyq9pCO
         cbSwieja5rVzr5CVAThiS3MrKa7yqrYtTd9H6JYci7R1THFv69lFa5qx5QmyF8wsRN0R
         1Q3E38z67/rZVP+9H8btwN7X/qMp9LzEa6ZvWZ57xSYPyRVRiyIFUPqE7gMcsx4/wcyG
         l+CtcRMqcmOQBGHYBTucr0M8e5f4TY7KRavAGG7H4eUs8eOTa9JaaEUd9dGVspOIHqKp
         Vfi/pkn/AnFweETTXjReQaB9OY68btTDPqF8JlhAsFZ2ClSSVEDnPwRCmUm14YcCgR6S
         IBkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HjqsSRFKZvgdIE5T/EMuAUCdA3XdTnJV4dd8J/1ZuCI=;
        b=BEa2AdJkzPnGzdt2Oa/GMMY0vp4iKY3D0GyqX88GsGavYqzm6If6BM8FQB3DJiBhnG
         LmUT3qZ6jXVkhb2DMb1jNBWjk3AAocMXAoR2pJ6W78QBde821O+8JCNnQU2zlB4PF4ju
         ZH3jS4jHbwCeEl5yuv0Aydbo/Y9IM0EDf5U2oz+/S+QpdeWhlwtlgsXmkusrvXrPQrFq
         ZwfVAVI9WSlOU5+Jncc4ETdBOWWh8157bXTwSAQzR9VEoC9uytKNZYl8fpT3UQZJOWq7
         C+HBuy35kV6QVBXZN5YWGVrZtqMRGrt8bcVHwp1t6y9I7cEqUbRfLCN/gvTV+e1Xd6xv
         eWQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iQjtke6A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i4-v6si3396216ybe.84.2018.11.30.08.14.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 08:14:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iQjtke6A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33604 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSlR2-0003kP-9S
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 11:14:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45321)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gSlQr-0003kE-JH
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 11:14:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gSlQq-0007Qn-3G
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 11:14:21 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:34186)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gSlQp-0007Pm-AY
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 11:14:19 -0500
Received: by mail-oi1-x244.google.com with SMTP id h25so5180999oig.1
	for <qemu-arm@nongnu.org>; Fri, 30 Nov 2018 08:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HjqsSRFKZvgdIE5T/EMuAUCdA3XdTnJV4dd8J/1ZuCI=;
	b=iQjtke6AHjf8s6tUKEnhd1/cgbe9ehWCGWzM3tinr3bHhrPficp7Bt7gMw4fmZyWCS
	hJ7Rg4YRR/vhEgIM2RM4DcKOYXTzQ2358WVFKFEC7+1qr/OsbKAjRAEAaOa3pEulOeDT
	DO2O2hYatCU80N/xUgEkJmBSm/6QWjFGy4Ahg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HjqsSRFKZvgdIE5T/EMuAUCdA3XdTnJV4dd8J/1ZuCI=;
	b=s8VWT7r/+n5KTwA0taufv4WPINUn1Q0ral1+FqphkXm2q4ymjnWIZIwYJLkD4yp/xf
	Mmu5gSWbZd6xplNESDpSppNfBRVfuSX2YoDFE2Zv6DSrBYO3khF4atf9Fb9v/WnBd3mt
	lpzwl27ouXemzoA/PXU7ftZAEh43UsGGMaJ5dx0ujm3mucJ0gj/iYzvOlGPB5weIzq2T
	+pWsqyWVCo7rdfMPRNOma6abXeOh2efOJIjmN4rVYZ+BGiHQNXalCtDfPu6l3iD973K3
	QZfMgCXWxmuG1UOREOqFRCeV5v3BQvQpDzE+rAyG8xZ8Kpi5K0I2Nujj937y6ir6MYDr
	NNqQ==
X-Gm-Message-State: AA+aEWajFLC1mCa5eZo8AmWt/AdFG509Pnmwt/ZouVz5gnURUvRZu9wF
	8iXdOVpbQdHbSUbjrs2SeOOyycbOwFzRMTRhiueMLA==
X-Received: by 2002:aca:b58b:: with SMTP id e133mr3426242oif.25.1543594457118; 
	Fri, 30 Nov 2018 08:14:17 -0800 (PST)
MIME-Version: 1.0
References: <20181120212553.8480-1-aaron@os.amperecomputing.com>
	<20181120212553.8480-9-aaron@os.amperecomputing.com>
In-Reply-To: <20181120212553.8480-9-aaron@os.amperecomputing.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Nov 2018 16:14:05 +0000
Message-ID: <CAFEAcA_kcjm2F_1h2hRC_wW4hdozCQDzY1RmRTGTkEH+De+-Ag@mail.gmail.com>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-arm] [PATCH v8 08/13] target/arm: Add array for supported
 PMU events, generate PMCEID[01]_EL0
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
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ErS5V7E2IHCk

On Tue, 20 Nov 2018 at 21:26, Aaron Lindsay
<aaron@os.amperecomputing.com> wrote:
>
> This commit doesn't add any supported events, but provides the framework
> for adding them. We store the pm_event structs in a simple array, and
> provide the mapping from the event numbers to array indexes in the
> supported_event_map array. Because the value of PMCEID[01] depends upon
> which events are supported at runtime, generate it dynamically.
>
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> ---
>  target/arm/cpu.c    | 19 +++++++++------
>  target/arm/cpu.h    | 10 ++++++++
>  target/arm/cpu64.c  |  4 ----
>  target/arm/helper.c | 57 +++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 79 insertions(+), 11 deletions(-)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index f7bad04f60..208a08e867 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1019,10 +1019,19 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>
>      if (!cpu->has_pmu) {
>          unset_feature(env, ARM_FEATURE_PMU);
> +    }
> +    if (arm_feature(env, ARM_FEATURE_PMU)) {
> +        cpu->pmceid0 = get_pmceid(&cpu->env, 0);
> +        cpu->pmceid1 = get_pmceid(&cpu->env, 1);
> +
> +        if (!kvm_enabled()) {
> +            arm_register_pre_el_change_hook(cpu, &pmu_pre_el_change, 0);
> +            arm_register_el_change_hook(cpu, &pmu_post_el_change, 0);
> +        }
> +    } else {
>          cpu->id_aa64dfr0 &= ~0xf00;
> -    } else if (!kvm_enabled()) {
> -        arm_register_pre_el_change_hook(cpu, &pmu_pre_el_change, 0);
> -        arm_register_el_change_hook(cpu, &pmu_post_el_change, 0);
> +        cpu->pmceid0 = 0;
> +        cpu->pmceid1 = 0;
>      }
>
>      if (!arm_feature(env, ARM_FEATURE_EL2)) {
> @@ -1665,8 +1674,6 @@ static void cortex_a7_initfn(Object *obj)
>      cpu->id_pfr0 = 0x00001131;
>      cpu->id_pfr1 = 0x00011011;
>      cpu->id_dfr0 = 0x02010555;
> -    cpu->pmceid0 = 0x00000000;
> -    cpu->pmceid1 = 0x00000000;
>      cpu->id_afr0 = 0x00000000;
>      cpu->id_mmfr0 = 0x10101105;
>      cpu->id_mmfr1 = 0x40000000;
> @@ -1712,8 +1719,6 @@ static void cortex_a15_initfn(Object *obj)
>      cpu->id_pfr0 = 0x00001131;
>      cpu->id_pfr1 = 0x00011011;
>      cpu->id_dfr0 = 0x02010555;
> -    cpu->pmceid0 = 0x0000000;
> -    cpu->pmceid1 = 0x00000000;
>      cpu->id_afr0 = 0x00000000;
>      cpu->id_mmfr0 = 0x10201105;
>      cpu->id_mmfr1 = 0x20000000;
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 50de58e4a2..32c3397948 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -993,6 +993,16 @@ void pmu_op_finish(CPUARMState *env);
>  void pmu_pre_el_change(ARMCPU *cpu, void *ignored);
>  void pmu_post_el_change(ARMCPU *cpu, void *ignored);
>
> +/*
> + * get_pmceid
> + * @env: CPUARMState
> + *
> + * Return the PMCEID[01]_EL0 register values corresponding to the counters
> + * which are supported given the current configuration (`which` is 0 or 1 to
> + * indicate which PMCEID should be returned)
> + */

Nit: you should have a line here below the one for "@env"
for the "@which" parameter, and the reference to it in
the text should just be "@which", not "`which`" (or just
put that description in the line saying what @which is
rather than having it in a parenthetical).

> +uint64_t get_pmceid(CPUARMState *env, unsigned which);
> +
>  /* SCTLR bit meanings. Several bits have been reused in newer
>   * versions of the architecture; in that case we define constants
>   * for both old and new bit meanings. Code which tests against those
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 873f059bf2..a1aad772fa 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -138,8 +138,6 @@ static void aarch64_a57_initfn(Object *obj)
>      cpu->isar.id_isar6 = 0;
>      cpu->isar.id_aa64pfr0 = 0x00002222;
>      cpu->id_aa64dfr0 = 0x10305106;
> -    cpu->pmceid0 = 0x00000000;
> -    cpu->pmceid1 = 0x00000000;
>      cpu->isar.id_aa64isar0 = 0x00011120;
>      cpu->id_aa64mmfr0 = 0x00001124;
>      cpu->dbgdidr = 0x3516d000;
> @@ -246,8 +244,6 @@ static void aarch64_a72_initfn(Object *obj)
>      cpu->isar.id_isar5 = 0x00011121;
>      cpu->isar.id_aa64pfr0 = 0x00002222;
>      cpu->id_aa64dfr0 = 0x10305106;
> -    cpu->pmceid0 = 0x00000000;
> -    cpu->pmceid1 = 0x00000000;
>      cpu->isar.id_aa64isar0 = 0x00011120;
>      cpu->id_aa64mmfr0 = 0x00001124;
>      cpu->dbgdidr = 0x3516d000;
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 75f054fe79..68e9743606 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -1009,6 +1009,63 @@ static inline uint64_t pmu_counter_mask(CPUARMState *env)
>    return (1 << 31) | ((1 << pmu_num_counters(env)) - 1);
>  }
>
> +typedef struct pm_event {
> +    uint16_t number; /* PMEVTYPER.evtCount is 16 bits wide */
> +    /* If the event is supported on this CPU (used to generate PMCEID[01]) */
> +    bool (*supported)(CPUARMState *);
> +    /*
> +     * Retrieve the current count of the underlying event. The programmed
> +     * counters hold a difference from the return value from this function
> +     */
> +    uint64_t (*get_count)(CPUARMState *);
> +} pm_event;
> +
> +static const pm_event pm_events[] = {
> +};
> +
> +/*
> + * Note: Before increasing MAX_EVENT_ID beyond 0x3f into the 0x40xx range of
> + * events (i.e. the statistical profiling extension), this implementation
> + * should first be updated to something sparse instead of the current
> + * supported_event_map[] array.
> + */
> +#define MAX_EVENT_ID 0x0
> +#define UNSUPPORTED_EVENT UINT16_MAX
> +static uint16_t supported_event_map[MAX_EVENT_ID + 1];
> +
> +/*
> + * Called upon initialization to build PMCEID0_EL0 or PMCEID1_EL0 (indicated by
> + * 'which'). We also use it to build a map of ARM event numbers to indices in
> + * our pm_events array.
> + *
> + * Note: Events in the 0x40XX range are not currently supported.
> + */
> +uint64_t get_pmceid(CPUARMState *env, unsigned which)
> +{
> +    uint64_t pmceid = 0;
> +    unsigned int i;
> +
> +    assert(which <= 1);
> +
> +    for (i = 0; i < ARRAY_SIZE(supported_event_map); i++) {
> +        supported_event_map[i] = UNSUPPORTED_EVENT;
> +    }
> +
> +    for (i = 0; i < ARRAY_SIZE(pm_events); i++) {
> +        const pm_event *cnt = &pm_events[i];
> +        assert(cnt->number <= MAX_EVENT_ID);
> +        /* We do not currently support events in the 0x40xx range */
> +        assert(cnt->number <= 0x3f);
> +
> +        if ((cnt->number & 0x20) == (which << 6) &&
> +                cnt->supported(env)) {
> +            pmceid |= (1 << (cnt->number & 0x1f));
> +            supported_event_map[cnt->number] = i;
> +        }
> +    }
> +    return pmceid;
> +}
> +

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
