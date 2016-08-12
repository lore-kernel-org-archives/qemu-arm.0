Received: by 10.25.21.156 with SMTP id 28csp190204lfv;
        Fri, 12 Aug 2016 07:35:34 -0700 (PDT)
X-Received: by 10.55.126.195 with SMTP id z186mr11907145qkc.76.1471012534724;
        Fri, 12 Aug 2016 07:35:34 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p8si3430979qkp.326.2016.08.12.07.35.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Aug 2016 07:35:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52472 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bYDYb-0008MC-Rg
	for alex.bennee@linaro.org; Fri, 12 Aug 2016 10:35:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45418)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bYDPt-0000wB-Ak
	for qemu-arm@nongnu.org; Fri, 12 Aug 2016 10:26:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bYDPd-0007d0-Ul
	for qemu-arm@nongnu.org; Fri, 12 Aug 2016 10:26:32 -0400
Received: from mail-ua0-x22c.google.com ([2607:f8b0:400c:c08::22c]:36742)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bYDPd-0007cQ-N6
	for qemu-arm@nongnu.org; Fri, 12 Aug 2016 10:26:17 -0400
Received: by mail-ua0-x22c.google.com with SMTP id 97so44105690uav.3
	for <qemu-arm@nongnu.org>; Fri, 12 Aug 2016 07:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=61E4UjtM1wgAybplOYyfYz/it975mh9fmb/a/qunBbo=;
	b=aZ87bgQaMLRCbVrezqr1k9BCBSf9/kGwElYpz3u60tcZsSFLm6c71pjsZyClT9zHc7
	nl4KmH6UrnS4IE/BoU48IFuXEMr2brG+j87H6mqUOMWPBO4FAH03keDwqCFjnluIk4R5
	KQjRr2jMMNmjKLeKIaAt/N2lTZPSqtpTtC4p8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=61E4UjtM1wgAybplOYyfYz/it975mh9fmb/a/qunBbo=;
	b=O2Id+r1c4M8Cpttc7iLX+IO/ug3vDMVU5DYNXmE2NXnSpXLWiZmas9FaFp1SrdXZaW
	SWK5b28Oo9LhqY3MCw63Sy2EldvoW9BfqVcHMlQpGrAhGrtDwlWdk4ZIsv+mz/vY7aEB
	6Fc7oewj/sZ4xOcn1EKY4cf11lFkrg4XYn9vC7pIlQBJ1+9PpRiGWJrcQRswbkxPZ18E
	nAqsZHhQHI2QUBsnkQGk+0yMhrIpkHwBnzJp/FFe9GSqDA8nU7/SgZHNMTQCxnjp6N+G
	lOknwQOwdiACuLZF55oBX8vnyHdmiGX3/XULkAR+QWM75tlokim2Y7ya/1uzl5wW+dyh
	memA==
X-Gm-Message-State: AEkoouurJEcwuNnOGQEYBAcRLZPPuLcwzDY6PerVo+Eblue/kBXQl0HY3TSTWuLmsWXiJ1YJccyQRRQD/TL0K51l
X-Received: by 10.31.21.201 with SMTP id 192mr3878659vkv.6.1471010649207; Fri,
	12 Aug 2016 07:04:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.9.149 with HTTP; Fri, 12 Aug 2016 07:03:48 -0700 (PDT)
In-Reply-To: <1470161247-10251-6-git-send-email-eric.auger@redhat.com>
References: <1470161247-10251-1-git-send-email-eric.auger@redhat.com>
	<1470161247-10251-6-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Aug 2016 15:03:48 +0100
Message-ID: <CAFEAcA8g+TjvG5zhwoijkx941bMHodkNHktHV6VM6afnCmCFTw@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22c
Subject: Re: [Qemu-arm] [RFC v5 5/7] hw/intc/arm_gicv3_its: Implement
 support for in-kernel ITS emulation
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
Cc: Andrew Jones <drjones@redhat.com>, Tomasz Nowicki <tn@semihalf.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Diana Craciun <diana.craciun@freescale.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iAa+DsRtjWoY

