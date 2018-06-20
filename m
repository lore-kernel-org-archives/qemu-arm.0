Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp425093wrq;
        Wed, 20 Jun 2018 00:10:54 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIpjinigwgoNeywn9puI0RygbHeMEt97zE9OkbkuKV2Hgwl09OFgT4MtLZs7pdn6lxQ1LGE
X-Received: by 2002:a0c:d0eb:: with SMTP id b40-v6mr17095612qvh.236.1529478654148;
        Wed, 20 Jun 2018 00:10:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529478654; cv=none;
        d=google.com; s=arc-20160816;
        b=mFbpsqKlC2pnDz66LXle8YAD3sLbtx9q4dDFNRv1hg6wGK69yG281UM17OjP99ysm4
         eVMxzwRE2JLMPg3qQ3cYcZH4E+JPGIw4Uys2EojLDKk04LhToQ9iNXSa0hIwAdFPC6lE
         3bQbncBfIaVo6bWztCAgDUEISRjvow4kWu6Ty5FmaU/vCw72Nwe8NgKO+b2l4Xd5MYez
         fF6d6waimv+r1akfwXJ0uvlX9o7u9X8EDZ3vhCHy8kW5UnXWV9sVWR4niQNnFByueqXs
         IweAAuXcaeVBWEljee//oHB6RBIkPewIFku0nol+if/n4A8nZoJS9fF2a/r10TCDmeXY
         IsKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=yUWsEokq7QQdhpclUWkuajkTXAeqgJ1nkz8ddxUSrY0=;
        b=SiLfKsmWN6JTjymB1pV0T9qGdTvTUKaP0eODZ06zp+zIc7lBVASDM/dxau4iCYlvIN
         eEak6lRfQuTh1YRJti3YrKSAbz84BgX9RMQXjDhI4nmuzgJC/PS5PBPgDbmsRYFQ5r60
         rZCVtSX5Wis4ZBk8EKyFOt6GunwlNSt0OvPZ5plyMPAy1wu4Qkky76AvOBsPUv2zK35l
         Y+zspcfx+96A//Df+OZIBGkxov1DQVvm8wQCYKSNMjozF68V6Pgr5in3jgVmpeXRtXF6
         P4ignozh+6zW4V57VII0n4TbPV4YGTd6qLYavPXRodlf2cNA4WA1nSWK35vavgmi4ppH
         Viiw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 32-v6si1810653qvn.112.2018.06.20.00.10.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jun 2018 00:10:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46365 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVXGX-0000UM-Kv
	for alex.bennee@linaro.org; Wed, 20 Jun 2018 03:10:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47371)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fVXGN-0000UB-5H
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 03:10:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fVXGL-0002lE-Ja
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 03:10:42 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:52820 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fVXGL-0002kE-Cd; Wed, 20 Jun 2018 03:10:41 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7D1BE805A531;
	Wed, 20 Jun 2018 07:10:39 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-106.ams2.redhat.com
	[10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DE56C7C20;
	Wed, 20 Jun 2018 07:10:35 +0000 (UTC)
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	Laszlo Ersek <lersek@redhat.com>
References: <1529072910-16156-1-git-send-email-eric.auger@redhat.com>
	<1529072910-16156-6-git-send-email-eric.auger@redhat.com>
	<a4204e03-735d-28b9-7cc5-d51fd727b91f@redhat.com>
	<CAKv+Gu9wYtzo86-hqVDX=79cKix_BfVGCh5Wn08ApRZ5Km_Vjg@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <51b9c330-ed48-e75c-0c8a-ffa8e1794e95@redhat.com>
Date: Wed, 20 Jun 2018 09:10:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAKv+Gu9wYtzo86-hqVDX=79cKix_BfVGCh5Wn08ApRZ5Km_Vjg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Wed, 20 Jun 2018 07:10:39 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Wed, 20 Jun 2018 07:10:39 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 05/11] hw/arm/virt: GICv3 DT
 node with one or two redistributor regions
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	Marc Zyngier <marc.zyngier@arm.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Christoffer Dall <christoffer.dall@arm.com>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <zhaoshenglong@huawei.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nPPnDG8RPAnW

Hi Laszlo,

