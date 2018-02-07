Received: by 10.28.71.27 with SMTP id u27csp229396wma;
        Tue, 6 Feb 2018 20:11:25 -0800 (PST)
X-Google-Smtp-Source: AH8x224uOwx9owwUw4ZDiPT8eZfIRbZQ1bmvAWeG7ZtDRV93Y5/XnWPlbWYWsE+LbHPMOPght3Lx
X-Received: by 10.37.30.69 with SMTP id e66mr3013102ybe.469.1517976685454;
        Tue, 06 Feb 2018 20:11:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517976685; cv=none;
        d=google.com; s=arc-20160816;
        b=Afy4hthPO8+ilMgMQqU7yY7hLngxEyWb3F3EPFJAXbn+ABJ8HaLRjEbYhVvlVajOcW
         tdfkMyWNlCQf4n4fHFAe+KZ33PJI+Y59jnPe7Wv2KV5mioihzuTB+RgZQO7BiA6V65HW
         zrShDLKfGQ3YGI6id55qU4gNsY50B4XyIbz8q0hIhGlkWU/8auwq9Teeqp6Cjt070zln
         BKCE4Rv1NBsvzppNO63Ut37cAJs123Fhwt5cS6qeSFgkrsrG56MdeV6NlfCuULNXIv8H
         C8ou458Da1J4tWAGK4ut2DP/LeccIkWidrQgbdAyZo5rU8hh1q77DsO6Pr2/jMZTwKzM
         iB3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=est+sZdI8SGk0c21OBQTtaKHxMwdsLp1AgMKH8udRpM=;
        b=iNnNmXNn36k0ZowfgBxEa6rJqLDTU+6R7sIuzbcKtbWw8y5b3CaRtcXuE21bPLIzy6
         BSU4m8VItmV2XeHgLPjz6IRIO8Z3BXBbGqLQabTuGqQZ8dA2KEYz22+tGaRBt8+2S18v
         uxB4NGLAH66deL3s069ZtLB6u+pFDzejPfZB1XYvM/gEwZtQ7kzzw5yXdEcP9m06eNDN
         g1AaRb+snaCoPeolRWJ5zV1CSXFTz+b+fg+0HmVpDL4b0RnR/324Zj08x+DanDbUREPm
         s/hlxwXq+1cwXBgtYlS9agkBSm6VLnn4Nl94pmkyXYYcofc+fM+8d01RokdBJMsbXflY
         DtLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZhbE5m5z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k123si100510ywe.524.2018.02.06.20.11.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Feb 2018 20:11:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZhbE5m5z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45569 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejH4u-0002Pk-RJ
	for alex.bennee@linaro.org; Tue, 06 Feb 2018 23:11:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41161)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ejH4J-00022W-4P
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 23:10:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ejH4D-0003JS-BO
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 23:10:47 -0500
Received: from mail-qk0-x235.google.com ([2607:f8b0:400d:c09::235]:37285)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ejH4D-0003JE-5X; Tue, 06 Feb 2018 23:10:41 -0500
Received: by mail-qk0-x235.google.com with SMTP id c128so5271156qkb.4;
	Tue, 06 Feb 2018 20:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=est+sZdI8SGk0c21OBQTtaKHxMwdsLp1AgMKH8udRpM=;
	b=ZhbE5m5zL9ipuO9kF/yK11A5OMoIbiN413N6eg8pyOaDLa/2lrvvfxAQ7ZBTjs2YUy
	fe9yTIUYnlt4mvZXwhvwOATRnp7+tlPDdm3coMn0TJx3q4vPO5s9PojKLoroy1mP4fsu
	UKALYqjQRSlXz505SqenwsuFwQGFp1q0jXZe15frnGzvTCZFDPGZviFiyNnkYCCK/Yp8
	lveSWGZRbCHZDsfAyhqpIuiQZj7P9XkB+H2UmopWRTc0Haz6ghQfrQabs/pbrBSSR13x
	Wzjq69ZuRapLvr7xCG1OoocsGJcgm/XonpqwN/r9Y051XQ+0dd1ZgQTMk4qa9Mxs7OQ7
	1vIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=est+sZdI8SGk0c21OBQTtaKHxMwdsLp1AgMKH8udRpM=;
	b=PYDpc5NWVr4S2c7LOKRMjMTF4hhw1zgvNvmZQPO0E3uV/Gz6qVYGio2lv3IOqs/9c4
	G1afVhu9oqmFtgfQ/II7XiWQtKiDBSwbsx/7lQKxPUBD5VoXgjxwqFPQ7phwru0FwYe2
	AuPFVumtC+gG+QAXeF/GblHaM+ej5dBoskEZLUJBxoucKMWu1vyN9w71xZK8c5pxJ9ys
	hFQ/He7EktKSM5KkPmoMjOTXpohxrK+/pfD43TtW/cKLAfvvun8yupK0B+dEU4fZYjPi
	7BqgwYqehPlfqfU8qihCARSrDFoczOWDcKi/O77kOrllqa7lsLONMG+LHRcHlZwWcp+2
	vwDA==
