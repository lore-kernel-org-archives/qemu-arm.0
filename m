Received: by 10.25.77.65 with SMTP id a62csp452347lfb;
        Wed, 1 Feb 2017 08:50:53 -0800 (PST)
X-Received: by 10.55.102.148 with SMTP id a142mr4029828qkc.33.1485967853663;
        Wed, 01 Feb 2017 08:50:53 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r3si14827094qkb.62.2017.02.01.08.50.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 Feb 2017 08:50:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51963 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cYy7R-0004kt-5Z
	for alex.bennee@linaro.org; Wed, 01 Feb 2017 11:50:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35367)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cYy7L-0004km-P7
	for qemu-arm@nongnu.org; Wed, 01 Feb 2017 11:50:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cYy7I-0000Tl-F4
	for qemu-arm@nongnu.org; Wed, 01 Feb 2017 11:50:47 -0500
Received: from mx1.redhat.com ([209.132.183.28]:3305)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1cYy7I-0000TW-5C; Wed, 01 Feb 2017 11:50:44 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B4C968046D;
	Wed,  1 Feb 2017 16:50:43 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-36.ams2.redhat.com
	[10.36.116.36])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v11GocqJ031041
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 1 Feb 2017 11:50:40 -0500
To: vijay.kilari@gmail.com, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	christoffer.dall@linaro.org
References: <1485879782-6075-1-git-send-email-vijay.kilari@gmail.com>
	<1485879782-6075-4-git-send-email-vijay.kilari@gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <152dee48-e46a-80d5-5cd8-d08a84849ca6@redhat.com>
Date: Wed, 1 Feb 2017 17:50:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1485879782-6075-4-git-send-email-vijay.kilari@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 01 Feb 2017 16:50:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v7 RESEND 3/5] hw/intc/arm_gicv3_kvm:
 Implement get/put functions
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
Cc: marc.zyngier@arm.com, p.fedin@samsung.com, qemu-devel@nongnu.org,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bBed8tEFqKNj

Hi Vijay,

On 31/01/2017 17:23, vijay.kilari@gmail.com wrote:
> From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
> 
> This actually implements pre_save and post_load methods for in-kernel
> vGICv3.
> 
> Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> [PMM:
>  * use decimal, not 0bnnn
>  * fixed typo in names of ICC_APR0R_EL1 and ICC_AP1R_EL1
>  * completely rearranged the get and put functions to read and write
>    the state in a natural order, rather than mixing distributor and
>    redistributor state together]
> Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
> [Vijay:
>  * Update macro KVM_VGIC_ATTR
>  * Use 32 bit access for gicd and gicr
>  * GICD_IROUTER, GICD_TYPER, GICR_PROPBASER and GICR_PENDBASER reg
>    access  are changed from 64-bit to 32-bit access
>  * Add ICC_SRE_EL1 save and restore
>  * Dropped translate_fn mechanism and coded functions to handle
>    save and restore of edge_trigger and priority
>  * Number of APnR register saved/restored based on number of
>    priority bits supported]
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

there is a conflict to be resolved due to:

fe44dc9  migration: disallow migrate_add_blocker during migration

Thanks

