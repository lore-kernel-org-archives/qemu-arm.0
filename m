Received: by 10.25.208.211 with SMTP id h202csp2234898lfg;
        Wed, 24 Feb 2016 04:51:36 -0800 (PST)
X-Received: by 10.140.30.4 with SMTP id c4mr49305143qgc.14.1456318296580;
        Wed, 24 Feb 2016 04:51:36 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c52si2688912qgc.5.2016.02.24.04.51.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 24 Feb 2016 04:51:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35477 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aYYum-0007tQ-1u
	for alex.bennee@linaro.org; Wed, 24 Feb 2016 07:51:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34882)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shlomopongratz@gmail.com>) id 1aYYuD-0007bu-Oq
	for qemu-devel@nongnu.org; Wed, 24 Feb 2016 07:51:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shlomopongratz@gmail.com>) id 1aYYu9-0003uH-60
	for qemu-devel@nongnu.org; Wed, 24 Feb 2016 07:51:01 -0500
Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a]:33457)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shlomopongratz@gmail.com>)
	id 1aYYtw-0003rB-VS; Wed, 24 Feb 2016 07:50:45 -0500
Received: by mail-wm0-x22a.google.com with SMTP id g62so3382303wme.0;
	Wed, 24 Feb 2016 04:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=EU//eMISo6qbbpRIaDUmASDEittMLEC2fTrglJc9g4U=;
	b=lrotFIzc3Lhx4OMlqpO8LgRXf2COUrabwQSd67KSIRT2CM2Egsf8pzssqGQrLbjBmK
	Dlbx/p362coyuPLIf2TNA9B9AHLBPeAmGBzx/+KLpcnwVRe+oXo1haqXZbedRitS1FoQ
	DWPRwfORnNHkYh7Pe96NIOx+vrRSszaVx8P8U2jAkLESy6LY/GzyWvy1E80licm9Xjge
	SknpMpCS+3JeAuGPXAcVmk5+E2iSFyr0U/FWllNYwPqWMvxXkuxKOiY1U+cK/phxX8k7
	jj09eHH5+hFjmvJMORr3cQBSags5/pyLVS5Hz2lF1scMwticW9cLeCwdFprS9RUYYw+r
	122g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=EU//eMISo6qbbpRIaDUmASDEittMLEC2fTrglJc9g4U=;
	b=ccY9rSiOzd9+YQLP7otuWY3xofUgn+YWFtGMhem28rhqmHinboBh4FzmBLWQB3wyTd
	N6hBTTVB2fU1rA+BlAlprwNOalgJ1+rMufXe7J9Ggh4I219UyOHf3b2rSVzvb7ZQMNyi
	cSfpFn09Fl/redXhdHDwBZv86rdgKu4jtWm/XlJ2wm1l54/4orzeCgGimMIUCJyfkQJa
	iLKGPqAdcZQT+ArcbyANHHP43DZd1Rw5ylE/Ld4hLcn53Py3+aFCLQIWpKLxyVRNbwbW
	ogWfyvD1uT6xT6d0xFp2yKtrzZS0hF56vqLmOiklV2wMLN4SvncbErjv8p8wel+xHlly
	mR5Q==
X-Gm-Message-State: AG10YOQZgbEiyRBD8PcT2UXOxiLj0AgYvtvYt5Vc4/6RTros7yzNY/WT5JMZ3IBW6uWpQw6l2W4BEL5JCe95qQ==
MIME-Version: 1.0
X-Received: by 10.194.120.99 with SMTP id lb3mr46986546wjb.59.1456318243798;
	Wed, 24 Feb 2016 04:50:43 -0800 (PST)
Received: by 10.27.170.200 with HTTP; Wed, 24 Feb 2016 04:50:43 -0800 (PST)
In-Reply-To: <1456172720-12650-2-git-send-email-peter.maydell@linaro.org>
References: <1456172720-12650-1-git-send-email-peter.maydell@linaro.org>
	<1456172720-12650-2-git-send-email-peter.maydell@linaro.org>
Date: Wed, 24 Feb 2016 14:50:43 +0200
Message-ID: <CAHzK-V0PNTEotDoHAgNY8_wVnym0fkm+kY+6wh4gwEXZrT+4Gw@mail.gmail.com>
From: Shlomo Pongratz <shlomopongratz@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary=089e01227b909a046a052c83835e
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22a
Cc: Shlomo Pongratz <shlomo.pongratz@huawei.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Pavel Fedin <p.fedin@samsung.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-devel] [RFC 1/5] hw/intc/arm_gicv3_common: Add state
	information
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: X/CLsHxq5ceN

--089e01227b909a046a052c83835e
Content-Type: text/plain; charset=UTF-8

On Monday, February 22, 2016, Peter Maydell <peter.maydell@linaro.org>
wrote:

