Received: by 10.25.141.12 with SMTP id p12csp6824lfd;
        Mon, 13 Jun 2016 20:17:58 -0700 (PDT)
X-Received: by 10.233.221.130 with SMTP id r124mr12740344qkf.19.1465874278562;
        Mon, 13 Jun 2016 20:17:58 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a133si17077202qkc.140.2016.06.13.20.17.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 20:17:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60664 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCerV-0005x0-Th
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 23:17:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43054)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bCerM-0005tf-UK
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 23:17:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bCerJ-0001VT-L4
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 23:17:47 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:49681)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1bCerC-0001TT-Ok; Mon, 13 Jun 2016 23:17:39 -0400
Received: from 172.24.1.136 (EHLO szxeml425-hub.china.huawei.com)
	([172.24.1.136])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id CDF91195; Tue, 14 Jun 2016 11:09:57 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml425-hub.china.huawei.com
	(10.82.67.180) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 14 Jun 2016 11:09:43 +0800
Message-ID: <575F7577.1020903@huawei.com>
Date: Tue, 14 Jun 2016 11:09:43 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>
References: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
	<1464274540-19693-13-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1464274540-19693-13-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.575F7587.00E9, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 40985381999d27724eaabd7bb55eee8f
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 12/22] hw/intc/arm_gicv3:
 Implement GICv3 redistributor registers
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
X-TUID: QoNJGCFLQkkD



