Received: by 10.25.150.194 with SMTP id y185csp196400lfd;
        Wed, 9 Nov 2016 03:19:16 -0800 (PST)
X-Received: by 10.157.24.82 with SMTP id t18mr9160368ott.252.1478690356153;
        Wed, 09 Nov 2016 03:19:16 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u47si20932025ota.51.2016.11.09.03.19.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 Nov 2016 03:19:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38828 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c4QuR-0007Rt-As
	for alex.bennee@linaro.org; Wed, 09 Nov 2016 06:19:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43514)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1c4QuK-0007QM-47
	for qemu-arm@nongnu.org; Wed, 09 Nov 2016 06:19:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1c4QuI-0000cO-Ot
	for qemu-arm@nongnu.org; Wed, 09 Nov 2016 06:19:08 -0500
Received: from mail-ua0-x242.google.com ([2607:f8b0:400c:c08::242]:34917)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vijay.kilari@gmail.com>)
	id 1c4QuI-0000bD-JK; Wed, 09 Nov 2016 06:19:06 -0500
Received: by mail-ua0-x242.google.com with SMTP id 50so9154978uae.2;
	Wed, 09 Nov 2016 03:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QeWWYXI8HhEvVGH18wYFmO0gaGU6e9D/zwl46C1DasU=;
	b=OICv5t01milrqMRlHjYGjqw0xsX0klWxiiZGbcwBmxWQh5vKh8NFLRBLgVx9Yn8rdJ
	w/KCHRXL4x2T8Dv3hJ8VZ4wOiyFOn2PsOTLV6CU/H5EiRU7DXe/7I5IEZq/GQS6StTzv
	zitwunaXXcPMrQUfMuhYxeuNcBlYsHtFQEXB+0FBTpdWT3eLYONRnaDukfyJSLOTfkQz
	nwXQm7/KxAbLmZW+92YXFef6oPJ3nzxLYVEvlY2oMkVdVqiwOLA1HNYj1RoMMf2bxWZN
	KMFu5Rlo8XT5u/dIjenou3X21QJT5p/wUEkapPNaxS1vZqab1huEhuBkjPoCzVq06uCT
	2GYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QeWWYXI8HhEvVGH18wYFmO0gaGU6e9D/zwl46C1DasU=;
	b=MeC/4MKNJPS6OmsSB+BcWxBl6YAurMo8zfgHv8OQ4jgDEdVKWCQzYc0BdxqhgaRy+i
	X6yLgloNUIUyu+QMUoqFMMnco4/7xUIyeRtJj+aS28wi2+lNHqHi1zDm9H4eoe4UBnh6
	MdbsRw7a6aredujpRfCYj1Aga+yTeR+vBmROz3UqnvYhcdJMuA+mbf2YLrlHq8o7WEuj
	nOC1rawGUfyXWMwyzm8XoWPy3+29HiKPX0Id3ceggCCgyOsxXBUC8aqZ09n7FJ7zghA7
	X4erj+xXe3WWRdZm/HdK7uyJbz1PwTYBLirwa0T6RnTZG+RCijkgt+WMQRNo82s9fNE6
	U07g==
X-Gm-Message-State: ABUngvfLDC1nCTLAT27ZSNZLJfYfj7KH3UzAgKtJytH3W4hgsbQHHQhisPwYxZhUU5uXvcxHbryDfIQ2VrFGZg==
X-Received: by 10.159.33.97 with SMTP id 88mr214791uab.156.1478690345634; Wed,
	09 Nov 2016 03:19:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.93.135 with HTTP; Wed, 9 Nov 2016 03:19:05 -0800 (PST)
In-Reply-To: <CAFEAcA9Br4VqueBmj4jnacTh2tOOWCPMjW_NWYZt7uvQob9L2A@mail.gmail.com>
References: <1474354500-12131-1-git-send-email-vijay.kilari@gmail.com>
	<1474354500-12131-3-git-send-email-vijay.kilari@gmail.com>
	<CAFEAcA9Br4VqueBmj4jnacTh2tOOWCPMjW_NWYZt7uvQob9L2A@mail.gmail.com>
From: Vijay Kilari <vijay.kilari@gmail.com>
Date: Wed, 9 Nov 2016 16:49:05 +0530
Message-ID: <CALicx6s+oav6BERNxCtAV2E7DOWU4bUtV9zKa8g29pNiOOMLjQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::242
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
X-TUID: AmqpADa83DVX

