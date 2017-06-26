Received: by 10.25.15.197 with SMTP id 66csp1475451lfp;
        Mon, 26 Jun 2017 09:11:15 -0700 (PDT)
X-Received: by 10.200.35.168 with SMTP id q37mr1308311qtq.129.1498493475832;
        Mon, 26 Jun 2017 09:11:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498493475; cv=none;
        d=google.com; s=arc-20160816;
        b=K6zgNPaL4RBKBVAdwmEC7VF5slQdoy9SZJMDVY3i4XcOWIFJ/UVLYmjhncU0lyw52g
         DJc0uwrWtwOtYssqCtg/mroKV/45B3kSoaO1mR2LyNJ0LuEYhGYDm6o35WQmItF4KdWf
         qGUinfWdRn6V4ZU9wS7SKPt2AbnGfeOBQnP2n3+1lbV2mSfKyRyGe5EyCZHyYF2M7EzO
         GJUAqaDugbt/7W1a43TnTMQG6gjKXFPpIfcVkMnopPNZEbJAimN8h3Ir5RdvRqIAd8ZS
         pUBrWFdPPeiQcnFPkGIJidpoNK5VkKUO5GfjAq8dZcYPRlzh8deIgYjy0F2UD487UO2T
         QUXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=u3RBReS1sjTMPHVESS2OnRuhnRCw4xjJ88gtXRFVTZk=;
        b=w6A/cU4oUhcLwWkYEEMrolny7lFsudXv4kXBH3XctQupsXh71c+Ob4kpdwoSGzfrbX
         ESX3FJlYSO0Hxh0johGjOqeab7tKcZVHn4+S/Hbz+N1xoUyhJZBHI6TIqnE1zLbl/hFh
         ytc4hqfjAa8c6dAJlaHum8DNI7+SmapYrRHdTeowKcyN8gtBZ58seK7lHTS/7FPeGmvW
         uAzp40J0QuDfhSyhtEFmxJhS3Ig51DclPpqgcOCY2Laf2RhVe7XKqXkX8NQc1QYbB0HT
         jTtyx4U1CNgEZ8uo5mVjnQnt0Jtfj+WczLB8uJ3Q76t/djQofIq0vnVaQUir5htrZKb8
         Bumg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e35si396398qtd.48.2017.06.26.09.11.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Jun 2017 09:11:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47490 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dPWbZ-0002YE-7N
	for alex.bennee@linaro.org; Mon, 26 Jun 2017 12:11:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44651)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>) id 1dPWbU-0002Y4-PF
	for qemu-arm@nongnu.org; Mon, 26 Jun 2017 12:11:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>) id 1dPWbQ-0003Tx-LX
	for qemu-arm@nongnu.org; Mon, 26 Jun 2017 12:11:08 -0400
Received: from foss.arm.com ([217.140.101.70]:53864)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>)
	id 1dPWbQ-0003TP-8T; Mon, 26 Jun 2017 12:11:04 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0BE680D;
	Mon, 26 Jun 2017 09:11:01 -0700 (PDT)
Received: from [10.1.211.12] (e106794-lin.cambridge.arm.com [10.1.211.12])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D0633F4FF;
	Mon, 26 Jun 2017 09:10:59 -0700 (PDT)
To: Auger Eric <eric.auger@redhat.com>,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"mst@redhat.com" <mst@redhat.com>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
	<AM5PR0401MB2545AFD256A96420ACC44CD89ACE0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<14c83c14-1e7e-f142-77b0-fa8c873e2d41@redhat.com>
	<AM5PR0401MB2545C0E76C4BE6F82FE376D09ACE0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<6f22079e-4b4b-6476-77be-51ec83104c0d@redhat.com>
	<AM5PR0401MB25459FDAA8C9AFA52503AAE99AC40@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<589f1642-775c-4805-74ac-bf67eb504733@arm.com>
	<5f47e723-1d3e-433b-cdaf-a56d16ba377e@redhat.com>
