Received: by 10.80.163.71 with SMTP id 65csp3828606edn;
        Fri, 7 Oct 2016 08:30:47 -0700 (PDT)
X-Received: by 10.55.221.146 with SMTP id u18mr18952125qku.42.1475854247481;
        Fri, 07 Oct 2016 08:30:47 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g63si10313339qkc.286.2016.10.07.08.30.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Oct 2016 08:30:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36733 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bsX6k-0007za-8s
	for alex.bennee@linaro.org; Fri, 07 Oct 2016 11:30:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40183)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bsX6f-0007zB-Sc
	for qemu-arm@nongnu.org; Fri, 07 Oct 2016 11:30:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bsX6d-00054B-DV
	for qemu-arm@nongnu.org; Fri, 07 Oct 2016 11:30:40 -0400
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:34229)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bsX6c-00053m-CF
	for qemu-arm@nongnu.org; Fri, 07 Oct 2016 11:30:39 -0400
Received: by mail-vk0-x236.google.com with SMTP id b186so48456355vkb.1
	for <qemu-arm@nongnu.org>; Fri, 07 Oct 2016 08:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SLuQGD12fhPfTKSVEdD18lb9rnraPfqQ8omJnCD/jIM=;
	b=emB6hEjGfs8PmW5zCUCzEsX+7FMmz18MdK83k37LNBws1Ig1JDjQljnuRpxyTaGJMC
	WuRmNHcBI+2SuYgiqbHcWcQau7WNjlX5dtuGBKV3AqVzyoXIDxArvzCpPIMXjyhijJPm
	xM85hLkqSMQrfFhOuj0I4WtbQcNVNm+ZsX9uc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SLuQGD12fhPfTKSVEdD18lb9rnraPfqQ8omJnCD/jIM=;
	b=gmG5VOY9NCJE3KHQfn6Gm5HtScC9McU+dKRteVL0fCzzb1Ruqc79R9elZbIFrvsWb+
	UXqxXf2Zn8qgN+jk+CVxCTIFea93uU05fwt9s99ETfHxV+suRNZ01o1+10ABqtcx2+WO
	z766jl1K8z3CwJ5yTDjcsQun4liUgyCzMXoEUNstrp7/BqTHkUrr+HA06kCfmC5eAU9j
	BC3D82Glz/JTQz5XNywhMjANKH0uERGtizm/w87RHWS6cK3fMAeYDaQ+FrjyQn5GbBEG
	glXY0DBnPcxXjcne8PV1O27tccWVghjevE1D6KUs8SmHeH9PRBAZ2JMn1phiGZY0QQta
	yU4g==
X-Gm-Message-State: AA6/9RnqcInYNU8yt2vPhv/QogsYRMcQntHosXJZFqJah4yz4Z/LiUnw2YoYq2ryW8lrS3cyijnCw0umtbl4Fohw
X-Received: by 10.31.0.67 with SMTP id 64mr3593698vka.173.1475854237763; Fri,
	07 Oct 2016 08:30:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Fri, 7 Oct 2016 08:30:17 -0700 (PDT)
In-Reply-To: <1474354500-12131-3-git-send-email-vijay.kilari@gmail.com>
References: <1474354500-12131-1-git-send-email-vijay.kilari@gmail.com>
	<1474354500-12131-3-git-send-email-vijay.kilari@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Oct 2016 16:30:17 +0100
Message-ID: <CAFEAcA9Br4VqueBmj4jnacTh2tOOWCPMjW_NWYZt7uvQob9L2A@mail.gmail.com>
To: Vijay Kilari <vijay.kilari@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Subject: Re: [Qemu-arm] [RFC PATCH v5 2/2] hw/intc/arm_gicv3_kvm: Implement
 get/put functions
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
Cc: Marc Zyngier <marc.zyngier@arm.com>, Pavel Fedin <p.fedin@samsung.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 54kLEFrCLe8M