> From: Pavel Fedin <p.fedin@samsung.com <javascript:;>>
>
> Add state information to GICv3 object structure and implement
> arm_gicv3_common_reset(). Also, add some functions for registers which are
> not stored directly but simulated.
>
> State information includes not only pure GICv3 data, but also some legacy
> registers. This will be useful for implementing software emulation of GICv3
> with v2 backwards compatilibity mode.
>
> Signed-off-by: Pavel Fedin <p.fedin@samsung.com <javascript:;>>
> [PMM: significantly overhauled:
>  * Add missing qom/cpu.h include
>  * Remove legacy-only state fields (we can add them later if/when we add
>    legacy emulation)
>  * Add various missing register offset #defines
>  * Accessor macros removed entirely
>  * Fields in state structures renamed to match architectural register names
>  * Corrected the reset value for GICR_IENABLER0 since we don't support
>    legacy mode
>  * Added ARM_LINUX_BOOT_IF interface for "we are directly booting a kernel
> in
>    non-secure" so that we can fake up the firmware-mandated reconfiguration
>    only when we need it
> ]
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org <javascript:;>>
> ---
>  hw/intc/arm_gicv3_common.c         | 116 ++++++++++++++++++++++++++++-
>  hw/intc/gicv3_internal.h           | 147
> +++++++++++++++++++++++++++++++++++++
>  include/hw/intc/arm_gicv3_common.h | 106 +++++++++++++++++++++++++-
>  3 files changed, 364 insertions(+), 5 deletions(-)
>  create mode 100644 hw/intc/gicv3_internal.h
>
> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
> index e4f0f5a..a1ce4c1 100644
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
> @@ -21,7 +22,10 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qom/cpu.h"
>  #include "hw/intc/arm_gicv3_common.h"
> +#include "gicv3_internal.h"
> +#include "hw/arm/linux-boot-if.h"
>
>  static void gicv3_pre_save(void *opaque)
>  {
> @@ -89,6 +93,8 @@ void gicv3_init_irqs_and_mmio(GICv3State *s,
> qemu_irq_handler handler,
>  static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
>  {
>      GICv3State *s = ARM_GICV3_COMMON(dev);
> +    Object *cpu;
> +    int i;
>
>      /* revision property is actually reserved and currently used only in
> order
>       * to keep the interface compatible with GICv2 code, avoiding extra
> @@ -99,11 +105,111 @@ static void arm_gicv3_common_realize(DeviceState
> *dev, Error **errp)
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
> +    s->cpu = g_new0(GICv3CPUState, s->num_cpu);
> +
> +    for (i = 0; i < s->num_cpu; i++) {
> +        cpu = OBJECT(qemu_get_cpu(i));
> +        s->cpu[i].affinity_id = object_property_get_int(cpu,
> "mp-affinity",
> +                                                        NULL);
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
> +        GICv3CPUState *c = &s->cpu[i];
> +
> +        c->gicr_waker = GICR_WAKER_ProcessorSleep |
> GICR_WAKER_ChildrenAsleep;
> +        c->gicr_ctlr = 0;
> +        c->gicr_propbaser = 0;
> +        c->gicr_pendbaser = 0;
> +        /* If we're resetting a TZ-aware GIC as if secure firmware
> +         * had set it up ready to start a kernel in non-secure, we
> +         * need to set interrupts to group 1 so the kernel can use them.
> +         * Otherwise they reset to group 0 like the hardware.
> +         */
> +        if (s->security_extn && s->irq_reset_nonsecure) {
> +            c->gicr_igroupr0 = 0xffffffff;
> +        } else {
> +            c->gicr_igroupr0 = 0;
> +        }
> +
> +        c->gicr_ienabler0 = 0;
> +        c->gicr_ipendr0 = 0;
> +        c->gicr_iactiver0 = 0;
> +        c->gicr_icfgr0 = 0xaaaaaaaa;
> +        c->gicr_icfgr1 = 0;
> +        memset(c->gicr_ipriorityr, 0, sizeof(c->gicr_ipriorityr));
> +        c->level = 0;
> +
> +        c->icc_ctlr_el1[0] = 0;
> +        c->icc_ctlr_el1[1] = 0;
> +        c->icc_igrpen0_el1 = 0;
> +        c->icc_igrpen1_el1 = 0;
> +        c->icc_pmr_el1 = 0;
> +        c->icc_bpr[0] = GIC_MIN_BPR0;
> +        c->icc_bpr[1] = GIC_MIN_BPR1;
> +        memset(c->icc_ap1r, 0, sizeof(c->icc_ap1r));
> +    }
> +
> +    memset(s->group, 0, sizeof(s->group));
> +    memset(s->enabled, 0, sizeof(s->enabled));
> +    memset(s->pending, 0, sizeof(s->pending));
> +    memset(s->active, 0, sizeof(s->active));
> +    memset(s->level, 0, sizeof(s->level));
> +    memset(s->edge_trigger, 0, sizeof(s->edge_trigger));
> +
> +    /* Workaround! (the same as c->group above) */
> +    for (i = GIC_INTERNAL; i < s->num_irq; i++) {
> +        set_bit(i - GIC_INTERNAL, s->group);
> +    }
> +
> +    /* By default all interrupts always target CPU #0 */
> +    for (i = 0; i < GICV3_MAXSPI; i++) {
> +        s->gicd_itargetsr[i] = 1;
> +    }
> +    memset(s->gicd_irouter, 0, sizeof(s->gicd_irouter));
> +    memset(s->gicd_ipriority, 0, sizeof(s->gicd_ipriority));
> +
> +    /* With all configuration we don't support GICv2 backwards
> computability */
> +    if (s->security_extn) {
> +        /* GICv3 5.3.20 With two security So DS is RAZ/WI ARE_NS is RAO/WI
> +         * and ARE_S is RAO/WI
> +         */
> +         s->gicd_ctlr = GICD_CTLR_ARE_S | GICD_CTLR_ARE_NS;
> +    } else {
> +        /* GICv3 5.3.20 With one security So DS is RAO/WI ARE is RAO/WI
> +         */
> +        s->gicd_ctlr = GICD_CTLR_DS | GICD_CTLR_ARE;
> +    }
> +}
> +
> +static void arm_gic_common_linux_init(ARMLinuxBootIf *obj,
> +                                      bool secure_boot)
> +{
> +    GICState *s = ARM_GIC_COMMON(obj);
> +
> +    if (s->security_extn && !secure_boot) {
> +        /* We're directly booting a kernel into NonSecure. If this GIC
> +         * implements the security extensions then we must configure it
> +         * to have all the interrupts be NonSecure (this is a job that
> +         * is done by the Secure boot firmware in real hardware, and in
> +         * this mode QEMU is acting as a minimalist
> firmware-and-bootloader
> +         * equivalent).
> +         */
> +        s->irq_reset_nonsecure = true;
> +    }
>  }
>
>  static Property arm_gicv3_common_properties[] = {
> @@ -117,11 +223,13 @@ static Property arm_gicv3_common_properties[] = {
>  static void arm_gicv3_common_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> +    ARMLinuxBootIfClass *albifc = ARM_LINUX_BOOT_IF_CLASS(klass);
>
>      dc->reset = arm_gicv3_common_reset;
>      dc->realize = arm_gicv3_common_realize;
>      dc->props = arm_gicv3_common_properties;
>      dc->vmsd = &vmstate_gicv3;
> +    albifc->arm_linux_init = arm_gic_common_linux_init;
>  }
>
>  static const TypeInfo arm_gicv3_common_type = {
> @@ -131,6 +239,10 @@ static const TypeInfo arm_gicv3_common_type = {
>      .class_size = sizeof(ARMGICv3CommonClass),
>      .class_init = arm_gicv3_common_class_init,
>      .abstract = true,
> +    .interfaces = (InterfaceInfo []) {
> +        { TYPE_ARM_LINUX_BOOT_IF },
> +        { },
> +    },
>  };
>
>  static void register_types(void)
> diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
> new file mode 100644
> index 0000000..9f9a45e
> --- /dev/null
> +++ b/hw/intc/gicv3_internal.h
> @@ -0,0 +1,147 @@
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
> +#define GICD_NASCR           0x0E00
> +#define GICD_SGIR            0x0F00
> +#define GICD_CPENDSGIR       0x0F10
> +#define GICD_SPENDSGIR       0x0F20
> +#define GICD_IROUTER         0x6000
> +#define GICD_PIDR2           0xFFE8
> +
> +/* GICD_CTLR fields  */
> +#define GICD_CTLR_EN_GRP0           (1U << 0)
> +#define GICD_CTLR_EN_GRP1NS         (1U << 1) /* GICv3 5.3.20 */
> +#define GICD_CTLR_EN_GRP1S          (1U << 2)
> +#define GICD_CTLR_EN_GRP1_ALL       (GICD_CTLR_EN_GRP1NS |
> GICD_CTLR_EN_GRP1S)
> +/* Bit 4 is ARE if the system doesn't support TrustZone, ARE_S otherwise
> */
> +#define GICD_CTLR_ARE               (1U << 4)
> +#define GICD_CTLR_ARE_S             (1U << 4)
> +#define GICD_CTLR_ARE_NS            (1U << 5)
> +#define GICD_CTLR_DS                (1U << 6)
> +#define GICD_CTLR_E1NWF             (1U << 7)
> +#define GICD_CTLR_RWP               (1U << 31)
> +
> +/*
> + * Redistributor frame offsets from RD_base
> + */
> +#define GICR_SGI_OFFSET 0x10000
> +
> +/*
> + * Redistributor registers, offsets from RD_base
> + */
> +#define GICR_CTLR             0x0000
> +#define GICR_IIDR             0x0004
> +#define GICR_TYPER            0x0008
> +#define GICR_STATUSR          0x0010
> +#define GICR_WAKER            0x0014
> +#define GICR_SETLPIR          0x0040
> +#define GICR_CLRLPIR          0x0048
> +#define GICR_PROPBASER        0x0070
> +#define GICR_PENDBASER        0x0078
> +#define GICR_INVLPIR          0x00A0
> +#define GICR_INVALLR          0x00B0
> +#define GICR_SYNCR            0x00C0
> +#define GICR_PIDR2            0xFFE8
> +
> +/* SGI and PPI Redistributor registers, offsets from SGI_base */
> +#define GICR_IGROUPR0         0x0080
> +#define GICR_ISENABLER0       0x0100
> +#define GICR_ICENABLER0       0x0180
> +#define GICR_ISPENDR0         0x0200
> +#define GICR_ICPENDR0         0x0280
> +#define GICR_ISACTIVER0       0x0300
> +#define GICR_ICACTIVER0       0x0380
> +#define GICR_IPRIORITYR0      0x0400
> +#define GICR_ICFGR0           0x0C00
> +#define GICR_ICFGR1           0x0C04
> +#define GICR_IGRPMODR0        0x0D00
> +#define GICR_NSACR            0x0E00
> +
> +#define GICR_CTLR_ENABLE_LPIS        (1U << 0)
> +#define GICR_CTLR_RWP                (1U << 3)
> +#define GICR_CTLR_DPG0               (1U << 24)
> +#define GICR_CTLR_DPG1NS             (1U << 25)
> +#define GICR_CTLR_DPG1S              (1U << 26)
> +#define GICR_CTLR_UWP                (1U << 31)
> +
> +#define GICR_TYPER_PLPIS             (1U << 0)
> +#define GICR_TYPER_VLPIS             (1U << 1)
> +#define GICR_TYPER_DIRECTLPI         (1U << 3)
> +#define GICR_TYPER_LAST              (1U << 4)
> +#define GICR_TYPER_DPGS              (1U << 5)
> +#define GICR_TYPER_PROCNUM           (0xFFFFU << 8)
> +#define GICR_TYPER_COMMONLPIAFF      (0x3 << 24)
> +#define GICR_TYPER_AFFINITYVALUE     (0xFFFFFFFFULL << 32)
> +
> +#define GICR_WAKER_ProcessorSleep    (1U << 1)
> +#define GICR_WAKER_ChildrenAsleep    (1U << 2)
> +
> +#define GICR_PROPBASER_OUTER_CACHEABILITY_MASK (7ULL << 56)
> +#define GICR_PROPBASER_ADDR_MASK               (0xfffffffffULL << 12)
> +#define GICR_PROPBASER_SHAREABILITY_MASK       (3U << 10)
> +#define GICR_PROPBASER_CACHEABILITY_MASK       (7U << 7)
> +#define GICR_PROPBASER_IDBITS_MASK             (0x1f)
> +
> +#define GICR_PENDBASER_PTZ                     (1ULL << 62)
> +#define GICR_PENDBASER_OUTER_CACHEABILITY_MASK (7ULL << 56)
> +#define GICR_PENDBASER_ADDR_MASK               (0xffffffffULL << 16)
> +#define GICR_PENDBASER_SHAREABILITY_MASK       (3U << 10)
> +#define GICR_PENDBASER_CACHEABILITY_MASK       (7U << 7)
> +
> +#define ICC_CTLR_EL1_CBPR           (1U << 0)
> +#define ICC_CTLR_EL1_EOIMODE        (1U << 1)
> +#define ICC_CTLR_EL1_PMHE           (1U << 6)
> +#define ICC_CTLR_EL1_SEIS           (1U << 14)
> +#define ICC_CTLR_EL1_A3V            (1U << 15)
> +
> +#define ICC_PMR_PRIORITY_MASK    0xff
> +#define ICC_BPR_BINARYPOINT_MASK 0x07
> +#define ICC_IGRPEN_ENABLE        0x01
> +
> +#endif /* !QEMU_ARM_GIC_INTERNAL_H */
> diff --git a/include/hw/intc/arm_gicv3_common.h
> b/include/hw/intc/arm_gicv3_common.h
> index c2fd8da..84e9406 100644
> --- a/include/hw/intc/arm_gicv3_common.h
> +++ b/include/hw/intc/arm_gicv3_common.h
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
> @@ -26,7 +27,48 @@
>  #include "hw/sysbus.h"
>  #include "hw/intc/arm_gic_common.h"
>
> -typedef struct GICv3State {
> +/*
> + * Maximum number of possible interrupts, determined by the GIC
> architecture.
> + * Note that this does not include LPIs. When implemented, these should be
> + * dealt with separately.
> + */
> +#define GICV3_MAXIRQ 1020
> +#define GICV3_MAXSPI (GICV3_MAXIRQ - GIC_INTERNAL)
> +
> +#define GIC_MIN_BPR0 0
> +#define GIC_MIN_BPR1 (GIC_MIN_BPR0 + 1)
> +
> +struct GICv3CPUState {
> +    uint64_t affinity_id;            /* Cached affinity ID of the CPU */
> +
> +    /* Redistributor */
> +    uint32_t level;                  /* Current IRQ level */
> +    /* RD_base page registers */
> +    uint32_t gicr_ctlr;
> +    uint32_t gicr_waker;
> +    uint64_t gicr_propbaser;
> +    uint64_t gicr_pendbaser;
> +    /* SGI_base page registers */
> +    uint32_t gicr_igroupr0;
> +    uint32_t gicr_ienabler0;
> +    uint32_t gicr_ipendr0;
> +    uint32_t gicr_iactiver0;
> +    uint32_t gicr_icfgr0;
> +    uint32_t gicr_icfgr1;
> +    uint8_t gicr_ipriorityr[GIC_INTERNAL];
> +
> +    /* CPU interface */
> +    uint64_t icc_ctlr_el1[2];
> +    uint64_t icc_pmr_el1;
> +    uint64_t icc_bpr[2];
> +    uint64_t icc_ap1r[4][2];
> +    uint64_t icc_igrpen0_el1;
> +    uint64_t icc_igrpen1_el1;
> +};
> +
> +typedef struct GICv3CPUState GICv3CPUState;
> +
> +struct GICv3State {
>      /*< private >*/
>      SysBusDevice parent_obj;
>      /*< public >*/
> @@ -41,9 +83,61 @@ typedef struct GICv3State {
>      uint32_t num_irq;
>      uint32_t revision;
>      bool security_extn;
> +    bool irq_reset_nonsecure;
>
>      int dev_fd; /* kvm device fd if backed by kvm vgic support */
> -} GICv3State;
> +    Error *migration_blocker;
> +
> +    /* Distributor */
> +
> +    /* for a GIC with the security extensions the NS banked version of
> this
> +     * register is just an alias of bit 1 of the S banked version.
> +     */
> +    uint32_t gicd_ctlr;
> +    DECLARE_BITMAP(group, GICV3_MAXSPI);        /* GICD_IGROUPR */
> +    DECLARE_BITMAP(enabled, GICV3_MAXSPI);      /* GICD_ISENABLER */
> +    DECLARE_BITMAP(pending, GICV3_MAXSPI);      /* GICD_ISPENDR */
> +    DECLARE_BITMAP(active, GICV3_MAXSPI);       /* GICD_ISACTIVER */
> +    DECLARE_BITMAP(level, GICV3_MAXSPI);        /* Current level */
> +    DECLARE_BITMAP(edge_trigger, GICV3_MAXSPI); /* GICD_ICFGR */
> +    uint8_t gicd_ipriority[GICV3_MAXSPI];
> +    uint8_t gicd_itargetsr[GICV3_MAXSPI];
> +    uint64_t gicd_irouter[GICV3_MAXSPI];
> +
> +    GICv3CPUState *cpu;
> +};
> +
> +typedef struct GICv3State GICv3State;
> +
> +#define GICV3_BITMAP_ACCESSORS(BMP)                                     \
> +    static inline void gicv3_gicd_##BMP##_set(GICv3State *s, int irq)   \
> +    {                                                                   \
> +        set_bit(irq - GIC_INTERNAL, s->BMP);                            \
> +    }                                                                   \
> +    static inline int gicv3_gicd_##BMP##_test(GICv3State *s, int irq)   \
> +    {                                                                   \
> +        return test_bit(irq - GIC_INTERNAL, s->BMP);                    \
> +    }                                                                   \
> +    static inline void gicv3_gicd_##BMP##_clear(GICv3State *s, int irq) \
> +    {                                                                   \
> +        clear_bit(irq - GIC_INTERNAL, s->BMP);                          \
> +    }                                                                   \
> +    static inline void gicv3_gicd_##BMP##_replace(GICv3State *s,        \
> +                                                  int irq, int value)   \
> +    {                                                                   \
> +        if (value) {                                                    \
> +            gicv3_gicd_##BMP##_set(s, irq);                             \
> +        } else {                                                        \
> +            gicv3_gicd_##BMP##_clear(s, irq);                           \
> +        }                                                               \
> +    }
> +
> +GICV3_BITMAP_ACCESSORS(group)
> +GICV3_BITMAP_ACCESSORS(enabled)
> +GICV3_BITMAP_ACCESSORS(pending)
> +GICV3_BITMAP_ACCESSORS(active)
> +GICV3_BITMAP_ACCESSORS(level)
> +GICV3_BITMAP_ACCESSORS(edge_trigger)
>
>  #define TYPE_ARM_GICV3_COMMON "arm-gicv3-common"
>  #define ARM_GICV3_COMMON(obj) \
> @@ -65,4 +159,10 @@ typedef struct ARMGICv3CommonClass {
>  void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
>                                const MemoryRegionOps *ops);
>
> +/* Accessors for simulated system registers */
> +uint32_t gicv3_get_igrpen0(GICv3State *s, int cpuindex);
> +void gicv3_set_igrpen0(GICv3State *s, int cpuindex, uint32_t val);
> +uint32_t gicv3_get_igrpen1(GICv3State *s, int cpuindex);
> +void gicv3_set_igrpen1(GICv3State *s, int cpuindex, uint32_t val);
> +
>  #endif
> --
> 1.9.1
>
>
Hi,

I just wonder why the internal interrupts are excluded from the new
GICv3State and the new access API don't handle them?
Is it because they aren't required by KVM?
I see that they are only referenced in gicr_ipriority.

What am I missing?

Best regards,

S.P.

--089e01227b909a046a052c83835e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Monday, February 22, 2016, Peter Maydell &lt;<a href=3D"mailto:p=
eter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">From: Pavel Fedin &lt;<a href=3D"javascript:;" oncl=
ick=3D"_e(event, &#39;cvml&#39;, &#39;p.fedin@samsung.com&#39;)">p.fedin@sa=
msung.com</a>&gt;<br>
<br>
Add state information to GICv3 object structure and implement<br>
arm_gicv3_common_reset(). Also, add some functions for registers which are<=
br>
not stored directly but simulated.<br>
<br>
State information includes not only pure GICv3 data, but also some legacy<b=
r>
registers. This will be useful for implementing software emulation of GICv3=
<br>
with v2 backwards compatilibity mode.<br>
<br>
Signed-off-by: Pavel Fedin &lt;<a href=3D"javascript:;" onclick=3D"_e(event=
, &#39;cvml&#39;, &#39;p.fedin@samsung.com&#39;)">p.fedin@samsung.com</a>&g=
t;<br>
[PMM: significantly overhauled:<br>
=C2=A0* Add missing qom/cpu.h include<br>
=C2=A0* Remove legacy-only state fields (we can add them later if/when we a=
dd<br>
=C2=A0 =C2=A0legacy emulation)<br>
=C2=A0* Add various missing register offset #defines<br>
=C2=A0* Accessor macros removed entirely<br>
=C2=A0* Fields in state structures renamed to match architectural register =
names<br>
=C2=A0* Corrected the reset value for GICR_IENABLER0 since we don&#39;t sup=
port<br>
=C2=A0 =C2=A0legacy mode<br>
=C2=A0* Added ARM_LINUX_BOOT_IF interface for &quot;we are directly booting=
 a kernel in<br>
=C2=A0 =C2=A0non-secure&quot; so that we can fake up the firmware-mandated =
reconfiguration<br>
=C2=A0 =C2=A0only when we need it<br>
]<br>
Signed-off-by: Peter Maydell &lt;<a href=3D"javascript:;" onclick=3D"_e(eve=
nt, &#39;cvml&#39;, &#39;peter.maydell@linaro.org&#39;)">peter.maydell@lina=
ro.org</a>&gt;<br>
---<br>
=C2=A0hw/intc/arm_gicv3_common.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 116 +++=
+++++++++++++++++++++++++-<br>
=C2=A0hw/intc/gicv3_internal.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 14=
7 +++++++++++++++++++++++++++++++++++++<br>
=C2=A0include/hw/intc/arm_gicv3_common.h | 106 +++++++++++++++++++++++++-<b=
r>
=C2=A03 files changed, 364 insertions(+), 5 deletions(-)<br>
=C2=A0create mode 100644 hw/intc/gicv3_internal.h<br>
<br>
diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c<br>
index e4f0f5a..a1ce4c1 100644<br>
--- a/hw/intc/arm_gicv3_common.c<br>
+++ b/hw/intc/arm_gicv3_common.c<br>
@@ -3,8 +3,9 @@<br>
=C2=A0 *<br>
=C2=A0 * Copyright (c) 2012 Linaro Limited<br>
=C2=A0 * Copyright (c) 2015 Huawei.<br>
+ * Copyright (c) 2015 Samsung Electronics Co., Ltd.<br>
=C2=A0 * Written by Peter Maydell<br>
- * Extended to 64 cores by Shlomo Pongratz<br>
+ * Reworked for GICv3 by Shlomo Pongratz and Pavel Fedin<br>
=C2=A0 *<br>
=C2=A0 * This program is free software; you can redistribute it and/or modi=
fy<br>
=C2=A0 * it under the terms of the GNU General Public License as published =
by<br>
@@ -21,7 +22,10 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qom/cpu.h&quot;<br>
=C2=A0#include &quot;hw/intc/arm_gicv3_common.h&quot;<br>
+#include &quot;gicv3_internal.h&quot;<br>
+#include &quot;hw/arm/linux-boot-if.h&quot;<br>
<br>
=C2=A0static void gicv3_pre_save(void *opaque)<br>
=C2=A0{<br>
@@ -89,6 +93,8 @@ void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_han=
dler handler,<br>
=C2=A0static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)<=
br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0GICv3State *s =3D ARM_GICV3_COMMON(dev);<br>
+=C2=A0 =C2=A0 Object *cpu;<br>
+=C2=A0 =C2=A0 int i;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* revision property is actually reserved and currently=
 used only in order<br>
=C2=A0 =C2=A0 =C2=A0 * to keep the interface compatible with GICv2 code, av=
oiding extra<br>
@@ -99,11 +105,111 @@ static void arm_gicv3_common_realize(DeviceState *dev=
, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;unsupported GIC re=
vision %d&quot;, s-&gt;revision);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 if (s-&gt;num_irq &gt; GICV3_MAXIRQ) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
;requested %u interrupt lines exceeds GIC maximum %d&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt=
;num_irq, GICV3_MAXIRQ);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 s-&gt;cpu =3D g_new0(GICv3CPUState, s-&gt;num_cpu);<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; s-&gt;num_cpu; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu =3D OBJECT(qemu_get_cpu(i));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;cpu[i].affinity_id =3D object_property_g=
et_int(cpu, &quot;mp-affinity&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL);<br>
+=C2=A0 =C2=A0 }<br>
=C2=A0}<br>
<br>
=C2=A0static void arm_gicv3_common_reset(DeviceState *dev)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 /* TODO */<br>
+=C2=A0 =C2=A0 GICv3State *s =3D ARM_GICV3_COMMON(dev);<br>
+=C2=A0 =C2=A0 int i;<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; s-&gt;num_cpu; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 GICv3CPUState *c =3D &amp;s-&gt;cpu[i];<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 c-&gt;gicr_waker =3D GICR_WAKER_ProcessorSleep=
 | GICR_WAKER_ChildrenAsleep;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 c-&gt;gicr_ctlr =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 c-&gt;gicr_propbaser =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 c-&gt;gicr_pendbaser =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If we&#39;re resetting a TZ-aware GIC as if=
 secure firmware<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* had set it up ready to start a kernel =