Eric
> ---
> ---
>  hw/intc/arm_gicv3_kvm.c  | 563 ++++++++++++++++++++++++++++++++++++++++++++++-
>  hw/intc/gicv3_internal.h |   1 +
>  2 files changed, 553 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
> index 199a439..77af32d 100644
> --- a/hw/intc/arm_gicv3_kvm.c
> +++ b/hw/intc/arm_gicv3_kvm.c
> @@ -23,8 +23,10 @@
>  #include "qapi/error.h"
>  #include "hw/intc/arm_gicv3_common.h"
>  #include "hw/sysbus.h"
> +#include "qemu/error-report.h"
>  #include "sysemu/kvm.h"
>  #include "kvm_arm.h"
> +#include "gicv3_internal.h"
>  #include "vgic_common.h"
>  #include "migration/migration.h"
>  
> @@ -44,6 +46,32 @@
>  #define KVM_ARM_GICV3_GET_CLASS(obj) \
>       OBJECT_GET_CLASS(KVMARMGICv3Class, (obj), TYPE_KVM_ARM_GICV3)
>  
> +#define   KVM_DEV_ARM_VGIC_SYSREG(op0, op1, crn, crm, op2)         \
> +                             (ARM64_SYS_REG_SHIFT_MASK(op0, OP0) | \
> +                              ARM64_SYS_REG_SHIFT_MASK(op1, OP1) | \
> +                              ARM64_SYS_REG_SHIFT_MASK(crn, CRN) | \
> +                              ARM64_SYS_REG_SHIFT_MASK(crm, CRM) | \
> +                              ARM64_SYS_REG_SHIFT_MASK(op2, OP2))
> +
> +#define ICC_PMR_EL1     \
> +    KVM_DEV_ARM_VGIC_SYSREG(3, 0, 4, 6, 0)
> +#define ICC_BPR0_EL1    \
> +    KVM_DEV_ARM_VGIC_SYSREG(3, 0, 12, 8, 3)
> +#define ICC_AP0R_EL1(n) \
> +    KVM_DEV_ARM_VGIC_SYSREG(3, 0, 12, 8, 4 | n)
> +#define ICC_AP1R_EL1(n) \
> +    KVM_DEV_ARM_VGIC_SYSREG(3, 0, 12, 9, n)
> +#define ICC_BPR1_EL1    \
> +    KVM_DEV_ARM_VGIC_SYSREG(3, 0, 12, 12, 3)
> +#define ICC_CTLR_EL1    \
> +    KVM_DEV_ARM_VGIC_SYSREG(3, 0, 12, 12, 4)
> +#define ICC_SRE_EL1 \
> +    KVM_DEV_ARM_VGIC_SYSREG(3, 0, 12, 12, 5)
> +#define ICC_IGRPEN0_EL1 \
> +    KVM_DEV_ARM_VGIC_SYSREG(3, 0, 12, 12, 6)
> +#define ICC_IGRPEN1_EL1 \
> +    KVM_DEV_ARM_VGIC_SYSREG(3, 0, 12, 12, 7)
> +
>  typedef struct KVMARMGICv3Class {
>      ARMGICv3CommonClass parent_class;
>      DeviceRealize parent_realize;
> @@ -57,16 +85,523 @@ static void kvm_arm_gicv3_set_irq(void *opaque, int irq, int level)
>      kvm_arm_gic_set_irq(s->num_irq, irq, level);
>  }
>  
> +#define KVM_VGIC_ATTR(reg, typer) \
> +    ((typer & KVM_DEV_ARM_VGIC_V3_MPIDR_MASK) | (reg))
> +
> +static inline void kvm_gicd_access(GICv3State *s, int offset,
> +                                   uint32_t *val, bool write)
> +{
> +    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_DIST_REGS,
> +                      KVM_VGIC_ATTR(offset, 0),
> +                      val, write);
> +}
> +
> +static inline void kvm_gicr_access(GICv3State *s, int offset, int cpu,
> +                                   uint32_t *val, bool write)
> +{
> +    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_REDIST_REGS,
> +                      KVM_VGIC_ATTR(offset, s->cpu[cpu].gicr_typer),
> +                      val, write);
> +}
> +
> +static inline void kvm_gicc_access(GICv3State *s, uint64_t reg, int cpu,
> +                                   uint64_t *val, bool write)
> +{
> +    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS,
> +                      KVM_VGIC_ATTR(reg, s->cpu[cpu].gicr_typer),
> +                      val, write);
> +}
> +
> +static inline void kvm_gic_line_level_access(GICv3State *s, int irq, int cpu,
> +                                             uint32_t *val, bool write)
> +{
> +    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_LEVEL_INFO,
> +                      KVM_VGIC_ATTR(irq, s->cpu[cpu].gicr_typer) |
> +                      (VGIC_LEVEL_INFO_LINE_LEVEL <<
> +                       KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_SHIFT),
> +                      val, write);
> +}
> +
> +/* Loop through each distributor IRQ related register; since bits
> + * corresponding to SPIs and PPIs are RAZ/WI when affinity routing
> + * is enabled, we skip those.
> + */
> +#define for_each_dist_irq_reg(_irq, _max, _field_width) \
> +    for (_irq = GIC_INTERNAL; _irq < _max; _irq += (32 / _field_width))
> +
> +static void kvm_dist_get_priority(GICv3State *s, uint32_t offset, uint8_t *bmp)
> +{
> +    uint32_t reg, *field;
> +    int irq;
> +
> +    field = (uint32_t *)bmp;
> +    for_each_dist_irq_reg(irq, s->num_irq, 8) {
> +        kvm_gicd_access(s, offset, &reg, false);
> +        *field = reg;
> +        offset += 4;
> +        field++;
> +    }
> +}
> +
> +static void kvm_dist_put_priority(GICv3State *s, uint32_t offset, uint8_t *bmp)
> +{
> +    uint32_t reg, *field;
> +    int irq;
> +
> +    field = (uint32_t *)bmp;
> +    for_each_dist_irq_reg(irq, s->num_irq, 8) {
> +        reg = *field;
> +        kvm_gicd_access(s, offset, &reg, true);
> +        offset += 4;
> +        field++;
> +    }
> +}
> +
> +static void kvm_dist_get_edge_trigger(GICv3State *s, uint32_t offset,
> +                                      uint32_t *bmp)
> +{
> +    uint32_t reg;
> +    int irq;
> +
> +    for_each_dist_irq_reg(irq, s->num_irq, 2) {
> +        kvm_gicd_access(s, offset, &reg, false);
> +        reg = half_unshuffle32(reg >> 1);
> +        if (irq % 32 != 0) {
> +            reg = (reg << 16);
> +        }
> +        *gic_bmp_ptr32(bmp, irq) |=  reg;
> +        offset += 4;
> +    }
> +}
> +
> +static void kvm_dist_put_edge_trigger(GICv3State *s, uint32_t offset,
> +                                      uint32_t *bmp)
> +{
> +    uint32_t reg;
> +    int irq;
> +
> +    for_each_dist_irq_reg(irq, s->num_irq, 2) {
> +        reg = *gic_bmp_ptr32(bmp, irq);
> +        if (irq % 32 != 0) {
> +            reg = (reg & 0xffff0000) >> 16;
> +        } else {
> +            reg = reg & 0xffff;
> +        }
> +        reg = half_shuffle32(reg) << 1;
> +        kvm_gicd_access(s, offset, &reg, true);
> +        offset += 4;
> +    }
> +}
> +
> +static void kvm_gic_get_line_level_bmp(GICv3State *s, uint32_t *bmp)
> +{
> +    uint32_t reg;
> +    int irq;
> +
> +    for_each_dist_irq_reg(irq, s->num_irq, 1) {
> +        kvm_gic_line_level_access(s, irq, 0, &reg, false);
> +        *gic_bmp_ptr32(bmp, irq) = reg;
> +    }
> +}
> +
> +static void kvm_gic_put_line_level_bmp(GICv3State *s, uint32_t *bmp)
> +{
> +    uint32_t reg;
> +    int irq;
> +
> +    for_each_dist_irq_reg(irq, s->num_irq, 1) {
> +        reg = *gic_bmp_ptr32(bmp, irq);
> +        kvm_gic_line_level_access(s, irq, 0, &reg, true);
> +    }
> +}
> +
> +/* Read a bitmap register group from the kernel VGIC. */
> +static void kvm_dist_getbmp(GICv3State *s, uint32_t offset, uint32_t *bmp)
> +{
> +    uint32_t reg;
> +    int irq;
> +
> +    for_each_dist_irq_reg(irq, s->num_irq, 1) {
> +        kvm_gicd_access(s, offset, &reg, false);
> +        *gic_bmp_ptr32(bmp, irq) = reg;
> +        offset += 4;
> +    }
> +}
> +
> +static void kvm_dist_putbmp(GICv3State *s, uint32_t offset,
> +                            uint32_t clroffset, uint32_t *bmp)
> +{
> +    uint32_t reg;
> +    int irq;
> +
> +    for_each_dist_irq_reg(irq, s->num_irq, 1) {
> +        /* If this bitmap is a set/clear register pair, first write to the
> +         * clear-reg to clear all bits before using the set-reg to write
> +         * the 1 bits.
> +         */
> +        if (clroffset != 0) {
> +            reg = 0;
> +            kvm_gicd_access(s, clroffset, &reg, true);
> +        }
> +        reg = *gic_bmp_ptr32(bmp, irq);
> +        kvm_gicd_access(s, offset, &reg, true);
> +        offset += 4;
> +    }
> +}
> +
> +static void kvm_arm_gicv3_check(GICv3State *s)
> +{
> +    uint32_t reg;
> +    uint32_t num_irq;
> +
> +    /* Sanity checking s->num_irq */
> +    kvm_gicd_access(s, GICD_TYPER, &reg, false);
> +    num_irq = ((reg & 0x1f) + 1) * 32;
> +
> +    if (num_irq < s->num_irq) {
> +        error_report("Model requests %u IRQs, but kernel supports max %u",
> +                     s->num_irq, num_irq);
> +        abort();
> +    }
> +}
> +
>  static void kvm_arm_gicv3_put(GICv3State *s)
>  {
> -    /* TODO */
> -    DPRINTF("Cannot put kernel gic state, no kernel interface\n");
> +    uint32_t regl, regh, reg;
> +    uint64_t reg64, redist_typer;
> +    int ncpu, i;
> +
> +    kvm_arm_gicv3_check(s);
> +
> +    kvm_gicr_access(s, GICR_TYPER, 0, &regl, false);
> +    kvm_gicr_access(s, GICR_TYPER + 4, 0, &regh, false);
> +    redist_typer = ((uint64_t)regh << 32) | regl;
> +
> +    reg = s->gicd_ctlr;
> +    kvm_gicd_access(s, GICD_CTLR, &reg, true);
> +
> +    if (redist_typer & GICR_TYPER_PLPIS) {
> +        /* Set base addresses before LPIs are enabled by GICR_CTLR write */
> +        for (ncpu = 0; ncpu < s->num_cpu; ncpu++) {
> +            GICv3CPUState *c = &s->cpu[ncpu];
> +
> +            reg64 = c->gicr_propbaser;
> +            regl = (uint32_t)reg64;
> +            kvm_gicr_access(s, GICR_PROPBASER, ncpu, &regl, true);
> +            regh = (uint32_t)(reg64 >> 32);
> +            kvm_gicr_access(s, GICR_PROPBASER + 4, ncpu, &regh, true);
> +
> +            reg64 = c->gicr_pendbaser;
> +            if (!c->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) {
> +                /* Setting PTZ is advised if LPIs are disabled, to reduce
> +                 * GIC initialization time.
> +                 */
> +                reg64 |= GICR_PENDBASER_PTZ;
> +            }
> +            regl = (uint32_t)reg64;
> +            kvm_gicr_access(s, GICR_PENDBASER, ncpu, &regl, true);
> +            regh = (uint32_t)(reg64 >> 32);
> +            kvm_gicr_access(s, GICR_PENDBASER + 4, ncpu, &regh, true);
> +        }
> +    }
> +
> +    /* Redistributor state (one per CPU) */
> +
> +    for (ncpu = 0; ncpu < s->num_cpu; ncpu++) {
> +        GICv3CPUState *c = &s->cpu[ncpu];
> +
> +        reg = c->gicr_ctlr;
> +        kvm_gicr_access(s, GICR_CTLR, ncpu, &reg, true);
> +
> +        reg = c->gicr_statusr[GICV3_NS];
> +        kvm_gicr_access(s, GICR_STATUSR, ncpu, &reg, true);
> +
> +        reg = c->gicr_waker;
> +        kvm_gicr_access(s, GICR_WAKER, ncpu, &reg, true);
> +
> +        reg = c->gicr_igroupr0;
> +        kvm_gicr_access(s, GICR_IGROUPR0, ncpu, &reg, true);
> +
> +        reg = ~0;
> +        kvm_gicr_access(s, GICR_ICENABLER0, ncpu, &reg, true);
> +        reg = c->gicr_ienabler0;
> +        kvm_gicr_access(s, GICR_ISENABLER0, ncpu, &reg, true);
> +
> +        /* Restore config before pending so we treat level/edge correctly */
> +        reg = half_shuffle32(c->edge_trigger >> 16) << 1;
> +        kvm_gicr_access(s, GICR_ICFGR1, ncpu, &reg, true);
> +
> +        reg = c->level;
> +        kvm_gic_line_level_access(s, 0, ncpu, &reg, true);
> +
> +        reg = ~0;
> +        kvm_gicr_access(s, GICR_ICPENDR0, ncpu, &reg, true);
> +        reg = c->gicr_ipendr0;
> +        kvm_gicr_access(s, GICR_ISPENDR0, ncpu, &reg, true);
> +
> +        reg = ~0;
> +        kvm_gicr_access(s, GICR_ICACTIVER0, ncpu, &reg, true);
> +        reg = c->gicr_iactiver0;
> +        kvm_gicr_access(s, GICR_ISACTIVER0, ncpu, &reg, true);
> +
> +        for (i = 0; i < GIC_INTERNAL; i += 4) {
> +            reg = c->gicr_ipriorityr[i] |
> +                (c->gicr_ipriorityr[i + 1] << 8) |
> +                (c->gicr_ipriorityr[i + 2] << 16) |
> +                (c->gicr_ipriorityr[i + 3] << 24);
> +            kvm_gicr_access(s, GICR_IPRIORITYR + i, ncpu, &reg, true);
> +        }
> +    }
> +
> +    /* Distributor state (shared between all CPUs */
> +    reg = s->gicd_statusr[GICV3_NS];
> +    kvm_gicd_access(s, GICD_STATUSR, &reg, true);
> +
> +    /* s->enable bitmap -> GICD_ISENABLERn */
> +    kvm_dist_putbmp(s, GICD_ISENABLER, GICD_ICENABLER, s->enabled);
> +
> +    /* s->group bitmap -> GICD_IGROUPRn */
> +    kvm_dist_putbmp(s, GICD_IGROUPR, 0, s->group);
> +
> +    /* Restore targets before pending to ensure the pending state is set on
> +     * the appropriate CPU interfaces in the kernel
> +     */
> +
> +    /* s->gicd_irouter[irq] -> GICD_IROUTERn
> +     * We can't use kvm_dist_put() here because the registers are 64-bit
> +     */
> +    for (i = GIC_INTERNAL; i < s->num_irq; i++) {
> +        uint32_t offset;
> +
> +        offset = GICD_IROUTER + (sizeof(uint32_t) * i);
> +        reg = (uint32_t)s->gicd_irouter[i];
> +        kvm_gicd_access(s, offset, &reg, true);
> +
> +        offset = GICD_IROUTER + (sizeof(uint32_t) * i) + 4;
> +        reg = (uint32_t)(s->gicd_irouter[i] >> 32);
> +        kvm_gicd_access(s, offset, &reg, true);
> +    }
> +
> +    /* s->trigger bitmap -> GICD_ICFGRn
> +     * (restore configuration registers before pending IRQs so we treat
> +     * level/edge correctly)
> +     */
> +    kvm_dist_put_edge_trigger(s, GICD_ICFGR, s->edge_trigger);
> +
> +    /* s->level bitmap ->  line_level */
> +    kvm_gic_put_line_level_bmp(s, s->level);
> +
> +    /* s->pending bitmap -> GICD_ISPENDRn */
> +    kvm_dist_putbmp(s, GICD_ISPENDR, GICD_ICPENDR, s->pending);
> +
> +    /* s->active bitmap -> GICD_ISACTIVERn */
> +    kvm_dist_putbmp(s, GICD_ISACTIVER, GICD_ICACTIVER, s->active);
> +
> +    /* s->gicd_ipriority[] -> GICD_IPRIORITYRn */
> +    kvm_dist_put_priority(s, GICD_IPRIORITYR, s->gicd_ipriority);
> +
> +    /* CPU Interface state (one per CPU) */
> +
> +    for (ncpu = 0; ncpu < s->num_cpu; ncpu++) {
> +        GICv3CPUState *c = &s->cpu[ncpu];
> +        int num_pri_bits;
> +
> +        kvm_gicc_access(s, ICC_SRE_EL1, ncpu, &c->icc_sre_el1, true);
> +        kvm_gicc_access(s, ICC_CTLR_EL1, ncpu,
> +                        &c->icc_ctlr_el1[GICV3_NS], true);
> +        kvm_gicc_access(s, ICC_IGRPEN0_EL1, ncpu,
> +                        &c->icc_igrpen[GICV3_G0], true);
> +        kvm_gicc_access(s, ICC_IGRPEN1_EL1, ncpu,
> +                        &c->icc_igrpen[GICV3_G1NS], true);
> +        kvm_gicc_access(s, ICC_PMR_EL1, ncpu, &c->icc_pmr_el1, true);
> +        kvm_gicc_access(s, ICC_BPR0_EL1, ncpu, &c->icc_bpr[GICV3_G0], true);
> +        kvm_gicc_access(s, ICC_BPR1_EL1, ncpu, &c->icc_bpr[GICV3_G1NS], true);
> +
> +        num_pri_bits = ((c->icc_ctlr_el1[GICV3_NS] &
> +                        ICC_CTLR_EL1_PRIBITS_MASK) >>
> +                        ICC_CTLR_EL1_PRIBITS_SHIFT) + 1;
> +
> +        switch (num_pri_bits) {
> +        case 7:
> +            reg64 = c->icc_apr[GICV3_G0][3];
> +            kvm_gicc_access(s, ICC_AP0R_EL1(3), ncpu, &reg64, true);
> +            reg64 = c->icc_apr[GICV3_G0][2];
> +            kvm_gicc_access(s, ICC_AP0R_EL1(2), ncpu, &reg64, true);
> +        case 6:
> +            reg64 = c->icc_apr[GICV3_G0][1];
> +            kvm_gicc_access(s, ICC_AP0R_EL1(1), ncpu, &reg64, true);
> +        default:
> +            reg64 = c->icc_apr[GICV3_G0][0];
> +            kvm_gicc_access(s, ICC_AP0R_EL1(0), ncpu, &reg64, true);
> +        }
> +
> +        switch (num_pri_bits) {
> +        case 7:
> +            reg64 = c->icc_apr[GICV3_G1NS][3];
> +            kvm_gicc_access(s, ICC_AP1R_EL1(3), ncpu, &reg64, true);
> +            reg64 = c->icc_apr[GICV3_G1NS][2];
> +            kvm_gicc_access(s, ICC_AP1R_EL1(2), ncpu, &reg64, true);
> +        case 6:
> +            reg64 = c->icc_apr[GICV3_G1NS][1];
> +            kvm_gicc_access(s, ICC_AP1R_EL1(1), ncpu, &reg64, true);
> +        default:
> +            reg64 = c->icc_apr[GICV3_G1NS][0];
> +            kvm_gicc_access(s, ICC_AP1R_EL1(0), ncpu, &reg64, true);
> +        }
> +    }
>  }
>  
>  static void kvm_arm_gicv3_get(GICv3State *s)
>  {
> -    /* TODO */
> -    DPRINTF("Cannot get kernel gic state, no kernel interface\n");
> +    uint32_t regl, regh, reg;
> +    uint64_t reg64, redist_typer;
> +    int ncpu, i;
> +
> +    kvm_arm_gicv3_check(s);
> +
> +    kvm_gicr_access(s, GICR_TYPER, 0, &regl, false);
> +    kvm_gicr_access(s, GICR_TYPER + 4, 0, &regh, false);
> +    redist_typer = ((uint64_t)regh << 32) | regl;
> +
> +    kvm_gicd_access(s, GICD_CTLR, &reg, false);
> +    s->gicd_ctlr = reg;
> +
> +    /* Redistributor state (one per CPU) */
> +
> +    for (ncpu = 0; ncpu < s->num_cpu; ncpu++) {
> +        GICv3CPUState *c = &s->cpu[ncpu];
> +
> +        kvm_gicr_access(s, GICR_CTLR, ncpu, &reg, false);
> +        c->gicr_ctlr = reg;
> +
> +        kvm_gicr_access(s, GICR_STATUSR, ncpu, &reg, false);
> +        c->gicr_statusr[GICV3_NS] = reg;
> +
> +        kvm_gicr_access(s, GICR_WAKER, ncpu, &reg, false);
> +        c->gicr_waker = reg;
> +
> +        kvm_gicr_access(s, GICR_IGROUPR0, ncpu, &reg, false);
> +        c->gicr_igroupr0 = reg;
> +        kvm_gicr_access(s, GICR_ISENABLER0, ncpu, &reg, false);
> +        c->gicr_ienabler0 = reg;
> +        kvm_gicr_access(s, GICR_ICFGR1, ncpu, &reg, false);
> +        c->edge_trigger = half_unshuffle32(reg >> 1) << 16;
> +        kvm_gic_line_level_access(s, 0, ncpu, &reg, false);
> +        c->level = reg;
> +        kvm_gicr_access(s, GICR_ISPENDR0, ncpu, &reg, false);
> +        c->gicr_ipendr0 = reg;
> +        kvm_gicr_access(s, GICR_ISACTIVER0, ncpu, &reg, false);
> +        c->gicr_iactiver0 = reg;
> +
> +        for (i = 0; i < GIC_INTERNAL; i += 4) {
> +            kvm_gicr_access(s, GICR_IPRIORITYR + i, ncpu, &reg, false);
> +            c->gicr_ipriorityr[i] = extract32(reg, 0, 8);
> +            c->gicr_ipriorityr[i + 1] = extract32(reg, 8, 8);
> +            c->gicr_ipriorityr[i + 2] = extract32(reg, 16, 8);
> +            c->gicr_ipriorityr[i + 3] = extract32(reg, 24, 8);
> +        }
> +    }
> +
> +    if (redist_typer & GICR_TYPER_PLPIS) {
> +        for (ncpu = 0; ncpu < s->num_cpu; ncpu++) {
> +            GICv3CPUState *c = &s->cpu[ncpu];
> +
> +            kvm_gicr_access(s, GICR_PROPBASER, ncpu, &regl, false);
> +            kvm_gicr_access(s, GICR_PROPBASER + 4, ncpu, &regh, false);
> +            c->gicr_propbaser = ((uint64_t)regh << 32) | regl;
> +
> +            kvm_gicr_access(s, GICR_PENDBASER, ncpu, &regl, false);
> +            kvm_gicr_access(s, GICR_PENDBASER + 4, ncpu, &regh, false);
> +            c->gicr_pendbaser = ((uint64_t)regh << 32) | regl;
> +        }
> +    }
> +
> +    /* Distributor state (shared between all CPUs */
> +
> +    kvm_gicd_access(s, GICD_STATUSR, &reg, false);
> +    s->gicd_statusr[GICV3_NS] = reg;
> +
> +    /* GICD_IGROUPRn -> s->group bitmap */
> +    kvm_dist_getbmp(s, GICD_IGROUPR, s->group);
> +
> +    /* GICD_ISENABLERn -> s->enabled bitmap */
> +    kvm_dist_getbmp(s, GICD_ISENABLER, s->enabled);
> +
> +    /* Line level of irq */
> +    kvm_gic_get_line_level_bmp(s, s->level);
> +    /* GICD_ISPENDRn -> s->pending bitmap */
> +    kvm_dist_getbmp(s, GICD_ISPENDR, s->pending);
> +
> +    /* GICD_ISACTIVERn -> s->active bitmap */
> +    kvm_dist_getbmp(s, GICD_ISACTIVER, s->active);
> +
> +    /* GICD_ICFGRn -> s->trigger bitmap */
> +    kvm_dist_get_edge_trigger(s, GICD_ICFGR, s->edge_trigger);
> +
> +    /* GICD_IPRIORITYRn -> s->gicd_ipriority[] */
> +    kvm_dist_get_priority(s, GICD_IPRIORITYR, s->gicd_ipriority);
> +
> +    /* GICD_IROUTERn -> s->gicd_irouter[irq] */
> +    for (i = GIC_INTERNAL; i < s->num_irq; i++) {
> +        uint32_t offset;
> +
> +        offset = GICD_IROUTER + (sizeof(uint32_t) * i);
> +        kvm_gicd_access(s, offset, &regl, false);
> +        offset = GICD_IROUTER + (sizeof(uint32_t) * i) + 4;
> +        kvm_gicd_access(s, offset, &regh, false);
> +        s->gicd_irouter[i] = ((uint64_t)regh << 32) | regl;
> +    }
> +
> +    /*****************************************************************
> +     * CPU Interface(s) State
> +     */
> +
> +    for (ncpu = 0; ncpu < s->num_cpu; ncpu++) {
> +        GICv3CPUState *c = &s->cpu[ncpu];
> +        int num_pri_bits;
> +
> +        kvm_gicc_access(s, ICC_SRE_EL1, ncpu, &c->icc_sre_el1, false);
> +        kvm_gicc_access(s, ICC_CTLR_EL1, ncpu,
> +                        &c->icc_ctlr_el1[GICV3_NS], false);
> +        kvm_gicc_access(s, ICC_IGRPEN0_EL1, ncpu,
> +                        &c->icc_igrpen[GICV3_G0], false);
> +        kvm_gicc_access(s, ICC_IGRPEN1_EL1, ncpu,
> +                        &c->icc_igrpen[GICV3_G1NS], false);
> +        kvm_gicc_access(s, ICC_PMR_EL1, ncpu, &c->icc_pmr_el1, false);
> +        kvm_gicc_access(s, ICC_BPR0_EL1, ncpu, &c->icc_bpr[GICV3_G0], false);
> +        kvm_gicc_access(s, ICC_BPR1_EL1, ncpu, &c->icc_bpr[GICV3_G1NS], false);
> +        num_pri_bits = ((c->icc_ctlr_el1[GICV3_NS] &
> +                        ICC_CTLR_EL1_PRIBITS_MASK) >>
> +                        ICC_CTLR_EL1_PRIBITS_SHIFT) + 1;
> +
> +        switch (num_pri_bits) {
> +        case 7:
> +            kvm_gicc_access(s, ICC_AP0R_EL1(3), ncpu, &reg64, false);
> +            c->icc_apr[GICV3_G0][3] = reg64;
> +            kvm_gicc_access(s, ICC_AP0R_EL1(2), ncpu, &reg64, false);
> +            c->icc_apr[GICV3_G0][2] = reg64;
> +        case 6:
> +            kvm_gicc_access(s, ICC_AP0R_EL1(1), ncpu, &reg64, false);
> +            c->icc_apr[GICV3_G0][1] = reg64;
> +        default:
> +            kvm_gicc_access(s, ICC_AP0R_EL1(0), ncpu, &reg64, false);
> +            c->icc_apr[GICV3_G0][0] = reg64;
> +        }
> +
> +        switch (num_pri_bits) {
> +        case 7:
> +            kvm_gicc_access(s, ICC_AP1R_EL1(3), ncpu, &reg64, false);
> +            c->icc_apr[GICV3_G1NS][3] = reg64;
> +            kvm_gicc_access(s, ICC_AP1R_EL1(2), ncpu, &reg64, false);
> +            c->icc_apr[GICV3_G1NS][2] = reg64;
> +        case 6:
> +            kvm_gicc_access(s, ICC_AP1R_EL1(1), ncpu, &reg64, false);
> +            c->icc_apr[GICV3_G1NS][1] = reg64;
> +        default:
> +            kvm_gicc_access(s, ICC_AP1R_EL1(0), ncpu, &reg64, false);
> +            c->icc_apr[GICV3_G1NS][0] = reg64;
> +        }
> +    }
>  }
>  
>  static void kvm_arm_gicv3_reset(DeviceState *dev)
> @@ -77,6 +612,12 @@ static void kvm_arm_gicv3_reset(DeviceState *dev)
>      DPRINTF("Reset\n");
>  
>      kgc->parent_reset(dev);
> +
> +    if (s->migration_blocker) {
> +        DPRINTF("Cannot put kernel gic state, no kernel interface\n");
> +        return;
> +    }
> +
>      kvm_arm_gicv3_put(s);
>  }
>  
> @@ -122,13 +663,6 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
>      kvm_arm_register_device(&s->iomem_redist, -1, KVM_DEV_ARM_VGIC_GRP_ADDR,
>                              KVM_VGIC_V3_ADDR_TYPE_REDIST, s->dev_fd);
>  
> -    /* Block migration of a KVM GICv3 device: the API for saving and restoring
> -     * the state in the kernel is not yet finalised in the kernel or
> -     * implemented in QEMU.
> -     */
> -    error_setg(&s->migration_blocker, "vGICv3 migration is not implemented");
> -    migrate_add_blocker(s->migration_blocker);
> -
>      if (kvm_has_gsi_routing()) {
>          /* set up irq routing */
>          kvm_init_irq_routing(kvm_state);
> @@ -140,6 +674,13 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
>  
>          kvm_irqchip_commit_routes(kvm_state);
>      }
> +
> +    if (!kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_DIST_REGS,
> +                               GICD_CTLR)) {
> +        error_setg(&s->migration_blocker, "This operating system kernel does "
> +                                          "not support vGICv3 migration");
> +        migrate_add_blocker(s->migration_blocker);
> +    }
>  }
>  
>  static void kvm_arm_gicv3_class_init(ObjectClass *klass, void *data)
> diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
> index 8f3567e..179556f 100644
> --- a/hw/intc/gicv3_internal.h
> +++ b/hw/intc/gicv3_internal.h
> @@ -138,6 +138,7 @@
>  #define ICC_CTLR_EL1_EOIMODE        (1U << 1)
>  #define ICC_CTLR_EL1_PMHE           (1U << 6)
>  #define ICC_CTLR_EL1_PRIBITS_SHIFT 8
> +#define ICC_CTLR_EL1_PRIBITS_MASK   (7U << ICC_CTLR_EL1_PRIBITS_SHIFT)
>  #define ICC_CTLR_EL1_IDBITS_SHIFT 11
>  #define ICC_CTLR_EL1_SEIS           (1U << 14)
>  #define ICC_CTLR_EL1_A3V            (1U << 15)
> 