On 20 September 2016 at 07:55,  <vijay.kilari@gmail.com> wrote:
> From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>
> This actually implements pre_save and post_load methods for in-kernel
> vGICv3.
>
> Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Vijaya Kumamr K <Vijaya.Kumar@cavium.com>
> [PMM:
>  * use decimal, not 0bnnn
>  * fixed typo in names of ICC_APR0R_EL1 and ICC_AP1R_EL1
>  * completely rearranged the get and put functions to read and write
>    the state in a natural order, rather than mixing distributor and
>    redistributor state together]
> [Vijay:
>  * Update macro KVM_VGIC_ATTR
>  * Use 32 bit access for gicd and gicr
>  * GICD_IROUTER, GICD_TYPER, GICR_PROPBASER and GICR_PENDBASER reg
>    access  are changed from 64-bit to 32-bit access
>  * s->edge_trigger stores only even bits value of an irq config.
>    Update translate_edge_trigger() accordingly.
>  * Add ICC_SRE_EL1 save and restore
>  * Initialized ICC registers during reset

These sorts of [] changes should go above the sign-off
of the person who did them, to indicate where in the
chain they happened. Also, yours is missing the closing ].

> ---
> ---

> +/* Translate from the in-kernel field for an IRQ value to/from the qemu
> + * representation. Note that these are only expected to be used for
> + * SPIs (that is, for interrupts whose state is in the distributor
> + * rather than the redistributor).
> + */
> +typedef void (*vgic_translate_fn)(GICv3State *s, int irq,
> +                                  uint32_t *field, bool to_kernel);
> +
> +static void translate_edge_trigger(GICv3State *s, int irq,
> +    uint32_t *field, bool to_kernel)
> +{
> +    /*
> +     * s->edge_trigger stores only even bits value of an irq config.
> +     * Consider only even bits and translate accordingly.
> +     */
> +    if (to_kernel) {
> +        *field = gicv3_gicd_edge_trigger_test(s, irq);
> +        *field = (*field << 1) & 3;
> +    } else {
> +        *field = (*field >> 1) & 1;
> +        gicv3_gicd_edge_trigger_replace(s, irq, *field);
> +    }
> +}

I would prefer that we just open-coded a for-loop for these,
as then you can use half_shuffle32 and half_unshuffle32 to
deal with the bits 32 at a time.

> +
> +static void translate_priority(GICv3State *s, int irq,
> +                               uint32_t *field, bool to_kernel)
> +{
> +    if (to_kernel) {
> +        *field = s->gicd_ipriority[irq];
> +    } else {
> +        s->gicd_ipriority[irq] = *field;
> +    }
> +}

Similarly, this would be better with open-coded for loops.
Then we can dump the translate_fn machinery entirely.

> +
> +static void kvm_arm_gicv3_reset_reg(GICv3State *s)
> +{
> +    int ncpu;
> +
> +    for (ncpu = 0; ncpu < s->num_cpu; ncpu++) {
> +        GICv3CPUState *c = &s->cpu[ncpu];
> +
> +        /* Initialize to actual HW supported configuration */
> +        kvm_gicc_access(s, ICC_CTLR_EL1, ncpu,
> +                        &c->icc_ctlr_el1[GICV3_NS], false);
> +
> +        c->icc_ctlr_el1[GICV3_S] = c->icc_ctlr_el1[GICV3_NS];
> +        c->icc_pmr_el1 = 0;
> +        c->icc_bpr[GICV3_G0] = GIC_MIN_BPR;
> +        c->icc_bpr[GICV3_G1] = GIC_MIN_BPR;
> +        c->icc_bpr[GICV3_G1NS] = GIC_MIN_BPR;
> +
> +        c->icc_sre_el1 = 0x7;
> +        memset(c->icc_apr, 0, sizeof(c->icc_apr));
> +        memset(c->icc_igrpen, 0, sizeof(c->icc_igrpen));
> +    }

This shouldn't be in this patch. If we need to fix reset we
should do it as a separate patch.

Also this isn't the right place, really, because the CPU interface
registers need to be reset when the CPU is reset, not when
the GIC device is reset.

>  }

>  static void kvm_arm_gicv3_class_init(ObjectClass *klass, void *data)
> diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
> index 341a311..183c7f8 100644
> --- a/include/hw/intc/arm_gicv3_common.h
> +++ b/include/hw/intc/arm_gicv3_common.h
> @@ -166,6 +166,7 @@ struct GICv3CPUState {
>      uint8_t gicr_ipriorityr[GIC_INTERNAL];
>
>      /* CPU interface */
> +    uint64_t icc_sre_el1;

Where has this come from? If we need to add a new field then it
needs to be in a different patch (and we need to make sure we
add it to the VMState struct as well). But neither the emulated
GIC nor the kernel will support writing any bits in this
register as far as I'm aware, so it's always constant 0x7...

thanks
-- PMM