On 2 August 2016 at 19:07, Eric Auger <eric.auger@redhat.com> wrote:
> From: Pavel Fedin <p.fedin@samsung.com>
>
> The ITS control frame is in-kernel emulated while accesses to the
> GITS_TRANSLATER are mediated through the KVM_SIGNAL_MSI ioctl (MSI
> direct MSI injection advertised by the CAP_SIGNAL_MSI capability)
>
> the kvm_gsi_direct_mapping is explicitly set to false to emphasize the
> difference with GICv2M. Direct mapping cannot work with ITS since
> the content of the MSI data is not the target interrupt ID but an
> eventd id.
>
> GSI routing is advertised (kvm_gsi_routing_allowed) as well as
> msi/irqfd signaling (kvm_msi_via_irqfd_allowed).
>
> Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
>
> v3 -> v4:
> - include "qemu/osdep.h" and  "qapi/error.h"
> - rename KVM_VGIC_V3_ADDR_TYPE_ITS into KVM_VGIC_ITS_ADDR_TYPE
> - reword commit message
> - change kvm_msi_via_irqfd_allowed definition (attached to irqfd dynamic
>   availability + MSI controller availability)
> - create the ITS KVM device (previously abstracted by the GICv3 KVM device)
> - init sequence changed
> - absolute GITS_TRANSLATER GPA stored
> ---
>  hw/intc/Makefile.objs       |   1 +
>  hw/intc/arm_gicv3_its_kvm.c | 145 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 146 insertions(+)
>  create mode 100644 hw/intc/arm_gicv3_its_kvm.c
>
> diff --git a/hw/intc/Makefile.objs b/hw/intc/Makefile.objs
> index 23a39f7..9cca280 100644
> --- a/hw/intc/Makefile.objs
> +++ b/hw/intc/Makefile.objs
> @@ -22,6 +22,7 @@ common-obj-$(CONFIG_OPENPIC) += openpic.o
>  obj-$(CONFIG_APIC) += apic.o apic_common.o
>  obj-$(CONFIG_ARM_GIC_KVM) += arm_gic_kvm.o
>  obj-$(call land,$(CONFIG_ARM_GIC_KVM),$(TARGET_AARCH64)) += arm_gicv3_kvm.o
> +obj-$(call land,$(CONFIG_ARM_GIC_KVM),$(TARGET_AARCH64)) += arm_gicv3_its_kvm.o
>  obj-$(CONFIG_STELLARIS) += armv7m_nvic.o
>  obj-$(CONFIG_EXYNOS4) += exynos4210_gic.o exynos4210_combiner.o
>  obj-$(CONFIG_GRLIB) += grlib_irqmp.o
> diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
> new file mode 100644
> index 0000000..b6d92aa
> --- /dev/null
> +++ b/hw/intc/arm_gicv3_its_kvm.c
> @@ -0,0 +1,145 @@
> +/*
> + * KVM-based ITS implementation for a GICv3-based system
> + *
> + * Copyright (c) 2015 Samsung Electronics Co., Ltd.
> + * Written by Pavel Fedin <p.fedin@samsung.com>
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "hw/intc/arm_gicv3_its_common.h"
> +#include "sysemu/sysemu.h"
> +#include "sysemu/kvm.h"
> +#include "kvm_arm.h"
> +
> +#define TYPE_KVM_ARM_ITS "arm-its-kvm"
> +#define KVM_ARM_ITS(obj) OBJECT_CHECK(GICv3ITSState, (obj), TYPE_KVM_ARM_ITS)
> +
> +static int kvm_its_send_msi(GICv3ITSState *s, uint32_t value, uint16_t devid)
> +{
> +    struct kvm_msi msi;
> +
> +    msi.address_lo = s->gits_translater_gpa & 0xFFFFFFFFULL;
> +    msi.address_hi = s->gits_translater_gpa >> 32;

extract64() might be preferable?

> +    msi.data = value;
> +    msi.flags = KVM_MSI_VALID_DEVID;
> +    msi.devid = devid;
> +    memset(msi.pad, 0, sizeof(msi.pad));
> +
> +    return kvm_vm_ioctl(kvm_state, KVM_SIGNAL_MSI, &msi);
> +}
> +
> +typedef struct ItsInitNotifierParams {
> +    Notifier notifier;
> +    GICv3ITSState *s;
> +} ItsInitNotifierParams;
> +
> +/**
> + *
> + * We currently do not use kvm_arm_register_device to provide
> + * the kernel with the vITS control frame base address since the
> + * KVM_DEV_ARM_VGIC_CTRL_INIT init MUST be called after the
> + * KVM_ARM_SET_DEVICE_ADDR and the kvm_arm_register_device
> + * infra does not allow this.
> + */

I thought we'd fixed the kernel API so we didn't need to
have this workaround?

> +static void its_notify(Notifier *notifier, void *data)
> +{
> +    ItsInitNotifierParams *p = DO_UPCAST(ItsInitNotifierParams,
> +                                         notifier, notifier);
> +    GICv3ITSState *s = p->s;
> +    MemoryRegion *mr = &s->iomem_its_cntrl;
> +    MemoryRegionSection mrs;
> +    struct kvm_device_attr attr;
> +    uint64_t addr;
> +    int ret;
> +
> +    mrs = memory_region_find(mr, 0, 1);
> +    addr = mrs.offset_within_address_space;
> +
> +    attr.flags = 0;
> +    attr.group = KVM_DEV_ARM_VGIC_GRP_ADDR;
> +    attr.attr = KVM_VGIC_ITS_ADDR_TYPE;
> +    attr.addr =  (uintptr_t)&addr;
> +
> +    s->gits_translater_gpa = addr + ITS_CONTROL_SIZE + 0x40;
> +
> +    ret = kvm_device_ioctl(s->dev_fd, KVM_SET_DEVICE_ATTR, attr);
> +    if (ret) {
> +        error_setg_errno(&error_fatal, -ret,
> +                         "not able to set base address for vITS ctrl frame");
> +    }
> +
> +    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
> +                      KVM_DEV_ARM_VGIC_CTRL_INIT, NULL, true);
> +}

thanks
-- PMM
