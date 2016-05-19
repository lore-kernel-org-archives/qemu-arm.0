Received: by 10.25.208.137 with SMTP id h131csp2904129lfg;
        Thu, 19 May 2016 02:44:08 -0700 (PDT)
X-Received: by 10.140.163.85 with SMTP id j82mr13160943qhj.40.1463651048081;
        Thu, 19 May 2016 02:44:08 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a129si7969466qkg.132.2016.05.19.02.44.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 May 2016 02:44:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49099 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b3KUx-0004nW-IE
	for alex.bennee@linaro.org; Thu, 19 May 2016 05:44:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39259)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1b3KTi-0004EK-E8
	for qemu-devel@nongnu.org; Thu, 19 May 2016 05:42:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1b3KTe-0002Sq-W4
	for qemu-devel@nongnu.org; Thu, 19 May 2016 05:42:50 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:59239)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1b3KTd-0002PT-Lv; Thu, 19 May 2016 05:42:46 -0400
Received: from 172.24.1.136 (EHLO szxeml430-hub.china.huawei.com)
	([172.24.1.136])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DHI47198; Thu, 19 May 2016 17:36:33 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml430-hub.china.huawei.com
	(10.82.67.185) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 19 May 2016 17:36:23 +0800
Message-ID: <573D8916.4080102@huawei.com>
Date: Thu, 19 May 2016 17:36:22 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>
References: <1462814989-24360-1-git-send-email-peter.maydell@linaro.org>
	<1462814989-24360-7-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1462814989-24360-7-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020205.573D8926.0018, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 34d509f0782702ceb6270a474d0a502f
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Subject: Re: [Qemu-devel] [PATCH 06/23] hw/intc/arm_gicv3: Add state
 information
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org, Shlomo Pongratz <shlomo.pongratz@huawei.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, Shannon Zhao <shannon.zhao@linaro.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QoJEMOOTrPsC