From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Message-ID: <d4277d93-d29d-7150-7962-bdfdd1c2a275@arm.com>
Date: Mon, 26 Jun 2017 17:13:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <5f47e723-1d3e-433b-cdaf-a56d16ba377e@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 217.140.101.70
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v2 0/8] VIRTIO-IOMMU device
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
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>,
	"marc.zyngier@arm.com" <marc.zyngier@arm.com>,
	"tn@semihalf.com" <tn@semihalf.com>,
	"will.deacon@arm.com" <will.deacon@arm.com>,
	"drjones@redhat.com" <drjones@redhat.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ojVdaAlD44gb

On 26/06/17 09:22, Auger Eric wrote:
> Hi Jean-Philippe,
> 
> On 19/06/2017 12:15, Jean-Philippe Brucker wrote:
>> On 19/06/17 08:54, Bharat Bhushan wrote:
>>> Hi Eric,
>>>
>>> I started added replay in virtio-iommu and came across how MSI interrupts with work with VFIO. 
>>> I understand that on intel this works differently but vsmmu will have same requirement. 
>>> kvm-msi-irq-route are added using the msi-address to be translated by viommu and not the final translated address.
>>> While currently the irqfd framework does not know about emulated iommus (virtio-iommu, vsmmuv3/vintel-iommu).
>>> So in my view we have following options:
>>> - Programming with translated address when setting up kvm-msi-irq-route
>>> - Route the interrupts via QEMU, which is bad from performance
>>> - vhost-virtio-iommu may solve the problem in long term
>>>
>>> Is there any other better option I am missing?
>>
>> Since we're on the topic of MSIs... I'm currently trying to figure out how
>> we'll handle MSIs in the nested translation mode, where the guest manages
>> S1 page tables and the host doesn't know about GVA->GPA translation.
> 
> I have a question about the "nested translation mode" terminology. Do
> you mean in that case you use stage 1 + stage 2 of the physical IOMMU
> (which the ARM spec normally advises or was meant for) or do you mean
> stage 1 implemented in vIOMMU and stage 2 implemented in pIOMMU. At the
> moment my understanding is for VFIO integration the pIOMMU uses a single
> stage combining both the stage 1 and stage2 mappings but the host is not
> aware of those 2 stages.

Yes at the moment the VMM merges stage-1 (GVA->GPA) from the guest with
its stage-2 mappings (GPA->HPA) and creates a stage-2 mapping (GVA->HPA)
in the pIOMMU via VFIO_IOMMU_MAP_DMA. stage-1 is disabled in the pIOMMU.

What I mean by "nested mode" is stage 1 + stage 2 in the physical IOMMU.
I'm referring to the "Page Table Sharing" bit of the Future Work in the
initial RFC for virtio-iommu [1], and also PASID table binding [2] in the
case of vSMMU. In that mode, stage-1 page tables in the pIOMMU are managed
by the guest, and the VMM only maps GPA->HPA.

Since both s1 and s2 are then enabled in the pIOMMU, MSIs reaching the
pIOMMU will be translated at s1 then s2. To create nested translation for
MSIs, I see two solutions:

A. The GPA of the doorbell that is exposed to the guest is mapped by the
VMM at S2. This mapping is GPA->(PA of the doorbell) with Dev-nGnRE memory
attributes. The guest creates a GVA->GPA mapping, then writes GVA in the
MSI-X tables.
- If the MSI-X table is emulated (as we currently do), VMM has to force
  the host to rewrite the physical MSIX entry with the GVA.
- If the MSI-X table is mapped (see [3]), then the guest writes
  the GVA into the physical MSI-X entry. (How does this work with lazy MSI
  routing setup, that is based on trapping MSIX table?)

B. The VMM exposes a fake doorbell. Hardware MSI vectors are programmed
upfront by the host. Since TTB0 is assigned to the guest, then host must
use TTB1 to create the GVA->GPA mapping.

