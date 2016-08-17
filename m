Received: by 10.25.21.156 with SMTP id 28csp2586836lfv;
        Wed, 17 Aug 2016 08:59:58 -0700 (PDT)
X-Received: by 10.55.43.25 with SMTP id r25mr45835650qkh.256.1471449598539;
        Wed, 17 Aug 2016 08:59:58 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i52si21443216qti.20.2016.08.17.08.59.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 Aug 2016 08:59:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48175 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ba3G2-0000qQ-0U
	for alex.bennee@linaro.org; Wed, 17 Aug 2016 11:59:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57347)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ba3Fw-0000pS-7R
	for qemu-arm@nongnu.org; Wed, 17 Aug 2016 11:59:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ba3Fs-000887-19
	for qemu-arm@nongnu.org; Wed, 17 Aug 2016 11:59:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39044)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1ba3Fr-000871-On; Wed, 17 Aug 2016 11:59:47 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8C65085547;
	Wed, 17 Aug 2016 15:59:46 +0000 (UTC)
Received: from localhost.localdomain (vpn1-5-93.ams2.redhat.com [10.36.5.93])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u7HFxgkU030730
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 17 Aug 2016 11:59:44 -0400
To: Peter Maydell <peter.maydell@linaro.org>
References: <1470161247-10251-1-git-send-email-eric.auger@redhat.com>
	<1470161247-10251-6-git-send-email-eric.auger@redhat.com>
	<CAFEAcA8g+TjvG5zhwoijkx941bMHodkNHktHV6VM6afnCmCFTw@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <ec35f9c6-482a-4349-f1c8-d30f54081a1d@redhat.com>
Date: Wed, 17 Aug 2016 17:59:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8g+TjvG5zhwoijkx941bMHodkNHktHV6VM6afnCmCFTw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 17 Aug 2016 15:59:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
X-TUID: uVH1xHz1gZLn

Hi Peter,

