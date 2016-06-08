Received: by 10.25.27.66 with SMTP id b63csp2288834lfb;
        Tue, 7 Jun 2016 18:59:49 -0700 (PDT)
X-Received: by 10.55.21.170 with SMTP id 42mr2392390qkv.159.1465351189409;
        Tue, 07 Jun 2016 18:59:49 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 79si15800051qgc.16.2016.06.07.18.59.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Jun 2016 18:59:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54031 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bASma-0008Ol-PM
	for alex.bennee@linaro.org; Tue, 07 Jun 2016 21:59:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48175)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bASlN-0007Qi-Kx
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 21:58:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bASlK-0000m8-4V
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 21:58:32 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:27832)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1bASlA-0000hE-Bh; Tue, 07 Jun 2016 21:58:21 -0400
Received: from 172.24.1.36 (EHLO szxeml434-hub.china.huawei.com)
	([172.24.1.36])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DII71142; Wed, 08 Jun 2016 09:57:58 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml434-hub.china.huawei.com
	(10.82.67.225) with Microsoft SMTP Server id 14.3.235.1; Wed, 8 Jun 2016
	09:57:45 +0800
Message-ID: <57577B92.90203@huawei.com>
Date: Wed, 8 Jun 2016 09:57:38 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>
References: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
	<1464274540-19693-11-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1464274540-19693-11-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A0B0206.57577BAC.000A, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 0c68dd66661925199634cab153aad914
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 10/22] hw/intc/arm_gicv3:
 Implement functions to identify next pending irq
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
Cc: patches@linaro.org, Shlomo Pongratz <shlomo.pongratz@huawei.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, Shannon Zhao <shannon.zhao@linaro.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PzKD4lmFg6ua



