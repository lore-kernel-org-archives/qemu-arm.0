Received: by 10.25.44.15 with SMTP id s15csp794943lfs;
        Fri, 14 Jul 2017 04:22:47 -0700 (PDT)
X-Received: by 10.55.156.193 with SMTP id f184mr10849024qke.102.1500031367830;
        Fri, 14 Jul 2017 04:22:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500031367; cv=none;
        d=google.com; s=arc-20160816;
        b=vV6WxJ2VzstdCflxMTo6EVigEQmjaVnFF3nmRuOYZbkq54G0X44HoLpyeP51Ga+oc4
         vkGNxWh0vy8yazErvvEvbUNHZa+/HzY45FaWg0G5RmFoMvHjawl9HK/xGj51B33UB4UH
         dIDU4vlPj2qhoQpFaXvG8xRlaoI0R/X2I9GEZ8YMPo3h0AZTSC1qD3kHnC+c32tomv7Q
         Zuc7eQPHRPyECYF1wuZJT3nGVwUivhNGd+A6ZarRhnJOn34N88sBmEiEdVBceKWL+8Dm
         O4x2uKcOPxFulGmCMAXZf68iaThA56juRDpl5VgS2dFYwoffubkRdvS/dTMYFCsp6DX5
         eFcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=7x4usoydScsxy9uHDokc1L4i/4/XfaKa2bMTt4JzUC4=;
        b=cjst0uf4BO5dzxc5a9nPdzK7cuyBbyf0+Yb3ymPaS8ahna3Ej/pQAJb/8PerIk4R//
         8gt7gK1nL/cYadQ6ngY3QMCALPmho2viI7QTXot3+fttzQzWi9gtm6kN7mv0udNi5jtD
         I68sMgENUFjvf6catWJHjaq/UI9fk0DLQNo4gJ+UXNZUU5JsXfZWxyPS5dYYza9LG9NR
         7nLIzlcQffULD+H9ANqxibcFHVkMYHM0YQZi2NlFK1am3L1iR6V1LawWEK8w1bMP/y2L
         Kp4QL8dHAoptBYd9MZ3Y+xBdVmf8GykMJpqduxKvQ5t93iGFsbeko8VI6DsJeZ030Exo
         ShOw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j31si7352458qtb.341.2017.07.14.04.22.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 14 Jul 2017 04:22:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37091 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVygH-0007xH-1I
	for alex.bennee@linaro.org; Fri, 14 Jul 2017 07:22:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60603)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>) id 1dVygA-0007tx-F7
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 07:22:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>) id 1dVyg7-0004tQ-99
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 07:22:38 -0400
Received: from foss.arm.com ([217.140.101.70]:54652)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>)
	id 1dVyg7-0004sP-0M; Fri, 14 Jul 2017 07:22:35 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 573F480D;
	Fri, 14 Jul 2017 04:22:34 -0700 (PDT)
Received: from [10.1.211.12] (e106794-lin.cambridge.arm.com [10.1.211.12])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA5433F578;
	Fri, 14 Jul 2017 04:22:31 -0700 (PDT)
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
	<19a85866-1e72-58b9-d120-8b5e5b809e90@arm.com>
	<AADFC41AFE54684AB9EE6CBC0274A5D190D2B865@SHSMSX101.ccr.corp.intel.com>
	<1c78deea-a1c9-2ef7-113a-f6be93888560@arm.com>
	<AADFC41AFE54684AB9EE6CBC0274A5D190D3834F@SHSMSX101.ccr.corp.intel.com>
From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Message-ID: <bc006783-3667-07ec-995a-6a7e9000daaa@arm.com>
Date: Fri, 14 Jul 2017 12:25:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D190D3834F@SHSMSX101.ccr.corp.intel.com>
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
X-TUID: xokoTVj70AI7

