Received: by 10.80.163.71 with SMTP id 65csp49428edn;
        Thu, 22 Sep 2016 08:34:44 -0700 (PDT)
X-Received: by 10.200.56.250 with SMTP id g55mr2716225qtc.140.1474558484884;
        Thu, 22 Sep 2016 08:34:44 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id q8si1485089qtb.102.2016.09.22.08.34.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Sep 2016 08:34:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50810 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bn61L-0002vy-Qi
	for alex.bennee@linaro.org; Thu, 22 Sep 2016 11:34:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48993)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bn5XY-0003q8-Vf
	for qemu-arm@nongnu.org; Thu, 22 Sep 2016 11:04:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bn5XT-00031p-4p
	for qemu-arm@nongnu.org; Thu, 22 Sep 2016 11:03:56 -0400
Received: from mail-ua0-x22f.google.com ([2607:f8b0:400c:c08::22f]:34078)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bn5XS-00031d-Vc
	for qemu-arm@nongnu.org; Thu, 22 Sep 2016 11:03:51 -0400
Received: by mail-ua0-x22f.google.com with SMTP id q42so2144237uaq.1
	for <qemu-arm@nongnu.org>; Thu, 22 Sep 2016 08:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tpHqkLthmSKBQVkgS9JLDJcFcN3Pdq0f6Wu66o/8tvc=;
	b=i+jPahYLApheWZQypdgCt57REnOhrUiSRBQ9HBY7SCXHshjOnmyPwbBZGMYdpzJwQr
	Bw9w1zYddg20fq5jTQr8ndUdj5d8AjP/UrjMFp+rcG2qgF7/3RbXbWdMKy1EBSnV/ayW
	HfW4KzQWB9ffyfycL3gln219lg1T2BWSuDN5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tpHqkLthmSKBQVkgS9JLDJcFcN3Pdq0f6Wu66o/8tvc=;
	b=JCrNiDNMy0iLp6AOPSMxbv8q6NiKRwVSZ5qTTHl+DMJcJlgnDLm3SGkC4OuQuuj/kh
	XNJcmv0NQ9AFJ3UgT3gtmZFaBh3fa4+Zok5oYFZFVJda1yeVQxi63ZI6bR6cTYgwxgSG
	2S48M8XaG5hI0RII957U/RHOpyT7BkIC3LvBFEnTM2o+SER6M7R6Z1+7sCuiWchrdibg
	yTcyIfFfAamMOjn0UgxOkfF9NbLZdCESImA2HjRGDeLhYkY1oSegrmd7hZT6NjlFiO5P
	bLBsoMZ5V88HE2eub+xUZ96U8caRRBInsWv3Sx2LFoklOUyhd/yYBXsDhpS5bTfgN45p
	hJhQ==
X-Gm-Message-State: AE9vXwP35OjET+tkdEQxOZiSP6jwzTxL7eHCjc0Mp0VRIoUlfBSt3nY1e3NL9S3Hx94VDgO3fmKZ0fEOiZ2Omsyw
X-Received: by 10.176.3.183 with SMTP id 52mr316360uau.153.1474556630332; Thu,
	22 Sep 2016 08:03:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.16.98 with HTTP; Thu, 22 Sep 2016 08:03:29 -0700 (PDT)
In-Reply-To: <1473442237-3746-6-git-send-email-eric.auger@redhat.com>
References: <1473442237-3746-1-git-send-email-eric.auger@redhat.com>
	<1473442237-3746-6-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Sep 2016 16:03:29 +0100
Message-ID: <CAFEAcA8cy4LxamAXu86DmpGUebpuvaoNdUWCySbbZYzRNjN6Fw@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22f
Subject: Re: [Qemu-arm] [PATCH v6 5/8] hw/intc/arm_gicv3_its: Implement
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
X-TUID: nniZSoorLHX9