On 06/19/2018 09:02 PM, Ard Biesheuvel wrote:
> On 19 June 2018 at 20:53, Laszlo Ersek <lersek@redhat.com> wrote:
>> Hi Eric,
>>
>> sorry about the late followup. I have one question (mainly for Ard):
>>
>> On 06/15/18 16:28, Eric Auger wrote:
>>> This patch allows the creation of a GICv3 node with 1 or 2
>>> redistributor regions depending on the number of smu_cpus.
>>> The second redistributor region is located just after the
>>> existing RAM region, at 256GB and contains up to up to 512 vcpus.
>>>
>>> Please refer to kernel documentation for further node details:
>>> Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>> Reviewed-by: Andrew Jones <drjones@redhat.com>
>>>
>>> ---
>>> v1 (virt3.0) -> v2
>>> - Added Drew's R-b
>>>
>>> v2 -> v3:
>>> - VIRT_GIC_REDIST2 is now 64MB large, ie. 512 redistributor capacity
>>> - virt_gicv3_redist_region_count does not test kvm_irqchip_in_kernel
>>>   anymore
>>> ---
>>>  hw/arm/virt.c         | 29 ++++++++++++++++++++++++-----
>>>  include/hw/arm/virt.h | 14 ++++++++++++++
>>>  2 files changed, 38 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>> index 2885d18..d9f72eb 100644
>>> --- a/hw/arm/virt.c
>>> +++ b/hw/arm/virt.c
>>> @@ -148,6 +148,8 @@ static const MemMapEntry a15memmap[] = {
>>>      [VIRT_PCIE_PIO] =           { 0x3eff0000, 0x00010000 },
>>>      [VIRT_PCIE_ECAM] =          { 0x3f000000, 0x01000000 },
>>>      [VIRT_MEM] =                { 0x40000000, RAMLIMIT_BYTES },
>>> +    /* Additional 64 MB redist region (can contain up to 512 redistributors) */
>>> +    [VIRT_GIC_REDIST2] =        { 0x4000000000ULL, 0x4000000 },
>>>      /* Second PCIe window, 512GB wide at the 512GB boundary */
>>>      [VIRT_PCIE_MMIO_HIGH] =   { 0x8000000000ULL, 0x8000000000ULL },
>>>  };
>>> @@ -401,13 +403,30 @@ static void fdt_add_gic_node(VirtMachineState *vms)
>>>      qemu_fdt_setprop_cell(vms->fdt, "/intc", "#size-cells", 0x2);
>>>      qemu_fdt_setprop(vms->fdt, "/intc", "ranges", NULL, 0);
>>>      if (vms->gic_version == 3) {
>>> +        int nb_redist_regions = virt_gicv3_redist_region_count(vms);
>>> +
>>>          qemu_fdt_setprop_string(vms->fdt, "/intc", "compatible",
>>>                                  "arm,gic-v3");
>>> -        qemu_fdt_setprop_sized_cells(vms->fdt, "/intc", "reg",
>>> -                                     2, vms->memmap[VIRT_GIC_DIST].base,
>>> -                                     2, vms->memmap[VIRT_GIC_DIST].size,
>>> -                                     2, vms->memmap[VIRT_GIC_REDIST].base,
>>> -                                     2, vms->memmap[VIRT_GIC_REDIST].size);
>>> +
>>> +        qemu_fdt_setprop_cell(vms->fdt, "/intc",
>>> +                              "#redistributor-regions", nb_redist_regions);
>>> +
>>> +        if (nb_redist_regions == 1) {
>>> +            qemu_fdt_setprop_sized_cells(vms->fdt, "/intc", "reg",
>>> +                                         2, vms->memmap[VIRT_GIC_DIST].base,
>>> +                                         2, vms->memmap[VIRT_GIC_DIST].size,
>>> +                                         2, vms->memmap[VIRT_GIC_REDIST].base,
>>> +                                         2, vms->memmap[VIRT_GIC_REDIST].size);
>>> +        } else {
>>> +            qemu_fdt_setprop_sized_cells(vms->fdt, "/intc", "reg",
>>> +                                         2, vms->memmap[VIRT_GIC_DIST].base,
>>> +                                         2, vms->memmap[VIRT_GIC_DIST].size,
>>> +                                         2, vms->memmap[VIRT_GIC_REDIST].base,
>>> +                                         2, vms->memmap[VIRT_GIC_REDIST].size,
>>> +                                         2, vms->memmap[VIRT_GIC_REDIST2].base,
>>> +                                         2, vms->memmap[VIRT_GIC_REDIST2].size);
>>> +        }
>>> +
>>>          if (vms->virt) {
>>>              qemu_fdt_setprop_cells(vms->fdt, "/intc", "interrupts",
>>>                                     GIC_FDT_IRQ_TYPE_PPI, ARCH_GICV3_MAINT_IRQ,
>>
>> In edk2, we have the following code in
>> "ArmVirtPkg/Library/ArmVirtGicArchLib/ArmVirtGicArchLib.c":
>>
>>   switch (GicRevision) {
>>
>>   case 3:
>>     //
>>     // The GIC v3 DT binding describes a series of at least 3 physical (base
>>     // addresses, size) pairs: the distributor interface (GICD), at least one
>>     // redistributor region (GICR) containing dedicated redistributor
>>     // interfaces for all individual CPUs, and the CPU interface (GICC).
>>     // Under virtualization, we assume that the first redistributor region
>>     // listed covers the boot CPU. Also, our GICv3 driver only supports the
>>     // system register CPU interface, so we can safely ignore the MMIO version
>>     // which is listed after the sequence of redistributor interfaces.
>>     // This means we are only interested in the first two memory regions
>>     // supplied, and ignore everything else.
>>     //
>>     ASSERT (RegSize >= 32);
>>
>>     // RegProp[0..1] == { GICD base, GICD size }
>>     DistBase = SwapBytes64 (Reg[0]);
>>     ASSERT (DistBase < MAX_UINTN);
>>
>>     // RegProp[2..3] == { GICR base, GICR size }
>>     RedistBase = SwapBytes64 (Reg[2]);
>>     ASSERT (RedistBase < MAX_UINTN);
>>
>>     PcdStatus = PcdSet64S (PcdGicDistributorBase, DistBase);
>>     ASSERT_RETURN_ERROR (PcdStatus);
>>     PcdStatus = PcdSet64S (PcdGicRedistributorsBase, RedistBase);
>>     ASSERT_RETURN_ERROR (PcdStatus);
>>
>>     DEBUG ((EFI_D_INFO, "Found GIC v3 (re)distributor @ 0x%Lx (0x%Lx)\n",
>>       DistBase, RedistBase));
>>
>> (I vaguely recall that I may have quoted this already, but I'm not
>> sure.)
I don't remember you did ;-)
>>
>> My understanding is that this will continue working -- as long as we
>> don't want to boot up multiple CPUs in UEFI, anyway.
>>
>> I think we have no plans for adding (well, for implementing)
>> EFI_PEI_MP_SERVICES_PPI or EFI_MP_SERVICES_PROTOCOL for ARM -- do you
>> agree, Ard?
>>
> 
> Yes I agree. Only the boot cpu should enter UEFI, and although there
> are some remnants of multi core ARM stuff in the EDK2 tree, I would
> prefer to get rid of that as soon as we can.
> 
>> (That PPI and PROTOCOL are totally unnecessary unless it is
>> architecturally required to configure various CPU features on each
>> (V)CPU *individually*, before leaving the firmware. Unfortunately, x86
>> has some CPU warts like that, and said PPI and PROTOCOL implementations
>> for x86 have given us a good dose of grief over time. I very much hope
>> the PPI and the PROTOCOL will never be needed on ARM!)
>>
> 
> That kind of configuration typically occurs in the secure firmware on
> an ARM system, and not at all on a virtual machine.
> 
>>
>> Eric, I reckon you tested this patch with the ArmVirtQemu firmware too,
>> covering both branches of the code, and with multiple VCPUs in both
>> cases. Can you please confirm?
I tested the high ECAM part with both 32b and 64b FW. However the
multiple redistributor region part only was tested with 64b FW. The
reason is Moonshot which I used to test accelerated aarch32 guest has a
GICv2 so I can't test the GICv3 redist part on it.

However if my understanding is correct as the above check only is done
on the 1st redist, which is located in the low redist region, this
series shouldn't introduce any regression.

Thanks

Eric
>>
>> Thanks
>> Laszlo