in non-secure, we<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* need to set interrupts to group 1 so t=
he kernel can use them.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Otherwise they reset to group 0 like t=
he hardware.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;security_extn &amp;&amp; s-&gt;irq_r=
eset_nonsecure) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c-&gt;gicr_igroupr0 =3D 0xffffff=
ff;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c-&gt;gicr_igroupr0 =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 c-&gt;gicr_ienabler0 =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 c-&gt;gicr_ipendr0 =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 c-&gt;gicr_iactiver0 =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 c-&gt;gicr_icfgr0 =3D 0xaaaaaaaa;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 c-&gt;gicr_icfgr1 =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(c-&gt;gicr_ipriorityr, 0, sizeof(c-&gt;=
gicr_ipriorityr));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 c-&gt;level =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 c-&gt;icc_ctlr_el1[0] =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 c-&gt;icc_ctlr_el1[1] =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 c-&gt;icc_igrpen0_el1 =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 c-&gt;icc_igrpen1_el1 =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 c-&gt;icc_pmr_el1 =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 c-&gt;icc_bpr[0] =3D GIC_MIN_BPR0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 c-&gt;icc_bpr[1] =3D GIC_MIN_BPR1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(c-&gt;icc_ap1r, 0, sizeof(c-&gt;icc_ap1=
r));<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 memset(s-&gt;group, 0, sizeof(s-&gt;group));<br>
+=C2=A0 =C2=A0 memset(s-&gt;enabled, 0, sizeof(s-&gt;enabled));<br>
+=C2=A0 =C2=A0 memset(s-&gt;pending, 0, sizeof(s-&gt;pending));<br>
+=C2=A0 =C2=A0 memset(s-&gt;active, 0, sizeof(s-&gt;active));<br>
+=C2=A0 =C2=A0 memset(s-&gt;level, 0, sizeof(s-&gt;level));<br>
+=C2=A0 =C2=A0 memset(s-&gt;edge_trigger, 0, sizeof(s-&gt;edge_trigger));<b=
r>
+<br>
+=C2=A0 =C2=A0 /* Workaround! (the same as c-&gt;group above) */<br>
+=C2=A0 =C2=A0 for (i =3D GIC_INTERNAL; i &lt; s-&gt;num_irq; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 set_bit(i - GIC_INTERNAL, s-&gt;group);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* By default all interrupts always target CPU #0 */<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; GICV3_MAXSPI; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;gicd_itargetsr[i] =3D 1;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 memset(s-&gt;gicd_irouter, 0, sizeof(s-&gt;gicd_irouter));<b=
r>
+=C2=A0 =C2=A0 memset(s-&gt;gicd_ipriority, 0, sizeof(s-&gt;gicd_ipriority)=
);<br>
+<br>
+=C2=A0 =C2=A0 /* With all configuration we don&#39;t support GICv2 backwar=
ds computability */<br>
+=C2=A0 =C2=A0 if (s-&gt;security_extn) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* GICv3 5.3.20 With two security So DS is RAZ=
/WI ARE_NS is RAO/WI<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* and ARE_S is RAO/WI<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;gicd_ctlr =3D GICD_CTLR_ARE_S | GI=
CD_CTLR_ARE_NS;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* GICv3 5.3.20 With one security So DS is RAO=
/WI ARE is RAO/WI<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;gicd_ctlr =3D GICD_CTLR_DS | GICD_CTLR_A=
RE;<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void arm_gic_common_linux_init(ARMLinuxBootIf *obj,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool secure_boo=
t)<br>
+{<br>
+=C2=A0 =C2=A0 GICState *s =3D ARM_GIC_COMMON(obj);<br>
+<br>
+=C2=A0 =C2=A0 if (s-&gt;security_extn &amp;&amp; !secure_boot) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* We&#39;re directly booting a kernel into No=
nSecure. If this GIC<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* implements the security extensions the=
n we must configure it<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* to have all the interrupts be NonSecur=
e (this is a job that<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* is done by the Secure boot firmware in=
 real hardware, and in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* this mode QEMU is acting as a minimali=
st firmware-and-bootloader<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* equivalent).<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;irq_reset_nonsecure =3D true;<br>
+=C2=A0 =C2=A0 }<br>
=C2=A0}<br>
<br>
=C2=A0static Property arm_gicv3_common_properties[] =3D {<br>
@@ -117,11 +223,13 @@ static Property arm_gicv3_common_properties[] =3D {<b=
r>
=C2=A0static void arm_gicv3_common_class_init(ObjectClass *klass, void *dat=
a)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
+=C2=A0 =C2=A0 ARMLinuxBootIfClass *albifc =3D ARM_LINUX_BOOT_IF_CLASS(klas=
s);<br>
<br>
=C2=A0 =C2=A0 =C2=A0dc-&gt;reset =3D arm_gicv3_common_reset;<br>
=C2=A0 =C2=A0 =C2=A0dc-&gt;realize =3D arm_gicv3_common_realize;<br>
=C2=A0 =C2=A0 =C2=A0dc-&gt;props =3D arm_gicv3_common_properties;<br>
=C2=A0 =C2=A0 =C2=A0dc-&gt;vmsd =3D &amp;vmstate_gicv3;<br>
+=C2=A0 =C2=A0 albifc-&gt;arm_linux_init =3D arm_gic_common_linux_init;<br>
=C2=A0}<br>
<br>
=C2=A0static const TypeInfo arm_gicv3_common_type =3D {<br>
@@ -131,6 +239,10 @@ static const TypeInfo arm_gicv3_common_type =3D {<br>
=C2=A0 =C2=A0 =C2=A0.class_size =3D sizeof(ARMGICv3CommonClass),<br>
=C2=A0 =C2=A0 =C2=A0.class_init =3D arm_gicv3_common_class_init,<br>
=C2=A0 =C2=A0 =C2=A0.abstract =3D true,<br>
+=C2=A0 =C2=A0 .interfaces =3D (InterfaceInfo []) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 { TYPE_ARM_LINUX_BOOT_IF },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 { },<br>
+=C2=A0 =C2=A0 },<br>
=C2=A0};<br>
<br>
=C2=A0static void register_types(void)<br>
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h<br>
new file mode 100644<br>
index 0000000..9f9a45e<br>
--- /dev/null<br>
+++ b/hw/intc/gicv3_internal.h<br>
@@ -0,0 +1,147 @@<br>
+/*<br>
+ * ARM GICv3 support - internal interfaces<br>
+ *<br>
+ * Copyright (c) 2012 Linaro Limited<br>
+ * Copyright (c) 2015 Huawei.<br>
+ * Copyright (c) 2015 Samsung Electronics Co., Ltd.<br>
+ * Written by Peter Maydell<br>
+ * Reworked for GICv3 by Shlomo Pongratz and Pavel Fedin<br>
+ *<br>
+ * This program is free software; you can redistribute it and/or modify<br=
>
+ * it under the terms of the GNU General Public License as published by<br=
>
+ * the Free Software Foundation, either version 2 of the License, or<br>
+ * (at your option) any later version.<br>
+ *<br>
+ * This program is distributed in the hope that it will be useful,<br>
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the<br>
+ * GNU General Public License for more details.<br>
+ *<br>
+ * You should have received a copy of the GNU General Public License along=
<br>
+ * with this program; if not, see &lt;<a href=3D"http://www.gnu.org/licens=
es/" target=3D"_blank">http://www.gnu.org/licenses/</a>&gt;.<br>
+ */<br>
+<br>
+#ifndef QEMU_ARM_GICV3_INTERNAL_H<br>
+#define QEMU_ARM_GICV3_INTERNAL_H<br>
+<br>
+#include &quot;hw/intc/arm_gicv3_common.h&quot;<br>
+<br>
+/* Distributor registers, as offsets from the distributor base address */<=
br>
+#define GICD_CTLR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0000<br>
+#define GICD_TYPER=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0004<br>
+#define GICD_IIDR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0008<br>
+#define GICD_STATUSR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0010<br>
+#define GICD_SETSPI_NSR=C2=A0 =C2=A0 =C2=A0 0x0040<br>
+#define GICD_CLRSPI_NSR=C2=A0 =C2=A0 =C2=A0 0x0048<br>
+#define GICD_SETSPI_SR=C2=A0 =C2=A0 =C2=A0 =C2=A00x0050<br>
+#define GICD_CLRSPI_SR=C2=A0 =C2=A0 =C2=A0 =C2=A00x0058<br>
+#define GICD_SEIR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0068<br>
+#define GICD_IGROUPR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0080<br>
+#define GICD_ISENABLER=C2=A0 =C2=A0 =C2=A0 =C2=A00x0100<br>
+#define GICD_ICENABLER=C2=A0 =C2=A0 =C2=A0 =C2=A00x0180<br>
+#define GICD_ISPENDR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0200<br>
+#define GICD_ICPENDR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0280<br>
+#define GICD_ISACTIVER=C2=A0 =C2=A0 =C2=A0 =C2=A00x0300<br>
+#define GICD_ICACTIVER=C2=A0 =C2=A0 =C2=A0 =C2=A00x0380<br>
+#define GICD_IPRIORITYR=C2=A0 =C2=A0 =C2=A0 0x0400<br>
+#define GICD_ITARGETSR=C2=A0 =C2=A0 =C2=A0 =C2=A00x0800<br>
+#define GICD_ICFGR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0C00<br>
+#define GICD_IGRPMODR=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0D00<br>
+#define GICD_NASCR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0E00<br>
+#define GICD_SGIR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0F00<br>
+#define GICD_CPENDSGIR=C2=A0 =C2=A0 =C2=A0 =C2=A00x0F10<br>
+#define GICD_SPENDSGIR=C2=A0 =C2=A0 =C2=A0 =C2=A00x0F20<br>
+#define GICD_IROUTER=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x6000<br>
+#define GICD_PIDR2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xFFE8<br>
+<br>
+/* GICD_CTLR fields=C2=A0 */<br>
+#define GICD_CTLR_EN_GRP0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1U &lt;=
&lt; 0)<br>
+#define GICD_CTLR_EN_GRP1NS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1U &lt;&lt; =
1) /* GICv3 5.3.20 */<br>
+#define GICD_CTLR_EN_GRP1S=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1U &lt;&lt; =
2)<br>
+#define GICD_CTLR_EN_GRP1_ALL=C2=A0 =C2=A0 =C2=A0 =C2=A0(GICD_CTLR_EN_GRP1=
NS | GICD_CTLR_EN_GRP1S)<br>
+/* Bit 4 is ARE if the system doesn&#39;t support TrustZone, ARE_S otherwi=
se */<br>
+#define GICD_CTLR_ARE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(1U &lt;&lt; 4)<br>
+#define GICD_CTLR_ARE_S=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1U=
 &lt;&lt; 4)<br>
