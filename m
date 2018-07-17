Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2723339wru;
        Tue, 17 Jul 2018 07:18:02 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpd0cElYei0jbmU3nVy6rWOh1zJIg4RpsJf2f9fyei+YQhnP/WeuQvZte5RVlz3spqSuxsdw
X-Received: by 2002:a37:b12:: with SMTP id 18-v6mr1552076qkl.217.1531837082706;
        Tue, 17 Jul 2018 07:18:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531837082; cv=none;
        d=google.com; s=arc-20160816;
        b=zx5WPMmY11wlZLft9B4lqJK93PaaxQYSZMoosDHlMqcxQ+ezsnCG/13Tr5wqbDqAbW
         QV5Ff8CF7w5xtrPYhON7cUzTEbCHFz5eAEExclnsM99FQnrFGYHHf2ANsj7QUAVqVjxp
         ZAk3YVCn2Z48f9p06s8iDz1m1h7I7QE+9AeWLsP2m5Cez74C+wM+koiYlyPofKNSCO+H
         3iWXLpOBopDjeKS5S5Gbyf7SXmSA9DUOnE/FNmoAdPex43GXEu1oUZkT/15Z9uNYgcS5
         6rmGHwK7L2ZS8wZzEAkXYWkyBkcTlOJ0CA77m9xxyuANYhmMq2ip3iJqMSXnnDwdOL8f
         qR/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=I5xWd8xJO/3sQuTOwQxRFlux4T8glzHNJ9niom3xJOc=;
        b=U+3vjP42Xh3ik3kR8dqNzSstdoOueg6pHBg7rD4Qg4ZcSIPWEzl8GUlkIVH0Ve6r6d
         xtlszGo6ueZNK7ixqnnMoJDtuNSFGiKBYF9lRJu5IxewENACicSrohnZmBX8KMFJdU0Y
         wT7iVlDtmwzedC7HRbSSuQcjqvbzXlC3ZXrpmFGJEpwo3g3/U3e39kryFGMjjqcxn7lf
         8BE3jiME83Nx6cLb9vVrTtP2JL1aW6WcUb6fRnC3JXN0sH1ZzMMWkkNbs70Y1vLAr4JX
         +njW8cVeFcK/eDv3EMP4c8PDZqFA4ci3rx2g+gtGhTrj8enXPpuJWighXZI5qsiiHpGs
         cCJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Hjjawqm1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s58-v6si984597qtc.107.2018.07.17.07.18.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Jul 2018 07:18:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Hjjawqm1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59610 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ffQni-0007o7-64
	for alex.bennee@linaro.org; Tue, 17 Jul 2018 10:18:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60917)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ffQnR-0007lE-U6
	for qemu-arm@nongnu.org; Tue, 17 Jul 2018 10:17:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ffQnQ-0004Ii-IG
	for qemu-arm@nongnu.org; Tue, 17 Jul 2018 10:17:45 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:34094)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ffQnQ-0004IH-CG
	for qemu-arm@nongnu.org; Tue, 17 Jul 2018 10:17:44 -0400
Received: by mail-oi0-x242.google.com with SMTP id 13-v6so2332432ois.1
	for <qemu-arm@nongnu.org>; Tue, 17 Jul 2018 07:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=I5xWd8xJO/3sQuTOwQxRFlux4T8glzHNJ9niom3xJOc=;
	b=Hjjawqm1LLdHt3j0xrlE+2H7/0gQnXDLZIfADNT3klZCF/RW3qfd/ZxWS9+XNehAw3
	3EEEcniJxf1RAd9vA/nGQTQyvY3RDSqF6FJCHA4fmFpXWJ0njHTKNnKomXdlRoT0f06e
	epuPhtYq25EBrEmmRVbcrg2Dd0MO7TbRg9kU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=I5xWd8xJO/3sQuTOwQxRFlux4T8glzHNJ9niom3xJOc=;
	b=M4IZI00/XupzlYDQYQew2jve6wC7AEyVH7sXK9Dnl8CJtvQXNMF04nE6f+8ColZGgZ
	DnF2BfO7v3zvd2QwyS3yjyFJZsO43lQcj2B2iveCluNMwdpbRV7VTxhGuNIn7zUkopAE
	WbEVM29+PHyILL1ZJYhNaQgbZ4qccQF3VtDGAxDlYjon3KhwEdxjZkCagYKqPtItNn39
	wnwvTzh8BSkrX3ESM0tviXpgp2DPi8u8AOHCvOXh2PHSEWKWqIhiVupBniOtX3Vth0OR
	C2bPW69FZ8mZu4gnIAxLF3FW1Tluy4vZH+OiE0QhVL4gXr2tqsiJwEFU3VbOUoXVeSrP
	g31g==
