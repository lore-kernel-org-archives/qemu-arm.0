Received: by 10.25.44.15 with SMTP id s15csp3006805lfs;
        Fri, 7 Jul 2017 00:31:51 -0700 (PDT)
X-Received: by 10.55.104.85 with SMTP id d82mr59670748qkc.165.1499412711384;
        Fri, 07 Jul 2017 00:31:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499412711; cv=none;
        d=google.com; s=arc-20160816;
        b=yssbvX1ca4xeQm3+VeoDFBsQRNaPjeCGPtXSwQskPYMrzexZl63oEYj/dY+hTh9REb
         PFglLg5XkaOe7l3k7zlFtLv8pl1rGe3TRm7kMAIr67CR5yy5Gojjz5EL1OSdMWMGwyx+
         XaNI3B+VWASb2IMlw3LMZ+i/W+QrNPii8LyhQZaqIAef6cRZmToGuWfBYBpm8lLJHIbF
         PY+KKPHkloqHgJcsZjEm+IXFULVxNX375Ji8pSF4V61PZfxqA4Yzle76QZPfjqTkfpZW
         gTz27A7EVeEL40uSVYnlpnD2HW/nW6eoWE2/SBef9J1Qot4NRnw1qskMSvJ//7dqmZoW
         eIIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=+9kF3BwK6DeRh/C9kPPrBei5w9vxd3zQ1919JiZ7QQo=;
        b=lwo3+jA2X3u8gHvj3XBxKzwE+9wPL6hXXsDrxMJLjHE0+7IVZZKyV8c+kL39mNOfeJ
         dizgVVpcHiILL7dyqQPboTYOh2XSRMfQ3v4CENhteW+/h9f/fOJONkmd8+6wDmyj6O7O
         npOqULURaQeOjanMeVzBpkwk+uioemkbhYzmzAPCZ2ioUQ4VCHyHsco+KGHlJOkUJUfI
         9gF1juiWdM16TlrIaA6HClOynlIKTYxfZoz1/Oz0/utMcvBvpr7sgGUgi3eI3EF7rhF4
         bY0ZFhAwLgIkE6iCfsNbrSdCEOmuTOJqjefZOaSNiniHXyTXn9GzbB/14F8nYWAUSNA3
         D8tg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n132si2464648qka.278.2017.07.07.00.31.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Jul 2017 00:31:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54975 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dTNjw-0004FS-Sm
	for alex.bennee@linaro.org; Fri, 07 Jul 2017 03:31:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59296)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dTNjn-0004E1-Pi
	for qemu-arm@nongnu.org; Fri, 07 Jul 2017 03:31:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dTNji-0001WH-R6
	for qemu-arm@nongnu.org; Fri, 07 Jul 2017 03:31:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60962)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dTNji-0001Ve-HY; Fri, 07 Jul 2017 03:31:34 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4D1BA4DD49;
	Fri,  7 Jul 2017 07:31:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 4D1BA4DD49
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 4D1BA4DD49
Received: from localhost.localdomain (ovpn-116-31.ams2.redhat.com
	[10.36.116.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 20B545C311;
	Fri,  7 Jul 2017 07:31:23 +0000 (UTC)
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
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
	<c80977c4-1955-4e9d-3fc8-4d884562fd28@redhat.com>
	<HE1PR0401MB2556D19D91F25DCE96FE7B199AD40@HE1PR0401MB2556.eurprd04.prod.outlook.com>
	<8a7fb667-e6c0-2412-6dca-a8233dd27836@redhat.com>
	<HE1PR0401MB255696A487DFEB2B8972980F9AD40@HE1PR0401MB2556.eurprd04.prod.outlook.com>
	<e9ea564a-f02b-0ed5-e700-b7b1dfd89722@arm.com>
	<444508ab-3a69-6c12-cb72-42c0e20fb5d7@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <8ee34a60-6096-1988-c0f0-637aac5e8be2@redhat.com>
Date: Fri, 7 Jul 2017 09:31:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <444508ab-3a69-6c12-cb72-42c0e20fb5d7@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 07 Jul 2017 07:31:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
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
X-TUID: aHq9kGlPrlbA

Hi,

On 06/07/2017 23:11, Auger Eric wrote:
> Hello Bharat, Jean-Philippe,
> On 06/07/2017 12:02, Jean-Philippe Brucker wrote:
>> On 05/07/17 09:49, Bharat Bhushan wrote:>>> Also when setup msi-route
>> kvm_irqchip_add_msi_route() we needed to
>>>> provide the translated address.
>>>>> According to my understanding this is required because kernel does no go
>>>> through viommu translation when generating interrupt, no?
>>>>
>>>> yes this is needed when KVM MSI routes are set up, ie. along with GICV3 ITS.
>>>> With GICv2M, qemu direct gsi mapping is used and this is not needed.
>>>>
>>>> So I do not understand your previous sentence saying "MSI interrupts works
>>>> without any change".
>>>
>>> I have almost completed vfio integration with virtio-iommu and now testing the changes by assigning e1000 device to VM. For this I have changed virtio-iommu driver to use IOMMU_RESV_MSI rather than sw-msi and this does not need changed in vfio_get_addr()  and kvm_irqchip_add_msi_route()
>>
>> I understand you're reserving region 0x08000000-0x08100000 as
>> IOMMU_RESV_MSI instead of IOMMU_RESV_SW_MSI? I think this only works
>> because Qemu places the vgic in that area as well (in hw/arm/virt.c). It's
>> not a coincidence if the addresses are the same, because Eric chose them
>> for the Linux SMMU drivers and I copied them.
> 
> Yes I chose this region because it does not overlap with any guest RAM
> region
> 
>>
>> We can't rely on that behavior, though, it will break MSIs in emulated
>> devices. And if Qemu happens to move the MSI doorbell in future machine
>> revisions, then it would also break VFIO.
>>
>> Just for my own understanding -- what happens, I think, is that in Linux
>> iova_reserve_iommu_regions initially reserves the guest-physical doorbell
>> 0x08000000-0x08100000. Then much later, when the device driver requests an
>> MSI, the irqchip driver calls iommu_dma_map_msi_msg with the
>> guest-physical gicv2m address 0x08020000. The function finds the right
>> page in msi_page_list, which was added by cookie_init_hw_msi_region,
>> therefore bypassing the viommu and the GPA gets written in the MSI-X table.
> 
> I share Jean's understanding. To me using IOMMU_RESV_MSI in the
> virtio-iommu means this region is not translated by the IOMMU. as
> cookie_init_hw_msi_region() pre-allocates the msi_page array,
> iommu_dma_get_msi_page() does not do any IOMMU mapping.
> 
>>
>> If an emulated device such as virtio-net-pci were to generate an MSI, then
>> Qemu would attempt to access the doorbell written by Linux into the MSI-X
>> table, 0x08020000, and fault because that address wasn't mapped in the viommu.
> Yes so I am confused, how can it work with a virtio-net-pci or
> passthrough'ed e1000e device using MSIs?
>>
>> So for VFIO, you either need to translate the MSI-X entry using the
>> viommu,
> 
> For the vsmmuv3 I created a dedicated IOMMUNotifier to handle the fact
> the MSI doorbell is translated and MSI routes need to be updated. This
> seems to work.
> 
>  or just assume that the vaddr corresponds to the only MSI doorbell
>> accessible by this device (because how can we be certain that the guest
>> already mapped the doorbell before writing the entry?)
>>
>> For ARM machines it's probably best to stick with IOMMU_RESV_SW_MSI.
>> However, a nice way to use IOMMU_RESV_MSI would be for the virtio-iommu
>> device to advertise identity-mapped/reserved regions, and bypass
>> translation on these regions. Then the driver could reserve those with
>> IOMMU_RESV_MSI.
> 
> At least we may need to configure the virtio-iommu to either bypass MSIs
> (x86) or translate MSIs (ARM)?

Actually on x86 no MSI controller will attempt to map MSIs, as opposed
to ARM GICv2M & ITS. So the only problem exposing IOMMU_RESV_SW_MSI
regions is vfio_iommu_type1 will assess the IRQ assignment safety using
irq_domain_check_msi_remap() and not with the IOMMU IOMMU_CAP_INTR_REMAP
capability.

Thanks

Eric
>  For x86 we will need such a system, with an added IRQ
>> remapping feature.
> Meaning this must live along with vIR, is that what you mean? Also on
> ARM this must live with vITS anyway. This is an orthogonal feature, right?
> 
> Thanks
> 
> Eric
>>
>> Thanks,
>> Jean
>>