Solution B was my proposal (2) below, but I didn't take vSMMU into account
at the time. I think that for virtual SVM with the vSMMU, the VMM has to
hand the whole PASID table over to the guest. This is what Intel seems to
do [2]. Even if we emulated the PASID table instead of handing it over, we
wouldn't have a way to hide TTB1 from the guest. So with vSMMU we loose
control over TTB1 and (2) doesn't work.

I don't really like A, but it might be the only way with vSMMU:
- Guest maps doorbell at S1,
- Guest writes the GVA in its virtual MSI-X tables,
- Host handles the GVA write and reprograms the hardware MSI-X tables,
- Device issues an MSI, which gets translated at S1+S2, then hits the
  doorbell,
- VFIO handles the IRQ, which is forwarded to KVM via IRQFD, finds the
  corresponding irqchip by GPA, then injects the MSI.

>> I'm also wondering about the benefits of having SW-mapped MSIs in the
>> guest. It seems unavoidable for vSMMU since that's what a physical system
>> would do. But in a paravirtualized solution there doesn't seem to be any
>> compelling reason for having the guest map MSI doorbells.
> 
> If I understand correctly the virtio-iommu would not expose MSI reserved
> regions (saying it does not translates MSIs). In that case he VFIO
> kernel code will not check the irq_domain_check_msi_remap() but will
> check iommu_capable(bus, IOMMU_CAP_INTR_REMAP) instead. Would the
> virtio-iommu expose this capability? How would it isolate MSI
> transactions from different devices?

Yes, the virtio-iommu would expose IOMMU_CAP_INTR_REMAP to keep VFIO
happy. But the virtio-iommu device wouldn't do any MSI isolation. We have
software-mapped doorbell on ARM because MSI transactions are translated by
the SMMU before reaching the GIC, which then performs device isolation.
With virtio-iommu on ARM, the address translation stage seems unnecessary
if you already have a vGIC handling device isolation. So maybe MSIs could
bypass the vIOMMU in that case.

However on x86, I think we will need to handle MSI remapping in the
virtio-iommu itself, since that's what x86 platforms expect. In this case
the guest doesn't have to create an IOMMU mapping for doorbell addresses
either, but might need to manage some form of IRQ remapping table (on
which I still have a tonne of research to do.)

Thanks,
Jean

[1] https://www.spinics.net/lists/kvm/msg147993.html
[2] https://www.spinics.net/lists/kvm/msg148798.html
[3] https://lkml.org/lkml/2017/6/15/34

> Thanks
> 
> Eric
> 
> 
>  These addresses
>> are never accessed directly, they are only used for setting up IRQ routing
>> (at least on kvmtool). So here's what I'd like to have. Note that I
>> haven't investigated the feasibility in Qemu yet, I don't know how it
>> deals with MSIs.
>>
>> (1) Guest uses the guest-physical MSI doorbell when setting up MSIs. For
>> ARM with GICv3 this would be GITS_TRANSLATER, for x86 it would be the
>> fixed MSI doorbell. This way the host wouldn't need to inspect IOMMU
>> mappings when handling writes to PCI MSI-X tables.
>>
>> (2) In nested mode (with VFIO) on ARM, the pSMMU will still translate MSIs
>> via S1+S2. Therefore the host needs to map MSIs at stage-1, and I'd like
>> to use the (currently unused) TTB1 tables in that case. In addition, using
>> TTB1 would be useful for SVM, when endpoints write MSIs with PASIDs and we
>> don't want to map them in user address space.
>>
>> This means that the host needs to use different doorbell addresses in
>> nested mode, since it would be unable to map at S1 the same IOVA as S2
>> (TTB1 manages negative addresses - 0xffff............, which are not
>> representable as GPAs.) It also requires to use 32-bit page tables for
>> endpoints that are not capable of using 64-bit MSI addresses.
>>
>>
>> Now (2) is entirely handled in the host kernel, so it's more a Linux
>> question. But does (1) seem acceptable for virtio-iommu in Qemu?
>>
>> Thanks,
>> Jean
>>