On 12/08/2016 16:03, Peter Maydell wrote:
> On 2 August 2016 at 19:07, Eric Auger <eric.auger@redhat.com> wrote:
>> From: Pavel Fedin <p.fedin@samsung.com>
>>
>> The ITS control frame is in-kernel emulated while accesses to the
>> GITS_TRANSLATER are mediated through the KVM_SIGNAL_MSI ioctl (MSI
>> direct MSI injection advertised by the CAP_SIGNAL_MSI capability)
>>
>> the kvm_gsi_direct_mapping is explicitly set to false to emphasize the
>> difference with GICv2M. Direct mapping cannot work with ITS since
>> the content of the MSI data is not the target interrupt ID but an
>> eventd id.
>>
>> GSI routing is advertised (kvm_gsi_routing_allowed) as well as
>> msi/irqfd signaling (kvm_msi_via_irqfd_allowed).
>>
>> Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> v3 -> v4:
>> - include "qemu/osdep.h" and  "qapi/error.h"
>> - rename KVM_VGIC_V3_ADDR_TYPE_ITS into KVM_VGIC_ITS_ADDR_TYPE
>> - reword commit message
>> - change kvm_msi_via_irqfd_allowed definition (attached to irqfd dynamic
>>   availability + MSI controller availability)
>> - create the ITS KVM device (previously abstracted by the GICv3 KVM device)
>> - init sequence changed
>> - absolute GITS_TRANSLATER GPA stored
>> ---
>>  hw/intc/Makefile.objs       |   1 +
>>  hw/intc/arm_gicv3_its_kvm.c | 145 ++++++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 146 insertions(+)
>>  create mode 100644 hw/intc/arm_gicv3_its_kvm.c
>>
>> diff --git a/hw/intc/Makefile.objs b/hw/intc/Makefile.objs
>> index 23a39f7..9cca280 100644
>> --- a/hw/intc/Makefile.objs
>> +++ b/hw/intc/Makefile.objs
>> @@ -22,6 +22,7 @@ common-obj-$(CONFIG_OPENPIC) += openpic.o
>>  obj-$(CONFIG_APIC) += apic.o apic_common.o
>>  obj-$(CONFIG_ARM_GIC_KVM) += arm_gic_kvm.o
>>  obj-$(call land,$(CONFIG_ARM_GIC_KVM),$(TARGET_AARCH64)) += arm_gicv3_kvm.o
>> +obj-$(call land,$(CONFIG_ARM_GIC_KVM),$(TARGET_AARCH64)) += arm_gicv3_its_kvm.o
>>  obj-$(CONFIG_STELLARIS) += armv7m_nvic.o
>>  obj-$(CONFIG_EXYNOS4) += exynos4210_gic.o exynos4210_combiner.o
>>  obj-$(CONFIG_GRLIB) += grlib_irqmp.o
>> diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
>> new file mode 100644
>> index 0000000..b6d92aa
>> --- /dev/null
>> +++ b/hw/intc/arm_gicv3_its_kvm.c
>> @@ -0,0 +1,145 @@
>> +/*
>> + * KVM-based ITS implementation for a GICv3-based system
>> + *
>> + * Copyright (c) 2015 Samsung Electronics Co., Ltd.
>> + * Written by Pavel Fedin <p.fedin@samsung.com>
>> + *
>> + * This library is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU Lesser General Public
>> + * License as published by the Free Software Foundation; either
>> + * version 2 of the License, or (at your option) any later version.
>> + *
>> + * This library is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>> + * Lesser General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU Lesser General Public
>> + * License along with this library; if not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "qapi/error.h"
>> +#include "hw/intc/arm_gicv3_its_common.h"
>> +#include "sysemu/sysemu.h"
>> +#include "sysemu/kvm.h"
>> +#include "kvm_arm.h"
>> +
>> +#define TYPE_KVM_ARM_ITS "arm-its-kvm"
>> +#define KVM_ARM_ITS(obj) OBJECT_CHECK(GICv3ITSState, (obj), TYPE_KVM_ARM_ITS)
>> +
>> +static int kvm_its_send_msi(GICv3ITSState *s, uint32_t value, uint16_t devid)
>> +{
>> +    struct kvm_msi msi;
>> +
>> +    msi.address_lo = s->gits_translater_gpa & 0xFFFFFFFFULL;
>> +    msi.address_hi = s->gits_translater_gpa >> 32;
> 
> extract64() might be preferable?
> 
>> +    msi.data = value;
>> +    msi.flags = KVM_MSI_VALID_DEVID;
>> +    msi.devid = devid;
>> +    memset(msi.pad, 0, sizeof(msi.pad));
>> +
>> +    return kvm_vm_ioctl(kvm_state, KVM_SIGNAL_MSI, &msi);
>> +}
>> +
>> +typedef struct ItsInitNotifierParams {
>> +    Notifier notifier;
>> +    GICv3ITSState *s;
>> +} ItsInitNotifierParams;
>> +
>> +/**
>> + *
>> + * We currently do not use kvm_arm_register_device to provide
>> + * the kernel with the vITS control frame base address since the
>> + * KVM_DEV_ARM_VGIC_CTRL_INIT init MUST be called after the
>> + * KVM_ARM_SET_DEVICE_ADDR and the kvm_arm_register_device
>> + * infra does not allow this.
>> + */
> 
> I thought we'd fixed the kernel API so we didn't need to
> have this workaround?
The kernel fixes landed in kvmarm/master so I will respin the series
accordingly.

Thanks

Eric
> 
>> +static void its_notify(Notifier *notifier, void *data)
>> +{
>> +    ItsInitNotifierParams *p = DO_UPCAST(ItsInitNotifierParams,
>> +                                         notifier, notifier);
>> +    GICv3ITSState *s = p->s;
>> +    MemoryRegion *mr = &s->iomem_its_cntrl;
>> +    MemoryRegionSection mrs;
>> +    struct kvm_device_attr attr;
>> +    uint64_t addr;
>> +    int ret;
>> +
>> +    mrs = memory_region_find(mr, 0, 1);
>> +    addr = mrs.offset_within_address_space;
>> +
>> +    attr.flags = 0;
>> +    attr.group = KVM_DEV_ARM_VGIC_GRP_ADDR;
>> +    attr.attr = KVM_VGIC_ITS_ADDR_TYPE;
>> +    attr.addr =  (uintptr_t)&addr;
>> +
>> +    s->gits_translater_gpa = addr + ITS_CONTROL_SIZE + 0x40;
>> +
>> +    ret = kvm_device_ioctl(s->dev_fd, KVM_SET_DEVICE_ATTR, attr);
>> +    if (ret) {
>> +        error_setg_errno(&error_fatal, -ret,
>> +                         "not able to set base address for vITS ctrl frame");
>> +    }
>> +
>> +    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
>> +                      KVM_DEV_ARM_VGIC_CTRL_INIT, NULL, true);
>> +}
> 
> thanks
> -- PMM
> 
