Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2841940wru;
        Tue, 17 Jul 2018 09:06:50 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpd9sx6V7tTw411IZ5i2e/eZVLkgBwS1sm++P8hjjvWCsugMg6vmgHZzWkeXxYwnD3OX+2Wi
X-Received: by 2002:a37:ae03:: with SMTP id x3-v6mr2037185qke.170.1531843610458;
        Tue, 17 Jul 2018 09:06:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531843610; cv=none;
        d=google.com; s=arc-20160816;
        b=m8bjezrGpsT30iq0R8iVneesMDFsUuwrkaP+o0b/IwjSQJQ/c5nmGjv/FU5HZu47sA
         dpEiw09yktz1f1jdVj38S7iFeHL0QSH0wFSptS7XH7RO/xpVLtzY81YKKLDKbcrHauam
         tjSmHzKv94DRDGkwFU7MVeOIuEzQ+GdI3+txfPN07TBqLRqCNvRN7UEpvcLE+UzLiIYK
         bYuR02Ppi44PGX6q8f658K74tTmHgkDXt1aezCDU7dkhVHxXixdqMKfWvvK4e1vtu3+V
         3SNagXkGKxkAZxJJDbaoABK4cJJbBhwjMKmPwhAPFdDvAZxJqAJKTEIJPEPZXCAzAagT
         pdsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=EITDd/nHHVcoJjRpmGxyYt+c8ynvMgO4gOvQwZWozWc=;
        b=fjfVAK8voY8n1/uM90gVL1zZQZKN4+NfLI0+pfYDhBdGP/gN1MYZASlqq73PPR8uQ+
         9EQPh8ZobHbyYeGhf4M9mwY576Y3EOvndKR9qyRexzEeNFCg36TWVDzuTz7kuBMc5m4D
         Wxlz8RWxi8BjEdK/ux/Mdj11eM5fL4UDjDlVlbArkHQvWNVtnZjPSDBvjN+/UpOsU6fT
         iIaq9ltMEomgujeaan8/4rzPjES6bIOanY/yOdpAoBQDmBbJlGcW7ZjuwSd6k+pVXiNi
         fTiuGW30BTGbDab8XE4tIke734YFG9xjWFsR94odRDIQFkPcivLCrwmFCJ7g777FFmvX
         1qhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hOsUaixN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y3-v6si1513201qvl.222.2018.07.17.09.06.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Jul 2018 09:06:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hOsUaixN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60290 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ffSUy-0007Hf-Ey
	for alex.bennee@linaro.org; Tue, 17 Jul 2018 12:06:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39892)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ffSUh-0007Bc-BB
	for qemu-arm@nongnu.org; Tue, 17 Jul 2018 12:06:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ffSUf-0008KW-SF
	for qemu-arm@nongnu.org; Tue, 17 Jul 2018 12:06:31 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:34821)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ffSUf-0008K3-MF
	for qemu-arm@nongnu.org; Tue, 17 Jul 2018 12:06:29 -0400
Received: by mail-oi0-x242.google.com with SMTP id i12-v6so3042552oik.2
	for <qemu-arm@nongnu.org>; Tue, 17 Jul 2018 09:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EITDd/nHHVcoJjRpmGxyYt+c8ynvMgO4gOvQwZWozWc=;
	b=hOsUaixN7CcwzvQW++UhSiZVy0R1iZ5jokkWwCamuZ1hgzIwzNGMQpll6aNLhQ7J/5
	uHU/5kbxgECFxECvrUR2SNS8TNKfFRXMGDRW/6tdBBkKBgiWdvLVuvBF1vj2MSP+rLxN
	fixb+TkeXE52MWZwq9eBgNQqYnx/tgf1V1D0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EITDd/nHHVcoJjRpmGxyYt+c8ynvMgO4gOvQwZWozWc=;
	b=G+rGWLxUI6RRWo4QNdoqyitjIPBCZdqy+v4DIkuGmL9GZXudZXoo0iE38faOV8CvNi
	LDwp0kYRCSX6keKS7M2N4t37hlRNhjE/41xAXJo13aIZLtq6KY4c/DvRJ+OKh+ji3fVl
	0/OvSr/C4YDeh49B1nhRkx6WeXMqGxRKAcGTq3cHcTqPLZk3Sd+4t8cDm7bYW8Xo12iP
	d3QNgsmBG2ylCQmjwJnTRtV8BKTZNFZ6z9fnqY7Hq9w6B+Hu5LkGnWIdPmK2Dne67Otd
	jfxFT4MhwoUnb84P95nYs/oTxMszcRrtyr3To4kk0ddJIrDxmFZrKWD1TbYGcraZsYuK
	8u6w==