On 2016/5/26 22:55, Peter Maydell wrote:
> From: Shlomo Pongratz <shlomo.pongratz@huawei.com>
> 
> Implement the redistributor registers of a GICv3.
> 
> Signed-off-by: Shlomo Pongratz <shlomo.pongratz@huawei.com>
> [PMM: significantly overhauled/rewritten:
>  * use the new data structures
>  * restructure register read/write to handle different width accesses
>    natively, since almost all registers are 32-bit only, rather
>    than implementing everything as byte accesses
>  * implemented security extension support
> ]
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/Makefile.objs      |   1 +
>  hw/intc/arm_gicv3_redist.c | 495 +++++++++++++++++++++++++++++++++++++++++++++
>  hw/intc/gicv3_internal.h   |   4 +
>  trace-events               |   6 +
>  4 files changed, 506 insertions(+)
>  create mode 100644 hw/intc/arm_gicv3_redist.c
> 
> diff --git a/hw/intc/Makefile.objs b/hw/intc/Makefile.objs
> index a173d29..417db11 100644
> --- a/hw/intc/Makefile.objs
> +++ b/hw/intc/Makefile.objs
> @@ -15,6 +15,7 @@ common-obj-$(CONFIG_ARM_GIC) += arm_gicv2m.o
>  common-obj-$(CONFIG_ARM_GIC) += arm_gicv3_common.o
>  common-obj-$(CONFIG_ARM_GIC) += arm_gicv3.o
>  common-obj-$(CONFIG_ARM_GIC) += arm_gicv3_dist.o
> +common-obj-$(CONFIG_ARM_GIC) += arm_gicv3_redist.o
>  common-obj-$(CONFIG_OPENPIC) += openpic.o
>  
>  obj-$(CONFIG_APIC) += apic.o apic_common.o
> diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
> new file mode 100644
> index 0000000..18dc0c8
> --- /dev/null
> +++ b/hw/intc/arm_gicv3_redist.c
> @@ -0,0 +1,495 @@
> +/*
> + * ARM GICv3 emulation: Redistributor
> + *
> + * Copyright (c) 2015 Huawei.
> + * Copyright (c) 2016 Linaro Limited.
> + * Written by Shlomo Pongratz, Peter Maydell
> + *
> + * This code is licensed under the GPL, version 2 or (at your option)
> + * any later version.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "trace.h"
> +#include "gicv3_internal.h"
> +
> +static uint32_t mask_group(GICv3CPUState *cs, MemTxAttrs attrs)
> +{
> +    /* Return a 32-bit mask which should be applied for this set of 32
> +     * interrupts; each bit is 1 if access is permitted by the
> +     * combination of attrs.secure and GICR_GROUPR. (GICR_NSACR does
> +     * not affect config register accesses, unlike GICD_NSACR.)
> +     */
> +    if (!attrs.secure && !(cs->gic->gicd_ctlr & GICD_CTLR_DS)) {
> +        /* bits for Group 0 or Secure Group 1 interrupts are RAZ/WI */
> +        return cs->gicr_igroupr0;
> +    }
> +    return 0xFFFFFFFFU;
> +}
> +
> +static void gicr_write_set_bitmap_reg(GICv3CPUState *cs, MemTxAttrs attrs,
> +                                      uint32_t *reg, uint32_t val)
> +{
> +    /* Helper routine to implement writing to a "set-bitmap" register */
> +    val &= mask_group(cs, attrs);
> +    *reg |= val;
> +    gicv3_redist_update(cs);
> +}
> +
> +static void gicr_write_clear_bitmap_reg(GICv3CPUState *cs, MemTxAttrs attrs,
> +                                        uint32_t *reg, uint32_t val)
> +{
> +    /* Helper routine to implement writing to a "clear-bitmap" register */
> +    val &= mask_group(cs, attrs);
> +    *reg &= ~val;
> +    gicv3_redist_update(cs);
> +}
> +
> +static uint32_t gicr_read_bitmap_reg(GICv3CPUState *cs, MemTxAttrs attrs,
> +                                     uint32_t reg)
> +{
> +    reg &= mask_group(cs, attrs);
> +    return reg;
> +}
> +
> +static uint8_t gicr_read_ipriorityr(GICv3CPUState *cs, MemTxAttrs attrs,
> +                                    int irq)
> +{
> +    /* Read the value of GICR_IPRIORITYR<n> for the specified interrupt,
> +     * honouring security state (these are RAZ/WI for Group 0 or Secure
> +     * Group 1 interrupts).
> +     */
> +    uint32_t prio;
> +
> +    prio = cs->gicr_ipriorityr[irq];
> +
> +    if (!attrs.secure && !(cs->gic->gicd_ctlr & GICD_CTLR_DS)) {
> +        if (!(cs->gicr_igroupr0 & (1U << irq))) {
> +            /* Fields for Group 0 or Secure Group 1 interrupts are RAZ/WI */
> +            return 0;
> +        }
> +        /* NS view of the interrupt priority */
> +        prio = (prio << 1) & 0xff;
> +    }
> +    return prio;
> +}
> +
> +static void gicr_write_ipriorityr(GICv3CPUState *cs, MemTxAttrs attrs, int irq,
> +                                  uint8_t value)
> +{
> +    /* Write the value of GICD_IPRIORITYR<n> for the specified interrupt,
> +     * honouring security state (these are RAZ/WI for Group 0 or Secure
> +     * Group 1 interrupts).
> +     */
> +    if (!attrs.secure && !(cs->gic->gicd_ctlr & GICD_CTLR_DS)) {
> +        if (!(cs->gicr_igroupr0 & (1U << irq))) {
> +            /* Fields for Group 0 or Secure Group 1 interrupts are RAZ/WI */
> +            return;
> +        }
> +        /* NS view of the interrupt priority */
> +        value = 0x80 | (value >> 1);
> +    }
> +    cs->gicr_ipriorityr[irq] = value;
> +}
> +
> +static MemTxResult gicr_readb(GICv3CPUState *cs, hwaddr offset,
> +                              uint64_t *data, MemTxAttrs attrs)
> +{
> +    switch (offset) {
> +    case GICR_IPRIORITYR ... GICR_IPRIORITYR + 0x1f:
> +        *data = gicr_read_ipriorityr(cs, attrs, offset - GICR_IPRIORITYR);
> +        return MEMTX_OK;
> +    default:
> +        return MEMTX_ERROR;
> +    }
> +}
> +
> +static MemTxResult gicr_writeb(GICv3CPUState *cs, hwaddr offset,
> +                               uint64_t value, MemTxAttrs attrs)
> +{
> +    switch (offset) {
> +    case GICR_IPRIORITYR ... GICR_IPRIORITYR + 0x1f:
> +        gicr_write_ipriorityr(cs, attrs, offset - GICR_IPRIORITYR, value);
> +        gicv3_redist_update(cs);
> +        return MEMTX_OK;
> +    default:
> +        return MEMTX_ERROR;
> +    }
> +}
> +
> +static MemTxResult gicr_readl(GICv3CPUState *cs, hwaddr offset,
> +                              uint64_t *data, MemTxAttrs attrs)
> +{
> +    switch (offset) {
> +    case GICR_CTLR:
> +        *data = cs->gicr_ctlr;
> +        return MEMTX_OK;
> +    case GICR_IIDR:
> +        *data = gicv3_iidr();
> +        return MEMTX_OK;
> +    case GICR_TYPER:
> +        *data = extract64(cs->gicr_typer, 0, 32);
> +        return MEMTX_OK;
> +    case GICR_TYPER + 4:
> +        *data = extract64(cs->gicr_typer, 32, 32);
> +        return MEMTX_OK;
> +    case GICR_STATUSR:
> +        /* RAZ/WI for us (this is an optional register and our implementation
> +         * does not track RO/WO/reserved violations to report them to the guest)
> +         */
> +        *data = 0;
> +        return MEMTX_OK;
> +    case GICR_WAKER:
> +        *data = cs->gicr_waker;
> +        return MEMTX_OK;
> +    case GICR_PROPBASER:
> +        *data = extract64(cs->gicr_propbaser, 0, 32);
> +        return MEMTX_OK;
> +    case GICR_PROPBASER + 4:
> +        *data = extract64(cs->gicr_propbaser, 32, 32);
> +        return MEMTX_OK;
> +    case GICR_PENDBASER:
> +        *data = extract64(cs->gicr_pendbaser, 0, 32);
> +        return MEMTX_OK;
> +    case GICR_PENDBASER + 4:
> +        *data = extract64(cs->gicr_pendbaser, 32, 32);
> +        return MEMTX_OK;
> +    case GICR_IGROUPR0:
> +        if (!attrs.secure && !(cs->gic->gicd_ctlr & GICD_CTLR_DS)) {
> +            *data = 0;
> +            return MEMTX_OK;
> +        }
> +        *data = cs->gicr_igroupr0;
> +        return MEMTX_OK;
> +    case GICR_ISENABLER0:
> +    case GICR_ICENABLER0:
> +        *data = gicr_read_bitmap_reg(cs, attrs, cs->gicr_ienabler0);
GICv3 SPEC says when GICD_CTLR.DS == 0, for GICD_ICENABLER<n> bits
corresponding to Group 0 and Secure Group 1 interrupts are RAZ/WI to
Non-secure accesses. But for GICR_ICENABLER0 all bits are RAZ/WI to
Non-secure accesses. It doesn't care the interrupt Group. If so,
gicr_read_bitmap_reg() wrongly uses the return value of mask_group() as
the mask.

> +        return MEMTX_OK;
> +    case GICR_ISPENDR0:
> +    case GICR_ICPENDR0:
> +    {
> +        /* The pending register reads as the logical OR of the pending
> +         * latch and the input line level for level-triggered interrupts.
> +         */
> +        uint32_t val = cs->gicr_ipendr0 | (~cs->edge_trigger & cs->level);
> +        *data = gicr_read_bitmap_reg(cs, attrs, val);
> +        return MEMTX_OK;
> +    }
> +    case GICR_ISACTIVER0:
> +    case GICR_ICACTIVER0:
> +        *data = gicr_read_bitmap_reg(cs, attrs, cs->gicr_iactiver0);
> +        return MEMTX_OK;
> +    case GICR_IPRIORITYR ... GICR_IPRIORITYR + 0x1f:
> +    {
> +        int i, irq = offset - GICR_IPRIORITYR;
> +        uint32_t value = 0;
> +
> +        for (i = irq + 3; i >= irq; i--, value <<= 8) {
> +            value |= gicr_read_ipriorityr(cs, attrs, i);
> +        }
> +        *data = value;
> +        return MEMTX_OK;
> +    }
> +    case GICR_ICFGR0:
> +    case GICR_ICFGR1:
> +    {
> +        /* Our edge_trigger bitmap is one bit per irq; take the correct
> +         * half of it, and spread it out into the odd bits.
> +         */
> +        uint32_t value;
> +
> +        value = cs->edge_trigger & mask_group(cs, attrs);
For GICR_ICFGR0, it doesn't need to use mask_group() as mask because the
SPEC doesn't say it's RAZ/WI to a Group 0 or Secure Group 1 interrupt.

> +        value = extract32(value, (offset == GICR_ICFGR1) ? 16 : 0, 16);
> +        value = half_shuffle32(value) << 1;
> +        *data = value;
> +        return MEMTX_OK;
> +    }
> +    case GICR_IGRPMODR0:
> +        if ((cs->gic->gicd_ctlr & GICD_CTLR_DS) || !attrs.secure) {
> +            /* RAZ/WI if security disabled, or if
> +             * security enabled and this is an NS access
> +             */
> +            *data = 0;
> +            return MEMTX_OK;
> +        }
> +        *data = cs->gicr_igrpmodr0;
> +        return MEMTX_OK;
> +    case GICR_NSACR:
> +        if (!attrs.secure && !(cs->gic->gicd_ctlr & GICD_CTLR_DS)) {
> +            *data = 0;
> +            return MEMTX_OK;
> +        }
> +        *data = cs->gicr_nsacr;
Look like this is not consistent with the SPEC.
The SPEC says
"When GICD_CTLR.DS == 1, this register is RAZ/WI.
When GICD_CTLR.DS == 0, this register is Secure, and is RAZ/WI to
Non-secure accesses."

So when GICD_CTLR.DS == 1, it should make *data = 0.

> +        return MEMTX_OK;
> +    case GICR_IDREGS ... GICR_IDREGS + 0x1f:
> +        *data = gicv3_idreg(offset - GICR_IDREGS);
> +        return MEMTX_OK;
> +    default:
> +        return MEMTX_ERROR;
> +    }
> +}
> +
> +static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
> +                               uint64_t value, MemTxAttrs attrs)
> +{
> +    switch (offset) {
> +    case GICR_CTLR:
> +        /* For our implementation, GICR_TYPER.DPGS is 0 and so all
> +         * the DPG bits are RAZ/WI. We don't do anything asynchronously,
> +         * so UWP and RWP are RAZ/WI. And GICR_TYPER.LPIS is 0 (we don't
> +         * implement LPIs) so Enable_LPIs is RES0. So there are no writable
> +         * bits for us.
> +         */
> +        return MEMTX_OK;
> +    case GICR_STATUSR:
> +        /* RAZ/WI for our implementation */
> +        return MEMTX_OK;
> +    case GICR_WAKER:
> +        /* Only the ProcessorSleep bit is writeable. When the guest sets
> +         * it it requests that we transition the channel between the
> +         * redistributor and the cpu interface to quiescent, and that
> +         * we set the ChildrenAsleep bit once the inteface has reached the
> +         * quiescent state.
> +         * Setting the ProcessorSleep to 0 reverses the quiescing, and
> +         * ChildrenAsleep is cleared once the transition is complete.
> +         * Since our interface is not asynchronous, we complete these
> +         * transitions instantaneously, so we set ChildrenAsleep to the
> +         * same value as ProcessorSleep here.
> +         */
> +        value &= GICR_WAKER_ProcessorSleep;
> +        if (value & GICR_WAKER_ProcessorSleep) {
> +            value |= GICR_WAKER_ChildrenAsleep;
> +        }
> +        cs->gicr_waker = value;
> +        return MEMTX_OK;
> +    case GICR_PROPBASER:
> +        cs->gicr_propbaser = deposit64(cs->gicr_propbaser, 0, 32, value);
> +        return MEMTX_OK;
> +    case GICR_PROPBASER + 4:
> +        cs->gicr_propbaser = deposit64(cs->gicr_propbaser, 32, 32, value);
> +        return MEMTX_OK;
> +    case GICR_PENDBASER:
> +        cs->gicr_pendbaser = deposit64(cs->gicr_pendbaser, 0, 32, value);
> +        return MEMTX_OK;
> +    case GICR_PENDBASER + 4:
> +        cs->gicr_pendbaser = deposit64(cs->gicr_pendbaser, 32, 32, value);
> +        return MEMTX_OK;
> +    case GICR_IGROUPR0:
> +        if (!attrs.secure && !(cs->gic->gicd_ctlr & GICD_CTLR_DS)) {
> +            return MEMTX_OK;
> +        }
> +        cs->gicr_igroupr0 = value;
> +        gicv3_redist_update(cs);
> +        return MEMTX_OK;
> +    case GICR_ISENABLER0:
> +        gicr_write_set_bitmap_reg(cs, attrs, &cs->gicr_ienabler0, value);
> +        return MEMTX_OK;
> +    case GICR_ICENABLER0:
> +        gicr_write_clear_bitmap_reg(cs, attrs, &cs->gicr_ienabler0, value);
> +        return MEMTX_OK;
> +    case GICR_ISPENDR0:
> +        gicr_write_set_bitmap_reg(cs, attrs, &cs->gicr_ipendr0, value);
> +        return MEMTX_OK;
> +    case GICR_ICPENDR0:
> +        gicr_write_clear_bitmap_reg(cs, attrs, &cs->gicr_ipendr0, value);
> +        return MEMTX_OK;
> +    case GICR_ISACTIVER0:
> +        gicr_write_set_bitmap_reg(cs, attrs, &cs->gicr_iactiver0, value);
> +        return MEMTX_OK;
> +    case GICR_ICACTIVER0:
> +        gicr_write_clear_bitmap_reg(cs, attrs, &cs->gicr_iactiver0, value);
> +        return MEMTX_OK;
> +    case GICR_IPRIORITYR ... GICR_IPRIORITYR + 0x1f:
> +    {
> +        int i, irq = offset - GICR_IPRIORITYR;
> +
> +        for (i = irq; i < irq + 4; i++, value >>= 8) {
> +            gicr_write_ipriorityr(cs, attrs, i, value);
> +        }
> +        gicv3_redist_update(cs);
> +        return MEMTX_OK;
> +    }
> +    case GICR_ICFGR0:
> +        /* Register is all RAZ/WI or RAO/WI bits */
> +        return MEMTX_OK;
> +    case GICR_ICFGR1:
> +    {
> +        uint32_t mask;
> +
> +        /* Since our edge_trigger bitmap is one bit per irq, our input
> +         * 32-bits will compress down into 16 bits which we need
> +         * to write into the bitmap.
> +         */
> +        value = half_unshuffle32(value >> 1) << 16;
> +        mask = mask_group(cs, attrs) & 0xffff0000U;
> +
> +        cs->edge_trigger &= ~mask;
> +        cs->edge_trigger |= (value & mask);
> +
> +        gicv3_redist_update(cs);
> +        return MEMTX_OK;
> +    }
> +    case GICR_IGRPMODR0:
> +        if ((cs->gic->gicd_ctlr & GICD_CTLR_DS) || !attrs.secure) {
> +            /* RAZ/WI if security disabled, or if
> +             * security enabled and this is an NS access
> +             */
> +            return MEMTX_OK;
> +        }
> +        cs->gicr_igrpmodr0 = value;
> +        gicv3_redist_update(cs);
> +        return MEMTX_OK;
> +    case GICR_NSACR:
> +        if (!attrs.secure && !(cs->gic->gicd_ctlr & GICD_CTLR_DS)) {
> +            return MEMTX_OK;
> +        }
> +        cs->gicr_nsacr = value;
> +        /* no update required as this only affects access permission checks */
> +        return MEMTX_OK;
> +    case GICR_IIDR:
> +    case GICR_TYPER:
> +    case GICR_IDREGS ... GICR_IDREGS + 0x1f:
> +        /* RO registers, ignore the write */
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: invalid guest write to RO register at offset "
> +                      TARGET_FMT_plx "\n", __func__, offset);
> +        return MEMTX_OK;
> +    default:
> +        return MEMTX_ERROR;
> +    }
> +}
> +

-- 
Shannon