On 14/07/17 08:20, Tian, Kevin wrote:
>> From: Jean-Philippe Brucker [mailto:jean-philippe.brucker@arm.com]
>> Sent: Friday, July 7, 2017 11:15 PM
>>
>> On 07/07/17 07:21, Tian, Kevin wrote:
>>> sorry I didn't quite get this part, and here is my understanding:
>>>
>>> Guest programs vIOMMU to map a gIOVA (used by MSI to a GPA
>>> of doorbell register of virtual irqchip. vIOMMU then
>>> triggers VFIO map/unmap to update physical IOMMU page
>>> table for gIOVA -> HPA of real doorbell of physical irqchip
>>
>> At the moment (non-SVM), physical and virtual MSI doorbell are completely
>> dissociated. VFIO itself maps the doorbell GPA->HPA during container
>> initialization. The GPA, chosen arbitrarily by the host, is then removed
>> from the guest GPA space.
> 
> got you. I also got some basic understanding from below link. :-)
> 
> https://www.linaro.org/blog/core-dump/kvm-pciemsi-passthrough-armarm64/
> 
>>
>> When the guest programs the vIOMMU to map a gIOVA to the virtual irqchip
>> doorbell, I suppose Qemu will notice that the GPA doesn't correspond to
>> RAM and will withhold sending a VFIO_IOMMU_MAP_DMA request.
>>
>> (For SVM I don't want to go into the details just now, but we will
>> probably need a separate VFIO mechanism to update the physical MSI-X
>> tables with whatever gIOVA the guest mapped in its private stage-1 page
>> tables.)
> 
> I guess there may be either a terminology difference or a hardware
> difference here, since I noted you mentioned IOVA with stage-1
> multiple times.
> 
> For Intel VT-d:
> 
> - stage-1 is only for VA translation, tagged with PASID
> - stage-2 can be used for IOVA translation on bare metal or GPA/gIOVA
> translation in virtualization, w/o PASID tagged

The terminology is indeed a bit confusing, and the hardware slightly
different. For me IOVA is the address used as input of the pIOMMU, PA is
the output address, and GPA only exists if there is stage-1 + stage-2. So
I think what I meant by gIOVA above was VA in your description.

I understand your "stage-1" and "stage-2" are named "first-level" and
"second level" in the VT-d spec?

If I read the VT-d spec correctly, I think the main difference on ARM SMMU
is that stage-2 always follows stage-1 translation, but either stage may
be disabled (or both, for bypass mode). There is no mode like in VT-d,
where non-PASID transactions go only through stage-2 and PASID
transactions go only through stage-1. I believe this is (NESTE=0,
T=000b/001b) in the Extended-Context-Entry.

Something equivalent in SMMU is disabling stage-2 and using the entry 0 in
the PASID table for non-PASID traffic. In this mode, traffic that uses
PASID#0 would be aborted. So using your terms, the SMMU can have VAs and
IOVAs be translated by stage-1 and then, if enabled, be translated by
stage-2 as well.

Thanks,
Jean

> Does ARM SMMU allow stage-1 used for both VA and IOVA? IIRC
> you said PASID#0 reserved for traffic w/o PASID in some mail...>
>>> (assume your irqchip will provide multiple doorbells so each
>>> device can have its own channel).
>>
>> In existing irqchips the doorbell is shared by endpoints, which are
>> differentiated by their device ID (generally the BDF). I'm not sure why
>> this matters here?
> 
> Not matter now with device ID
> 
>>
>>> then once this update is
>>> done, later MSI interrupts from assigned device will go
>>> through physical IOMMU (gIOVA->HPA) then reach irqchip
>>> for irq remapping. vIOMMU is involved only in configuration
>>> path instead of actual interrupt path.
>>
>> Yes the vIOMMU is used to correlate the IOVA written by the guest in its
>> virtual MSI-X table with the MAP request received by the vIOMMU. That is
>> probably used to setup IRQFD routes with KVM. But the vIOMMU is not
>> involved further than that in MSIs.
>>
>>> If my understanding is correct, above will be the natural flow then
>>> why is additional virtio-iommu change required? :-)
>>
>> The change is not *required* for ARM systems, I only proposed removing the
>> doorbell address translation stage to make host implementation simpler
>> (and since virtio-iommu on x86 won't translate the doorbell anyway, we
>> have to add support for this to virtio-iommu). But for Qemu, since vSMMU
>> needs to implement the natural flow anyway, it might not be a lot of
>> effort to also do it for virtio-iommu. Other implementations (e.g.
>> kvmtool) might piggy-back on the x86 way and declare the irqchip doorbell
>> as untranslated.
>>
>> My proposal also breaks when confronted to virtual SVM in a physical ARM
>> system, where the guest owns stage-1 page tables and *has* to map the
>> doorbell if it wants MSIs to work, so you can disregard it :)
>>
> 
> It is a good learning. thanks.
> 

