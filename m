Received: by 10.25.44.15 with SMTP id s15csp684539lfs;
        Wed, 5 Jul 2017 05:42:06 -0700 (PDT)
X-Received: by 10.55.14.85 with SMTP id 82mr57475549qko.193.1499258526659;
        Wed, 05 Jul 2017 05:42:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499258526; cv=none;
        d=google.com; s=arc-20160816;
        b=JWaOXaZPDUWR4TAoi8OXrLOjBHkUE2KxWMsk0aPNzydVbpRnkRKdqA3Gbqlzu9+B/q
         ewhWpoMQ54OW+XmZfjNiabrHroCNvitno1+tOoNigN+FW1DuhgWXaKK10qDSDlSsCgtU
         c/ISIYkUpWjvd42R1mt8kO5yQQNH5nKbdwAPvsuJq1kmt2Ald9vEanBPZ6N76tqEl5kh
         VdPy0+MSMOqqOCapKKSTHOtvH7Gmwu6XQD4lepOp7q4oZFiMm5tsZmz+r/XipbgSkPy1
         o3DMUejp+rpNaRUAwgDRWHhHOekXq2SLvjxftvTVlEoQS4jrcTrI6LZwu6kdeMSrrGRH
         0v8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=Czv5dtd9460YR074BDpibhOUlh8RnGyAnuxec0V5J2o=;
        b=kiMcS+VnIMMFDhtAEMLJQlhiZ8mMESkQAkMT2KUoskQTwhbO7j2n2JJ4qPzpbIMN77
         dxQV0WAPOjDZtOyfOOyQAahCoiWZvAZRaS3chavlIPaf+cHpt+qDXWX1poie1KMRfLYh
         ec83sjr0EU5AGDLn8nyO8SP8+NmSngleP/XbSlQs613kuUTCw8XEg2PVv1jJP0tNo8Wp
         USRNxx1VIJpiTAEhsZw6ycDZRwD1s5zyGdubtrPer7DlG8SW+35mIQTrU2/hOEef6q7a
         1JRDMPu4u9R+XlMFfg1OxoiMFfm6PUH9Qu0zaYxYZtNNtGXIuNCzvSJ9gUMI9LO82H9W
         g2UQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z24si21113086qth.247.2017.07.05.05.42.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Jul 2017 05:42:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46038 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dSjd6-0006R5-5E
	for alex.bennee@linaro.org; Wed, 05 Jul 2017 08:42:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56825)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>) id 1dSjd1-0006Pb-Lj
	for qemu-arm@nongnu.org; Wed, 05 Jul 2017 08:42:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>) id 1dSjcw-0005wO-QJ
	for qemu-arm@nongnu.org; Wed, 05 Jul 2017 08:41:59 -0400
Received: from foss.arm.com ([217.140.101.70]:34972)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>)
	id 1dSjcw-0005vy-H3; Wed, 05 Jul 2017 08:41:54 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A37AB2B;
	Wed,  5 Jul 2017 05:41:53 -0700 (PDT)
Received: from [10.1.211.12] (e106794-lin.cambridge.arm.com [10.1.211.12])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0AB1B3F557;
	Wed,  5 Jul 2017 05:41:50 -0700 (PDT)
To: "Tian, Kevin" <kevin.tian@intel.com>,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Auger Eric <eric.auger@redhat.com>, 
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
	<AADFC41AFE54684AB9EE6CBC0274A5D190D25AEB@SHSMSX101.ccr.corp.intel.com>
From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Message-ID: <19a85866-1e72-58b9-d120-8b5e5b809e90@arm.com>
Date: Wed, 5 Jul 2017 13:44:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D190D25AEB@SHSMSX101.ccr.corp.intel.com>
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
Cc: "drjones@redhat.com" <drjones@redhat.com>,
	"marc.zyngier@arm.com" <marc.zyngier@arm.com>,
	"tn@semihalf.com" <tn@semihalf.com>,
	"will.deacon@arm.com" <will.deacon@arm.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PCBIqjYsKm/v

On 05/07/17 08:14, Tian, Kevin wrote:
>> From: Jean-Philippe Brucker [mailto:jean-philippe.brucker@arm.com]
>> Sent: Monday, June 19, 2017 6:15 PM
>>
>> On 19/06/17 08:54, Bharat Bhushan wrote:
>>> Hi Eric,
>>>
>>> I started added replay in virtio-iommu and came across how MSI interrupts
>> with work with VFIO.
>>> I understand that on intel this works differently but vsmmu will have same
>> requirement.
>>> kvm-msi-irq-route are added using the msi-address to be translated by
>> viommu and not the final translated address.
>>> While currently the irqfd framework does not know about emulated
>> iommus (virtio-iommu, vsmmuv3/vintel-iommu).
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
>>
>> I'm also wondering about the benefits of having SW-mapped MSIs in the
>> guest. It seems unavoidable for vSMMU since that's what a physical system
>> would do. But in a paravirtualized solution there doesn't seem to be any
>> compelling reason for having the guest map MSI doorbells. These addresses
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
> 
> What do you mean by "fixed MSI doorbell"? PCI MSI-X table is part of
> PCI MMIO bar. Accessing to it is just a memory virtualization issue (e.g.
> trap by KVM and then emulated in Qemu) on x86. It's not a IOMMU
> problem. I guess you may mean same thing but want to double confirm
> here given the terminology confusion. Or do you mean the interrupt
> triggered by IOMMU itself?

Yes I didn't mean access to the MSI-X table, but how we interpret the
address in the MSI message. In kvmtool I create MSI routes for VFIO
devices when the guest accesses the MSI-X tables. And on ARM the tables
contains an IOVA that needs to be translated into a PA, so handling a
write to an MSI-X entry might mean doing the IOVA->PA translation of the
doorbell.

On x86 the MSI address is 0xfee...., whether there is an IOMMU or not.
That's what I meant by fixed. And it is the IOMMU that performs IRQ remapping.

On physical ARM systems, the SMMU doesn't treat any special address range
as "MSI window". For the SMMU, an MSI is simply a memory transaction. MSI
addresses are arbitrary IOVAs that get translated into PAs by the SMMU.
The SMMU doesn't perform any IRQ remapping, only address translation. This
PA is a doorbell register in the irqchip, which performs IRQ remapping and
triggers an interrupt.

Therefore in an emulated ARM system, when the guest writes the MSI-X
table, it writes an IOVA. In a strict emulation the MSI would have to
first go through the vIOMMU, and then into the irqchip. I was wondering if
with virtio-iommu we could skip the address translation and go to the MSI
remapping component immediately, effectively implementing a "hardware MSI
window". This is what x86 does, the difference being that MSI remapping is
done by the IOMMU on x86, and by the irqchip on ARM.

My current take is that we should keep the current behavior, but I will
try to sort out the different ways of implementing MSIs with virtio-iommu
in the next specification draft.

Thanks,
Jean