X-Gm-Message-State: AOUpUlG6mVeSsl4AM5gzbtIhqn8hbhAsLedGnQsm7ywBKe4APdx5Shab
	VZGwcpVFSP3iB0zTfAYsHuzOGEhi/ALh4GT6Qdzqpg==
X-Received: by 2002:aca:7247:: with SMTP id
	p68-v6mr2456516oic.252.1531843588617; 
	Tue, 17 Jul 2018 09:06:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Tue, 17 Jul 2018 09:06:08
	-0700 (PDT)
In-Reply-To: <1529699547-17044-8-git-send-email-alindsay@codeaurora.org>
References: <1529699547-17044-1-git-send-email-alindsay@codeaurora.org>
	<1529699547-17044-8-git-send-email-alindsay@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jul 2018 17:06:08 +0100
Message-ID: <CAFEAcA-ZVvytysV4M4oM-czE5zhxu-VJsd_mfgkp47QAVEtYXA@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [PATCH v5 07/13] target/arm: Add array for supported
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
Cc: Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Aaron Lindsay <aclindsa@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LrwRSOkkTLFq

On 22 June 2018 at 21:32, Aaron Lindsay <alindsay@codeaurora.org> wrote:
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
>  target/arm/cpu64.c  |  2 --
>  target/arm/helper.c | 37 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 60 insertions(+), 9 deletions(-)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 98790b1..2f5b16a 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -927,9 +927,19 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>      if (!cpu->has_pmu) {
>          unset_feature(env, ARM_FEATURE_PMU);
>          cpu->id_aa64dfr0 &= ~0xf00;
> -    } else if (!kvm_enabled()) {
> -        arm_register_pre_el_change_hook(cpu, &pmu_pre_el_change, 0);
> -        arm_register_el_change_hook(cpu, &pmu_post_el_change, 0);
> +    }
> +    if (arm_feature(env, ARM_FEATURE_PMU)) {
> +        uint64_t pmceid = get_pmceid(&cpu->env);
> +        cpu->pmceid0 = pmceid & 0xffffffff;
> +        cpu->pmceid1 = (pmceid >> 32) & 0xffffffff;
> +
> +        if (!kvm_enabled()) {
> +            arm_register_pre_el_change_hook(cpu, &pmu_pre_el_change, 0);
> +            arm_register_el_change_hook(cpu, &pmu_post_el_change, 0);
> +        }
> +    } else {
> +        cpu->pmceid0 = 0x00000000;
> +        cpu->pmceid1 = 0x00000000;

This is ok for now, but we really need to sort out what we're
doing for the interplay between feature bits and ID register
values more generally (notably for '-cpu max'), so depending on
when we do that work this might end up needing to change a bit
to fit in.

>      }
>
>      if (!arm_feature(env, ARM_FEATURE_EL2)) {
> @@ -1538,8 +1548,6 @@ static void cortex_a7_initfn(Object *obj)
>      cpu->id_pfr0 = 0x00001131;
>      cpu->id_pfr1 = 0x00011011;
>      cpu->id_dfr0 = 0x02010555;
> -    cpu->pmceid0 = 0x00000000;
> -    cpu->pmceid1 = 0x00000000;
>      cpu->id_afr0 = 0x00000000;
>      cpu->id_mmfr0 = 0x10101105;
>      cpu->id_mmfr1 = 0x40000000;
> @@ -1581,8 +1589,6 @@ static void cortex_a15_initfn(Object *obj)
>      cpu->id_pfr0 = 0x00001131;
>      cpu->id_pfr1 = 0x00011011;
>      cpu->id_dfr0 = 0x02010555;
> -    cpu->pmceid0 = 0x0000000;
> -    cpu->pmceid1 = 0x00000000;
>      cpu->id_afr0 = 0x00000000;
>      cpu->id_mmfr0 = 0x10201105;
>      cpu->id_mmfr1 = 0x20000000;
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 852743b..430b8d5 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -964,6 +964,16 @@ void pmu_op_finish(CPUARMState *env);
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
> +
>  /* SCTLR bit meanings. Several bits have been reused in newer
>   * versions of the architecture; in that case we define constants
>   * for both old and new bit meanings. Code which tests against those
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index c50dcd4..28482a0 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -141,8 +141,6 @@ static void aarch64_a57_initfn(Object *obj)
>      cpu->id_isar5 = 0x00011121;
>      cpu->id_aa64pfr0 = 0x00002222;
>      cpu->id_aa64dfr0 = 0x10305106;
> -    cpu->pmceid0 = 0x00000000;
> -    cpu->pmceid1 = 0x00000000;
>      cpu->id_aa64isar0 = 0x00011120;
>      cpu->id_aa64mmfr0 = 0x00001124;
>      cpu->dbgdidr = 0x3516d000;
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 5d83446..9f81747 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -964,6 +964,43 @@ static inline uint64_t pmu_counter_mask(CPUARMState *env)
>    return (1 << 31) | ((1 << pmu_num_counters(env)) - 1);
>  }
>
> +typedef struct pm_event {
> +    uint16_t number; /* PMEVTYPER.evtCount is 10 bits wide */
> +    /* If the event is supported on this CPU (used to generate PMCEID[01]) */
> +    bool (*supported)(CPUARMState *);
> +    /* Retrieve the current count of the underlying event. The programmed
> +     * counters hold a difference from the return value from this function */

Don't leave the */ dangling on the RHS of a multiline comment.
(CODING_STYLE now recommends Linux-kernel style.)

> +    uint64_t (*get_count)(CPUARMState *);
> +} pm_event;
> +
> +#define SUPPORTED_EVENT_SENTINEL UINT16_MAX
> +static const pm_event pm_events[] = {
> +    { .number = SUPPORTED_EVENT_SENTINEL }
> +};
> +static uint16_t supported_event_map[0x3f];