X-Gm-Message-State: APf1xPBKt4+P+UoXNKk8v3JPWQEGmdbjcc8WyOkqlCChklUS3witBcQV
	AsjITZdM01rQ18wLoMhvGNZY4Daiw9A8aSQrwPs=
X-Received: by 10.55.191.65 with SMTP id p62mr6954584qkf.191.1517976640398;
	Tue, 06 Feb 2018 20:10:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.101.7 with HTTP; Tue, 6 Feb 2018 20:10:39 -0800 (PST)
In-Reply-To: <f1dde4c8-ab85-05ec-5b46-ea00ba9dabc9@redhat.com>
References: <20180116013709.13830-1-andrew.smirnov@gmail.com>
	<20180116013709.13830-10-andrew.smirnov@gmail.com>
	<76017d4e-0b11-93a4-94c7-553f7baee3ff@zoho.com>
	<CAHQ1cqG=7_T5L4mofXJ5s5t7Dr7=VH13W75TfYRw_ajU=_apxw@mail.gmail.com>
	<f1dde4c8-ab85-05ec-5b46-ea00ba9dabc9@redhat.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Tue, 6 Feb 2018 20:10:39 -0800
Message-ID: <CAHQ1cqFEYrGZfoJFyLqn3heYNhXV+YV23wJsXm2nZv=9y6FE3w@mail.gmail.com>
To: Marcel Apfelbaum <marcel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::235
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 09/14] pci: Add support for
 Designware IP block
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"open list:ARM" <qemu-arm@nongnu.org>, Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CXdC47lLx9AC