On Fri, Oct 7, 2016 at 9:00 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 20 September 2016 at 07:55,  <vijay.kilari@gmail.com> wrote:
>> From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>>
>> This actually implements pre_save and post_load methods for in-kernel
>> vGICv3.
>>
>> Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Vijaya Kumamr K <Vijaya.Kumar@cavium.com>
>> [PMM:
>>  * use decimal, not 0bnnn
>>  * fixed typo in names of ICC_APR0R_EL1 and ICC_AP1R_EL1
>>  * completely rearranged the get and put functions to read and write
>>    the state in a natural order, rather than mixing distributor and
>>    redistributor state together]
>> [Vijay:
>>  * Update macro KVM_VGIC_ATTR
>>  * Use 32 bit access for gicd and gicr
>>  * GICD_IROUTER, GICD_TYPER, GICR_PROPBASER and GICR_PENDBASER reg
>>    access  are changed from 64-bit to 32-bit access
>>  * s->edge_trigger stores only even bits value of an irq config.
>>    Update translate_edge_trigger() accordingly.
>>  * Add ICC_SRE_EL1 save and restore
>>  * Initialized ICC registers during reset
>
> These sorts of [] changes should go above the sign-off
> of the person who did them, to indicate where in the
> chain they happened. Also, yours is missing the closing ].
>
>> ---
>> ---
>
>> +/* Translate from the in-kernel field for an IRQ value to/from the qemu
>> + * representation. Note that these are only expected to be used for
>> + * SPIs (that is, for interrupts whose state is in the distributor
>> + * rather than the redistributor).
>> + */
>> +typedef void (*vgic_translate_fn)(GICv3State *s, int irq,
>> +                                  uint32_t *field, bool to_kernel);
>> +
>> +static void translate_edge_trigger(GICv3State *s, int irq,
>> +    uint32_t *field, bool to_kernel)
>> +{
>> +    /*
>> +     * s->edge_trigger stores only even bits value of an irq config.
>> +     * Consider only even bits and translate accordingly.
>> +     */
>> +    if (to_kernel) {
>> +        *field = gicv3_gicd_edge_trigger_test(s, irq);
>> +        *field = (*field << 1) & 3;
>> +    } else {
>> +        *field = (*field >> 1) & 1;
>> +        gicv3_gicd_edge_trigger_replace(s, irq, *field);
>> +    }
>> +}
>
> I would prefer that we just open-coded a for-loop for these,
> as then you can use half_shuffle32 and half_unshuffle32 to
> deal with the bits 32 at a time.

You mean to completely drop this translate_fn which is called from
kvm_dist_put/get() and have a direct function to handle edge_trigger?

>
>> +
>> +static void translate_priority(GICv3State *s, int irq,
>> +                               uint32_t *field, bool to_kernel)
>> +{
>> +    if (to_kernel) {
>> +        *field = s->gicd_ipriority[irq];
>> +    } else {
>> +        s->gicd_ipriority[irq] = *field;
>> +    }
>> +}
>
> Similarly, this would be better with open-coded for loops.
> Then we can dump the translate_fn machinery entirely.
>
>> +
>> +static void kvm_arm_gicv3_reset_reg(GICv3State *s)
>> +{
>> +    int ncpu;
>> +
>> +    for (ncpu = 0; ncpu < s->num_cpu; ncpu++) {
>> +        GICv3CPUState *c = &s->cpu[ncpu];
>> +
>> +        /* Initialize to actual HW supported configuration */
>> +        kvm_gicc_access(s, ICC_CTLR_EL1, ncpu,
>> +                        &c->icc_ctlr_el1[GICV3_NS], false);
>> +
>> +        c->icc_ctlr_el1[GICV3_S] = c->icc_ctlr_el1[GICV3_NS];
>> +        c->icc_pmr_el1 = 0;
>> +        c->icc_bpr[GICV3_G0] = GIC_MIN_BPR;
>> +        c->icc_bpr[GICV3_G1] = GIC_MIN_BPR;
>> +        c->icc_bpr[GICV3_G1NS] = GIC_MIN_BPR;
>> +
>> +        c->icc_sre_el1 = 0x7;
>> +        memset(c->icc_apr, 0, sizeof(c->icc_apr));
>> +        memset(c->icc_igrpen, 0, sizeof(c->icc_igrpen));
>> +    }
>
> This shouldn't be in this patch. If we need to fix reset we
> should do it as a separate patch.
>
> Also this isn't the right place, really, because the CPU interface
> registers need to be reset when the CPU is reset, not when
> the GIC device is reset.

To make GIC cpuif registers to reset upon cpu reset,
I propose to add Interface for gicv3_common class and
call this interface from arm_cpu_reset() similar to
ARMLinuxBootIf. This will be more generic way rather
than searching for gicv3 object and reset the registers

>
>>  }
>
>>  static void kvm_arm_gicv3_class_init(ObjectClass *klass, void *data)
>> diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
>> index 341a311..183c7f8 100644
>> --- a/include/hw/intc/arm_gicv3_common.h
>> +++ b/include/hw/intc/arm_gicv3_common.h
>> @@ -166,6 +166,7 @@ struct GICv3CPUState {
>>      uint8_t gicr_ipriorityr[GIC_INTERNAL];
>>
>>      /* CPU interface */
>> +    uint64_t icc_sre_el1;
>
> Where has this come from? If we need to add a new field then it

This was part of review comment from Christoffer to add icc_sre_el1
save and restore

> needs to be in a different patch (and we need to make sure we
OK. I will spin a new patch

> add it to the VMState struct as well). But neither the emulated
> GIC nor the kernel will support writing any bits in this
> register as far as I'm aware, so it's always constant 0x7...

Kernel will not allow write on this. But make a check for SRE bit.
>
> thanks
> -- PMM