On 9 September 2016 at 18:30, Eric Auger <eric.auger@redhat.com> wrote:
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
> A machine init done notifier still is used to compute the MSI frame
> (GITS_TRANSLATER) GPA, which is passed through KVM_SIGNAL_MSI ioctl.
>
> Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
> v5 -> v6:
> - now the kernel ITS init sequence has changed let's use the
>   kvm_arm_register_device to set the CTRL frame base address
> - use extract64()
> - add migration blocker
> - remove kvm_gsi_routing_allowed setting which is set in GICv3
>   KVM device realize
> - add migration_blocker
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
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/intc/Makefile.objs       |   1 +
>  hw/intc/arm_gicv3_its_kvm.c | 136 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 137 insertions(+)
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
> index 0000000..b9d10dc
> --- /dev/null
> +++ b/hw/intc/arm_gicv3_its_kvm.c
> @@ -0,0 +1,136 @@
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
> +#include "migration/migration.h"
> +
> +#define TYPE_KVM_ARM_ITS "arm-its-kvm"
> +#define KVM_ARM_ITS(obj) OBJECT_CHECK(GICv3ITSState, (obj), TYPE_KVM_ARM_ITS)
> +
> +static int kvm_its_send_msi(GICv3ITSState *s, uint32_t value, uint16_t devid)
> +{
> +    struct kvm_msi msi;
> +
> +    msi.address_lo = extract64(s->gits_translater_gpa, 0, 32);
> +    msi.address_hi = extract64(s->gits_translater_gpa, 32, 32);
> +    msi.data = le32_to_cpu(value);
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
> +/* this notifier computes and stores the ITS MSI frame GPA */
> +static void its_notify(Notifier *notifier, void *data)
> +{
> +    ItsInitNotifierParams *p = DO_UPCAST(ItsInitNotifierParams,
> +                                         notifier, notifier);
> +    GICv3ITSState *s = p->s;
> +    MemoryRegion *mr = &s->iomem_its_translation;
> +    MemoryRegionSection mrs;
> +    uint64_t addr;
> +
> +    mrs = memory_region_find(mr, 0, 1);
> +    addr = mrs.offset_within_address_space;
> +    s->gits_translater_gpa = addr + 0x40;

This leaks a memory region reference.

Also, I think it would be simpler to just have kvm_its_send_msi() do

   if (unlikely(!s->translater_gpa_known)) {
       s->gits_translater_gpa = ...;
       s->translater_gpa_known = true;
   }

rather than messing around with a machine-init-done notifier.

> +}
> +
> +static void kvm_arm_its_realize(DeviceState *dev, Error **errp)
> +{
> +    GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
> +    ItsInitNotifierParams *p = g_new(ItsInitNotifierParams, 1);
> +
> +    s->dev_fd = kvm_create_device(kvm_state, KVM_DEV_TYPE_ARM_VGIC_ITS, false);
> +    if (s->dev_fd < 0) {
> +        error_setg_errno(errp, -s->dev_fd, "error creating in-kernel ITS");
> +        return;
> +    }
> +
> +    /* explicit init if the ITS */

"of the"

> +    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
> +                      KVM_DEV_ARM_VGIC_CTRL_INIT, NULL, true);
> +
> +    /* register the base address */
> +    kvm_arm_register_device(&s->iomem_its_cntrl, -1, KVM_DEV_ARM_VGIC_GRP_ADDR,
> +                            KVM_VGIC_ITS_ADDR_TYPE, s->dev_fd);
> +
> +    gicv3_its_init_mmio(s, NULL);
> +
> +    p->notifier.notify = its_notify;
> +    p->s = s;
> +    qemu_add_machine_init_done_notifier(&p->notifier);
> +
> +    /*
> +     * Block migration of a KVM GICv3 ITS device: the API for saving and
> +     * restoring the state in the kernel is not yet available
> +     */
> +    error_setg(&s->migration_blocker, "vITS migration is not implemented");
> +    migrate_add_blocker(s->migration_blocker);
> +
> +    kvm_msi_use_devid = true;
> +    kvm_gsi_direct_mapping = false;
> +    kvm_msi_via_irqfd_allowed = kvm_irqfds_enabled();
> +}
> +
> +static void kvm_arm_its_init(Object *obj)
> +{
> +    GICv3ITSState *s = KVM_ARM_ITS(obj);
> +
> +    object_property_add_link(obj, "parent-gicv3",
> +                             "kvm-arm-gicv3", (Object **)&s->gicv3,
> +                             object_property_allow_set_link,
> +                             OBJ_PROP_LINK_UNREF_ON_RELEASE,
> +                             &error_abort);
> +}
> +
> +static void kvm_arm_its_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    GICv3ITSCommonClass *icc = ARM_GICV3_ITS_COMMON_CLASS(klass);
> +
> +    dc->realize = kvm_arm_its_realize;
> +    icc->send_msi = kvm_its_send_msi;
> +}
> +
> +static const TypeInfo kvm_arm_its_info = {
> +    .name = TYPE_KVM_ARM_ITS,
> +    .parent = TYPE_ARM_GICV3_ITS_COMMON,
> +    .instance_size = sizeof(GICv3ITSState),
> +    .instance_init = kvm_arm_its_init,
> +    .class_init = kvm_arm_its_class_init,
> +};
> +
> +static void kvm_arm_its_register_types(void)
> +{
> +    type_register_static(&kvm_arm_its_info);
> +}
> +
> +type_init(kvm_arm_its_register_types)
> --
> 2.5.5

thanks
-- PMM