X-Gm-Message-State: AOUpUlEM3PLjWqrLoAo+6OBhHH1086GvY6Raab87eYYaKoIjGsSUN9w1
	aM7eKzi64GmOFprxUuhlR+7NWe1G30ERXi6d3SqgVA==
X-Received: by 2002:aca:7247:: with SMTP id
	p68-v6mr1971923oic.252.1531837063753; 
	Tue, 17 Jul 2018 07:17:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Tue, 17 Jul 2018 07:17:23
	-0700 (PDT)
In-Reply-To: <20180714171601.5734-8-luc.michel@greensocs.com>
References: <20180714171601.5734-1-luc.michel@greensocs.com>
	<20180714171601.5734-8-luc.michel@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jul 2018 15:17:23 +0100
Message-ID: <CAFEAcA-drY59TwsKaheA6zaocXb0L4bwdD+K=j4DKPJqfCkXYQ@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [PATCH v4 07/20] intc/arm_gic: Add virtualization
 extensions helper macros and functions
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
Cc: Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3iA/2D+Udg2V

On 14 July 2018 at 18:15, Luc Michel <luc.michel@greensocs.com> wrote:
> Add some helper macros and functions related to the virtualization
> extensions to gic_internal.h.
>
> The GICH_LR_* macros help extracting specific fields of a list register
> value. The only tricky one is the priority field as only the MSB are
> stored. The value must be shifted accordingly to obtain the correct
> priority value.
>
> gic_is_vcpu() and gic_get_vcpu_real_id() help with (v)CPU id manipulation
> to abstract the fact that vCPU id are in the range
> [ GIC_NCPU; (GIC_NCPU + num_cpu) [.
>
> gic_lr_* and gic_virq_is_valid() help with the list registers.
> gic_get_lr_entry() returns the LR entry for a given (vCPU, irq) pair. It
> is meant to be used in contexts where we know for sure that the entry
> exists, so we assert that entry is actually found, and the caller can
> avoid the NULL check on the returned pointer.
>
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> ---
>  hw/intc/arm_gic.c      |  5 +++
>  hw/intc/gic_internal.h | 75 ++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 80 insertions(+)
>
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index aaa34426a1..1ac0fe740c 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -61,6 +61,11 @@ static inline int gic_get_current_cpu(GICState *s)
>      return 0;
>  }
>
> +static inline int gic_get_current_vcpu(GICState *s)
> +{
> +    return gic_get_current_cpu(s) + GIC_NCPU;
> +}
> +
>  /* Return true if this GIC config has interrupt groups, which is
>   * true if we're a GICv2, or a GICv1 with the security extensions.
>   */
> diff --git a/hw/intc/gic_internal.h b/hw/intc/gic_internal.h
> index 1aa888a576..56e203aeb9 100644
> --- a/hw/intc/gic_internal.h
> +++ b/hw/intc/gic_internal.h
> @@ -129,6 +129,20 @@ REG32(GICH_LR63, 0x1fc)
>       R_GICH_LR0_Priority_MASK | R_GICH_LR0_State_MASK | \
>       R_GICH_LR0_Grp1_MASK | R_GICH_LR0_HW_MASK)
>
> +#define GICH_LR_STATE_INVALID         0
> +#define GICH_LR_STATE_PENDING         1
> +#define GICH_LR_STATE_ACTIVE          2
> +#define GICH_LR_STATE_ACTIVE_PENDING  3
> +
> +#define GICH_LR_VIRT_ID(entry) (FIELD_EX32(entry, GICH_LR0, VirtualID))
> +#define GICH_LR_PHYS_ID(entry) (FIELD_EX32(entry, GICH_LR0, PhysicalID))
> +#define GICH_LR_CPUID(entry) (FIELD_EX32(entry, GICH_LR0, CPUID))
> +#define GICH_LR_EOI(entry) (FIELD_EX32(entry, GICH_LR0, EOI))
> +#define GICH_LR_PRIORITY(entry) (FIELD_EX32(entry, GICH_LR0, Priority) << 3)
> +#define GICH_LR_STATE(entry) (FIELD_EX32(entry, GICH_LR0, State))
> +#define GICH_LR_GROUP(entry) (FIELD_EX32(entry, GICH_LR0, Grp1))
> +#define GICH_LR_HW(entry) (FIELD_EX32(entry, GICH_LR0, HW))
> +
>  /* Valid bits for GICC_CTLR for GICv1, v1 with security extensions,
>   * GICv2 and GICv2 with security extensions:
>   */
> @@ -164,4 +178,65 @@ static inline bool gic_is_vcpu(int cpu)
>      return cpu >= GIC_NCPU;
>  }
>
> +static inline int gic_get_vcpu_real_id(int cpu)
> +{
> +    return (cpu >= GIC_NCPU) ? (cpu - GIC_NCPU) : cpu;
> +}
> +
> +/* Return true if the given vIRQ state exists in a LR and is either active or
> + * pending and active.
> + *
> + * This function is used to check that a guest's `end of interrupt' or
> + * `interrupts deactivation' request is valid, and matches with a LR of an
> + * already acknowledged vIRQ (i.e. has the active bit set in its state).
> + */
> +static inline bool gic_virq_is_valid(GICState *s, int irq, int vcpu)
> +{
> +    int cpu = gic_get_vcpu_real_id(vcpu);
> +    int lr_idx;
> +
> +    for (lr_idx = 0; lr_idx < s->num_lrs; lr_idx++) {
> +        uint32_t *entry = &s->h_lr[lr_idx][cpu];
> +
> +        if ((GICH_LR_VIRT_ID(*entry) == irq) &&
> +            (GICH_LR_STATE(*entry) & GICH_LR_STATE_ACTIVE)) {
> +            return true;
> +        }
> +    }
> +
> +    return false;
> +}
> +
> +/* Return a pointer on the LR entry matching the given vIRQ.
> + *
> + * This function is used to retrieve an LR for which we know for sure that the
> + * corresponding vIRQ exists in the current context (i.e. its current state is
> + * not `invalid'):
> + *   - Either the corresponding vIRQ has been validated with gic_virq_is_valid()
> + *     so it is `active' or `active and pending',
> + *   - Or it was pending and has been selected by gic_get_best_virq(). It is now
> + *     `pending', `active' or `active and pending', depending on what the guest
> + *     already did with this vIRQ.
> + *
> + * Having multiple LRs with the same VirtualID leads to UNPREDICTABLE
> + * behaviour in the GIC. We choose to return the first one that matches.
> + */
> +static inline uint32_t *gic_get_lr_entry(GICState *s, int irq, int vcpu)
> +{
> +    int cpu = gic_get_vcpu_real_id(vcpu);
> +    int lr_idx;
> +
> +    for (lr_idx = 0; lr_idx < s->num_lrs; lr_idx++) {
> +        uint32_t *entry = &s->h_lr[lr_idx][cpu];
> +
> +        if ((GICH_LR_VIRT_ID(*entry) == irq) &&
> +            (GICH_LR_STATE(*entry) != GICH_LR_STATE_INVALID)) {
> +            return entry;
> +        }
> +    }
> +
> +    g_assert_not_reached();
> +    return NULL;
> +}

You can drop the 'return NULL' as that is unreachable code.
Otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