On 2016/5/10 1:29, Peter Maydell wrote:
> From: Pavel Fedin <p.fedin@samsung.com>
> 
> Add state information to GICv3 object structure and implement
> arm_gicv3_common_reset().
> 
> This commit includes accessor functions for the fields which are
> stored as bitmaps in uint32_t arrays.
> 
> Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
> [PMM: significantly overhauled:
>  * Add missing qom/cpu.h include
>  * Remove legacy-only state fields (we can add them later if/when we add
>    legacy emulation)
>  * Use arrays of uint32_t to store the various distributor bitmaps,
>    and provide accessor functions for the various set/test/etc operations
>  * Add various missing register offset #defines
>  * Accessor macros which combine distributor and redistributor behaviour
>    removed
>  * Fields in state structures renamed to match architectural register names
>  * Corrected the reset value for GICR_IENABLER0 since we don't support
>    legacy mode
>  * Added ARM_LINUX_BOOT_IF interface for "we are directly booting a kernel in
>    non-secure" so that we can fake up the firmware-mandated reconfiguration
>    only when we need it
> ]
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/arm_gicv3_common.c         | 140 ++++++++++++++++++++++++++-
>  hw/intc/gicv3_internal.h           | 172 +++++++++++++++++++++++++++++++++
>  include/hw/intc/arm_gicv3_common.h | 189 ++++++++++++++++++++++++++++++++++++-
>  3 files changed, 496 insertions(+), 5 deletions(-)
>  create mode 100644 hw/intc/gicv3_internal.h
> 
> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
> index b9d3824..9ee4412 100644
> --- a/hw/intc/arm_gicv3_common.c
> +++ b/hw/intc/arm_gicv3_common.c
> @@ -3,8 +3,9 @@
>   *
>   * Copyright (c) 2012 Linaro Limited
>   * Copyright (c) 2015 Huawei.
> + * Copyright (c) 2015 Samsung Electronics Co., Ltd.
>   * Written by Peter Maydell
> - * Extended to 64 cores by Shlomo Pongratz
> + * Reworked for GICv3 by Shlomo Pongratz and Pavel Fedin
>   *
>   * This program is free software; you can redistribute it and/or modify
>   * it under the terms of the GNU General Public License as published by
> @@ -22,7 +23,10 @@
>  
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> +#include "qom/cpu.h"
>  #include "hw/intc/arm_gicv3_common.h"
> +#include "gicv3_internal.h"
> +#include "hw/arm/linux-boot-if.h"
>  
>  static void gicv3_pre_save(void *opaque)
>  {
> @@ -90,6 +94,7 @@ void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
>  static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
>  {
>      GICv3State *s = ARM_GICV3_COMMON(dev);
> +    int i;
>  
>      /* revision property is actually reserved and currently used only in order
>       * to keep the interface compatible with GICv2 code, avoiding extra
> @@ -100,11 +105,136 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
>          error_setg(errp, "unsupported GIC revision %d", s->revision);
>          return;
>      }
> +
> +    if (s->num_irq > GICV3_MAXIRQ) {
> +        error_setg(errp,
> +                   "requested %u interrupt lines exceeds GIC maximum %d",
> +                   s->num_irq, GICV3_MAXIRQ);
> +        return;
> +    }
> +
Does it need to check if s->num_irq is less than 32?

> +    s->cpu = g_new0(GICv3CPUState, s->num_cpu);
> +
And check if s->num_cpu is greater than 0?

> +    for (i = 0; i < s->num_cpu; i++) {
> +        CPUState *cpu = qemu_get_cpu(i);
> +        uint64_t cpu_affid;
> +        int last;
> +
> +        s->cpu[i].cpu = cpu;
> +        s->cpu[i].gic = s;
> +
> +        /* Pre-construct the GICR_TYPER:
> +         * For our implementation:
> +         *  Top 32 bits are the affinity value of the associated CPU
> +         *  CommonLPIAff == 01 (redistributors with same Aff3 share LPI table)
> +         *  Processor_Number == CPU index starting from 0
> +         *  DPGS == 0 (GICR_CTLR.DPG* not supported)
> +         *  Last == 1 if this is the last redistributor in a series of
> +         *            contiguous redistributor pages
> +         *  DirectLPI == 0 (direct injection of LPIs not supported)
> +         *  VLPIS == 0 (virtual LPIs not supported)
> +         *  PLPIS == 0 (physical LPIs not supported)
> +         */
> +        cpu_affid = object_property_get_int(OBJECT(cpu), "mp-affinity", NULL);
> +        last = (i == s->num_cpu - 1);
> +
> +        /* The CPU mp-affinity property is in MPIDR register format; squash
> +         * the affinity bytes into 32 bits as the GICR_TYPER has them.
> +         */
> +        cpu_affid = (cpu_affid & 0xFF00000000ULL >> 8) | (cpu_affid & 0xFFFFFF);
> +        s->cpu[i].gicr_typer = (cpu_affid << 32) |
> +            (1 << 24) |
> +            (i << 8) |
> +            (last << 4);
> +    }
>  }
>  
>  static void arm_gicv3_common_reset(DeviceState *dev)
>  {
> -    /* TODO */
> +    GICv3State *s = ARM_GICV3_COMMON(dev);
> +    int i;
> +
> +    for (i = 0; i < s->num_cpu; i++) {
> +        GICv3CPUState *cs = &s->cpu[i];
> +
> +        cs->level = 0;
> +        cs->gicr_ctlr = 0;
> +        cs->gicr_statusr[GICV3_S] = 0;
> +        cs->gicr_statusr[GICV3_NS] = 0;
> +        cs->gicr_waker = GICR_WAKER_ProcessorSleep | GICR_WAKER_ChildrenAsleep;
> +        cs->gicr_propbaser = 0;
> +        cs->gicr_pendbaser = 0;
> +        /* If we're resetting a TZ-aware GIC as if secure firmware
> +         * had set it up ready to start a kernel in non-secure, we
> +         * need to set interrupts to group 1 so the kernel can use them.
> +         * Otherwise they reset to group 0 like the hardware.
> +         */
> +        if (s->irq_reset_nonsecure) {
> +            cs->gicr_igroupr0 = 0xffffffff;
> +        } else {
> +            cs->gicr_igroupr0 = 0;
> +        }
> +
> +        cs->gicr_ienabler0 = 0;
> +        cs->gicr_ipendr0 = 0;
> +        cs->gicr_iactiver0 = 0;
> +        cs->edge_trigger = 0xffff;
> +        cs->gicr_igrpmodr0 = 0;
> +        cs->gicr_nsacr = 0;
> +        memset(cs->gicr_ipriorityr, 0, sizeof(cs->gicr_ipriorityr));
> +
> +        /* State in the CPU interface must *not* be reset here, because it
> +         * is part of the CPU's reset domain, not the GIC device's.
> +         */
> +    }
> +
> +    /* For our implementation affinity routing is always enabled */
> +    if (s->security_extn) {
> +        s->gicd_ctlr = GICD_CTLR_ARE_S | GICD_CTLR_ARE_NS;
> +    } else {
> +        s->gicd_ctlr = GICD_CTLR_DS | GICD_CTLR_ARE;
> +    }
> +
I'm a little confused with the no security support case, and in that
case, this GICv3 implementation supports only a single Security state,
right? If so, the SPEC says the DS bit is "Disable Security. This field
is RAO/WI." So why do you set the DS bit here?

[...]
> diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
> new file mode 100644
> index 0000000..d23524b
> --- /dev/null
> +++ b/hw/intc/gicv3_internal.h
> @@ -0,0 +1,172 @@
> +/*
> + * ARM GICv3 support - internal interfaces
> + *
> + * Copyright (c) 2012 Linaro Limited
> + * Copyright (c) 2015 Huawei.
> + * Copyright (c) 2015 Samsung Electronics Co., Ltd.
> + * Written by Peter Maydell
> + * Reworked for GICv3 by Shlomo Pongratz and Pavel Fedin
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation, either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License along
> + * with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef QEMU_ARM_GICV3_INTERNAL_H
> +#define QEMU_ARM_GICV3_INTERNAL_H
> +
> +#include "hw/intc/arm_gicv3_common.h"
> +
> +/* Distributor registers, as offsets from the distributor base address */
> +#define GICD_CTLR            0x0000
> +#define GICD_TYPER           0x0004
> +#define GICD_IIDR            0x0008
> +#define GICD_STATUSR         0x0010
> +#define GICD_SETSPI_NSR      0x0040
> +#define GICD_CLRSPI_NSR      0x0048
> +#define GICD_SETSPI_SR       0x0050
> +#define GICD_CLRSPI_SR       0x0058
> +#define GICD_SEIR            0x0068
> +#define GICD_IGROUPR         0x0080
> +#define GICD_ISENABLER       0x0100
> +#define GICD_ICENABLER       0x0180
> +#define GICD_ISPENDR         0x0200
> +#define GICD_ICPENDR         0x0280
> +#define GICD_ISACTIVER       0x0300
> +#define GICD_ICACTIVER       0x0380
> +#define GICD_IPRIORITYR      0x0400
> +#define GICD_ITARGETSR       0x0800
> +#define GICD_ICFGR           0x0C00
> +#define GICD_IGRPMODR        0x0D00
> +#define GICD_NSACR           0x0E00
> +#define GICD_SGIR            0x0F00
> +#define GICD_CPENDSGIR       0x0F10
> +#define GICD_SPENDSGIR       0x0F20
> +#define GICD_IROUTER         0x6000
This should be 0x6100 or gicd_irouter[GICV3_MAXSPI] should use
GIC_MAXIRQ in struct GICv3State. Otherwise gicd_read_irouter() will be
wrong because s->gicd_irouter[irq] will be off normal upper if irq is
e.g. GIC_MAXIRQ - 1.

[...]

> +#define GICR_PROPBASER_OUTER_CACHEABILITY_MASK (7ULL << 56)
> +#define GICR_PROPBASER_ADDR_MASK               (0xfffffffffULL << 12)
> +#define GICR_PROPBASER_SHAREABILITY_MASK       (3U << 10)
> +#define GICR_PROPBASER_CACHEABILITY_MASK       (7U << 7)
> +#define GICR_PROPBASER_IDBITS_MASK             (0x1f)
Use (0x1f << 0) to keep consistent?

Thanks,
-- 
Shannon