+#define GICD_CTLR_ARE_NS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1U &lt;=
&lt; 5)<br>
+#define GICD_CTLR_DS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (1U &lt;&lt; 6)<br>
+#define GICD_CTLR_E1NWF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1U=
 &lt;&lt; 7)<br>
+#define GICD_CTLR_RWP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(1U &lt;&lt; 31)<br>
+<br>
+/*<br>
+ * Redistributor frame offsets from RD_base<br>
+ */<br>
+#define GICR_SGI_OFFSET 0x10000<br>
+<br>
+/*<br>
+ * Redistributor registers, offsets from RD_base<br>
+ */<br>
+#define GICR_CTLR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0000<br=
>
+#define GICR_IIDR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0004<br=
>
+#define GICR_TYPER=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0008<br>
+#define GICR_STATUSR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0010<br>
+#define GICR_WAKER=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0014<br>
+#define GICR_SETLPIR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0040<br>
+#define GICR_CLRLPIR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0048<br>
+#define GICR_PROPBASER=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0070<br>
+#define GICR_PENDBASER=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0078<br>
+#define GICR_INVLPIR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x00A0<br>
+#define GICR_INVALLR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x00B0<br>
+#define GICR_SYNCR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x00C0<br>
+#define GICR_PIDR2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0xFFE8<br>
+<br>
+/* SGI and PPI Redistributor registers, offsets from SGI_base */<br>
+#define GICR_IGROUPR0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0080<br>
+#define GICR_ISENABLER0=C2=A0 =C2=A0 =C2=A0 =C2=A00x0100<br>
+#define GICR_ICENABLER0=C2=A0 =C2=A0 =C2=A0 =C2=A00x0180<br>
+#define GICR_ISPENDR0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0200<br>
+#define GICR_ICPENDR0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0280<br>
+#define GICR_ISACTIVER0=C2=A0 =C2=A0 =C2=A0 =C2=A00x0300<br>
+#define GICR_ICACTIVER0=C2=A0 =C2=A0 =C2=A0 =C2=A00x0380<br>
+#define GICR_IPRIORITYR0=C2=A0 =C2=A0 =C2=A0 0x0400<br>
+#define GICR_ICFGR0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0C00<br>
+#define GICR_ICFGR1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0C04<br>
+#define GICR_IGRPMODR0=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0D00<br>
+#define GICR_NSACR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0E00<br>
+<br>
+#define GICR_CTLR_ENABLE_LPIS=C2=A0 =C2=A0 =C2=A0 =C2=A0 (1U &lt;&lt; 0)<b=
r>
+#define GICR_CTLR_RWP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (1U &lt;&lt; 3)<br>
+#define GICR_CTLR_DPG0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(1U &lt;&lt; 24)<br>
+#define GICR_CTLR_DPG1NS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1=
U &lt;&lt; 25)<br>
+#define GICR_CTLR_DPG1S=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1=
U &lt;&lt; 26)<br>
+#define GICR_CTLR_UWP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (1U &lt;&lt; 31)<br>
+<br>
+#define GICR_TYPER_PLPIS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1=
U &lt;&lt; 0)<br>
+#define GICR_TYPER_VLPIS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1=
U &lt;&lt; 1)<br>
+#define GICR_TYPER_DIRECTLPI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1U &lt;&lt;=
 3)<br>