On 2016/5/26 22:55, Peter Maydell wrote:
> Implement the GICv3 logic to recalculate the highest priority pending
> interrupt for each CPU after some part of the GIC state has changed.
> We avoid unnecessary full recalculation where possible.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/arm_gicv3.c                | 293 +++++++++++++++++++++++++++++++++++++
>  hw/intc/arm_gicv3_common.c         |   9 ++
>  hw/intc/gicv3_internal.h           | 121 +++++++++++++++
>  include/hw/intc/arm_gicv3_common.h |  18 +++
>  4 files changed, 441 insertions(+)
> 
> diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
> index 96e0d2f..7c4bee6 100644
> --- a/hw/intc/arm_gicv3.c
> +++ b/hw/intc/arm_gicv3.c
> @@ -21,6 +21,287 @@
>  #include "hw/intc/arm_gicv3.h"
>  #include "gicv3_internal.h"
>  
> +static bool irqbetter(GICv3CPUState *cs, int irq, uint8_t prio)
> +{
> +    /* Return true if this IRQ at this priority should take
> +     * precedence over the current recorded highest priority
> +     * pending interrupt for this CPU. We also return true if
> +     * the current recorded highest priority pending interrupt
> +     * is the same as this one (a property which the calling code
> +     * relies on).
> +     */
> +    if (prio < cs->hppi.prio) {
> +        return true;
> +    }
> +    /* If multiple pending interrupts have the same priority then it is an
> +     * IMPDEF choice which of them to signal to the CPU. We choose to
> +     * signal the one with the lowest interrupt number.
> +     */
> +    if (prio == cs->hppi.prio && irq <= cs->hppi.irq) {
> +        return true;
> +    }
> +    return false;
> +}
> +
> +static uint32_t gicd_int_pending(GICv3State *s, int irq)
> +{
> +    /* Recalculate which redistributor interrupts are actually pending
s/redistributor/distributor/

> +     * in the group of 32 interrupts starting at irq (which should be a multiple
> +     * of 32), and return a 32-bit integer which has a bit set for each
> +     * interrupt that is eligible to be signaled to the CPU interface.
> +     *
> +     * An interrupt is pending if:
> +     *  + the PENDING latch is set OR it is level triggered and the input is 1
> +     *  + its ENABLE bit is set
> +     *  + the GICD enable bit for its group is set
> +     * Conveniently we can bulk-calculate this with bitwise operations.
> +     */
> +    uint32_t pend, grpmask;
> +    uint32_t pending = *gic_bmp_ptr32(s->pending, irq);
> +    uint32_t edge_trigger = *gic_bmp_ptr32(s->edge_trigger, irq);
> +    uint32_t level = *gic_bmp_ptr32(s->level, irq);
> +    uint32_t group = *gic_bmp_ptr32(s->group, irq);
> +    uint32_t grpmod = *gic_bmp_ptr32(s->grpmod, irq);
> +    uint32_t enable = *gic_bmp_ptr32(s->enabled, irq);
> +
> +    pend = pending | (~edge_trigger & level);
> +    pend &= enable;
> +
> +    if (s->gicd_ctlr & GICD_CTLR_DS) {
> +        grpmod = 0;
> +    }
> +
> +    grpmask = 0;
> +    if (s->gicd_ctlr & GICD_CTLR_EN_GRP1NS) {
> +        grpmask |= group;
> +    }
> +    if (s->gicd_ctlr & GICD_CTLR_EN_GRP1S) {
> +        grpmask |= (~group & grpmod);
> +    }
> +    if (s->gicd_ctlr & GICD_CTLR_EN_GRP0) {
> +        grpmask |= (~group & ~grpmod);
> +    }
> +    pend &= grpmask;
> +
> +    return pend;
> +}
> +
> +static uint32_t gicr_int_pending(GICv3CPUState *cs)
> +{
> +    /* Recalculate which redistributor interrupts are actually pending,
> +     * and return a 32-bit integer which has a bit set for each interrupt
> +     * that is eligible to be signaled to the CPU interface.
> +     *
> +     * An interrupt is pending if:
> +     *  + the PENDING latch is set OR it is level triggered and the input is 1
> +     *  + its ENABLE bit is set
> +     *  + the GICD enable bit for its group is set
> +     * Conveniently we can bulk-calculate this with bitwise operations.
> +     */
> +    uint32_t pend, grpmask, grpmod;
> +
> +    pend = cs->gicr_ipendr0 | (~cs->edge_trigger & cs->level);
> +    pend &= cs->gicr_ienabler0;
> +
> +    if (cs->gic->gicd_ctlr & GICD_CTLR_DS) {
> +        grpmod = 0;
> +    } else {
> +        grpmod = cs->gicr_igrpmodr0;
> +    }
> +
> +    grpmask = 0;
> +    if (cs->gic->gicd_ctlr & GICD_CTLR_EN_GRP1NS) {
> +        grpmask |= cs->gicr_igroupr0;
> +    }
> +    if (cs->gic->gicd_ctlr & GICD_CTLR_EN_GRP1S) {
> +        grpmask |= (~cs->gicr_igroupr0 & grpmod);
> +    }
> +    if (cs->gic->gicd_ctlr & GICD_CTLR_EN_GRP0) {
> +        grpmask |= (~cs->gicr_igroupr0 & ~grpmod);
> +    }
> +    pend &= grpmask;
> +
> +    return pend;
> +}
> +
> +/* Update the interrupt status after state in a redistributor
> + * or CPU interface has changed, but don't tell the CPU i/f.
> + */
> +static void gicv3_redist_update_noirqset(GICv3CPUState *cs)
> +{
> +    /* Find the highest priority pending interrupt among the
> +     * redistributor interrupts (SGIs and PPIs).
> +     */
> +    bool seenbetter = false;
> +    uint8_t prio;
> +    int i;
> +    uint32_t pend;
> +
> +    /* Find out which redistributor interrupts are eligible to be
> +     * signaled to the CPU interface.
> +     */
> +    pend = gicr_int_pending(cs);
> +
> +    if (pend) {
> +        for (i = 0; i < GIC_INTERNAL; i++) {
> +            if (!(pend & (1 << i))) {
> +                continue;
> +            }
> +            prio = cs->gicr_ipriorityr[i];
> +            if (irqbetter(cs, i, prio)) {
> +                cs->hppi.irq = i;
> +                cs->hppi.prio = prio;
> +                seenbetter = true;
> +            }
> +        }
> +    }
> +
> +    if (seenbetter) {
> +        cs->hppi.grp = gicv3_irq_group(cs->gic, cs, cs->hppi.irq);
> +    }
> +
> +    /* If the best interrupt we just found would preempt whatever
> +     * was the previous best interrupt before this update, then
> +     * we know it's definitely the best one now.
> +     * If we didn't find an interrupt that would preempt the previous
> +     * best, and the previous best is outside our range (or there was no
> +     * previous pending interrupt at all), then that is still valid, and
> +     * we leave it as the best.
> +     * Otherwise, we need to do a full update (because the previous best
> +     * interrupt has reduced in priority and any other interrupt could
> +     * now be the new best one).
> +     */
> +    if (!seenbetter && cs->hppi.prio != 0xff && cs->hppi.irq < GIC_INTERNAL) {
> +        gicv3_full_update_noirqset(cs->gic);
> +    }
> +}
> +
> +/* Update the GIC status after state in a redistributor or
> + * CPU interface has changed, and inform the CPU i/f of
> + * its new highest priority pending interrupt.
> + */
> +void gicv3_redist_update(GICv3CPUState *cs)
> +{
> +    gicv3_redist_update_noirqset(cs);
> +    gicv3_cpuif_update(cs);
> +}
> +
> +/* Update the GIC status after state in the distributor has
> + * changed affecting @len interrupts starting at @start,
> + * but don't tell the CPU i/f.
> + */
> +static void gicv3_update_noirqset(GICv3State *s, int start, int len)
> +{
> +    int i;
> +    uint8_t prio;
> +    uint32_t pend = 0;
> +
> +    assert(start >= GIC_INTERNAL);
> +    assert(len > 0);
> +
> +    for (i = 0; i < s->num_cpu; i++) {
> +        s->cpu[i].seenbetter = false;
> +    }
> +
> +    /* Find the highest priority pending interrupt in this range. */
> +    for (i = start; i < start + len; i++) {
> +        GICv3CPUState *cs;
> +
> +        if (i == start || (i & 0x1f) == 0) {
> +            /* Calculate the next 32 bits worth of pending status */
> +            pend = gicd_int_pending(s, i & ~0x1f);
> +        }
> +
> +        if (!(pend & (1 << (i & 0x1f)))) {
> +            continue;
> +        }
> +        cs = s->gicd_irouter_target[i];
> +        if (!cs) {
> +            /* Interrupts targeting no implemented CPU should remain pending
> +             * and not be forwarded to any CPU.
> +             */
> +            continue;
> +        }
> +        prio = s->gicd_ipriority[i];
> +        if (irqbetter(cs, i, prio)) {
> +            cs->hppi.irq = i;
> +            cs->hppi.prio = prio;
> +            cs->seenbetter = true;
> +        }
> +    }
> +
> +    /* If the best interrupt we just found would preempt whatever
> +     * was the previous best interrupt before this update, then
> +     * we know it's definitely the best one now.
> +     * If we didn't find an interrupt that would preempt the previous
> +     * best, and the previous best is outside our range (or there was
> +     * no previous pending interrupt at all), then that
> +     * is still valid, and we leave it as the best.
> +     * Otherwise, we need to do a full update (because the previous best
> +     * interrupt has reduced in priority and any other interrupt could
> +     * now be the new best one).
> +     */
> +    for (i = 0; i < s->num_cpu; i++) {
> +        GICv3CPUState *cs = &s->cpu[i];
> +
> +        if (cs->seenbetter) {
> +            cs->hppi.grp = gicv3_irq_group(cs->gic, cs, cs->hppi.irq);
> +        }
> +
> +        if (!cs->seenbetter && cs->hppi.prio != 0xff &&
> +            cs->hppi.irq >= start && cs->hppi.irq < start + len) {
> +            gicv3_full_update_noirqset(s);
> +            break;
> +        }
> +    }
> +}
> +
> +void gicv3_update(GICv3State *s, int start, int len)
> +{
> +    int i;
> +
> +    gicv3_update_noirqset(s, start, len);
> +    for (i = 0; i < s->num_cpu; i++) {
> +        gicv3_cpuif_update(&s->cpu[i]);
> +    }
> +}
> +
> +void gicv3_full_update_noirqset(GICv3State *s)
> +{
> +    /* Completely recalculate the GIC status from scratch, but
> +     * don't update any outbound IRQ lines.
> +     */
> +    int i;
> +
> +    for (i = 0; i < s->num_cpu; i++) {
> +        s->cpu[i].hppi.prio = 0xff;
> +    }
> +
> +    /* Note that we can guarantee that these functions will not
> +     * recursively call back into gicv3_full_update(), because
> +     * at each point the "previous best" is always outside the
> +     * range we ask them to update.
> +     */
> +    gicv3_update_noirqset(s, GIC_INTERNAL, s->num_irq - GIC_INTERNAL);
> +
> +    for (i = 0; i < s->num_cpu; i++) {
> +        gicv3_redist_update_noirqset(&s->cpu[i]);
> +    }
> +}
> +
> +void gicv3_full_update(GICv3State *s)
> +{
> +    /* Completely recalculate the GIC status from scratch, including
> +     * updating outbound IRQ lines.
> +     */
> +    int i;
> +
> +    gicv3_full_update_noirqset(s);
> +    for (i = 0; i < s->num_cpu; i++) {
> +        gicv3_cpuif_update(&s->cpu[i]);
> +    }
> +}
> +
>  /* Process a change in an external IRQ input. */
>  static void gicv3_set_irq(void *opaque, int irq, int level)
>  {
> @@ -33,6 +314,16 @@ static void gicv3_set_irq(void *opaque, int irq, int level)
>      /* Do nothing for now */
>  }
>  
> +static void arm_gicv3_post_load(GICv3State *s)
> +{
> +    /* Recalculate our cached idea of the current highest priority
> +     * pending interrupt, but don't set IRQ or FIQ lines.
> +     */
> +    gicv3_full_update_noirqset(s);
> +    /* Repopulate the cache of GICv3CPUState pointers for target CPUs */
> +    gicv3_cache_all_target_cpustates(s);
> +}
> +
>  static void arm_gic_realize(DeviceState *dev, Error **errp)
>  {
>      /* Device instance realize function for the GIC sysbus device */
> @@ -52,8 +343,10 @@ static void arm_gic_realize(DeviceState *dev, Error **errp)
>  static void arm_gicv3_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> +    ARMGICv3CommonClass *agcc = ARM_GICV3_COMMON_CLASS(klass);
>      ARMGICv3Class *agc = ARM_GICV3_CLASS(klass);
>  
> +    agcc->post_load = arm_gicv3_post_load;
>      agc->parent_realize = dc->realize;
>      dc->realize = arm_gic_realize;
>  }
> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
> index d1714e4..0f8c4b8 100644
> --- a/hw/intc/arm_gicv3_common.c
> +++ b/hw/intc/arm_gicv3_common.c
> @@ -246,6 +246,8 @@ static void arm_gicv3_common_reset(DeviceState *dev)
>          cs->gicr_nsacr = 0;
>          memset(cs->gicr_ipriorityr, 0, sizeof(cs->gicr_ipriorityr));
>  
> +        cs->hppi.prio = 0xff;
> +
>          /* State in the CPU interface must *not* be reset here, because it
>           * is part of the CPU's reset domain, not the GIC device's.
>           */
> @@ -271,6 +273,13 @@ static void arm_gicv3_common_reset(DeviceState *dev)
>      memset(s->gicd_ipriority, 0, sizeof(s->gicd_ipriority));
>      memset(s->gicd_irouter, 0, sizeof(s->gicd_irouter));
>      memset(s->gicd_nsacr, 0, sizeof(s->gicd_nsacr));
> +    /* GICD_IROUTER are UNKNOWN at reset so in theory the guest must
> +     * write these to get sane behaviour and we need not populate the
> +     * pointer cache here; however having the cache be different for
> +     * "happened to be 0 from reset" and "guest wrote 0" would be
> +     * too confusing.
> +     */
> +    gicv3_cache_all_target_cpustates(s);
>  
>      if (s->irq_reset_nonsecure) {
>          /* If we're resetting a TZ-aware GIC as if secure firmware
> diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
> index 97c9d75..35c3c11 100644
> --- a/hw/intc/gicv3_internal.h
> +++ b/hw/intc/gicv3_internal.h
> @@ -159,6 +159,63 @@
>  #define ICC_CTLR_EL3_A3V (1U << 15)
>  #define ICC_CTLR_EL3_NDS (1U << 17)
>  
> +/* Functions internal to the emulated GICv3 */
> +
> +/**
> + * gicv3_redist_update:
> + * @cs: GICv3CPUState for this redistributor
> + *
> + * Recalculate the highest priority pending interrupt after a
> + * change to redistributor state, and inform the CPU accordingly.
> + */
> +void gicv3_redist_update(GICv3CPUState *cs);
> +
> +/**
> + * gicv3_update:
> + * @s: GICv3State
> + * @start: first interrupt whose state changed
> + * @len: length of the range of interrupts whose state changed
> + *
> + * Recalculate the highest priority pending interrupts after a
> + * change to the distributor state affecting @len interrupts
> + * starting at @start, and inform the CPUs accordingly.
> + */
> +void gicv3_update(GICv3State *s, int start, int len);
> +
> +/**
> + * gicv3_full_update_noirqset:
> + * @s: GICv3State
> + *
> + * Recalculate the cached information about highest priority
> + * pending interrupts, but don't inform the CPUs. This should be
> + * called after an incoming migration has loaded new state.
> + */
> +void gicv3_full_update_noirqset(GICv3State *s);
> +
> +/**
> + * gicv3_full_update:
> + * @s: GICv3State
> + *
> + * Recalculate the highest priority pending interrupts after
> + * a change that could affect the status of all interrupts,
> + * and inform the CPUs accordingly.
> + */
> +void gicv3_full_update(GICv3State *s);
> +
> +/**
> + * gicv3_cpuif_update:
> + * @cs: GICv3CPUState for the CPU to update
> + *
> + * Recalculate whether to assert the IRQ or FIQ lines after a change
> + * to the current highest priority pending interrupt, the CPU's
> + * current running priority or the CPU's current exception level or
> + * security state.
> + */
> +static inline void gicv3_cpuif_update(GICv3CPUState *cs)
> +{
> +    /* This will be implemented in a later commit. */
> +}
> +
>  static inline uint32_t gicv3_iidr(void)
>  {
>      /* Return the Implementer Identification Register value
> @@ -184,6 +241,32 @@ static inline uint32_t gicv3_idreg(int regoffset)
>  }
>  
>  /**
> + * gicv3_irq_group:
> + *
> + * Return the group which this interrupt is configured as (GICV3_G0,
> + * GICV3_G1 or GICV3_G1NS).
> + */
> +static inline int gicv3_irq_group(GICv3State *s, GICv3CPUState *cs, int irq)
> +{
> +    bool grpbit, grpmodbit;
> +
> +    if (irq < GIC_INTERNAL) {
> +        grpbit = extract32(cs->gicr_igroupr0, irq, 1);
> +        grpmodbit = extract32(cs->gicr_igrpmodr0, irq, 1);
> +    } else {
> +        grpbit = gicv3_gicd_group_test(s, irq);
> +        grpmodbit = gicv3_gicd_grpmod_test(s, irq);
> +    }
> +    if (grpbit) {
> +        return GICV3_G1NS;
> +    }
> +    if (s->gicd_ctlr & GICD_CTLR_DS) {
> +        return GICV3_G0;
> +    }
> +    return grpmodbit ? GICV3_G1 : GICV3_G0;
Maybe it could be written like below:
    if (s->gicd_ctlr & GICD_CTLR_DS || !grpmodbit) {
        return GICV3_G0;
    }
    return GICV3_G1;

> +}
> +
> +/**
>   * gicv3_redist_affid:
>   *
>   * Return the 32-bit affinity ID of the CPU connected to this redistributor
> @@ -193,4 +276,42 @@ static inline uint32_t gicv3_redist_affid(GICv3CPUState *cs)
>      return cs->gicr_typer >> 32;
>  }
>  
> +/**
> + * gicv3_cache_target_cpustate:
> + *
> + * Update the cached CPU state corresponding to the target for this interrupt
> + * (which is kept in s->gicd_irouter_target[]).
> + */
> +static inline void gicv3_cache_target_cpustate(GICv3State *s, int irq)
> +{
> +    GICv3CPUState *cs = NULL;
> +    int i;
> +    uint32_t tgtaff = extract64(s->gicd_irouter[irq], 0, 24) |
> +        extract64(s->gicd_irouter[irq], 32, 8);
This should be extract64(s->gicd_irouter[irq], 32, 8) << 24

> +
> +    for (i = 0; i < s->num_cpu; i++) {
> +        if (s->cpu[i].gicr_typer >> 32 == tgtaff) {
> +            cs = &s->cpu[i];
> +            break;
> +        }
> +    }
> +
> +    s->gicd_irouter_target[irq] = cs;
> +}
> +
> +/**
> + * gicv3_cache_all_target_cpustates:
> + *
> + * Populate the entire cache of CPU state pointers for interrupt targets
> + * (eg after inbound migration or CPU reset)
> + */
> +static inline void gicv3_cache_all_target_cpustates(GICv3State *s)
> +{
> +    int irq;
> +
> +    for (irq = GIC_INTERNAL; irq < GICV3_MAXIRQ; irq++) {
> +        gicv3_cache_target_cpustate(s, irq);
> +    }
> +}
> +
>  #endif /* !QEMU_ARM_GIC_INTERNAL_H */
> diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
> index f01b616..3ca0c9c 100644
> --- a/include/hw/intc/arm_gicv3_common.h
> +++ b/include/hw/intc/arm_gicv3_common.h
> @@ -132,6 +132,12 @@ typedef struct GICv3CPUState GICv3CPUState;
>  #define GICV3_S 0
>  #define GICV3_NS 1
>  
> +typedef struct {
> +    int irq;
> +    uint8_t prio;
> +    int grp;
> +} PendingIrq;
> +
>  struct GICv3CPUState {
>      GICv3State *gic;
>      CPUState *cpu;
> @@ -164,6 +170,14 @@ struct GICv3CPUState {
>      uint64_t icc_apr[3][4];
>      uint64_t icc_igrpen[3];
>      uint64_t icc_ctlr_el3;
> +
> +    /* Current highest priority pending interrupt for this CPU.
> +     * This is cached information that can be recalculated from the
> +     * real state above; it doesn't need to be migrated.
> +     */
> +    PendingIrq hppi;
> +    /* This is temporary working state, to avoid a malloc in gicv3_update() */
> +    bool seenbetter;
>  };
>  
>  struct GICv3State {
> @@ -199,6 +213,10 @@ struct GICv3State {
>      GIC_DECLARE_BITMAP(edge_trigger); /* GICD_ICFGR even bits */
>      uint8_t gicd_ipriority[GICV3_MAXIRQ];
>      uint64_t gicd_irouter[GICV3_MAXIRQ];
> +    /* Cached information: pointer to the cpu i/f for the CPUs specified
> +     * in the IROUTER registers
> +     */
> +    GICv3CPUState *gicd_irouter_target[GICV3_MAXIRQ];
>      uint32_t gicd_nsacr[DIV_ROUND_UP(GICV3_MAXIRQ, 16)];
>  
>      GICv3CPUState *cpu;
> 

-- 
Shannon