On Wed, Jan 31, 2018 at 4:13 AM, Marcel Apfelbaum <marcel@redhat.com> wrote=
:
> On 30/01/2018 19:49, Andrey Smirnov wrote:
>> On Tue, Jan 30, 2018 at 5:18 AM, Marcel Apfelbaum
>> <marcel.apfelbaum@zoho.com> wrote:
>>> Hi Andrei,
>>>
>>> Sorry for letting you wait,
>>> I have some comments/questions below.
>>>
>>>
>>> On 16/01/2018 3:37, Andrey Smirnov wrote:
>>>>
>>>> Add code needed to get a functional PCI subsytem when using in
>>>> conjunction with upstream Linux guest (4.13+). Tested to work against
>>>> "e1000e" (network adapter, using MSI interrupts) as well as
>>>> "usb-ehci" (USB controller, using legacy PCI interrupts).
>>>>
>>>> Cc: Peter Maydell <peter.maydell@linaro.org>
>>>> Cc: Jason Wang <jasowang@redhat.com>
>>>> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>>> Cc: qemu-devel@nongnu.org
>>>> Cc: qemu-arm@nongnu.org
>>>> Cc: yurovsky@gmail.com
>>>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>>>> ---
>>>>   default-configs/arm-softmmu.mak  |   2 +
>>>>   hw/pci-host/Makefile.objs        |   2 +
>>>>   hw/pci-host/designware.c         | 618
>>>> +++++++++++++++++++++++++++++++++++++++
>>>>   include/hw/pci-host/designware.h |  93 ++++++
>>>>   include/hw/pci/pci_ids.h         |   2 +
>>>>   5 files changed, 717 insertions(+)
>>>>   create mode 100644 hw/pci-host/designware.c
>>>>   create mode 100644 include/hw/pci-host/designware.h
>>>>
>>>> diff --git a/default-configs/arm-softmmu.mak
>>>> b/default-configs/arm-softmmu.mak
>>>> index b0d6e65038..0c5ae914ed 100644
>>>> --- a/default-configs/arm-softmmu.mak
>>>> +++ b/default-configs/arm-softmmu.mak
>>>> @@ -132,3 +132,5 @@ CONFIG_GPIO_KEY=3Dy
>>>>   CONFIG_MSF2=3Dy
>>>>   CONFIG_FW_CFG_DMA=3Dy
>>>>   CONFIG_XILINX_AXI=3Dy
>>>> +CONFIG_PCI_DESIGNWARE=3Dy
>>>> +
>>>> diff --git a/hw/pci-host/Makefile.objs b/hw/pci-host/Makefile.objs
>>>> index 9c7909cf44..0e2c0a123b 100644
>>>> --- a/hw/pci-host/Makefile.objs
>>>> +++ b/hw/pci-host/Makefile.objs
>>>> @@ -17,3 +17,5 @@ common-obj-$(CONFIG_PCI_PIIX) +=3D piix.o
>>>>   common-obj-$(CONFIG_PCI_Q35) +=3D q35.o
>>>>   common-obj-$(CONFIG_PCI_GENERIC) +=3D gpex.o
>>>>   common-obj-$(CONFIG_PCI_XILINX) +=3D xilinx-pcie.o
>>>> +
>>>> +common-obj-$(CONFIG_PCI_DESIGNWARE) +=3D designware.o
>>>> diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
>>>> new file mode 100644
>>>> index 0000000000..98fff5e5f3
>>>> --- /dev/null
>>>> +++ b/hw/pci-host/designware.c
>>>> @@ -0,0 +1,618 @@
>>>> +/*
>>>> + * Copyright (c) 2017, Impinj, Inc.
>>>
>>> 2018 :)
>>>
>>>> + *
>>>> + * Designware PCIe IP block emulation
>>>> + *
>>>> + * This library is free software; you can redistribute it and/or
>>>> + * modify it under the terms of the GNU Lesser General Public
>>>> + * License as published by the Free Software Foundation; either
>>>> + * version 2 of the License, or (at your option) any later version.
>>>> + *
>>>> + * This library is distributed in the hope that it will be useful,
>>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>>>> + * Lesser General Public License for more details.
>>>> + *
>>>> + * You should have received a copy of the GNU Lesser General Public
>>>> + * License along with this library; if not, see
>>>> + * <http://www.gnu.org/licenses/>.
>>>> + */
>>>> +
>>>> +#include "qemu/osdep.h"
>>>> +#include "qapi/error.h"
>>>> +#include "hw/pci/msi.h"
>>>> +#include "hw/pci/pci_bridge.h"
>>>> +#include "hw/pci/pci_host.h"
>>>> +#include "hw/pci/pcie_port.h"
>>>> +#include "hw/pci-host/designware.h"
>>>> +
>>>> +#define PCIE_PORT_LINK_CONTROL          0x710
>>>> +
>>>> +#define PCIE_PHY_DEBUG_R1               0x72C
>>>> +#define PCIE_PHY_DEBUG_R1_XMLH_LINK_UP  BIT(4)
>>>> +
>>>> +#define PCIE_LINK_WIDTH_SPEED_CONTROL   0x80C
>>>> +
>>>> +#define PCIE_MSI_ADDR_LO                0x820
>>>> +#define PCIE_MSI_ADDR_HI                0x824
>>>> +#define PCIE_MSI_INTR0_ENABLE           0x828
>>>> +#define PCIE_MSI_INTR0_MASK             0x82C
>>>> +#define PCIE_MSI_INTR0_STATUS           0x830
>>>> +
>>>> +#define PCIE_ATU_VIEWPORT               0x900
>>>> +#define PCIE_ATU_REGION_INBOUND         (0x1 << 31)
>>>> +#define PCIE_ATU_REGION_OUTBOUND        (0x0 << 31)
>>>> +#define PCIE_ATU_REGION_INDEX2          (0x2 << 0)
>>>> +#define PCIE_ATU_REGION_INDEX1          (0x1 << 0)
>>>> +#define PCIE_ATU_REGION_INDEX0          (0x0 << 0)
>>>> +#define PCIE_ATU_CR1                    0x904
>>>> +#define PCIE_ATU_TYPE_MEM               (0x0 << 0)
>>>> +#define PCIE_ATU_TYPE_IO                (0x2 << 0)
>>>> +#define PCIE_ATU_TYPE_CFG0              (0x4 << 0)
>>>> +#define PCIE_ATU_TYPE_CFG1              (0x5 << 0)
>>>> +#define PCIE_ATU_CR2                    0x908
>>>> +#define PCIE_ATU_ENABLE                 (0x1 << 31)
>>>> +#define PCIE_ATU_BAR_MODE_ENABLE        (0x1 << 30)
>>>> +#define PCIE_ATU_LOWER_BASE             0x90C
>>>> +#define PCIE_ATU_UPPER_BASE             0x910
>>>> +#define PCIE_ATU_LIMIT                  0x914
>>>> +#define PCIE_ATU_LOWER_TARGET           0x918
>>>> +#define PCIE_ATU_BUS(x)                 (((x) >> 24) & 0xff)
>>>> +#define PCIE_ATU_DEVFN(x)               (((x) >> 16) & 0xff)
>>>> +#define PCIE_ATU_UPPER_TARGET           0x91C
>>>> +
>>>> +static DesignwarePCIEHost *
>>>> +designware_pcie_root_to_host(DesignwarePCIERoot *root)
>>>> +{
>>>> +    BusState *bus =3D qdev_get_parent_bus(DEVICE(root));
>>>> +    return DESIGNWARE_PCIE_HOST(bus->parent);
>>>> +}
>>>> +
>>>> +static void designware_pcie_root_msi_write(void *opaque, hwaddr addr,
>>>> +                                           uint64_t val, unsigned len=
)
>>>> +{
>>>> +    DesignwarePCIERoot *root =3D DESIGNWARE_PCIE_ROOT(opaque);
>>>> +    DesignwarePCIEHost *host =3D designware_pcie_root_to_host(root);
>>>> +
>>>> +    root->msi.intr[0].status |=3D (1 << val) & root->msi.intr[0].enab=
le;
>>>> +
>>>> +    if (root->msi.intr[0].status & ~root->msi.intr[0].mask) {
>>>> +        qemu_set_irq(host->pci.irqs[0], 1);
>>>
>>>
>>> Sorry for the possibly dumb question, but "msi_write"
>>> will result in raising an INTx ?
>>
>> Correct, that's the intention. I wouldn't be surprised if I missed a
>> better/canonical way to implement this.
>>
>
> Not sure of a "better" way. The point was the "msi" naming
> that suggests edge interrupts, while resulting into level interrupts.
> I was wondering about the naming, nothing more.
>
>>>>
>>>> +    }
>>>> +}
>>>> +
>>>> +const MemoryRegionOps designware_pci_host_msi_ops =3D {
>>>> +    .write =3D designware_pcie_root_msi_write,
>>>> +    .endianness =3D DEVICE_NATIVE_ENDIAN,
>>>
>>>
>>> You may want to limit the access size.
>>
>> Good point, will do.
>>
>>>>
>>>> +};
>>>> +
>>>> +static void designware_pcie_root_update_msi_mapping(DesignwarePCIERoo=
t
>>>> *root)
>>>> +
>>>> +{
>>>> +    DesignwarePCIEHost *host =3D designware_pcie_root_to_host(root);
>>>> +    MemoryRegion *address_space =3D &host->pci.memory;
>>>> +    MemoryRegion *mem =3D &root->msi.iomem;
>>>> +    const uint64_t base =3D root->msi.base;
>>>> +    const bool enable =3D root->msi.intr[0].enable;
>>>> +
>>>> +    if (memory_region_is_mapped(mem)) {
>>>> +        memory_region_del_subregion(address_space, mem);
>>>> +        object_unparent(OBJECT(mem));
>>>> +    }
>>>> +
>>>> +    if (enable) {
>>>> +        memory_region_init_io(mem, OBJECT(root),
>>>> +                              &designware_pci_host_msi_ops,
>>>> +                              root, "pcie-msi", 0x1000);
>>>> +
>>>> +        memory_region_add_subregion(address_space, base, mem);
>>>
>>>
>>> What happens if is enabled twice?
>>
>> Ideally this shouldn't happen since this function is only called when
>> PCIE_MSI_INTR0_ENABLE transitions from "All IRQs disabled" to "At
>> least one IRQ enabled" or the inverse (via "update_msi_mapping" in
>> designware_pcie_root_config_write).
>>
>> But, assuming I got my logic wrong there, my thinking was that if it
>> gets enabled for the second time, first "if" statement in
>> designware_pcie_root_update_msi_mapping() would remove old
>> MemoryRegion and second one would add it back, so it end up being a
>> "no-op". I might be violating some API usage rules, so, please don't
>> hesitate to call me out on this if I do.
>>
>
> OK, so I am pretty sure we call "memory_region_init_io" only once
> in the init/realize part.
>
> Then, if the address mappings is getting changed between the calls
> you can use memory_region_del_subregion/memory_region_add_subregion on up=
date.
>
> If the mappings remains the same you can use memory_region_set_enabled
> to disable/enable the memory region.
>

Sounds good. Will do in v5.

>>> Is it possible to be also disabled?
>>>
>>
>> Yes, similar to the case above, except the "if (enabled)" is not going
>> to be executed and there'd be no MemoryRegion to trigger MSI
>> interrupt.
>>
>>>
>>>> +    }
>>>> +}
>>>> +
>>>> +static DesignwarePCIEViewport *
>>>> +designware_pcie_root_get_current_viewport(DesignwarePCIERoot *root)
>>>> +{
>>>> +    const unsigned int idx =3D root->atu_viewport & 0xF;
>>>> +    const unsigned int dir =3D !!(root->atu_viewport &
>>>> PCIE_ATU_REGION_INBOUND);
>>>> +    return &root->viewports[dir][idx];
>>>> +}
>>>> +
>>>> +static uint32_t
>>>> +designware_pcie_root_config_read(PCIDevice *d, uint32_t address, int =
len)
>>>> +{
>>>> +    DesignwarePCIERoot *root =3D DESIGNWARE_PCIE_ROOT(d);
>>>> +    DesignwarePCIEViewport *viewport =3D
>>>> +        designware_pcie_root_get_current_viewport(root);
>>>> +
>>>> +    uint32_t val;
>>>> +
>>>> +    switch (address) {
>>>> +    case PCIE_PORT_LINK_CONTROL:
>>>> +    case PCIE_LINK_WIDTH_SPEED_CONTROL:
>>>> +        val =3D 0xDEADBEEF;
>>>> +        /* No-op */
>>>
>>>
>>> Not really a no-op
>>>
>>
>> What I meant by "no-op" is that those registers do not implement their
>> actual function and instead return obviously bogus value. I'll change
>> the comment to state that in a more explicit way.
>>
>>>> +        break;
>>>> +
>>>> +    case PCIE_MSI_ADDR_LO:
>>>> +        val =3D root->msi.base;
>>>> +        break;
>>>> +
>>>> +    case PCIE_MSI_ADDR_HI:
>>>> +        val =3D root->msi.base >> 32;
>>>> +        break;
>>>> +
>>>> +    case PCIE_MSI_INTR0_ENABLE:
>>>> +        val =3D root->msi.intr[0].enable;
>>>> +        break;
>>>> +
>>>> +    case PCIE_MSI_INTR0_MASK:
>>>> +        val =3D root->msi.intr[0].mask;
>>>> +        break;
>>>> +
>>>> +    case PCIE_MSI_INTR0_STATUS:
>>>> +        val =3D root->msi.intr[0].status;
>>>> +        break;
>>>> +
>>>> +    case PCIE_PHY_DEBUG_R1:
>>>> +        val =3D PCIE_PHY_DEBUG_R1_XMLH_LINK_UP;
>>>> +        break;
>>>> +
>>>> +    case PCIE_ATU_VIEWPORT:
>>>> +        val =3D root->atu_viewport;
>>>> +        break;
>>>> +
>>>> +    case PCIE_ATU_LOWER_BASE:
>>>> +        val =3D viewport->base;
>>>> +        break;
>>>> +
>>>> +    case PCIE_ATU_UPPER_BASE:
>>>> +        val =3D viewport->base >> 32;
>>>> +        break;
>>>> +
>>>> +    case PCIE_ATU_LOWER_TARGET:
>>>> +        val =3D viewport->target;
>>>> +        break;
>>>> +
>>>> +    case PCIE_ATU_UPPER_TARGET:
>>>> +        val =3D viewport->target >> 32;
>>>> +        break;
>>>> +
>>>> +    case PCIE_ATU_LIMIT:
>>>> +        val =3D viewport->limit;
>>>> +        break;
>>>> +
>>>> +    case PCIE_ATU_CR1:
>>>> +    case PCIE_ATU_CR2:          /* FALLTHROUGH */
>>>> +        val =3D viewport->cr[(address - PCIE_ATU_CR1) / sizeof(uint32=
_t)];
>>>> +        break;
>>>> +
>>>> +    default:
>>>> +        val =3D pci_default_read_config(d, address, len);
>>>> +        break;
>>>> +    }
>>>> +
>>>> +    return val;
>>>> +}
>>>> +
>>>> +static uint64_t designware_pcie_root_data_read(void *opaque,
>>>> +                                               hwaddr addr, unsigned =
len)
>>>> +{
>>>> +    DesignwarePCIERoot *root =3D DESIGNWARE_PCIE_ROOT(opaque);
>>>> +    DesignwarePCIEViewport *viewport =3D
>>>> +        designware_pcie_root_get_current_viewport(root);
>>>> +
>>>> +    const uint8_t busnum =3D PCIE_ATU_BUS(viewport->target);
>>>> +    const uint8_t devfn  =3D PCIE_ATU_DEVFN(viewport->target);
>>>> +    PCIBus    *pcibus    =3D pci_get_bus(PCI_DEVICE(root));
>>>> +    PCIDevice *pcidev    =3D pci_find_device(pcibus, busnum, devfn);
>>>> +
>>>> +    if (pcidev) {
>>>> +        addr &=3D PCI_CONFIG_SPACE_SIZE - 1;
>>>> +
>>>> +        return pci_host_config_read_common(pcidev, addr,
>>>> +                                           PCI_CONFIG_SPACE_SIZE, len=
);
>>>> +    }
>>>
>>> You can use "pci_data_read" instead
>>
>> Good to know, will change.
>>
>>>>
>>>> +
>>>> +    return UINT64_MAX;
>>>> +}
>>>> +
>>>> +static void designware_pcie_root_data_write(void *opaque, hwaddr addr=
,
>>>> +                                            uint64_t val, unsigned le=
n)
>>>> +{
>>>> +    DesignwarePCIERoot *root =3D DESIGNWARE_PCIE_ROOT(opaque);
>>>> +    DesignwarePCIEViewport *viewport =3D
>>>> +        designware_pcie_root_get_current_viewport(root);
>>>> +    const uint8_t busnum =3D PCIE_ATU_BUS(viewport->target);
>>>> +    const uint8_t devfn  =3D PCIE_ATU_DEVFN(viewport->target);
>>>> +    PCIBus    *pcibus    =3D pci_get_bus(PCI_DEVICE(root));
>>>> +    PCIDevice *pcidev    =3D pci_find_device(pcibus, busnum, devfn);
>>>> +
>>>> +    if (pcidev) {
>>>> +        addr &=3D PCI_CONFIG_SPACE_SIZE - 1;
>>>> +        pci_host_config_write_common(pcidev, addr,
>>>> +                                     PCI_CONFIG_SPACE_SIZE,
>>>> +                                     val, len);
>>>> +    }
>>>
>>> You can use pci_data_write instead.
>>>
>>
>> Ditto.
>>
>>>> +}
>>>> +
>>>> +const MemoryRegionOps designware_pci_host_conf_ops =3D {
>>>> +    .read =3D designware_pcie_root_data_read,
>>>> +    .write =3D designware_pcie_root_data_write,
>>>> +    .endianness =3D DEVICE_NATIVE_ENDIAN,
>>>
>>>
>>> Maybe you want to limit the access size also here.
>>>
>>
>> OK, will do.
>>
>>>> +};
>>>> +
>>>> +static void designware_pcie_update_viewport(DesignwarePCIERoot *root,
>>>> +                                            DesignwarePCIEViewport
>>>> *viewport)
>>>> +{
>>>> +    DesignwarePCIEHost *host =3D designware_pcie_root_to_host(root);
>>>> +
>>>> +    MemoryRegion *mem     =3D &viewport->memory;
>>>> +    const uint64_t target =3D viewport->target;
>>>> +    const uint64_t base   =3D viewport->base;
>>>> +    const uint64_t size   =3D (uint64_t)viewport->limit - base + 1;
>>>> +    const bool inbound    =3D viewport->inbound;
>>>> +
>>>> +    MemoryRegion *source, *destination;
>>>> +    const char *direction;
>>>> +    char *name;
>>>> +
>>>> +    if (inbound) {
>>>> +        source      =3D &host->pci.address_space_root;
>>>> +        destination =3D get_system_memory();
>>>> +        direction   =3D "Inbound";
>>>> +    } else {
>>>> +        source      =3D get_system_memory();
>>>> +        destination =3D &host->pci.memory;
>>>> +        direction   =3D "Outbound";
>>>> +    }
>>>> +
>>>> +    if (memory_region_is_mapped(mem)) {
>>>> +        /* Before we modify anything, unmap and destroy the region */
>>>
>>>
>>> I saw this also before. Can you please explain a little
>>> why/when do you need to destroy prev mappings?
>>>
>>
>> They are going to be updated every time a viewport (inbound or
>> outbound) in address translation unit (iATU) is reconfigured. Because
>> PCIE_ATU_*_TARGET register is used to configure which deivce/bus to
>> address outgoing configuration TLP to, they (viewports) get
>> reconfigured quite a bit. Corresponding functions in Linux kernel
>> would be dw_pcie_prog_outbound_atu() and dw_pcie_rd_other_conf(). I
>> wouldn't be surprised that the way I went about implementing it is far
>> from optimal, so let me know if it is.
>>
>
> The same as above, I think memory_region_init_io should be used once.
>

Will do in v5.

>
>>>> +        memory_region_del_subregion(source, mem);
>>>> +        object_unparent(OBJECT(mem));
>>>> +    }
>>>> +
>>>> +    name =3D g_strdup_printf("PCI %s Viewport %p", direction, viewpor=
t);
>>>> +
>>>> +    switch (viewport->cr[0]) {
>>>> +    case PCIE_ATU_TYPE_MEM:
>>>> +        memory_region_init_alias(mem, OBJECT(root), name,
>>>> +                                 destination, target, size);
>>>> +        break;
>>>> +    case PCIE_ATU_TYPE_CFG0:
>>>> +    case PCIE_ATU_TYPE_CFG1:    /* FALLTHROUGH */
>>>> +        if (inbound) {
>>>> +            goto exit;
>>>> +        }
>>>> +
>>>> +        memory_region_init_io(mem, OBJECT(root),
>>>> +                              &designware_pci_host_conf_ops,
>>>> +                              root, name, size);
>>>> +        break;
>>>> +    }
>>>> +
>>>> +    if (inbound) {
>>>> +        memory_region_add_subregion_overlap(source, base,
>>>> +                                            mem, -1);
>>>> +    } else {
>>>> +        memory_region_add_subregion(source, base, mem);
>>>> +    }
>>>> +
>>>> + exit:
>>>> +    g_free(name);
>>>> +}
>>>> +
>>>> +static void designware_pcie_root_config_write(PCIDevice *d, uint32_t
>>>> address,
>>>> +                                              uint32_t val, int len)
>>>> +{
>>>> +    DesignwarePCIERoot *root =3D DESIGNWARE_PCIE_ROOT(d);
>>>> +    DesignwarePCIEHost *host =3D designware_pcie_root_to_host(root);
>>>> +    DesignwarePCIEViewport *viewport =3D
>>>> +        designware_pcie_root_get_current_viewport(root);
>>>> +
>>>> +    switch (address) {
>>>> +    case PCIE_PORT_LINK_CONTROL:
>>>> +    case PCIE_LINK_WIDTH_SPEED_CONTROL:
>>>> +    case PCIE_PHY_DEBUG_R1:
>>>> +        /* No-op */
>>>> +        break;
>>>> +
>>>> +    case PCIE_MSI_ADDR_LO:
>>>> +        root->msi.base &=3D 0xFFFFFFFF00000000ULL;
>>>> +        root->msi.base |=3D val;
>>>> +        break;
>>>> +
>>>> +    case PCIE_MSI_ADDR_HI:
>>>> +        root->msi.base &=3D 0x00000000FFFFFFFFULL;
>>>> +        root->msi.base |=3D (uint64_t)val << 32;
>>>> +        break;
>>>> +
>>>> +    case PCIE_MSI_INTR0_ENABLE: {
>>>> +        const bool update_msi_mapping =3D !root->msi.intr[0].enable ^
>>>> !!val;
>>>> +
>>>> +        root->msi.intr[0].enable =3D val;
>>>> +
>>>> +        if (update_msi_mapping) {
>>>> +            designware_pcie_root_update_msi_mapping(root);
>>>> +        }
>>>> +        break;
>>>> +    }
>>>> +
>>>> +    case PCIE_MSI_INTR0_MASK:
>>>> +        root->msi.intr[0].mask =3D val;
>>>> +        break;
>>>> +
>>>> +    case PCIE_MSI_INTR0_STATUS:
>>>> +        root->msi.intr[0].status ^=3D val;
>>>> +        if (!root->msi.intr[0].status) {
>>>> +            qemu_set_irq(host->pci.irqs[0], 0);
>>>> +        }
>>>> +        break;
>>>> +
>>>> +    case PCIE_ATU_VIEWPORT:
>>>> +        root->atu_viewport =3D val;
>>>> +        break;
>>>> +
>>>> +    case PCIE_ATU_LOWER_BASE:
>>>> +        viewport->base &=3D 0xFFFFFFFF00000000ULL;
>>>> +        viewport->base |=3D val;
>>>> +        break;
>>>> +
>>>> +    case PCIE_ATU_UPPER_BASE:
>>>> +        viewport->base &=3D 0x00000000FFFFFFFFULL;
>>>> +        viewport->base |=3D (uint64_t)val << 32;
>>>> +        break;
>>>> +
>>>> +    case PCIE_ATU_LOWER_TARGET:
>>>> +        viewport->target &=3D 0xFFFFFFFF00000000ULL;
>>>> +        viewport->target |=3D val;
>>>> +        break;
>>>> +
>>>> +    case PCIE_ATU_UPPER_TARGET:
>>>> +        viewport->target &=3D 0x00000000FFFFFFFFULL;
>>>> +        viewport->target |=3D val;
>>>> +        break;
>>>> +
>>>> +    case PCIE_ATU_LIMIT:
>>>> +        viewport->limit =3D val;
>>>> +        break;
>>>> +
>>>> +    case PCIE_ATU_CR1:
>>>> +        viewport->cr[0] =3D val;
>>>> +        break;
>>>> +    case PCIE_ATU_CR2:
>>>> +        viewport->cr[1] =3D val;
>>>> +
>>>> +        if (viewport->cr[1] & PCIE_ATU_ENABLE) {
>>>> +            designware_pcie_update_viewport(root, viewport);
>>>> +         }
>>>> +        break;
>>>> +
>>>> +    default:
>>>> +        pci_bridge_write_config(d, address, val, len);
>>>> +        break;
>>>> +    }
>>>> +}
>>>> +
>>>> +static int designware_pcie_root_init(PCIDevice *dev)
>>>> +{
>>>
>>>
>>> Please use "realize" function rather than init.
>>> We want to get rid of it eventually.
>>
>> OK, will do.
>>
>>>>
>>>> +    DesignwarePCIERoot *root =3D DESIGNWARE_PCIE_ROOT(dev);
>>>> +    PCIBridge *br =3D PCI_BRIDGE(dev);
>>>> +    DesignwarePCIEViewport *viewport;
>>>> +    size_t i;
>>>> +
>>>> +    br->bus_name  =3D "dw-pcie";
>>>> +
>>>> +    pci_set_word(dev->config + PCI_COMMAND,
>>>> +                 PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER);
>>>> +
>>>> +    pci_config_set_interrupt_pin(dev->config, 1);
>>>> +    pci_bridge_initfn(dev, TYPE_PCI_BUS);
>>>
>>> So this is a PCI Express Root Port "sitting" on PCI bus?
>>
>> Yes, it is a built-in PCIe bridge, whose configuration space is mapped
>> into CPU's address space (designware_pci_host_conf_ops) and the rest
>> of PCIe hierarchy is presented through it.
>
> My point was: is the bus PCIe or PCI? Because you used:
>   pci_bridge_initfn(dev, TYPE_PCI_BUS);
> and not
>   pci_bridge_initfn(dev, TYPE_PCIE_BUS);
>

Oops, my bad. Will fix in v5.

>>
>>>
>>>> +
>>>> +    pcie_port_init_reg(dev);
>>>> +
>>>> +    pcie_cap_init(dev, 0x70, PCI_EXP_TYPE_ROOT_PORT,
>>>> +                  0, &error_fatal);
>>>> +
>>>> +    msi_nonbroken =3D true;
>>>> +    msi_init(dev, 0x50, 32, true, true, &error_fatal);
>>>> +
>>>> +    for (i =3D 0; i < DESIGNWARE_PCIE_NUM_VIEWPORTS; i++) {
>>>> +        viewport =3D &root->viewports[DESIGNWARE_PCIE_VIEWPORT_INBOUN=
D][i];
>>>> +        viewport->inbound =3D true;
>>>> +    }
>>>> +
>>>> +    /*
>>>> +     * If no inbound iATU windows are configured, HW defaults to
>>>> +     * letting inbound TLPs to pass in. We emulate that by exlicitly
>>>> +     * configuring first inbound window to cover all of target's
>>>> +     * address space.
>>>> +     *
>>>> +     * NOTE: This will not work correctly for the case when first
>>>> +     * configured inbound window is window 0
>>>> +     */
>>>> +    viewport =3D &root->viewports[DESIGNWARE_PCIE_VIEWPORT_INBOUND][0=
];
>>>> +    viewport->base   =3D 0x0000000000000000ULL;
>>>> +    viewport->target =3D 0x0000000000000000ULL;
>>>> +    viewport->limit  =3D UINT32_MAX;
>>>> +    viewport->cr[0]  =3D PCIE_ATU_TYPE_MEM;
>>>> +
>>>> +    designware_pcie_update_viewport(root, viewport);
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static void designware_pcie_set_irq(void *opaque, int irq_num, int le=
vel)
>>>> +{
>>>> +    DesignwarePCIEHost *host =3D DESIGNWARE_PCIE_HOST(opaque);
>>>> +
>>>> +    qemu_set_irq(host->pci.irqs[irq_num], level);
>>>> +}
>>>> +
>>>> +static const char *designware_pcie_host_root_bus_path(PCIHostState
>>>> *host_bridge,
>>>> +                                                      PCIBus *rootbus=
)
>>>> +{
>>>> +    return "0000:00";
>>>> +}
>>>> +
>>>> +
>>>> +static void designware_pcie_root_class_init(ObjectClass *klass, void
>>>> *data)
>>>> +{
>>>> +    PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
>>>> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
>>>> +
>>>> +    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>>>> +
>>>> +    k->vendor_id =3D PCI_VENDOR_ID_SYNOPSYS;
>>>> +    k->device_id =3D 0xABCD;
>>>> +    k->revision =3D 0;
>>>> +    k->class_id =3D PCI_CLASS_BRIDGE_HOST;
>>>
>>> So is a Root Port with call is "BRIDGE_HOST" ?
>>>
>>
>> I think I am missing some PCI subsystem knowledge to understand that
>> question, would you mind re-phrasing it?
>
> Sure, a Root Port is a type of PCI bridge, so I was expecting
> the class id to be: PCI_CLASS_BRIDGE_PCI and not PCI_CLASS_BRIDGE_HOST.
>

Yeah, that just mistake on my part since real HW reports
0604/PCI_CLASS_BRIDGE_PCI. Will fix in v5.

Thanks,
Andrey Smirnov