+#define GICR_TYPER_LAST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1=
U &lt;&lt; 4)<br>
+#define GICR_TYPER_DPGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1=
U &lt;&lt; 5)<br>
+#define GICR_TYPER_PROCNUM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0xFFFF=
U &lt;&lt; 8)<br>
+#define GICR_TYPER_COMMONLPIAFF=C2=A0 =C2=A0 =C2=A0 (0x3 &lt;&lt; 24)<br>
+#define GICR_TYPER_AFFINITYVALUE=C2=A0 =C2=A0 =C2=A0(0xFFFFFFFFULL &lt;&lt=
; 32)<br>
+<br>
+#define GICR_WAKER_ProcessorSleep=C2=A0 =C2=A0 (1U &lt;&lt; 1)<br>
+#define GICR_WAKER_ChildrenAsleep=C2=A0 =C2=A0 (1U &lt;&lt; 2)<br>
+<br>
+#define GICR_PROPBASER_OUTER_CACHEABILITY_MASK (7ULL &lt;&lt; 56)<br>
+#define GICR_PROPBASER_ADDR_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0(0xfffffffffULL &lt;&lt; 12)<br>
+#define GICR_PROPBASER_SHAREABILITY_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0(3U &lt=
;&lt; 10)<br>
+#define GICR_PROPBASER_CACHEABILITY_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0(7U &lt=
;&lt; 7)<br>
+#define GICR_PROPBASER_IDBITS_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(0x1f)<br>
+<br>
+#define GICR_PENDBASER_PTZ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1ULL &lt;&lt; 62)<br>
+#define GICR_PENDBASER_OUTER_CACHEABILITY_MASK (7ULL &lt;&lt; 56)<br>
+#define GICR_PENDBASER_ADDR_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0(0xffffffffULL &lt;&lt; 16)<br>
+#define GICR_PENDBASER_SHAREABILITY_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0(3U &lt=
;&lt; 10)<br>
+#define GICR_PENDBASER_CACHEABILITY_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0(7U &lt=
;&lt; 7)<br>
+<br>
+#define ICC_CTLR_EL1_CBPR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1U &lt;=
&lt; 0)<br>
+#define ICC_CTLR_EL1_EOIMODE=C2=A0 =C2=A0 =C2=A0 =C2=A0 (1U &lt;&lt; 1)<br=
>
+#define ICC_CTLR_EL1_PMHE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1U &lt;=
&lt; 6)<br>
+#define ICC_CTLR_EL1_SEIS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1U &lt;=
&lt; 14)<br>
+#define ICC_CTLR_EL1_A3V=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1U &lt;=
&lt; 15)<br>
+<br>
+#define ICC_PMR_PRIORITY_MASK=C2=A0 =C2=A0 0xff<br>
+#define ICC_BPR_BINARYPOINT_MASK 0x07<br>
+#define ICC_IGRPEN_ENABLE=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01<br>
+<br>
+#endif /* !QEMU_ARM_GIC_INTERNAL_H */<br>
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3=
_common.h<br>
index c2fd8da..84e9406 100644<br>
--- a/include/hw/intc/arm_gicv3_common.h<br>
+++ b/include/hw/intc/arm_gicv3_common.h<br>
@@ -3,8 +3,9 @@<br>
=C2=A0 *<br>
=C2=A0 * Copyright (c) 2012 Linaro Limited<br>
=C2=A0 * Copyright (c) 2015 Huawei.<br>
+ * Copyright (c) 2015 Samsung Electronics Co., Ltd.<br>
=C2=A0 * Written by Peter Maydell<br>
- * Extended to 64 cores by Shlomo Pongratz<br>
+ * Reworked for GICv3 by Shlomo Pongratz and Pavel Fedin<br>
=C2=A0 *<br>
=C2=A0 * This program is free software; you can redistribute it and/or modi=
fy<br>
=C2=A0 * it under the terms of the GNU General Public License as published =
by<br>
@@ -26,7 +27,48 @@<br>
=C2=A0#include &quot;hw/sysbus.h&quot;<br>
=C2=A0#include &quot;hw/intc/arm_gic_common.h&quot;<br>
<br>
-typedef struct GICv3State {<br>
+/*<br>
+ * Maximum number of possible interrupts, determined by the GIC architectu=
re.<br>
+ * Note that this does not include LPIs. When implemented, these should be=
<br>
+ * dealt with separately.<br>
+ */<br>
+#define GICV3_MAXIRQ 1020<br>
+#define GICV3_MAXSPI (GICV3_MAXIRQ - GIC_INTERNAL)<br>
+<br>
+#define GIC_MIN_BPR0 0<br>
+#define GIC_MIN_BPR1 (GIC_MIN_BPR0 + 1)<br>
+<br>
+struct GICv3CPUState {<br>
+=C2=A0 =C2=A0 uint64_t affinity_id;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* Cached affinity ID of the CPU */<br>
+<br>
+=C2=A0 =C2=A0 /* Redistributor */<br>
+=C2=A0 =C2=A0 uint32_t level;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 /* Current IRQ level */<br>
+=C2=A0 =C2=A0 /* RD_base page registers */<br>
+=C2=A0 =C2=A0 uint32_t gicr_ctlr;<br>
+=C2=A0 =C2=A0 uint32_t gicr_waker;<br>
+=C2=A0 =C2=A0 uint64_t gicr_propbaser;<br>
+=C2=A0 =C2=A0 uint64_t gicr_pendbaser;<br>
+=C2=A0 =C2=A0 /* SGI_base page registers */<br>
+=C2=A0 =C2=A0 uint32_t gicr_igroupr0;<br>
+=C2=A0 =C2=A0 uint32_t gicr_ienabler0;<br>
+=C2=A0 =C2=A0 uint32_t gicr_ipendr0;<br>
+=C2=A0 =C2=A0 uint32_t gicr_iactiver0;<br>
+=C2=A0 =C2=A0 uint32_t gicr_icfgr0;<br>
+=C2=A0 =C2=A0 uint32_t gicr_icfgr1;<br>
+=C2=A0 =C2=A0 uint8_t gicr_ipriorityr[GIC_INTERNAL];<br>
+<br>
+=C2=A0 =C2=A0 /* CPU interface */<br>
+=C2=A0 =C2=A0 uint64_t icc_ctlr_el1[2];<br>
+=C2=A0 =C2=A0 uint64_t icc_pmr_el1;<br>
+=C2=A0 =C2=A0 uint64_t icc_bpr[2];<br>
+=C2=A0 =C2=A0 uint64_t icc_ap1r[4][2];<br>
+=C2=A0 =C2=A0 uint64_t icc_igrpen0_el1;<br>
+=C2=A0 =C2=A0 uint64_t icc_igrpen1_el1;<br>
+};<br>
+<br>
+typedef struct GICv3CPUState GICv3CPUState;<br>
+<br>
+struct GICv3State {<br>
=C2=A0 =C2=A0 =C2=A0/*&lt; private &gt;*/<br>
=C2=A0 =C2=A0 =C2=A0SysBusDevice parent_obj;<br>
=C2=A0 =C2=A0 =C2=A0/*&lt; public &gt;*/<br>
@@ -41,9 +83,61 @@ typedef struct GICv3State {<br>
=C2=A0 =C2=A0 =C2=A0uint32_t num_irq;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t revision;<br>
=C2=A0 =C2=A0 =C2=A0bool security_extn;<br>
+=C2=A0 =C2=A0 bool irq_reset_nonsecure;<br>
<br>
=C2=A0 =C2=A0 =C2=A0int dev_fd; /* kvm device fd if backed by kvm vgic supp=
ort */<br>
-} GICv3State;<br>
+=C2=A0 =C2=A0 Error *migration_blocker;<br>
+<br>
+=C2=A0 =C2=A0 /* Distributor */<br>
+<br>
+=C2=A0 =C2=A0 /* for a GIC with the security extensions the NS banked vers=
ion of this<br>
+=C2=A0 =C2=A0 =C2=A0* register is just an alias of bit 1 of the S banked v=
ersion.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 uint32_t gicd_ctlr;<br>
+=C2=A0 =C2=A0 DECLARE_BITMAP(group, GICV3_MAXSPI);=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* GICD_IGROUPR */<br>
+=C2=A0 =C2=A0 DECLARE_BITMAP(enabled, GICV3_MAXSPI);=C2=A0 =C2=A0 =C2=A0 /=
* GICD_ISENABLER */<br>
+=C2=A0 =C2=A0 DECLARE_BITMAP(pending, GICV3_MAXSPI);=C2=A0 =C2=A0 =C2=A0 /=
* GICD_ISPENDR */<br>
+=C2=A0 =C2=A0 DECLARE_BITMAP(active, GICV3_MAXSPI);=C2=A0 =C2=A0 =C2=A0 =
=C2=A0/* GICD_ISACTIVER */<br>
+=C2=A0 =C2=A0 DECLARE_BITMAP(level, GICV3_MAXSPI);=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* Current level */<br>
+=C2=A0 =C2=A0 DECLARE_BITMAP(edge_trigger, GICV3_MAXSPI); /* GICD_ICFGR */=
<br>
+=C2=A0 =C2=A0 uint8_t gicd_ipriority[GICV3_MAXSPI];<br>
+=C2=A0 =C2=A0 uint8_t gicd_itargetsr[GICV3_MAXSPI];<br>
+=C2=A0 =C2=A0 uint64_t gicd_irouter[GICV3_MAXSPI];<br>
+<br>
+=C2=A0 =C2=A0 GICv3CPUState *cpu;<br>
+};<br>
+<br>
+typedef struct GICv3State GICv3State;<br>
+<br>
+#define GICV3_BITMAP_ACCESSORS(BMP)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 static inline void gicv3_gicd_##BMP##_set(GICv3State *s, int=
 irq)=C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 set_bit(irq - GIC_INTERNAL, s-&gt;BMP);=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 }=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 static inline int gicv3_gicd_##BMP##_test(GICv3State *s, int=
 irq)=C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return test_bit(irq - GIC_INTERNAL, s-&gt;BMP)=
