Received: by 10.25.21.156 with SMTP id 28csp2589667lfv;
        Wed, 17 Aug 2016 09:05:16 -0700 (PDT)
X-Received: by 10.55.140.194 with SMTP id o185mr49025370qkd.183.1471449916825;
        Wed, 17 Aug 2016 09:05:16 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id y198si20130285qka.154.2016.08.17.09.05.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 Aug 2016 09:05:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48316 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ba3LA-0005Gr-8n
	for alex.bennee@linaro.org; Wed, 17 Aug 2016 12:05:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58359)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ba3JZ-0003zw-F3
	for qemu-arm@nongnu.org; Wed, 17 Aug 2016 12:03:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ba3JU-0000My-4S
	for qemu-arm@nongnu.org; Wed, 17 Aug 2016 12:03:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41810)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1ba3JT-0000Mu-Sp; Wed, 17 Aug 2016 12:03:32 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1542386647;
	Wed, 17 Aug 2016 16:03:31 +0000 (UTC)
Received: from localhost.localdomain (vpn1-5-93.ams2.redhat.com [10.36.5.93])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u7HG3Qpq002580
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 17 Aug 2016 12:03:28 -0400
To: Peter Maydell <peter.maydell@linaro.org>
References: <1470161247-10251-1-git-send-email-eric.auger@redhat.com>
	<1470161247-10251-2-git-send-email-eric.auger@redhat.com>
	<CAFEAcA-VsSn--mmD5SVMF5O6SRuQf4sjxa2=z+S0kYdnCYC+Pg@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <f67070c2-84da-f3ff-ed85-c44ec397b59d@redhat.com>
Date: Wed, 17 Aug 2016 18:03:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-VsSn--mmD5SVMF5O6SRuQf4sjxa2=z+S0kYdnCYC+Pg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 17 Aug 2016 16:03:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC v5 1/7] hw/intc/arm_gicv3_its: Implement ITS
 base class
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
X-TUID: s27GQNs1ZFv+

Hi Peter,