What is this hardcoded 0x3f ?

> +
> +/*
> + * Called upon initialization to build PMCEID0 (low 32 bits) and PMCEID1 (high
> + * 32). We also use it to build a map of ARM event numbers to indices in
> + * our pm_events array.
> + */
> +uint64_t get_pmceid(CPUARMState *env)
> +{
> +    uint64_t pmceid = 0;
> +    unsigned int i = 0;
> +    while (pm_events[i].number != SUPPORTED_EVENT_SENTINEL) {

Are we ever going to run through some other array than the
constant pm_events[] ? We could just use ARRAY_SIZE rather
than requiring a sentinel member.

> +        const pm_event *cnt = &pm_events[i];
> +        if (cnt->number < 0x3f && cnt->supported(env)) {

...another 0x3f. Are we ever really going to see an
out-of-range .number field, or should we just assert()
that it's in range ?

> +            pmceid |= (1 << cnt->number);
> +            supported_event_map[cnt->number] = i;
> +        } else {
> +            supported_event_map[cnt->number] = SUPPORTED_EVENT_SENTINEL;

This will leave us with supported_event_map[] entries in
one of three states:
 * SUPPORTED_EVENT_SENTINEL if they have a specific pm_events[]
   entry marked as not supported
 * an index if they are supported
 * zero if there is no pm_events[] entry

Don't the ones in the last category get confused with the
real index 0?

Maybe this should initialize the whole array first to the
sentinel value and then just fill in the supported ones with
their index values?

> +        }
> +        i++;
> +    }
> +    return pmceid;
> +}
> +

thanks
-- PMM