;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br=
>
+=C2=A0 =C2=A0 }=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 static inline void gicv3_gicd_##BMP##_clear(GICv3State *s, i=
nt irq) \<br>
+=C2=A0 =C2=A0 {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 clear_bit(irq - GIC_INTERNAL, s-&gt;BMP);=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 }=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 static inline void gicv3_gicd_##BMP##_replace(GICv3State *s,=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int irq, int value)=C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (value) {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gicv3_gicd_##BMP##_set(s, irq);=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gicv3_gicd_##BMP##_clear(s, irq)=
;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+GICV3_BITMAP_ACCESSORS(group)<br>
+GICV3_BITMAP_ACCESSORS(enabled)<br>
+GICV3_BITMAP_ACCESSORS(pending)<br>
+GICV3_BITMAP_ACCESSORS(active)<br>
+GICV3_BITMAP_ACCESSORS(level)<br>
+GICV3_BITMAP_ACCESSORS(edge_trigger)<br>
<br>
=C2=A0#define TYPE_ARM_GICV3_COMMON &quot;arm-gicv3-common&quot;<br>
=C2=A0#define ARM_GICV3_COMMON(obj) \<br>
@@ -65,4 +159,10 @@ typedef struct ARMGICv3CommonClass {<br>
=C2=A0void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const MemoryRegionOps *ops);<br>
<br>
+/* Accessors for simulated system registers */<br>
+uint32_t gicv3_get_igrpen0(GICv3State *s, int cpuindex);<br>
+void gicv3_set_igrpen0(GICv3State *s, int cpuindex, uint32_t val);<br>
+uint32_t gicv3_get_igrpen1(GICv3State *s, int cpuindex);<br>
+void gicv3_set_igrpen1(GICv3State *s, int cpuindex, uint32_t val);<br>
+<br>
=C2=A0#endif<br>
--<br>
1.9.1<br>
<br></blockquote><div><br></div><div>Hi,</div><div><br></div><div>I just wo=
nder why the internal interrupts are excluded from the new GICv3State and t=
he new access API don&#39;t handle them?</div><div>Is it because they aren&=
#39;t required by KVM?</div><div>I see that they are only referenced in gic=
r_ipriority.</div><div><br></div><div>What am I missing?</div><div><br></di=
v><div>Best regards,</div><div><br></div><div>S.P.</div>

--089e01227b909a046a052c83835e--