On 12/08/2016 16:12, Peter Maydell wrote:
> On 2 August 2016 at 19:07, Eric Auger <eric.auger@redhat.com> wrote:
>> From: Pavel Fedin <p.fedin@samsung.com>
>>
>> This is the basic skeleton for both KVM and software-emulated ITS.
>> Since we already prepare status structure, we also introduce complete
>> VMState description. But, because we currently have no migratable
>> implementations, we also set unmigratable flag.
>>
>> Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>> v4 -> v5:
>> - send_msi can return 0 meaning the MSI was rejected by guest. Handle this
>>   value as an error
>>
>> v3 -> v4:
>> - fix compilation error
>> - msi_supported -> msi_nonbroken
>> - streamid -> requester_id
>> - use PRIx64
>> - read ops uses _with_attrs form
>> - 16/32b write access allowed to GITS_TRANSLATER
>> - move its_class_name in kvm_arm.h and remove #ifdef TARGET_AARCH64
>> - add new kvm device dev_fd field
>> - add new gits_translater_gpa field in GICv3ITSState
>> ---
>>  hw/intc/Makefile.objs                  |   1 +
>>  hw/intc/arm_gicv3_its_common.c         | 155 +++++++++++++++++++++++++++++++++
>>  include/hw/intc/arm_gicv3_its_common.h |  75 ++++++++++++++++
>>  target-arm/kvm_arm.h                   |  19 ++++
>>  4 files changed, 250 insertions(+)
>>  create mode 100644 hw/intc/arm_gicv3_its_common.c
>>  create mode 100644 include/hw/intc/arm_gicv3_its_common.h
>>
>> diff --git a/hw/intc/Makefile.objs b/hw/intc/Makefile.objs
>> index 05ec21b..23a39f7 100644
>> --- a/hw/intc/Makefile.objs
>> +++ b/hw/intc/Makefile.objs
>> @@ -16,6 +16,7 @@ common-obj-$(CONFIG_ARM_GIC) += arm_gicv3_common.o
>>  common-obj-$(CONFIG_ARM_GIC) += arm_gicv3.o
>>  common-obj-$(CONFIG_ARM_GIC) += arm_gicv3_dist.o
>>  common-obj-$(CONFIG_ARM_GIC) += arm_gicv3_redist.o
>> +common-obj-$(CONFIG_ARM_GIC) += arm_gicv3_its_common.o
>>  common-obj-$(CONFIG_OPENPIC) += openpic.o
>>
>>  obj-$(CONFIG_APIC) += apic.o apic_common.o
>> diff --git a/hw/intc/arm_gicv3_its_common.c b/hw/intc/arm_gicv3_its_common.c
>> new file mode 100644
>> index 0000000..0d08ff2
>> --- /dev/null
>> +++ b/hw/intc/arm_gicv3_its_common.c
>> @@ -0,0 +1,155 @@
>> +/*
>> + * ITS base class for a GICv3-based system
>> + *
>> + * Copyright (c) 2015 Samsung Electronics Co., Ltd.
>> + * Written by Pavel Fedin
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation, either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public License along
>> + * with this program; if not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "hw/pci/msi.h"
>> +#include "hw/intc/arm_gicv3_its_common.h"
>> +#include "qemu/log.h"
>> +
>> +static void gicv3_its_pre_save(void *opaque)
>> +{
>> +    GICv3ITSState *s = (GICv3ITSState *)opaque;
>> +    GICv3ITSCommonClass *c = ARM_GICV3_ITS_COMMON_GET_CLASS(s);
>> +
>> +    if (c->pre_save) {
>> +        c->pre_save(s);
>> +    }
>> +}
>> +
>> +static int gicv3_its_post_load(void *opaque, int version_id)
>> +{
>> +    GICv3ITSState *s = (GICv3ITSState *)opaque;
>> +    GICv3ITSCommonClass *c = ARM_GICV3_ITS_COMMON_GET_CLASS(s);
>> +
>> +    if (c->post_load) {
>> +        c->post_load(s);
>> +    }
>> +    return 0;
>> +}
>> +
>> +static const VMStateDescription vmstate_its = {
>> +    .name = "arm_gicv3_its",
>> +    .pre_save = gicv3_its_pre_save,
>> +    .post_load = gicv3_its_post_load,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_UINT32(ctlr, GICv3ITSState),
>> +        VMSTATE_UINT64(cbaser, GICv3ITSState),
>> +        VMSTATE_UINT64(cwriter, GICv3ITSState),
>> +        VMSTATE_UINT64(creadr, GICv3ITSState),
>> +        VMSTATE_UINT64_ARRAY(baser, GICv3ITSState, 8),
>> +        VMSTATE_END_OF_LIST()
>> +    },
>> +    .unmigratable = true,
> 
> Why define the fields and also mark it unmigratable?
> A comment saying why the device is unmigratable would be good.
Yes sure I will remove the fields and add a comment on the migration status.
> 
>> +};
>> +
>> +static MemTxResult gicv3_its_trans_read(void *opaque, hwaddr offset,
>> +                                        uint64_t *data, unsigned size,
>> +                                        MemTxAttrs attrs)
>> +{
>> +    qemu_log_mask(LOG_GUEST_ERROR, "ITS read at offset 0x%"PRIx64"\n", offset);
>> +    return MEMTX_ERROR;
>> +}
>> +
>> +static MemTxResult gicv3_its_trans_write(void *opaque, hwaddr offset,
>> +                                         uint64_t value, unsigned size,
>> +                                         MemTxAttrs attrs)
>> +{
>> +    if (offset == 0x0040 && ((size == 2) || (size == 4))) {
>> +        GICv3ITSState *s = ARM_GICV3_ITS_COMMON(opaque);
>> +        GICv3ITSCommonClass *c = ARM_GICV3_ITS_COMMON_GET_CLASS(s);
>> +        int ret = c->send_msi(s, le64_to_cpu(value), attrs.requester_id);
>> +
>> +        if (ret <= 0) {
>> +            qemu_log_mask(LOG_GUEST_ERROR,
>> +                          "ITS: Error sending MSI: %s\n", strerror(-ret));
>> +            return MEMTX_DECODE_ERROR;
>> +        }
>> +
>> +        return MEMTX_OK;
>> +    } else {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "ITS write at bad offset 0x%jX\n", offset);
> 
> Can we be consistent about the format string used for printing hwaddrs?
> I suspect this one won't build on 32-bit.
I will use PRIx64 instead.

Thanks

Eric
> 
>> +        return MEMTX_DECODE_ERROR;
>> +    }
>> +}
>> +
>> +static const MemoryRegionOps gicv3_its_trans_ops = {
>> +    .read_with_attrs = gicv3_its_trans_read,
>> +    .write_with_attrs = gicv3_its_trans_write,
>> +    .endianness = DEVICE_NATIVE_ENDIAN,
>> +};
>> +
>> +void gicv3_its_init_mmio(GICv3ITSState *s, const MemoryRegionOps *ops)
>> +{
>> +    SysBusDevice *sbd = SYS_BUS_DEVICE(s);
>> +
>> +    memory_region_init_io(&s->iomem_its_cntrl, OBJECT(s), ops, s,
>> +                          "control", ITS_CONTROL_SIZE);
>> +    memory_region_init_io(&s->iomem_its, OBJECT(s), &gicv3_its_trans_ops, s,
>> +                          "translation", ITS_TRANS_SIZE);
>> +
>> +    /* Our two regions are always adjacent, therefore we now combine them
>> +     * into a single one in order to make our users' life easier.
>> +     */
>> +    memory_region_init(&s->iomem_main, OBJECT(s), "gicv3_its", ITS_SIZE);
>> +    memory_region_add_subregion(&s->iomem_main, 0, &s->iomem_its_cntrl);
>> +    memory_region_add_subregion(&s->iomem_main, ITS_CONTROL_SIZE,
>> +                                &s->iomem_its);
>> +    sysbus_init_mmio(sbd, &s->iomem_main);
>> +
>> +    msi_nonbroken = true;
>> +}
>> +
>> +static void gicv3_its_common_reset(DeviceState *dev)
>> +{
>> +    GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
>> +
>> +    s->ctlr = 0;
>> +    s->cbaser = 0;
>> +    s->cwriter = 0;
>> +    s->creadr = 0;
>> +    memset(&s->baser, 0, sizeof(s->baser));
>> +
>> +    gicv3_its_post_load(s, 0);
>> +}
> 
> 
> thanks
> -- PMM
> 
